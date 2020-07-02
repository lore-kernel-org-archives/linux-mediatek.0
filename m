Return-Path: <SRS0=IR42=AN=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DCEC9C433DF
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 Jul 2020 03:16:25 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A83D1207D4
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 Jul 2020 03:16:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="TB42gb1q";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="Cc5H4/wZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A83D1207D4
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:From:Subject:References:Mime-Version:Message-Id:
	In-Reply-To:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=lOiMh4GcFA2rji3oRn8M93VidKVV7glwkJsByLMiHu8=; b=TB42gb1qhFe0nlrsOOGkCpAj7
	RUdXhCh+LEFVeUhd09O3yGAnsBRZ+QUxxJTKXsDDrGeNLGs6DRqhiLrj1S6Yiks4pp4IdX1NEYvo/
	jI6qNWt6cQ+7lOItdGKnjrKrqKkpz2U7j4JxVneKOpjTmbh+LVizpsWjick4RTtTGbD2kp7btqjEj
	cSt3kvNyORsNQieLm95bZTKQbQv2QYKMoPQNnkt2bGjEQxSt2jrmvzTcgoxA6vH0TWYg8orOXJen0
	H32cMaErgpoQNXInDwQ87tlrPFpmtJJ3KJAdvg0YUAD7yLeyNchvFIDlMrJQw6wNjktMNalIDa+Ik
	SQFY8c/Dw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jqphx-0004Hl-Mb; Thu, 02 Jul 2020 03:16:17 +0000
Received: from mail-yb1-xb49.google.com ([2607:f8b0:4864:20::b49])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jqpht-0004FP-95
 for linux-mediatek@lists.infradead.org; Thu, 02 Jul 2020 03:16:14 +0000
Received: by mail-yb1-xb49.google.com with SMTP id k127so23829975ybk.11
 for <linux-mediatek@lists.infradead.org>; Wed, 01 Jul 2020 20:16:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=BZhTm0K+J00uWslBFWcyNoFU+JytjYEWR2LasM10h6k=;
 b=Cc5H4/wZYiLQ+LvrHTw7nKxCtd5ts+FBnf16RiJpFUkfk5R9K7dDg3Vn1pGMz862z1
 Jv1u3na7A69no4UcSPL5oV25e2z8PLxQddKbu4LxbH1lMLa7Fg6MpmyyBqxOnFELAtu0
 0hRrGO4gBSclF9UctwJBRKzNrgi0OcStM8FiK/oOBE93owl4YMm0Ks6eppIKghsRyalA
 ZjQRkxxO/MnG1fsUetu1inruVExK0kQPWM26J/bGVz1VW4krIoU0F5+fZsvuBTwvdKre
 8949wdnB5UecWuWNBG6cWnyVu+CAIw5qDPaUV6NHO17+ZXO1/F2/qnUEWKNLDDDsjnDh
 jxYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=BZhTm0K+J00uWslBFWcyNoFU+JytjYEWR2LasM10h6k=;
 b=rPAJOwrLPipZgiSQcY5xSDCOY8Q+BRRMBKvti2sYfZLxXAZEOYt6s76wxx2RQn7mnU
 xZxdZsG2f5yCHFLgVYHQX3n3qOHQqwVFQnpuMQ7BfqBlPhFw/P7+AGbnOC1S2EF81s+l
 0H3XGZP0heGF791DMZXeeQioGdFCCBEoaInGbxDB5i2hb4se95pQm0pF4pvJp11mX/jb
 qJZzdvRZx/08Z7zzZMf6DrSoFtDOk4lOxDVhgdW4Y503djhstNzH6zh1fWJizTqBufLr
 FbU5YT8HAxGzjjkqb7oMOuYiQMm5eh032Sc1Cvx8H1AXkILBW3U9OV2BmprmgsDV0PIQ
 rWRQ==
X-Gm-Message-State: AOAM533EXFF0oR8ZWo9keWRr9c+TP9vclzFxGhKeTiX2lc3wHnSqUt3H
 2L+tPxN8vktj8MZG9kI/piAdmppUQC+m5AsA9TGP61CthLL0fznn7hNKNaXU4jmFesLYcOzsstl
 tBG5kPfyLlB1YneVuDOsWYDBIKfxB66UpVp88mu5Ac6vQyD78S/XVhauxZx0xGdKk49lI0yEZSq
 nS+X/I
X-Google-Smtp-Source: ABdhPJwdeykEH+UR9hjUHH8v8AYWafVNZUnJO6u/K1rQn9wGGIJgZmaje+MYuGRWXORfFZJVdTxTGgAySE78
X-Received: by 2002:a25:4251:: with SMTP id p78mr46020304yba.489.1593659770666; 
 Wed, 01 Jul 2020 20:16:10 -0700 (PDT)
Date: Thu,  2 Jul 2020 13:15:25 +1000
In-Reply-To: <20200702031525.2662441-1-amistry@google.com>
Message-Id: <20200702131350.4.I969f166350d084c150e5ae8052d8a973265ea442@changeid>
Mime-Version: 1.0
References: <20200702031525.2662441-1-amistry@google.com>
X-Mailer: git-send-email 2.27.0.212.ge8ba1cc988-goog
Subject: [PATCH 4/4] arm64: dts: mediatek: Update allowed regulator modes for
 elm boards
From: Anand K Mistry <amistry@google.com>
To: linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200701_231613_341639_703839DA 
X-CRM114-Status: GOOD (  10.23  )
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
Cc: devicetree@vger.kernel.org, drinkcat@chromium.org,
 Anand K Mistry <amistry@google.com>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, hsinyi@chromium.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

This sets the allowed regulator modes for elm (and derivative) boards.
According to the datasheet, the da9211 does not support SLEEP mode.

Signed-off-by: Anand K Mistry <amistry@google.com>

---

 arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi b/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
index a5a12b2599a4..d4c84a856e7b 100644
--- a/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
@@ -6,6 +6,7 @@
 #include <dt-bindings/input/input.h>
 #include <dt-bindings/input/linux-event-codes.h>
 #include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/regulator/dlg,da9211-regulator.h>
 #include "mt8173.dtsi"
 
 / {
@@ -294,7 +295,8 @@ da9211_vcpu_reg: BUCKA {
 				regulator-max-microamp  = <4400000>;
 				regulator-ramp-delay = <10000>;
 				regulator-always-on;
-				regulator-allowed-modes = <0 1>;
+				regulator-allowed-modes = <DA9211_BUCK_MODE_SYNC
+							   DA9211_BUCK_MODE_AUTO>;
 			};
 
 			da9211_vgpu_reg: BUCKB {
-- 
2.27.0.212.ge8ba1cc988-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
