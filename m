Return-Path: <SRS0=Knfd=4Q=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C157C3F2CF
	for <linux-mediatek@archiver.kernel.org>; Fri, 28 Feb 2020 08:15:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1FEBB246A3
	for <linux-mediatek@archiver.kernel.org>; Fri, 28 Feb 2020 08:15:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="sKHJJLiR";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="b+FFx+LQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1FEBB246A3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=H0VS7xz9sqn7KcZoeju9CIBB6gBhalqK1xqiaQuaGGY=; b=sKHJJLiR7ZG0g3
	2YdN/Ak6/BaO9dZmV/e0QZkb3VRmno21xnV4kcVhelGbAlofRLSbfw6F+qo+wFkR4Z4iQmtcFf8QQ
	VVEW/q4pyhLdTrBECetfvkNooMO93eZYA06RR7zuxdO5mHsHEDojL4P2PMruiAYvrIole96UhUitY
	DBFdzbeKM3OPcZ24P2UDfNfIvRzDFxuBKthKUJxVaKuK8CYjJYOtZwlwIUIs9wh04Jlb8BeRhqKAN
	jOcuW37+PsxQjRNP95AB5/4FvVzko42bPSWv0vwDQQYsieMiASSnnhjKmn+H+Jo6WigVirJekzCTe
	zdrZk0HyxWPoCIluYuNg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j7ank-000449-UD; Fri, 28 Feb 2020 08:15:16 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j7ani-00043d-6r; Fri, 28 Feb 2020 08:15:15 +0000
X-UUID: ebddc7550f1b41b1ae5fb2889b4da2b2-20200228
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=HJb7/ljUwWmTqEm0PtuCt0NNxaTQhjqapiKPaumq4IQ=; 
 b=b+FFx+LQHRXmEocD7j6j4I5o3OiViKZWmbVsJY9el57SfPWLuadhS+LqiRoCMUdFXRPDskHllwJhEt1nU6mfeEp0Ut9S7TQ7rMmzMzqAbiC63k3Q0CYPosn2cBpFgFEjzIE9FmIfoo34F7Iff3yEmuIQuEPxZxkvViiH4EROlSg=;
X-UUID: ebddc7550f1b41b1ae5fb2889b4da2b2-20200228
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <jitao.shi@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 2115350977; Fri, 28 Feb 2020 00:15:09 -0800
Received: from MTKMBS33N1.mediatek.inc (172.27.4.75) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Fri, 28 Feb 2020 00:15:50 -0800
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by MTKMBS33N1.mediatek.inc
 (172.27.4.75) with Microsoft SMTP Server (TLS) id 15.0.1395.4;
 Fri, 28 Feb 2020 16:13:43 +0800
Received: from mszsdclx1018.gcn.mediatek.inc (10.16.6.18) by
 MTKCAS32.mediatek.inc (172.27.4.170) with Microsoft SMTP Server id
 15.0.1395.4 via Frontend Transport; Fri, 28 Feb 2020 16:15:15 +0800
From: Jitao Shi <jitao.shi@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@linux.ie>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH v11 0/6] mt8183 dpi supports dual edge and pin mode swap
Date: Fri, 28 Feb 2020 16:14:35 +0800
Message-ID: <20200228081441.88179-1-jitao.shi@mediatek.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-TM-SNTS-SMTP: 61F0E04492248071CB26136A797564F618AC50112BA468E9070C92A6B70DEFD72000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200228_001514_265185_3DE7EED7 
X-CRM114-Status: UNSURE (   8.20  )
X-CRM114-Notice: Please train this message.
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
Cc: devicetree@vger.kernel.org, Jitao Shi <jitao.shi@mediatek.com>,
 srv_heupstream@mediatek.com, huijuan.xie@mediatek.com, stonea168@163.com,
 cawa.cheng@mediatek.com, linux-mediatek@lists.infradead.org,
 bibby.hsieh@mediatek.com, ck.hu@mediatek.com, yingjoe.chen@mediatek.com,
 eddie.huang@mediatek.com, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Change since v10:
 - convert the Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.txt
   to yaml format.
 - read the pclk-sample in endpoint.

Changes since v9:
 - rename pinctrl-names = "gpiomode", "dpimode" to "active", "idle".
 - fix some typo.

Changes since v8:
 - drop pclk-sample redefine in mediatek,dpi.txt
 - only get the gpiomode and dpimode when dpi->pinctrl is successful.

Changes since v7:
 - separate dt-bindings to independent patches.
 - move dpi dual edge to one patch.

Changes since v6:
 - change dual_edge to pclk-sample
 - remove dpi_pin_mode_swap and

Changes since v5:
 - fine tune the dt-bindings commit message.

Changes since v4:
 - move pin mode control and dual edge control to deveice tree.
 - update dt-bindings document for pin mode swap and dual edge control.

Changes since v3:
 - add dpi pin mode control when dpi on or off.
 - update dpi dual edge comment.

Changes since v2:
 - update dt-bindings document for mt8183 dpi.
 - separate dual edge modfication as independent patch.

Jitao Shi (6):
  dt-bindings: media: add pclk-sample dual edge property
  dt-bindings: display: mediatek: control dpi pins mode to avoid leakage
  dt-bindings: display: mediatek: dpi sample data in dual edge support
  dt-bindings: display: mediatek: convert the document format from txt
    to yaml
  drm/mediatek: dpi sample mode support
  drm/mediatek: set dpi pin mode to gpio low to avoid leakage current

 .../display/mediatek/mediatek,dpi.txt         |  36 -------
 .../display/mediatek/mediatek,dpi.yaml        | 100 ++++++++++++++++++
 .../bindings/media/video-interfaces.txt       |   4 +-
 drivers/gpu/drm/mediatek/mtk_dpi.c            |  58 +++++++++-
 4 files changed, 158 insertions(+), 40 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.txt
 create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml

-- 
2.21.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
