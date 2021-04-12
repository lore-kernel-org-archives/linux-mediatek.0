Return-Path: <SRS0=8MWw=JJ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BE98C433ED
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Apr 2021 06:37:04 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ABCA16008E
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Apr 2021 06:37:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ABCA16008E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=j6wcnqK9J6t2nxc9qEWndI7lAAinQ/7WX3bge5g1D6I=; b=B6HJXjgJXZWnCYXLxVWFP4XA+
	xJbKUEBptDDhK53t8zwC8tMc4GDGmN+w6EsWR+eKsg8rL4xKud6ZpzYD56WLRNf4/8qpyi7tGVMZi
	DsPH5LfS1DxC7i0rzyvmla4iHeGtWJ98uQ2hcq2o77y8l070/s1eKAejg50Xyxw27FIL3CJi0LjF3
	AyydN4/vxe07HNWeL3GK6qc+rdsOtkWKB5Jg/uvgm62EuMJC2VYRVGId6DgFo1cQ+fxeSM6XSGYQa
	LSEO6/PemuhZ7OaezRXfIAz3GZe4Cf2fZXbgCTuQ8NmHOUNn9FtOOsSl/BlxjO2+3zAH5Zy97fTY+
	BY+Wf5zDA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lVqBn-005pF5-Gw; Mon, 12 Apr 2021 06:36:51 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lVqBA-005pAE-Dd; Mon, 12 Apr 2021 06:36:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
 To:From:Sender:Reply-To:Content-ID:Content-Description;
 bh=OcIUh0IDpElgVgcyZTw8UGHFPNZb91BPFhSWFpPuBNo=; b=TskkqJuZ4DYMAAP4zO/D7/IRFX
 SqYyXmO2UJtUSmd4rfDI8s6hk7v1XkKQanF/Oh7/0j2ZLMqjP0uvYKI/QfBrzY7lqOs3MnSNDiWNh
 NeKD3Ue0g07xT6ge859KlXmqjxzvtuOjHcdF3Nti5LH14eN0QS6j6iTXi6PN+UeJ/qXs2QPeKBrzu
 /8XpcL4AQufoIsHeaIqsgNzLuQrZDyWWWrdGeNFDU6UTQ7GB7LXwzEL6USepDYfBBFwKDUliO3WeD
 7d/subG9WEHMzIUa0qJ4bX7QIrCu+G01ExxE1pkwK8gsiUprfQmWZ12JT/NGVVubJWaNt+5OdyF4J
 0V8SppGQ==;
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lVqB8-005u8d-1V; Mon, 12 Apr 2021 06:36:11 +0000
X-UUID: ed33be85f5e64571b9688a3ad77f55d9-20210411
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=OcIUh0IDpElgVgcyZTw8UGHFPNZb91BPFhSWFpPuBNo=; 
 b=BlxjdTs56FI86bd12MoPEft3J2jABfVkYiRA7yT0YH9dQGXkbXYLRuvm7Dp+/AdmBG7C79tQhxhO4zpZMHpWzRZI7VFEArKwcuWLFWADpQEGqmAlBEq6qktMzLeGUutBllXpqO9j+rsOghR+E4CZAyu2gB1BuQBdu1QiECiRqX8=;
X-UUID: ed33be85f5e64571b9688a3ad77f55d9-20210411
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <yongqiang.niu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 549587925; Sun, 11 Apr 2021 23:36:07 -0700
Received: from MTKMBS31N2.mediatek.inc (172.27.4.87) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 11 Apr 2021 23:36:06 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 MTKMBS31N2.mediatek.inc (172.27.4.87) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 12 Apr 2021 14:35:59 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 12 Apr 2021 14:35:59 +0800
From: Yongqiang Niu <yongqiang.niu@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Rob Herring <robh+dt@kernel.org>
CC: Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Mark Rutland <mark.rutland@arm.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, <dri-devel@lists.freedesktop.org>, 
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, Yongqiang Niu
 <yongqiang.niu@mediatek.com>
Subject: [PATCH v1, 2/3] arm64: dts: mt8183: refine aal compatible name
Date: Mon, 12 Apr 2021 14:35:46 +0800
Message-ID: <1618209347-10816-3-git-send-email-yongqiang.niu@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1618209347-10816-1-git-send-email-yongqiang.niu@mediatek.com>
References: <1618209347-10816-1-git-send-email-yongqiang.niu@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: EB024F227CF6011B49D821BFD4B18118BCF097E9CABD92811AB697E72BB8CF6F2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210411_233610_105636_EA0860C9 
X-CRM114-Status: GOOD (  10.04  )
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

mt8183 aal is different with mt8173
remove mt8173 compatible name for mt8183 aal

Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
---
 arch/arm64/boot/dts/mediatek/mt8183.dtsi | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8183.dtsi b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
index 80519a1..ee8f87f 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
@@ -1061,8 +1061,7 @@
 		};
 
 		aal0: aal@14010000 {
-			compatible = "mediatek,mt8183-disp-aal",
-				     "mediatek,mt8173-disp-aal";
+			compatible = "mediatek,mt8183-disp-aal";
 			reg = <0 0x14010000 0 0x1000>;
 			interrupts = <GIC_SPI 233 IRQ_TYPE_LEVEL_LOW>;
 			power-domains = <&spm MT8183_POWER_DOMAIN_DISP>;
-- 
1.8.1.1.dirty
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
