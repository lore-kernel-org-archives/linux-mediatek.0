Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AE57CDB482
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Oct 2023 07:55:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SRNqRps3CGBBaZ+7ttdHnWTO7l+/Fifh5VHyZDlIus0=; b=DPiLt27Zl1F7w7NS63zI0Tp7Db
	564UnEP2fSuuLmDis18IWcVajs3L7aNow2Lh/NjQmkqPSyPqyfN0cACBOShkadjqA60kBR1VeBjH3
	a9WEYiGdfASsyGd04lndAYxgzUhxqs1LZGiWNoO9UxsXgAZPow9CAKqO7niNAJJ9HLnBsYGTY9Y9A
	y8Afz2XXyEy1SBgIm7T4ifPrMV0VVw5G6KA5CMDdZGl5pXvYzn9C1pUJrZ8erLiBgoThHmfiW8K/Z
	hu9fbU0K6XTErbJZ8yebswmPDd3aYrXuNe7+E3r7DMR0gnyxs97WaZo612R3A5IE8N0YSk5J2UdeS
	lTfKHCCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qtNsn-00GePi-1O;
	Thu, 19 Oct 2023 07:55:53 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qtNsl-00GeOt-0S;
	Thu, 19 Oct 2023 07:55:52 +0000
X-UUID: e8a693166e5411ee9b7791016c24628a-20231019
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=SRNqRps3CGBBaZ+7ttdHnWTO7l+/Fifh5VHyZDlIus0=;
	b=gudRzTWReO9JWNT8ZEDZXHVLQ54FKg4fovrKUpAjDkX0QDjDEfxOkbLe2x/mlq6Mtdw5O37Md4vJwqz7cBN2O9Uo2JNvZBC2Ldc4p3W+u8d6GtY/0rMWQzkHcpVJZslm3j6okMUvpepTSNayozsi8jHXlTxCWCyiFA9PcXN1YWk=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.32,REQID:a62f0a25-8b8a-44e7-84f6-c74687b3d1fc,IP:0,U
	RL:0,TC:0,Content:100,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:100
X-CID-META: VersionHash:5f78ec9,CLOUDID:88da1dc0-14cc-44ca-b657-2d2783296e72,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:801|102,TC:nil,Content:3,EDM:-3,IP:n
	il,URL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR
	:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: e8a693166e5411ee9b7791016c24628a-20231019
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw01.mediatek.com
	(envelope-from <jason-ch.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1388694065; Thu, 19 Oct 2023 00:55:45 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 19 Oct 2023 15:55:07 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Thu, 19 Oct 2023 15:55:07 +0800
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
Subject: [PATCH v5 3/4] dt-bindings: soc: mediatek: pwrap: Modify compatible for MT8188
Date: Thu, 19 Oct 2023 15:54:57 +0800
Message-ID: <20231019075458.28290-4-jason-ch.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20231019075458.28290-1-jason-ch.chen@mediatek.com>
References: <20231019075458.28290-1-jason-ch.chen@mediatek.com>
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
X-TM-SNTS-SMTP: 34D88600E14523A8F2BFA5912034D5F0FB22C3E7AACD48E3C92B3E9BEFDECB4E2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231019_005551_184945_69072F22 
X-CRM114-Status: GOOD (  10.80  )
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


