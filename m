Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E2A5E9A04D
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Feb 2026 00:40:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R8frkFgL2LcQ46RFOXtOLVg7ByeEmIT9eU+ttG4MBVU=; b=u2bouAyQRz1vkH6bBapQRNp+Dt
	xKWKs+LtcVDnmIZzEnGHKfqBk6Zwe2uJJIDhFtXaVF7WMIvIUc2sgYpUqpQ39IDWBhl4m/2z/X1WK
	W4KsMUom/tw6zlXBCn0mti5CmfiT/vKRgoKxfcpB8sd2mpNjCe5X3ivnY00voJrgHVaWiTqph3vEG
	KbdIefvD48U5YubImoj9EvUj4WHcb6NGInSFpbrRaI5y3tbFZjfWnyFyTa4r2KYOMfi2FflEQJxO+
	9AKhq/y+MgXiUDBx9ijdjMXV38iiLvMUZDSka8c+PBBYddE6RNpbPa1BDmN/0xJSx/OR0PON2NbYK
	b45YzhPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vss5o-0000000Ael2-107S;
	Thu, 19 Feb 2026 00:40:32 +0000
Received: from mail-oa1-f47.google.com ([209.85.160.47])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vss5l-0000000AehR-2TRN
	for linux-mediatek@lists.infradead.org;
	Thu, 19 Feb 2026 00:40:30 +0000
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-40ee196dd78so272768fac.1
        for <linux-mediatek@lists.infradead.org>; Wed, 18 Feb 2026 16:40:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771461628; x=1772066428;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=R8frkFgL2LcQ46RFOXtOLVg7ByeEmIT9eU+ttG4MBVU=;
        b=YEcXEHiIszLdcfrQIFsRQonvvVLcCcnbJNnI/AuQ34ZrhRmFWRcdwEKQPoFwS88GFr
         RHEYvG5RpLJ74Hn5zfAde/+s7d3BqzjHAh7DkLMYzt8ES6jBxipr8DWcIpsyJFTiEXjX
         pM/z8lRCbK8Hdp6QpWS/rxjLiNHsOKr5klXBg6Na+5OkxdQjlDXouwZ/SNlWkmvvbNyh
         pNvVEJodMuVR6N+pFBlDE95z8blmzO14pOnQOkCR3KBx3ovtWVRHlcHGQLubG5BmW3mR
         y5BP+ecb1JjsB6PgdvugluRo6m/CelT81O1qrq6bJCDqW/zSoSiip7a6qv67TlKW/yyA
         LSDA==
X-Forwarded-Encrypted: i=1; AJvYcCXlyLLu7Ao+ICv7gRU0W9Ihapz2JsXYEuquTWoNxuw6o14CibqaN8KnTfmeorVrQwyCFb3Feef/onBXXxPm8w==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx9YmRTwb3FSHhPdQJ9N+UYYGY5pII2+I2y1RBeuJ3LTCXRkQYR
	B5CONh5/0F4hN29bUq0bfvoD3BIUsEI2AZgGEiS/iXwt1CLtDHN5FDZK
X-Gm-Gg: AZuq6aJWhdouVJaekZEDbGYpYtu0UDLEGwsW8PBGuCZ+iuyXKdVgkHjCGqgsNn0Qln/
	XyS3JZFKYTEl/DI5wgo9um2tireYeN8UmVKeDQhfCMDiFhL0bY016V215nFrvoOJK+BGWX+GRFT
	J/wwDdDBeND/+ZX4VfAB27089u0+BndfmC2AMQAhdVHBxbQJLNma1T6NtOKmLf8UJ580gWWRLvt
	LfubwbVz4q1rpw/zNanZ0TT3JGsfXrMBbIsiJXLid3HSWTwOEiv+hr6cMe3bw+1DQOPAbHyo7al
	l2L5Vw3BH6wbmsMZ7FAicru88pOgwd02ucR6Rl2RlEXVgYNsfoQqsRDovMSDcPCOC0NG/xFgX/g
	veUe7pmpr18fIYeCsyWGVZGFtW+xz1YIDPinMZhoM0W8RhI5nG/Scs7/4h7KlYbfz6RsflojJR3
	XOmQeeUnlFOFhqr8SceFkVUELQ2/Ha2OdXQaySepv4ncbWlXI=
X-Received: by 2002:a05:6870:37cc:b0:413:9c82:8742 with SMTP id 586e51a60fabf-415458deaeemr52956fac.27.1771461628511;
        Wed, 18 Feb 2026 16:40:28 -0800 (PST)
Received: from sean-HP-EliteBook-830-G6.lan ([207.191.35.252])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-40eaee45d12sm23477659fac.1.2026.02.18.16.40.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Feb 2026 16:40:28 -0800 (PST)
From: sean.wang@kernel.org
To: nbd@nbd.name,
	lorenzo.bianconi@redhat.com
Cc: linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Sean Wang <sean.wang@mediatek.com>,
	Xiong Huang <xiong.huang@mediatek.com>
Subject: [PATCH 10/11] wifi: mt76: mt7921: add MT7902 PCIe device support
Date: Wed, 18 Feb 2026 18:40:06 -0600
Message-ID: <20260219004007.19733-10-sean.wang@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260219004007.19733-1-sean.wang@kernel.org>
References: <20260219004007.19733-1-sean.wang@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260218_164029_629119_F3FD8A28 
X-CRM114-Status: UNSURE (   9.43  )
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

From: Sean Wang <sean.wang@mediatek.com>

Register the MT7902 PCI device ID in the mt7921 driver and add its
corresponding firmware and ROM patch names.

Co-developed-by: Xiong Huang <xiong.huang@mediatek.com>
Signed-off-by: Xiong Huang <xiong.huang@mediatek.com>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7921/pci.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/pci.c b/drivers/net/wireless/mediatek/mt76/mt7921/pci.c
index 6bb3c6a1cf6a..7a790ddf43bb 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/pci.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/pci.c
@@ -26,6 +26,8 @@ static const struct pci_device_id mt7921_pci_device_table[] = {
 		.driver_data = (kernel_ulong_t)MT7922_FIRMWARE_WM },
 	{ PCI_DEVICE(PCI_VENDOR_ID_MEDIATEK, 0x7920),
 		.driver_data = (kernel_ulong_t)MT7920_FIRMWARE_WM },
+	{ PCI_DEVICE(PCI_VENDOR_ID_MEDIATEK, 0x7902),
+		.driver_data = (kernel_ulong_t)MT7902_FIRMWARE_WM },
 	{ },
 };
 
@@ -617,6 +619,8 @@ MODULE_FIRMWARE(MT7921_FIRMWARE_WM);
 MODULE_FIRMWARE(MT7921_ROM_PATCH);
 MODULE_FIRMWARE(MT7922_FIRMWARE_WM);
 MODULE_FIRMWARE(MT7922_ROM_PATCH);
+MODULE_FIRMWARE(MT7902_FIRMWARE_WM);
+MODULE_FIRMWARE(MT7902_ROM_PATCH);
 MODULE_AUTHOR("Sean Wang <sean.wang@mediatek.com>");
 MODULE_AUTHOR("Lorenzo Bianconi <lorenzo@kernel.org>");
 MODULE_DESCRIPTION("MediaTek MT7921E (PCIe) wireless driver");
-- 
2.43.0


