Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90C14C5DF7D
	for <linux-mediatek@archiver.kernel.org>; Fri, 21 Aug 2026 08:52:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=wxIJbdtHu5EFzZttDmDXTiKHDXuSlZ7X22WCTLQoMi0=; b=Ojl55UBo8/XtDOPu1jTL/AH1JR
	irqqbmPbJsxq7Lzy1Ged9Nq60o5veXB8cxSCfqnJy60iWTBEXJOTfz0x0Gp9iCvWdCXVbQvgmtdBd
	O9D14a2AdkvxtxXdPB0Z+gePEZcJWvhMiXLqiFpmywISUPsWkeegdImr0tRuOlwGNeq9EjborS6Px
	1HiIU/2ugM7RDJ12S/ab9SmvzGotFLuDloDHJgIy1099w1NI24Me8saZC12rJ02noJdpH8MeqtVdA
	KG0gjRrYnxwxUcp3cpW0Mtk/DAshWI6WVLAGI7+YjZiibmbjrgWzVWJIoIW9510W06pgwLc5C4K7Q
	JvbGKgUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxKzL-0000000CpiM-15tR;
	Fri, 21 Aug 2026 08:52:35 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxKzI-0000000Cphb-3EXK
	for linux-mediatek@lists.infradead.org;
	Fri, 21 Aug 2026 08:52:33 +0000
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-69fab5a852cso1527819a12.0
        for <linux-mediatek@lists.infradead.org>; Fri, 21 Aug 2026 01:52:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787302350; x=1787907150; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=wxIJbdtHu5EFzZttDmDXTiKHDXuSlZ7X22WCTLQoMi0=;
        b=lI8pO0xUdJaaNrVR6pts/EvbIufPOKS7Yj9vLMGtkl3SJZx+MzRG2VRIlIN5bWToOB
         6MOfeFV+ojnOA1meFDh18U3M6BuW41WC+n3YGE/C9C/b5b/nB4ziJzuFxUlJOhftu9X8
         JWl42NvRisxUx97BGnPw0lze9FLEg3CA98NyKpKLPbBG6Jc/x6lHJRZdDJI5VkHENAo7
         iol5HnXigsEBN6lWWHGyR3p57NUi6JNSZb3SUMhAWJCQ0YANxQUMfAHLQb7WAbmvoS0Z
         0bf8wQr4WdBphHfIXZIVU525Vee7FoH2R8F82P4WUDff4H7p5oIJrnoP/fPErXjUAmeg
         Jj3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787302350; x=1787907150;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wxIJbdtHu5EFzZttDmDXTiKHDXuSlZ7X22WCTLQoMi0=;
        b=Pde56N4aPL/PjmnM1E7ou7fF0HBcVI4g1jKrVm99POWM6Jx0OXBeFsFx1LsbYmjTwW
         B3eiQFvqiAV445h8MWR0xHgIhOAaRaDdqbL9UsPuM4w/NJVbL+pV3XT91dvYZz4VnTR0
         Bxkn1Mb5tnaAaH4FVvKOd3+LyCmC4QJ5NqqfBO/z8OQvtmYNXLvZUr00u2jaG6PXuxUD
         3Av5RfUrqtZjfqhhhkwyvgrYNuZr2Nyrmo9JqWyGUdVGyBZzWhoIlefZ+/YkZuXEkalD
         9k7uSfiFx3B3dDYetIRQSgqjaOwlY3nDw0GtUh822tvIblaY2VRGmTLPHtj83gkQg/ve
         oVyw==
X-Forwarded-Encrypted: i=1; AHgh+RoJlOV9ma/GqBrKh5YORxeNU0/Zn+WaAqEG8pYU9pFR2mBmBql+22NHbQygwit7yD3zVtJZ0LwmBYiqndWzpA==@lists.infradead.org
X-Gm-Message-State: AFuF++mOZR5BgWYoEb+THiMSWza3iTDogiJzZWZwxumJ/JnHZvyfrpPu
	mn1vu3VrGahOQArWD9ZnRYa4Df7mk7/AsTNWm+e7POMECAMlmE5xdpYW
X-Gm-Gg: AR+sD10gQUaOr2ZQelxkgzLq/Orqk36qW1oqKPl6985mYjvyAfnhXgrJAR3Smdwj4hp
	+MSSTGlb/yLX/PdQ0EGhXd5mfYHC0t8bajxByPLL92qjwl9VMYFM/U2TPOnm8HvRLiaLad4kt5k
	K0ByBdtASL4VjHod7iSQ+t2JZJr+9bvGPdHY55oILRpR4n+xKRegjbDpQzk45ZRWGE2GntSj6g3
	QiZOFpEIkqnDAYPE8UwSZS/0b/yYf7xAsp3orreoM3JGT22u5y2I4Npb51ofrVOV8jruARaYjVY
	+x4Cp1lH21T9/jA3YC5CfAolYKHqTg8RlunW5MymX/IKSVZu3tNrJVkxZ/CDd5w5S2GOBJCNJ8j
	RBOCxCW6JOVYVZMssvaIZ+6P6BL6zYwktPzUduXGNAfk6ZLGe1itJvv2nbsu7tKoq83ireVJzyK
	1dpZE2OC3nPt/kXZ/bRZh+vriiMNSO5K1p5zDWkc9W7nczK+kPI3dPTc7VdmIvjS8SSA5AzM7z9
	qNqYQ==
X-Received: by 2002:a17:907:94d2:b0:c19:473b:dc8f with SMTP id a640c23a62f3a-c246a2eb99amr471049166b.3.1787302349629;
        Fri, 21 Aug 2026 01:52:29 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain ([95.236.20.157])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-c2458b096d9sm422551466b.20.2026.08.21.01.52.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 01:52:28 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Ulf Hansson <ulfh@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
	Christian Marangi <ansuelsmth@gmail.com>,
	linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: stable@vger.kernel.org
Subject: [PATCH] pmdomain: airoha: fix unselectable AIROHA_CPU_PM_DOMAIN kconfig
Date: Fri, 21 Aug 2026 10:52:15 +0200
Message-ID: <20260821085222.140633-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260821_015232_804321_29CCBB80 
X-CRM114-Status: GOOD (  10.99  )
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

The AIROHA_CPU_PM_DOMAIN config was wrongly guarded under the Mediatek PM
Domains menu and was unselectable.

Move it outside the menu so it's now visible and correctly selectable by
default on Airoha SoC.

Cc: stable@vger.kernel.org
Fixes: 82e703dd438b ("pmdomain: airoha: Add Airoha CPU PM Domain support")
Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/pmdomain/mediatek/Kconfig | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/pmdomain/mediatek/Kconfig b/drivers/pmdomain/mediatek/Kconfig
index 8923e6516441..a2eb704a773c 100644
--- a/drivers/pmdomain/mediatek/Kconfig
+++ b/drivers/pmdomain/mediatek/Kconfig
@@ -43,9 +43,12 @@ config MTK_MFG_PM_DOMAIN
 	  This driver is required for the Mali GPU to work at all on MT8196 and
 	  MT6991.
 
+endmenu
+
 config AIROHA_CPU_PM_DOMAIN
 	tristate "Airoha CPU power domain"
 	default ARCH_AIROHA
+	depends on ARCH_AIROHA || COMPILE_TEST
 	depends on HAVE_ARM_SMCCC
 	depends on PM
 	select PM_GENERIC_DOMAINS
@@ -54,5 +57,3 @@ config AIROHA_CPU_PM_DOMAIN
 
 	  CPU frequency and power is controlled by ATF with SMC command to
 	  set performance states.
-
-endmenu
-- 
2.53.0


