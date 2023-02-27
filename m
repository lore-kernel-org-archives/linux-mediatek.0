Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68DAFC64ED6
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 Feb 2023 14:48:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SlgqotCFpMlYYZrIocsEAB0uv8GgACUTLIGeGd3Q3nk=; b=t5gi8dTWPIHmygTtsLpGp5D5Gv
	qcb1MMjj3C6odCKYEahQx6ApAvkpTVQ1TrhCn4Mm7uQgjNgZWwMTszae501A7ZjaLzw19j+tD3Ino
	Xlz0TMbi2jylSH2ma4J8CW1TPr0xfCwpa0jurc8UXeVN0GpbptQei6kt91CMO4EsLSTdtbb4rttmW
	NwAb4mkIcwAi3zt0feXqmFTpWJ4XNUaeqpJkl5PO0I5DIf2TemZSIGwob0n8rVhFe+Mo+D8J8kx8H
	ZcOAt/DYLhtKnXWm6N8mLCfGq/8MMlJOh3py7g82z7gW6YYIbbcgz6XOG/GVtIIsTVTwjJx26bQCD
	dC5WnsrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWeo2-00A3kj-5o; Mon, 27 Feb 2023 14:48:46 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWenr-00A3gy-1Y; Mon, 27 Feb 2023 14:48:36 +0000
Received: by mail-pj1-x1030.google.com with SMTP id x34so6422663pjj.0;
        Mon, 27 Feb 2023 06:48:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SlgqotCFpMlYYZrIocsEAB0uv8GgACUTLIGeGd3Q3nk=;
        b=W2W0YyP4y0NIJfPvaCtZBWeQk8GAwmXaRT+2ZfOOLiZMs+olZ8CqkFui/R7U2PquAP
         3xQHqbtYwMpNrKNdZLhwgnyjIWgIx3BILe5ZIOrK6c6ZPB5gE8bQj8BiUF49XmkRgDCp
         BgKnCXYSTZuEtiLEeOfUNu5C8/ahsUiBnOATSRuY858sOpQ7su9mVlxGIYoXiOEJBEl5
         ANOCeovDzD66ND/3ozkLzS0PlESqKxagpkvFlug2/Kk+RIzp88bCgQjLGeN4aXfrBnNg
         Mree5WsvfetKz0CoXg3DtjUTtGc4xrwm0mu1wGOMXMA1XgbOYMAeVagEXV3E5aZMPKAB
         oFEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SlgqotCFpMlYYZrIocsEAB0uv8GgACUTLIGeGd3Q3nk=;
        b=aSdPEOMiqD0Tv0DRJesVMYomHbIroDsooME3BL/n2+ZRLpAX5/9OkZ7PrAFot1f/RG
         7RZDP+EQqJlS6LukzyYB9Wu7XpIWz+bX1qExq5e/6eR+ADmf6Oys4S8ltQi02753Sg7f
         i/ci+JJJVH5fwmXvc9GQbwvVXwjO0qPOsfwLNLERu7LOf4KEADJschNrRp5fvsM7lBH2
         8BGR67SpkqwB6iqp2NIfy08BUwyYgCvdmksWvJW/swpt1un4YddYixBuNDC4E2LDp/1A
         I1yQ2qe0uL56OiOX9RMj+7hcKH16tj4ObI/er+9HfelWoN0rrNkksbm04KL/X9GJu10g
         Cjjw==
X-Gm-Message-State: AO0yUKXUccaNye59Zpnre9w3Tx/2qvJtoPx+8fNyprKPqL60Qvkj8ZU6
	duOrUIu3cjixeyS0x6OBNQE=
X-Google-Smtp-Source: AK7set9LjQIxiR8aWUSis2bKS9zBzibf4kvNlf9fsVaes9MFIMHBjmh+r3AxWIbfww8saVxOIsNLvw==
X-Received: by 2002:a17:90b:1c10:b0:230:fac8:d7e7 with SMTP id oc16-20020a17090b1c1000b00230fac8d7e7mr25520356pjb.2.1677509310988;
        Mon, 27 Feb 2023 06:48:30 -0800 (PST)
Received: from localhost.localdomain ([103.116.245.58])
        by smtp.gmail.com with ESMTPSA id v23-20020a17090ae99700b00234ba1cfacbsm4561131pjy.17.2023.02.27.06.48.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Feb 2023 06:48:30 -0800 (PST)
From: void0red <void0red@gmail.com>
To: lorenzo.bianconi@redhat.com
Cc: angelogioacchino.delregno@collabora.com,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	kvalo@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	lorenzo@kernel.org,
	matthias.bgg@gmail.com,
	nbd@nbd.name,
	netdev@vger.kernel.org,
	pabeni@redhat.com,
	ryder.lee@mediatek.com,
	sean.wang@mediatek.com,
	shayne.chen@mediatek.com,
	void0red@gmail.com
Subject: [PATCH v3] wifi: mt76: handle failure of vzalloc in mt7615_coredump_work
Date: Mon, 27 Feb 2023 22:48:23 +0800
Message-Id: <20230227144823.947648-1-void0red@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <Y/y5Asxw3T3m4jCw@lore-desk>
References: <Y/y5Asxw3T3m4jCw@lore-desk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230227_064835_126937_6DE3E96B 
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

From: Kang Chen <void0red@gmail.com>

vzalloc may fails, dump might be null and will cause
illegal address access later.

Link: https://lore.kernel.org/all/Y%2Fy5Asxw3T3m4jCw@lore-desk
Fixes: d2bf7959d9c0 ("mt76: mt7663: introduce coredump support")
Signed-off-by: Kang Chen <void0red@gmail.com>
---
v3 -> v2: fix bugs
v2 -> v1: add Fixes tag

 drivers/net/wireless/mediatek/mt76/mt7615/mac.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/mac.c b/drivers/net/wireless/mediatek/mt76/mt7615/mac.c
index a95602473..796768011 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/mac.c
@@ -2380,7 +2380,7 @@ void mt7615_coredump_work(struct work_struct *work)
 			break;
 
 		skb_pull(skb, sizeof(struct mt7615_mcu_rxd));
-		if (data + skb->len - dump > MT76_CONNAC_COREDUMP_SZ) {
+		if (!dump || data + skb->len - dump > MT76_CONNAC_COREDUMP_SZ) {
 			dev_kfree_skb(skb);
 			continue;
 		}
@@ -2390,6 +2390,8 @@ void mt7615_coredump_work(struct work_struct *work)
 
 		dev_kfree_skb(skb);
 	}
-	dev_coredumpv(dev->mt76.dev, dump, MT76_CONNAC_COREDUMP_SZ,
-		      GFP_KERNEL);
+
+	if (dump)
+		dev_coredumpv(dev->mt76.dev, dump, MT76_CONNAC_COREDUMP_SZ,
+			      GFP_KERNEL);
 }
-- 
2.34.1


