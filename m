Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83DEBE9B25B
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 Feb 2026 12:45:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eKiW5pLOWPQFItUNBvuOJK4DPxfIaCmYI8GWAMckqBQ=; b=b/LR2scjetoEPmNmSckgvh67WN
	M0/jTkQtit26CqCEawjdkOPL3fOziPu70Eu43xdg6a+Yh1/c0CoE9kVrBZlZbsxe+TaRGnUigr7CH
	an4NK2kJrEFyxgHxCDjvyZGEHowRW1zIXwIAowyKUVzr9T9/CbfYZimK+k92gow6FGIY7FcqAGW5O
	ND2fwFEl7MQvb2EJEasTN1c66MaLAu03AfpZcNGGbIb/ZRzKlQKT00iFBaeJJgLa9bVcDYsQfEoC7
	3+6wRnuMltzsFh1jdNKvCzS67bp8oB6dUKvGtNsNntUvhRaUiRzP6Ys/4XUkLRgLYWt/WNwsS3ipH
	Tcd5aOrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vurmu-000000024nP-1sFQ;
	Tue, 24 Feb 2026 12:45:16 +0000
Received: from mgamail.intel.com ([198.175.65.16])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vurmr-000000024mP-2mUa;
	Tue, 24 Feb 2026 12:45:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771937114; x=1803473114;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=W7iFt2fkt7YDpfXHd4Koz7uX1w/SnCnrgCNowt9OOFg=;
  b=IeTDMNcAwD40mzY1+plh0CDE5hq1sc5k0Hknx5cfiGqgnxwWbhXZ7rOu
   al3pRfq+DrAQpYa9bDjFKocYyHp7T2kIdGa6LW5unDX5n0WVQRxSlRgFf
   iONXvKvTmZSn8zOdDgBYreI7ANCZQXypV5kCJZPok50OVkTjt9l7No8vg
   +bZC2LgcImj1SQBLirT5W7gYRGFO+0eW2mIk02xZh7mxmh17A0oa3df4V
   NOYQDhAnvhwq4PhefnlYKNqsCk+Dpg/xnLKDPvMeMJrSMk+ox7Zvliqzp
   ZWxsiwuqo3sZc/GLa6DNSroskskNNVzR1L3qFKHy2LWSmzMVWDorDwStR
   w==;
X-CSE-ConnectionGUID: T4r4+zXBQ7q/FedOdDegYw==
X-CSE-MsgGUID: i45Is2zDTSmtmzlo1YvyTA==
X-IronPort-AV: E=McAfee;i="6800,10657,11710"; a="73128805"
X-IronPort-AV: E=Sophos;i="6.21,308,1763452800"; 
   d="scan'208";a="73128805"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Feb 2026 04:45:13 -0800
X-CSE-ConnectionGUID: hR5Tp+z0SeiMexLEVtwNdg==
X-CSE-MsgGUID: RMgpOpjdSHuKzcfGeOggUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,308,1763452800"; 
   d="scan'208";a="215752727"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO localhost) ([10.245.246.20])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Feb 2026 04:45:00 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Maxime Ripard <mripard@kernel.org>, Nicolas Frattaroli
 <nicolas.frattaroli@collabora.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Harry Wentland <harry.wentland@amd.com>,
 Leo Li <sunpeng.li@amd.com>, Rodrigo Siqueira <siqueira@igalia.com>, Alex
 Deucher <alexander.deucher@amd.com>, Christian =?utf-8?Q?K=C3=B6nig?=
 <christian.koenig@amd.com>, Andrzej Hajda <andrzej.hajda@intel.com>, Neil
 Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman
 <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, Andy Yan
 <andy.yan@rock-chips.com>, Liviu Dudau <liviu.dudau@arm.com>, Chun-Kuang
 Hu <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Sandy Huang
 <hjc@rock-chips.com>, Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>, Liu
 Ying
 <victor.liu@nxp.com>, Chen-Yu Tsai <wens@kernel.org>, Samuel Holland
 <samuel@sholland.org>, Dave Stevenson <dave.stevenson@raspberrypi.com>,
 =?utf-8?Q?Ma=C3=ADra?= Canal <mcanal@igalia.com>, Raspberry Pi Kernel
 Maintenance
 <kernel-list@raspberrypi.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-sunxi@lists.linux.dev
Subject: Re: [PATCH 00/14] drm: Create drm_output_color_format enum
In-Reply-To: <20260224-drm-rework-color-formats-v1-0-bebc76604ada@kernel.org>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260224-drm-rework-color-formats-v1-0-bebc76604ada@kernel.org>
Date: Tue, 24 Feb 2026 14:44:57 +0200
Message-ID: <f8e02ae7d60814d3d0540ab81ebccbe46eaf5e29@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260224_044513_755465_FE733B76 
X-CRM114-Status: GOOD (  10.69  )
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

On Tue, 24 Feb 2026, Maxime Ripard <mripard@kernel.org> wrote:
> Hi,
>
> This series creates an enum to represent the output color format as an
> enum instead of a bitmask, and consolidate the HDMI helpers to use the
> new enum.
>
> This should make Nicolas' work easier.
>
> It has been build tested, and passes kunit tests.
>
> Let me know what you think,

I like this. I eyeballed through the series, but did not spend enough
time to call it detailed review.

Acked-by: Jani Nikula <jani.nikula@intel.com>


-- 
Jani Nikula, Intel

