Return-Path: <SRS0=1jDH=DY=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A327C433DF
	for <linux-mediatek@archiver.kernel.org>; Sat, 17 Oct 2020 15:39:20 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 89CEF2074A
	for <linux-mediatek@archiver.kernel.org>; Sat, 17 Oct 2020 15:39:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="IcJhzPWg";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="V+07PWg7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 89CEF2074A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=1Nh28rfMBRwW6E10Uv1IdYJpigZxm4grw+kHIQ1hVRs=; b=IcJhzPWgR3w5D9U+aE4V2kGYDT
	Wood5ZG0V0EfER8BsF2XgZhudsPlpe2w4uz7dkRrjcAuS/yuCg8uHXqxB7Be1EXpkj7kOwWztnRp6
	xcEtnwQBjg40fbVB1GWtWvAkk7gcGEgvAmYeaQEQ9aBVLpxtW6k2I1ChRFytBc+7o5tTVgjUYQHB/
	vZyFoTMKwaZNfL/KBSulw6Mgx3BkMErXbtK4tIt3si+S9LC8Pi8wHDVyaiCPEcterhc5w0V0Lw717
	hbC2M7CsEyVZ2CqJVYhgHOpG/9mSgaCNzBDec8n79JYHc3Ksu7jlJp2mB6WsEx9xyMg61+hFV4nKB
	shpw3zUQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kToIX-0003KX-MT; Sat, 17 Oct 2020 15:39:09 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kToIR-0003Iy-6E
 for linux-mediatek@lists.infradead.org; Sat, 17 Oct 2020 15:39:05 +0000
Received: by mail-wr1-x442.google.com with SMTP id e17so6702526wru.12
 for <linux-mediatek@lists.infradead.org>; Sat, 17 Oct 2020 08:39:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=S57koDeKUk9PDAYgtgQlZSy1LTrQ6sM1ZV8HODyjnuA=;
 b=V+07PWg7E3zcry2NI5Zrheb2Mam1kkLOYXJjko6l7ewkCpiSMFtjAMYK4i05qeUe+C
 n6Qi4SZ15TwwJHmm+V+QBYzoJb2cyQV3v3Q6Po4sW8dz3vLmfzros9JiQlFmIqCYYSyp
 hO69nJ+8GSt5elCZZMtUH1gqK9/lv0wGWQGDYuVygdPNABZEJQleNy0vpA9F3Jwc0/mS
 DBqo8fJ2QBn4uU/MqBHjrY36GuA5WJsXaaJC45RgfIdN1Liik3bI0goeN9Zv0PDSoPp8
 /PG9Vdyu6GV8OoBJyPtjFIeddef3oQbAYZqzgh89zXuikTma0a7CTiwawBsLPTTOFpjx
 39xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=S57koDeKUk9PDAYgtgQlZSy1LTrQ6sM1ZV8HODyjnuA=;
 b=QDLbI8YpQhWj9l9xRpW7WhLIuiyVG6cTPOfk5DL25fftzeh94VvVxlLBs31Rd0ZnHr
 dmjoDejfveSs7vUOt4gMn2WzQjxKSKbxmJRRkzcGiw7Jzm3qq5RJvdMnJGmtD8Alijqb
 V6DtkwHquv4ZYZb2RBMu/qN2C1kBjSSLWtibQBtVEqP+SEGCOik39eEwjRtOwY/SNyNa
 jnT97Hny/TfrHcQ9HwrvYYUzVOSQ5JFHoBlJT6Jm1q4hNtufLKovIrxNeoAzq+Ada/Zy
 YyRpTf+bDQ4pKLq8TAHDVtY1JyLeHTdEdSNoM7TovA6/aVhhaOifq9HjCgaSdthpUStW
 5O8Q==
X-Gm-Message-State: AOAM532TCYS6JcA+CmuWvRO1tpQqgF4F0EM2YE7rrpVMWTABXVp9zXrx
 7bX9Cl85TbX/PBj0/5LPUvwZRIuwGuIifQ==
X-Google-Smtp-Source: ABdhPJxaLOFBPxlbBFHRog+7C5BOZDHcTEDwnCef2nkMVMHZV6tTMIEHAy9lHwGxGrVbgIdZBSUfjA==
X-Received: by 2002:adf:bbca:: with SMTP id z10mr11255586wrg.403.1602949141476; 
 Sat, 17 Oct 2020 08:39:01 -0700 (PDT)
Received: from localhost.localdomain (159.171.185.81.rev.sfr.net.
 [81.185.171.159])
 by smtp.gmail.com with ESMTPSA id n66sm7654953wmb.35.2020.10.17.08.38.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 17 Oct 2020 08:39:00 -0700 (PDT)
From: Fabien Parent <fparent@baylibre.com>
To: linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] dt-bindings: timer: mtk-timer: add optional 13m and bus
 clock
Date: Sat, 17 Oct 2020 17:38:56 +0200
Message-Id: <20201017153857.2494845-1-fparent@baylibre.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201017_113903_347510_CB28B16B 
X-CRM114-Status: UNSURE (   9.83  )
X-CRM114-Notice: Please train this message.
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
Cc: matthias.bgg@gmail.com, Fabien Parent <fparent@baylibre.com>,
 tglx@linutronix.de, robh+dt@kernel.org, daniel.lezcano@linaro.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

The timer IP on MT8516 requires two clocks to be enabled. Add both
clocks.

Signed-off-by: Fabien Parent <fparent@baylibre.com>
---
 .../devicetree/bindings/timer/mediatek,mtk-timer.txt         | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/timer/mediatek,mtk-timer.txt b/Documentation/devicetree/bindings/timer/mediatek,mtk-timer.txt
index 690a9c0966ac..3f9bfd246f19 100644
--- a/Documentation/devicetree/bindings/timer/mediatek,mtk-timer.txt
+++ b/Documentation/devicetree/bindings/timer/mediatek,mtk-timer.txt
@@ -29,6 +29,11 @@ Required properties:
 - reg: Should contain location and length for timer register.
 - clocks: Should contain system clock.
 
+Optional properties:
+- clock-names: May contain:
+	* "clk13m": 13MHz clock system clock
+	* "bus": Bus clock
+
 Examples:
 
 	timer@10008000 {
-- 
2.28.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
