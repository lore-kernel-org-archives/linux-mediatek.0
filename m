Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 421D4CD98C5
	for <linux-mediatek@archiver.kernel.org>; Sun, 14 Jun 2026 09:01:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:Cc:To:From:
	Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=AeCTcCGBmXaeoE0gLM8C1mS8ZMOJYPKoEcB5kH+0npk=; b=EwrjeGsjoLSKNmSd+LoRnIyUFz
	lFiY+0nUSIU8daV7bk6GM3fr/SizU7fAA7DHJV60LhqZZAstfq3k9SW4Uj0UYZvru+N1gs/vsN1g+
	790o0IcfCoCNqYQTCbmwTcJXON8p+RsWA/ch67cM113s4SI9NEa1dvwPRzvpFzlgioEnJquWZuiyL
	zu391sLlw1iYJoCjN+DPolKOtt4iKpLgNFymzYsv1Rx5KDqCa0sXw1pv+2WHyep+Al3IN3rN11b27
	r6WXoLIchKmdGUyuR18XN9cyJaxihujWBX2Rgobn3o9j/2clWnNLXauoeUI0HA4sdq2qLtMsY1gKB
	1dP12pTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYgip-0000000Cpjn-33Cf;
	Sun, 14 Jun 2026 09:01:39 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYgim-0000000CpjS-3kFi
	for linux-mediatek@lists.infradead.org;
	Sun, 14 Jun 2026 09:01:38 +0000
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-8422871b42dso1433185b3a.3
        for <linux-mediatek@lists.infradead.org>; Sun, 14 Jun 2026 02:01:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781427695; x=1782032495; darn=lists.infradead.org;
        h=message-id:date:cc:to:from:subject:content-transfer-encoding
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=AeCTcCGBmXaeoE0gLM8C1mS8ZMOJYPKoEcB5kH+0npk=;
        b=gUqK0zA9uAaojsc56OLX5Li2y1CdzA4MpANzlYkxicJsYMSW3vzVK50Foj8SJVYeLA
         86iiQHJI4g+najSZcnPIES+pYThfgkCnvxi9uLZqWIaTsbK1Pl+0hWF/XrHMVr9bCEOr
         h8KMuEzsp1qSjWWWX58zYjRm0JzH5ER3Fln56XJMSoqnGTl3sjsC48Xkhp88JFbwekPA
         Nomq5QHag+/RzqW6YY0QTLJWvIKeJnrWz5fEfKfJBSrCJjreKfT419V9DZgUDTLJfHGK
         Klq3dG9Y/ETvPTmgGz8rd4AYPcYqlIXvenbBCVjPAoDGF7EFoOGrzQKu9prW6rMOm3/6
         rx7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781427695; x=1782032495;
        h=message-id:date:cc:to:from:subject:content-transfer-encoding
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AeCTcCGBmXaeoE0gLM8C1mS8ZMOJYPKoEcB5kH+0npk=;
        b=VVQ1vsn18Aiqg+AWN5teF6ssNYkPa6u1XscH+L8eMMJMdzIUgDrXjtnRbP5eGSjtQe
         2TZO/D9oBubc2bfMoWxizA5jW/NptF43QfteEt1g0ESubUMHOSyQoHpUZH2NrBopcYne
         +pCXK7xTnq1lXaS3+oRoxZgaaQcIvHdJ03pyGsRdHMdRhaRk3q2Gt9kbCPEK2PGuU3Ph
         c/eEMIIK72tkyApOb1QnICVNkNMYzV2J1a3yqEBxOrWIA6eZ0SnOxT23hOrFcYEz5oQI
         7fivCMnD6jundrVDKlG4XUSBslj5AvaGn3UflGhvpkB0EHYJavWX+LDi6DnoX/foq5xl
         fJ5w==
