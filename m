Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C71DC54E58
	for <linux-mediatek@archiver.kernel.org>; Wed, 20 Mar 2024 07:29:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J1KMm3bcETKmx2GlY8Sy+cywK4QQ2O/HxmwbrFSu9Os=; b=2VOnlsqSL/0t0sEWvc2L7XoWAq
	pLhOgWWprd3MYOVeRdl61EU9xk0MW7AvB+PUCP28H6s8sthaK/dKtVZfPtqMqX7jaAnlAAoVOy1o3
	uln2gXin+Ee0yLyOm9JBttfVxyBP+QSK0k0+jkXnQOi2G1V4fmBt94iMIPJ71rguYF6xUJ5lzXMPG
	Y+kzUFaCZq0+RUX23etmU3SsACDv2+79UQWWizv77sTjS0bQ4zN/Uadyp/e+fe/YsmLk5amrALw1A
	f8QGcUwInsH8QtMeXOCozlEypj0VK361FY5jH5pNXVY6ZYwEMpjXwNRHG5tuYt9s9wDhkPFzBPL/H
	bIk1oYxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmqO0-0000000Fv1N-0Pbv;
	Wed, 20 Mar 2024 07:29:20 +0000
Received: from mgamail.intel.com ([192.198.163.12])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmqNw-0000000Fuyn-21Fy;
	Wed, 20 Mar 2024 07:29:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710919756; x=1742455756;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=SIJLQWAZttGxLBgmyLL6igS6AuPkYTJuC02fay6r37E=;
  b=cvrMCgEFxB4f5xviQds9Kb6n4VkHL6j6eC9vrm36ON1kW+YY3vqcXXEp
   iQ05O8q38hHhSGF0Roz5csNK8IYktQTSHe5E8s/OA8Bc6uUCtxvivb6ZQ
   jpo5KGvb6qEZUZlPdqml+FNDcNNep0t3GSRLtBxhQK1pgc/AiVb6RiQCs
   y4lSCuiMUpFEfDtZ/15fJ9iEbRcFaoSEpOxYDB0CT0Qn5p46V00Bi47yc
   iYOCMQsKZekfiS62p7UyHYpee+YYgPvn7ojTTpYuy3eWXW1eVawpVvi5k
   cjK66gzLmTRoiGooICALx3Lk4buHGrd8Ea3DM67OqWjDMpzk9E4wrnbmS
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11018"; a="9598535"
X-IronPort-AV: E=Sophos;i="6.07,139,1708416000"; 
   d="scan'208";a="9598535"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Mar 2024 00:29:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,139,1708416000"; 
   d="scan'208";a="51507652"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Mar 2024 00:29:04 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 6E3E911F853;
	Wed, 20 Mar 2024 09:29:01 +0200 (EET)
Date: Wed, 20 Mar 2024 07:29:01 +0000
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Zhi Mao <zhi.mao@mediatek.com>
Cc: mchehab@kernel.org, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	laurent.pinchart@ideasonboard.com, shengnan.wang@mediatek.com,
	yaya.chang@mediatek.com,
	Project_Global_Chrome_Upstream_Group@mediatek.com,
	yunkec@chromium.org, conor+dt@kernel.org, matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	jacopo.mondi@ideasonboard.com, 10572168@qq.com,
	hverkuil-cisco@xs4all.nl, heiko@sntech.de, jernej.skrabec@gmail.com,
	macromorgan@hotmail.com, linus.walleij@linaro.org,
	hdegoede@redhat.com, tomi.valkeinen@ideasonboard.com,
	gerald.loacker@wolfvision.net, andy.shevchenko@gmail.com,
	bingbu.cao@intel.com, dan.scally@ideasonboard.com,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v1 2/2] media: i2c: Add GC05A2 image sensor driver
Message-ID: <ZfqQPTgqzOw7tATK@kekkonen.localdomain>
References: <20240316025253.2300-1-zhi.mao@mediatek.com>
 <20240316025253.2300-3-zhi.mao@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240316025253.2300-3-zhi.mao@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240320_002916_629767_E93CB047 
X-CRM114-Status: GOOD (  15.81  )
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

Hi Zhi,

Thanks for the set.

On Sat, Mar 16, 2024 at 10:52:53AM +0800, Zhi Mao wrote:
> +static int gc05a2_set_ctrl(struct v4l2_ctrl *ctrl)
> +{
> +	struct gc05a2 *gc05a2 =
> +		container_of(ctrl->handler, struct gc05a2, ctrls);
> +	int ret = 0;
> +	s64 exposure_max;
> +	struct v4l2_subdev_state *state;
> +	const struct v4l2_mbus_framefmt *format;
> +
> +	state = v4l2_subdev_get_locked_active_state(&gc05a2->sd);
> +	format = v4l2_subdev_state_get_format(state, 0);
> +
> +	if (ctrl->id == V4L2_CID_VBLANK) {
> +		/* Update max exposure while meeting expected vblanking */
> +		exposure_max = format->height + ctrl->val - GC05A2_EXP_MARGIN;
> +		__v4l2_ctrl_modify_range(gc05a2->exposure,
> +					 gc05a2->exposure->minimum,
> +					 exposure_max, gc05a2->exposure->step,
> +					 exposure_max);
> +	}
> +
> +	/*
> +	 * Applying V4L2 control value only happens
> +	 * when power is on for streaming.
> +	 */
> +	if (!pm_runtime_get_if_in_use(gc05a2->dev))

This should be pm_runtime_get_if_active(). Please assume it takes a single
argument (the device)---see commit
c0ef3df8dbaef51ee4cfd58a471adf2eaee6f6b3.

The same comment applies to the GC08A3 if it uses autosuspend, please post
a new patch for that.

-- 
Kind regards,

Sakari Ailus

