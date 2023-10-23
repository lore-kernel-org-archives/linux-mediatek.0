Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11EE8C001E0
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Oct 2023 08:38:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SRNqRps3CGBBaZ+7ttdHnWTO7l+/Fifh5VHyZDlIus0=; b=ePt62Cus2Vs7cHeo/oAOWkypEB
	SAA8cbrJ14o4MRtLa8kRhmzf529k/7NkNCz8YZZ4wvX0Z+pmNAfut+iooxWuCTD6rl+qTGcakj2UE
	WneOW4CfcWvZZq0iaQcmaVM0IrYb1+/l3W71rS3NC74PJMNYhguLN1Q9cfAZLKMEp5A+0/ypfNwcP
	p3cSaPyhpZ0NGCgsdqdbwKysvod/COMbpKJr0Wo0hRI+3pl04gDtKzbHPKDb2ND539sjuohEZtxhj
	omO5gU/sek+JbzcNnMbIt6LoyJ0ONHvybADSx99MVNIXYaVMyJ3ez/ba6cVrgZCcYnPAHGzmT5Iov
	V1pAI09g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1quqSb-006n8M-30;
	Mon, 23 Oct 2023 08:38:53 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1quqSY-006n7B-2p;
	Mon, 23 Oct 2023 08:38:52 +0000
X-UUID: 94ce2f82717f11ee9b7791016c24628a-20231023
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=SRNqRps3CGBBaZ+7ttdHnWTO7l+/Fifh5VHyZDlIus0=;
	b=krtyTdHDYttRgyfDsNbQi2WAVQTj63HD9u0PhxdDt2h59avClgBKD2yfSkqU/l88KtgZUA/GzGK2CQBqSTXOMvsiNW8sqLbhsxusknFoqgSs3p4h0jg03XTTC7E78wz5TTyp9QZooMuczycKyVbO04xVqdxzAamgRiQB6oFf2Qw=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.32,REQID:cee00700-54a2-41f5-b9ff-65f2d3e550cd,IP:0,U
	RL:0,TC:0,Content:100,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:100
X-CID-META: VersionHash:5f78ec9,CLOUDID:9ed08494-10ce-4e4b-85c2-c9b5229ff92b,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:801|102,TC:nil,Content:3,EDM:-3,IP:n
	il,URL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR
	:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 94ce2f82717f11ee9b7791016c24628a-20231023
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw01.mediatek.com
	(envelope-from <jason-ch.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 602194906; Mon, 23 Oct 2023 01:38:46 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 23 Oct 2023 16:38:43 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Mon, 23 Oct 2023 16:38:43 +0800
From: Jason-ch Chen <jason-ch.chen@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Eugen Hristev
	<eugen.hristev@collabora.com>, Bartosz Golaszewski <brgl@bgdev.pl>,
	"Alexandre Mergnat" <amergnat@baylibre.com>
CC: =?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?=
	<nfraprado@collabora.com>, Chen-Yu Tsai <wenst@chromium.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
	jason-ch chen <Jason-ch.Chen@mediatek.com>
Subject: [PATCH v6 3/4] dt-bindings: soc: mediatek: pwrap: Modify compatible for MT8188
Date: Mon, 23 Oct 2023 16:38:38 +0800
Message-ID: <20231023083839.24453-4-jason-ch.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20231023083839.24453-1-jason-ch.chen@mediatek.com>
References: <20231023083839.24453-1-jason-ch.chen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--1.247500-8.000000
X-TMASE-MatchedRID: 2JzysEMO32XU4D7YCSb+lOLdprnA5EQRVGf/uPixyaHfc2Xd6VJ+yugY
	NLLnK4fdLYexjI/F2s7xHXxxAO/d2SaIC0lz+Wv3dARARTk4h599LQinZ4QefPcjNeVeWlqY+gt
	Hj7OwNO28bRUed1HGAun91R5L5gookHCWXgkwWCVyIxe86Rg2l4s4lMw1m4/iSdKh13FOPiZ/6A
	dUqv4o1T5cNYcpx6Vm1ZmrWLjqccMCLX9BIDsxInZrUbEZipAEiWT09mQz7szw9kH8zAy44aOuV
	Lnx3A74
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--1.247500-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: E477473E303D34B14628D0F01BADA993E88918BB46809C122074819BEF6D92EA2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231023_013850_916571_A694A51E 
X-CRM114-Status: GOOD (  10.18  )
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

From: jason-ch chen <Jason-ch.Chen@mediatek.com>

The reason for changing the patch was that while MT8188 uses the same
pwrap as MT8195, the original code was only applicable to 'compatible =
"mediatek,mt8188-pwrap"'. To resolve the DTBS check warning that
'['mediatek,mt8188-pwrap', 'mediatek,mt8195-pwrap', 'syscon'] is too
long', it is necessary to modify the code.

Signed-off-by: jason-ch chen <Jason-ch.Chen@mediatek.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../devicetree/bindings/soc/mediatek/mediatek,pwrap.yaml    | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/soc/mediatek/mediatek,pwrap.yaml b/Documentation/devicetree/bindings/soc/mediatek/mediatek,pwrap.yaml
index a06ac2177444..4737e5f45d54 100644
--- a/Documentation/devicetree/bindings/soc/mediatek/mediatek,pwrap.yaml
+++ b/Documentation/devicetree/bindings/soc/mediatek/mediatek,pwrap.yaml
@@ -41,7 +41,6 @@ properties:
               - mediatek,mt8173-pwrap
               - mediatek,mt8183-pwrap
               - mediatek,mt8186-pwrap
-              - mediatek,mt8188-pwrap
               - mediatek,mt8195-pwrap
               - mediatek,mt8365-pwrap
               - mediatek,mt8516-pwrap
@@ -50,6 +49,11 @@ properties:
               - mediatek,mt8186-pwrap
               - mediatek,mt8195-pwrap
           - const: syscon
+      - items:
+          - enum:
+              - mediatek,mt8188-pwrap
+          - const: mediatek,mt8195-pwrap
+          - const: syscon
 
   reg:
     minItems: 1
-- 
2.18.0