X-Forwarded-Encrypted: i=1; AFNElJ8dOjDzgCpDvbdtim9wrXHG5C0Kc4BARMvmkusFvGzBlTl4cLQmFudy1mm96TrBGSGxSji/dzXCmAFe1ha4NA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxjRqjJi3oF/P4JInbnQCrdapYjfyuu/Uljp/5DdVaAwHCEDOw/
	CdJEoHE8hTl2VhtLSILvOekZzDGNhLgT98eTzonafp/b0O+wV2Zdv4LY
X-Gm-Gg: Acq92OHDIDwGIP3UJ8E3kcLod3OsJhRXecC5RIUOFCVck+tYiZSomafN2g1bLnoPyEv
	FY8TyqFcywtbh2IXMhOxkUhw/n2gv7LCv158UcIOh6lEJFEALayzIywtAOxkqmwxvYm3ZDiGn5e
	jDEjlQaNRnt5EAW/lmerCmBmnOf/wuyB55OPhfO2Ni6ZZ+umlqMP7toj+UiB46B5DeiNMGPjnBq
	H4XsXujzTmI6InNj5XJVeaZBPC0gKAJTAHeyV/SMMhMPHxEKyNVUFCpGW74mVx7AKb7PLg73NJV
	wZY73xwWas5MGbZqveHRLorkA6F03fI0gOJ52/LzDvfVc2OIbR8949yyguIdPofRz1MRXh7jpzn
	LLAUWRTHb4DfygZa8ZPYekdhB9ZB8Pa+nE0DiD3BH0veak40AIvg1O2DROCyfIvBlLwL68+c7Y1
	ubzia5S4B4pBFID3tl
X-Received: by 2002:a05:6a00:f93:b0:842:46a6:e2cf with SMTP id d2e1a72fcca58-8434ce46552mr10855896b3a.21.1781427695533;
        Sun, 14 Jun 2026 02:01:35 -0700 (PDT)
Received: from [127.0.1.1] ([47.253.114.73])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8434accbc89sm7073038b3a.15.2026.06.14.02.01.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Jun 2026 02:01:35 -0700 (PDT)
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [PATCH] pinctrl: airoha: Fix AN7583 Pin 21 BIT duplicate in conf tables
From: Wayen Yan <win847@gmail.com>
To: linux-gpio@vger.kernel.org
Cc: Lorenzo Bianconi <lorenzo@kernel.org>, Christian Marangi <ansuelsmth@gmail.com>, Linus Walleij <linusw@kernel.org>, linux-mediatek@lists.infradead.org
Date: Sun, 14 Jun 2026 17:01:30 +0800
Message-ID: <178142769046.1925774.12629229026406925492@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260614_020136_962063_283156B5 
X-CRM114-Status: UNSURE (   9.28  )
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

From 5ed6ed42e17baf059bfaf1ba0ab5fc484f854659 Mon Sep 17 00:00:00 2001
From: "Wayen.Yan" <win847@gmail.com>
Date: Sun, 14 Jun 2026 16:56:18 +0800
Subject: [PATCH] pinctrl: airoha: Fix AN7583 Pin 21 BIT duplicate in conf
 tables

AN7583 pinctrl configuration tables have Pin 20 and Pin 21 both mapped
to BIT(18), causing pin 21 configuration to incorrectly modify pin 20.

Fixes the following tables:
- an7583_pinctrl_pullup_conf
- an7583_pinctrl_pulldown_conf
- an7583_pinctrl_drive_e2_conf
- an7583_pinctrl_drive_e4_conf

Pin 18-22 sequence should be: BIT(16), BIT(17), BIT(18), BIT(19), BIT(20)

Fixes: 3ffeb17a9a27 ("pinctrl: airoha: add support for Airoha AN7583 PINs")
Signed-off-by: Wayen Yan <win847@gmail.com>
---
 drivers/pinctrl/mediatek/pinctrl-airoha.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/pinctrl/mediatek/pinctrl-airoha.c b/drivers/pinctrl/mediatek/pinctrl-airoha.c
