Return-Path: <SRS0=DUBy=CQ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15935C43461
	for <linux-mediatek@archiver.kernel.org>; Mon,  7 Sep 2020 10:33:45 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 996FE2168B
	for <linux-mediatek@archiver.kernel.org>; Mon,  7 Sep 2020 10:33:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="0EEw03F5";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="S+SylMyZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 996FE2168B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=D7m6GYQlj16Ime1ESxuic7fKvnkK5T857juLlpYVGDo=; b=0EEw03F5h2eYPbFAnHvUbcix6
	dl42yBDOHAaf2NI/GR6G2t0PBgIEjJVjq2nC1a8uRjAQWlBcUi4EA4awvQIlrwj9PjAfUTlZ1VTZ5
	GRp1buqIh2J5qBUXZzIOQ/UP+zb+87lGlSjKlBPl8WNZ/X+lQn5g1gQRaXh9Lb08koSOOAthSMtb6
	Er74+n0tqs59zNf9kUhOqybtc2ErtZDGLro4hVZHuv+ZD48ivK0SHycz64/G0qZmHUOTzefZ9yyBO
	ja4IlgGGeDf+FhqMHK05P3Vv5hUE/tzl78xLIRrpBDDdeP/IoPCjrNRAs3wYUZ8j5LaJRcC5288U7
	+yIgI98Uw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kFESq-0006MK-OD; Mon, 07 Sep 2020 10:33:32 +0000
Received: from mail-wr1-f67.google.com ([209.85.221.67])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kFESg-0006HZ-Iw
 for linux-mediatek@lists.infradead.org; Mon, 07 Sep 2020 10:33:24 +0000
Received: by mail-wr1-f67.google.com with SMTP id m6so15291479wrn.0
 for <linux-mediatek@lists.infradead.org>; Mon, 07 Sep 2020 03:33:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=v6ekjVHHl1G5/D6z3ZhBAoRFnwR5DCyzrgYRrKEa25I=;
 b=S+SylMyZpxmwj4mcBT7WTpiH4GLTdETsmC8lnnqcV4yWPz9wdM+1FkxdtJGuf0lEom
 5LjDGUu4pGsEvEVxcoKGTpTol8BoCTPV97HmKUVuRZt1RsYIImDXn9IpV7Sm3su+iAp5
 FIZDpMp5RxvK/q4KDp3r/Guo3zcIjmsahtl4pc/xofKvZ7r4d7kHi0fpa0YVvCNnBzZE
 zxl58uQjCVd7O+V0eKxDveuMSvxlEgdzJrdE1ceWNom1zI//PNBZG6YAoci7KRPAoUa5
 Pgza/wBQ7PNpjcrJc6k4q0t0vkGepZKhTwmBEr+XnYrn8eJRKXPkzBLj51XwCyGcSM/1
 gYWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=v6ekjVHHl1G5/D6z3ZhBAoRFnwR5DCyzrgYRrKEa25I=;
 b=E8ojiynjG62J3hkJbPMy7DstQ6pqto1u/bwIMbWnEHkVVhNCixXSyHKnqDhwJSzTOB
 D9f7mihJlxMZTT9pCpbLBgliHjAvs1j8Mo02HHg2pq9aHLehRGQwoXBnnVMNAi9sl+rV
 jLGkD4WnnbbWNEiTY55sJWvPfftejgtZTeHE/TSW1MxVBWotCowAr01zPQtV3yNZ4HYI
 WXhrhGhZ+i64/jat53Rc5Vh4Ie3NHlWNJs8+r/mvUxC+LYtPFh6/2yLqCG2AfPV+8lt4
 wPNz0+5d0YmjfYgHjAwbvYL1QI6kM1QOqNlfU/KB3ud3sADbL1irNEJdQ+dSKBOzb7gJ
 rljg==
X-Gm-Message-State: AOAM533A4ulDfB4NFE3APyZQEwYqZXhJpZzNmAHu4je/i+nSloN2ntsW
 RbhUrDEbAu6Eyf9deOe/P1rwqQ==
