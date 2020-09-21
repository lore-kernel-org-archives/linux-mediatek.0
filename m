Return-Path: <SRS0=GXkz=C6=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D4B3C43463
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Sep 2020 04:14:56 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E860B2078D
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Sep 2020 04:14:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="v0t7MPBc";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Ax8vlAeB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E860B2078D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ShtsjDj1RtKKfNTd+ivyv7BbQKdkTZDhWxxu0opRcIw=; b=v0t7MPBcrjcDVUCo7ttiTUu0AC
	7yx109Dj54+R8YVlCZbqpgI4ceaWXnlaSvRyE+q22BOnBhE62+XxnBV75U3ZXIPrcF0xdwa/OJ9DP
	58BMJytBiXAdleWyHMGyJRbIm0317lC4IaEMMBnotPTKB1UlAjc+Cg3QISDPHYzyOliHa7972J6+F
	A5fCx2AbEiOJEVQi6v0hDE/LvDwmmR4AjLdRF1xF6YKq0NU1ed+v1IqsGDm/iqMfqjJ2dI8chqZx/
	qG4L5mwQmnDmBfSoaYDnMu4aX3mwBrZstUUImomUHG1dQcxHvM/5EJD9uuru4NCtP2R6+PN4MZtCa
	4FfrzGJA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kKDDx-00071k-GF; Mon, 21 Sep 2020 04:14:45 +0000
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kKDDt-00070N-7Q
 for linux-mediatek@lists.infradead.org; Mon, 21 Sep 2020 04:14:42 +0000
Received: by mail-pf1-x443.google.com with SMTP id k8so8168426pfk.2
 for <linux-mediatek@lists.infradead.org>; Sun, 20 Sep 2020 21:14:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=v7829AfRT6LvbLjz9XeDro4FUjlC8JvfoISGdbWocU0=;
 b=Ax8vlAeB60K7VxwqjgTm+4y+YjZoqTXAE/+iKq0Gl6phrxj06l4z/57g70tDMdKRnt
 P6f8T6MarPu6KuZv6/zdMpnalFdkdizCNkyMPmLLnYT6jLPMZnFtTsG9+Rsfez/TE70I
 xa/ooqfmxB0pDSrrcWDkVI8TmbOoiYZAg5l74=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=v7829AfRT6LvbLjz9XeDro4FUjlC8JvfoISGdbWocU0=;
 b=dKx+WZH3WqkXJz67oaaXtgLEICSErugw/rPt0oovMYY3VA5tbmGJa1fK6btrymRRW4
 1nR906to4awD6CpFuMcRfDZRwTUS5eJSTKjg/fWRN0RSfV5bNNXhT1TNHpEvDQ8zXeDq
 XStOPGN68cRVkoWKQX4gSSedc9Fp+P61vmfdiKDxP6qurfWYLdkMkmPcCymV2Mg3GEHI
 0NwB45t3UYvTq7QsrVoMdsSkWZ26e4nJGrjusLaxVX77qEG9nxn7VUBPI9jVuF/u9tqb
 elyiYaUo6xyXC21SXOy0bj+2sKJl7VkmBWsyFSVWHcR7UCt80GrxqiO95A5ErPN/Vdp7
 ipeA==
X-Gm-Message-State: AOAM533JsZD/Dg7s3oKY8Lg3nUhxxymjEVhbySpz6hHgaeTLiIOf97NF
 nXDdjQmw5YbBCvNj6JHg2/8mYA==
X-Google-Smtp-Source: ABdhPJxF2RiligLadfSfXIzQiHaHina12UJBS42E0zRZ9Ka91X39OXKvsPKp2DU/FWZ/lS6FAXuDog==
X-Received: by 2002:a63:6782:: with SMTP id
 b124mr37636930pgc.308.1600661676013; 
 Sun, 20 Sep 2020 21:14:36 -0700 (PDT)
Received: from drinkcat2.tpe.corp.google.com
 ([2401:fa00:1:b:7220:84ff:fe09:41dc])
 by smtp.gmail.com with ESMTPSA id m13sm10439167pfk.103.2020.09.20.21.14.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 20 Sep 2020 21:14:35 -0700 (PDT)
From: Nicolas Boichat <drinkcat@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>
Subject: [RFC PATCH] arm64: dts: mt8183: Add arm,no-tick-in-suspend
Date: Mon, 21 Sep 2020 12:14:24 +0800
Message-Id: <20200921121420.RFC.1.I30d6887e950575eb1fd92ee56ab5d50ff64c97f3@changeid>
X-Mailer: git-send-email 2.28.0.681.g6f77f65b4e-goog
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200921_001441_295082_539291F1 
X-CRM114-Status: GOOD (  14.80  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, Feng Tang <feng.tang@intel.com>,
 Nicolas Boichat <drinkcat@chromium.org>, Stephen Boyd <sboyd@kernel.org>,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 John Stultz <john.stultz@linaro.org>, linux-mediatek@lists.infradead.org,
 Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

The armv8-timer on MT8183 (kukui family) actually ticks in suspend,
but its precision is so low (measured 400+ ppm -- 35 seconds/day)
that it's actually better to use a fallback option (RTC).

Signed-off-by: Nicolas Boichat <drinkcat@chromium.org>
---
We asked MTK if there is anything that can be done to make the
archtimer more precise in suspend, but that does not seem to
be possible.

Ideally we'd like a arm,tick-in-suspend-but-use-something-else-if-possible
property, but the rating in [1] cannot be used, as the RTC
fallback is handled separately [2].

I don't know if this kind of issues happened in the past, one
possible compromise is to add the option to kukui board only,
since we _know_ there is an RTC there (which, technically, may
not be the case on every single MT8183 platform).

A more complete solution would involved quite a bit of
refactoring in the timekeeping/rtc framework.

[1] https://elixir.bootlin.com/linux/v5.8/source/kernel/time/clocksource.c#L486
[2] https://elixir.bootlin.com/linux/v5.8/source/kernel/time/timekeeping.c#L1693

 arch/arm64/boot/dts/mediatek/mt8183.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8183.dtsi b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
index f9b60e3d085c..ebcb2309017d 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
@@ -219,6 +219,7 @@ timer {
 			     <GIC_PPI 14 IRQ_TYPE_LEVEL_LOW 0>,
 			     <GIC_PPI 11 IRQ_TYPE_LEVEL_LOW 0>,
 			     <GIC_PPI 10 IRQ_TYPE_LEVEL_LOW 0>;
+		arm,no-tick-in-suspend;
 	};
 
 	soc {
-- 
2.28.0.681.g6f77f65b4e-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
