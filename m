Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2C20606A326
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 Nov 2026 14:42:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=rjPT2HMC;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FenyOCU9
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=eTmGpAk5ApLPXB7Y5muckWXrGowRihIuOzQJLQl8RgA=; b=rjPT2HMCptKpAs
	sm/yGTsvShK+shRTLbr4FoZ4eAdkxc7RzABFj6L+oewpslyHF1W/+MAH5Hj9OoqcyttcaPVYxGH7t
	zh66kONs9Roh9ojrx5b7LI3mPLi+eG/QJufvCEFq+FpJyCT71G6lpDsslfUz+WXi/EWv01nO0P5So
	lqmZTEkG+JuQMESF+PA8oQk5O6rsaskB5WazvWop2iP+EjJYlHmEwtWAi80TFSVhTYA1WNLmbKoQB
	dkLeRQEyvO+jmwIaEIiHq2eOnBEypWunBzn/I6TRvip1q1LVxCtkoS0QMn/Lsu0S5y2k1hkHF/E+8
	HpeLlwbBb7A9KEjvV9Zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUPoZ-0000000FHo3-2JJ9;
	Fri, 20 Nov 2026 14:42:11 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUPoV-0000000FHmD-3lFB
	for linux-mediatek@lists.infradead.org;
	Fri, 20 Nov 2026 14:42:10 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-2f00fc215f9so6508185ad.0
        for <linux-mediatek@lists.infradead.org>; Fri, 20 Nov 2026 06:42:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795185727; x=1795790527; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eTmGpAk5ApLPXB7Y5muckWXrGowRihIuOzQJLQl8RgA=;
        b=FenyOCU95v2PNVbeiFZJYql8nzHJ1JdcSq5Rk1zfE8hYHhmdlh8DahO6uQIabhR65I
         FnSsaduKdXaHolbmUyCllg/Z69dsbpexYhxYvEtV60OZwupLkfp2Ee85UWo3Ipxa1QGD
         V0Sj0yeEQcoZCFWy7zQcWysMH+Po69HlkIu51+uh3/JXIwDLC6rdrI83gO1c+144d3t1
         2lnhaEvDdO+niC56L4S6zyNF2PM/VzkCC4+/kBZoVLHQwWplLPaHDSh9rHd0GTf/C0GE
         SanEgwxgJ2XuR5joustaDyYFduVIQwAwkEDcKTrsELufiwh4+N7FhDFo1+I++UmdlfXD
         hEsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795185727; x=1795790527;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eTmGpAk5ApLPXB7Y5muckWXrGowRihIuOzQJLQl8RgA=;
        b=USvN1HQPrmojq5T4SCU/qxX00z3I5MDVcY+q+CK9n3yC6XGuHvmEJaw0fzvr5vAelY
         NHDwYRMrARrdbNq2GKF+oKTAbO89mjU96b59GZECIf/UOSTONAoXRz6vuRJgs1ocJJ+v
         Rd/lh2Wydu1/hz+C3poZEYYWZd0+M/AEMSoRnyrqcipDRLGfZBdjR8vMXjW/ezqdTqFq
         oBToMyPsGXJJlwSkl9I0vkuS5Um8DjZZRUTGVx7pXXgXxX/NBieeyMaeTbD3/ndVaO3Y
         WUUheHHac8IrZOUtC3fk3ZfyVuRvIImRi7tN01uStAYtak/f0NK7SY4q4kN2I9PJQyO4
         Igcg==
X-Forwarded-Encrypted: i=1; AL+hErHlfNJxEYznWFbsCWnoscwZWzeNxh34FIv1TY0ScUeA2GdYaRMRlw3SpemrgaLwje8pmJZKMxt1P2v/3+eROA==@lists.infradead.org
X-Gm-Message-State: APuU4Z8ygvTwkPzxRwQDMjV2qCSrJ9GlSffG85Gh4HaNvDsUi2z021h1
	m+MWBttPk8zQkbpcuPGmufCSuFtNos1EsJyYXsFd+lPVFVauFk/fQeFV
X-Gm-Gg: AZFdTZeMq8aBs5qQ5EXbaaC7Y5bx3uoiMPolq6R3jU9jUEIK76XY2/LJ9n0RwdLlwCO
	P86IdJMUO72HMqtI0QFu8Te59XLW0owTKMfy4bxJLOom9OBj5YHMs8oES/c+pFxQafZ9cSTz8hW
	hIzWIJwoQ1pi3b5FbVN6D/gQwhL//m9agM0+i3QjSiXnYnzQ6+KEW0jBhOb1iAciJYbsclwM4Dr
	GYvw93sqPO4hHgPYbBeZpCjA4pFjcl2fBldKSZe2hN6RW/+rMXCi1nUy85A9RCagvU13gS/+pMQ
	UcQYQZ8TieTaunV0ax1beeWFrqeqUkWTLUJxG08JtPWV1ZFWFu/JzfqdzBdtPsqybqRPPyJ63tZ
	xzicOC8PmPzHe5tc0WU6p/2/lsZE4ymfKajYj/czRtC5/ZjgHTSneordEEbP5p1dP8vzqxg4j1F
	WCM70jdJbofKn3GMQVDTGDpPrfmyVwwX+bCbT+NjprmE/iMU6TvEm7PhfXOlfmCOxjqUsersU06
	GHx8cPeuV/rRQquwNvv7DE6yGSEvH5Fx2U9ILG1DOciRoxsxrOjyBizX0IxrIA85XuO3egYRREM
	+hZePZWDAZMj/FwfmPhpX4tqAl/sOTzaZkbLXg==
