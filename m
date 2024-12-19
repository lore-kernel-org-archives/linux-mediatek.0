Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 326E4E77184
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Dec 2024 18:16:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	MIME-Version:Message-ID:Date:Subject:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=ZRNlClTpyAMqK+J6+xpp8yNx43isLwpFhXRlwgj4Ew4=; b=aYN
	LCopWYXp9/JwiQDP/XUeWiBHZTXozhxWIuJ9biC5Qy7E7+4RRVbOqV1b5uOGaYb9IQD8fhyxPze7s
	njp53aA/znfcaDRk2R3x4daOZYPluobUATcE5rtKktVtWMlLx7/WskLlH1sGUB6x+2OJKLWzFJurr
	PtM/10+t1rwDdFQBSKuPXXLj5o4LgMDQ/Sm7WoA/A8da6KPlPee22eSplY7BfUzy7PXoe0d4+ZGkJ
	mqns06dn/mrMRMmMwI7dPdcak5qtd6A1UEV4njHnT5Komgy5AVgM6TmAUx8DYllu/5pV/2bLdqbN/
	wgFLMaTwCueOSGeUsBt9aSyW6ROjK1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOL4r-00000002iVU-3fL3;
	Thu, 19 Dec 2024 18:16:49 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOL3k-00000002iGx-15uh;
	Thu, 19 Dec 2024 18:15:41 +0000
X-UUID: 3eea3580be3511ef9048ed6ed365623b-20241219
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=ZRNlClTpyAMqK+J6+xpp8yNx43isLwpFhXRlwgj4Ew4=;
	b=DpZ/hGDlxdTcwqUw7s+9F2Tlj7deXDsqVE4oROcN+eEFI5NMLX26qT+UC8gyTgVv7DpNWjLHEzvvxyAeNEHXLFB+RbciCFMFnKi5eC8RSoITqwVIkJNIjxSqZvRtA1uaBUSES2/JQT9djiydjzFFGGYx7q+ShlDKQ9kIlrPXMK0=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.45,REQID:9ca800bc-c599-4239-b3b6-f94834c9c13f,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:6493067,CLOUDID:7b20cc28-d2eb-4de2-b5c9-495d1bc17256,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:1,File:nil,RT:100,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-UUID: 3eea3580be3511ef9048ed6ed365623b-20241219
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by mailgw02.mediatek.com
	(envelope-from <jason-jh.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 509162656; Thu, 19 Dec 2024 11:15:36 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 20 Dec 2024 02:15:34 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 20 Dec 2024 02:15:34 +0800
From: Jason-JH.Lin <jason-jh.lin@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH v3 0/4] Update MT8188 OVL compatible from MT8183 to MT8195
Date: Fri, 20 Dec 2024 02:15:27 +0800
Message-ID: <20241219181531.4282-1-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241219_101540_301698_EF49D850 
X-CRM114-Status: GOOD (  11.77  )
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
Cc: devicetree@vger.kernel.org, "Jason-JH . Lin" <jason-jh.lin@mediatek.com>, Singo Chang <singo.chang@mediatek.com>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Project_Global_Chrome_Upstream_Group@mediatek.com, Pin-yen Lin <treapking@chromium.org>, Nancy
 Lin <nancy.lin@mediatek.com>, linux-mediatek@lists.infradead.org, Shawn Sung <shawn.sung@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

This patch series updates the compatible strings for the MediaTek OVL
in the MT8188 dts and the corresponding dt-binding.
The changes ensure that the MT8188 OVL device is correctly identified
and managed by the appropriate drivers.

The first patch is adding the MT8188 compatible strings, refer to:
- https://lore.kernel.org/all/20241218105320.38980-2-angelogioacchino.delregno@collabora.com/

The 2nd patch is resending the reviewed and acked patch from:
- https://lore.kernel.org/all/5d9e6f6c-604d-4e2d-a448-fc5b8bd24a75@collabora.com/
and rebase it to the latest linux-next-20241212.

The 3rd and the 4th patches are updating the mt8188.dtsi and mt8195.dtsi
according to the 1st patch.

---

Change in v3:
1. Add a dt-bindings ptach for MT8188 MDP3 OVL.

Change in v2:
1. Add missing mt8195 compatible in the beginning of compatible property.
2. Add fix patch to mt8195.

---

Hsiao Chien Sung (1):
  dt-bindings: display: mediatek: ovl: Modify rules for MT8195/MT8188

Jason-JH.Lin (3):
  dt-bindings: display: mediatek: ovl: Add compatible strings for MT8188
    MDP3
  dts: arm64: mediatek: mt8188: Update OVL compatible from MT8183 to
    MT8195
  dts: arm64: mediatek: mt8195: Remove MT8183 compatible for OVL

 .../bindings/display/mediatek/mediatek,ovl.yaml      | 12 +++++++-----
 arch/arm64/boot/dts/mediatek/mt8188.dtsi             |  2 +-
 arch/arm64/boot/dts/mediatek/mt8195.dtsi             |  2 +-
 3 files changed, 9 insertions(+), 7 deletions(-)

-- 
2.43.0


