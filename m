Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8197C433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 May 2022 12:32:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qBgcH0IZyoiCWT956oISc7V7bM1BQxQ8gSFQGOQOk4U=; b=ZdL3GCRoGCXRQG
	A1cB12GAi35TWZ/uZF5yAxNjxbAjDQkpzsQWjJ1bxKs5zknwKg3RJKrh08+hSfD81R3uSC1VGfLas
	hqUceOWejfnP7lDBvYDTZogLfqS3wP+hJNKCo5QwuP3aG6FaNjIJjBVn8LvxN6rvFCMLXr1OTdiKp
	nBq4/Jzvrc77GRfKFENGPCMoBFVFXNGxWDDCM0vaGqLGXhzUM67P8BUlmyLwwlU14zx8C2o8qXg+q
	bYKOhq6MhYaCGzdboS+2D5uwlyU52YIYNuql6ubYWTW2XlpEHmdQ4xBPOtGc7kxbzs1fM5jB50aVL
	isaK3HV3Eu64UnsUh8sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ntqBW-00B6O6-K3; Wed, 25 May 2022 12:32:18 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ntqBL-00B6KG-Nb; Wed, 25 May 2022 12:32:09 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(Authenticated sender: kholk11)
	with ESMTPSA id AC9251F44DDB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1653481926;
	bh=KKdgy9/aog9w2qO3pPEy2MN18u1D22mqf36NY6y+1tQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=N3AXUqtBIPjyyZiUQSQ3UKLRlNb1+ta9KrXc3ZG5Pj2NXlpsWDh57ypRCyxBT9ZHt
	 8Bk5ZDFmS7Wlu9Yf4E7SAhE/+czJouD42S8MzxON0JFQw954iX+y18oQeLPOB9n+Xu
	 kGcg+Y2mUIiRDuPI8xlMDbjR6V2OI3pntHYGkwQCa2LiTWTejpzmAVPuyBZPnkfNj7
	 bETGwxcd3g0w3tJ4jX8eio3c/x7dkyDWOaD8VRTMDifDMavcJzxjulfhzDxRAB/JcE
	 DsboFWBlIzQ2szds3t70nWQWCl7aZX2rA0GynN0DWgIEJ2J/f09+qJX81KbOXspld0
	 pXPHxXGdKDUZw==
Message-ID: <7ae7e42c-9225-2ff2-f167-8235ab4cadc3@collabora.com>
Date: Wed, 25 May 2022 14:32:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v10 05/21] video/hdmi: Add audio_infoframe packing for DP
Content-Language: en-US
To: Guillaume Ranquet <granquet@baylibre.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Kishon Vijay Abraham I <kishon@ti.com>, Vinod Koul <vkoul@kernel.org>,
 Helge Deller <deller@gmx.de>, CK Hu <ck.hu@mediatek.com>,
 Jitao shi <jitao.shi@mediatek.com>
Cc: Markus Schneider-Pargmann <msp@baylibre.com>,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org,
 linux-fbdev@vger.kernel.org
References: <20220523104758.29531-1-granquet@baylibre.com>
 <20220523104758.29531-6-granquet@baylibre.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220523104758.29531-6-granquet@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220525_053207_964997_73035D33 
X-CRM114-Status: GOOD (  14.94  )
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

Il 23/05/22 12:47, Guillaume Ranquet ha scritto:
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
> Also constify the frame parameter in hdmi_audio_infoframe_check() as
> it is passed to hdmi_audio_infoframe_check_only() which expects a const.
> 
> Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
> Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
> ---
>   drivers/video/hdmi.c           | 82 ++++++++++++++++++++++++++--------
>   include/drm/dp/drm_dp_helper.h |  2 +

this has been moved... again... this time it's include/drm/display/drm_dp_helper.h

>   include/linux/hdmi.h           |  7 ++-
>   3 files changed, 71 insertions(+), 20 deletions(-)
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
