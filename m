Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30C59C43334
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Jun 2022 08:45:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=C3dHEXOgVfpgFnV0G8y7fq2tZue8+yfNn03ea3ZDOFE=; b=riUPHkIdM7Au0j
	YQyJrTtgFtPU4Vrh4WIXqhsCHTCfD58Nl0gG0DcYpmAHGBXtXGh/EcmMtJOdZwGgKY6gVjhj/Fszp
	I5EaTWJzMwlbTVuDBZM3a0N4mrtQUcunI6lM8GUwrLGhmzm9gnTDfG4pS6ZV4xlaxq44MBbXnU3g3
	hYJmuHA+tKP4/qGaB7/KG8FE61zfAPCunu6TsYPC0AfJ92N/qv+xGxk/nDqgBpFB1ViEzecsBepHb
	fikxCePag4zHXuBf7i31DX6FfVitl21s8pb610epdsWOrNZzS0IciNK+elAk61t58cpcy9UCQKa6C
	Y7344dASgcHFAsmgHrMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzDnD-000MB4-Or; Thu, 09 Jun 2022 08:45:27 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzDZU-000FpD-Oo; Thu, 09 Jun 2022 08:31:18 +0000
X-UUID: e88b171d95234390a6b6d5e1527bf40f-20220609
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.5,REQID:3c5f7de1-974b-4ab4-abec-b6c5491636fe,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACT
	ION:release,TS:-5
X-CID-META: VersionHash:2a19b09,CLOUDID:cad43be5-2ba2-4dc1-b6c5-11feb6c769e0,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,QS:0,BEC:nil
X-UUID: e88b171d95234390a6b6d5e1527bf40f-20220609
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
	(envelope-from <tinghan.shen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
	with ESMTP id 1048003558; Thu, 09 Jun 2022 01:31:08 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 9 Jun 2022 01:31:06 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Thu, 9 Jun 2022 16:31:05 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.3 via Frontend Transport; Thu, 9 Jun 2022 16:31:05 +0800
From: Tinghan Shen <tinghan.shen@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, Tinghan Shen <tinghan.shen@mediatek.com>, "Mark
 Brown" <broonie@kernel.org>, YC Hung <yc.hung@mediatek.com>, Curtis Malainey
	<cujomalainey@chromium.org>, Allen-KH Cheng <allen-kh.cheng@mediatek.com>
CC: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v2 1/3] dt-bindings: dsp: mediatek: Use meaningful names for mbox
Date: Thu, 9 Jun 2022 16:30:59 +0800
Message-ID: <20220609083101.24195-2-tinghan.shen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220609083101.24195-1-tinghan.shen@mediatek.com>
References: <20220609083101.24195-1-tinghan.shen@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220609_013116_881463_0529149B 
X-CRM114-Status: GOOD (  10.42  )
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

Rename mbox according to action instead of 'mbox0' and 'mbox1'.

Signed-off-by: Tinghan Shen <tinghan.shen@mediatek.com>
---
 .../devicetree/bindings/dsp/mediatek,mt8195-dsp.yaml        | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/dsp/mediatek,mt8195-dsp.yaml b/Documentation/devicetree/bindings/dsp/mediatek,mt8195-dsp.yaml
index b7e68b0dfa13..6cedd6868cc5 100644
--- a/Documentation/devicetree/bindings/dsp/mediatek,mt8195-dsp.yaml
+++ b/Documentation/devicetree/bindings/dsp/mediatek,mt8195-dsp.yaml
@@ -55,8 +55,8 @@ properties:
 
   mbox-names:
     items:
-      - const: mbox0
-      - const: mbox1
+      - const: rep
+      - const: req
 
   memory-region:
     items:
@@ -100,6 +100,6 @@ examples:
        memory-region = <&adsp_dma_mem_reserved>,
                        <&adsp_mem_reserved>;
        power-domains = <&spm 6>; //MT8195_POWER_DOMAIN_ADSP
-       mbox-names = "mbox0", "mbox1";
+       mbox-names = "rep", "req";
        mboxes = <&adsp_mailbox0>, <&adsp_mailbox1>;
     };
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
