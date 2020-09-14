Return-Path: <SRS0=gVFe=CX=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7EF75C43461
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Sep 2020 05:01:31 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2FF1621655
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Sep 2020 05:01:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="tNmb+WDl";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="vErOI+JR"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2FF1621655
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=V+Um0H2JchAR0zyiqcDTN58rQv9F8A5qiMmjfqn/8XE=; b=tNmb+WDlLN0DUJ++9DL2RzGwt
	oya3Q3s/ZaGtGCOw6Ct2uYabcKxyE9c3VuZHBsRTMNqXWP/L3seVjsSoQ0kRXPuYeV1Zp5o0aZAOU
	sv/3xwF+5xkfk8W6A8peSSlQ9a7y7/R2LfJJ8szOoE91OpMaVDT8Jbv5Ome2e8SkNx194fzGM/E09
	rk5objLab62BBIbACA04RCKd+4UZlraMO4De07fFcklijVK88axgDkhecsum+8HY1uRvQ2sOXt3sc
	p7zKf4fM04/kP8FpAPBEIt5SSbZfomiecbRq7MU6nQDLCKF5Ismf09H30V7KBkeEd/HPFzmr1xmgv
	CG2kvdDyA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kHgcD-0005WZ-EF; Mon, 14 Sep 2020 05:01:21 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kHgc8-0005T1-9c
 for linux-mediatek@lists.infradead.org; Mon, 14 Sep 2020 05:01:19 +0000
X-UUID: 2a443c8e62974567b18d816d7558305a-20200913
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=/mYD66patFgq7ha/cJhn7mSkoKmWOdFvvY0fkbfVMfM=; 
 b=vErOI+JRIK7eqRGBe7E4IfHCmiM/hAOa0oDV3CYkqaGX7vFIJRgjCvDUBpxwAYBXFdsWBBuPD8W0eL3UVrhy0AW1vOIAtdd1dKwPuKsdao48JMj18o3BlUq6ySqcG7cGIgaog+huWZhu3zoPCkjk7R3ROMg41JteM2ncHJ+2xyY=;
X-UUID: 2a443c8e62974567b18d816d7558305a-20200913
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <stanley.chu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 2025939613; Sun, 13 Sep 2020 21:01:04 -0800
Received: from MTKMBS02N1.mediatek.inc (172.21.101.77) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 13 Sep 2020 22:01:03 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs02n1.mediatek.inc (172.21.101.77) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 14 Sep 2020 13:00:53 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Mon, 14 Sep 2020 13:00:54 +0800
From: Stanley Chu <stanley.chu@mediatek.com>
To: <linux-scsi@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <robh+dt@kernel.org>, <robh@kernel.org>, <mark.rutland@arm.com>,
 <chunfeng.yun@mediatek.com>, <yingjoe.chen@mediatek.com>, <kishon@ti.com>,
 <martin.petersen@oracle.com>, <avri.altman@wdc.com>,
 <alim.akhtar@samsung.com>, <pedrom.sousa@synopsys.com>
Subject: [PATCH v3 2/2] dt-bindings: ufs-mediatek: Add mt8192-ufshci
 compatible string
Date: Mon, 14 Sep 2020 13:00:52 +0800
Message-ID: <20200914050052.3974-3-stanley.chu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20200914050052.3974-1-stanley.chu@mediatek.com>
References: <20200914050052.3974-1-stanley.chu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200914_010116_574676_B026D27C 
X-CRM114-Status: GOOD (  10.21  )
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
Cc: andy.teng@mediatek.com, cc.chou@mediatek.com, chun-hung.wu@mediatek.com,
 kuohong.wang@mediatek.com, henryc.chen@mediatek.com, jiajie.hao@mediatek.com,
 linux-mediatek@lists.infradead.org, liwei213@huawei.com,
 vivek.gautam@codeaurora.org, arvin.wang@mediatek.com, matthias.bgg@gmail.com,
 Stanley Chu <stanley.chu@mediatek.com>, chaotian.jing@mediatek.com,
 peter.wang@mediatek.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add "mediatek,mt8192-ufshci" compatible string to for MediaTek
UFS host controller present on MT8192 chipsets.

Signed-off-by: Stanley Chu <stanley.chu@mediatek.com>
---
 Documentation/devicetree/bindings/ufs/ufs-mediatek.txt | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/ufs/ufs-mediatek.txt b/Documentation/devicetree/bindings/ufs/ufs-mediatek.txt
index 72aab8547308..63a953b672d2 100644
--- a/Documentation/devicetree/bindings/ufs/ufs-mediatek.txt
+++ b/Documentation/devicetree/bindings/ufs/ufs-mediatek.txt
@@ -9,7 +9,9 @@ contain a phandle reference to UFS M-PHY node.
 Required properties for UFS nodes:
 - compatible         : Compatible list, contains the following controller:
                        "mediatek,mt8183-ufshci" for MediaTek UFS host controller
-                       present on MT81xx chipsets.
+                       present on MT8183 chipsets.
+                       "mediatek,mt8192-ufshci" for MediaTek UFS host controller
+                       present on MT8192 chipsets.
 - reg                : Address and length of the UFS register set.
 - phys               : phandle to m-phy.
 - clocks             : List of phandle and clock specifier pairs.
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
