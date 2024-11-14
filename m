Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3773CD65C70
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 Nov 2024 11:09:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DZ4ONTU/QZoAOGbuMsatt8bZXE9spzg4BRW64td1C2M=; b=GhF3pCUN02Y+fE+EfQN0lAkcMi
	R8ldzwRd2XJ+B7V4JhdNhub5FE4k5QqtcjMV5Xm0dl8q9Y9SLtPXLhooS99zGidy4FPgGZnNNwvwN
	JsZZ1+5SZ+ztzQPLlq1TiaaGHYYv4MMMwcL+Kl2O95rj6+8g3d662vWuOoZU2Iw6uFTnM53qWIH4d
	pw1sOjM2t0WDzmQdmlKdTcqIvL3NTqfc+srOyKRDBxeF+ZgYbSqb2R+E56IgPAMxJnuOFyANsRE4k
	5yclR/StEaiXf88KRSuQu8C33O9JTGHSvF8eGhd8hw5frZmIqF2CIK3vr6hrPqhITdEPD+6nlyJc7
	g4vIXMZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBXjB-00000009fSB-0Dhl;
	Thu, 14 Nov 2024 11:09:33 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBWsd-00000009Uvv-0jVg;
	Thu, 14 Nov 2024 10:15:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1731579313;
	bh=fSXonh2bDf7oFUVS2uwT+cdcVaiCDzYitCPAIxm8xEE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=nNOouaBVqt+j+xRhfMtlmeG0l8smDiW1glQwZhrcKIs/vAJNz2W/2zqXO9CAWR/AB
	 yNmqkjTqEIVbAZ8GW4pRIunstlhkTTDEUsAUvaOSsvZGyXu4NetmrBxRTl09q53rR4
	 pQT0uRsbWTt8oYe5CQZcIcQv8SAwH+m8MP3xBoRKECGDZW4/5ZNGcFQm3vVPRZqvDU
	 YIZUsoE6DkHQpC1rPG+4QkrEY8gpbEXiYJcM7xYyoBCJ37xF076e/5EpwCLmSkWkkB
	 z6jOuja1JDAeQ9XORteumc6uFmOH98bG3rwNQGtN13SdrXcRUUflVGUyWrGrmRmUW1
	 mDvdhCEVjVFNA==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 1CF8A17E35E3;
	Thu, 14 Nov 2024 11:15:13 +0100 (CET)
Message-ID: <3c630ce7-9ae7-469c-aacc-f441c32aedb9@collabora.com>
Date: Thu, 14 Nov 2024 11:15:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/3] media: mediatek: vcodec: remove vsi operation in
 common interface
To: Yunfei Dong <yunfei.dong@mediatek.com>,
 =?UTF-8?Q?N=C3=ADcolas_F_=2E_R_=2E_A_=2E_Prado?= <nfraprado@collabora.com>,
 Sebastian Fricke <sebastian.fricke@collabora.com>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Nathan Hebert <nhebert@chromium.org>
Cc: Hsin-Yi Wang <hsinyi@chromium.org>, Chen-Yu Tsai <wenst@chromium.org>,
 Fritz Koenig <frkoenig@chromium.org>, Daniel Vetter <daniel@ffwll.ch>,
 Steve Cho <stevecho@chromium.org>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20241108034019.20064-1-yunfei.dong@mediatek.com>
 <20241108034019.20064-2-yunfei.dong@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20241108034019.20064-2-yunfei.dong@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241114_021515_409230_C6C5A236 
X-CRM114-Status: UNSURE (   7.36  )
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

Il 08/11/24 04:40, Yunfei Dong ha scritto:
> Extend struct video shared information (vsi) to send different
> parameters to scp for mt8188 architecture is changed.
> Remove vsi related operation in common interface to make sure the
> interface can be called by extended and non extended architecture
> at the same time. The new extended interfaces with new vsi will
> be introduced in later patches.
> 
> Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
> Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



