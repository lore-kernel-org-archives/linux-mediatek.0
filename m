Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1454C4829A
	for <linux-mediatek@archiver.kernel.org>; Tue, 13 Feb 2024 19:35:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZzY6S4Cfb0oFqLeqP6hZWo4TjjDOJp/79WCgudfwQmo=; b=AD6bZAQf+NmgzrvU6+qbGRbm5M
	532UIWRWTRTRLsA+I7Tzv60elqhYnIQbM5EIlyk3MukwREEvVoAxjVQv79YciuZzK3OVARvOFPpDU
	fpDTKMHPa0ZqlJOtT5RjQQh83U9U/NnKuONh0Yh6kCNx8+rCjd9/obN3haITgq32aYXpE/4UvVTWO
	MDUpEfL1K5L6ADAI4PrWJVUaDHw3KL2LHaEBXxTVBvT9wI9E+m2GOkOPmrWXN6ZnSX/Z8yXXVIrMs
	9kIdYa08Gzi7jS2xg4fAxsNfyiJvF+ohN4Zdh3aEjQt2aVWjdh11jSViVKFbzxc2MVTxTkHIYXZua
	+emXZpKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZyZ2-0000000AUL3-15je;
	Tue, 13 Feb 2024 19:35:32 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZyYw-0000000AUH5-239m;
	Tue, 13 Feb 2024 19:35:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 9F7B0CE1E4F;
	Tue, 13 Feb 2024 19:35:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3659C43390;
	Tue, 13 Feb 2024 19:35:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707852923;
	bh=io3IHUz4w8uho1fRTkKUDdRHdXN+FkOTbGUXes+HSwM=;
	h=From:Date:Subject:References:In-Reply-To:List-Id:To:Cc:From;
	b=nC5yv0wT3DgPAYxk67YpeyMCOPQkCYoByAe0P20ibCZ2ZwpRXd+xIv5AqQOnkRr62
	 cxdPJbNSI9jT3FXpYwVYIOXR0ouq46nNz4TLHhI8H+vMT3ps6nVXceSfGHHKwtREYx
	 Sbg3UPfGR/V5C3yWrSox+lIgE9ejNmJT1TANOBTxvAUGXTTudhW4ND1OOaXvjablDm
	 Pq1vKqjSz6KCFP5XAlEcDdsbF21T3QakjhMnzYri2o5fnkDrsWQ6GuLtLe9bTHjiVY
	 BZU+xASTGTnd1z8TXb/DlPot58ZDRaKwIT9h2dNK+T45l/LYEdnroleltXx5US+sPV
	 GKvPP5SxiGlCg==
From: Rob Herring <robh@kernel.org>
Date: Tue, 13 Feb 2024 13:34:30 -0600
Subject: [PATCH 6/6] dtc: Enable dtc interrupt_provider check
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240213-arm-dt-cleanups-v1-6-f2dee1292525@kernel.org>
References: <20240213-arm-dt-cleanups-v1-0-f2dee1292525@kernel.org>
In-Reply-To: <20240213-arm-dt-cleanups-v1-0-f2dee1292525@kernel.org>
To: soc@kernel.org, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Tsahee Zidenberg <tsahee@annapurnalabs.com>, 
 Antoine Tenart <atenart@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, Ray Jui <rjui@broadcom.com>, 
 Scott Branden <sbranden@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Andrew Lunn <andrew@lunn.ch>, Gregory Clement <gregory.clement@bootlin.com>, 
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, 
 =?utf-8?q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, Stefan Agner <stefan@agner.ch>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 =?utf-8?q?Beno=C3=AEt_Cousson?= <bcousson@baylibre.com>, 
 Tony Lindgren <tony@atomide.com>, Chanho Min <chanho.min@lge.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, Linus Walleij <linusw@kernel.org>, 
 Imre Kaloz <kaloz@openwrt.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Masahiro Yamada <masahiroy@kernel.org>, 
 Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-aspeed@lists.ozlabs.org, 
 openbmc@lists.ozlabs.org, linux-tegra@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, linux-omap@vger.kernel.org, 
 linux-mediatek@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-kbuild@vger.kernel.org
X-Mailer: b4 0.13-dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240213_113526_921793_EFFF6B31 
X-CRM114-Status: UNSURE (   9.56  )
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

Now that all the interrupt warnings have been fixed, enable
'interrupt_provider' check by default. This will also enable
'interrupt_map' check.

Signed-off-by: Rob Herring <robh@kernel.org>
---
 scripts/Makefile.lib | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
index cd5b181060f1..fce35e4657f5 100644
--- a/scripts/Makefile.lib
+++ b/scripts/Makefile.lib
@@ -340,7 +340,7 @@ quiet_cmd_gzip = GZIP    $@
 # DTC
 # ---------------------------------------------------------------------------
 DTC ?= $(objtree)/scripts/dtc/dtc
-DTC_FLAGS += -Wno-interrupt_provider \
+DTC_FLAGS += \
 	-Wno-unique_unit_address
 
 # Disable noisy checks by default
@@ -358,7 +358,6 @@ endif
 ifneq ($(findstring 2,$(KBUILD_EXTRA_WARN)),)
 DTC_FLAGS += -Wnode_name_chars_strict \
 	-Wproperty_name_chars_strict \
-	-Winterrupt_provider \
 	-Wunique_unit_address
 endif
 

-- 
2.43.0


