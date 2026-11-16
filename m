Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA8E6606A31C
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Nov 2026 15:49:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=vo9yIaYm;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=aRmH65n5
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=YQHHdmIH2ybJ3Xcn8u+aXKxVble8jcR3/mORkYzfOs0=; b=vo9yIaYmi27I9x
	/3yOgtbN5I8oZgNg3MgDZe9VSD+S1UzhF1JyIvzIY99ljZ0g4swUkMHeU76dXm2kMpkzkGuuyiuz7
	uiI+Wvj/hv9DXrJL5qKetJHOyh3VlAb0g6Jd8m4joFst7IQwy/7T8PW2Py05M+JkNZMipS2pbvAY1
	GN94v2CxrhICLFFdhxMsYuSRkHNGLnZVVo2oOTW5ClLdFJpWWIdzu19ZyVUPCtrr7ulYBzu4mVhgR
	XuDOX2XVoe1lkBL78E+m7CyqTRZ9zcTCN7l8JcG0PW20DTek6qXqmmKONEVKCRimVs3RuB1AZwzAX
	tmJfIF7jEtGsVN9QPx7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSyxW-000000037WV-14kQ;
	Mon, 16 Nov 2026 15:49:30 +0000
Received: from mgamail.intel.com ([192.198.163.9])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSyxR-000000037W7-3MAc;
	Mon, 16 Nov 2026 15:49:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794844166; x=1826380166;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version:content-transfer-encoding;
  bh=h5I2iN2bKGQEaIKJix6Jjm6p6SGAqj9ooiZ2GqNaZN4=;
  b=aRmH65n5ggvV6syKScn9EES7oYFqPcwoGe1v/77kUxeK/QH1irWlJPrg
   TOF0gKRRrehT0G1w3Xfgi1ClUc4NUu+6GldO8egq/l/REWSWlxXKpGACX
   UOmFvNPoqvx8H9mjbA+9c5W/cag1PYlbumdM0lX+5xxfPzGoGIX8npW3W
   wEgRFb1d0hb3A+6Uwale49ctVLvnAT31ISaWhdDXAwIshQN94fQgzi+Ke
   sz+ZRB1YI7slJqSzVyePHDplVeujM+fu8TcsQC9AKkN6+8TTpEAlSz1ac
   dXndNkNx4HwAe9OY5gK9E34pScP1F36DIROltu54udK7nziSH/No2qUXC
   Q==;
X-CSE-ConnectionGUID: eJy22s8aQEm9hR4xY/U5/A==
X-CSE-MsgGUID: n1T+zx5tQfORoDi2055WUw==
X-IronPort-AV: E=McAfee;i="6800,10657,11968"; a="3464213"
X-IronPort-AV: E=Sophos;i="6.27,217,1787036400"; 
   d="scan'208";a="3464213"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2026 07:49:25 -0800
X-CSE-ConnectionGUID: Lt2zmwS9QB2viz4Illg88w==
X-CSE-MsgGUID: YXo883ZZSmSIcwQyAORIFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,217,1787036400"; 
   d="scan'208";a="11293282"
Received: from slindbla-desk.ger.corp.intel.com (HELO localhost) ([10.245.245.117])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2026 07:49:16 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Kory Maincent <kory.maincent@bootlin.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin
 <tursulin@ursulin.net>, Andrzej Hajda <andrzej.hajda@intel.com>, Neil
 Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman
 <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, Luca
 Ceresoli <luca.ceresoli@bootlin.com>, Chun-Kuang Hu
 <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Dmitry Baryshkov
 <lumag@kernel.org>, Daniel Stone <daniels@collabora.com>, Manasi Navare
 <navaremanasi@google.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Mark Yacoub
 <markyacoub@google.com>, Sean Paul <seanpaul@google.com>, Drew Davenport
 <ddavenport@google.com>, Louis Chauvet <louis.chauvet@bootlin.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH RFC v3 0/8] Add support for DisplayPort link training
 information report
In-Reply-To: <dfe3ce17-8153-4cd1-b9df-fe0d61cec9c4@bootlin.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20261012-feat_link_cap-v3-0-7517f4aba0f3@bootlin.com>
 <51ec15feef9a88e460ab6fefc48b5b982f4857c0@intel.com>
 <dfe3ce17-8153-4cd1-b9df-fe0d61cec9c4@bootlin.com>
