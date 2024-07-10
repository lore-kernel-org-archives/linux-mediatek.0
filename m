Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FB4EC3DA45
	for <linux-mediatek@archiver.kernel.org>; Wed, 10 Jul 2024 12:03:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sLpi2Dp10gBJ/sXp5Br4LmsPwNth4eKV5Z3uC2rCs9g=; b=23jJaQMc/Tghp5u2yEBiqEKIff
	Ch4PLc3+jcX/pKZcDwrjIoYX4wV8TSsTbOCsHhXtHjvctdWXmlG3ATs+A8H3/fBwlKFTQENkqnudO
	ICtW3BgqWDG4h02lpiiYWV50PaK7FGepFO3J/jjguRFBIWCshYqQdNa4d95z7CGIfY2HFXGdMRpqk
	BlAtfWs0HZYfCDfgqiuwTQPAGGt/rhQKNQy/TKz/0ejd5T7lP0AhBUw16H4xTFa6TArDRh0AnlhwF
	TTAC6voQ2mtejo68s9EK/n2/CDz3Ie8gmaQ488et/0v3QeGqwyN64Qv1nyzBJRiJxxP0g5FUBuS/W
	larWYUUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRW2r-0000000ARXd-31Q4;
	Wed, 10 Jul 2024 12:03:37 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRW2b-0000000ARTf-0lyy;
	Wed, 10 Jul 2024 12:03:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1720613000;
	bh=d10p4L1E8b5F+cfdvkoHTqHYhe1n5q2q3q5jflV+NUM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=da2E35dnLoh/D6dncK1MOF659gZtixJOF0zKQXs15kwnIAwifk87M+GGNp0+tRffN
	 5rM5if0iTQZliIkZtLvmOzdGsbFDJBc798BJQv69hR3+Sa6czLdoXI5a+Kkp97GM4p
	 O7kR30z3aBI8gUoHJGvFgCy8hW3/SD7MSU+HJ3uXYUBsbsHyPO8iEG50wtzXTFZHbK
	 EMaNl/JPj+WIzvVVoXjYeLfj3P5+6OI9AZR4oxr9wfbx8upkikGC5ebl2wVzTvtr9T
	 ti8AkJP0ljmzXr3OgX1wbEeZ5pxQIFRXx0TqJMycKxma+LXE7W3FHT5Za3UySyQCB3
	 9NJAij73ezv7w==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 541F53781185;
	Wed, 10 Jul 2024 12:03:19 +0000 (UTC)
Message-ID: <147231f5-7732-4400-9feb-f563c07dbc91@collabora.com>
Date: Wed, 10 Jul 2024 14:03:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/5] drm/mediatek: Support "Pre-multiplied" blending in
 Mixer
To: shawn.sung@mediatek.com, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Hsiao Chien Sung <shawn.sung@mediatek.corp-partner.google.com>
References: <20240710-alpha-blending-v3-0-289c187f9c6f@mediatek.com>
 <20240710-alpha-blending-v3-4-289c187f9c6f@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240710-alpha-blending-v3-4-289c187f9c6f@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240710_050321_388778_F3E5E509 
X-CRM114-Status: UNSURE (   8.58  )
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

Il 10/07/24 10:52, Hsiao Chien Sung via B4 Relay ha scritto:
> From: Hsiao Chien Sung <shawn.sung@mediatek.com>
> 
> Support "Pre-multiplied" alpha blending mode in Mixer.
> Before this patch, only the coverage mode is supported.
> 
> To replace the default setting that is set in mtk_ethdr_config(),
> we change mtk_ddp_write_mask() to mtk_ddp_write(), and this change will
> also reset the NON_PREMULTI_SOURCE bit that was assigned in
> mtk_ethdr_config(). Therefore, we must still set NON_PREMULTI_SOURCE bit
> if the blend mode is not DRM_MODE_BLEND_PREMULTI.
> 
> Signed-off-by: Hsiao Chien Sung <shawn.sung@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



