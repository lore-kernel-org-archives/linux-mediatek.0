Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28EE7D609BB
	for <linux-mediatek@archiver.kernel.org>; Tue, 16 Dec 2025 16:36:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:Cc
	:Subject:From:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PzhR0G4mBnm/z0O1Hfgh44ISCPhT1HMJphLOZLV+TY0=; b=ILMRFSq4oJxDv02UvrYeVT9I2X
	B1G8zP9Awi3XRHW38RMzPXvC0pJAuPy9ee767MIswGWK2k2RbV8QX+0ThFMHGsW3I7PN+K0WesAQ9
	vhvm/kSJKcV+Y1DUuWLXwDWMeWQi/hHvKrK9vIoAc/+1rOKPpw4FSAirizSx9/5joavp9GH3X70Z0
	NsHEMi5qAqJM6F3jwXnMj91hxZAg3y0enL47YgRYRD8h0fHrcx4ucw5bubNLw8KFinBv6lHhqWK4G
	/VE5msaVobjbfjX2MjeKIuXUFcLmRmK0qB3fNZy6TjngvhERGe7OhTzQwZ237rZcxO6dvzZhJUXh8
	5lP/bh6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVY2K-00000005XMl-3R6Q;
	Tue, 16 Dec 2025 16:36:32 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVY2H-00000005XLh-05lx;
	Tue, 16 Dec 2025 16:36:30 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 009034E41C33;
	Tue, 16 Dec 2025 16:36:24 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id A76266071C;
	Tue, 16 Dec 2025 16:36:24 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id F316C119A904B;
	Tue, 16 Dec 2025 17:36:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1765902982; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=PzhR0G4mBnm/z0O1Hfgh44ISCPhT1HMJphLOZLV+TY0=;
	b=Hxcp1qe0jp9L+ZP5B2CcjRugnzvNJMFJ/9uLnc/dPwH5UC2kAbZKmRyiMLwCIMY3l1rGeB
	r1i0PJRzjjFJ9grjtuxiAKvLXLVgaYVMvrqPir01kIYE5+3GlMEUdCh/SeWGh8FfSmc4dD
	BQCAl/r7vtgA55arSrrcGj571k5Y7jabJyHmtN3hyRh7HvY9LH9G+IEVTIcBK5YF8EbLdi
	mePmspCgWnZbPbX9OJXUW7hcaIiZlm5vXCzrPfRFRz3YSxNhCgjgDAJf2WLsdzNMJz7Sdl
	go01yz6G44JOyfuUCxKxAYqzeeuqGpt1lByELY1A2jHL5QL1gBe/telVFa0/Cw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 16 Dec 2025 17:36:07 +0100
Message-Id: <DEZSCVYVCZ71.1BRL4LGVYAZAX@bootlin.com>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH 06/26] drm/bridge: add devm_drm_of_find_bridge
Cc: "Andrzej Hajda" <andrzej.hajda@intel.com>, "Neil Armstrong"
 <neil.armstrong@linaro.org>, "Robert Foss" <rfoss@kernel.org>, "Laurent
 Pinchart" <Laurent.pinchart@ideasonboard.com>, "Jonas Karlman"
 <jonas@kwiboo.se>, "Jernej Skrabec" <jernej.skrabec@gmail.com>, "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>, "Thomas Zimmermann"
 <tzimmermann@suse.de>, "David Airlie" <airlied@gmail.com>, "Simona Vetter"
 <simona@ffwll.ch>, "Jonathan Corbet" <corbet@lwn.net>, "Alexey Brodkin"
 <abrodkin@synopsys.com>, "Phong LE" <ple@baylibre.com>, "Liu Ying"
 <victor.liu@nxp.com>, "Shawn Guo" <shawnguo@kernel.org>, "Sascha Hauer"
 <s.hauer@pengutronix.de>, "Pengutronix Kernel Team"
 <kernel@pengutronix.de>, "Fabio Estevam" <festevam@gmail.com>, "Adrien
 Grassein" <adrien.grassein@gmail.com>, "Laurent Pinchart"
 <laurent.pinchart+renesas@ideasonboard.com>, "Tomi Valkeinen"
 <tomi.valkeinen+renesas@ideasonboard.com>, "Kieran Bingham"
 <kieran.bingham+renesas@ideasonboard.com>, "Geert Uytterhoeven"
 <geert+renesas@glider.be>, "Magnus Damm" <magnus.damm@gmail.com>, "Kevin
 Hilman" <khilman@baylibre.com>, "Jerome Brunet" <jbrunet@baylibre.com>,
 "Martin Blumenstingl" <martin.blumenstingl@googlemail.com>, "Chun-Kuang Hu"
 <chunkuang.hu@kernel.org>, "Philipp Zabel" <p.zabel@pengutronix.de>,
 "Matthias Brugger" <matthias.bgg@gmail.com>, "AngeloGioacchino Del Regno"
 <angelogioacchino.delregno@collabora.com>, "Anitha Chrisanthus"
 <anitha.chrisanthus@intel.com>, "Edmund Dea" <edmund.j.dea@intel.com>,
 "Inki Dae" <inki.dae@samsung.com>, "Seung-Woo Kim"
 <sw0312.kim@samsung.com>, "Kyungmin Park" <kyungmin.park@samsung.com>,
 "Krzysztof Kozlowski" <krzk@kernel.org>, "Alim Akhtar"
 <alim.akhtar@samsung.com>, "Hui Pu" <Hui.Pu@gehealthcare.com>, "Thomas
 Petazzoni" <thomas.petazzoni@bootlin.com>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <linux-doc@vger.kernel.org>, <imx@lists.linux.dev>,
 <linux-arm-kernel@lists.infradead.org>,
 <linux-renesas-soc@vger.kernel.org>, <linux-amlogic@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-samsung-soc@vger.kernel.org>
