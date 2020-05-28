Return-Path: <SRS0=lKUU=7K=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B498C433DF
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 May 2020 10:20:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C747D208DB
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 May 2020 10:20:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="YDWfgxiQ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FocExwZg"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C747D208DB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=FCHo92h49i03YOerLEOtayrEaJhlReWTgRwlg4EwgJ8=; b=YDWfgxiQdpH49e
	s54cwJGeMZlUZJac1ElIoKerPCSzOiKBIH6Efuy3GoOc1yfcF+4ll43oZY0aEetx7I4vqNuXedDj/
	c9koQJ3zmRMhNDdewyNIIJrdH7kOBvCk2np8KUHJVV5mJBhoV5kIuGv4izYc30KF5CMPBSk/nQuMm
	aTHOri8LtT0KgMx0OeFUBE9uNVJQ/Hcp81IhaiCwK21ZgpXuvhFFc03ZnbPREjxnBiuzaIA+i7OXU
	CiPmRIUiOZSpyxFIPFbxdWOWnBQjHzN4kcHRQj466vGgIrRMlFNHTY0b+xdPo2Q+pu+CJvjfd9qVY
	SQ1wFgRScKnCi8q2F0tQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jeFeO-0003Zr-4Y; Thu, 28 May 2020 10:20:36 +0000
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jeFeK-0003Z6-LT; Thu, 28 May 2020 10:20:33 +0000
Received: by mail-pl1-x641.google.com with SMTP id bh7so4475315plb.11;
 Thu, 28 May 2020 03:20:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=n8iipgJAi/NQyT9g10+jXpAAhQUJmCgX3ykzxFLrLKM=;
 b=FocExwZgEGs3gT0g8mnUyvPa6RpF30FXKarH1WH9tVM3Qfk2UMDFsUGGktPrgs6eG8
 oWa6KQ3j+BOpYt1wNostFfpItGTf7Nia2InQUTO4w8rOcch2k+RjAUsNbvmSK/nxbgDp
 HOSdd++QHNr67yGxv/1ozdj8+NQjB7FB8qxJMmDpuAv0IP2tidoiPkWbNp4AAileJdUN
 QdUH88+CtMfwJs0OtDlUNxQ4KSfvGtRsAtsXTTE9PD0sEuaBlzkpIWj9IJNujmvNiVNe
 Dr9VGxowiAhoIecs4k25fXf/tzGz9WKaUTZ5NiqHo5NEQkJnHkq98nLVkPhtXHFA+mMw
 +hTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=n8iipgJAi/NQyT9g10+jXpAAhQUJmCgX3ykzxFLrLKM=;
 b=XQZMOngHw+iQ1BVktDqsybfTfFUtK3HmBiLqS+80N+YKi2in3ldlBAZQnZOE9Gfq7p
 680uz8pdbUJrWqlHlP2x278S7mT6NWg7qrIoRcte4Obrp7BqIR5M4F4ksGaVV+JTH0n2
 VDUQYNsDiM/6NLN93blCFgv4VCD7NzjkCje5DUvbRk6XUVeaKxoxqvVXdLNquk06zwfW
 aAo3dejmPxEHIZr9JgXtarBr+ueZrKsapoU32mZGjDPuWoNGTQLGZE+m368uLX3rHI39
 70niUXcYt26O8InAfagAGuXurC92ZPE/7sv7hp6Z2Gdw+CZeImLbvNdt8XcgTXiVuDyv
 qc4w==
X-Gm-Message-State: AOAM531GBfAzYQAm5nN3ms3fXw2n/0WiXq/aEGTIv/g3meyzFHNm6lLH
 eGCImXZn1VUz4HDcHpqLIos=
X-Google-Smtp-Source: ABdhPJywCGzsdw5guspTvAxKu+Juxq4ii0vQsLONLmhQYEB+Q72DtYuN3e5AP5ezkwffsfJqoQc9hQ==
X-Received: by 2002:a17:90a:1485:: with SMTP id
 k5mr2995699pja.108.1590661231748; 
 Thu, 28 May 2020 03:20:31 -0700 (PDT)
Received: from suzukaze.ipads-lab.se.sjtu.edu.cn ([202.120.40.82])
 by smtp.gmail.com with ESMTPSA id e16sm4193122pgg.8.2020.05.28.03.20.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 May 2020 03:20:30 -0700 (PDT)
From: Chuhong Yuan <hslester96@gmail.com>
To: 
Subject: [PATCH] Bluetooth: btmtkuart: add missed functions in the error paths
 of btmtuart_probe()
Date: Thu, 28 May 2020 18:20:21 +0800
Message-Id: <20200528102021.911709-1-hslester96@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200528_032032_721277_0F3C71F3 
X-CRM114-Status: GOOD (  10.66  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Johan Hedberg <johan.hedberg@gmail.com>,
 Marcel Holtmann <marcel@holtmann.org>, Sean Wang <sean.wang@mediatek.com>,
 Chuhong Yuan <hslester96@gmail.com>, linux-kernel@vger.kernel.org,
 linux-bluetooth@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

btmtuart_probe() misses several function calls in its error paths,
including hci_free_dev() and clk_disable_unprepare().
Refactor the code and call correct undo functions to fix the error
paths.

Signed-off-by: Chuhong Yuan <hslester96@gmail.com>
---
 drivers/bluetooth/btmtkuart.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/drivers/bluetooth/btmtkuart.c b/drivers/bluetooth/btmtkuart.c
index e11169ad8247..8a81fbca5c9d 100644
--- a/drivers/bluetooth/btmtkuart.c
+++ b/drivers/bluetooth/btmtkuart.c
@@ -1015,7 +1015,7 @@ static int btmtkuart_probe(struct serdev_device *serdev)
 	if (btmtkuart_is_standalone(bdev)) {
 		err = clk_prepare_enable(bdev->osc);
 		if (err < 0)
-			return err;
+			goto err_hci_free_dev;
 
 		if (bdev->boot) {
 			gpiod_set_value_cansleep(bdev->boot, 1);
@@ -1028,10 +1028,8 @@ static int btmtkuart_probe(struct serdev_device *serdev)
 
 		/* Power on */
 		err = regulator_enable(bdev->vcc);
-		if (err < 0) {
-			clk_disable_unprepare(bdev->osc);
-			return err;
-		}
+		if (err < 0)
+			goto err_clk_disable_unprepare;
 
 		/* Reset if the reset-gpios is available otherwise the board
 		 * -level design should be guaranteed.
@@ -1063,7 +1061,6 @@ static int btmtkuart_probe(struct serdev_device *serdev)
 	err = hci_register_dev(hdev);
 	if (err < 0) {
 		dev_err(&serdev->dev, "Can't register HCI device\n");
-		hci_free_dev(hdev);
 		goto err_regulator_disable;
 	}
 
@@ -1072,6 +1069,11 @@ static int btmtkuart_probe(struct serdev_device *serdev)
 err_regulator_disable:
 	if (btmtkuart_is_standalone(bdev))
 		regulator_disable(bdev->vcc);
+err_clk_disable_unprepare:
+	if (btmtkuart_is_standalone(bdev))
+		clk_disable_unprepare(bdev->osc);
+err_hci_free_dev:
+	hci_free_dev(hdev);
 
 	return err;
 }
-- 
2.26.2


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
