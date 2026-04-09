Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0581AF364C0
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Apr 2026 21:53:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hu81u8EXPjFrB34GvSJW9iQwsEy8qvlO31eh+EE0xPg=; b=wy7zArSofEMJhW6nu/qsO0tUkY
	e7zl/66VLpPWkE113XWoriuusqguE2Uee/lSgyLP+gPcevvGpvwIZI9rggwohckn4clE6FDNBZ8V2
	eUkf9n4bLlpGLt8YX64XCyINWSfpedoV6IGq5jJaCuUj3jDJRkA+pEaXUEzLLfTXd4sZLkz7T1VaT
	AceXcDEjJgsB+TeadF9qr/fZQ6FZsWCzI4jSGgrwBD+sc+d4ZdepOhMORrjlg4ywGamYmYb+RzuyP
	PwX4saXVDo9Y45wesQ9iQiCqCyO/XUkZWG0qQMNXhXi+R+jr2MegXvaiRyNw5Nlq/4mY3LIuZRxLk
	AyR7vS8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAxJQ-0000000BFmJ-0GCR;
	Thu, 09 Apr 2026 21:53:20 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAxJL-0000000BFkM-3kRT
	for linux-mediatek@lists.infradead.org;
	Thu, 09 Apr 2026 21:53:19 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 639DdKEK2812069
	for <linux-mediatek@lists.infradead.org>; Thu, 9 Apr 2026 21:53:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=hu81u8EXPjFrB34GvSJW9iQw
	sEy8qvlO31eh+EE0xPg=; b=GmT673w0E/j1Q74yC99wb3ajRMSsRLbCbIHUvSVP
	uamrDGeWDu5NNk7G6tKX8jeB37nxu/H/C06C/S4yCJruDmrKx+ZLLLzPg3mclIP6
	mSJmy3eZbHxVhMTwbP7fc/ATus+LU4btxJZkNij0IJGfTBasR8eTPtdAYkhavNPk
	uRKgkE5/rQgpoYqNzOSkZrgr4DDhAZjoJYhMnELo5gQPSmcJA20p5gYGBIOs/rjO
	DxahXh/NChmF8HdNyZIHzJDRHWzU05YKF8KSlIsWptwTNibxjz92qddG+8mnXzev
	ypT8gPTdbW/WfZSg6miimVwvQCD63qVuSXz0MZsGx0OBcg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ded6h9mee-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mediatek@lists.infradead.org>; Thu, 09 Apr 2026 21:53:15 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50d812c898cso39254691cf.1
        for <linux-mediatek@lists.infradead.org>; Thu, 09 Apr 2026 14:53:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775771594; x=1776376394; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hu81u8EXPjFrB34GvSJW9iQwsEy8qvlO31eh+EE0xPg=;
        b=Tl3oeSlhmTg7Sm9NSojnHbJjxjuYJD0Cc0EI6/Y2bg0lybLTymm8ZSo+D5LrKQKvFa
         JXAMW6/WDhXh5KzfRh0sVPJJ5gkTn5N9CoItPeykFATWZGyDEsQELmF1Jp6WFTm2cgGh
         YJwNOsE5Qhn7dly/O2Wnkil/eDNsgMJ1Kvgjng3HdnWg/RtdEpldWW0Us8EVoR6zGJgH
         /Yt9yHcPbhh6BzQBgMyFPlpmCEqCB3eQXYjb3R7ik8bViRTzFL9B2wnKZFK/ZnQT4BUl
         qBlzu6LRqlDsXXP3PZUG4APvYyB+fHp2FWMZ9fnun3U3HPqVuAuKMhDEt2mtphjG1Q7U
         KrTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775771594; x=1776376394;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hu81u8EXPjFrB34GvSJW9iQwsEy8qvlO31eh+EE0xPg=;
        b=ZjUBaQVOFwdrjVOVMxbWse17QwiyhnQtGrUykHd/vfOPjMG4UOX4W+cPmNpvGig0Eu
         a+hx5F1rIIQ3KisEOyPBpju5AbIQ4Zb2TSG7C9LxE7x2V2Zsmn2rnvwB0RsOEMLlUYif
         ycu06XDhpg9prKcBhhQl6CMcHh8bRj8PsZGHRkg0u8J0eT2sM1PPME7tFl+woDonC4he
         r5BP2sBUpA//IgD+kHnHN3MIph5MVBrZbUmephzOMcsAccR7qqzGMih549cZvThq6vVp
         8OifaQ1H3+xDn3mMKXM0l6vKnn+/+r3xvVV5opgoSIdRxGzf6/GHcf7HylJrCYtIFcYk
         tMLw==
