Return-Path: <SRS0=DVVK=FE=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 044F2C63777
	for <linux-mediatek@archiver.kernel.org>; Mon, 30 Nov 2020 09:26:09 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4CD8320825
	for <linux-mediatek@archiver.kernel.org>; Mon, 30 Nov 2020 09:26:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="tz9gUJ0Q";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="ZLZKy5wI"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4CD8320825
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=vYYwTkg9ynaOmQszWnEoMWb5wbAVpToB0uaUl/NAKGI=; b=tz9gUJ0QKNUpv9/sApdVovPtP7
	64K0Te6H7ZqxEYvM7MjbxR8VgY+a5W02wBEz1nypyMm+raI5GA9JfpONipMYxBS3muWrUtd6EF6wo
	Bhs1p2FvJOdMtwawiU63+D5uM3ynVNFHsbyr4vZgSAWVzc9djqidIij4YK+S5JumStYW9n+wIamCQ
	Ecja264Qo6bHmhB31fzJIz7iuaIGSM1zosPd7JDaUfbhMbvqcpsTnSYvowZtcUaQYQHOOfFgZfIvp
	XFFRTU67zZrUXv7huDrzvRy4wVwnhwQmPG3Z6S5JxNmuBe24n1po6UX2xD8SzrbE9FB2sOKiSXJbC
	+6TGwmCA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kjfRY-0007yy-Fq; Mon, 30 Nov 2020 09:26:00 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kjfRW-0007xJ-6g; Mon, 30 Nov 2020 09:25:59 +0000
X-UUID: 0490401f65ce4450a534ce5d9662a5c8-20201130
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=i4h3PflF5Bkc2y9daW5QYyLjsw/RtBQt0T1mhBWyqNE=; 
 b=ZLZKy5wIVctzGX+oQaRdItSDZPdEb2y8WsV7fr9/RVi6aUyZCEV26oPBZ47BC8Kgv3ZY9iG69cxuu5zvYjnjAqSRMyd2wLtVQzywSZ5suBicHBBCZwZfFyXvV6LsYI64JY2+ltGoXzxngv81Re8N4TgIVoJDPV9+yur/bj8t1TA=;
X-UUID: 0490401f65ce4450a534ce5d9662a5c8-20201130
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <stanley.chu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1600418236; Mon, 30 Nov 2020 01:25:46 -0800
Received: from mtkmbs08n1.mediatek.inc (172.21.101.55) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 30 Nov 2020 01:16:10 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs08n1.mediatek.inc (172.21.101.55) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 30 Nov 2020 17:16:10 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Mon, 30 Nov 2020 17:16:10 +0800
From: Stanley Chu <stanley.chu@mediatek.com>
To: <linux-scsi@vger.kernel.org>, <martin.petersen@oracle.com>,
 <avri.altman@wdc.com>, <alim.akhtar@samsung.com>, <jejb@linux.ibm.com>
Subject: [RFC PATCH v1] scsi: ufs: Remove pre-defined initial VCC voltage
 values
Date: Mon, 30 Nov 2020 17:16:10 +0800
Message-ID: <20201130091610.2752-1-stanley.chu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201130_042558_641925_4E975A99 
X-CRM114-Status: GOOD (  17.18  )
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
Cc: bjorn.andersson@linaro.org, Stanley Chu <stanley.chu@mediatek.com>,
 alice.chao@mediatek.com, bvanassche@acm.org, andy.teng@mediatek.com,
 cc.chou@mediatek.com, chun-hung.wu@mediatek.com, kuohong.wang@mediatek.com,
 linux-kernel@vger.kernel.org, nguyenb@codeaurora.org, jiajie.hao@mediatek.com,
 cang@codeaurora.org, linux-mediatek@lists.infradead.org,
 peter.wang@mediatek.com, matthias.bgg@gmail.com, beanhuo@micron.com,
 chaotian.jing@mediatek.com, linux-arm-kernel@lists.infradead.org,
 asutoshd@codeaurora.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

UFS specficication allows different VCC configurations for UFS devices,
for example,
	(1). 2.70V - 3.60V (By default)
	(2). 1.70V - 1.95V (Activated if "vcc-supply-1p8" is declared in
                          device tree)
	(3). 2.40V - 2.70V (Supported since UFS 3.x)

With the introduction of UFS 3.x products, an issue is happening that
UFS driver will use wrong "min_uV/max_uV" configuration to toggle VCC
regulator on UFU 3.x products with VCC configuration (3) used.

To solve this issue, we simply remove pre-defined initial VCC voltage
values in UFS driver with below reasons,

1. UFS specifications do not define how to detect the VCC configuration
   supported by attached device.

2. Device tree already supports standard regulator properties.

Therefore VCC voltage shall be defined correctly in device tree, and
shall not be changed by UFS driver. What UFS driver needs to do is simply
enabling or disabling the VCC regulator only.

This is a RFC conceptional patch. Please help review this and feel
free to feedback any ideas. Once this concept is accepted, and then
I would post a more completed patch series to fix this issue.

Signed-off-by: Stanley Chu <stanley.chu@mediatek.com>
---
 drivers/scsi/ufs/ufshcd-pltfrm.c | 10 +---------
 1 file changed, 1 insertion(+), 9 deletions(-)

diff --git a/drivers/scsi/ufs/ufshcd-pltfrm.c b/drivers/scsi/ufs/ufshcd-pltfrm.c
index a6f76399b3ae..3965be03c136 100644
--- a/drivers/scsi/ufs/ufshcd-pltfrm.c
+++ b/drivers/scsi/ufs/ufshcd-pltfrm.c
@@ -133,15 +133,7 @@ static int ufshcd_populate_vreg(struct device *dev, const char *name,
 		vreg->max_uA = 0;
 	}
 
-	if (!strcmp(name, "vcc")) {
-		if (of_property_read_bool(np, "vcc-supply-1p8")) {
-			vreg->min_uV = UFS_VREG_VCC_1P8_MIN_UV;
-			vreg->max_uV = UFS_VREG_VCC_1P8_MAX_UV;
-		} else {
-			vreg->min_uV = UFS_VREG_VCC_MIN_UV;
-			vreg->max_uV = UFS_VREG_VCC_MAX_UV;
-		}
-	} else if (!strcmp(name, "vccq")) {
+	if (!strcmp(name, "vccq")) {
 		vreg->min_uV = UFS_VREG_VCCQ_MIN_UV;
 		vreg->max_uV = UFS_VREG_VCCQ_MAX_UV;
 	} else if (!strcmp(name, "vccq2")) {
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
