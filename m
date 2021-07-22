Return-Path: <SRS0=Khw4=MO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F864C6377D
	for <linux-mediatek@archiver.kernel.org>; Thu, 22 Jul 2021 09:53:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4DB1B60725
	for <linux-mediatek@archiver.kernel.org>; Thu, 22 Jul 2021 09:53:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4DB1B60725
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FSUc5XMLgomvolb+0QbZSqolaNVRduE2CTTIHQMqCFM=; b=eDU7Iu1N0zECBg
	UhREuMvOTWKoAVcOMXuHkfq1hmBcCZ4f5+wrAPqcst/Pr5ltfgYAjAT2TbVHSlYSVewWWxKmbTr7Z
	DTpam/8fcxwKhGpqM5mdUkn/ErfqfsCdiSRz93OSC0eue1CGin/uUxf78ld89Ty+ITNkczyKpgRzo
	hBqofT6WnKJQ5IfpNJ/VisrUtJEJ7/wiXKzJW8ZPCwVrhmXQfUO4hzfqSSsggl/gMTfA/Ggm5gE3j
	nm3RdF4EZgzeQo9Y4/6/s6hM7LwYL2Q5SmuNb1V5cDwW1er6DCQN2Fm+gRKMhmRhZOXWbYJUcvQiQ
	dmLAyRKYktLRpI7MRtcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m6VOG-0011Wx-3E; Thu, 22 Jul 2021 09:53:16 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m6VN4-0011Ae-PE; Thu, 22 Jul 2021 09:52:04 +0000
X-UUID: 7bf6ce60f9234fb2906ef58d3fee5f65-20210722
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=jvB/RJBRogQZYu/JpnieHiRXn8cOBVQPcJRvZzF0Oqw=; 
 b=UympudQuvp38NEpmi19Y77e5Gxs8CHyDlBe/gIbHULWIXnAT6dAMnqt+QeZJQVQEWYOkDGsEeTlUcMyq53R6p+0L2McDYgz9LzFpkMfoc6X2PTcDS1QAwVNccwt8/Oz15yN5N9DzEFqFJhfDToIw6rvtRYGaBdnbkAFSNV3Wxoo=;
X-UUID: 7bf6ce60f9234fb2906ef58d3fee5f65-20210722
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <nancy.lin@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 546289458; Thu, 22 Jul 2021 02:51:58 -0700
Received: from mtkmbs05n1.mediatek.inc (172.21.101.15) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 22 Jul 2021 02:45:54 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs05n1.mediatek.inc (172.21.101.15) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 22 Jul 2021 17:45:53 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 22 Jul 2021 17:45:53 +0800
From: Nancy.Lin <nancy.lin@mediatek.com>
To: CK Hu <ck.hu@mediatek.com>
CC: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel
 <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>, Daniel Vetter
 <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, "jason-jh . lin" <jason-jh.lin@mediatek.com>,
 "Nancy . Lin" <nancy.lin@mediatek.com>, Yongqiang Niu
 <yongqiang.niu@mediatek.com>, <dri-devel@lists.freedesktop.org>,
 <linux-mediatek@lists.infradead.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <singo.chang@mediatek.com>, <srv_heupstream@mediatek.com>
Subject: [PATCH v2 03/14] dt-bindings: mediatek: Add #reset-cells to mmsys
 system controller
Date: Thu, 22 Jul 2021 17:45:40 +0800
Message-ID: <20210722094551.15255-4-nancy.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210722094551.15255-1-nancy.lin@mediatek.com>
References: <20210722094551.15255-1-nancy.lin@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210722_025202_874125_874B7DE6 
X-CRM114-Status: GOOD (  10.89  )
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

The mmsys system controller exposes a set of memory client resets and
needs to specify the #reset-cells property in order to advertise the
number of cells needed to describe each of the resets.

Signed-off-by: Nancy.Lin <nancy.lin@mediatek.com>
---
 .../devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml       | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml
index e6cd6e2173d4..480194c20adf 100644
--- a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml
@@ -87,6 +87,9 @@ properties:
       The available clocks are defined in dt-bindings/clock/mt*-clk.h
     const: 1
 
+  "#reset-cells":
+    const: 1
+
   mboxes:
     description: |
       Client use mailbox to communicate with GCE, it should have this
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
