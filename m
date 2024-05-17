Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8637C25B77
	for <linux-mediatek@archiver.kernel.org>; Fri, 17 May 2024 13:12:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eJUIq+rhT4qDMjtjV54rsFO0Tt8bY/FoL2hKsdR2NYA=; b=Z3cc/GBXN8BizLrDM+vwephHBD
	yKuluEQrhD6M7G2Hjhob9kNxfpn/dcN32XxMXAFh+USU0ZJBBzZNhjZTpT62oFmoyVT5rQpyObcJH
	jR1MpcNGFuH/srhHRBjyDVC/t4+ujMvwb9xPSQCwHrlOFDuH0QQS2hfwU0htO6hifWE55LjIyQm5O
	qqpu4yDAvANJgXB2JfQMRwJLlgq1Lek13IonnTt42F0DhpXE9dvPtQbYVWyuNlps/QCTASsxnJ8ZV
	ZiVmqdLgjDifvrONMdMZiFeJucaPHYFumxjUq6GrKh48KU3/+zLHAf5PUi/xL5urOWeenUIyH00ZG
	9/YgVE1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7xO6-00000007uSp-3Div;
	Fri, 17 May 2024 13:12:42 +0000
Received: from mgamail.intel.com ([192.198.163.13])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7xO2-00000007uRM-1eq6;
	Fri, 17 May 2024 13:12:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715951558; x=1747487558;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=l0WqPcqTQgVaAzmNxD6JX2r5Eh/yljNSAf1J/7nvt1I=;
  b=m6sqsZTX+7BqR/+uM0+WrfxAVe+rC42rJ7AB93JadIt8OuI9scufg5p9
   saXylz22XA7nPq/0saV2z6mA0A24ccrThftBC1ZUc2V0nua+zU9z1ezZA
   euQINSf1UZeQDlrSPNLeyLQLmKBhFeZInRNPJisvAf5UVQbq6bwpoq3Z6
   3Nn5hKh0KMIfvsDxAkDzuiGFyyUH1SBbmyr2x4hX/+6a/H5yvp/9DoN/F
   r0/aDu/AA13+4CvvaIcdvV+xxsD8JPi+N/yacucOESV6/T6qc0oi743RI
   0E7G82xiwZlVVS5tfrIIVPgPRmP/XlAp+adaULatHC4Q8KNUGlt8L+fEU
   Q==;
X-CSE-ConnectionGUID: 3VC//pfQTlWiLCPMkjoFDw==
X-CSE-MsgGUID: +GscSFYiRUqFoLylZo1DWw==
X-IronPort-AV: E=McAfee;i="6600,9927,11074"; a="15075814"
X-IronPort-AV: E=Sophos;i="6.08,167,1712646000"; 
   d="scan'208";a="15075814"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 May 2024 06:12:34 -0700
X-CSE-ConnectionGUID: IVmxoqt/SgKVr9xBIY97ow==
X-CSE-MsgGUID: uaZ5srhxQQWZcqEpN/Om1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,167,1712646000"; 
   d="scan'208";a="31778077"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.246.32])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 May 2024 06:12:30 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Michael Walle <mwalle@kernel.org>, Chun-Kuang Hu
 <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, David
 Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Matthias
 Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Michael Walle <mwalle@kernel.org>
Subject: Re: [PATCH] drm/mediatek/dp: fix spurious kfree()
In-Reply-To: <20240517093024.1702750-1-mwalle@kernel.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240517093024.1702750-1-mwalle@kernel.org>
Date: Fri, 17 May 2024 16:12:25 +0300
Message-ID: <87v83ca8g6.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240517_061238_503038_1095CD79 
X-CRM114-Status: GOOD (  15.61  )
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

On Fri, 17 May 2024, Michael Walle <mwalle@kernel.org> wrote:
> drm_edid_to_sad() might return an error or just zero. If that is the
> case, we must not free the SADs because there was no allocation in
> the first place.
>
> Fixes: dab12fa8d2bd ("drm/mediatek/dp: fix memory leak on ->get_edid callback audio detection")
> Signed-off-by: Michael Walle <mwalle@kernel.org>
> ---
>  drivers/gpu/drm/mediatek/mtk_dp.c | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_dp.c b/drivers/gpu/drm/mediatek/mtk_dp.c
> index 536366956447..ada12927bbac 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dp.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dp.c
> @@ -2073,9 +2073,15 @@ static const struct drm_edid *mtk_dp_edid_read(struct drm_bridge *bridge,
>  		 */
>  		const struct edid *edid = drm_edid_raw(drm_edid);
>  		struct cea_sad *sads;

I suppose I would've just initialized sads = NULL; and be done with it.

But *shrug*.

Reviewed-by: Jani Nikula <jani.nikula@intel.com>


> +		int ret;
>  
> -		audio_caps->sad_count = drm_edid_to_sad(edid, &sads);
> -		kfree(sads);
> +		ret = drm_edid_to_sad(edid, &sads);
> +		/* Ignore any errors */
> +		if (ret < 0)
> +			ret = 0;
> +		if (ret)
> +			kfree(sads);
> +		audio_caps->sad_count = ret;
>  
>  		/*
>  		 * FIXME: This should use connector->display_info.has_audio from

-- 
Jani Nikula, Intel

