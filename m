Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8EB1CF6498
	for <linux-mediatek@archiver.kernel.org>; Sun, 29 Sep 2024 07:48:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r8TZngzN4fBlzJ+3/GEuV4pMEHO8a4/YigjdzIgfAg0=; b=dNil2/qMlGZeh5SqB4BYgo1hTt
	vNBeF321xobKOrf50Ttjd172pKxiKclsZWG8NuCZaCtJm4DNgM8ZLdwPhtS1NrXRgh0xHWdKyn9BG
	fMI/Xj0nXCkQbI8WV+w3GW7IhoiyedNNoD7F62qlNxSw/39TvEXYRCKaMOuWXwiDlP0KFCc9aRU5z
	wOyKsVJkUPJu6d26zdSaIE0bTP36adUnUAgEzIjTitPa25fk+d6r1IPr+2TX9lByq2AEs6S0X6Syl
	TsHIp/dJ9JRYQE/sIsWHxG55yR3byMOKpWziJBd0h/FMR9SLc7CUWE9X7Ug/Fd3hhxITXUIuQQC0C
	b7PalXJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1suofh-0000000EMo0-3Jgy;
	Sun, 29 Sep 2024 07:48:49 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1suodr-0000000EMa3-2Kwz;
	Sun, 29 Sep 2024 07:46:56 +0000
X-UUID: fbf1784e7e3611efb3adad29d29602c1-20240929
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=r8TZngzN4fBlzJ+3/GEuV4pMEHO8a4/YigjdzIgfAg0=;
	b=qOjjZtIw0HgQyugPxvf5R4q3Qtv9PYWhel0xk1oxaWzKm8oqHqS2z+QYXiraRjOlyTvzIZ8lWXuUGbAMJoQcysMMzdLOVKvPVbUL8oY0xHStL1Z0fknncU4L1TWidhBRsSf92Zf0O2CZmHcd/uAYpDoH9844/gMp0A9mxaRz24E=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.41,REQID:69464598-0dd4-4146-a74d-2847275712a9,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:6dc6a47,CLOUDID:3d2ceed0-7921-4900-88a1-3aef019a55ce,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: fbf1784e7e3611efb3adad29d29602c1-20240929
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw01.mediatek.com
	(envelope-from <andy-ld.lu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 2007521803; Sun, 29 Sep 2024 00:46:49 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Sun, 29 Sep 2024 15:46:45 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Sun, 29 Sep 2024 15:46:45 +0800
From: Andy-ld Lu <andy-ld.lu@mediatek.com>
To: <ulf.hansson@linaro.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<matthias.bgg@gmail.com>, <angelogioacchino.delregno@collabora.com>,
	<wenbin.mei@mediatek.com>
CC: <linux-mmc@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, Andy-ld Lu <andy-ld.lu@mediatek.com>
Subject: [PATCH v2 2/2] dt-bindings: mmc: mtk-sd: Add support for MT8196
Date: Sun, 29 Sep 2024 15:44:06 +0800
Message-ID: <20240929074558.2076-3-andy-ld.lu@mediatek.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240929074558.2076-1-andy-ld.lu@mediatek.com>
References: <20240929074558.2076-1-andy-ld.lu@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--3.262000-8.000000
X-TMASE-MatchedRID: 4vekfgKkjb2jFYHTfcPkwnUh2OMdFI0JdER46uj876/oFeE5MSxNMeLz
	NWBegCW2wgn7iDBesS0nRE+fI6etklKI8qMY6HF7MGxmFQglB5et5WtO61sYkDS0ZY+wELuA1wq
	6eaS/JMBEcjFBF4nb7T9MP3O5iuBM7ziozp+iUBSNwFX5iWojOYSVUZZHNLr+RgV6Hsqyx11QaO
	NuZ6Jr4g9k3l8EaYIcDiKmdrlEg1g=
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--3.262000-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 7E9F5FBC0FD3DFB04D1DF69141D31E33C8E2900EA44CCA49FD8478C6D41A6FB42000:8
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240929_004655_631001_E2B35296 
X-CRM114-Status: UNSURE (   8.37  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Extend the devicetree bindings to include the MT8196 mmc controller
by adding the compatible string 'mediatek,mt8196-mmc'.

Signed-off-by: Andy-ld Lu <andy-ld.lu@mediatek.com>
---
 Documentation/devicetree/bindings/mmc/mtk-sd.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/mmc/mtk-sd.yaml b/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
index c532ec92d2d9..9281a0326891 100644
--- a/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
+++ b/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
@@ -24,6 +24,7 @@ properties:
           - mediatek,mt8135-mmc
           - mediatek,mt8173-mmc
           - mediatek,mt8183-mmc
+          - mediatek,mt8196-mmc
           - mediatek,mt8516-mmc
       - items:
           - const: mediatek,mt7623-mmc
@@ -190,6 +191,7 @@ allOf:
             - mediatek,mt8186-mmc
             - mediatek,mt8188-mmc
             - mediatek,mt8195-mmc
+            - mediatek,mt8196-mmc
             - mediatek,mt8516-mmc
     then:
       properties:
-- 
2.46.0


