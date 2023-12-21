Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B55C8C35274
	for <linux-mediatek@archiver.kernel.org>; Thu, 21 Dec 2023 11:43:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5ckfHbZJFmTEToWPxrYdh/ObQfZICtz/wROl02i/yIA=; b=3MDcP7EooGicQ8GYgYnKmcJbLQ
	NndZTRGmjv1LN+G+CchvzaTyvJI096ar5n/FoxVDh3S7XUF/HUjlqYqIq05gsy89UbxHY4tVxIRQH
	+CrHs+ymCDipqIDm8JO+PlSlH5VzsDdpG6196K2GFMJl7M7Y+guvnDvJrCUbjTItUGoHfRUM6PQGH
	1U2JvGIzHHed/ipVqlwVDNCqkxInapjZRxKgwdsSIMy8nWEkzt+Q0xyAQTCXb/1ueksX3bWhmRqlp
	/CBBtbXcNXAA83fkIowUQYBMo12FtXMSR51prTgFA40Qfcv44o7CMN7neaLFF9Y6Uq4VPzOlo28k3
	TpnQgQjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rGHST-002bFD-2T;
	Thu, 21 Dec 2023 11:43:21 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rGHSK-002bBd-0O;
	Thu, 21 Dec 2023 11:43:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1703158989;
	bh=sBcVhTPX0KzScwCba4WSn6p7nU4vpZvw5YuVMBcWBiI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=p0qj3aYadHaObYFgJ2vmkd7YL0aKtYQn2VGHuLDLMP4mDbmINeIPiy6mK5vCbP+BY
	 up+B1qook3kf5upNHyLxnVxl3sGgCsL6XnwFrfrk2252JvuYfRqtTr1YTzxzNvfH/F
	 Ie2zci91+urTkSa/yIttc6HEDUQwU+mL2C49m2z6JzAxxEF4XWK59FymGvOgsZD1ax
	 nmEmBZL0IiULWlC9gcH5is/mzRk/orFlm5eQc8N9IU4mxieYw6iXzplTbxtDq5D6ME
	 CnJGLUES6MSBM20ns5PGXdkHfcfT8NyuRL/Dgwm13CRannr33c/lrLYqC8lcxwybcu
	 DOw+IWzDDd0TA==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 5EF593781FFE;
	Thu, 21 Dec 2023 11:43:08 +0000 (UTC)
Message-ID: <d962815b-087d-4851-b6f0-981531149be9@collabora.com>
Date: Thu, 21 Dec 2023 12:43:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] media: mediatek: vcodec: Only free buffer VA that
 is not NULL
Content-Language: en-US
To: Fei Shao <fshao@chromium.org>, Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 Tiffany Lin <tiffany.lin@mediatek.com>,
 Xiaoyong Lu <xiaoyong.lu@mediatek.com>,
 Yunfei Dong <yunfei.dong@mediatek.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-mediatek@lists.infradead.org
References: <20231221092226.1395427-1-fshao@chromium.org>
 <20231221092226.1395427-4-fshao@chromium.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20231221092226.1395427-4-fshao@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231221_034312_304977_74837ECC 
X-CRM114-Status: UNSURE (   8.94  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 21/12/23 10:17, Fei Shao ha scritto:
> In the MediaTek vcodec driver, while mtk_vcodec_mem_free() is mostly
> called only when the buffer to free exists, there are some instances
> that didn't do the check and triggered warnings in practice.
> 
> We believe those checks were forgotten unintentionally. Add the checks
> back to fix the warnings.
> 
> Signed-off-by: Fei Shao <fshao@chromium.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