To: "Maxime Ripard" <mripard@kernel.org>
X-Mailer: aerc 0.20.1
References: <20251119-drm-bridge-alloc-getput-drm_of_find_bridge-v1-0-0db98a7fe474@bootlin.com> <20251119-drm-bridge-alloc-getput-drm_of_find_bridge-v1-6-0db98a7fe474@bootlin.com> <hs44z4b2dgisemuewgtvl4epjcqqilg6cy36po25pubaog4hmq@33qgl4o3hwoa> <DEH2CVQV21Z2.25PJBAQAKFJSG@bootlin.com> <20251201-thick-jasmine-oarfish-1eceb0@houat> <DEVKQWH8GU0D.2NWQ1U7IOIEHI@bootlin.com> <DEW6XHD12EY4.1THDR9UMJOTAN@bootlin.com> <20251215-mottled-dexterous-marmot-c69ad3@penduick> <DEYUNHVYCKYJ.2HU878WBYCJMV@bootlin.com> <20251216-cute-bandicoot-of-authority-3c492a@penduick>
In-Reply-To: <20251216-cute-bandicoot-of-authority-3c492a@penduick>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251216_083629_197532_D026A7AB 
X-CRM114-Status: GOOD (  20.17  )
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

Hi Maxime,

On Tue Dec 16, 2025 at 2:49 PM CET, Maxime Ripard wrote:
[...]
>> Not sure why, but it's taking a while before I grasp your ideas about th=
is
>> series and meld them with mine. I hopefully got a clear POV now, so base=
d
>> on it my plan is to rework this series to:
>>
>>  * keep drm_of_find_bridge() but renamed to of_drm_get_bridge(), and kee=
p
>>    patches 1-5 (with the changes suggested by you and Louis, nothing big
>>    and all already sent in v2)
>
> I don't think we should use that name, but on principle, yes.

OK about the rename. I just had sent this email before you requested the
rename. v3 is in the works with the of_drm_find_and_get_bridge() name.

>>  * not add devm_drm_of_find_bridge()
>
> Yep.
>
>>  * add next_bridge pointer to struct drm_bridge and call
>>    drm_bridge_put(bridge->next_bridge) in __drm_bridge_free, document it
>
> We don't have to at this point, you can add next_bridge to the
> drm_bridge pointer if you want, but I don't consider it a prerequisite.
> If we don't we would have to create drm_bridge_funcs->destroy
> implemnentations to give up the driver pointer reference though. Your
> call.

There's a destroy finc already, so I'm adding the next_bridge pointer in v3
along with some driver conversions, including one where the destroy hook is
needed.

>>  * convert patches 7-26 to use bridge->next_bridge where applicable,
>>    or to do something different when needed
>
> Depending on your decision above, we'd need to either convert them to
> use drm_bridge->next_bridge or create a destroy hook for them. Either
> way is fine for me.
>
>>  * maybe remove part of patches 7-26 just to reduce spam and rework effo=
rt
>>    in case of further iterations, to send them separately once the appro=
ach
>>    is accepted
>>
>> Does it look OK?

Cool, thanks for acking. v3 is just a testing round away from being sent.

Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

