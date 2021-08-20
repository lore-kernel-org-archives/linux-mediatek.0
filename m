Return-Path: <SRS0=yE1p=NL=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33D0DC4338F
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 Aug 2021 08:16:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ECE6161051
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 Aug 2021 08:16:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org ECE6161051
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=canonical.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=YzwaT2N9AqqbRwB3Xq2DrCIpRXis9SscG5YzgjDksak=; b=KCKPbhN3YWe4Uk
	7McbloPX2oHzEpVA7IODsEK8wzX+nYmrvMOji662EyPYcG+2oUwT/C7ADlxB5Ji211Cd+hrzOpjZH
	+YkzykZDQGJNKEtvT+bt3sChknZsdn8UEHlCme7KTZWocPlpSg+VNEw31CTjOFrWqgbOrtU26Xewu
	AlpAPRDcTTLfAbDdkmhhYqAW47njc9DMwtNNimzoPe3sZixauosxbNaK/GyWDxNF3aVLAaXfgWedV
	j51rfoc0KXbiB7EQHoiBF66L1FzJTNmeE8hWjXAS1wuu0IycH6Yg8xVT2/v2FyJFqiLmEhDWBDHrj
	+syhfhO+AOznhT+CPg5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mGzhg-00ALPK-NE; Fri, 20 Aug 2021 08:16:40 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mGzhM-00ALI9-Te
 for linux-mediatek@lists.infradead.org; Fri, 20 Aug 2021 08:16:24 +0000
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id C20944075E
 for <linux-mediatek@lists.infradead.org>; Fri, 20 Aug 2021 08:16:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1629447379;
 bh=OmtSKxexi252yLpsd09SnFUuzqXU2/zeUXsYaGlChyE=;
 h=From:To:Cc:Subject:Date:Message-Id:MIME-Version;
 b=pmN7qgHi+EARqniZH47Yo17cxIVOm/IfX3R7dZro17DaQWzlGaAbNEkj8szan4gCb
 lpe0S1v0TW4zc01rnTbF0V3i+D3kznsuWZBHGIzg+k6ldxePImRO3Y8ri5qujO0/d3
 BmvNMwq42rRH8rsQZNVnO49+7HIlLGy7m4nHmH2+a31e/X3McNbRmvXaE8geIzvTip
 XZpGlyI256ouiQvMlCURAVZ9s8fROKILiMn9KPOysSvTLxExGHRjnwa5IPZpFktRGI
 4gUFndtKkcLzT1lKTytUzWeSIZquzo8C/8snlz6MGJYBu1R1dir5GkS7Su6FW23MbV
 LmxrR1gur0EoQ==
Received: by mail-ed1-f71.google.com with SMTP id
 bx23-20020a0564020b5700b003bf2eb11718so4145676edb.20
 for <linux-mediatek@lists.infradead.org>; Fri, 20 Aug 2021 01:16:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=OmtSKxexi252yLpsd09SnFUuzqXU2/zeUXsYaGlChyE=;
 b=USJ2T7IKiUQqPhs57urrUPWMcE6Sy5Npb3SNsbjym6QXJQGT1sLGJrbZH8t7/F3csk
 9XT8Oe5LzwqWUt4dmzjsW3jg8smIBC/A4uwnYom1NX/u13PwB1Lp1wOGVWg8R+mbotUl
 Xig5ibHgWwajzfkdihi5U1lQJMwxJeC6v15gMLm2BvNGdM8BxxBHfocMauiEKur2FX9E
 iq1w2t1R43bO7Yy9VeIOnyp3RB0Qr/kJiGyTWCQmriODHXE/FeGqZSSLCcXMXMybWOCQ
 cU6fkLg+JVPlj7270blWDW6uWtEMYbOePbZdYEgZSIvlvl3bnubdA3mNfV1wseKLPVHi
 d3og==
X-Gm-Message-State: AOAM533UkqA9+olEMwuqFxZDumDK+Ul8QFrJVSb7YWXZgzM+KJn2Oe9I
 RFkHCba5ejQEhdC+nLINLAMmcvBXlu7Hd21kYIwJLWdkBXCtPwJhdI50P7vcK2rQoMjQEiWCwY5
 SHHpFYFoZiXS9pwQlniC7gV19fdmoYbQVtZgR7i9JB81T5tyLVA==
X-Received: by 2002:a05:6402:152:: with SMTP id
 s18mr20736025edu.221.1629447379439; 
 Fri, 20 Aug 2021 01:16:19 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyCE7w2Hupb+KqkRVqDnp7hgDcT/qC/auwCzygTdxXxygjTPKNmYAIQZ65smv9XcUCZyL7j5g==
X-Received: by 2002:a05:6402:152:: with SMTP id
 s18mr20736014edu.221.1629447379330; 
 Fri, 20 Aug 2021 01:16:19 -0700 (PDT)
Received: from localhost.localdomain ([86.32.42.198])
 by smtp.gmail.com with ESMTPSA id w13sm351632edx.67.2021.08.20.01.16.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Aug 2021 01:16:19 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: Matthias Brugger <matthias.bgg@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Subject: [PATCH 1/2] arm64: dts: mediatek: align operating-points table name
 with dtschema
Date: Fri, 20 Aug 2021 10:16:15 +0200
Message-Id: <20210820081616.83674-1-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210820_011621_120164_A89D84A4 
X-CRM114-Status: GOOD (  12.58  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Align the name of operating-points node to dtschema to fix warnings like:

  arch/arm64/boot/dts/mediatek/mt8173-elm.dt.yaml:
    opp_table0: $nodename:0: 'opp_table0' does not match '^opp-table(-[a-z0-9]+)?$'

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 arch/arm64/boot/dts/mediatek/mt8173.dtsi | 4 ++--
 arch/arm64/boot/dts/mediatek/mt8183.dtsi | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8173.dtsi b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
index d9e005ae5bb0..49c6b6a5b489 100644
--- a/arch/arm64/boot/dts/mediatek/mt8173.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
@@ -57,7 +57,7 @@ aliases {
 		serial3 = &uart3;
 	};
 
-	cluster0_opp: opp_table0 {
+	cluster0_opp: opp-table-0 {
 		compatible = "operating-points-v2";
 		opp-shared;
 		opp-507000000 {
@@ -94,7 +94,7 @@ opp-1703000000 {
 		};
 	};
 
-	cluster1_opp: opp_table1 {
+	cluster1_opp: opp-table-1 {
 		compatible = "operating-points-v2";
 		opp-shared;
 		opp-507000000 {
diff --git a/arch/arm64/boot/dts/mediatek/mt8183.dtsi b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
index 409cf827970c..caab109add28 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
@@ -197,7 +197,7 @@ CLUSTER_SLEEP1: cluster-sleep-1 {
 		};
 	};
 
-	gpu_opp_table: opp_table0 {
+	gpu_opp_table: opp-table-0 {
 		compatible = "operating-points-v2";
 		opp-shared;
 
-- 
2.30.2


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
