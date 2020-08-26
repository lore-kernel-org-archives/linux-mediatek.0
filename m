Return-Path: <SRS0=weZ6=CE=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5646EC433DF
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 Aug 2020 06:33:06 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1450A20707
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 Aug 2020 06:33:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="1M5ep9vX";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="EMLRIUB3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1450A20707
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=RlKKDRINWwgws116wTc/X2/C8RVs9+/qUKJDS2C2Ak4=; b=1M5ep9vXb6heSf5/ZFPGlgzWQ8
	LfKFnwIFs5p1PEHigmCtj5OAYL/3NRiWbmw3jOkMwT2NPYWv8YVRWQ7DSwd+PqTS3Z5uJwKBHlfid
	Jq9essP3OB3EhiDm/itp2mUuQjgh8+anWbMwqmcCgFlsaDd7eH0hC0Lra3gNr/fcrWsd7EYK2HFwz
	v9aPm3oU3FRhOoDLxcVoIzvFBGPRcDoWLSJKQRi8HYM+7Lf2/zcQ/mLL8NwGPFwD5H2ZVsVtcjygH
	GF0N3L1nao4LTnC5+mDnmZJY1cQ360wff6L6Y/8/CF2k1ZsnvTY2ydDjE89iQ9aPFSMqBgMvboOJz
	Ok/6uRdQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kAozP-0002VA-VD; Wed, 26 Aug 2020 06:32:56 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kAozN-0002UR-Rz; Wed, 26 Aug 2020 06:32:54 +0000
X-UUID: 748a134ea705475ab7ed03d83beb1732-20200825
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=GIkhKgz7Elf9zu2USBbkj5bdyXwJ9NQ0IBkBTXI6x1k=; 
 b=EMLRIUB3+W2rhkoNq652bxCof4cmA8Zfh9NWX9dM15wlJ9aKZJvGegwwY7tIP5deJLja9DF2clyEI4pl2jmtoC2sXBSMEDeyTrErRSR04a19v2h192nW6ce3+oqGVjiqnC52P3wALOoAhBBV7JUJcjTn5gHyvnGaciju+G8ZSXo=;
X-UUID: 748a134ea705475ab7ed03d83beb1732-20200825
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <chih-en.hsu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1802868791; Tue, 25 Aug 2020 22:32:50 -0800
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 25 Aug 2020 23:22:47 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 26 Aug 2020 14:22:45 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 26 Aug 2020 14:22:45 +0800
From: Chih-En Hsu <chih-en.hsu@mediatek.com>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Matthias Brugger
 <matthias.bgg@gmail.com>
Subject: [PATCH v2] nvmem: mtk-efuse: Remove EFUSE register write support
Date: Wed, 26 Aug 2020 14:21:50 +0800
Message-ID: <20200826062148.27293-1-chih-en.hsu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200826_023254_134609_2BD88F6B 
X-CRM114-Status: GOOD (  10.73  )
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
Cc: Andrew-CT.Chen@mediatek.com, srv_heupstream@mediatek.com,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Chih-En Hsu <chih-en.hsu@mediatek.com>, linux-arm-kernel@lists.infradead.org,
 Michael.Mei@mediatek.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

This patch is to remove function "mtk_reg_write" since
Mediatek EFUSE hardware only supports read functionality
for NVMEM consumers.

Fixes: 4c7e4fe37766 ("nvmem: mediatek: Add Mediatek EFUSE driver")
Signed-off-by: Chih-En Hsu <chih-en.hsu@mediatek.com>
---
 drivers/nvmem/mtk-efuse.c | 14 --------------
 1 file changed, 14 deletions(-)

diff --git a/drivers/nvmem/mtk-efuse.c b/drivers/nvmem/mtk-efuse.c
index 856d9c3fc38e..6a537d959f14 100644
--- a/drivers/nvmem/mtk-efuse.c
+++ b/drivers/nvmem/mtk-efuse.c
@@ -28,19 +28,6 @@ static int mtk_reg_read(void *context,
 	return 0;
 }
 
-static int mtk_reg_write(void *context,
-			 unsigned int reg, void *_val, size_t bytes)
-{
-	struct mtk_efuse_priv *priv = context;
-	u32 *val = _val;
-	int i = 0, words = bytes / 4;
-
-	while (words--)
-		writel(*val++, priv->base + reg + (i++ * 4));
-
-	return 0;
-}
-
 static int mtk_efuse_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -61,7 +48,6 @@ static int mtk_efuse_probe(struct platform_device *pdev)
 	econfig.stride = 4;
 	econfig.word_size = 4;
 	econfig.reg_read = mtk_reg_read;
-	econfig.reg_write = mtk_reg_write;
 	econfig.size = resource_size(res);
 	econfig.priv = priv;
 	econfig.dev = dev;
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
