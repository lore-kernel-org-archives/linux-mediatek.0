Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0215FE77188
	for <linux-mediatek@archiver.kernel.org>; Thu, 16 Jan 2025 04:50:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=+oUEeSVLxJyACe9zcGnIcrOr/UNqBupfY9WFzURq6nE=; b=S8L+tKYv95mbIf7d0rcoPHsLbL
	PKqPQoU0RAA6GEKpFZZ7I+fetjY0I20gdKB94IY7zjRKDXlApcHQPongfT7qLN2Bw2ErwMceoPuoM
	E10VdcsaO9Jt12JMOJH3jL8mBfWY7aVYvwiGzl7lZSCWRSYWl0bO2JbCMinwUQ1sVPKR5EPO14Dfb
	Ei093RkPdS+6OzFEKdtpXJj7vmWwx6/1rMayvdG3OAE1x2xnnKw+y7q/2UiedZqqHv1Ge0el6Y97l
	5kBhZ5QsWjRQUf17PMPeHPCz7PCSkc1CWzHqykdb9hSs/+3C8dy+TcY6sffqji3vVof3sOhhi7/1z
	E+A9kJAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYHpy-0000000DpJF-0QSG;
	Thu, 16 Jan 2025 04:50:34 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYHoh-0000000DpBb-1AIZ
	for linux-mediatek@lists.infradead.org;
	Thu, 16 Jan 2025 04:49:16 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-21628b3fe7dso7554495ad.3
        for <linux-mediatek@lists.infradead.org>; Wed, 15 Jan 2025 20:49:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com; s=20230601; t=1737002954; x=1737607754; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+oUEeSVLxJyACe9zcGnIcrOr/UNqBupfY9WFzURq6nE=;
        b=IsqYYMiPqrl2GsPTVgp+GJDrkcrnFskkCT4MzHEiBJpsgTxqleBflUbO2ud6KHn58l
         KJfMH9c8jPtg9BdIHq/n0G4o/iEbRR4gReJJanuIRmob+FCYwfTMBgPULtqUgvz3N4JD
         FdnjX7g2EiF2K32Jjn/pgQHtrqdDgpsI8RlpS8dwhhL3M9m6FneJIcpY4txo7ICjhFHf
         eUPtUsxhRaVXkgopc/4sDzqiZKX1+5/UJHyYPgDARrBHp5Acbc9a0N+m/ueIMCQKtTUG
         8dQ74WDGuljoA4tR93hmDuc93u3Yf1uZBPJIbs4zlSKoe+/9oPb3lIN0vqdYKQ5fjKqV
         Hqfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737002954; x=1737607754;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+oUEeSVLxJyACe9zcGnIcrOr/UNqBupfY9WFzURq6nE=;
        b=evJodmq4RvP4GUbLm56Ho/Mr0PAIGyr7N6WIjr4qWFvSFH3QJnhllmiFWJ0MQm5sP2
         J0EKRQZcYlF/crUx/W2CsM8d2ziif2tHzGxbd3ULsLOHamD1YZuuDTQgBRwRYWnpRXQz
         k1RJxMcSixQLCWhp0jyzp9505A7dI5Ze+stwm177ll0lc/SB9VHhEg/E96i+u9i6vv8f
         Iugt6Tki5xakarbLxsv4EPjd14wx+fY5+K3wJ6oUcfb/iE1Z6qlmq73dVA0QbiRW9p7k
         6Xj3U5+0/3JRGecJXLAzLe1JbRyYPOA7TsVqf9uTAS3OZUPYk28hzcOWh49+ebrRbLZr
         YVvA==
X-Forwarded-Encrypted: i=1; AJvYcCVNce7Mmt+2ZiI1jMoescVd6Zdp4ZMJsvo23kTTxJIMTSQomkor+ejJ13/AWUqj0tsptmr9/UcIVsrBsq6mTg==@lists.infradead.org
X-Gm-Message-State: AOJu0Ywb0mV7hvDuzgVi2iIb8B2VztU1xmjVusahioM6cp1kiVlqRL8U
	OYdZX3nxih+U+biCv7exP3SP9lAgJzABwXOPU80QrPpXfCVWPvqp0Tle0CFwgb8RpTQ9KvI+R0j
	u
X-Gm-Gg: ASbGncuuskbH6usxTgX7O6JDMKfDqO1HiTRFd7cgp/Den8dd9RzamlaNUWyEdyW75G7
	cOqT6X6J3Z5kqsKwIkmLA3MFOzGSF27/V4nYNEi3osp07+uod6mZgGPgjwJy3mjtBuUyIDxN5Z5
	dw4WMvsgFEZUyANIEXWf27HyzSEM9iFM31n2b4Q9c3F4YV8TIoS735uqAvYouv9roCFRkXVga8H
	Mb7TAS/ElfqInudH6wxRrFviKy4HYegk4qLlyDdxEt+6NYW5ECBwOXZCYbBTBwo46az7u3BE6IR
	Iw==
X-Google-Smtp-Source: AGHT+IFf9Yb/lV1fMPHGdH6ntBNzqtAAdZrv1z6KXUln4z+2PgGQ1VQ45kPdIH3rvofp3kGQ/N/b7g==
X-Received: by 2002:a17:902:e552:b0:215:b5c6:9ee8 with SMTP id d9443c01a7336-21a83f33a44mr397009725ad.7.1737002954438;
        Wed, 15 Jan 2025 20:49:14 -0800 (PST)
Received: from localhost.localdomain ([157.82.204.145])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21a9f21ada1sm90516235ad.138.2025.01.15.20.49.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jan 2025 20:49:14 -0800 (PST)
From: Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>
To: mchehab+huawei@kernel.org,
	sboyd@kernel.org
Cc: linux-kernel@vger.kernel.org,
	konradybcio@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	marijn.suijten@somainline.org,
	bjorn.andersson@oss.qualcomm.com,
	abel.vesa@linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>
Subject: [PATCH] spmi: hisi-spmi-controller: Drop duplicated OF node assignment in spmi_controller_probe()
Date: Thu, 16 Jan 2025 13:49:07 +0900
Message-Id: <20250116044907.2947218-1-joe@pf.is.s.u-tokyo.ac.jp>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250115_204915_307577_C887CB52 
X-CRM114-Status: UNSURE (   8.78  )
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

spmi_controller_probe() assigns a parent device and an OF node to an
SPMI controller. However, the operations are not needed as they are
already assigned in spmi_controller_alloc(). Thus, remove the duplicated
assignments. An unnecessary OF node reference acquisition is also
dropped by this patch.

Signed-off-by: Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>
Suggested-by: Stephen Boyd <sboyd@kernel.org>
---
 drivers/spmi/hisi-spmi-controller.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/spmi/hisi-spmi-controller.c b/drivers/spmi/hisi-spmi-controller.c
index 3cafdf22c909..122140b97579 100644
--- a/drivers/spmi/hisi-spmi-controller.c
+++ b/drivers/spmi/hisi-spmi-controller.c
@@ -300,9 +300,6 @@ static int spmi_controller_probe(struct platform_device *pdev)
 
 	spin_lock_init(&spmi_controller->lock);
 
-	ctrl->dev.parent = pdev->dev.parent;
-	ctrl->dev.of_node = of_node_get(pdev->dev.of_node);
-
 	/* Callbacks */
 	ctrl->read_cmd = spmi_read_cmd;
 	ctrl->write_cmd = spmi_write_cmd;
-- 
2.34.1


