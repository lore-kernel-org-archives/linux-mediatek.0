Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69F95606A334
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Nov 2026 14:12:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=WB60i/Fv;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=TcSDr+w5
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=P6VJcdeGPLmQQkKLnT/yRNbiCAJPKjitwFw5ODXVfxM=; b=WB60i/Fvtat/En
	oR95dY1BJZcNq7yuOtc9M19qwJOAjx2SwMbrlRA1f/Y5FCcuBY6LGH7d6xOEecDsyKVTCdyjO95EP
	a1UOxiuN5nRuJ5qApoMkP4iv4Ki1NJFGRNXmFVx3Cfav8xNF0iVDChSCG22vQX1y9JpyThvPCSfah
	RvlC6yZQLb9ZNeS3IE3T8ky0EIn0QGLaEARaGA2LusJYCsDCnFQnRIXXWbNFTcIHodx88fCzxxQt2
	LDlggIJRlDyzs7MEskTX+1xBQNU5QZUaoc23bN24hTNe/UNqQFeexv6o+gaqPfjIAKcpM1rsjOMkk
	IN1T+FpZgsWZwbBbaiAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQQ77-00000000usL-0aQc;
	Mon, 09 Nov 2026 14:12:49 +0000
Received: from mail-dl1-x122a.google.com ([2607:f8b0:4864:20::122a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQQ74-00000000ups-1mH4
	for linux-mediatek@lists.infradead.org;
	Mon, 09 Nov 2026 14:12:47 +0000
Received: by mail-dl1-x122a.google.com with SMTP id a92af1059eb24-1438d9363fbso529814c88.0
        for <linux-mediatek@lists.infradead.org>; Mon, 09 Nov 2026 06:12:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1794233565; x=1794838365; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=P6VJcdeGPLmQQkKLnT/yRNbiCAJPKjitwFw5ODXVfxM=;
        b=TcSDr+w5eL6ZE+0wk+1mMWdLbnljdv5ZOV1e6t8n/ykcq6644/k2q3Bmo476WKHZ5D
         pa6CU70xIupXRYcrgCl3R+rJ6+0Z9QwcoqZPQvxu8T9YjB3w2h3VP3yVuCi/NEQe912Y
         UgpCCLUp5tdEcMAiWc9YOfrCALd90/5DYah2U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794233565; x=1794838365;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=P6VJcdeGPLmQQkKLnT/yRNbiCAJPKjitwFw5ODXVfxM=;
        b=UbELL/MyUeGOJi5XGkuAgI/wX1/hoo+Gfmly9dHLXQeiLMpxegMLE9DvmNaXDD5ef5
         NlKygveilDtLu/DH5sYpdKOwBXc9qAaYeT67F1ocCVQUPH6HRkJEgFYbTUDqgX9U3Bi1
         jUhWTlBXtTATBaFZ6YCs9zQQEou1MzpEAvdP20YVdIMVnO5JXp0oW9XcyTJzXUqpfoYB
         VfF5fKlFCm7M3WPJzsBJRI8j0OZds7UzPIOMGUfPENKYan2Z5yroOJ+yNkiD4ew4Rp03
         Ftsw8XJIq8s1Bi12EoZzdmvFs3L1dNLf56vKtv5ri3aq6OPL+gFjcrurhwSoCW0gMD2E
         3ChQ==
X-Forwarded-Encrypted: i=1; AL+hErHGhaLZmedqqmwj+IqpM//isJKPCn4AyOMtpuv1kW367AEZaWCvkvzRLgURNZz5bQZqFUaFBKkRveE3mt8SHQ==@lists.infradead.org
X-Gm-Message-State: APuU4Z9iKyDB3gYvxqQEIIRXaguXdRIwOij1AmYeOedAtSdRHzlmXoCy
	jVQ1KfNgzJWch69JPdD/yl9Q6cd7ifJCnd3vCsMUapB2BDBc40v6h3epejnPBPqLmMkCp9wNpXE
	D3ATJJ8P8
X-Gm-Gg: AYBFou1n3ut+MqA9lyP4bTWInMe4OGaOXtLrxL31kec4R6LRTNS3viNeqmtyJ50xTXA
	Qm6bXChYoycWEwWqEHolqWPHwvS51nuMvXRnFRG264UOw2v4kHQUmi/597ZyaFLITJRNXskL/ez
	B3lcSf5AuhqX7gXP1ciswKOjCUC3OHM+LeU95HzKL+noaRZq+pL4OpdBE8ez2mouW2AfAjCRuFG
	bduViIMTBKhCWowp/hn/iv2G8vYjakU9drOLWTPKCvyLDLk+X0+QtB/XRKIV+AkLC43QYTjBnvs
	fR1frRE2M20slrj+7Wh99FSW8FDcJEvV+iMLTg89foAnJg6BPMw+LIW05AYa0/nUNFHroKIpeG5
	3eALGwi0++cGlhlG2LVCq++my/bT/RRjazP6vBiJbjQl3IHfeUs3z9afrI8fyUyea5HR1NW2l/m
	LvazXswiauRBDx0TsaCkaOUN/Em6r1z/CaEBmycPgtW3D8Sv40nAyJxnwcPWLZVvKE3lwMlLONf
	q+AWWkNm3uhYRPOtJO/gkDREdlYG9SQEW6z8xyzPtNzwXNBY6Rso6kKETkhPYh1zKCgInl/chYG
	X1Ch/0IfC7txw/fAYvDuD0owroe5tmWmp7vuBGZQHFGbjEsFd29ReENogsQE
X-Received: by 2002:a05:701b:428a:20b0:194:e9e5:11b0 with SMTP id a92af1059eb24-1b269b0c10fmr10662445c88.14.1794233565388;
        Mon, 09 Nov 2026 06:12:45 -0800 (PST)
Received: from localhost ([2a00:79e0:203d:7:24d0:a2cf:66c5:ef86])
        by smtp.gmail.com with UTF8SMTPSA id 5a478bee46e88-372660f444csm21084768eec.19.2026.11.09.06.12.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2026 06:12:44 -0800 (PST)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org
Subject: [PATCH 1/5] arm64: dts: mediatek: mt8173-elm: Clean up unused MT6397 regulators
Date: Mon,  9 Nov 2026 22:12:28 +0800
Message-ID: <20261109141233.983830-2-wenst@chromium.org>
X-Mailer: git-send-email 2.56.0.455.g6c5a503b38-goog
In-Reply-To: <20261109141233.983830-1-wenst@chromium.org>
References: <20261109141233.983830-1-wenst@chromium.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_061246_466279_04E92098 
X-CRM114-Status: GOOD (  13.45  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Several MT6397 (MT6391) PMIC regulator nodes in mt8173-elm.dtsi are
not actually used on either Elm or Hana according to the board
schematics. They may have been copied from the EVB dts.

- buck_vgpu: Output pins are unconnected; GPU power is supplied by an
  external DA9212 buck regulator instead.
- ldo_va28: Only connected to a decoupling capacitor for the PMIC's
  internal audio codec and fuel gauge ADC blocks, both of which are
  unused as both boards use an external ALC5650 codec and EC-managed
  smart battery.
- ldo_vgp4: Only routed to a test point on Elm and an unpopulated
  resistor on Hana.
- ldo_vibr: Output pins are unconnected.

Keep these regulator nodes in place so that the regulator core still
considers them constrained and can disable any unused rails left on at
power-up (such as ldo_va28), but drop all their properties and unused
labels. This is meant to preserve prior behavior.

Checking the regulator nodes against the schematics, drafting the change
and reviewing it were done by an agent. Manually tested on a Hana
(Telesu) device.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi | 26 ++++++--------------
 1 file changed, 8 insertions(+), 18 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi b/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
index 2c6ec714e117..dd0373b45b56 100644
--- a/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
@@ -988,12 +988,8 @@ mt6397_vcore_reg: buck_vcore {
 				regulator-always-on;
 			};
 
-			mt6397_vgpu_reg: buck_vgpu {
-				regulator-name = "vgpu";
-				regulator-min-microvolt = < 700000>;
-				regulator-max-microvolt = <1350000>;
-				regulator-ramp-delay = <12500>;
-				regulator-enable-ramp-delay = <115>;
+			buck_vgpu {
+				/* unused */
 			};
 
 			mt6397_vdrm_reg: buck_vdrm {
@@ -1017,8 +1013,8 @@ mt6397_vtcxo_reg: ldo_vtcxo {
 				regulator-always-on;
 			};
 
-			mt6397_va28_reg: ldo_va28 {
-				regulator-name = "va28";
+			ldo_va28 {
+				/* unused */
 			};
 
 			mt6397_vcama_reg: ldo_vcama {
@@ -1079,11 +1075,8 @@ mt6397_vgp3_reg: ldo_vgp3 {
 				regulator-enable-ramp-delay = <218>;
 			};
 
-			mt6397_vgp4_reg: ldo_vgp4 {
-				regulator-name = "vgp4";
-				regulator-min-microvolt = <1200000>;
-				regulator-max-microvolt = <3300000>;
-				regulator-enable-ramp-delay = <218>;
+			ldo_vgp4 {
+				/* unused */
 			};
 
 			mt6397_vgp5_reg: ldo_vgp5 {
@@ -1100,11 +1093,8 @@ mt6397_vgp6_reg: ldo_vgp6 {
 				regulator-enable-ramp-delay = <218>;
 			};
 
-			mt6397_vibr_reg: ldo_vibr {
-				regulator-name = "vibr";
-				regulator-min-microvolt = <1300000>;
-				regulator-max-microvolt = <3300000>;
-				regulator-enable-ramp-delay = <218>;
+			ldo_vibr {
+				/* unused */
 			};
 		};
 
-- 
2.56.0.455.g6c5a503b38-goog


