Return-Path: <SRS0=oumW=7L=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A587C433E0
	for <linux-mediatek@archiver.kernel.org>; Fri, 29 May 2020 02:27:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DFAD8204EA
	for <linux-mediatek@archiver.kernel.org>; Fri, 29 May 2020 02:27:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Z1HToxHm";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NdaMAUAE"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DFAD8204EA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=g53GUPjXiFw4wZMMfcxh6Ld5mUlo3qvYfanDcjMtpTU=; b=Z1HToxHmoqOkte
	mQGaI7+IpkteF32lN3kdX0vBQHSGaKak3Vk3wnq9QGADCDc9SfoU9/X7ntlOJGqobQgGtIVRv9S+r
	v6V8lMcdU14pkc2a5CTDlents1QY4PUKlkpmljmqV/qN0p83HyetTyM7iS0h0UXfE9eoOaIOVPsOv
	IaomSKmu+9jqt7q1Joa0J9qEld7YhFQa6vVQLsaqCdeYZ0DbdWePSwHk6BCRURR51Ekl4hIK6+yOg
	dAbUm6rBi4egOLpErDXrOaCbIOK9LqxZSNn7jjkUBXVSVt+8z4KUv8zcKdcCO+paklNkrN8NrCL+n
	9Y+3HbQ6iQT1ik+YnyVQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jeUkN-00052J-15; Fri, 29 May 2020 02:27:47 +0000
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jeUkK-00051n-Hr; Fri, 29 May 2020 02:27:45 +0000
Received: by mail-pf1-x444.google.com with SMTP id z26so441628pfk.12;
 Thu, 28 May 2020 19:27:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Q7Ds55mrogGXuEM4SJQgAqnILsJS644/RVVdZVRg++g=;
 b=NdaMAUAEDkjuPmLDmz0DlFfsp4ufVxj0FWetWnq1nPXQTn0gJydk3i7kHOD2PRXom3
 c29KH/BGst0jdrowBQuRWgbkg+GoAXln+xEXP1NqwS47xG3aHSDk1M5w+vVHQpAliTsw
 DeiA/FQE5G/vByHeDu3RZNFz342dKsAcSGOI+Y0MFO2j6LDESQrHfi/LIundli+NzACx
 cONgLmFWbTXn4pbj1NX7NnNFCZuUFS69lclsOMCxJw+eF+FOil6ro4HRH9JAsz7x1Q84
 iwwSNSABC9+blpWz19mnQXvvlQgGvMEwGmhcMWmDRQGo/EYN6d1mnktit0bwCI1FnaLK
 L8YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Q7Ds55mrogGXuEM4SJQgAqnILsJS644/RVVdZVRg++g=;
 b=tvP+JW5S3oremuaJa6Y6PSxNAiGAC1BDbgQq/qQMDNYMj6Bl9beCiriCbupmI+vtGe
 eHtsZ+l3A0yeUCtNrdXGPvF8Sj737QuZzCMoZFYi65quPSdzR0cVsCbC04D4IddBHyk7
 /twOanvJuDRuWESWa3khij43EdR0baCAuRvTW8qRmropqLEW7B5We/2xM8pjPnywjP12
 JiaY8U/sC0E+ugNEsYTGrK9JQAdnPTM8vD+cPxFRPZLZ/QLRdLwVHvzwi04GnyG0hosV
 YihVIEC2eKQZAqDmJc2+SvBlDf+dCUQ843OqbqIaGY025jxdgI2v1GFvpspXxZmXKRtq
 lwqg==
X-Gm-Message-State: AOAM5332TPsXcpGBSl41jVa6z+YSGXg91Ol15IHrNATZAJxx55MOZBXg
 23LCBHZjShT7/9fH8UfzO/g=
X-Google-Smtp-Source: ABdhPJzx/ymfutkB2+J7IwEf32NLdzpK09ZlEr9zw9Gmck5sFYIuhFuU6NGYaBcMyXxxLR/h8SccjA==
X-Received: by 2002:a62:2f45:: with SMTP id v66mr6665066pfv.45.1590719262506; 
 Thu, 28 May 2020 19:27:42 -0700 (PDT)
Received: from suzukaze.ipads-lab.se.sjtu.edu.cn ([202.120.40.82])
 by smtp.gmail.com with ESMTPSA id u26sm5850316pfn.88.2020.05.28.19.27.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 May 2020 19:27:41 -0700 (PDT)
From: Chuhong Yuan <hslester96@gmail.com>
To: 
Subject: [PATCH v2] Bluetooth: btmtkuart: Improve exception handling in
 btmtuart_probe()
Date: Fri, 29 May 2020 10:27:26 +0800
Message-Id: <20200529022726.917826-1-hslester96@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200528_192744_608866_A7CBDEA5 
X-CRM114-Status: GOOD (  10.85  )
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
 linux-bluetooth@vger.kernel.org, Markus Elfring <Markus.Elfring@web.de>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Calls of the functions clk_disable_unprepare() and hci_free_dev()
were missing for the exception handling.
Thus add the missed function calls together with corresponding
jump targets.

Fixes: 055825614c6b ("Bluetooth: btmtkuart: add an implementation for clock osc property")
Signed-off-by: Chuhong Yuan <hslester96@gmail.com>
---
Changes in v2:
  - Modify description.
  - Add fixes tag.

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
