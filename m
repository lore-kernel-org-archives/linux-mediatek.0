Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2A7BC433F5
	for <linux-mediatek@archiver.kernel.org>; Mon,  4 Apr 2022 13:28:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=kZQAYIvZX7br8rLl1guDGC4ZmsYFuMXaPkedIF0Yikk=; b=nbRMFzdja8AeIe
	fdaY0qYKfM3Cl/DWdjNCYP1IMuoMZPjZk+qzfVRysQdLPAq4etzrvksi0I7xz0QPcxIqqj0xxfgWh
	pvPh8Ef8muZnlyLrQIH3vFVw856divxtjgm3nywT4eN2kW0QOPhVtViHMJq4Re7nnxXbdpy3xDi2u
	jHAjy2pCofkzNMq/ZJi0SZ+r+lxymYtlM1zQ8zqw5YteTqGCr2kDCxECTVzfd8kKJN48qAMQCtGjb
	i7mcuUtkLPDlp+llzP52cox/PMJGCvr0Gsb2Q2GiJ/8wVrJidc3NtVzN3avo2uIESmxRDMG5dIcqU
	/Qw3Idsx/fWkk3oA9fjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nbMkt-00F6o3-NA; Mon, 04 Apr 2022 13:28:27 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nbMiW-00F63E-FC; Mon, 04 Apr 2022 13:26:01 +0000
Received: by mail-pl1-x636.google.com with SMTP id n9so3455845plc.4;
 Mon, 04 Apr 2022 06:26:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id;
 bh=FlBsVFEKh4j3VAt6LeTKFsoKsuruo0DcZ5wQSPKgGVo=;
 b=gZxNZUcVpHlb+PC0mU029qi8y3yaBV33LkmOZB+zCVqsXIYEND5s0ftLAFjpG+DSvG
 3fre2ImlaHs0IToAEnvx8Ge+DDk9/z+wpD4ZGw38SCtRfsEbEO4pjAklfsQgrWcCtlq+
 /NChUBrxhCdkVoxZCR6VfOXHeSigso1sRZ7Fc/pZ1khBXeg8xEX1EpjsMh7+AVabZYn2
 8yv09bnMza+Qfv1P1GRodT8QGwJ1rbgkjTpmC0siV2jwaa8Rslz2GWkomEftev/V7mHa
 ewRE3nXenMD+InkvCKfXlyVm/K04usRxrRtQbfpqdnt9H2c9hJBLDrzbLpkOlOI6OBTZ
 IbFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=FlBsVFEKh4j3VAt6LeTKFsoKsuruo0DcZ5wQSPKgGVo=;
 b=DTTHfXCY7/UaLP8sayerf2F3oivyvEg5Vl8bJ+HdyANDz94qhYfjA8yoE3K8NTsA4B
 FoWjVZMCPGK7rvBtpZq8xAm8qB+Qkd2NY8ossJCV6DoEJQq6cK9mRU0/aId0pJufZ5hY
 D8IIVq8sGvZ19bcNFI30tC4rnpg6ohq6YgyDM5gaJmsgOwbzmLyFChYrJ2NWTqust+KF
 EowutUeG3oY9C463J/B9iJPBWzQoUld+AW/AOJh1bUqQAZX32OdhSnFixrmJx6H+7M6V
 0qQnbB32w/tPcjVkrp+DsMXpHV1dlfVvEAPswUj7207rLCTiarXbhLuwoFeM2Kzrka/L
 U9Hw==
X-Gm-Message-State: AOAM530fh+fec242KPJmSdyXmFhd9QVojzFR7zSm93dYGt6ncTAUE3+a
 3oV4IgBDq2hvoMnrjJ/LGn8=
X-Google-Smtp-Source: ABdhPJx3+zSJdu5DehSeyrC7q6wpVT/4HVSBzcFwjxsrzsTyJC0b4HFVuDHkH2ecj14ojRx2BF95tA==
X-Received: by 2002:a17:903:2285:b0:154:c94:c5b7 with SMTP id
 b5-20020a170903228500b001540c94c5b7mr22253plh.64.1649078759509; 
 Mon, 04 Apr 2022 06:25:59 -0700 (PDT)
Received: from localhost.localdomain ([159.226.95.43])
 by smtp.googlemail.com with ESMTPSA id
 j3-20020a056a00234300b004faabba358fsm12617039pfj.14.2022.04.04.06.25.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Apr 2022 06:25:59 -0700 (PDT)
From: Miaoqian Lin <linmq006@gmail.com>
To: Eddie Huang <eddie.huang@mediatek.com>, Sean Wang <sean.wang@mediatek.com>,
 Alessandro Zummo <a.zummo@towertech.it>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Tianping Fang <tianping.fang@mediatek.com>,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: linmq006@gmail.com
Subject: [PATCH] rtc: mt6397: Fix potential NULL dereference in mtk_rtc_probe
Date: Mon,  4 Apr 2022 13:25:53 +0000
Message-Id: <20220404132553.28064-1-linmq006@gmail.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220404_062600_547966_9DEDC91E 
X-CRM114-Status: GOOD (  11.83  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

platform_get_resource() may return NULL, add proper check to
avoid potential NULL dereferencing.

Fixes: fc2979118f3f ("rtc: mediatek: Add MT6397 RTC driver")
Signed-off-by: Miaoqian Lin <linmq006@gmail.com>
---
 drivers/rtc/rtc-mt6397.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/rtc/rtc-mt6397.c b/drivers/rtc/rtc-mt6397.c
index 80dc479a6ff0..07c6679366e0 100644
--- a/drivers/rtc/rtc-mt6397.c
+++ b/drivers/rtc/rtc-mt6397.c
@@ -269,6 +269,9 @@ static int mtk_rtc_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	if (!res)
+		return -EINVAL;
+
 	rtc->addr_base = res->start;
 
 	rtc->data = of_device_get_match_data(&pdev->dev);
-- 
2.17.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
