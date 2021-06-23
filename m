Return-Path: <SRS0=j594=LR=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6793C4743C
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Jun 2021 06:06:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A60E4611AC
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Jun 2021 06:06:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A60E4611AC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ACUpaj4l2uoh77SZdJDTjRgOqvKmEa2itRiALfsSNSo=; b=T+PA0TujWyYNDn
	Sz+3PLSDv0mEDLS2GtYajVc1+Jr5zwM//9Mbg8NnKROiDfcW7KIGh6ZDm1It8RMYSL/KJjsVzkDQ3
	BbUdvffeye4EgR+QO07TzaLWmUKibWyzeg3ycDgRWuzqahYhijpaTZWxtwEdlQpuSFZVZPwVvMCMw
	jzO96ZS8Ds7Ow5IxP5Dx7OajJlVb8Pu56X/uxFedvBr6Vs/nnDfT+5GcSLwiI8xD6bWB5QDyPiMct
	MVLSjQrNrmP09PkKLfjdFIZdGZYtX/7c6pcXlLhYiXbjPZyV2avf4pX2dLhhpzgyKNPnEpJhSVxUf
	dyL59LWr7I1EDVRNcQkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lvw25-009UaK-1N; Wed, 23 Jun 2021 06:06:41 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lvw1y-009UYU-GF; Wed, 23 Jun 2021 06:06:38 +0000
X-UUID: 943ddc4d26ac4dbb81a622d5b0ddaebf-20210622
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=PrpDfDxeZ7TuNjGqU7FwO47dm27LXZvKFdyE+4C9O80=; 
 b=lgCbLeR8DlPtgMc/e5hT3mNPi0r+ugOJytiBz4bBowQTiFDgayqXj/ooHPiH9HmWdL2l/Mlqh8xS0zmJuAajw+DYviA0lyq/KrD84u8gxXWA1bsdWkopWEkNOReVQpolrNdnR18Ot/86/SvI0yi4nBFfPNf4oidkgOCmUYzYYJk=;
X-UUID: 943ddc4d26ac4dbb81a622d5b0ddaebf-20210622
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <kyrie.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1575625808; Tue, 22 Jun 2021 23:06:31 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 22 Jun 2021 23:06:29 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 23 Jun 2021 14:06:28 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 23 Jun 2021 14:06:26 +0800
From: kyrie.wu <kyrie.wu@mediatek.com>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>, Rick Chang
 <rick.chang@mediatek.com>, Bin Liu <bin.liu@mediatek.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, Tzung-Bi Shih <tzungbi@chromium.org>
CC: <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, Tomasz Figa <tfiga@chromium.org>,
 <xia.jiang@mediatek.com>, <maoguang.meng@mediatek.com>,
 <srv_heupstream@mediatek.com>, kyrie.wu <kyrie.wu@mediatek.com>
Subject: [PATCH 1/3] dt-bindings: mtk-jpeg: Add binding for MT8195 JPG
Date: Wed, 23 Jun 2021 14:05:48 +0800
Message-ID: <1624428350-1424-2-git-send-email-kyrie.wu@mediatek.com>
X-Mailer: git-send-email 2.6.4
In-Reply-To: <1624428350-1424-1-git-send-email-kyrie.wu@mediatek.com>
References: <1624428350-1424-1-git-send-email-kyrie.wu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210622_230634_584501_5DFFB6B7 
X-CRM114-Status: GOOD (  10.81  )
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

Updates binding document for mt8195 jpeg driver.

Signed-off-by: kyrie.wu <kyrie.wu@mediatek.com>
---
 Documentation/devicetree/bindings/media/mediatek-jpeg-encoder.txt | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/mediatek-jpeg-encoder.txt b/Documentation/devicetree/bindings/media/mediatek-jpeg-encoder.txt
index 5e53c6a..ba30525 100644
--- a/Documentation/devicetree/bindings/media/mediatek-jpeg-encoder.txt
+++ b/Documentation/devicetree/bindings/media/mediatek-jpeg-encoder.txt
@@ -4,6 +4,9 @@ MediaTek JPEG Encoder is the JPEG encode hardware present in MediaTek SoCs
 
 Required properties:
 - compatible : "mediatek,mt2701-jpgenc"
+- compatible : "mediatek,mt8195-jpgenc"
+- compatible : "mediatek,mt8195-jpgenc0"
+- compatible : "mediatek,mt8195-jpgenc1"
   followed by "mediatek,mtk-jpgenc"
 - reg : physical base address of the JPEG encoder registers and length of
   memory mapped region.
-- 
2.6.4
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
