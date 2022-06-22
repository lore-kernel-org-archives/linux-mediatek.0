Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34663C43334
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Jun 2022 06:30:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hnooZbMiEAv6t9ch+FHmlaltP2CwHd+d911XUgUaNcM=; b=ZiBYo3RdRmoG3SMuyWWWjxjBbC
	KCx/ckz5/7T2HDE+/FX0i2iPKtWMDRrDBBoDKELrH2n9O4OXWlso4lyexlac5L2Kp7UPqlFyZmYAG
	5W9Co1y2c4bPbaGBn7ikIGyUd0l48AK8SMECxPm2WFlxgVBl6iBy6FNjMAbiMN4KQNOW+nUUk8NqV
	2jugCiMItmlaTDM59bNwivlWy6nu/R4B83+CFKKh5SK70HyqcKd2S+5w2H++1mWCe+/n1QmYe/5dP
	WlAVivSAI2ntqGLNtb6bX2fMVzINCh6qgI7eqan3raogWEHzbs093n3a7nRJb+BufMop7sqdffawN
	gHWlqZHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o3tse-008oEj-VV; Wed, 22 Jun 2022 06:30:25 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o3tlR-008ltY-Op; Wed, 22 Jun 2022 06:23:00 +0000
X-UUID: d9f83084fcef4baab081822ac79c86e9-20220621
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.6,REQID:3624ca55-ea8e-4fc3-9da9-43773f51fac1,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:0
X-CID-META: VersionHash:b14ad71,CLOUDID:45d22438-5e4b-44d7-80b2-bb618cb09d29,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: d9f83084fcef4baab081822ac79c86e9-20220621
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
	(envelope-from <tinghan.shen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
	with ESMTP id 1728635083; Tue, 21 Jun 2022 23:22:50 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 21 Jun 2022 23:22:48 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Wed, 22 Jun 2022 14:22:46 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.3 via Frontend Transport; Wed, 22 Jun 2022 14:22:46 +0800
From: Tinghan Shen <tinghan.shen@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, Pierre-Louis Bossart
	<pierre-louis.bossart@linux.intel.com>, Liam Girdwood <lgirdwood@gmail.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, Bard Liao
	<yung-chuan.liao@linux.intel.com>, Ranjani Sridharan
	<ranjani.sridharan@linux.intel.com>, Kai Vehmanen
	<kai.vehmanen@linux.intel.com>, Daniel Baluta <daniel.baluta@nxp.com>, "Mark
 Brown" <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai
	<tiwai@suse.com>, Tinghan Shen <tinghan.shen@mediatek.com>, YC Hung
	<yc.hung@mediatek.com>, Curtis Malainey <cujomalainey@chromium.org>,
	"Allen-KH Cheng" <allen-kh.cheng@mediatek.com>
CC: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<sound-open-firmware@alsa-project.org>, <alsa-devel@alsa-project.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v4 1/4] dt-bindings: dsp: mediatek: Use meaningful names for mbox
Date: Wed, 22 Jun 2022 14:22:42 +0800
Message-ID: <20220622062245.21021-2-tinghan.shen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220622062245.21021-1-tinghan.shen@mediatek.com>
References: <20220622062245.21021-1-tinghan.shen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220621_232257_880673_89DF1031 
X-CRM114-Status: GOOD (  12.04  )
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

Rename mbox according to actions instead of 'mbox0' and 'mbox1'.
The 8195 dsp node, which uses this binding, has not yet been added to
the 8195 devicetree.

Signed-off-by: Tinghan Shen <tinghan.shen@mediatek.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/dsp/mediatek,mt8195-dsp.yaml   | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/dsp/mediatek,mt8195-dsp.yaml b/Documentation/devicetree/bindings/dsp/mediatek,mt8195-dsp.yaml
index b7e68b0dfa13..ca8d8661f872 100644
--- a/Documentation/devicetree/bindings/dsp/mediatek,mt8195-dsp.yaml
+++ b/Documentation/devicetree/bindings/dsp/mediatek,mt8195-dsp.yaml
@@ -50,13 +50,13 @@ properties:
 
   mboxes:
     items:
-      - description: ipc reply between host and audio DSP.
-      - description: ipc request between host and audio DSP.
+      - description: mailbox for receiving audio DSP requests.
+      - description: mailbox for transmitting requests to audio DSP.
 
   mbox-names:
     items:
-      - const: mbox0
-      - const: mbox1
+      - const: rx
+      - const: tx
 
   memory-region:
     items:
@@ -100,6 +100,6 @@ examples:
        memory-region = <&adsp_dma_mem_reserved>,
                        <&adsp_mem_reserved>;
        power-domains = <&spm 6>; //MT8195_POWER_DOMAIN_ADSP
-       mbox-names = "mbox0", "mbox1";
+       mbox-names = "rx", "tx";
        mboxes = <&adsp_mailbox0>, <&adsp_mailbox1>;
     };
-- 
2.18.0


