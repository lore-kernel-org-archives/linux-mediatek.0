Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAD7EE93805
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Apr 2026 03:33:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bZQu15h0T7n1r/lM2eLKIfO6SWwPWy/aPZ0wiJ3s708=; b=cvw9EGbtmBJNoGU3bkMaqlgxTM
	Ua8P3DGzzXdQnBfiwDrLyF4IARn27qGqjLYnrKA4xLH88IZON3H/tXZYWcaEop3rcnbekdzuzrWJi
	zuVG+LV74oFy44DWrs9Ss54mIo9BbgItkHP785m2sTQxQ1a+orehkoajL8f0dLhrRaXuy4Ljqfcds
	jIiIXLTIjb4V+h9Y6CCG+lmwoxt8GLr4GCmUCSaZlqtLdiCBWUtAEqJcthKTyWdioutxcAK0Oia7W
	87/IRK1Ib0wb8L6+f6/+cQO4kldlPgN/xIZbifbYxJyriOVmaD0eqDm7hI0SSP14+0DQd9U7gdXtA
	7yVkz+fA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wC83C-0000000Ewh6-39UV;
	Mon, 13 Apr 2026 03:33:27 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wC83B-0000000Ewgl-0Gkx
	for linux-mediatek@lists.infradead.org;
	Mon, 13 Apr 2026 03:33:26 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-4887f49ec5aso48028835e9.1
        for <linux-mediatek@lists.infradead.org>; Sun, 12 Apr 2026 20:33:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776051203; x=1776656003; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bZQu15h0T7n1r/lM2eLKIfO6SWwPWy/aPZ0wiJ3s708=;
        b=QlpvuEdOkmbqm/kDcfEXYFC/eE3iRWrkta7866Hgj3p/7vOnip4z70/0Q8VIrSV3Az
         5vaYkJO/f7t8iVr8jrynFIT5hU80O7VqZyryVEfcEu7FHsTHUq4jEKek/+66nDnc3oUV
         kxtBc8R1gwzyGXvl/XYEP54u2/R8SN9t2YhlnBv517GSZRu7eSWPDnyDXR1e0iE64UQ1
         WqUljks3PqM6Y09LKAtyBetZ9Iw2wBzyabP3wrbBCchvI6MShWaPzwGPttLeQ/R10n6h
         4PAWBmXZLqsfhMgzXZGSDN+Lzt8eYkotTVaIGyhBcoLX5+k3mwTWpE+yt4+MXWtg8CWJ
         VAtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776051203; x=1776656003;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bZQu15h0T7n1r/lM2eLKIfO6SWwPWy/aPZ0wiJ3s708=;
        b=onv0GcYvC6+bhegK6aWywrQSIEfw1J6bhHKVhT//9CQ2vBmbjFX8vHncFMGd7uzB9F
         0UjLnctAqY7whPfjjc1Y3M7gq2cNvg0hUBCqMXiwZi2liI0RjD3I15azWtgEzHTf3DxN
         UxhoPAts9Y7toZxE1t8CgZtkj5qZuX/mlcjavYhSAaJrAPfOX4GSyDupNrYNM9xGprQ6
         MBId5hdsBJZv1qfz8NstT+4zTCyyEhJs8luVG5+O+YUqBIExt47ktAOi2KQioPwwjvgD
         w113FwtXnSNfCtw2CFTIJwRxTDALl6qH6N8760iV7TTwctAyYgCVJik9MAvF25C5m+eV
         IyCw==
X-Gm-Message-State: AOJu0YzMadA8HhuAjj9a3NmjokivS73uoUL9nmYSxHylRvWEFQvkhIbG
	KVX58eis4s2ybHElq4U5p01NxReTSnPRdus+d8hy4U2UQ/4BBtwxbx4A
X-Gm-Gg: AeBDievhG/LYK0TzbKoUha0RSV5Avw9cjSiPZbyDkotICCP1Q06eVa0U0XCLjg8bam6
	ukmmpV0iicAZ3CftukcyExQ/HARUtj7QjJzHodH6YBF0K/fuBHz1cr5x9OQ00DC8Xt/pfWBBlFZ
	yOaPUOOvIFMg6INEGgAMckIUy6vWbT1NFBM3DNmJV2VBw21KH6CoUD0wpkopW8vxSW3j4t3qsAi
	wGBBu68sjdpVi3FsxV55LqCxMyIrlSqiresD7b7PMLmgyxFexOBMu3yjp73wjzaEVOyzU+qb66v
	S49bMwo+GbNNWS/9RbCFQkdiEIPtIqxCp0a+cSVe0F0mYLBSAOeQiAAfWHFCjSN7h4JGIqffBBn
	gWs1LDh83O/1Fc2vD2W/lsdElqYUdDeLgIiPqDLuN500i8ue44JmFYbIEjGRTVxTNpNoLsfCtsy
	bkdeVSy4cR6vArDm7nv59MguIBFL7MnKsfApK6IOgB+vYtwtS5Sw4=
X-Received: by 2002:a05:600c:34cc:b0:488:869c:edaf with SMTP id 5b1f17b1804b1-488d67d882cmr165716615e9.8.1776051203129;
        Sun, 12 Apr 2026 20:33:23 -0700 (PDT)
Received: from localhost.localdomain ([87.71.34.96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488d5d6ee98sm114039175e9.1.2026.04.12.20.33.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Apr 2026 20:33:22 -0700 (PDT)
From: Aviel Zohar <avielzohar123@gmail.com>
To: linux-wireless@vger.kernel.org
Cc: linux-mediatek@lists.infradead.org,
	nbd@nbd.name,
	lorenzo@kernel.org,
	sean.wang@mediatek.com,
	ryder.lee@mediatek.com,
	Aviel Zohar <avielzohar123@gmail.com>
Subject: [PATCH 1/2] wifi: mt76: mt7925: validate skb length in testmode query
Date: Mon, 13 Apr 2026 06:31:34 +0300
Message-ID: <20260413033136.5417-2-avielzohar123@gmail.com>
X-Mailer: git-send-email 2.47.0.windows.1
In-Reply-To: <20260413033136.5417-1-avielzohar123@gmail.com>
References: <20260413033136.5417-1-avielzohar123@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260412_203325_127570_F1F5DB67 
X-CRM114-Status: UNSURE (   9.73  )
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

In mt7925_tm_query(), the response skb from mt76_mcu_send_and_get_msg()
is used in a memcpy without validating its length:

  memcpy(evt_resp, skb->data + 8, MT7925_EVT_RSP_LEN);

where MT7925_EVT_RSP_LEN is 512. If the firmware returns a response
shorter than 520 bytes (8 + 512), this reads beyond the skb data
buffer. The over-read data is then returned to userspace via nla_put()
in mt7925_testmode_dump().

Add a length check before the memcpy to ensure the skb contains
sufficient data.

Fixes: c948b5da6bbe ("wifi: mt76: mt7925: add Mediatek Wi-Fi7 driver for mt7925 chips")
Signed-off-by: Aviel Zohar <avielzohar123@gmail.com>
---
 drivers/net/wireless/mediatek/mt76/mt7925/testmode.c | 5 +++++
 1 file changed, 5 insertions(+)

--- a/drivers/net/wireless/mediatek/mt76/mt7925/testmode.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/testmode.c
@@ -105,6 +105,11 @@
 	if (ret)
 		goto out;
 
+	if (skb->len < MT7925_EVT_RSP_LEN + 8) {
+		ret = -EINVAL;
+		goto out;
+	}
+
 	memcpy((char *)evt_resp, (char *)skb->data + 8, MT7925_EVT_RSP_LEN);
 
 out:

