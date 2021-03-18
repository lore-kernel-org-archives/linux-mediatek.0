Return-Path: <SRS0=MDpP=IQ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F2F3C433E0
	for <linux-mediatek@archiver.kernel.org>; Thu, 18 Mar 2021 06:19:56 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C5E8964F21
	for <linux-mediatek@archiver.kernel.org>; Thu, 18 Mar 2021 06:19:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C5E8964F21
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=2AjcCNKkfEpQE0pBgNTVHf3si7SVuZpUtaQL3sw1VVI=; b=D5cK2FOc7+2XRgicRGu0XTMVgm
	FQDTcLedgEk2gaApq6gXAj6CWA5g7Z07ix4rijbtOxkvyG6O9GlKu2iJjUBjxbfYkG0i63nMqyPe2
	KT+GGu3z0TmoYNsW0o0M8gQmGxkcS0Wl/hZPBQURKr5PZhd5bf8AmooQoTs6/7ofH4EGwtb5eq5kZ
	GhZYVfj4zmVV28nx+k2xKuH8WF9UGH6jPsQ+Ma5Jndw3GDFQIKPjr8CbNtlvkg+0o8u8xPX5+ga1j
	pQ6ElzTNupUq+NxQOs24enXm6rz2cVKJqoDCdwqztSLJZAgCeb845GntQtK7P3Vb+pM9fqJwkd64S
	9lvYBk6g==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lMm0S-004bnA-M9; Thu, 18 Mar 2021 06:19:40 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lMm09-004bkT-9m; Thu, 18 Mar 2021 06:19:25 +0000
X-UUID: 5b51f0c5d4364f129dc477051f6a3f88-20210317
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=Ngw285nTKpOrmYN+d5KYFEYUslUIqaijUWg8SRGp9JY=; 
 b=OonhHu1h4eRZoN5XQWpezWp4quE59dtc91Z+77Y0YXzi/LTcu138dnPDGLQXjlR9jSViwvjnDA/uFoeLb3d4H/13ccq06NHpiWJrZGlUHzRQyTziJTpBo/NsIiGbr2pq9o4Sd5GTVOYC046OcJukKqCcETfDjAHWKGSKjQGwu9s=;
X-UUID: 5b51f0c5d4364f129dc477051f6a3f88-20210317
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1681757484; Wed, 17 Mar 2021 22:19:13 -0800
Received: from MTKMBS31N2.mediatek.inc (172.27.4.87) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 17 Mar 2021 23:19:11 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 MTKMBS31N2.mediatek.inc (172.27.4.87) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 18 Mar 2021 14:18:58 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 18 Mar 2021 14:18:51 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>
CC: Rob Herring <robh+dt@kernel.org>, Enric Balletbo i Serra
 <enric.balletbo@collabora.com>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>, Chunfeng Yun <chunfeng.yun@mediatek.com>
Subject: [PATCH] arm64: dts: mt8173: fix wrong power-domain phandle of pmic
Date: Thu, 18 Mar 2021 14:18:48 +0800
Message-ID: <1616048328-13579-1-git-send-email-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
MIME-Version: 1.0
X-TM-SNTS-SMTP: F2BE2CBD59CDC856F07AE2C53347C25DA22A5D4F36026F2DFCA46911E8268ACA2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210318_061921_922250_99A59C25 
X-CRM114-Status: GOOD (  12.06  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Due to power domain controller is added, the power domain's
phanle is also changed from 'scpsys' to 'spm', but forget to
modify pmic node's

Fixes: 8b6562644df9 ("arm64: dts: mediatek: Add mt8173 power domain controller")
Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
 arch/arm64/boot/dts/mediatek/mt8173-evb.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8173-evb.dts b/arch/arm64/boot/dts/mediatek/mt8173-evb.dts
index 6dffada2e66b..28aa634c9780 100644
--- a/arch/arm64/boot/dts/mediatek/mt8173-evb.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8173-evb.dts
@@ -294,7 +294,7 @@
 
 &pwrap {
 	/* Only MT8173 E1 needs USB power domain */
-	power-domains = <&scpsys MT8173_POWER_DOMAIN_USB>;
+	power-domains = <&spm MT8173_POWER_DOMAIN_USB>;
 
 	pmic: mt6397 {
 		compatible = "mediatek,mt6397";
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
