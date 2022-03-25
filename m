Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D20ABC433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 25 Mar 2022 17:30:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=g0lNIWe/vz/I51I5MrwS4+22JA0YT65lTzwAiHYQkwQ=; b=bh7hLtPi1DEobb
	zoPWUxrP3SxW5vNcE051EK2V51DOuw9ltin1mJkv2hlQSHN97b2KRiP9brlxP0ODAekM5nXcws03X
	B4BQBWxZXCm8Kyf+UZ8yW5GvVBO65TQFvx4hspG6s06s2hiQbK4DxBsD4T3c4h+FwpslZb8HP6vL5
	oLRHStqixbmVYUgg8BpKSqux2WVpZ5E9GxNRavXpybqEjPolGWmNRfdzaZUq5MyU277bGXmaiCldV
	RwyTy2MIeoA4XCSxnsXGTF34PNeENYBVIZXN4lKx6TeRk8GFG/Xvm6FwaG5eJDvdAusUznX+V7Dee
	sMXwzbaVBcqZJpsZ4Y2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nXnlr-002ohB-7U; Fri, 25 Mar 2022 17:30:43 +0000
Received: from mail-wm1-f46.google.com ([209.85.128.46])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nXnZ6-002hzS-CQ
 for linux-mediatek@lists.infradead.org; Fri, 25 Mar 2022 17:17:40 +0000
Received: by mail-wm1-f46.google.com with SMTP id
 p12-20020a05600c430c00b0038cbdf52227so4796710wme.2
 for <linux-mediatek@lists.infradead.org>; Fri, 25 Mar 2022 10:17:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=sPZ7FGjoeMWGizm+Tvir8n+ep2Y5gqfNLr6cPfnxdL0=;
 b=QwhQpZiXoY5TVYEr11zMmZ5/ne6KHxjlFBW2/Hw5FR4FrIs5FKHyQACQKH8bld+/Nu
 dqT7jE/l0j4JIRasbWDPOT8ueCgPbeNDIGWGkmqJXNpm6Hp83fe8jZ/1Nx0ffNYJQqSR
 Ej720UwBmE920nZ6u6/NaX7CnJDYHnhutF/+lQRbbtoP9NgV3A33nbW9QmQEh5+Ox/Zy
 d2Vk6Oz+snY7HZPKMcxfOlDfFgw1Oa8o5n1UFv4rKkM2wRN9yg7lQBp1L1A/VgaX7NE4
 Sg3rGnqXCeeFQh2F9R7xmwF3IIcneN77jJF2xxiS3kVdKTEOHMtG1GZ22aT99OGW7Bit
 dRXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=sPZ7FGjoeMWGizm+Tvir8n+ep2Y5gqfNLr6cPfnxdL0=;
 b=ZRBtCKWn86KRG3l1vE4PLlrT9/8Ya/+ui5HtjD9MCf0mNgWzMCY+zcHREdzfpv847M
 j7TlUcvp5MTu7Dpd5PaMfKUNHjZEyiqqyr71HDVyA3Gu3S/tptk9rXf716ZnGnxklgH9
 9kW1xLUVu1SN0KCWTUs9RBTJ0qDZY3Yt7PouV4szPMEZ3ZfLYf+pTGh1jDXNobPC2GXy
 cQf+e/rXQpLkaRwilPZkIppOiYI4gLxHKTqAKGT5w1BgZl4A9phCvW+xtyLPPVMZWGnm
 JJptQ9WyLRo8ZaWj+kXZNMojr3V5e5OUM03HMgSI4J9A3TR1y948kw5Cz+Qz13MKh423
 SDrg==
X-Gm-Message-State: AOAM533R1lkmCAXnPP6fY5stsPBBJJ6qR+B9Kbacbuc802in/T2f2nrq
 ZydgL0UfBK052vzj1ygW9mQD5Q==
X-Google-Smtp-Source: ABdhPJzx5XeQEx/NjraCkgpGyTOwzN4hvRuQFeGLZUD9Q64Ryk/j+SV+JBkrRHUjiG+2bCFJQXYLyg==
X-Received: by 2002:a05:600c:34d4:b0:38c:5ec7:1e38 with SMTP id
 d20-20020a05600c34d400b0038c5ec71e38mr20281401wmq.184.1648228650139; 
 Fri, 25 Mar 2022 10:17:30 -0700 (PDT)
