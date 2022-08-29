Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAEECECAAA2
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 Aug 2022 04:19:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=AByt+oN/3war7U+cJjRxWCJPG/HJ+aYATp1ohXXHplc=; b=qqY7DfVFQHZuG3t8IMWXYvvRrt
	fnltwGFamsA/AcOhxjtY2/rgn0I9hBK4bCrlVZDr5LZrbEmlaVANkeo9UJRVMWutofVU1YvLTsR8p
	6CtW56sJXwOgDSoIhOB9I7SnDshaB29AzHi8Y7sW9lUQXAFYfZvUeCdcyH3YEP0YwD8qOdEkMtLXY
	P8pBAsuhtO48z55FhqO4+Z3R7EWGluq/0AVxBB4f1lC2/pjdnujikoqZb18bCIIX5yr5lz3K/Ep7Y
	o10HCMQdpEVPiQkUnWrpmcyMDEEJKQj1pQ85IhiBL+4SAPSHU6lccyJxBFGP7+sBThJJAnDSmvFFw
	IIHvErZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oSWFG-004Ql8-6A; Mon, 29 Aug 2022 04:19:33 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oSWFC-004QiP-HJ; Mon, 29 Aug 2022 04:19:28 +0000
X-UUID: 0646b339b1954f90a6e5972b3d8a739b-20220828
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=AByt+oN/3war7U+cJjRxWCJPG/HJ+aYATp1ohXXHplc=;
	b=aN4JyeQ8A/uRZ9zOy5c/875tt8bP2kikM/IpLn2UFi44PKEGBAUwP/4GQ/FQOf+8LXFDHY6ckZprZs9+1xaGG7KR6BDfFNMNiHedtqOSVG5za0P7TjP13m+Ugib88HJeUeyUP69iPuXFl+lZiD/pgi68vpQE+ritN6NUtHh5vS8=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.10,REQID:a23770bc-ab1c-4867-a624-d22f0378240e,OB:0,L
	OB:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_
	Ham,ACTION:release,TS:0
X-CID-META: VersionHash:84eae18,CLOUDID:690be2cf-20bd-4e5e-ace8-00692b7ab380,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:1,File:nil
	,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 0646b339b1954f90a6e5972b3d8a739b-20220828
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <xinlei.lee@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 631072664; Sun, 28 Aug 2022 21:19:17 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Mon, 29 Aug 2022 11:48:39 +0800
Received: from mszsdaap41.gcn.mediatek.inc (10.16.6.141) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Mon, 29 Aug 2022 11:48:38 +0800
From: <xinlei.lee@mediatek.com>
To: <thierry.reding@gmail.com>, <u.kleine-koenig@pengutronix.de>,
	<robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
	<matthias.bgg@gmail.com>
CC: <linux-pwm@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, <jitao.shi@mediatek.com>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, xinlei lee
	<xinlei.lee@mediatek.com>
Subject: [PATCH] dt-bindings: pwm: Add compatible for Mediatek MT8188
Date: Mon, 29 Aug 2022 11:48:36 +0800
Message-ID: <1661744916-15441-1-git-send-email-xinlei.lee@mediatek.com>
X-Mailer: git-send-email 2.6.4
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220828_211926_600210_CA299BA3 
X-CRM114-Status: UNSURE (   8.59  )
X-CRM114-Notice: Please train this message.
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: xinlei lee <xinlei.lee@mediatek.com>

Base on the branch of Linux-next/master.
Split from series [1].
[1] https://patchwork.kernel.org/project/linux-mediatek/cover/1661239875-19841-1-git-send-email-xinlei.lee@mediatek.com/

Add dt-binding documentation of pwm for MediaTek MT8188 SoC.

Signed-off-by: xinlei lee <xinlei.lee@mediatek.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/pwm/mediatek,pwm-disp.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/pwm/mediatek,pwm-disp.yaml b/Documentation/devicetree/bindings/pwm/mediatek,pwm-disp.yaml
index 8c4f8bf..0088bc8 100644
--- a/Documentation/devicetree/bindings/pwm/mediatek,pwm-disp.yaml
+++ b/Documentation/devicetree/bindings/pwm/mediatek,pwm-disp.yaml
@@ -27,6 +27,7 @@ properties:
       - items:
           - enum:
               - mediatek,mt8186-disp-pwm
+              - mediatek,mt8188-disp-pwm
               - mediatek,mt8192-disp-pwm
               - mediatek,mt8195-disp-pwm
           - const: mediatek,mt8183-disp-pwm
-- 
2.6.4


