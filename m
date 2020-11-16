Return-Path: <SRS0=p/XJ=EW=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 297D8C63697
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Nov 2020 07:01:33 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 86E942067C
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Nov 2020 07:01:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="cNvaK09c";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="NCsKcMtA"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 86E942067C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=l0rsvIyzIP8MKepvgEMI/9sIxpVTCGOSbU6WkJY9JKs=; b=cNvaK09cwkV+BL0H8F+2+t/Ds
	3P3qeBl65NNlT8uEHhN/NBKhCem1xkQynkVrZAP6nElfyDwhOHKeFER2ela0j/NAKcQkke082RKZ3
	Tj/x1pNmxcSe0UhdyLHOI4nFWRNntmont+JU5/wt4a91dkXZ1sEVOmtcjrJ54FLhI2A66TPxjPfEI
	HZB4OtoEOXhKzBTb0KLSOOhCpkucDi0VUxtnZ7BRgA79uB+ZTdIk03fUvZFtJckTiRWCGSP0NSGaX
	hWo1KG2ZQUwmZ+vl/ijp0rV+0JdnxJ+JrkN+X85JFC+XBxwowre0L6xyge2Eodu4iXXyIf/UWDdDg
	CPYCXZ14g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1keYVz-000659-5Y; Mon, 16 Nov 2020 07:01:27 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1keYVg-0005ww-Qn; Mon, 16 Nov 2020 07:01:10 +0000
X-UUID: c42300ea3cfd4aa7b77b146f9d7aec60-20201115
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=4IeDmzj71Xpj7H/oflO+5sbTswLwDEPGwwVMggQWihY=; 
 b=NCsKcMtABSLp6/TsB7h8CO1BvjuRQH4kYD7E9q5noiJ0L/+fb7GxlvZVWL9ONux1A0MqeeQLDA6oBFWoxTFDt2gwS8XkjcHp1Xg/uyk8o0YN+yJuxU5B9P+IrerteNvlah7RgrdSEdARmvwrdvTbBnqkhRtTZbPmqFTIVL2zAb0=;
X-UUID: c42300ea3cfd4aa7b77b146f9d7aec60-20201115
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <stanley.chu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 889664186; Sun, 15 Nov 2020 23:00:59 -0800
Received: from MTKMBS02N2.mediatek.inc (172.21.101.101) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 15 Nov 2020 22:50:57 -0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs02n2.mediatek.inc (172.21.101.101) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 16 Nov 2020 14:50:55 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Mon, 16 Nov 2020 14:50:55 +0800
From: Stanley Chu <stanley.chu@mediatek.com>
To: <linux-scsi@vger.kernel.org>, <martin.petersen@oracle.com>,
 <avri.altman@wdc.com>, <alim.akhtar@samsung.com>, <jejb@linux.ibm.com>
Subject: [PATCH v1 1/9] scsi: ufs-mediatek: Refactor performance scaling
 functions
Date: Mon, 16 Nov 2020 14:50:46 +0800
Message-ID: <20201116065054.7658-2-stanley.chu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20201116065054.7658-1-stanley.chu@mediatek.com>
References: <20201116065054.7658-1-stanley.chu@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: 7BA158C2F014F9EBECDA729273DE98A4D70B8A66006E120B5A876D526A8E02762000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201116_020109_132104_BA91197C 
X-CRM114-Status: GOOD (  11.05  )
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
Cc: chun-hung.wu@mediatek.com, alice.chao@mediatek.com,
 Stanley Chu <stanley.chu@mediatek.com>, andy.teng@mediatek.com,
 cc.chou@mediatek.com, peter.wang@mediatek.com, kuohong.wang@mediatek.com,
 linux-kernel@vger.kernel.org, kwmad.kim@samsung.com, jiajie.hao@mediatek.com,
 cang@codeaurora.org, linux-mediatek@lists.infradead.org, liwei213@huawei.com,
 matthias.bgg@gmail.com, beanhuo@micron.com, chaotian.jing@mediatek.com,
 linux-arm-kernel@lists.infradead.org, asutoshd@codeaurora.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Refactor preformance scaling related functions in MediaTek
UFS driver.

Signed-off-by: Stanley Chu <stanley.chu@mediatek.com>
---
 drivers/scsi/ufs/ufs-mediatek.c | 24 ++++++++++++++++--------
 1 file changed, 16 insertions(+), 8 deletions(-)

diff --git a/drivers/scsi/ufs/ufs-mediatek.c b/drivers/scsi/ufs/ufs-mediatek.c
index 7fed7630d36c..b9b423752ee1 100644
--- a/drivers/scsi/ufs/ufs-mediatek.c
+++ b/drivers/scsi/ufs/ufs-mediatek.c
@@ -514,6 +514,19 @@ static void ufs_mtk_init_host_caps(struct ufs_hba *hba)
 	dev_info(hba->dev, "caps: 0x%x", host->caps);
 }
 
+static void ufs_mtk_scale_perf(struct ufs_hba *hba, bool up)
+{
+	struct ufs_mtk_host *host = ufshcd_get_variant(hba);
+
+	ufs_mtk_boost_crypt(hba, up);
+	ufs_mtk_setup_ref_clk(hba, up);
+
+	if (up)
+		phy_power_on(host->mphy);
+	else
+		phy_power_off(host->mphy);
+}
+
 /**
  * ufs_mtk_setup_clocks - enables/disable clocks
  * @hba: host controller instance
@@ -555,15 +568,10 @@ static int ufs_mtk_setup_clocks(struct ufs_hba *hba, bool on,
 				clk_pwr_off = true;
 		}
 
-		if (clk_pwr_off) {
-			ufs_mtk_boost_crypt(hba, on);
-			ufs_mtk_setup_ref_clk(hba, on);
-			phy_power_off(host->mphy);
-		}
+		if (clk_pwr_off)
+			ufs_mtk_scale_perf(hba, false);
 	} else if (on && status == POST_CHANGE) {
-		phy_power_on(host->mphy);
-		ufs_mtk_setup_ref_clk(hba, on);
-		ufs_mtk_boost_crypt(hba, on);
+		ufs_mtk_scale_perf(hba, true);
 	}
 
 	return ret;
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
