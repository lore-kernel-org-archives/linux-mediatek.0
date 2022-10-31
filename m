Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 422B9FA3740
	for <linux-mediatek@archiver.kernel.org>; Mon, 31 Oct 2022 09:23:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=xqodkPfeVGhOUk8WuAgsO02qopi2iCHVpqEEckFqj4g=; b=Cz0ud7pem5rrgqNjoS/Xrp0JHb
	8VgxJiKhiyH5p6y32+95+Fn11PQAKVPG1sD+VSFKjISxmIe4HazEyybCPY1hDYRJ0/UVbfeiPX/9h
	aPUOkrqb1dDAvJHJZhtTS56lKi7Z3IaC5YMLTSwVjPJVyFJ+qdNd7qHPK21sBljsuVFgxX2hFKWv3
	Tx2RSUQIYDumnzOdfQ7jpwqB2g0eyavZh0lx8P3nzeOdolUgPoRFmVnd5NKxdt5JSmzrWxbA0upgC
	gjk6OFTLjxUmMvAOglXfXs5T0ZAEshLZjU4lle5qN9E1BNqaNQl4W+DIXjcF2w3Ow3oGeuYCHGoaN
	9V1CuWNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1opR0k-00A1K3-Qg; Mon, 31 Oct 2022 09:23:14 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1opQy3-009z5Q-IL; Mon, 31 Oct 2022 09:20:29 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 16EA11FB;
	Mon, 31 Oct 2022 02:20:33 -0700 (PDT)
Received: from pierre123.arm.com (unknown [10.57.7.107])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 8A0E13F703;
	Mon, 31 Oct 2022 02:20:24 -0700 (PDT)
From: Pierre Gondois <pierre.gondois@arm.com>
To: linux-kernel@vger.kernel.org
Cc: pierre.gondois@arm.com,
	Rob.Herring@arm.com,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH 11/20] arm64: dts: Update cache properties for mediatek
Date: Mon, 31 Oct 2022 10:20:25 +0100
Message-Id: <20221031092025.533051-1-pierre.gondois@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221031_022027_707497_EB3F4579 
X-CRM114-Status: UNSURE (   8.82  )
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

The DeviceTree Specification v0.3 specifies that the cache node
'compatible' and 'cache-level' properties are 'required'. Cf.
s3.8 Multi-level and Shared Cache Nodes

The recently added init_of_cache_level() function checks
these properties. Add them if missing.

Signed-off-by: Pierre Gondois <pierre.gondois@arm.com>
---
 arch/arm64/boot/dts/mediatek/mt8192.dtsi | 3 +++
 arch/arm64/boot/dts/mediatek/mt8195.dtsi | 3 +++
 2 files changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8192.dtsi b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
index cbae5a5ee4a0..9a20055ec1fe 100644
--- a/arch/arm64/boot/dts/mediatek/mt8192.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
@@ -159,16 +159,19 @@ core3 {
 
 		l2_0: l2-cache0 {
 			compatible = "cache";
+			cache-level = <2>;
 			next-level-cache = <&l3_0>;
 		};
 
 		l2_1: l2-cache1 {
 			compatible = "cache";
+			cache-level = <2>;
 			next-level-cache = <&l3_0>;
 		};
 
 		l3_0: l3-cache {
 			compatible = "cache";
+			cache-level = <3>;
 		};
 
 		idle-states {
diff --git a/arch/arm64/boot/dts/mediatek/mt8195.dtsi b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
index 066c14989708..2e73db4229d5 100644
--- a/arch/arm64/boot/dts/mediatek/mt8195.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
@@ -197,16 +197,19 @@ cluster_off_b: cluster-off-b {
 
 		l2_0: l2-cache0 {
 			compatible = "cache";
+			cache-level = <2>;
 			next-level-cache = <&l3_0>;
 		};
 
 		l2_1: l2-cache1 {
 			compatible = "cache";
+			cache-level = <2>;
 			next-level-cache = <&l3_0>;
 		};
 
 		l3_0: l3-cache {
 			compatible = "cache";
+			cache-level = <3>;
 		};
 	};
 
-- 
2.25.1


