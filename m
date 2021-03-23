Return-Path: <SRS0=7DfI=IV=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7A34C433C1
	for <linux-mediatek@archiver.kernel.org>; Tue, 23 Mar 2021 12:24:05 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5E1C0619B1
	for <linux-mediatek@archiver.kernel.org>; Tue, 23 Mar 2021 12:24:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5E1C0619B1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=163.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:MIME-Version:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=NgclzHXRSvjPbLTyp+YelU+Jpszurn5WCftcPI0eH1s=; b=XlE6EyJ2Vp3aoL4Jl01b8TiKwK
	rrtCyeLAXiddyw/h78c6fw2afx0iXwjGrc6CI6na3+ivTNk7PYpmLj3G7oJOmGMAxz++xb9KQ1NDQ
	NhhAkm1MdCq+aga/3DZZot9d/Lw30+5RJpM/CQiQSaVZ5MXnFxv3o3IliCcRg+1OCj/HsKCvq+bDJ
	FK3BxR0qU7Fj/Ee8UVmLHjnximDNonwqg9wEZduag8+SZYH5JCWSzXsqAJuvf09kCaj8+rDx7BTWN
	5cAZF48enLsQOxnxalBB/QjUj4WTI8GhhICeSQQhe36hh1YWX1FQtcIP8aB5xubWzrDoVZzx8c7fj
	LmFM7xtA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lOg4g-00EwuN-Ll; Tue, 23 Mar 2021 12:23:54 +0000
Received: from m12-16.163.com ([220.181.12.16])
 by desiato.infradead.org with smtp (Exim 4.94 #2 (Red Hat Linux))
 id 1lOg4U-00Ewsw-BD; Tue, 23 Mar 2021 12:23:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-Id; bh=8Om3vnhENKRPd8B7S0
 OAH/SN8Lmo00lT5UbB0lg3uOg=; b=i8X2Z3kjUQSuM58xunF5/31Vq9W7lVmh5b
 Cfjyq4cG95AgRIcqpj+lZjNXC3j5PqNsuH6cgLDZSodaToQ1LeDuVwQ0uncITWYq
 qOShon5ILGYj8RTanD385iSSO2fM7wxjkfcN4Hd6Z2vJvGAT5FEQHXH8CMrkmUa2
 oqb0SgMNg=
Received: from bf-rmnj-02.ccdomain.com (unknown [218.94.48.178])
 by smtp12 (Coremail) with SMTP id EMCowAAHDSmo3Vlgc0EniA--.12617S2;
 Tue, 23 Mar 2021 20:23:08 +0800 (CST)
From: Jian Dong <dj0227@163.com>
To: matthias.bgg@gmail.com,
	broonie@kernel.org
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, huyue2@yulong.com,
 Jian Dong <dongjian@yulong.com>
Subject: [PATCH] regulator: mt6360: remove redundant error print
Date: Tue, 23 Mar 2021 20:22:41 +0800
Message-Id: <1616502161-125407-1-git-send-email-dj0227@163.com>
X-Mailer: git-send-email 1.9.1
X-CM-TRANSID: EMCowAAHDSmo3Vlgc0EniA--.12617S2
X-Coremail-Antispam: 1Uf129KBjvdXoW7Xr4rWr17AryxKFyDWryUJrb_yoWkXwcEkr
 1xAa1xWrs7Zr4akr4IqFsIvrZIyFn7Ka17WrsrKFyavry5Aa4DC347GFW7Zr4UW3yUKr9x
 W3sagrs7Zr13ujkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUnO18PUUUUU==
X-Originating-IP: [218.94.48.178]
X-CM-SenderInfo: dgmqjjqx6rljoofrz/xtbB0g9e3VUMa88jEQABsQ
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210323_122343_434900_3A843F96 
X-CRM114-Status: GOOD (  10.33  )
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

From: Jian Dong <dongjian@yulong.com>

fixes coccicheck warning:

drivers/regulator/mt6360-regulator.c:384:3-10: line 384 is
redundant because platform_get_irq() already prints an error

in fact, it is not platform_get_irq but platform_get_irq_byname print error

Signed-off-by: Jian Dong <dongjian@yulong.com>
---
 drivers/regulator/mt6360-regulator.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/regulator/mt6360-regulator.c b/drivers/regulator/mt6360-regulator.c
index 947350d..178180c 100644
--- a/drivers/regulator/mt6360-regulator.c
+++ b/drivers/regulator/mt6360-regulator.c
@@ -380,10 +380,8 @@ static int mt6360_regulator_irq_register(struct platform_device *pdev,
 		const struct mt6360_irq_mapping *irq_desc = tbls + i;
 
 		irq = platform_get_irq_byname(pdev, irq_desc->name);
-		if (irq < 0) {
-			dev_err(&pdev->dev, "Fail to get %s irq\n", irq_desc->name);
+		if (irq < 0)
 			return irq;
-		}
 
 		ret = devm_request_threaded_irq(&pdev->dev, irq, NULL, irq_desc->handler,
 					IRQF_ONESHOT, irq_desc->name, rdev);
-- 
1.9.1



_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
