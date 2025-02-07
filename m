Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAC0AC02194
	for <linux-mediatek@archiver.kernel.org>; Fri,  7 Feb 2025 20:31:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=e40Jc1bncfnnok4EoMl4mL/cKzNvltZ9PFkWvtOtsvw=; b=y3Z8xElcYdeXDDG0FjXSY0YSCY
	7jMqOwqmUhMYv2NfqHV/ok6fWF6kTH1x4ez9ez4R2iYcuZcb5BJYlNHChtQb7+j9AgFjfixi69RY2
	teXwNABflQaG5pJh2/7jN7OqJOMusPqKG+DWGUHau+wK99dF+FP3+Lqc99A5cGRVZvfwMdDQsB6kF
	ez/LXemEGdBExmCW9NVCfGtXCBiCcPX4KlJZ0IH0Au7e4h8dJK2SVsUi5ug5LC7k8bXjVOw8zd/R5
	Vj274L16o3U0PDwNeEgBw7j07ZbEQC+QkJZ9SYWcGEZ6JrykQk3fUjS9kvl8b5g+OUdk4fWpQomdh
	NBV3gpEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgV0a-0000000B6eE-3SRg;
	Fri, 07 Feb 2025 20:31:28 +0000
Received: from fout-a5-smtp.messagingengine.com ([103.168.172.148])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgV0X-0000000B6a8-2MHk
	for linux-mediatek@lists.infradead.org;
	Fri, 07 Feb 2025 20:31:27 +0000
Received: from phl-compute-06.internal (phl-compute-06.phl.internal [10.202.2.46])
	by mailfout.phl.internal (Postfix) with ESMTP id 392F213801F7;
	Fri,  7 Feb 2025 15:31:22 -0500 (EST)
Received: from phl-frontend-02 ([10.202.2.161])
  by phl-compute-06.internal (MEProxy); Fri, 07 Feb 2025 15:31:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fluxnic.net; h=
	cc:cc:content-type:content-type:date:date:from:from:in-reply-to
	:message-id:mime-version:reply-to:subject:subject:to:to; s=fm3;
	 t=1738960282; x=1739046682; bh=e40Jc1bncfnnok4EoMl4mL/cKzNvltZ9
	PFkWvtOtsvw=; b=cdx3OY+cqA2vkEO9Sgt7jFDFuo1yo2jbniZ4BYFRc3Pt3ewx
	E6+VGw/RxBzkGwKR2KL3QZ2IM9CZR6U54mmrBKootRB4JN5URJ05/XvC/FNNqx8q
	J+em7tNwNDz8aBdtexLncNKXHDHnHZOdugzCShYW3jYhLulrhFskXL5S3eJbhZcB
	hTajvtF5n6/Hj5EUd6OpZcfa0vWFvpqV6n/XuR6xQ3Tnz1tmYIiE8DXQxCNNp8dc
	T6wz/iX5LOcUaZjxrpe9wEjvDEkcUizMiOAfTXil4eHKWrTUl45ihVHYA6I+MuO5
	M2LSoiBMzdvtZJjMMXsj8/whAC67IS7bwqEdaA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:message-id
	:mime-version:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1738960282; x=
	1739046682; bh=e40Jc1bncfnnok4EoMl4mL/cKzNvltZ9PFkWvtOtsvw=; b=A
	xdWMWsGFdbUZR/7KI105Ba0HUhcYtppZDbLYL2X6hqvsAUovaAra7S2j8UlSlK9G
	My4ZMLgs58e0pZvQ7Px1+hBr50eoPzY+6oJMPRWVjxs9JtNJEbKV6aYis0hCY/Hj
	tkd0k/c9mXXFPajUCg4ZgMzubWjAfeteykYzlH+/o2h/5/h6BvKBI9zYcxGEVJlf
	RIIuI3qMdEkJ8XfUSZJJCEBOOZOf+A5iKyb/QQMGkuGjxth/EwLrp1nlfoRlJqdQ
	Z7vdfXDtywdf6CQkNV18yVABBqetBg6vLCc7yvQO+3/V6/3O7msh3PoprwNUT/kz
	WgfAZcnM9RHl5cHpQ8MnQ==
X-ME-Sender: <xms:mW2mZ3DL_yeDTRkYP8a030j8lNinjT7vlYBTLqBb4BvkPpki35aY4Q>
    <xme:mW2mZ9ha5su5wY_ur-e7dUg7Jgp7VToi3SfrJAki_Y9xTJaWygGqx_aGP-JpE6hJ4
    giqUe8Sc6vRQankSnE>
X-ME-Received: <xmr:mW2mZykWM81lbmfZe97zbsya5_gMJlXFq_MDPgN1jqZ2KYxP4TIuP4MUPK1lbEcZZ9o0fe_lxKtrCfUUSx24aKH0uyRCbaJzcsPxmbtfXMTV2Bgx0Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdeftddvhecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfggtgesthdtredttddtvdenucfh
    rhhomheppfhitgholhgrshcurfhithhrvgcuoehnihgtohesfhhluhignhhitgdrnhgvth
    eqnecuggftrfgrthhtvghrnhephefhheduieehlefghfelueetgeeggeejgeefgeduteeh
    ueffffeuieefleetvedvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrg
    hilhhfrhhomhepnhhitghosehflhhugihnihgtrdhnvghtpdhnsggprhgtphhtthhopeeg
    pdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehnphhithhrvgessggrhihlihgsrh
    gvrdgtohhmpdhrtghpthhtohepuggrnhhivghlrdhlvgiitggrnhhosehlihhnrghrohdr
    ohhrghdprhgtphhtthhopehlihhnuhigqdhmvgguihgrthgvkheslhhishhtshdrihhnfh
    hrrgguvggrugdrohhrghdprhgtphhtthhopehlihhnuhigqdhpmhesvhhgvghrrdhkvghr
    nhgvlhdrohhrgh
