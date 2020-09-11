Return-Path: <SRS0=cvih=CU=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD42EC433E2
	for <linux-mediatek@archiver.kernel.org>; Fri, 11 Sep 2020 03:49:44 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5D5692078D
	for <linux-mediatek@archiver.kernel.org>; Fri, 11 Sep 2020 03:49:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="N3OPjkh+";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="Cv+Gcg9q"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5D5692078D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=V+Um0H2JchAR0zyiqcDTN58rQv9F8A5qiMmjfqn/8XE=; b=N3OPjkh+Ub2Dg7H6CSnBQxqeR
	d+e3y7cElGNf7K8YEzGOxoe619NoyPf2OwNG0n78kk9K33wbdzEFjr3v0ABnI0W7H7Pmpk7x4uN94
	oBLjLW3c8if2u1guneD3ygANqVbxaAAESO5+lbzblxNh7fcY1UpmWvh4395zMMY944QPP3I6aofZq
	VsK7+Dq2YV9Q2NugVcOwdxiIC2RGp1XsNqK5WnGIInvSDV02t+IlwX8ymr0drJ6RP9aYSjDFM04K1
	1tQtcDpcKfqgTbyAB6PN5WqnLMo3wJVyJnzoj9CiSm370yM6QkqIixIB0mkvCfuHbJGQB1zoHDEQ7
	DJi0dEN3Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kGa46-00074M-4P; Fri, 11 Sep 2020 03:49:34 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kGa3y-000718-9g; Fri, 11 Sep 2020 03:49:27 +0000
X-UUID: 170cb6ec9e6446bd993f299c88d212fb-20200910
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=/mYD66patFgq7ha/cJhn7mSkoKmWOdFvvY0fkbfVMfM=; 
 b=Cv+Gcg9qMb1hXk4Px7oFdExxlSU0WCl0Oe9MVzsESHOs9A4Hdf4xS7BF/7jOA0473zywGO8F50aSloN7XRJ/9U9W/XFpgIcTxcNoWN9j/P2prhXNDd4DgTYpDrHrQaclbE2+xhW1hbN9gaG6H9483hdLXDbS9b/UJ8iYlwFzoiQ=;
X-UUID: 170cb6ec9e6446bd993f299c88d212fb-20200910
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <stanley.chu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 876741888; Thu, 10 Sep 2020 19:37:48 -0800
Received: from MTKMBS02N2.mediatek.inc (172.21.101.101) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 10 Sep 2020 20:37:47 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs02n2.mediatek.inc (172.21.101.101) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 11 Sep 2020 11:37:37 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Fri, 11 Sep 2020 11:37:37 +0800
From: Stanley Chu <stanley.chu@mediatek.com>
To: <linux-scsi@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <robh+dt@kernel.org>, <robh@kernel.org>, <martin.petersen@oracle.com>,
 <avri.altman@wdc.com>, <alim.akhtar@samsung.com>, <jejb@linux.ibm.com>
Subject: [PATCH v2 2/2] dt-bindings: ufs-mediatek: Add mt8192-ufshci
 compatible string
Date: Fri, 11 Sep 2020 11:37:35 +0800
Message-ID: <20200911033735.21751-3-stanley.chu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20200911033735.21751-1-stanley.chu@mediatek.com>
References: <20200911033735.21751-1-stanley.chu@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: 0BB81318896B0759360427A59F7D86010AAC42047CB7D2214515CB89FB74033A2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200910_234926_465965_3668FE76 
X-CRM114-Status: GOOD (  10.15  )
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
Cc: bvanassche@acm.org, andy.teng@mediatek.com, cc.chou@mediatek.com,
 chun-hung.wu@mediatek.com, kuohong.wang@mediatek.com,
 linux-kernel@vger.kernel.org, HenryC.Chen@mediatek.com,
 linux-mediatek@lists.infradead.org, peter.wang@mediatek.com,
 arvin.wang@mediatek.com, matthias.bgg@gmail.com,
 Stanley Chu <stanley.chu@mediatek.com>, chaotian.jing@mediatek.com,
 linux-arm-kernel@lists.infradead.org
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
