Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A767B606A331
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Nov 2026 09:11:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=3ampbVVi;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=MMjHPJxO
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=AfUnYvEf8apgIWNFfrYRRolIs+tMwqZGx3aRdYVjz6c=; b=3ampbVViADjSGfT9t0ZhaCm08W
	6/ymqW/n6FwxZtVxBKeqf72BCRyn5qSVfJ4gzRR5PFXagDFvsGoWdGHEhl6pofM7RMredADrnNIvc
	JvpzIL1NKusk1+bGF/O6eO1vYZEwQm/1V4M3MU66ysQpza8WcCnh84m9WB4nlOVXvzU2lmQiKqolc
	mQNEmAkF6L2NGY7XNaPnOqy0d2QLqQmvxNYlFksm+C3JIvjVtkt3mF8p8AtKSjailnRPwPCHdqsEz
	PbhfkJwUInhI8myJ9m/6HcD1kp1zD9BQzKao7D/fZwkZMVBjhD5S0sKm06YiPeZ6iXUv8g0io8FKD
	2k53S1Tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTFDo-000000051pF-1jbq;
	Tue, 17 Nov 2026 09:11:24 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTFDm-000000051ok-17Pt;
	Tue, 17 Nov 2026 09:11:23 +0000
Received: from killaraus.ideasonboard.com (2001-14ba-7086-3000--a06.rev.dnainternet.fi [IPv6:2001:14ba:7086:3000::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9A3F4177;
	Tue, 17 Nov 2026 10:08:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1794906531;
	bh=KUFK5SRjTDmkX8fMf4Me0mjN4nDeO27cOzJsCIsYw84=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MMjHPJxOkzofEgWsMCPdy/py0r8ulpcFPYc3Vf1zCCbf94cGuQ3E7X7zWdPJN+D/A
	 xxtRpjF8XOMaDz50oyN+eqb0dVyddYDrKLByR1wSBMIxqd1zsvek/BZGwibYGcZ9kg
	 Ytz9zPftXJccBUr6hhs+/CgwTeplKuEwVXE4F6NU=
Date: Tue, 17 Nov 2026 11:11:17 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Kory Maincent <kory.maincent@bootlin.com>
Cc: Jani Nikula <jani.nikula@linux.intel.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
	Tvrtko Ursulin <tursulin@ursulin.net>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>, Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Daniel Stone <daniels@collabora.com>,
	Manasi Navare <navaremanasi@google.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Mark Yacoub <markyacoub@google.com>,
	Sean Paul <seanpaul@google.com>,
	Drew Davenport <ddavenport@google.com>,
	Louis Chauvet <louis.chauvet@bootlin.com>,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH RFC v3 0/8] Add support for DisplayPort link training
 information report
Message-ID: <20261117091117.GA1851633@killaraus.ideasonboard.com>
References: <20261012-feat_link_cap-v3-0-7517f4aba0f3@bootlin.com>
 <51ec15feef9a88e460ab6fefc48b5b982f4857c0@intel.com>
 <dfe3ce17-8153-4cd1-b9df-fe0d61cec9c4@bootlin.com>
 <20261116154931.GA1763340@killaraus.ideasonboard.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261116154931.GA1763340@killaraus.ideasonboard.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_011122_482981_2E68EB4E 
X-CRM114-Status: GOOD (  46.56  )
X-Spam-Score: -2.1 (--)
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
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, Nov 16, 2026 at 05:49:31PM +0200, Laurent Pinchart wrote:
> On Mon, Nov 16, 2026 at 04:13:52PM +0100, Kory Maincent wrote:
> > On 11/16/26 14:10, Jani Nikula wrote:
> > > On Mon, 12 Oct 2026, Kory Maincent <kory.maincent@bootlin.com> wrote:
> > >> DisplayPort link training negotiates the physical-layer parameters needed
> > >> for a reliable connection: lane count, link rate, and optionally Display
> > >> Stream Compression (DSC). Currently, each driver exposes this state in
> > >> its own way, often through driver-specific debugfs entries, with no
> > >> standard interface for userspace diagnostic and monitoring tools.
> > >>
> > >> This series introduces generic helpers, for exposing DP link capabilities
> > >> and state as standard sysfs entries.
> > > 
> > > So how did we end up with sysfs here?
> > 
> > In the first RFC it was in DRM properties. I presented it in the display 
> > hackfest in Nice last years. People suggested to use sysfs instead but 
> > if the need appears later in the development move back to DRM 
> > properties. I first though DRM properties seems better as it is the user 
> > interface used by distros but I had no strong argument about the change 
> > to sysfs, so I moved on to it.
> > 
> > >> The aim of such development is to guide users to select the most suitable
> > >> DisplayPort connector for their needs. For example, if you have a USB-C
> > >> hub with lesser capabilities than your computer’s native DisplayPort
> > >> connector (such as HBR2 versus HBR3 support), the system could recommend
> > >> connecting high-resolution displays directly to the computer’s port
> > >> instead of through the hub to ensure optimal performance.
> > > 
> > > I do wonder how all this is supposed to work in more complex real world
> > > scenarios, though.
> > > 
> > > I believe the user primarily cares about *modes*. Which display modes
> > > can be used with each display/connector pair.
> > > 
> > > With the low level link information, are you proposing to compute the
> > > required bandwidth for modes in userspace? I think it's going to be a
> > > lot of work to compute the bandwidth requirements, taking into account
> > > DP SST vs. MST vs. UHBR and DSC and bit depth and everything, and you'll
> > > still miss any driver/GPU specific contraints. Or are you just proposing
> > > to match the physical characteristics only?
> > 
> > This is a requirement from Google, yes they want to compute the 
> > bandwidth for modes in the userspace side.
> > @Manasi could describe in detail how would you implement it?
> > 
> > > Given all the connectors and displays and their modes on a system, you
> > > could estimate a) for each display, what modes could be used on each
> > > connector, and b) for each connector, what modes could be used on a
> > > display, if connected. From the user POV, they could be shown why some
> > > display mode is not available on the current connector, and crucially,
> > > on which connector it could be available.
> > > 
> > > In general, I'm wondering if you're really after higher level
> > > information, something like "connector max available bandwidth
> > > with/without DSC", that would more directly map to the user needs as I
> > > see them than low level link details.
> > > 
> > > Do you have the userspace somewhere? That's needed for merging UABI
> > > anyway [1].
> > > 
> > > [1] https://docs.kernel.org/gpu/drm-uapi.html#open-source-userspace-requirements
> > 
> > I wanted to add it to IGT GPU tools, but I was hopping for community 
> > review on this RFC before the IGT development.
> 
> Note the following requirement:
> 
>   The open-source userspace must not be a toy/test application, but the
>   real thing. Specifically it needs to handle all the usual error and
>   corner cases. These are often the places where new uAPI falls apart
>   and hence essential to assess the fitness of a proposed interface.
> 
> I think think IGT qualifies. An implementation in a desktop environment

