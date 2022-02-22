Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFC37C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Feb 2022 15:24:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=njtaHCgdIGk6+N5aVY49YxTVRbq5sXPNF0oBfaeurxU=; b=48Gd2qaVhiv7+0
	7IdxizKFkpnnPdCweZV/jUp8rID648llrQKWbbZJGho/TDxL0eCAl8TvRFkAxZmkKZk69wHqIS+3m
	yHpjJXbbpKlaDZF/jfjs3uUOfGBba+DFR6v9cST4/GYadvSdD0kkjjalw6BHcItTpiW5/6HqlKMH9
	npL/+CsZY2Pul/6ubHeS5HfA5lSuZkcfu3Y36SU0qZflVJBJzk9tvPnEIzaySaFCS/7oYDJGjj18u
	PJ/53JqsrcnbE+wLRfZEQzWp5gzCxPxmS+9cwrweJ6s6SxXs1PyiT47hZEKG6EDi+swJIDiUxVG9X
	MANFvfNaWEXEJmSBE2YA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nMX1T-00AC9U-PI; Tue, 22 Feb 2022 15:24:15 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nMWuN-00A8jS-Vi; Tue, 22 Feb 2022 15:16:58 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 1402E1F42D79
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1645543012;
 bh=m6iks4nKShpjnvSQCg9oNY965h9zeoboZznnHfhpxKI=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=hWvPkhkzNvqzNuA/40T3XKUxHYa8HSRU4pVMNzoIFWC7rXAT0apDYLnpkMJhnqbJM
 arssexAyQVcSVzvw5Amf+UBgH8G+8JAoeSIFcUxhxPNyzQMNZV+16CstcTP/iDH5Hg
 8XKAw2ROpBcy+hVlpJZNGroDpoRV/m8w9fVh/Yl0wVhuV6RPtUoYvkLuG/iZUukwGC
 bAX9ZZ15SJkfiUYauqLfQv5HFCFnR47Rx3FLe1eOLehFQPIJKIeNvBPRO6NReiqME2
 u+ne7v0rhJH3lU010TKtdqa7o08BP9WgUrRIeePPFQWufHuOtvUjuDVVM8Ex9z5m24
 I22HEnZSbhtaw==
Message-ID: <1c791b60-935c-1e8e-dd1b-4b18fc273c1b@collabora.com>
Date: Tue, 22 Feb 2022 16:16:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH v8 04/19] video/hdmi: Add audio_infoframe packing for DP
Content-Language: en-US
To: Guillaume Ranquet <granquet@baylibre.com>, chunkuang.hu@kernel.org,
 p.zabel@pengutronix.de, airlied@linux.ie, daniel@ffwll.ch,
 robh+dt@kernel.org, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, matthias.bgg@gmail.com, chunfeng.yun@mediatek.com,
 kishon@ti.com, vkoul@kernel.org, deller@gmx.de, ck.hu@mediatek.com,
 jitao.shi@mediatek.com
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org,
 linux-fbdev@vger.kernel.org, Markus Schneider-Pargmann <msp@baylibre.com>
References: <20220218145437.18563-1-granquet@baylibre.com>
 <20220218145437.18563-5-granquet@baylibre.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220218145437.18563-5-granquet@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220222_071656_275219_4E75FA77 
X-CRM114-Status: GOOD (  13.32  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 18/02/22 15:54, Guillaume Ranquet ha scritto:
> From: Markus Schneider-Pargmann <msp@baylibre.com>
> 
> Similar to HDMI, DP uses audio infoframes as well which are structured
> very similar to the HDMI ones.
> 
> This patch adds a helper function to pack the HDMI audio infoframe for
> DP, called hdmi_audio_infoframe_pack_for_dp().
> hdmi_audio_infoframe_pack_only() is split into two parts. One of them
> packs the payload only and can be used for HDMI and DP.
> 
> Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
> Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>

Hello Guillaume,

I've just noticed that this patch will not apply against the latest linux-next,
as the include/drm/drm_dp_helper.h header was moved to
include/drm/dp/drm_dp_helper.h

Can you please rebase for v9?

Thanks,
Angelo

> ---
>   drivers/video/hdmi.c        | 83 ++++++++++++++++++++++++++++---------
>   include/drm/drm_dp_helper.h |  2 +
>   include/linux/hdmi.h        |  7 +++-
>   3 files changed, 72 insertions(+), 20 deletions(-)
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
