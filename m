Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09AEBD41D52
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 Nov 2024 05:22:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=T8vtAQAqsNp8BhMHJmTbGaRORBcsj6rH9xgRT7jiOQo=; b=uH0SiYhTLpUXkKiuwyz6z/4+JP
	aKq7uyMPwgL0c2S/IRjCx9JYfka3VZLVbXUsnCobuopgr+so7g5of0tVAjt8zZYOxkL7yFKTFm8jj
	r4aDChqi4g5eIrNEUnCxOMG8W3S7Tbr67AGT1I/9NxvVyjz1kcC6Imy7CtL3UYDqjn3ZFUyq+rLPp
	4DlFpCOWL2onaV+OkcmCXmzsuhVEMujtKIMtCexYiBoPSJI0sop09RwTNSpsGmNB1ms5kbbtApIbt
	TaCwlPTx6AEMXvSQtWRp00GMVoE+/tbmtS4arcDmKilpm7Nc0ZTxxbj48caXxk8Ja0z2pmChwjH37
	G6HFsFDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAjM5-00000002F4p-3iNQ;
	Tue, 12 Nov 2024 05:22:21 +0000
Received: from fhigh-a7-smtp.messagingengine.com ([103.168.172.158])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAjM1-00000002F2j-2vsB
	for linux-mediatek@lists.infradead.org;
	Tue, 12 Nov 2024 05:22:19 +0000
Received: from phl-compute-04.internal (phl-compute-04.phl.internal [10.202.2.44])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 5B5D211401D2;
	Tue, 12 Nov 2024 00:22:15 -0500 (EST)
Received: from phl-frontend-02 ([10.202.2.161])
  by phl-compute-04.internal (MEProxy); Tue, 12 Nov 2024 00:22:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fluxnic.net; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to; s=2016-12.pbsmtp; t=1731388935; x=1731475335; bh=T8vtAQAqsN
	p8BhMHJmTbGaRORBcsj6rH9xgRT7jiOQo=; b=gteDu0WRZ95+JytpNHsUuMZYo5
	BxNrBHA+l/YHdmV8dEQJIOLjmFtsKs+PwMwk24b2p4fUWA1+oLeS7VSjuyX1ARlZ
	ZDNvHyi16r4Sl1j52PcX8XfVrh7+qjY0MlJLlTZ0EPFPQoaj6aVs0jq9YoyTX+ba
	TwfwpjMHeyn440q0I=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pobox.com; h=cc
	:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to; s=fm2; t=1731388935; x=1731475335; bh=T8vtAQAqsNp8BhMHJmTbG
	aRORBcsj6rH9xgRT7jiOQo=; b=d529lF+HOvHCkqPTJ1IeRnWu0u/LyJkQlHNan
	e4PZsCaYjchFUUOIoK6Z8n72ejN3oPwG4iabKjmCpKBJs4rg66Zq3MUy4S7iVNXD
	QDdYUQEHOm0zTUP/FOQzyHUatxXaAecFh40UGdnsaALxBtNnEvwx+yyqEjdeAF0e
	XX061RA3l8NRXeM58i0U5otSMmPcoDmeL2H2df8oaUBhLmn+uLq7fqoKvI2AcM87
	iijAI8nsRIgItnnRrUP4M/z3r70zBd0iYePNHOkO+fHlbqx3xDUn/mtRoFHdtTf8
	Xc3BozpraI/D7Sh9hMGN0iCW0pT7Q7PHjHxZyG8WcfYn66XpA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1731388935; x=1731475335; bh=T8vtAQAqsNp8BhMHJmTbGaRORBcsj6rH9xg
	RT7jiOQo=; b=a61xleSI1uHpLdcLMxyU4OlTUS6W3HyLgpYgIApeITJ/YWGLlw3
	TzhzCTGlNQoJCPSJcugBqymAf50bsgf4Dp/AaRk6JK+yZeOvJKVh4k0C+Z1ixvYH
	ZpaPf6SJ4HXjUv901iLH2ry3TC6CgG6bSISIFZVm9Krvcud14dGf1UkqBug6PeCA
	GOoZkXZ8GteUIDDGHqLUVwrrTto8DJsgxgZGhLVNht1bPvFHgQwYBbdrX6DqXW9E
	nXjqEdYbDagczpJxNIHGHuzc/xbQk4Vi9gnYfjn+eTuoMHFJc6hk0V/amVxMl9g4
	EgP8hywPlVQOl+GpXLojFj/GJmU6SJ6HSHA==
X-ME-Sender: <xms:BuYyZxANIpGG366ga0go0Eg124PbBO0V9ONuaWkyDRPDahheJaF6iQ>
    <xme:BuYyZ_gL8pVlUVf7cfTUs-8LwqfrPqyBmFcizxuCo_Iikz_YAYWUXd7e4vws03rcX
    U0jrQvdxMoFM0fUTeQ>