X-ME-Proxy: <xmx:mm2mZ5yxWIUGvKJTBZtcdBPRpz4-40ljlWkcz2wmj40QumaK0KlLeQ>
    <xmx:mm2mZ8SLabZWlR2xA2BKzYp1MjyzSTo_1n__lxfiwL1WV1mVzRQxxg>
    <xmx:mm2mZ8Y2GdAKHm3rpSWo4X8k6yY174ejLOmcYQQr07pFKDaDqOPXEQ>
    <xmx:mm2mZ9THF-fi6FaGAKkyD8Zj9V4eikr19d-M31Y0J_eOXLJ1Pv0CHA>
    <xmx:mm2mZyP9wnHBUDGVDqgjJ2L8A30j7jxrKO1cMaBG8Je7s65K2P7TkMo0>
Feedback-ID: i58514971:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 7 Feb 2025 15:31:21 -0500 (EST)
Received: from xanadu (unknown [IPv6:fd17:d3d3:663b:0:9696:df8a:e3:af35])
	by yoda.fluxnic.net (Postfix) with ESMTPSA id E2CC61008D93;
	Fri,  7 Feb 2025 15:31:20 -0500 (EST)
Date: Fri, 7 Feb 2025 15:31:20 -0500 (EST)
From: Nicolas Pitre <nico@fluxnic.net>
To: linux-pm@vger.kernel.org, linux-mediatek@lists.infradead.org, 
    Daniel Lezcano <daniel.lezcano@linaro.org>
cc: Nicolas Pitre <npitre@baylibre.com>
Subject: [PATCH] dts: arm64: mediatek: mt8188: add more thermal trip points
Message-ID: <696pn9r7-63r9-r2pp-rq18-471269pss1nr@syhkavp.arg>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250207_123126_267327_84FA1035 
X-CRM114-Status: UNSURE (   5.49  )
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

From: Nicolas Pitre <npitre@baylibre.com>

Provide the "switch on" thermal trip point to be used by the power
allocator governor.

Signed-off-by: Nicolas Pitre <npitre@baylibre.com>

diff --git a/arch/arm64/boot/dts/mediatek/mt8188.dtsi b/arch/arm64/boot/dts/mediatek/mt8188.dtsi
index 338120930b..262eab8fd3 100644
--- a/arch/arm64/boot/dts/mediatek/mt8188.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8188.dtsi
@@ -472,6 +472,12 @@ cpu-little0-thermal {
 			thermal-sensors = <&lvts_mcu MT8188_MCU_LITTLE_CPU0>;
 
 			trips {
+				cpu_little0_switch_on: trip-switch-on {
+					temperature = <68000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
 				cpu_little0_alert0: trip-alert0 {
 					temperature = <85000>;
 					hysteresis = <2000>;
@@ -510,6 +516,12 @@ cpu-little1-thermal {
 			thermal-sensors = <&lvts_mcu MT8188_MCU_LITTLE_CPU1>;
 
 			trips {
+				cpu_little1_switch_on: trip-switch-on {
+					temperature = <68000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
 				cpu_little1_alert0: trip-alert0 {
 					temperature = <85000>;
 					hysteresis = <2000>;
@@ -548,6 +560,12 @@ cpu-little2-thermal {
 			thermal-sensors = <&lvts_mcu MT8188_MCU_LITTLE_CPU2>;
 
 			trips {
+				cpu_little2_switch_on: trip-switch-on {
+					temperature = <68000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
 				cpu_little2_alert0: trip-alert0 {
 					temperature = <85000>;
 					hysteresis = <2000>;
@@ -586,6 +604,12 @@ cpu-little3-thermal {
 			thermal-sensors = <&lvts_mcu MT8188_MCU_LITTLE_CPU3>;
 
 			trips {
+				cpu_little3_switch_on: trip-switch-on {
+					temperature = <68000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
 				cpu_little3_alert0: trip-alert0 {
 					temperature = <85000>;
 					hysteresis = <2000>;
@@ -624,6 +648,12 @@ cpu-big0-thermal {
 			thermal-sensors = <&lvts_mcu MT8188_MCU_BIG_CPU0>;
 
 			trips {
+				cpu_big0_switch_on: trip-switch-on {
+					temperature = <68000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
 				cpu_big0_alert0: trip-alert0 {
 					temperature = <85000>;
 					hysteresis = <2000>;
@@ -658,6 +688,12 @@ cpu-big1-thermal {
 			thermal-sensors = <&lvts_mcu MT8188_MCU_BIG_CPU1>;
 
 			trips {
+				cpu_big1_switch_on: trip-switch-on {
+					temperature = <68000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
 				cpu_big1_alert0: trip-alert0 {
 					temperature = <85000>;
 					hysteresis = <2000>;