X-Received: by 2002:a17:902:eccf:b0:2e9:64b9:a333 with SMTP id d9443c01a7336-2f03f17c766mr37267005ad.19.1795185726811;
        Fri, 20 Nov 2026 06:42:06 -0800 (PST)
Received: from [10.98.15.223] ([2a09:bac1:6500::19b:170])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03ee848c1sm15346435ad.10.2026.11.20.06.41.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 06:42:06 -0800 (PST)
From: Chuanhong Guo <gch981213@gmail.com>
Date: Fri, 20 Nov 2026 22:41:44 +0800
Subject: [PATCH v2 1/3] clk: mediatek: mt7629: move clock counts out of DT
 bindings
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261120-b4-mt7629-rtc-v2-1-cd877cd496ae@gmail.com>
References: <20261120-b4-mt7629-rtc-v2-0-cd877cd496ae@gmail.com>
In-Reply-To: <20261120-b4-mt7629-rtc-v2-0-cd877cd496ae@gmail.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-clk@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, Chuanhong Guo <gch981213@gmail.com>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_064207_945058_B61FE9F6 
X-CRM114-Status: GOOD (  10.60  )
X-Spam-Score: -1.9 (-)
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The clock counts used by clk-mt7629.c size the clock provider arrays.
They are driver implementation details rather than clock IDs used by
device tree consumers.

Move CLK_TOP_NR_CLK, CLK_INFRA_NR_CLK, CLK_PERI_NR_CLK and
CLK_APMIXED_NR_CLK into the driver. Keep their values and all clock IDs
unchanged.

Signed-off-by: Chuanhong Guo <gch981213@gmail.com>
---
 drivers/clk/mediatek/clk-mt7629.c      | 5 +++++
 include/dt-bindings/clock/mt7629-clk.h | 4 ----
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/mediatek/clk-mt7629.c b/drivers/clk/mediatek/clk-mt7629.c
index e154771b1b8b..517c43b19f18 100644
--- a/drivers/clk/mediatek/clk-mt7629.c
+++ b/drivers/clk/mediatek/clk-mt7629.c
@@ -17,6 +17,11 @@
 
 #include <dt-bindings/clock/mt7629-clk.h>
 
+#define CLK_TOP_NR_CLK		108
+#define CLK_INFRA_NR_CLK		6
+#define CLK_PERI_NR_CLK		22
+#define CLK_APMIXED_NR_CLK		7
+
 #define MT7629_PLL_FMAX		(2500UL * MHZ)
 #define CON0_MT7629_RST_BAR	BIT(24)
 
diff --git a/include/dt-bindings/clock/mt7629-clk.h b/include/dt-bindings/clock/mt7629-clk.h
index ad8e6d7f0154..cff9a02e8302 100644
--- a/include/dt-bindings/clock/mt7629-clk.h
+++ b/include/dt-bindings/clock/mt7629-clk.h
@@ -115,7 +115,6 @@
 #define CLK_TOP_CRYPTO_SEL		105
 #define CLK_TOP_SGMII_REF_1_SEL		106
 #define CLK_TOP_10M_SEL			107
-#define CLK_TOP_NR_CLK			108
 
 /* INFRACFG */
 #define CLK_INFRA_MUX1_SEL		0
@@ -124,7 +123,6 @@
 #define CLK_INFRA_DEVAPC_PD		3
 #define CLK_INFRA_APXGPT_PD		4
 #define CLK_INFRA_SEJ_PD		5
-#define CLK_INFRA_NR_CLK		6
 
 /* PERICFG */
 #define CLK_PERIBUS_SEL			0
@@ -149,7 +147,6 @@
 #define CLK_PERI_NFI_PD			19
 #define CLK_PERI_NFIECC_PD		20
 #define CLK_PERI_FLASH_PD		21
-#define CLK_PERI_NR_CLK			22
 
 /* APMIXEDSYS */
 #define CLK_APMIXED_ARMPLL		0
@@ -159,7 +156,6 @@
 #define CLK_APMIXED_ETH2PLL		4
 #define CLK_APMIXED_SGMIPLL		5
 #define CLK_APMIXED_MAIN_CORE_EN	6
-#define CLK_APMIXED_NR_CLK		7
 
 /* SSUSBSYS */
 #define CLK_SSUSB_U2_PHY_1P_EN		0

-- 
2.56.1


