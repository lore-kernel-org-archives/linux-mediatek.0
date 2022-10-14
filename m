Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86611C4332F
	for <linux-mediatek@archiver.kernel.org>; Fri, 14 Oct 2022 07:46:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BRcJjhujB1sa+wYfup2/ix39FF/6Mwy0ySx8HpcSo08=; b=VpdFoHqG8Q24O5XgY4eE2pqpp3
	AYPhw+zdk5itEQfYvY4ihDA7jLFmHkG9Lje6FfSdEHkMxBSV7gZ31dAuje3xaoJYT5W1akh2T+liw
	lV6MmlJ0TsWnUbqv1/CdG6uGnP2Imuqok6XX0Ip/7MFbJrrtyRzqFobTWdpj5kAe7HacUIvDMx1kg
	LwMYIM3e4to7dwMUS6X5snQ7oW0Q4Hpkz93QMEw0EF/8ToRuaqs9VDy0N0voNB6atGKI+cRPieGTG
	RX+KoR/V4vr39kzrB1CDg++xowjhaVQXEWDdG6Mv0cbP5atSOWxE4Ezi+4T1SICOJtrPjuGsmGnKr
	e6dWuWDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ojFOs-00DwmV-MX; Fri, 14 Oct 2022 07:46:34 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ojFOp-00Dwlc-VA
	for linux-mediatek@lists.infradead.org; Fri, 14 Oct 2022 07:46:33 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 716326602329;
	Fri, 14 Oct 2022 08:46:29 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1665733590;
	bh=Ie8n8azEe/zRMQeb35yxJBatp70DLtiAWtHsYslKQRs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Z6utxoiC6ugvWq6s7NFir29tiytZyGOmJ6Ikd0hccyb5gAdFaED9rRWcalxExGcKu
	 Sp+9PVpw/0DlDV+uFxRpH3nn8QHGPIYyPj5orluHDXl7oIt2+XdUao7hQ6SyKp9gKn
	 ricQerJkCCBwWPRGl3civp5+v9PL6NrSaFG3PsVK4+fp7e10cThsyb535tYwRhuRjD
	 eOjQHHA6hqtlGNxckdrYMwW7jRoThwVGF99vDqtRXMfz7Dotrv0Gn0y1Sp/OcB6l1v
	 X2cEPH38DxOgpz/TP5YWAKftZyA8c+Gwhad86suqEHuhrcDdkXWLxpBzgBwSKuyMM5
	 E6DmRF+C1vPqQ==
Message-ID: <5723fa3f-033b-07f6-6774-cd5df97d5cbb@collabora.com>
Date: Fri, 14 Oct 2022 09:46:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH v4] drm/mediatek: Add AFBC support to Mediatek DRM driver
Content-Language: en-US
To: Justin Green <greenjustin@chromium.org>, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org
Cc: jason-jh.lin@mediatek.com, justin.yeh@mediatek.com, wenst@chromium.org,
 chunkuang.hu@kernel.org, p.zabel@pengutronix.de, airlied@linux.ie,
 matthias.bgg@gmail.com, daniel@ffwll.ch, daniel@fooishbar.org
References: <20221013193148.2027842-1-greenjustin@chromium.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20221013193148.2027842-1-greenjustin@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221014_004632_164015_B5AD0582 
X-CRM114-Status: UNSURE (   9.07  )
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

Il 13/10/22 21:31, Justin Green ha scritto:
> Tested on MT8195 and confirmed both correct video output and improved DRAM
> bandwidth performance.
> 
> v4:
> * Move modifier validation to format_mod_supported function.
> * Add modifiers to drm_universal_plane_init() call.
> * Make comparisons to DRM_FORMAT_MOD_LINEAR explicit rather than relying on
>    DRM_FORMAT_LINEAR being equal to 0.
> * Gate AFBC control bit writes on device compatibility.
> 
> v3:
> * Replaced pitch bitshift math with union based approach.
> * Refactored overlay register writes to shared code between non-AFBC and
>    AFBC.
> * Minor code cleanups.
> 
> v2:
> * Marked mtk_ovl_set_afbc as static.
> * Reflowed some lines to fit column limit.
> 
> Signed-off-by: Justin Green <greenjustin@chromium.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



