Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71B83C43334
	for <linux-mediatek@archiver.kernel.org>; Fri, 15 Jul 2022 19:59:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HL4YqkhHTZulmVGkQ727X6hpWd2MP1vP+U3JHn48XIg=; b=sZffj2WMMpHybiAl6Nr31lBr7D
	7QF8s3cei2rfwcWFXMMsoMM5dYvN1y4HSuvHN7vEiShFYFDGY8EoBWPQf7h64QOS+J7iniFEB1X2S
	Ny9PWfrRLquNzmclLa12eAjpyCvH7MIWeMersvWudvv3R1arOUBy/Ey6QGol1SAw1GEtBpR3ALqHM
	hk9wXwYYXnuvUdV98qltv6v11HwjGTRNQc4fmoxK2pwuZVgwRgnIibEchM9jruXBTpomPwxPnLort
	YcUWlY4r8EYeVfQ2/BKPHWrsEl0uB5w5lv0EMEQarYa1olZSf9nebhV46yj4PS9Y5gCjO3gqcgaXU
	VvvuYbJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oCRTa-00A01s-Cs; Fri, 15 Jul 2022 19:59:50 +0000
Received: from mail-pj1-f50.google.com ([209.85.216.50])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oCRTV-009zxn-6u
	for linux-mediatek@lists.infradead.org; Fri, 15 Jul 2022 19:59:46 +0000
Received: by mail-pj1-f50.google.com with SMTP id q5-20020a17090a304500b001efcc885cc4so7097255pjl.4
        for <linux-mediatek@lists.infradead.org>; Fri, 15 Jul 2022 12:59:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=HL4YqkhHTZulmVGkQ727X6hpWd2MP1vP+U3JHn48XIg=;
        b=OUNe9lbu8E20TY7A9V+g8/wvILCUoCS5xdeS0c60f+bhDsO7VJz0eRzn/qjy3/bAxI
         VNclJnTAlqkDHk08PY3y8FuHxzDk0nLvtiX35CRXSa/jykFRVITCv9UtD5o8ba36tP15
         yV5logNkajYM1WWo64JUCCEcPnPkmUq/7g4NcloTcI2wUnMhKLHXIJgrhPm/jZuVUHDL
         QBHcJhUAWLCR7ggOJp1vFuSVbb/WsHZZFEbEZa+sinFJL/JrqKRIckedGhvz+Gi9pRUf
         R3BwlYh+loemKw0+ljV6wFTj460Y/wfEj43Hs7Fzi6s1xGopAm/AELlfMT0DepeSLPIe
         7yvQ==
X-Gm-Message-State: AJIora/hImv7M5F3nHfmLv0yQYSNlLYpi8I62Grwxw1AD4dGMRu158LR
	YL7SM+k45ADNy9jVD8Cvipc=
X-Google-Smtp-Source: AGRyM1ukmZfUzuo48kaMe5GDLlJagmXC8YovtfPvTQyT4c6UyqIKlUNyVjgw7YKbJ1QDyS4v2d0GSQ==
X-Received: by 2002:a17:902:d2c8:b0:16c:58d:7278 with SMTP id n8-20020a170902d2c800b0016c058d7278mr15621362plc.45.1657915184160;
        Fri, 15 Jul 2022 12:59:44 -0700 (PDT)
Received: from sean-ThinkPad-T450s.lan (c-73-71-21-1.hsd1.ca.comcast.net. [73.71.21.1])
        by smtp.gmail.com with ESMTPSA id y1-20020a62ce01000000b00528bc6d8939sm4224629pfg.157.2022.07.15.12.59.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Jul 2022 12:59:43 -0700 (PDT)
From: sean.wang@kernel.org
To: stable@vger.kernel.org
Cc: linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Felix Fietkau <nbd@nbd.name>
Subject: [PATCH v2 5.15 5/5] mt76: mt7921: Fix the error handling path of mt7921_pci_probe()
Date: Fri, 15 Jul 2022 12:59:26 -0700
Message-Id: <768b04c445f39ad1fc166b98be8154bd413f978a.1657915079.git.sean.wang@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <27b8ccd411f2c51e2b8193a4eb1fa7e6f416a2f0.1657915079.git.sean.wang@kernel.org>
References: <27b8ccd411f2c51e2b8193a4eb1fa7e6f416a2f0.1657915079.git.sean.wang@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220715_125945_310292_7D8A8600 
X-CRM114-Status: GOOD (  11.59  )
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

From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

commit 4e90db5e21eb3bb272fe47386dc3506755e209e9 upstream.

In case of error, some resources must be freed, as already done above and
below the devm_kmemdup() and __mt7921e_mcu_drv_pmctrl() calls added in the
commit in Fixes:.

Fixes: 602cc0c9618a ("mt76: mt7921e: fix possible probe failure after reboot")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Signed-off-by: Felix Fietkau <nbd@nbd.name>
---
v2: no changed
---
 drivers/net/wireless/mediatek/mt76/mt7921/pci.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/pci.c b/drivers/net/wireless/mediatek/mt76/mt7921/pci.c
index 815b926e52e9..36e6495ae658 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/pci.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/pci.c
@@ -254,8 +254,10 @@ static int mt7921_pci_probe(struct pci_dev *pdev,
 	dev->bus_ops = dev->mt76.bus;
 	bus_ops = devm_kmemdup(dev->mt76.dev, dev->bus_ops, sizeof(*bus_ops),
 			       GFP_KERNEL);
-	if (!bus_ops)
-		return -ENOMEM;
+	if (!bus_ops) {
+		ret = -ENOMEM;
+		goto err_free_dev;
+	}
 
 	bus_ops->rr = mt7921_rr;
 	bus_ops->wr = mt7921_wr;
@@ -264,7 +266,7 @@ static int mt7921_pci_probe(struct pci_dev *pdev,
 
 	ret = __mt7921e_mcu_drv_pmctrl(dev);
 	if (ret)
-		return ret;
+		goto err_free_dev;
 
 	mdev->rev = (mt7921_l1_rr(dev, MT_HW_CHIPID) << 16) |
 		    (mt7921_l1_rr(dev, MT_HW_REV) & 0xff);
-- 
2.25.1