X-Google-Smtp-Source: ABdhPJwjKwQllFn+saBynC/VhmE+K/Vf8TiG/Xr793krk5Bv4hodlaR5hg661i9gmKlUh6jMQ4lS2Q==
X-Received: by 2002:a5d:458e:: with SMTP id p14mr21107466wrq.61.1599474801341; 
 Mon, 07 Sep 2020 03:33:21 -0700 (PDT)
Received: from localhost.localdomain (122.105.23.93.rev.sfr.net.
 [93.23.105.122])
 by smtp.gmail.com with ESMTPSA id i1sm32395936wrc.49.2020.09.07.03.33.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Sep 2020 03:33:20 -0700 (PDT)
From: Fabien Parent <fparent@baylibre.com>
To: linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-input@vger.kernel.org
Subject: [PATCH v5 2/3] dt-bindings: input: mtk-pmic-keys: add MT6392 binding
 definition
Date: Mon,  7 Sep 2020 12:33:10 +0200
Message-Id: <20200907103311.1601907-2-fparent@baylibre.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200907103311.1601907-1-fparent@baylibre.com>
References: <20200907103311.1601907-1-fparent@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200907_063322_691276_31DDA065 
X-CRM114-Status: GOOD (  13.62  )
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
Cc: Rob Herring <robh@kernel.org>, dmitry.torokhov@gmail.com,
 Fabien Parent <fparent@baylibre.com>, robh+dt@kernel.org,
 matthias.bgg@gmail.com, lee.jones@linaro.org, hsin-hsiung.wang@mediatek.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add the binding documentation of the mtk-pmic-keys for the MT6392 PMICs.

Signed-off-by: Fabien Parent <fparent@baylibre.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---

v5:
	* rebased
	* Rename MT6397/MT6392/MT6323 into MT63XX to make it more readable when
	  the list of support PMIC increase
	* Removed Reviewed-by from Rob Herring because of the new extra changes
	  made to this patch
	* change the compatible for MT6392 to also contains MT6397 since MT6392 PMIC
	  key driver is compatible with mt6397.

v4:
	* Patch was previously sent separately but merge to this patch series
	  since there is a hard dependency on the MFD patch.

---
 .../devicetree/bindings/input/mtk-pmic-keys.txt     | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/input/mtk-pmic-keys.txt b/Documentation/devicetree/bindings/input/mtk-pmic-keys.txt
index 535d92885372..71c82687ab92 100644
--- a/Documentation/devicetree/bindings/input/mtk-pmic-keys.txt
+++ b/Documentation/devicetree/bindings/input/mtk-pmic-keys.txt
@@ -1,15 +1,18 @@
-MediaTek MT6397/MT6323 PMIC Keys Device Driver
+MediaTek MT63xx PMIC Keys Device Driver
 
-There are two key functions provided by MT6397/MT6323 PMIC, pwrkey
+There are two key functions provided by MT63xx PMIC, pwrkey
 and homekey. The key functions are defined as the subnode of the function
-node provided by MT6397/MT6323 PMIC that is being defined as one kind
+node provided by MT63xx PMIC that is being defined as one kind
 of Muti-Function Device (MFD)
 
-For MT6397/MT6323 MFD bindings see:
+For MT63xx MFD bindings see:
 Documentation/devicetree/bindings/mfd/mt6397.txt
 
 Required properties:
-- compatible: "mediatek,mt6397-keys" or "mediatek,mt6323-keys"
+- compatible: Should be one of:
+	- "mediatek,mt6323-keys" for MT6323 PMIC
+	- "mediatek,mt6392-keys", "mediatek,mt6397-keys" for MT6392 PMIC
+	- "mediatek,mt6397-keys" for MT6397 PMIC
 - linux,keycodes: See Documentation/devicetree/bindings/input/input.yaml
 
 Optional Properties:
-- 
2.28.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