I meant I *don't* think IGT qualifies.

> would likely be needed.
> 
> > >> The new drm_dp_source_set_caps and drm_dp_sink_set_caps helper expose
> > >> source and sink training capabilities to userspace via sysfs attributes
> > >> under dp_link. Finally drm_dp_set_cur_link_params helper is provided to
> > >> report current link information at runtime.
> > >>
> > >> Three drivers are updated as reference implementations: i915 (direct
> > >> connector path), ANX7625 and MediaTek (via the bridge connector framework
> > >> using a new DRM_BRIDGE_OP_DP flag).
> > >>
> > >> Here is a sysfs example:
> > >>
> > >> cur_link_info_dsc            sink_link_caps_nlanes
> > >> cur_link_info_link_rate      source_link_caps_dsc
> > >> cur_link_info_nlanes         source_link_caps_link_rates
> > >> sink_link_caps_dsc           source_link_caps_nlanes
> > >> sink_link_caps_link_rates
> > >>
> > >> 1620000 2160000 2700000 3240000 4320000 5400000
> > >>
> > >> 1620000 2700000 5400000 10000000 20000000
> > >>
> > >> 5400000
> > >>
> > >> This series is rebased on top of drm-misc and may conflict with the
> > >> current state of the drm i915 tree. Which tree should pick this up,
> > >> given that it mixes core development with driver changes?
> > > 
> > > For development, please just base your work on top of drm-tip, and the
> > > tree(s) will be sorted out later.
> > 
> > Oh, ok, thanks you.

-- 
Regards,

Laurent Pinchart

