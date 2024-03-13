Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DD50C54E58
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 Mar 2024 14:15:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qmuySwhenOcsXEUZkBr41Wq8m9thTati2Et72Zm9ZSw=; b=btOUQ8ToDgOx/Uz7CkPkGGm0Ht
	TgovKuCVWRS+c6C48OUsMGkOinhRWEyAlDceVstJPHZoRyZk5ZtOdmr+nsIVYTCVYlUKlZvlcrw3S
	aMKgW76qJ5mHGYCs3V0nIfC2VeIQoLyQ1bZnXUPoIzq8dv8SWbxDCmEkmyDakbXyx+crWw7igqq4x
	pgj2708yCQTXTuqfFu75s2FJagyEVDEIboGJAbFOSM78S7QbLqz9ekBC92F5N/cJ6HFSNrTI5+vBX
	lkxoGMhrvL1uMlxm29n7mbG9D68QfWvhDBDrPNsiMFRNTXS1xwcySw9uMCGreVpZHa3H/YWJfB5sr
	tIAgkg/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkPOf-0000000AOlC-0MwB;
	Wed, 13 Mar 2024 14:15:57 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkPOU-0000000AOfS-0JnG;
	Wed, 13 Mar 2024 14:15:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1710339344;
	bh=2aHPM6sJ6sr2k1ypbMOTbC3hJmk8XkC7o/w5nWOJzos=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=WLt2UkdBLu+ggBJcjJJM9749HQcF9AS1rsY79l6NnjQ0Y+AFuvCWj/JbsyynuCitB
	 eiE+7+HjHei0H2CCaU3UuPvI++S4+xa8sqciRVZuJNIvbF/TExWQvWncJOfHFUx9KR
	 ePGs6EnihYK82QW0QqXPvMV0H58ZZi030SGbDdqJPsQ+zQ6Dy7E/eD3yx0JntNVVPv
	 Wii06Mj45xrSA6nPzSTQPC8gnJ0kL6UOgzmjaPLahZr3cFTaAJ0wpvET/GI9J7WI1H
	 MVyn/Swsubhxh5EROmqPENbE8uf8TFxUhWdOJkdJQ6Ab7CTRMwIJDBV/ErjntACGLh
	 s1NYnnMde3COg==
Received: from IcarusMOD.eternityproject.eu (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 13A2737820D6;
	Wed, 13 Mar 2024 14:15:44 +0000 (UTC)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: linux-mediatek@lists.infradead.org
Cc: robh@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@collabora.com
Subject: [PATCH 2/2] arm64: dts: mediatek: Add missing chassis-type to MT8192 Chromebooks
Date: Wed, 13 Mar 2024 15:15:38 +0100
Message-ID: <20240313141538.1438167-3-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240313141538.1438167-1-angelogioacchino.delregno@collabora.com>
References: <20240313141538.1438167-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240313_071546_273398_B0D77BB3 
X-CRM114-Status: UNSURE (   9.37  )
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

None of the MT8192 Chromebooks had their chassis-type specified: add
the right definition for each.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 arch/arm64/boot/dts/mediatek/mt8192-asurada-hayato-r1.dts      | 1 +
 arch/arm64/boot/dts/mediatek/mt8192-asurada-hayato-r5-sku2.dts | 1 +
 arch/arm64/boot/dts/mediatek/mt8192-asurada-spherion-r0.dts    | 1 +
 arch/arm64/boot/dts/mediatek/mt8192-asurada-spherion-r4.dts    | 1 +
 4 files changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8192-asurada-hayato-r1.dts b/arch/arm64/boot/dts/mediatek/mt8192-asurada-hayato-r1.dts
index fd2cb8765a15..ac2673e56fb8 100644
--- a/arch/arm64/boot/dts/mediatek/mt8192-asurada-hayato-r1.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8192-asurada-hayato-r1.dts
@@ -7,6 +7,7 @@
 
 / {
 	model = "Google Hayato rev1";
+	chassis-type = "convertible";
 	compatible = "google,hayato-rev1", "google,hayato", "mediatek,mt8192";
 };
 
diff --git a/arch/arm64/boot/dts/mediatek/mt8192-asurada-hayato-r5-sku2.dts b/arch/arm64/boot/dts/mediatek/mt8192-asurada-hayato-r5-sku2.dts
index 3127ee5f6172..cd86ad9ba28a 100644
--- a/arch/arm64/boot/dts/mediatek/mt8192-asurada-hayato-r5-sku2.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8192-asurada-hayato-r5-sku2.dts
@@ -7,6 +7,7 @@
 
 / {
 	model = "Google Hayato rev5";
+	chassis-type = "convertible";
 	compatible = "google,hayato-rev5-sku2", "google,hayato-sku2",
 		     "google,hayato", "mediatek,mt8192";
 };
diff --git a/arch/arm64/boot/dts/mediatek/mt8192-asurada-spherion-r0.dts b/arch/arm64/boot/dts/mediatek/mt8192-asurada-spherion-r0.dts
index bc88866ab2f5..29aa87e93888 100644
--- a/arch/arm64/boot/dts/mediatek/mt8192-asurada-spherion-r0.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8192-asurada-spherion-r0.dts
@@ -8,6 +8,7 @@
 
 / {
 	model = "Google Spherion (rev0 - 3)";
+	chassis-type = "laptop";
 	compatible = "google,spherion-rev3", "google,spherion-rev2",
 		     "google,spherion-rev1", "google,spherion-rev0",
 		     "google,spherion", "mediatek,mt8192";
diff --git a/arch/arm64/boot/dts/mediatek/mt8192-asurada-spherion-r4.dts b/arch/arm64/boot/dts/mediatek/mt8192-asurada-spherion-r4.dts
index 0039158c9e60..5e9e598bab90 100644
--- a/arch/arm64/boot/dts/mediatek/mt8192-asurada-spherion-r4.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8192-asurada-spherion-r4.dts
@@ -8,6 +8,7 @@
 
 / {
 	model = "Google Spherion (rev4)";
+	chassis-type = "laptop";
 	compatible = "google,spherion-rev4", "google,spherion",
 		     "mediatek,mt8192";
 
-- 
2.44.0