X-Forwarded-Encrypted: i=1; AJvYcCUcNGab4cF+B6WbVa1BuQ43DS2jWvhCyKxo5Nx8aa8CJW/BBhaCEwOsvWhKsCnrj9IcC6JUvY6sG3v4lWaZtg==@lists.infradead.org
X-Gm-Message-State: AOJu0YzEWgiIwIEVA76qAcckK42u4MiwsddTmmoDBV/B66GO1m6778qe
	bWHVTRbTIBCHhcNooakXoAJ0Oq0190TJKo/2CYsdtGJu1nH7jLAhG/MXcz+UPzzKo7vjiOhDPVG
	OBSDAcLwbrJoKYKQXCUvvWfZssSC5O3qmVvJzWE2rbCbeZz0L2R/AltoObtSxb9WwcoFpUKsn65
	M=
X-Gm-Gg: AeBDievRYnEBqVKIXvvxscvCAA6nySv2ADR+n8hItrG8XHt1+eP8aMLj7lvf9ajQR5F
	W+kKbcPrAwqKP/adzhZLKuTLP3C9AprghqA1gDDLpPY6iUayCPlaPDqotS7dLwZXNpusyohgNFp
	KzfAKoUaXv78kRxtWrFfiuUuCVuCKcLT+YOoOyDFHD1NClwE1adTZ9iRH1BWo/+SMwpxLIe8Cze
	BWeTb9eYlLMhpB3QaeTpB4zTSPTYQrzpZNshY20QIsh/IqYk4kKfna6Vt8tq3YQcUVLeQaUKBtW
	v5/dK1p07Ryj9H3trKNym7xXQuV7kZUGEMxpP8CIokj/pCE9EIitcEZSNdzexlJnkWdxlqeuPjx
	NpSmRgOLMA2NPuvQM1+kXw0ipaLsoIv3/wYOyuam7Gxk6lxGVbk94A/0yxI/Am4nkyUsHFACvCE
	Q54r6ohqlH5NjW2G62bmcq6/iHWbj53eYWYkc=
X-Received: by 2002:a05:622a:9:b0:50d:7b0c:35de with SMTP id d75a77b69052e-50dd5c74756mr15755551cf.44.1775771593987;
        Thu, 09 Apr 2026 14:53:13 -0700 (PDT)
X-Received: by 2002:a05:622a:9:b0:50d:7b0c:35de with SMTP id d75a77b69052e-50dd5c74756mr15755051cf.44.1775771593478;
        Thu, 09 Apr 2026 14:53:13 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38e49298f1csm1971861fa.12.2026.04.09.14.53.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 14:53:11 -0700 (PDT)
Date: Fri, 10 Apr 2026 00:53:08 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Kory Maincent <kory.maincent@bootlin.com>
Cc: Jani Nikula <jani.nikula@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Tvrtko Ursulin <tursulin@ursulin.net>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Dave Airlie <airlied@redhat.com>,
        Jesse Barnes <jbarnes@virtuousgeek.org>, Eric Anholt <eric@anholt.net>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Chun-Kuang Hu <chunkuang.hu@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Chris Wilson <chris@chris-wilson.co.uk>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Mark Yacoub <markyacoub@google.com>, Sean Paul <seanpaul@google.com>,
        Louis Chauvet <louis.chauvet@bootlin.com>,
        intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-mediatek@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org,
        Simona Vetter <simona.vetter@ffwll.ch>
Subject: Re: [PATCH RFC 09/12] drm: Introduce drmm_connector_dp_init() with
 link training state properties
