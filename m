Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31605C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 19 Apr 2022 03:32:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=MIUhMBgnqmKLV2obb0PkhlOu3MrwP2cAqn1LQAw+ffM=; b=kCjiNILIdQ+SoT
	0huawmtG1oHvLQ2AWlpzFxYkS4YXv7g+vg7QS5wNLadzoNv8oISve1uISFN2KpiztHwdbSecSUy2l
	H1MV/wiaroCr7Dyj14ljxhlSJMiVXv+chhQbujMELRTNgQC1fZGJB0PmccNHXRC2M3Lm5QqLA4Ndj
	RDk9Bb99vJYRBGv4RZq+ls60dt1/bmjZqAdkZee21L1pvzjZgVzH1VHvcMipFfbFpkAyWj/+k4UO9
	Z53nY3+FJ8UKDvHZPVXwW7hMQTGUZZIPwJGLTW1VHhF2/g1jnc146yBb3VM0/VXqc+BPNZI2kifK5
	rBfb5VaMg/XUW97pldGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ngebh-001I4o-5v; Tue, 19 Apr 2022 03:32:49 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ngebe-001I2v-HU; Tue, 19 Apr 2022 03:32:47 +0000
X-UUID: aee65f78e55e41d8886e0e64b50c06e8-20220418
X-UUID: aee65f78e55e41d8886e0e64b50c06e8-20220418
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <rex-bc.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 811307132; Mon, 18 Apr 2022 20:32:42 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 18 Apr 2022 20:32:40 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 19 Apr 2022 11:32:39 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Tue, 19 Apr 2022 11:32:39 +0800
From: Rex-BC Chen <rex-bc.chen@mediatek.com>
To: <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
 <chunkuang.hu@kernel.org>, <p.zabel@pengutronix.de>
CC: <airlied@linux.ie>, <matthias.bgg@gmail.com>,
 <angelogioacchino.delregno@collabora.com>, <jason-jh.lin@mediatek.com>,
 <nancy.lin@mediatek.com>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <linux-mediatek@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>, 
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, Rex-BC Chen
 <rex-bc.chen@mediatek.com>
Subject: [PATCH 0/5] MediaTek MT8195 display binding
Date: Tue, 19 Apr 2022 11:32:32 +0800
Message-ID: <20220419033237.23405-1-rex-bc.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220418_203246_634029_A7D9A399 
X-CRM114-Status: UNSURE (   9.94  )
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

Add this series to present MediaTek display binding for MT8195.
The reason I send this series is Jason and Nancy's binding patches are
never received by devicetree mail server.
Therefore, I help them to resend binding patches.

All of these patches are reviewed in other series:
[1]: message id: 20220415083911.5186-1-jason-jh.lin@mediatek.com
[2]: message id: 20220416020749.29010-1-nancy.lin@mediatek.com

This series depends on Yong's MT8195 IOMMU series:
[3]: message id: 20220407075726.17771-2-yong.wu@mediatek.com
Without this patch, some patches of this series will build failed.

Nancy.Lin (3):
  dt-bindings: mediatek: add vdosys1 RDMA definition for mt8195
  dt-bindings: reset: mt8195: add vdosys1 reset control bit
  dt-bindings: mediatek: add ethdr definition for mt8195

jason-jh.lin (2):
  dt-bindings: arm: mediatek: mmsys: add power and gce properties
  dt-bindings: arm: mediatek: mmsys: add mt8195 SoC binding

 .../bindings/arm/mediatek/mediatek,mmsys.yaml |  32 ++++
 .../display/mediatek/mediatek,ethdr.yaml      | 158 ++++++++++++++++++
 .../display/mediatek/mediatek,mdp-rdma.yaml   |  86 ++++++++++
 include/dt-bindings/reset/mt8195-resets.h     |  12 ++
 4 files changed, 288 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,ethdr.yaml
 create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,mdp-rdma.yaml

-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
