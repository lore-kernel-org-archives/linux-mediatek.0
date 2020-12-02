Return-Path: <SRS0=Og7P=FG=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 224D0C64E8A
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Dec 2020 09:19:02 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5D1A920872
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Dec 2020 09:19:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5D1A920872
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=34NhvOpAs379XcDjmynJ2Uwe02eLMgs0bh8L6mq8x10=; b=V4s+KIrQpA6D/xO3qDTH2p4bkW
	EOIXLDbwA+sjerS2CfnGAd5EHgAoGa7COHfIULWrowKgcbnmi9cl2x/Y15kSzKvL9lmoGwRLY/TEn
	bdmtw7dsYHi0VoZaZ7y+/efGWapjzzfmphtHFlnEi9MQgdnT/+I/ZBQysMsVZFyb1gR9qeT4grhZG
	hUdzdLjM6+PaYXaoFiP5JBORP+5giOT3y/G3leSaT1Z0xO35fvBcfuSKJqfWJEZ7L7GobcCG1eegl
	yREluT3jT3ffwN5TYjFsvoj9cbr+LVf/tt/nuqo620xsy5gIDWl8H1Rbnu43eKINLuGKHUwxwB1aq
	OJ77QEVA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kkOHY-0001a0-PP; Wed, 02 Dec 2020 09:18:40 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kkOHR-0001YY-KF; Wed, 02 Dec 2020 09:18:37 +0000
X-UUID: 9c07640e31d641609fe3867dd7035ca1-20201202
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=zEKXvE1wjDZTgqb4vnnmx9DAjizvdhKpB7BPJiijHLg=; 
 b=ZGI1PR9YJRQmlYI9L14nc6wML2MonSESuniRHaVtCVq/OYyKSRg+O/icSm4w1Lh+sw+9UMRnCu+mAva17ByNBTkHOiSkgkVnUXmHGofr99htAk81k7rwM0lygW2H7MVHl20+WxjOmG7YLeSi3VDFrk/ghxmUaoREhhJyHX/c5sk=;
X-UUID: 9c07640e31d641609fe3867dd7035ca1-20201202
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <stanley.chu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1901923518; Wed, 02 Dec 2020 01:18:26 -0800
Received: from mtkmbs08n1.mediatek.inc (172.21.101.55) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 2 Dec 2020 01:18:26 -0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs08n1.mediatek.inc (172.21.101.55) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 2 Dec 2020 17:18:19 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 2 Dec 2020 17:18:19 +0800
From: Stanley Chu <stanley.chu@mediatek.com>
To: <linux-scsi@vger.kernel.org>, <martin.petersen@oracle.com>,
 <avri.altman@wdc.com>, <alim.akhtar@samsung.com>, <jejb@linux.ibm.com>
Subject: [PATCH v3] scsi: ufs: Remove pre-defined initial voltage values of
 device powers
Date: Wed, 2 Dec 2020 17:18:19 +0800
Message-ID: <20201202091819.22363-1-stanley.chu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201202_041834_466893_38F2A9E6 
X-CRM114-Status: GOOD (  14.24  )
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
Cc: Stanley Chu <stanley.chu@mediatek.com>, alice.chao@mediatek.com,
 bvanassche@acm.org, andy.teng@mediatek.com, cc.chou@mediatek.com,
 chun-hung.wu@mediatek.com, kuohong.wang@mediatek.com,
 linux-kernel@vger.kernel.org, jiajie.hao@mediatek.com, cang@codeaurora.org,
 linux-mediatek@lists.infradead.org, peter.wang@mediatek.com,
 matthias.bgg@gmail.com, beanhuo@micron.com, chaotian.jing@mediatek.com,
 linux-arm-kernel@lists.infradead.org, asutoshd@codeaurora.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

UFS specficication allows different VCC configurations for UFS devices,
for example,
	(1). 2.70V - 3.60V (Activated by default in UFS core driver)
	(2). 1.70V - 1.95V (Activated if "vcc-supply-1p8" is declared in
                          device tree)
	(3). 2.40V - 2.70V (Supported since UFS 3.x)

With the introduction of UFS 3.x products, an issue is happening that
UFS driver will use wrong "min_uV-max_uV" values to configure the
voltage of VCC regulator on UFU 3.x products with the configuration (3)
used.

To solve this issue, we simply remove pre-defined initial VCC voltage
values in UFS core driver with below reasons,

1. UFS specifications do not define how to detect the VCC configuration
   supported by attached device.

2. Device tree already supports standard regulator properties.

Therefore VCC voltage shall be defined correctly in device tree, and
shall not changed by UFS driver. What UFS driver needs to do is simply
enable or disable the VCC regulator only.

Similar change is applied to VCCQ and VCCQ2 as well.

Note that we keep struct ufs_vreg unchanged. This allows vendors to
configure proper min_uV and max_uV of any regulators to make
regulator_set_voltage() works during regulator toggling flow in the
future. Without specific vendor configurations, min_uV and max_uV will
be NULL by default and UFS core driver will enable or disable the
regulator only without adjusting its voltage.

Acked-by: Avri Altman <avri.altman@wdc.com>
Reviewed-by: Asutosh Das <asutoshd@codeaurora.org>
Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
Signed-off-by: Stanley Chu <stanley.chu@mediatek.com>
---
 drivers/scsi/ufs/ufshcd-pltfrm.c | 19 -------------------
 1 file changed, 19 deletions(-)

diff --git a/drivers/scsi/ufs/ufshcd-pltfrm.c b/drivers/scsi/ufs/ufshcd-pltfrm.c
index 0619cfbfbdbb..1a69949a4ea1 100644
--- a/drivers/scsi/ufs/ufshcd-pltfrm.c
+++ b/drivers/scsi/ufs/ufshcd-pltfrm.c
@@ -134,25 +134,6 @@ static int ufshcd_populate_vreg(struct device *dev, const char *name,
 		dev_info(dev, "%s: unable to find %s\n", __func__, prop_name);
 		vreg->max_uA = 0;
 	}
-
-	if (!strcmp(name, "vcc")) {
-		if (of_property_read_bool(np, "vcc-supply-1p8")) {
-			vreg->min_uV = UFS_VREG_VCC_1P8_MIN_UV;
-			vreg->max_uV = UFS_VREG_VCC_1P8_MAX_UV;
-		} else {
-			vreg->min_uV = UFS_VREG_VCC_MIN_UV;
-			vreg->max_uV = UFS_VREG_VCC_MAX_UV;
-		}
-	} else if (!strcmp(name, "vccq")) {
-		vreg->min_uV = UFS_VREG_VCCQ_MIN_UV;
-		vreg->max_uV = UFS_VREG_VCCQ_MAX_UV;
-	} else if (!strcmp(name, "vccq2")) {
-		vreg->min_uV = UFS_VREG_VCCQ2_MIN_UV;
-		vreg->max_uV = UFS_VREG_VCCQ2_MAX_UV;
-	}
-
-	goto out;
-
 out:
 	if (!ret)
 		*out_vreg = vreg;
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