Message-ID: <gmaxonri7y3k43pxsnxfnd23mydgrwsw2322v6m4yjoksqm7aj@4ehgvhzg2ubb>
References: <20260409-feat_link_cap-v1-0-7069e8199ce2@bootlin.com>
 <20260409-feat_link_cap-v1-9-7069e8199ce2@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260409-feat_link_cap-v1-9-7069e8199ce2@bootlin.com>
X-Authority-Analysis: v=2.4 cv=RfCgzVtv c=1 sm=1 tr=0 ts=69d81fcb cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=P-IC7800AAAA:8
 a=E-m9dlAQy1ysB7IIWEIA:9 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22
 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-GUID: TJtuwOhI7vs2i4dnqHJfNPHVDY7iR4NW
X-Proofpoint-ORIG-GUID: TJtuwOhI7vs2i4dnqHJfNPHVDY7iR4NW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA5MDIwMiBTYWx0ZWRfXzRGq5hreQkvU
 JzUqUdh6kGfALcWESoAhDnqdz0x089g1SjXgV8kz0zKyvWL7MlzyxbQM198vwnjskaB5lerKwEL
 51Br5FB0VJgfhzSrgO+Vzh/kh8ailn+mFAzVm6Lx6gCurbxXRTGr8+HNn+2Bj34hMxvyZWlo5bK
 Y31bMxJBMGbhoSTxtAo+YLxzY3pEZe2+y2FRwnKUvbKKfT+22w6NycbXfmnXjmQ/K7V4R13Ow4e
 PJIQyqZyA3/0MmekHJsdc8naQycT6xfhzUCeCts7Xptg2V6eIP8naXozOkxWQP8MBSnxSJP9p2A
 zcgJVSjQNIlUT/kqQSC+hs+JofuF1soqMBcfEdPY1PStgOnYuP4FpRQzRaCmSMPmd3ceOdhxdeF
 YTqfG/jRLoVVBErcjOkeP8QDNDkhPK79DKmQw2fsVnMCMeNzsy8BMhl5V3g6HYgQ5BhQB58S9nc
 Xb3ZbCZrZSu5EcAEftQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-09_04,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 impostorscore=0 adultscore=0 priorityscore=1501
 lowpriorityscore=0 spamscore=0 suspectscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604090202
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260409_145315_961367_42D811CB 
X-CRM114-Status: GOOD (  26.35  )
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