Date: Mon, 16 Nov 2026 17:49:13 +0200
Message-ID: <e936236b54ca17fd1498e02c349f40e5520df26b@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_074927_952689_A2E9BF94 
X-CRM114-Status: GOOD (  28.81  )
X-Spam-Score: -4.3 (----)
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, 16 Nov 2026, Kory Maincent <kory.maincent@bootlin.com> wrote:
> On 11/16/26 14:10, Jani Nikula wrote:
>> On Mon, 12 Oct 2026, Kory Maincent <kory.maincent@bootlin.com> wrote:
>>> DisplayPort link training negotiates the physical-layer parameters need=
ed
>>> for a reliable connection: lane count, link rate, and optionally Display
>>> Stream Compression (DSC). Currently, each driver exposes this state in
>>> its own way, often through driver-specific debugfs entries, with no
>>> standard interface for userspace diagnostic and monitoring tools.
>>>
>>> This series introduces generic helpers, for exposing DP link capabiliti=
es
>>> and state as standard sysfs entries.
>>=20
>> So how did we end up with sysfs here?
>
> In the first RFC it was in DRM properties. I presented it in the display=
=20
> hackfest in Nice last years. People suggested to use sysfs instead but=20
> if the need appears later in the development move back to DRM=20
> properties. I first though DRM properties seems better as it is the user=
=20
> interface used by distros but I had no strong argument about the change=20
> to sysfs, so I moved on to it.
>
>>> The aim of such development is to guide users to select the most suitab=
le
>>> DisplayPort connector for their needs. For example, if you have a USB-C
>>> hub with lesser capabilities than your computer=E2=80=99s native Displa=
yPort
>>> connector (such as HBR2 versus HBR3 support), the system could recommend
>>> connecting high-resolution displays directly to the computer=E2=80=99s =
port
>>> instead of through the hub to ensure optimal performance.
>>=20
>> I do wonder how all this is supposed to work in more complex real world
>> scenarios, though.
>>=20
>> I believe the user primarily cares about *modes*. Which display modes
>> can be used with each display/connector pair.
>>=20
>> With the low level link information, are you proposing to compute the
>> required bandwidth for modes in userspace? I think it's going to be a
>> lot of work to compute the bandwidth requirements, taking into account
>> DP SST vs. MST vs. UHBR and DSC and bit depth and everything, and you'll
>> still miss any driver/GPU specific contraints. Or are you just proposing
>> to match the physical characteristics only?
>
> This is a requirement from Google, yes they want to compute the=20
> bandwidth for modes in the userspace side.
> @Manasi could describe in detail how would you implement it?

Yeah, I don't want to end up with lots of new low level UAPI if that
doesn't solve the actual problem. See [2].

[2] https://en.wikipedia.org/wiki/XY_problem

>> Given all the connectors and displays and their modes on a system, you
>> could estimate a) for each display, what modes could be used on each
>> connector, and b) for each connector, what modes could be used on a
>> display, if connected. From the user POV, they could be shown why some
>> display mode is not available on the current connector, and crucially,
>> on which connector it could be available.
>>=20
>> In general, I'm wondering if you're really after higher level
>> information, something like "connector max available bandwidth
>> with/without DSC", that would more directly map to the user needs as I
>> see them than low level link details.
>>=20
>> Do you have the userspace somewhere? That's needed for merging UABI
>> anyway [1].
>>=20
>> [1] https://docs.kernel.org/gpu/drm-uapi.html#open-source-userspace-requ=
irements
>
> I wanted to add it to IGT GPU tools, but I was hopping for community=20
> review on this RFC before the IGT development.

IGT is not enough for UAPI. "The open-source userspace must not be a
toy/test application, but the real thing."

You can add loads of individually meaningful tests to IGT without
actually demostrating how the feature solves the problem.

BR,
Jani.

>>> The new drm_dp_source_set_caps and drm_dp_sink_set_caps helper expose
>>> source and sink training capabilities to userspace via sysfs attributes
>>> under dp_link. Finally drm_dp_set_cur_link_params helper is provided to
>>> report current link information at runtime.
>>>
>>> Three drivers are updated as reference implementations: i915 (direct
>>> connector path), ANX7625 and MediaTek (via the bridge connector framewo=
rk
>>> using a new DRM_BRIDGE_OP_DP flag).
>>>
>>> Here is a sysfs example:
>>>
>>> cur_link_info_dsc            sink_link_caps_nlanes
>>> cur_link_info_link_rate      source_link_caps_dsc
>>> cur_link_info_nlanes         source_link_caps_link_rates
>>> sink_link_caps_dsc           source_link_caps_nlanes
>>> sink_link_caps_link_rates
>>>
>>> 1620000 2160000 2700000 3240000 4320000 5400000
>>>
>>> 1620000 2700000 5400000 10000000 20000000
>>>
>>> 5400000
>>>
>>> This series is rebased on top of drm-misc and may conflict with the
>>> current state of the drm i915 tree. Which tree should pick this up,
>>> given that it mixes core development with driver changes?
>>=20
>> For development, please just base your work on top of drm-tip, and the
>> tree(s) will be sorted out later.
>
> Oh, ok, thanks you.

--=20
Jani Nikula, Intel

