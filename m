Return-Path: <SRS0=Ntwg=IW=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 115E3C433C1
	for <linux-mediatek@archiver.kernel.org>; Wed, 24 Mar 2021 03:12:27 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AA026619D5
	for <linux-mediatek@archiver.kernel.org>; Wed, 24 Mar 2021 03:12:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AA026619D5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=163.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:MIME-Version:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=6QSvT+ohZY4ewijKlzBAgW68zrr60YsOrU2fcWMe70E=; b=MAXndbl8NX/j0UrkNJL9IotvkP
	yghwX4bK2BjgFa1PTai4abw7ffafaMYrooTD+CZYMQsI+mCyGtVMMdl/Vv7Z8g3PkYvD5Mf+y5r8b
	yKUj5dlKZtg7rw54Y0G3LD1x6Ure9HhpTfH9hSOz1WnqEZkCjsFnOwn/gugOzONGOzHE/Tn/5Note
	x9ZYYemB0xbinjGpBDFKktGEnkOwcN8LVhmcbCQxlf/ZmNEhJsS8Z1iFMaYhU+nNznU5MkfQibuI6
	eTrCq/7CuYat9ObBskCxLSNC0JFCXlxfxqXC5294LKrI3tg8/SeXPoZyCW09Mz28wROqR59Lpv8gQ
	6eGzDxbg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lOtwN-00GDR1-PO; Wed, 24 Mar 2021 03:12:15 +0000
Received: from m12-16.163.com ([220.181.12.16])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lOtwB-00GDOE-Pu; Wed, 24 Mar 2021 03:12:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-Id; bh=0IDwd8zGV3tXRIuwLd
 IoAMYQ18gg+J7ylD3fRmJ6cgI=; b=aoPLh2Q5m4vehoKJojuS3LhDKRWPlvWi+J
 YyeMriKMoaeXewcbK3ILqsU0F5cYM51pxYbIHLvdfDdNmQWTO8+tvJZ+KntnNdLj
 dmIlj8G37sF79apXO4k6y1a/xj3clB5tVSX6pDAuK6ABIDAMSU+uqeCaCPK6i7Ln
 RhNtQoqQk=
Received: from bf-rmnj-02.ccdomain.com (unknown [218.94.48.178])
 by smtp12 (Coremail) with SMTP id EMCowAAHcUPxrVpgUqWOiA--.18703S2;
 Wed, 24 Mar 2021 11:11:51 +0800 (CST)
From: Jian Dong <dj0227@163.com>
To: broonie@kernel.org,
	lgirdwood@gmail.com,
	matthias.bgg@gmail.com
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, huyue2@yulong.com,
 Jian Dong <dongjian@yulong.com>
Subject: [RESEND] regulator: mt6360: remove redundant error print
Date: Wed, 24 Mar 2021 11:11:14 +0800
Message-Id: <1616555474-158789-1-git-send-email-dj0227@163.com>
X-Mailer: git-send-email 1.9.1
X-CM-TRANSID: EMCowAAHcUPxrVpgUqWOiA--.18703S2
X-Coremail-Antispam: 1Uf129KBjvdXoW7Xr4rWr17AryxKFyDWryUJrb_yoWkGFXEkr
 18Aa1xWrs7Zr4akr4IqFsIvr9IyFn2ga17WrsrKFyaqry5A3WDC347GFW7Zr4UW3y8KF9x
 Ww1rWr4xZr13ujkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU8LmRUUUUUU==
X-Originating-IP: [218.94.48.178]
X-CM-SenderInfo: dgmqjjqx6rljoofrz/xtbB0hdf3VUMa9XS3QAAsv
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210324_031204_386412_3EDAA576 
X-CRM114-Status: GOOD (  10.68  )
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

in fact it is not platform_get_irq but platform_get_irq_byname print error

Signed-off-by: Jian Dong <dongjian@yulong.com>
---
 drivers/regulator/mt6360-regulator.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/regulator/mt6360-regulator.c b/drivers/regulator/mt6360-regulator.c
index 15308ee..4d34be9 100644
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
 
 		ret = devm_request_threaded_irq(&pdev->dev, irq, NULL, irq_desc->handler, 0,
 						irq_desc->name, rdev);
-- 
1.9.1



_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
