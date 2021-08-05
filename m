Return-Path: <SRS0=uG8S=M4=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7718C4338F
	for <linux-mediatek@archiver.kernel.org>; Thu,  5 Aug 2021 17:14:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7DF5C610FD
	for <linux-mediatek@archiver.kernel.org>; Thu,  5 Aug 2021 17:14:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7DF5C610FD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=F/RX06R4o9UoJ+vo2gzYriY1h//dgWScWEitX1PZBQM=; b=Rj6PWgrdEg1nB7
	yO1c6oHnSIUvke5gGettsXRwpuM2vqEhGEJ38yOMG07Cvvldlzr/TrW/SE494UZWzmVFx/4eFaNwZ
	gD9cN6m3T2ql8xg5NQkxRe7+mRO0I8WjHvRJB6bfByzAioq9/LAiGLD/yEYZC4FtpuzkCGk6yNpE5
	Sm7nh/uZfILowvkYN3NoXOyFWBDPH6//eKKDAHIRwgkGU4QYkxBsY3nsCdGkyhzklCD4XHOR1ReA2
	b4YX7pk5IMSU+Zd02Cm0+ACC/OyWtEXj5bHuH1k5SYgHeLQ/yZ+AT2nZUiN1BoOdRSqWwZrgrufWe
	O/2RP20K70qRa5695hAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mBgwy-00ANHQ-B9; Thu, 05 Aug 2021 17:14:32 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mBgwS-00AN5O-5g; Thu, 05 Aug 2021 17:14:02 +0000
X-UUID: 37ef9a6c0d7c471991627433135f9e40-20210805
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=HAeyOOhIhYLpSCTLHQiyLbkvnxImhM47HPS7kwTC5iU=; 
 b=a0rt+b18EbkpN9wXvoIhFkDNHz2NMvubByWSSPFvaQ6ZTl9WlfxB7RQ8ZO45Hw3iNH+OUn4nvm9CvErkN8zVTuMmiq7NuA8pAmfIsiHQbaGgry2lNZ7LnYIcqnCo+dycrsh95zXeon2suYoz+hR/ZsW3RMvArQwngnvS8j4S8i4=;
X-UUID: 37ef9a6c0d7c471991627433135f9e40-20210805
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <jason-jh.lin@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1074513693; Thu, 05 Aug 2021 10:13:53 -0700
Received: from mtkmbs05n1.mediatek.inc (172.21.101.15) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 5 Aug 2021 10:13:52 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs05n1.mediatek.inc (172.21.101.15) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 6 Aug 2021 01:13:50 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Fri, 6 Aug 2021 01:13:50 +0800
From: jason-jh.lin <jason-jh.lin@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, "Philipp
 Zabel" <p.zabel@pengutronix.de>, Enric Balletbo i Serra
 <enric.balletbo@collabora.com>, <fshao@chromium.org>
CC: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, "Fabien
 Parent" <fparent@baylibre.com>, <hsinyi@chromium.org>, "jason-jh . lin"
 <jason-jh.lin@mediatek.com>, Yongqiang Niu <yongqiang.niu@mediatek.com>,
 <nancy.lin@mediatek.com>, <singo.chang@mediatek.com>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>
Subject: [PATCH v3 0/4] add mt8195 SoC DRM binding
Date: Fri, 6 Aug 2021 01:13:42 +0800
Message-ID: <20210805171346.24249-1-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210805_101400_289522_FFC74579 
X-CRM114-Status: UNSURE (   9.76  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Change in v3:
- slpit each display function block to individual taml file.

Change in v2:
- add power-domain property into mediatek,mmsys.yaml
  and modify commit message.

jason-jh.lin (4):
  dt-bindings: arm: mediatek: mmsys: add mt8195 SoC binding
  dt-bindings: mediatek: display: split each block to individual yaml
  dt-bindings: mediatek: add mediatek,dsc.yaml for mt8195 SoC binding
  dt-bindings: mediatek: display: add mt8195 SoC binding

 .../bindings/arm/mediatek/mediatek,mmsys.yaml |   8 +
 .../display/mediatek/mediatek,aal.yaml        |  76 ++++++
 .../display/mediatek/mediatek,ccorr.yaml      |  74 ++++++
 .../display/mediatek/mediatek,color.yaml      |  85 +++++++
 .../display/mediatek/mediatek,disp.txt        | 219 ------------------
 .../display/mediatek/mediatek,dither.yaml     |  75 ++++++
 .../display/mediatek/mediatek,dsc.yaml        |  69 ++++++
 .../display/mediatek/mediatek,gamma.yaml      |  76 ++++++
 .../display/mediatek/mediatek,merge.yaml      |  97 ++++++++
 .../display/mediatek/mediatek,mutex.yaml      |  79 +++++++
 .../display/mediatek/mediatek,od.yaml         |  52 +++++
 .../display/mediatek/mediatek,ovl-2l.yaml     |  86 +++++++
 .../display/mediatek/mediatek,ovl.yaml        | 101 ++++++++
 .../display/mediatek/mediatek,rdma.yaml       | 112 +++++++++
 .../display/mediatek/mediatek,split.yaml      |  56 +++++
 .../display/mediatek/mediatek,ufoe.yaml       |  59 +++++
 .../display/mediatek/mediatek,wdma.yaml       |  86 +++++++
 17 files changed, 1191 insertions(+), 219 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,aal.yaml
 create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr.yaml
 create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,color.yaml
 delete mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,disp.txt
 create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,dither.yaml
 create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,dsc.yaml
 create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,gamma.yaml
 create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,merge.yaml
 create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,mutex.yaml
 create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,od.yaml
 create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,ovl-2l.yaml
 create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,ovl.yaml
 create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,rdma.yaml
 create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,split.yaml
 create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,ufoe.yaml
 create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,wdma.yaml

-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
