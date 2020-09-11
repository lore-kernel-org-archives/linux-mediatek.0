Return-Path: <SRS0=cvih=CU=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02AC5C433E2
	for <linux-mediatek@archiver.kernel.org>; Fri, 11 Sep 2020 03:50:13 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9345A2078D
	for <linux-mediatek@archiver.kernel.org>; Fri, 11 Sep 2020 03:50:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="K4Ghlc0N";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="ryKp8yaF"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9345A2078D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=V+Um0H2JchAR0zyiqcDTN58rQv9F8A5qiMmjfqn/8XE=; b=K4Ghlc0NGmbkNbRE5DI3ut61x
	jwWtlXZUAqemNYkxPybNjlnJOVJTJrY2ykkdSSM3deUTo9XGfAxAwWyVH1yW945Y11bgni/vVr+vr
	Wvizw7QAB0DAHuOr0yplPAlQb20BO4bQw6k3M8O/D8tjapiUz+I/SW+XQOIpEOu+IpA6X+B/tRO2u
	sTFrlQp8CUay1JNlCK1PAae1v7x7XeL466grM2aEYwThSqil/rfNnewQywOGDtumLqyrPtELGybBr
	l04Lu5onFRCm1SRXD2yb1sZ2B34UtH0VIblVJTn36ZVSt2UqwGne1HPTu+N2adKUuaIu+r2ITTDS3
	jPVQ2Rd9A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kGa4Y-0007HA-6y; Fri, 11 Sep 2020 03:50:02 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kGa4K-00079l-9V; Fri, 11 Sep 2020 03:49:49 +0000
X-UUID: 8d0ed3507a3a413aa13a3d83e10b3afa-20200910
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=/mYD66patFgq7ha/cJhn7mSkoKmWOdFvvY0fkbfVMfM=; 
 b=ryKp8yaFvl3g0EnQNymGWOzRP7zdDlQ1XVkWKje4KUwRobdMf+nzz/3yejOjVQH6H16hel00rcgh+oPAFTwDf64eWf4AnetY5EiXwueZs70fotkuzVkyeZ0eFsKFv9wUP8gO5NKUrAGUrGO2Ro+ot/NK0z+MkfsrOlHVRawgDwA=;
X-UUID: 8d0ed3507a3a413aa13a3d83e10b3afa-20200910
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <stanley.chu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1919593051; Thu, 10 Sep 2020 19:34:59 -0800
Received: from MTKMBS02N1.mediatek.inc (172.21.101.77) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 10 Sep 2020 20:24:58 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs02n1.mediatek.inc (172.21.101.77) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 11 Sep 2020 11:24:50 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Fri, 11 Sep 2020 11:24:50 +0800
From: Stanley Chu <stanley.chu@mediatek.com>
To: <linux-scsi@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <robh+dt@kernel.org>, <robh@kernel.org>, <martin.petersen@oracle.com>,
 <avri.altman@wdc.com>, <alim.akhtar@samsung.com>, <jejb@linux.ibm.com>
Subject: [PATCH 2/2] dt-bindings: ufs-mediatek: Add mt8192-ufshci compatible
 string
Date: Fri, 11 Sep 2020 11:24:49 +0800
Message-ID: <20200911032449.21577-3-stanley.chu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20200911032449.21577-1-stanley.chu@mediatek.com>
References: <20200911032449.21577-1-stanley.chu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200910_234948_524943_9E2DBB6C 
X-CRM114-Status: GOOD (  10.44  )
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
