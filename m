Return-Path: <SRS0=tGyr=OO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8E3CC433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Sep 2021 09:27:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7496C60EFD
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Sep 2021 09:27:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7496C60EFD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=zurJgk0u2fs3V6fEwCTQK/mbIEqQc2dFPId/H6aW3Uk=; b=v4XlcEsrwXqiXi
	PFk2WReKBfPQkGEEqX2sPhIatWimb4RqYVrYvJG5MymCBG2cI/C2G+lG9HAitQCCCHaEm5l+Jyimu
	5PSyZK6SA6/SW9AUFV329ZysdxKOTexqRD3N5AY3lBfgWCWKASFvEisVLeVz/tG0J0EX2fawFpOgY
	yfowUwwa+zf1/28RHu9hwbnIPkyGW6mp8ir/xc8CLsrPVXijbo49Jn030J/No+SJp3lXJ7E1uE+La
	4ItYbL3J3j0Asw7U1rdrewK2ostSFO9/d8g5uVQPYByqlpCqqDt6yTsWM/Z/YctM3svODKNekCGK2
	NPLD7vqyEM/203vb14xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mThUQ-00Dqe1-Se; Fri, 24 Sep 2021 09:27:30 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mThUC-00DqZB-2o; Fri, 24 Sep 2021 09:27:17 +0000
X-UUID: edada33d1a8a4030b9778a909b476f18-20210924
X-UUID: edada33d1a8a4030b9778a909b476f18-20210924
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <kyrie.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 801193823; Fri, 24 Sep 2021 02:27:12 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 24 Sep 2021 02:27:10 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 24 Sep 2021 17:27:08 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 24 Sep 2021 17:27:07 +0800
From: kyrie.wu <kyrie.wu@mediatek.com>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>, Tomasz Figa
 <tfiga@chromium.org>, Matthias Brugger <matthias.bgg@gmail.com>, "Tzung-Bi
 Shih" <tzungbi@chromium.org>
CC: <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <xia.jiang@mediatek.com>,
 <maoguang.meng@mediatek.com>, <srv_heupstream@mediatek.com>,
 <kyrie.wu@mediatek.com>, <irui.wang@mediatek.com>
Subject: [PATCH RESEND,V4,0/5] Support jpeg encoder for MT8195
Date: Fri, 24 Sep 2021 17:27:03 +0800
Message-ID: <1632475628-29271-1-git-send-email-kyrie.wu@mediatek.com>
X-Mailer: git-send-email 2.6.4
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210924_022716_137375_A2BE8C90 
X-CRM114-Status: GOOD (  14.05  )
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

Main changes compared to v4:
--Add cover latter base on v3

Main changes compared to v3:
--Structure patches for consistency, non-backward
  compatible and do not break any existing functionality

Main changes compared to v2:
--Split the last two patches into several patches
  to enhance readability
--Correct some syntax errors
--Explain why the component framework is used

Main changes compared to v1:
--Add jpeg encoder dt-bindings for MT8195
--Use component framework to manage jpegenc HW
--Add jpegenc output pic reorder function interface

MT8195 has two jpeg encoding HW, each one has its own
power-domain, clock, interrupt, register base.
The two jpeg encoding HW can work together to
achieve higher performance.

Generally, one HW needs to register one device node,
and the APP operates the HW through the device node.
If there are multiple HWs, the multiple device node
needs to be registered. At this time, the app needs
to design software logic to use multiple HWs in parallel,
which will undoubtedly increase the difficulty of
app development and weaken its compatibility.

These serial patches use the component framework
to achieve the purpose of using multiple HWs
through only one device node. About the component
framework Block Diagram, please check below:

		Master(device node)
	________|_________________________
	|	               |             |
component0(HW0)	component1(HW1) component2(HW2) ......

As above, the component framework is similar to a
master-component two level architecture.
Both master and component have the compatible
attribute in the device tree, and the corresponding
platform driver structure is defined in the driver.
Therefore, when the compatible attribute matches,
the corresponding probe function will be called.

In the probe function of component, operations
such as initialization clock, remmap register base,
registration interrupt will be performed.
And add the component to a component linked
list to find the corresponding master.

In the probe function of the master, the device
node will be registered, and the master will be
added to a master linked list to find the
corresponding component.

After the master matches the component,
it will obtain the clock, interrupt, register base
and other resources in the component,
and operate the HW through these resources.
At the same time, multiple HWs software function
interfaces are designed in the master driver.

kyrie.wu (5):
  dt-bindings: mediatek: Add mediatek, mt8195-jpgenc compatible
  media: mtk-jpegenc: Use component framework to manage each hardware
  media: mtk-jpegenc: add jpegenc timeout func interface
  media: mtk-jpegenc: add jpeg encode worker interface
  media: mtk-jpegenc: add output pic reorder interface

 .../bindings/media/mediatek-jpeg-encoder.yaml      |   3 +
 drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c    | 395 ++++++++++++++++++---
 drivers/media/platform/mtk-jpeg/mtk_jpeg_core.h    |  79 +++++
 drivers/media/platform/mtk-jpeg/mtk_jpeg_enc_hw.c  | 298 ++++++++++++++++
 4 files changed, 730 insertions(+), 45 deletions(-)

--
2.6.4


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
