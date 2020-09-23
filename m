Return-Path: <SRS0=E7TL=DA=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F18B6C4363D
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Sep 2020 07:24:02 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7561E2220D
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Sep 2020 07:24:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="g9sT4aYL";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lAV2HgFm"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7561E2220D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=DE7UjKswBxmdwaWUZhLDZ1Zq6NewY63InsEBzO8e/WI=; b=g9sT4aYLmIs65Mi1O2Afl2PveP
	Qi2ZLP1o2yTNee/A5f1CnOAVptjYPq93AJeZG7Be+c7BcZLjdRV4A66jkxamvNYBRiUjy/9zyjqFO
	mbOkmPs6AwwJB4R69ZQ30/QURBgP1/s5SERjzzHJ7uIFWyPFtlOPuc6o2l7t2VczB3+Q5Yf/wAUej
	r60awVlbXwjZDIKJg9xOu62D77NAb142KGgA/p0ijJ/eM0BTrgB16qPUB1eKJNNRRIFSv0OCVEmfG
	izQO/whW9BRcpiu1Ih43vPyco/O40bSMfljl6IeelIFZDovqXK0MXzHQ+bQ/m2oidIo2J0YKyt5uG
	ZkDMip9w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kKz82-0004Yh-It; Wed, 23 Sep 2020 07:23:50 +0000
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kKz7y-0004Xe-Vc; Wed, 23 Sep 2020 07:23:47 +0000
Received: by mail-pf1-x442.google.com with SMTP id n14so14487603pff.6;
 Wed, 23 Sep 2020 00:23:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=szhTKPsLT/eSqNOiv7SSKyT6k55mYaygdNpzPFJobRA=;
 b=lAV2HgFm3i12ZhfzcZs7hI+uSznUgTzTt0c3xxoBW+TBpd5p2/JzzvxxFBuIyI3hCc
 N2i+L6tPahh+K5Fa+V+q19wGXaM83YPYSJaLvfO47TCLOWQ9KepswaoY7bkSrefllb3l
 Czr3J2ZUgKBk1jswTIkA1gBcbkzZ2AJ25+kaMfhEGWPmHGL/rbHXatJ/sTB/QD1JDcup
 DK4aLpd/IBqPHNSwa7vRcgrFBBrfJZ27DLmBfQcmn84rwwPptl7Ez038HHnEypDTqnbX
 G2s2b7q29eQpt+PR9i/HRS3h9iA1ZArcT+o5iua8duCL0wXK4PxMfvYVdi4zTEWmnerW
 pxUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=szhTKPsLT/eSqNOiv7SSKyT6k55mYaygdNpzPFJobRA=;
 b=NIiFOA5UM/NxLP/UXwK2+cRwscK3LOFruBT1l/QEBIzb1XjZOqchEDJk3zaxMLo2Hq
 0U2sKtM7cQpuDvlEjXCnxlCDLb0ClQXRyOYBR3HQp0BB5lrlfnnOja9PZKOcnE8BimLO
 9o8s2IwMLOh9UzV835+3CbA1wB7iYm84WwXoN6JWWElkKeY7uATGCwTl0KajU6gx4RcZ
 63rN1wHZ7drtk24vbwFFjZqhSyePQM/ZNaT4NuJhKpf41CfrO0tHnCauGDbUEteSw4lU
 /2SnJXx4+FBH3R7FRo/73Rpgh/aH7DTi8Da3sWfCZXM8YoUx4+NhW5x98Qmh2ciJ1SYK
 NhFw==
X-Gm-Message-State: AOAM533FnnfS4OXYwf5P4AEiJ2FVMP9w8sgnX+uy+LPQ/nrj6TxBnLZk
 rbWBb7vepZF3fQRbmp5A77Y=
X-Google-Smtp-Source: ABdhPJykWM4yTeAs7d6cEkEdgequ5c4SvoiXrWx+APLXbxFDYZdhvlVH4iSEIUDKvF31Asx7uONIKw==
X-Received: by 2002:a05:6a00:888:b029:13f:f7eb:578c with SMTP id
 q8-20020a056a000888b029013ff7eb578cmr7869549pfj.10.1600845822996; 
 Wed, 23 Sep 2020 00:23:42 -0700 (PDT)
Received: from guoguo-omen.lan ([156.96.148.94])
 by smtp.gmail.com with ESMTPSA id n7sm16585488pfq.114.2020.09.23.00.23.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Sep 2020 00:23:42 -0700 (PDT)
From: Chuanhong Guo <gch981213@gmail.com>
To: linux-wireless@vger.kernel.org
Subject: [PATCH] mt76: mt7615: retry if mt7615_mcu_init returns -EAGAIN
Date: Wed, 23 Sep 2020 15:23:03 +0800
Message-Id: <20200923072330.1311907-1-gch981213@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200923_032347_034590_95952E62 
X-CRM114-Status: GOOD (  14.33  )
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
Cc: Ryder Lee <ryder.lee@mediatek.com>, netdev@vger.kernel.org,
 Sean Wang <sean.wang@mediatek.com>, linux-kernel@vger.kernel.org,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org,
 Lorenzo Bianconi <lorenzo.bianconi83@gmail.com>,
 Jakub Kicinski <kuba@kernel.org>, Chuanhong Guo <gch981213@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Kalle Valo <kvalo@codeaurora.org>,
 Felix Fietkau <nbd@nbd.name>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

mt7615_load_patch in mt7615/mcu.c sometimes fails with:
mt7622-wmac 18000000.wmac: Failed to get patch semaphore
and returns -EAGAIN. But this error is returned all the way up to
mt7615_init_work with no actual retrial performed, leaving a
broken wireless phy.
Wait a bit and retry for up to 10 times before giving up.

Signed-off-by: Chuanhong Guo <gch981213@gmail.com>
---
On my mt7622 board mt7615_load_patch always fails the first time
and it then succeeded on the first retry added by this patch.
"10 times" is an arbitarily picked value and it'll still leave a
broken phy behind if all 10 retries failed. I don't know if that's
okay. Suggestions are welcome!

 drivers/net/wireless/mediatek/mt76/mt7615/pci_init.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/pci_init.c b/drivers/net/wireless/mediatek/mt76/mt7615/pci_init.c
index 7224a00782115..2272f6bcaafe7 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/pci_init.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/pci_init.c
@@ -16,8 +16,15 @@ static void mt7615_init_work(struct work_struct *work)
 {
 	struct mt7615_dev *dev = container_of(work, struct mt7615_dev,
 					      mcu_work);
+	int i, ret;
 
-	if (mt7615_mcu_init(dev))
+	ret = mt7615_mcu_init(dev);
+	for (i = 0; (ret == -EAGAIN) && (i < 10); i++) {
+		msleep(200);
+		ret = mt7615_mcu_init(dev);
+	}
+
+	if (ret)
 		return;
 
 	mt7615_mcu_set_eeprom(dev);
-- 
2.26.2


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
