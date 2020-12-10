Return-Path: <SRS0=Sq/6=FO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85CDBC433FE
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Dec 2020 13:51:49 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3EABA23BAB
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Dec 2020 13:51:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3EABA23BAB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=zeAkfwqRaL4A8SbP0cNZ5dp/WIwXEEbQ1BtFxIITxYE=; b=YMbEPJnaL37ftIJWxulocDKH/Q
	pV2dTpEsjYGsC7jLtB93dDmajn/QXdfA2Tv27nrV8Hya5jHwBUCrQu4L6hhM/E/aCCO9C5Me1xo5Q
	x366J8zNl+ckQV1R9qi4omwGvJ3cKTIlG/DYRprNwob06AO4J6T/oarHsYT0CDOQHpVWUzxMJyj91
	eFJVUEV3vnUlx+rXi6ngttOV+cbqhWa2ZtakRy877j8R23MuK/opaiZrseCJrdPR84iwcjZ3Nkyrf
	GfyI7YeZYv9WBX6KDs0gJ/vgnX+0zvi740TIs/wQZ47f6E4qti6RVujaiJ7npBaLWGerF2SqzVtR3
	oGSdjCmA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1knMM6-0004va-IM; Thu, 10 Dec 2020 13:51:38 +0000
Received: from szxga05-in.huawei.com ([45.249.212.191])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1knMLx-0004pA-7z; Thu, 10 Dec 2020 13:51:30 +0000
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4CsFg50F1mzM34n;
 Thu, 10 Dec 2020 21:50:41 +0800 (CST)
Received: from ubuntu.network (10.175.138.68) by
 DGGEMS406-HUB.china.huawei.com (10.3.19.206) with Microsoft SMTP Server id
 14.3.487.0; Thu, 10 Dec 2020 21:51:14 +0800
From: Zheng Yongjun <zhengyongjun3@huawei.com>
To: <johan@kernel.org>, <matthias.bgg@gmail.com>,
 <linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH -next] drivers: gnss: simplify the gnss code return expression
Date: Thu, 10 Dec 2020 21:51:42 +0800
Message-ID: <20201210135142.1138-1-zhengyongjun3@huawei.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
X-Originating-IP: [10.175.138.68]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201210_085129_550495_C940CAFC 
X-CRM114-Status: UNSURE (   9.74  )
X-CRM114-Notice: Please train this message.
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
Cc: Zheng Yongjun <zhengyongjun3@huawei.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Simplify the return expression at diffrent .c file, fix this all.

Signed-off-by: Zheng Yongjun <zhengyongjun3@huawei.com>
---
 drivers/gnss/core.c |  7 +------
 drivers/gnss/mtk.c  | 14 ++------------
 drivers/gnss/ubx.c  | 14 ++------------
 3 files changed, 5 insertions(+), 30 deletions(-)

diff --git a/drivers/gnss/core.c b/drivers/gnss/core.c
index e6f94501cb28..e6b9ac9da92c 100644
--- a/drivers/gnss/core.c
+++ b/drivers/gnss/core.c
@@ -368,13 +368,8 @@ ATTRIBUTE_GROUPS(gnss);
 static int gnss_uevent(struct device *dev, struct kobj_uevent_env *env)
 {
 	struct gnss_device *gdev = to_gnss_device(dev);
-	int ret;
 
-	ret = add_uevent_var(env, "GNSS_TYPE=%s", gnss_type_name(gdev));
-	if (ret)
-		return ret;
-
-	return 0;
+	return add_uevent_var(env, "GNSS_TYPE=%s", gnss_type_name(gdev));
 }
 
 static int __init gnss_module_init(void)
diff --git a/drivers/gnss/mtk.c b/drivers/gnss/mtk.c
index d1fc55560daf..451cb6e66ec3 100644
--- a/drivers/gnss/mtk.c
+++ b/drivers/gnss/mtk.c
@@ -24,25 +24,15 @@ struct mtk_data {
 static int mtk_set_active(struct gnss_serial *gserial)
 {
 	struct mtk_data *data = gnss_serial_get_drvdata(gserial);
-	int ret;
 
-	ret = regulator_enable(data->vcc);
-	if (ret)
-		return ret;
-
-	return 0;
+	return regulator_enable(data->vcc);
 }
 
 static int mtk_set_standby(struct gnss_serial *gserial)
 {
 	struct mtk_data *data = gnss_serial_get_drvdata(gserial);
-	int ret;
 
-	ret = regulator_disable(data->vcc);
-	if (ret)
-		return ret;
-
-	return 0;
+	return regulator_disable(data->vcc);
 }
 
 static int mtk_set_power(struct gnss_serial *gserial,
diff --git a/drivers/gnss/ubx.c b/drivers/gnss/ubx.c
index 7b05bc40532e..7a22fc901fab 100644
--- a/drivers/gnss/ubx.c
+++ b/drivers/gnss/ubx.c
@@ -24,25 +24,15 @@ struct ubx_data {
 static int ubx_set_active(struct gnss_serial *gserial)
 {
 	struct ubx_data *data = gnss_serial_get_drvdata(gserial);
-	int ret;
 
-	ret = regulator_enable(data->vcc);
-	if (ret)
-		return ret;
-
-	return 0;
+	return regulator_enable(data->vcc);
 }
 
 static int ubx_set_standby(struct gnss_serial *gserial)
 {
 	struct ubx_data *data = gnss_serial_get_drvdata(gserial);
-	int ret;
 
-	ret = regulator_disable(data->vcc);
-	if (ret)
-		return ret;
-
-	return 0;
+	return regulator_disable(data->vcc);
 }
 
 static int ubx_set_power(struct gnss_serial *gserial,
-- 
2.22.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
