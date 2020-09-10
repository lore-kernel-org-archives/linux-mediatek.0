Return-Path: <SRS0=yNvG=CT=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4265C43461
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Sep 2020 05:47:07 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 45B7D20756
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Sep 2020 05:47:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="y06gEnlX";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ni0hwv4S"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 45B7D20756
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=8lWbTbPH7z45qInXxoEPrbNeBvwhObwdsk/44lWL5Wc=; b=y06gEnlXaVe39WowHJYZJyXVX
	85XyKRDk1y1Lny0NPusHqqu9hzz1GaOPyqmIynSrBjr0TbWW2tFRHNMEjjqZz6k3HOnX8jOSNUXLg
	N4P21ldbWM2Rj0KTfPVazIzsI8ynsHHw5CjizvSBTh62iDAyFkM5Fgjt4hK2wF0KOKpuugkqVQ+1T
	QwtMv+V0tWkxb0SK4mLe1WFDRK/97qQNrO4E8Scgl/6Oi+3ipwv1wA/iAa03IT4fxHD+ZVfkNjY+y
	E7/SGCaT79kCelIszLmHBnJceU3IWggxWJtv3ymsguyT6IHcElj8c2lWqiZ5ImtEQXyR5DQ8UEnx9
	myU4GNKqQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kGFQA-0007Gi-WF; Thu, 10 Sep 2020 05:46:59 +0000
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kGFQ2-0007E6-Uy
 for linux-mediatek@lists.infradead.org; Thu, 10 Sep 2020 05:46:51 +0000
Received: by mail-pg1-x542.google.com with SMTP id t14so3625153pgl.10
 for <linux-mediatek@lists.infradead.org>; Wed, 09 Sep 2020 22:46:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KtxeUWrBvMNP2Y8KaLxhs4rPoG0ZGE6ZXep9roUJTTI=;
 b=ni0hwv4SK+Yn1AQHStWD0LBZvoGzYAHaoXq94POyX7VX4VhMHOifOOKEMHU1WZk6jf
 XvPb2j3qHc7XX6tzQW6QGyUWHeXwi8sgXsmtUpj2yEHoyXmVdFXwCpvZO/goxlAbmS6G
 MGXBH28wzofwKq4HSd0FhLCD5PVSHoIIWLrUA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KtxeUWrBvMNP2Y8KaLxhs4rPoG0ZGE6ZXep9roUJTTI=;
 b=NYcrVwArgvsvHo+Lim2t/5tKaqA3WavJUjh2+agz5T6dLyZXE0WUry/cvZKnn0CKEy
 Xmzy4WrRkBxuMx77efAVyLVoCZPMVf2sSmSP6blmS72/2Mua2IUTHOAl/szYjinl4G0L
 +XCOHFs8E5iVR4/LWtLChtzu7it6Sps+H7cVAxNB+e2brfrdWRy+O0BSzNNw21reXW0v
 Kftmqslaek7abYq4Jup7XloU7LJHXJJOffYXuscFpoAqlp9pGty24/cUfAvSpMEIQLaB
 /Xyii4XXvbEMRZ5QDzd5hA4H3SVynozzvdO4eSis9KRPForx2e9Ee6o08clxWc2cgmk7
 EPhQ==
X-Gm-Message-State: AOAM5333/DB/RqGJbMmdc9+/3+XGxLqvFNt1VZBL7aD9iBGkvDfX9ifi
 ANam6LFcC7oGAERmAfbFK+5TDNjLGh2wxLMJ
X-Google-Smtp-Source: ABdhPJyj1mfhyj/UVHKPgWsS2TbntfcsawXpCCu4tsBd/teTjIQtkGi104/d+aCaqRrrolJlbM9Ubg==
X-Received: by 2002:a65:5849:: with SMTP id s9mr3185543pgr.439.1599716806553; 
 Wed, 09 Sep 2020 22:46:46 -0700 (PDT)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:1a60:24ff:fe89:3e93])
 by smtp.gmail.com with ESMTPSA id r6sm4598159pfq.11.2020.09.09.22.46.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Sep 2020 22:46:46 -0700 (PDT)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: linux-mediatek@lists.infradead.org
Subject: [PATCH 2/2] arm64: dts: mt8183: kukui: Set uart0 to mmio32 iotype
Date: Thu, 10 Sep 2020 13:46:35 +0800
Message-Id: <20200910054635.3337487-2-hsinyi@chromium.org>
X-Mailer: git-send-email 2.28.0.526.ge36021eeef-goog
In-Reply-To: <20200910054635.3337487-1-hsinyi@chromium.org>
References: <20200910054635.3337487-1-hsinyi@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200910_014651_029335_7457EB23 
X-CRM114-Status: GOOD (  11.74  )
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Set uart0 iotype to mmio32 to make earlycon work with stdout-path.

Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
---
 arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi b/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
index f0a070535b340..f6991bdaac1c6 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
@@ -750,6 +750,8 @@ &u3phy {
 &uart0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&uart0_pins_default>;
+	reg-io-width = <4>;
+	reg-shift = <2>;
 	status = "okay";
 };
 
-- 
2.28.0.526.ge36021eeef-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
