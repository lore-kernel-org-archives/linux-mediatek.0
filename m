Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43858C46CD2
	for <linux-mediatek@archiver.kernel.org>; Tue,  2 Jan 2024 14:14:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m2dB5O8ONpLo7q9LhBZQ0+wZKWw0XZmIJQroU++bkLY=; b=IcG4XawqgSaZaCr5npTiFMeD66
	s/X7Pv0pn72a3JuyZf75kvfA85R0eg05ZeRcLQJaDPZZ9VB6Ui3NL9zYTbMYmUES+X3k7jR0leMTw
	nX6P4bZUm7gVaw1OgDMfGuEjoy+CBg/5hfiDfMsdDx/f95saJwBo/6sVynGw4IU8Q9/FEr2bbyBlq
	Z1mCzRYwzJLPM02mffs3z2xMV19gF8DKZCO3VUekB+ZqYxkB0A4Aw242tUtKsptnDsj99RrDfJljn
	0CGCqqKAMx/oc7o2jPnVS9vL0jp4ikmdt0u/e1m/DcgwE0TO1+IzcN38iW4vu7dLB37rm3uQeOmkL
	xm+yy9Vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rKfWr-008CpV-0X;
	Tue, 02 Jan 2024 14:14:01 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rKfWn-008Cot-2k;
	Tue, 02 Jan 2024 14:13:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1704204832;
	bh=TNz2bBbjdA8ttdYkWZtPUW/GO/y4iF7ensfXnYtQXew=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=cBYrHOUtswoP4Jqju05wwfV4ZlcVuMtYSMafpUEfTvPis0o9a3XR64npMCLCQ/Zz+
	 NwrOPQ3bsW+l08qfZj3Hb/0Js697WCWxJoJNaok25S7VddTatB4MXU7F6In81wkesY
	 eSMXKsC06dZ3gxX18KbaE8aQZ+CcsM+uezBsX7Iw7KPhuArNL18iMq7p7FH3x1r4dw
	 fRK2VIDxhVrImFZZL9j/3TkgjbxkSoCc0o2JNAXEQbJSgkZjGE/TEX3uPA4XHp9kAj
	 KDV0OVWHcu9SupmQ73mQ03uEAogjQS60N0LinimJIgkT+XAYAFpU8LVaFA4E4DKmcn
	 Gol2qlV9XAyJQ==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id AD3E13781FDF;
	Tue,  2 Jan 2024 14:13:51 +0000 (UTC)
Message-ID: <2c90633c-8d28-41e6-8c47-c58e1f1c3276@collabora.com>
Date: Tue, 2 Jan 2024 15:13:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] arm64: dts: mediatek: mt8186: Add jpgenc node
Content-Language: en-US
To: Eugen Hristev <eugen.hristev@collabora.com>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org,
 bin.liu@mediatek.com
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 kernel@collabora.com, matthias.bgg@gmail.com,
 Allen-KH Cheng <allen-kh.cheng@mediatek.com>,
 Hsin-Yi Wang <hsinyi@chromium.org>, Max Staudt <mstaudt@chromium.org>,
 Ricardo Ribalda <ribalda@chromium.org>
References: <20240102103801.268647-1-eugen.hristev@collabora.com>
 <20240102103801.268647-2-eugen.hristev@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20240102103801.268647-2-eugen.hristev@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240102_061358_088569_C2F45C5D 
X-CRM114-Status: UNSURE (   6.15  )
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

Il 02/01/24 11:38, Eugen Hristev ha scritto:
> From: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
> 
> Add JPEG encoder node.
> 
> Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
> Reviewed-by: Hsin-Yi Wang <hsinyi@chromium.org>
> Reviewed-by: Max Staudt <mstaudt@chromium.org>
> Tested-by: Max Staudt <mstaudt@chromium.org>
> Reviewed-by: Ricardo Ribalda <ribalda@chromium.org>
> [eugen.hristev@collabora.com: minor cleanup]
> Signed-off-by: Eugen Hristev <eugen.hristev@collabora.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



