Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 607E6CD98C7
	for <linux-mediatek@archiver.kernel.org>; Thu, 11 Jun 2026 23:12:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Date:From:
	Message-ID:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=chX5+4LVo+BT9/6liCDMzJGUd4v7o9vOEW+SNH6M1Ys=; b=iU5iI/V5z+iDpJWQZGtNLopdFE
	7Tvi+bFin7Ot4t9CFCdQM2MJYZ/Kx7g9uU/LqxhE3Qls8VM6yGKPLzyb5c1NUpMeAaWe84RVjdYif
	Vqwu+GnSx15Em9QZEkBKERjOHQDeKmNhXxnS1ioIKKUaUCOZkNx5r9w26D4zDUzQDL++cS9QVyFCY
	r8OLWfYpNQn/QjXOx22uNAcZfEDlMoHw/qfszA4MqVCugxwQrJ0zqAeugviJbCVPdcf2bYSJt5uOu
	IaSB+30rza9v9U59fertlRufI3lnZFDKQJuhBCtDY58MBUiWbQ/5l1+A9bbNZywnuRraaY3NoOBTW
	5uGwD0+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXoZm-0000000AA5x-1P8Q;
	Thu, 11 Jun 2026 23:12:42 +0000
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXoZi-0000000AA4P-39dy
	for linux-mediatek@lists.infradead.org;
	Thu, 11 Jun 2026 23:12:40 +0000
Received: by mail-pg1-x52e.google.com with SMTP id 41be03b00d2f7-c8629bed4e7so223551a12.2
        for <linux-mediatek@lists.infradead.org>; Thu, 11 Jun 2026 16:12:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781219557; x=1781824357; darn=lists.infradead.org;
        h=cc:to:subject:date:from:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=chX5+4LVo+BT9/6liCDMzJGUd4v7o9vOEW+SNH6M1Ys=;
        b=RSNutEzo+JUr8EnrHXtl/KgVETVadqheAWn/0eG9ZuqefOADjyifGY777vw7ktjRjZ
         YyClunceQrMqcXTgbOQCWdrLBI81W413vAkueyJznM3ya3GAj8/Qb3V8I81lNEmtZSAb
         30EbJlvig6i3PPOku3HH8olYOoir3OpSsV3RXvHU3A4z0cFBBElhxlNpBVQEv9XC64EW
         aHLyDrPWcdzYIwpeCrGCYIkcqyWiS9wnxKytwQ8Z49nzZcnQzUJ2n9jekurJ2Nr9SSPX
         tFTclnnl8clTQVzjyGQltxs3oir4oee85gra2bwipP1yAKtwc/+AxyP/GyD6uqr0jB3q
         zY+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781219557; x=1781824357;
        h=cc:to:subject:date:from:message-id:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=chX5+4LVo+BT9/6liCDMzJGUd4v7o9vOEW+SNH6M1Ys=;
        b=RBAMA4FuA+6v1ZYYmZm/3UTKkOBoBFppzyzsXST5QT1KoArSwFPrpqgPFgGiNtT0jw
         pNHv1KyRLtgsJ00FdHmUsuBX5ZVv3xP969e65JG3WleydBKb+UfQhbyYJRHE80zt3oXn
         LMzg1EQqVF43w6EXoYMvJG4mlf48faput8xQQrfGhscDhqaIAfeUcJYKRiZ5SlOQOMTt
         nVODOEn7JHsZ25vQ8mUMANmqcNdHrwenWJ4OfQTatewQAjQHPemP6ILnLNRh6yUln+18
         z2t8cdDfqot8zTQbZYU8epOdwmLTsAzTYQUCaK2Gei3gMDha6ECAnW9z8puvNPvXkevA
         orkw==
X-Forwarded-Encrypted: i=1; AFNElJ8H04GG64wZZ3LT74MBDB8cnIXiYHhFsT6k590rPFFjlkDCWuWqqigOtQ0Ec9Db5itl6iaSPCgaI38+xyrqww==@lists.infradead.org
X-Gm-Message-State: AOJu0YyedbAXxqpOuHcErF77gZjdeANiqaWdMfm43OUr6T7SBa8HU/fu
	JVVHvaQ8HlXAcvPA/+/35ZzHn8TN7o/saO+fCi/9Ga+TuV1UKyD+y2BX
X-Gm-Gg: Acq92OFGBHiDAfLR75qZJ2pWfY82fAI7Agpb4qBNHr+//MszGWKFokylGVZ/li5kRIP
	Ip4nGdoKJOFQhIS09A3Xd2chwnK+8SS5Lmz3x6B4hM5UDmyzZa3STlQLM88gCGxSukkLvTjGvRe
	lMAHFxfRZ2nBwviZlW7CdVPZmzssocJIKOQsKE02vb4WPO8fsymYKIwRbIB38Et4I4GuDj46wOl
	4HmJQasYHYVuzIoNJem/EcQI1PN9QyCqFpqdKEZwoQqZeurgwM/eUb2GzzN5qe+kozL751AQn5I
	63ErMgcMZTC9xKDigvGJVcHHf234Azf33yJDMOEHYpo4aYXoQkBxkWnoc4aDHckiQpHtJ9lS625
	AO7eTg8+ZDkvxFUtCl4ChU9oX5K2j/0AaG409n1Bu8Zn5mSfDdkginCOuniwUPX+HGZFH2K1cbK
	AFnOiKK5lajTLgpXLa
X-Received: by 2002:a05:6a00:802:b0:842:4bb9:5fe0 with SMTP id d2e1a72fcca58-8434cc0ae30mr152666b3a.10.1781219557320;
        Thu, 11 Jun 2026 16:12:37 -0700 (PDT)
Received: from [127.0.1.1] ([47.253.114.73])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8434afd100esm199571b3a.34.2026.06.11.16.12.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 16:12:36 -0700 (PDT)
Message-ID: <6a2b40e4.4dd82583.3a5c46.e52f@mx.google.com>
From: "Wayen.Yan" <win847@gmail.com>
Date: Fri, 12 Jun 2026 07:08:13 +0800
Subject: [PATCH] net: airoha: Fix variable shadowing in
 airoha_ppe_flush_sram_entries()
To: netdev@vger.kernel.org
Cc: lorenzo@kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260611_161238_816035_FA7916A5 
X-CRM114-Status: UNSURE (   8.35  )
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

In airoha_ppe_flush_sram_entries(), the inner "int err" declaration
shadows the outer "err" variable. When airoha_ppe_foe_commit_sram_entry()
fails and the loop breaks, the function returns the outer err which is
always 0, silently swallowing the error.

Remove the inner declaration so the assignment writes to the outer
variable and errors are properly propagated.

Fixes: 620d7b91aadb ("net: airoha: ppe: Flush PPE SRAM table during PPE setup")
Signed-off-by: Wayen.Yan <win847@gmail.com>
---
 drivers/net/ethernet/airoha/airoha_ppe.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/net/ethernet/airoha/airoha_ppe.c b/drivers/net/ethernet/airoha/airoha_ppe.c
index 5c9dff6..2b849d4 100644
--- a/drivers/net/ethernet/airoha/airoha_ppe.c
+++ b/drivers/net/ethernet/airoha/airoha_ppe.c
@@ -1333,8 +1333,6 @@ static int airoha_ppe_flush_sram_entries(struct airoha_ppe *ppe)
 	int i, err = 0;
 
 	for (i = 0; i < sram_num_entries; i++) {
-		int err;
-
 		memset(&hwe[i], 0, sizeof(*hwe));
 		err = airoha_ppe_foe_commit_sram_entry(ppe, i);
 		if (err)
-- 
2.51.0