Received: from localhost.localdomain
 (2a02-8440-6240-cc41-3074-96af-9642-0003.rev.sfr.net.
 [2a02:8440:6240:cc41:3074:96af:9642:3])
 by smtp.gmail.com with ESMTPSA id
 p16-20020a5d6390000000b00203ffebddf3sm7547464wru.99.2022.03.25.10.17.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Mar 2022 10:17:29 -0700 (PDT)
From: Guillaume Ranquet <granquet@baylibre.com>
To: chunkuang.hu@kernel.org, p.zabel@pengutronix.de, airlied@linux.ie,
 daniel@ffwll.ch, robh+dt@kernel.org, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, matthias.bgg@gmail.com,
 chunfeng.yun@mediatek.com, kishon@ti.com, vkoul@kernel.org, deller@gmx.de,
 ck.hu@mediatek.com, jitao.shi@mediatek.com,
 angelogioacchino.delregno@collabora.com
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org,
 linux-fbdev@vger.kernel.org, markyacoub@google.com
Subject: [PATCH 21/22] drm/mediatek: change the aux retries times when
 receiving AUX_DEFER
Date: Fri, 25 Mar 2022 18:15:10 +0100
Message-Id: <20220325171511.23493-22-granquet@baylibre.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220325171511.23493-1-granquet@baylibre.com>
References: <20220325171511.23493-1-granquet@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220325_101732_482371_5A3BB18B 
X-CRM114-Status: GOOD (  13.17  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Jitao Shi <jitao.shi@mediatek.com>

DP 1.4a Section 2.8.7.1.5.6.1:
A DP Source device shall retry at least seven times upon receiving
AUX_DEFER before giving up the AUX transaction.

Aux should retry to send msg whether how many bytes.

Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
---
 drivers/gpu/drm/mediatek/mtk_dp.c | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_dp.c b/drivers/gpu/drm/mediatek/mtk_dp.c
index 4981a3a3b9ca..de2a1c1b4f8c 100644
--- a/drivers/gpu/drm/mediatek/mtk_dp.c
+++ b/drivers/gpu/drm/mediatek/mtk_dp.c
@@ -2018,7 +2018,7 @@ static ssize_t mtk_dp_aux_transfer(struct drm_dp_aux *mtk_aux,
 	bool is_read;
 	u8 request;
 	size_t accessed_bytes = 0;
-	int retry = 3, ret = 0;
+	int retry, ret = 0;
 
 	mtk_dp = container_of(mtk_aux, struct mtk_dp, aux);
 
@@ -2052,14 +2052,21 @@ static ssize_t mtk_dp_aux_transfer(struct drm_dp_aux *mtk_aux,
 	}
 
 	if (msg->size == 0) {
-		ret = mtk_dp_aux_do_transfer(mtk_dp, is_read, request,
-					     msg->address + accessed_bytes,
-					     msg->buffer + accessed_bytes, 0);
+		retry = 32;
+		while (retry--) {
+			ret = mtk_dp_aux_do_transfer(mtk_dp, is_read, request,
+						     msg->address + accessed_bytes,
+						     msg->buffer + accessed_bytes, 0);
+			if (ret == 0)
+				break;
+			usleep_range(500, 600);
+		}
 	} else {
 		while (accessed_bytes < msg->size) {
 			size_t to_access =
 				min_t(size_t, DP_AUX_MAX_PAYLOAD_BYTES,
 				      msg->size - accessed_bytes);
+			retry = 32;
 			while (retry--) {
 				ret = mtk_dp_aux_do_transfer(mtk_dp,
 							     is_read, request,
@@ -2068,7 +2075,7 @@ static ssize_t mtk_dp_aux_transfer(struct drm_dp_aux *mtk_aux,
 							     to_access);
 				if (ret == 0)
 					break;
-				usleep_range(50, 100);
+				usleep_range(500, 600);
 			}
 			if (!retry || ret) {
 				drm_info(mtk_dp->drm_dev,
-- 
2.34.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