On Thu, Apr 09, 2026 at 07:08:25PM +0200, Kory Maincent wrote:
> Add a managed DisplayPort connector initialization helper,
> drmm_connector_dp_init(), modeled after the existing HDMI counterpart
> drmm_connector_hdmi_init(). Cleanup is handled automatically via a
> DRM-managed action.
> 
> The helper creates the following immutable connector properties to expose
> DP link training capabilities and state to userspace:
> 
>   - num_lanes: bitmask of supported lane counts (1, 2, 4)
>   - link_rate: Array of supported link rates.
>   - dsc_en: Display Stream Compression supported
>   - voltage_swingN: per-lane voltage swing level bitmask
>   - pre-emphasisN: per-lane pre-emphasis level bitmask
> 
> Link rates are passed by the driver in deca-kbps, following the DRM
> convention, but exposed to userspace in kbps for clarity.
> 
> Two additional helpers are provided to update and reset those properties
> at runtime:
>   - drm_connector_dp_set_link_train_properties()
>   - drm_connector_dp_reset_link_train_properties()
> 
> Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
> ---
>  drivers/gpu/drm/Makefile           |   1 +
>  drivers/gpu/drm/drm_dp_connector.c | 344 +++++++++++++++++++++++++++++++++++++
>  include/drm/drm_connector.h        |  38 ++++
>  include/drm/drm_dp_connector.h     | 109 ++++++++++++
>  4 files changed, 492 insertions(+)
> 
> diff --git a/include/drm/drm_dp_connector.h b/include/drm/drm_dp_connector.h
> new file mode 100644
> index 0000000000000..77d2f4bb6df68
> --- /dev/null
> +++ b/include/drm/drm_dp_connector.h
> @@ -0,0 +1,109 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +
> +#ifndef DRM_DP_CONNECTOR_H_
> +#define DRM_DP_CONNECTOR_H_
> +
> +#include <drm/drm_connector.h>
> +
> +#define DRM_DP_1LANE	BIT(0)
> +#define DRM_DP_2LANE	BIT(1)
> +#define DRM_DP_4LANE	BIT(2)
> +#define DRM_NLANES_MASK (DRM_DP_1LANE | DRM_DP_2LANE | DRM_DP_4LANE)
> +#define DRM_DP_VOLTAGE_SWING_LEVEL_0 BIT(0)
> +#define DRM_DP_VOLTAGE_SWING_LEVEL_1 BIT(1)
> +#define DRM_DP_VOLTAGE_SWING_LEVEL_2 BIT(2)
> +#define DRM_DP_VOLTAGE_SWING_LEVEL_3 BIT(3)
> +#define DRM_DP_VOLTAGE_SWING_LEVEL_MASK (DRM_DP_VOLTAGE_SWING_LEVEL_0 | \
> +					 DRM_DP_VOLTAGE_SWING_LEVEL_1 | \
> +					 DRM_DP_VOLTAGE_SWING_LEVEL_2 | \
> +					 DRM_DP_VOLTAGE_SWING_LEVEL_3)
> +#define DRM_DP_PRE_EMPH_LEVEL_0 BIT(0)
> +#define DRM_DP_PRE_EMPH_LEVEL_1 BIT(1)
> +#define DRM_DP_PRE_EMPH_LEVEL_2 BIT(2)
> +#define DRM_DP_PRE_EMPH_LEVEL_3 BIT(3)
> +#define DRM_DP_PRE_EMPH_LEVEL_MASK (DRM_DP_PRE_EMPH_LEVEL_0 | \
> +				    DRM_DP_PRE_EMPH_LEVEL_1 | \
> +				    DRM_DP_PRE_EMPH_LEVEL_2 | \
> +				    DRM_DP_PRE_EMPH_LEVEL_3)
> +
> +/**
> + * struct drm_connector_dp_link_train_caps - DRM DisplayPort link training
> + * capabilities

Those are not just link training caps. It is more like DP link caps.
They make sense to be a part of the DP-related drm_connector part.

> + */
> +struct drm_connector_dp_link_train_caps {
> +	/**
> +	 * @nlanes: Bitmask of lanes number supported
> +	 */
> +	u8 nlanes;
> +
> +	/**
> +	 * @nrates: Number of link rates supported
> +	 */
> +	u32 nrates;
> +
> +	/**
> +	 * @rates: Array listing the supported link rates in deca-kbps
> +	 */
> +	const u32 *rates;
> +
> +	/**
> +	 * @dsc: Display Stream Compression supported
> +	 */
> +	bool dsc;
> +
> +	/**
> +	 * @v_swings: Bitmask of voltage swing level supported
> +	 */
> +	u8 v_swings;
> +
> +	/**
> +	 * @pre_emphs: Bitmask of pre-emphasis level supported
> +	 */
> +	u8 pre_emphs;
> +};
> +
> +/**
> + * struct drm_connector_dp_link_train - DRM DisplayPort link training
> + * information report
> + */
> +struct drm_connector_dp_link_train {

THese define the current DP state. As such, they definitely make sense
to be a part of the drm_connector.
> +	/**
> +	 * @nlanes: The number of lanes used
> +	 */
> +	u8 nlanes;
> +
> +	/**
> +	 * @rates: Link rate value selected in deca-kbps
> +	 */
> +	u32 rate;
> +
> +	/**
> +	 * @dsc: Display Stream Compression enabled
> +	 */
> +	bool dsc_en;
> +
> +	/**
> +	 * @v_swings: Array listing the bitmask voltage swing level per lanes
> +	 */
> +	u8 v_swing[4];
> +
> +	/**
> +	 * @pre_emph: Array listing the bitmask pre-emphasis level per lanes
> +	 */
> +	u8 pre_emph[4];

Please consider following struct phy_configure_opts_dp (or using it as
is). Overall, please refer the talk and (more important) the lightning
resumee at this XDC. I have some bits and pieces ready in spite of that
proposal, but I didn't have time to finish it.

> +};
> +

-- 
With best wishes
Dmitry