index 995ba6175c..f325ca41d3 100644
--- a/drivers/pinctrl/mediatek/pinctrl-airoha.c
+++ b/drivers/pinctrl/mediatek/pinctrl-airoha.c
@@ -1847,7 +1847,7 @@ static const struct airoha_pinctrl_conf an7583_pinctrl_pullup_conf[] = {
 	PINCTRL_CONF_DESC(18, REG_GPIO_L_PU, BIT(16)),
 	PINCTRL_CONF_DESC(19, REG_GPIO_L_PU, BIT(17)),
 	PINCTRL_CONF_DESC(20, REG_GPIO_L_PU, BIT(18)),
-	PINCTRL_CONF_DESC(21, REG_GPIO_L_PU, BIT(18)),
+	PINCTRL_CONF_DESC(21, REG_GPIO_L_PU, BIT(19)),
 	PINCTRL_CONF_DESC(22, REG_GPIO_L_PU, BIT(20)),
 	PINCTRL_CONF_DESC(23, REG_GPIO_L_PU, BIT(21)),
 	PINCTRL_CONF_DESC(24, REG_GPIO_L_PU, BIT(22)),
@@ -1964,7 +1964,7 @@ static const struct airoha_pinctrl_conf an7583_pinctrl_pulldown_conf[] = {
 	PINCTRL_CONF_DESC(18, REG_GPIO_L_PD, BIT(16)),
 	PINCTRL_CONF_DESC(19, REG_GPIO_L_PD, BIT(17)),
 	PINCTRL_CONF_DESC(20, REG_GPIO_L_PD, BIT(18)),
-	PINCTRL_CONF_DESC(21, REG_GPIO_L_PD, BIT(18)),
+	PINCTRL_CONF_DESC(21, REG_GPIO_L_PD, BIT(19)),
 	PINCTRL_CONF_DESC(22, REG_GPIO_L_PD, BIT(20)),
 	PINCTRL_CONF_DESC(23, REG_GPIO_L_PD, BIT(21)),
 	PINCTRL_CONF_DESC(24, REG_GPIO_L_PD, BIT(22)),
@@ -2081,7 +2081,7 @@ static const struct airoha_pinctrl_conf an7583_pinctrl_drive_e2_conf[] = {
 	PINCTRL_CONF_DESC(18, REG_GPIO_L_E2, BIT(16)),
 	PINCTRL_CONF_DESC(19, REG_GPIO_L_E2, BIT(17)),
 	PINCTRL_CONF_DESC(20, REG_GPIO_L_E2, BIT(18)),
-	PINCTRL_CONF_DESC(21, REG_GPIO_L_E2, BIT(18)),
+	PINCTRL_CONF_DESC(21, REG_GPIO_L_E2, BIT(19)),
 	PINCTRL_CONF_DESC(22, REG_GPIO_L_E2, BIT(20)),
 	PINCTRL_CONF_DESC(23, REG_GPIO_L_E2, BIT(21)),
 	PINCTRL_CONF_DESC(24, REG_GPIO_L_E2, BIT(22)),
@@ -2198,7 +2198,7 @@ static const struct airoha_pinctrl_conf an7583_pinctrl_drive_e4_conf[] = {
 	PINCTRL_CONF_DESC(18, REG_GPIO_L_E4, BIT(16)),
 	PINCTRL_CONF_DESC(19, REG_GPIO_L_E4, BIT(17)),
 	PINCTRL_CONF_DESC(20, REG_GPIO_L_E4, BIT(18)),
-	PINCTRL_CONF_DESC(21, REG_GPIO_L_E4, BIT(18)),
+	PINCTRL_CONF_DESC(21, REG_GPIO_L_E4, BIT(19)),
 	PINCTRL_CONF_DESC(22, REG_GPIO_L_E4, BIT(20)),
 	PINCTRL_CONF_DESC(23, REG_GPIO_L_E4, BIT(21)),
 	PINCTRL_CONF_DESC(24, REG_GPIO_L_E4, BIT(22)),
-- 
2.51.0


