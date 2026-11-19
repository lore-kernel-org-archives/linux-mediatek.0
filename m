Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 954DC606A326
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Nov 2026 16:41:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=aypFmI9I;
	dkim=pass (2048-bit key) header.d=cjdns.fr header.i=@cjdns.fr header.a=rsa-sha256 header.s=dkim header.b=XCeITSHN
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=nxP0zUDfPSiyGCVRDOR3qEnGVvd7XxArnZcAUdY01IM=; b=aypFmI9IxiRufN
	gEpVQj+fRhU2sJJal7aMHCjhW6SJ3XC/6FS1vd4lLVH42f/EYPh6/ZraND6rzc/CxgOousQOxalb3
	1qVRHVDUB4JYB3N1O6LsFMgxFb0kn0Dx5qHnTR6uCsy1tD8I8xwogljQZkWp3CQPaXUecF0tzK1Sm
	6GkdJTDG4OjsgeyFRZnxu4R5whM0+FnVay/RElnDPmDPeTOAqY9M/RA2wwMlK84v5KHyvn4NGYzPv
	GAsThrc3wDXqvTUNu7gEdI4oHakxJx7mngYnnQzJcVjXkKgrG2yY/1i97L9SG/P/MuGBKA6UqRKLN
	Hy4SLn8sbYNPEqXfF6lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU5CB-0000000CgSp-1NRG;
	Thu, 19 Nov 2026 16:41:11 +0000
Received: from mail.cjdns.fr ([5.135.140.105])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU5Bz-0000000CgKM-1BmV;
	Thu, 19 Nov 2026 16:41:00 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 06D62571036;
	Thu, 19 Nov 2026 17:40:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cjdns.fr; s=dkim;
	t=1795106454; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=nxP0zUDfPSiyGCVRDOR3qEnGVvd7XxArnZcAUdY01IM=;
	b=XCeITSHNHtCzo3Q0U1DwBnoh4FXO9cTky0gnJK90pOAXTG5gOpYDwWcZQgzfx/aFHOfttz
	/fllntvUb4n0tO3u8PQXkkO/taNJEfIznYfdbSnVH1zJ58cGpJ71acXngXDsyFfw9WD8Vz
	HdtsaadSBYKCC98mIKLGEP5YPGkNcENHwcKMw5mBtPS0rYM4yVwL4uhuy6KcSjkyegT5/g
	tF2kkJ0I3ud2sPEL/huDVUCXBd2FexV/YFQk/YZNzCYfHZPr4QtFhtGof45lFeLeUOoQtY
	kDmCN9oHE/7lH9Jrzq82pi+HBLPz4Q26Sz7eJ0BwISPVBdSY7Vu6f10mpliOtw==
From: Caleb James DeLisle <cjd@cjdns.fr>
To: linux-i2c@vger.kernel.org
Cc: sr@denx.de,
	andi.shyti@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Caleb James DeLisle <cjd@cjdns.fr>
Subject: [PATCH 2/2] i2c: mt7621: enable for EcoNet devices
Date: Thu, 19 Nov 2026 16:40:40 +0000
Message-Id: <20261119164040.2400580-3-cjd@cjdns.fr>
In-Reply-To: <20261119164040.2400580-1-cjd@cjdns.fr>
References: <20261119164040.2400580-1-cjd@cjdns.fr>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_084059_606640_7EFF1075 
X-CRM114-Status: GOOD (  10.05  )
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
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

EcoNet EN751221 uses the same I2C subsystem as the MT7621, allow
selection of this driver when building for EcoNet devices.

Signed-off-by: Caleb James DeLisle <cjd@cjdns.fr>
---
 drivers/i2c/busses/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
index 275aaa7f35833..9295a35f4a181 100644
--- a/drivers/i2c/busses/Kconfig
+++ b/drivers/i2c/busses/Kconfig
@@ -918,7 +918,7 @@ config I2C_MT65XX
 
 config I2C_MT7621
 	tristate "MT7621/MT7628 I2C Controller"
-	depends on (RALINK && (SOC_MT7620 || SOC_MT7621)) || ARCH_AIROHA || COMPILE_TEST
+	depends on (RALINK && (SOC_MT7620 || SOC_MT7621)) || ARCH_AIROHA || ECONET || COMPILE_TEST
 	help
 	  Say Y here to include support for I2C controller in the
 	  MediaTek MT7621/MT7628 SoCs.
-- 
2.39.5