X-ME-Received: <xmr:BuYyZ8lA0F7q-cL92FOor9sepnynixgIcW2QYoc-o8y6tRfM_kDJNf-sqlKCv9XQi__1sNBJFWduXJvPZASboUJmCkwC-m1owEK_bv0lNgUG1XK2pQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrudefgdekvdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdpuffr
    tefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnth
    hsucdlqddutddtmdenucfjughrpefhvfevufffkffoggfgsedtkeertdertddtnecuhfhr
    ohhmpefpihgtohhlrghsucfrihhtrhgvuceonhhitghosehflhhugihnihgtrdhnvghtqe
    enucggtffrrghtthgvrhhnpeduhfdvlefggeeugfejiefgtdekjeehkeevveegiedtledv
    iefhveefteffieegkeenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsth
    gvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepnhhitghosehflhhugihn
    ihgtrdhnvghtpdhnsggprhgtphhtthhopeekpdhmohguvgepshhmthhpohhuthdprhgtph
    htthhopegrsggrihhlohhnsegsrgihlhhisghrvgdrtghomhdprhgtphhtthhopehnphhi
    thhrvgessggrhihlihgsrhgvrdgtohhmpdhrtghpthhtoheprhgrfhgrvghlsehkvghrnh
    gvlhdrohhrghdprhgtphhtthhopegurghnihgvlhdrlhgviigtrghnoheslhhinhgrrhho
    rdhorhhgpdhrtghpthhtoheplhhinhhugidqmhgvughirghtvghksehlihhsthhsrdhinh
    hfrhgruggvrggurdhorhhgpdhrtghpthhtohepuggvvhhitggvthhrvggvsehvghgvrhdr
    khgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrh
    drkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqphhmsehvghgvrhdrkhgv
    rhhnvghlrdhorhhg
X-ME-Proxy: <xmx:BuYyZ7yXD8WZswjtbU0h_VFj2gjGtGtUEHpKGdvAcaxk3AG4bm8cqA>
    <xmx:BuYyZ2RHig_-Ltt_0Jpb9AwBzFWiOgWvfNi8x-hu6EXuYl0dvbcjPw>
    <xmx:BuYyZ-bZGuNfcOQYEyVUtktomUm6qfVK3404JWvqGsGP2g0DXolxSg>
    <xmx:BuYyZ3T82Jg8vHUk4tgmcak7dBAsHz2JQdiU0W7dWKDW4j3i-1-KBA>
    <xmx:B-YyZ38faoY5f7NewUnWfE8v-nwI3FKUu_kiUp6hYPpe5fP-BwV-eX-6>
Feedback-ID: i58514971:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 12 Nov 2024 00:22:14 -0500 (EST)
Received: from xanadu.lan (OpenWrt.lan [192.168.1.1])
	by yoda.fluxnic.net (Postfix) with ESMTPSA id C521FECB7FC;
	Tue, 12 Nov 2024 00:22:13 -0500 (EST)
From: Nicolas Pitre <nico@fluxnic.net>
To: Daniel Lezcano <daniel.lezcano@linaro.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	linux-pm@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Nicolas Pitre <npitre@baylibre.com>,
	Alexandre Bailon <abailon@baylibre.com>
Subject: [PATCH 0/5] thermal: multi-sensor aggregation support
Date: Tue, 12 Nov 2024 00:19:37 -0500
Message-ID: <20241112052211.3087348-1-nico@fluxnic.net>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241111_212218_232667_36E379CE 
X-CRM114-Status: UNSURE (   6.76  )
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

This series provides support for thermal aggregation of multiple sensors.
The "one sensor per zone" model is preserved for all its advantages.
Aggregation is performed via the creation of a special zone whose purpose
consists in aggregating its associated primary zones using a weighted
average.

Motivation for this work stems from use cases where multiple sensors are
contained within the same performance domain. In such case it is preferable
to apply thermal mitigation while considering all such sensors as a whole.

Previous incarnation by Alexandre Bailon can be found here:
https://patchwork.kernel.org/project/linux-pm/cover/20240613132410.161663-1-abailon@baylibre.com/

diffstat:
 .../bindings/thermal/thermal-zones.yaml       |   5 +-
 arch/arm64/boot/dts/mediatek/mt8195.dtsi      | 210 +-----
 drivers/thermal/Kconfig                       |  27 +
 drivers/thermal/thermal_core.c                | 643 ++++++++++++++++++
 drivers/thermal/thermal_core.h                |  14 +
 drivers/thermal/thermal_of.c                  |  86 ++-
 6 files changed, 780 insertions(+), 205 deletions(-)

