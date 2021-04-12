Return-Path: <SRS0=8MWw=JJ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6E86C433B4
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Apr 2021 12:52:22 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7FA7761261
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Apr 2021 12:52:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7FA7761261
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=rqVcBgGL++UlP1lK/QgXC3zTBYyDVfhnpLbWBfwFDLY=; b=I0bIA8TZFGleBAOmJZlFf47Qm
	Pr5Qy3m9QHTWaSss1QDVKSXhC8KelhFH+/c1rGTjc6+7UYeFbd1+yjd0Fy5KhslC7Ym886frr8wLg
	/Gixyspzlg3fAJMSSsq+AcQCmcTvD2IIQ2ydTTABogF1fil+hwtdm5GdgHixXotdCPqlDWXQam4Ze
	2ItK6FL4yqTNnUaGLcrn4LJJ98Qju7mkOYxFEoJKDOv5/B62paEAKAYqtQOQtK1tKfCltaojKvl7q
	V3yWM10sTUh6BwmtEB91a+rqehO8UEWDkwj12K1SypKOdDDwShsaUKIchBJuuf3R44n3rrPQ1BWkX
	lZ903pCow==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lVw31-006l0Q-Vr; Mon, 12 Apr 2021 12:52:12 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lVw2v-006kyq-Fl; Mon, 12 Apr 2021 12:52:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
 To:From:Sender:Reply-To:Content-ID:Content-Description;
 bh=YErKguPWkwlLTdBHCTZ7ag8buCoj/iPP6f2aGd9bYbA=; b=bCXzso1Crw4VrtzJsVWi5/7rf0
 caKTHjjlnnW1Ne986WiJACiUSDVP+jZFMdHxQAy4CG8CC2YS/G4s++vsEQZSRFwye3Z0ZtVKWFhAA
 RiXa4ldySzLEAtexQSa1mwaXmipWNfzOAy1cNAjBDcnFIx5g41zGfwgmkgolQ2a1nc1w0WffhsghC
 t/YnJj6qMmU2YLyBiX8QnvYp4zfWiZtDVgFzByuDmJEwObZEtVdZJS0NrMNkeo3IF2ShfYHI1MBAL
 56oEvvi/dJlwchrjym3eUWU0M+qUK1ymK9gl6+6DzygN4vqdMq7yQ1SmHcq+fo1mMoeo8Adjy0mFh
 NO9CH9Pw==;
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lVw2t-006ElJ-29; Mon, 12 Apr 2021 12:52:04 +0000
X-UUID: 0619a668fa1845a1802d5fc950fd8471-20210412
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=YErKguPWkwlLTdBHCTZ7ag8buCoj/iPP6f2aGd9bYbA=; 
 b=t2F4HddO7dbvePFyQqWfYe4hEAQqspOV63A2zDlkFPxjNKQMrGVaBUuQFCi8IBRugSxBR7Ot9cSbZ5EcFjezMCZyt4Q4uqHrszOGO29FOrrjnEmMorjFe16khyOd+se/WSvYnF7X+0zM0ZwNHzWW9BIJZzscWhP/zhisEy7teIM=;
X-UUID: 0619a668fa1845a1802d5fc950fd8471-20210412
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <irui.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1647884264; Mon, 12 Apr 2021 05:51:56 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 12 Apr 2021 05:46:15 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 12 Apr 2021 20:46:14 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 12 Apr 2021 20:46:13 +0800
From: Irui Wang <irui.wang@mediatek.com>
To: Alexandre Courbot <acourbot@chromium.org>, Hans Verkuil
 <hverkuil-cisco@xs4all.nl>, Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>
CC: Tiffany Lin <tiffany.lin@mediatek.com>, Fritz Koenig
 <frkoenig@chromium.org>, Tzung-Bi Shih <tzungbi@chromium.org>, Maoguang Meng
 <maoguang.meng@mediatek.com>, Longfei Wang <longfei.wang@mediatek.com>,
 Yunfei Dong <yunfei.dong@mediatek.com>, Irui Wang <irui.wang@mediatek.com>,
 <yong.wu@mediatek.com>, <linux-media@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <srv_heupstream@mediatek.com>,
 <linux-mediatek@lists.infradead.org>
Subject: [PATCH v3,
 4/6] dt-bindings: media: mtk-vcodec: Add binding for MT8192 VENC
Date: Mon, 12 Apr 2021 20:45:53 +0800
Message-ID: <20210412124555.26897-5-irui.wang@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210412124555.26897-1-irui.wang@mediatek.com>
References: <20210412124555.26897-1-irui.wang@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210412_055203_139835_27FC56ED 
X-CRM114-Status: GOOD (  11.19  )
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

Updates binding document for mt8192 encoder driver.

Acked-by: Rob Herring <robh@kernel.org>
Signed-off-by: Irui Wang <irui.wang@mediatek.com>
---
 Documentation/devicetree/bindings/media/mediatek-vcodec.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/media/mediatek-vcodec.txt b/Documentation/devicetree/bindings/media/mediatek-vcodec.txt
index b7801e3c354a..4171f8761322 100644
--- a/Documentation/devicetree/bindings/media/mediatek-vcodec.txt
+++ b/Documentation/devicetree/bindings/media/mediatek-vcodec.txt
@@ -9,6 +9,7 @@ Required properties:
   "mediatek,mt8173-vcodec-enc" for mt8173 avc encoder.
   "mediatek,mt8183-vcodec-enc" for MT8183 encoder.
   "mediatek,mt8173-vcodec-dec" for MT8173 decoder.
+  "mediatek,mt8192-vcodec-enc" for MT8192 encoder.
 - reg : Physical base address of the video codec registers and length of
   memory mapped region.
 - interrupts : interrupt number to the cpu.
-- 
2.25.1
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
