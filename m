Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7134CE9A02C
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Feb 2026 00:40:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2KVGtyL16XjDOB5+IDsHdTUZ/GMHT4lDhgpqrINKBkU=; b=CoJTZ5zFwyWUO8niDUyQKUNgIz
	+fP6hpDhwn6rr+HDAfGA9FSRziiF2NLw66OGQnjNsaROYVmxu1yc2TeBmNkZdbSvgiE21nXaYauHp
	4I4NaULh4x3kptBOCHqT4th/SfOK0er1k5Dd+8hMojHKqOuuyORKfK2BSPsv0QSAlZVNsMeloqfz8
	ao78Iv+6QL1I4bj3SIRqMW3M9R9V33YBQrj6LlyvFSlrhZXhIOp/LKzEQwlylEOgSMkhoktncKdWU
	kmTp8Vcwqv45W8YPI4JtWoHZKdeDNC7jjLzXktkA4I+epcu7rO+CNwmwAMFioQ3GHW49w74Tj24vM
	hDT7k+LQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vss5p-0000000Aelw-22EG;
	Thu, 19 Feb 2026 00:40:33 +0000
Received: from mail-oi1-f178.google.com ([209.85.167.178])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vss5n-0000000Aek3-3LsL
	for linux-mediatek@lists.infradead.org;
	Thu, 19 Feb 2026 00:40:32 +0000
Received: by mail-oi1-f178.google.com with SMTP id 5614622812f47-463960df4f9so249769b6e.0
        for <linux-mediatek@lists.infradead.org>; Wed, 18 Feb 2026 16:40:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771461631; x=1772066431;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2KVGtyL16XjDOB5+IDsHdTUZ/GMHT4lDhgpqrINKBkU=;
        b=mrhPKagQsk4id+zRY07GATZJX5brm5yXuRmEZzmtJU+t5ZPHJ5N7moJ2lWoiN8tCPE
         GRUizmTpcu8w+onFWiSUW3gPFO5h+BPmL3bcpVufVF3jNpQxJiKEyf9dIj9rbya6QHw5
         yTVn+WwnVWY++8NkEtHHi29t/6qhQMZFb1oDbX5f9W4bd/tLfvcpPMaYWsJ+j379VMBo
         z4ttI3Sgs7k7JwsSklYjNiQ9zDLX3MjPavAA5a0jgZ6OrzP28M0Vseq8q8hwZMCgbry2
         I0R5ats8TIXGjjzp3toexiXAiSt2PQeDU4sAEytditktW8iuVOv21LgM+o2031iLTqDl
         TLdw==
X-Forwarded-Encrypted: i=1; AJvYcCWpVQCsmZUdkileegp2LV+p9P/mQF6aeP3y58k3zzZoV60sE3bCW6R/pHrbxMoRd9kV3U1QS8095rW+etZNxQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YyAt+/XZ44H+WkMHlUh/1fhYH8P0beekOY/NIYNh1OvaSBbAuJF
	gUshfgFphxn2xTYU2xhZp8QZhO2qPHZsb3ZzIta/O1sLImPB+8c4xasKRY5PyQ==
X-Gm-Gg: AZuq6aJwdsXYuR4onM++1SbN90KMy0UyD99k7MDCcLIg84SOgSkrdD1SnJs3ps8Mwn7
	lDrKAlQjquJkyqb+sU3sS/G+TBQGwrWLnrGGwsvcNVJAJdr6TOmalrqm7ZF8aGZFQ+6TUOQUd/S
	hXChQ3Mk+aNEBay3TuDVZJLzAvhS6/wSx7RJysq+orNEqkMhzt+G3rFAW+61M/BDS3kyasrWSdt
	98rgf8fxPnmTd9I8pcTB9sdgB7SNSxyKogXq6Cg1jBp13Bqi/wIXDGxfDTXuf5/O2AbVlmZ+cr9
	kcrH3MWmhpg/DDrD5mk6wsWsQdnCM976vrzb2ij6S5yhprqgJ8/jou8tGoYfbLgygU9V5KOkhh8
	huKk9FnR5LHQKh4ISx3ZBPu4cnPKQPbFNsAGOw4IHcaGY4efZHUYBmOTLpup8oWiM9a9pKC08D+
	pM3CzN9D5dQktMZw9uRX+7Q9dq7eftScaTaSu3UQjPcaowpMQ=
X-Received: by 2002:a05:6808:2445:b0:450:5e3a:6f1a with SMTP id 5614622812f47-463b3f655e2mr8759789b6e.20.1771461630814;
        Wed, 18 Feb 2026 16:40:30 -0800 (PST)
Received: from sean-HP-EliteBook-830-G6.lan ([207.191.35.252])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-40eaee45d12sm23477659fac.1.2026.02.18.16.40.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Feb 2026 16:40:29 -0800 (PST)
From: sean.wang@kernel.org
To: nbd@nbd.name,
	lorenzo.bianconi@redhat.com
Cc: linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Sean Wang <sean.wang@mediatek.com>
Subject: [PATCH 11/11] wifi: mt76: mt7921: add MT7902 SDIO device support
Date: Wed, 18 Feb 2026 18:40:07 -0600
Message-ID: <20260219004007.19733-11-sean.wang@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260219004007.19733-1-sean.wang@kernel.org>
References: <20260219004007.19733-1-sean.wang@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260218_164031_847934_54EDA0AF 
X-CRM114-Status: GOOD (  10.45  )
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

Register the MT7902 SDIO device ID in the mt7921 driver and add its
corresponding firmware and ROM patch names.

Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7921/sdio.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/sdio.c b/drivers/net/wireless/mediatek/mt76/mt7921/sdio.c
index 3421e53dc948..9150f185716c 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/sdio.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/sdio.c
@@ -19,6 +19,8 @@
 static const struct sdio_device_id mt7921s_table[] = {
 	{ SDIO_DEVICE(SDIO_VENDOR_ID_MEDIATEK, 0x7901),
 		.driver_data = (kernel_ulong_t)MT7921_FIRMWARE_WM },
+	{ SDIO_DEVICE(SDIO_VENDOR_ID_MEDIATEK, 0x7902),
+		.driver_data = (kernel_ulong_t)MT7902_FIRMWARE_WM },
 	{ }	/* Terminating entry */
 };
 
@@ -317,6 +319,8 @@ static int mt7921s_resume(struct device *__dev)
 MODULE_DEVICE_TABLE(sdio, mt7921s_table);
 MODULE_FIRMWARE(MT7921_FIRMWARE_WM);
 MODULE_FIRMWARE(MT7921_ROM_PATCH);
+MODULE_FIRMWARE(MT7902_FIRMWARE_WM);
+MODULE_FIRMWARE(MT7902_ROM_PATCH);
 
 static DEFINE_SIMPLE_DEV_PM_OPS(mt7921s_pm_ops, mt7921s_suspend, mt7921s_resume);
 
-- 
2.43.0


