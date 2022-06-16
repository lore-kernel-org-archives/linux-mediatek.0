Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8ED99C43334
	for <linux-mediatek@archiver.kernel.org>; Thu, 16 Jun 2022 07:31:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ldkyyj361S4J9EWAjMKrIQWbcCanV2WOldRBRRhlHzg=; b=SDBiyKFtKAVobyUAmHuy1hgPWq
	aqL1/Abt1s3Gndj8Q+Re6gVv+HXxlv2FX2/9q1nTT3hsage9ZDnjGneWslma+Tfpfsix0KZap2T3K
	A85ihOXIS/4uUklxRZAcNTWWr90tux4iZPkLRd7tGhKEaRFw/SSYg9JrVwKmuoa2Y6qekwfmVO+Jl
	mVJGSR2Wu0oYiH/HSq8SLkCJtHhxyi+34EIfCigtR05NCPoWREYy0nASbZ3Ietr6EKj482OC7VL7m
	vBGSHnQTd0/LMOB3jrpAtZ3yokJSJu5qeoDHP7V1kXaLcK/w6Yltoah/qBIhUvbKFEfzMHDEplhSW
	EJpehrig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1jxw-0013Vg-LB; Thu, 16 Jun 2022 07:30:56 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1jxu-0013UU-At; Thu, 16 Jun 2022 07:30:55 +0000
X-UUID: 36b59787591247d8bdd84ae7ec1f8569-20220616
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.6,REQID:5dae8b86-49d9-4b6d-a8c1-ab56379a8742,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:0
X-CID-META: VersionHash:b14ad71,CLOUDID:eb91b748-4c92-421c-ad91-b806c0f58b2a,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: 36b59787591247d8bdd84ae7ec1f8569-20220616
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
	(envelope-from <tinghan.shen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
	with ESMTP id 1131034851; Thu, 16 Jun 2022 00:30:49 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 16 Jun 2022 00:30:47 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3;
 Thu, 16 Jun 2022 15:30:46 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 16 Jun 2022 15:30:45 +0800
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
	<yc.hung@mediatek.com>, Curtis Malainey <cujomalainey@chromium.org>, Allen-KH
 Cheng <allen-kh.cheng@mediatek.com>
CC: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<sound-open-firmware@alsa-project.org>, <alsa-devel@alsa-project.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v3 1/4] dt-bindings: dsp: mediatek: Use meaningful names for mbox
Date: Thu, 16 Jun 2022 15:30:39 +0800
Message-ID: <20220616073042.13229-2-tinghan.shen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220616073042.13229-1-tinghan.shen@mediatek.com>
References: <20220616073042.13229-1-tinghan.shen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220616_003054_419682_7819285D 
X-CRM114-Status: GOOD (  10.73  )
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

Signed-off-by: Tinghan Shen <tinghan.shen@mediatek.com>
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


