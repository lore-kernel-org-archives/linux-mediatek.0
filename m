Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 934DFC46467
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Jan 2023 12:38:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Sr+PIg3JVKq3dP3YdqVRBlMxm/APW0FS9VzxDQ6sE/c=; b=HvboDoz8c7AHSWRmp4JgyfKsyd
	5wNvvJsAqE1M9E5PLil+C09Zd5qVEchUhBSSL7mERtPDl2asHhA8EtWrD9z/9PosaKsuMHG+Kh2zh
	S+WaEGTfxoT2tyN+m/5CsADbVeq0c1JX8zEi1w88WyhYggXVWkPjhKFaN+GmlGSOABELxqDddTaW4
	BuSNmK0Q9Pqj3Ta7MHy6QJjaV7g4U6W6XjIIXj1Kq9gMB0+PiLhlGvfhgKF9cExa/V37y45CBY5ND
	aOUkWGF6HM4FEEbf6YbXcYOzZKtNnAP8oU9JLK8yauMyVZD+fKIiVRrM/jUTUEOK9ZeSSmJW8sKbE
	0j1mUbzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFaMs-00BIOK-OT; Wed, 11 Jan 2023 12:38:10 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFaMg-00BIGC-BP; Wed, 11 Jan 2023 12:37:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:MIME-Version:Message-ID:
	Date:Subject:CC:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=Sr+PIg3JVKq3dP3YdqVRBlMxm/APW0FS9VzxDQ6sE/c=; b=aqCOltAIX0NfZ923AmYDGnHsnF
	jscc06ZmmRMIvBVp9T43pJJrZRJsRLvXefMQxtSov/F+7BCnAgShrQFA4cf/y8W6AYMXiTWRK1Qe6
	X3RjPEE5esEceMnMX4gEhQek9LjCZ7oL4Ts3kHXUF4RNjCxlnPoJzsopuGexFxvAIIqzddmuY2RKC
	uXC5dgvFeBmMxIyKaE/MC++1elXsx/LEjh1WPfzXqiDNRD6f1Sy0Nkpq63Ns+Zk2BGxC57X5LJqZX
	V8R3rR3WO73c53vAsazo1/12XHPBLKrIgrPokoGXAFZxoEAMTXAJ+sA4tjnE1f+3UFTf8hTzZUPZj
	FsR7PmIQ==;
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pFaMR-003fni-1G;
	Wed, 11 Jan 2023 12:37:47 +0000
X-UUID: c0d8d1a891ac11eda08d4d6090ec5a5c-20230111
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=Sr+PIg3JVKq3dP3YdqVRBlMxm/APW0FS9VzxDQ6sE/c=;
	b=jpknjceJY1Vw1iM8Z0GnyoonmRDDG/tDGGIzC7TZYuE08CCadIgLzbVrnZA3ClgcNgXDLIWUZYWibtQXP6Bhhk5tz/63Im9cgW2DjdFKwrerbAY5S+c48qjDYQJ53+8bx/88WhzUXJurQReH98sAlMkvhHuEjoSPOYW9nabSUBs=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.17,REQID:678889d9-f4ab-42c3-a075-16f976c1b4fc,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:543e81c,CLOUDID:4a2485f5-ff42-4fb0-b929-626456a83c14,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0
X-CID-BVR: 0
X-UUID: c0d8d1a891ac11eda08d4d6090ec5a5c-20230111
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw02.mediatek.com
	(envelope-from <allen-kh.cheng@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1618711196; Wed, 11 Jan 2023 05:37:47 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Wed, 11 Jan 2023 20:37:13 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Wed, 11 Jan 2023 20:37:13 +0800
From: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring
	<robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>, Stephen Boyd <sboyd@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	<dri-devel@lists.freedesktop.org>
CC: <Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
	<hsinyi@chromium.org>, Allen-KH Cheng <allen-kh.cheng@mediatek.com>
Subject: [PATCH 0/9] Add and update some driver nodes for MT8186 SoC
Date: Wed, 11 Jan 2023 20:37:02 +0800
Message-ID: <20230111123711.32020-1-allen-kh.cheng@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230111_123744_322598_EF404417 
X-CRM114-Status: GOOD (  10.02  )
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

This series is based on matthias github, for-next.

Allen-KH Cheng (9):
  arm64: dts: mediatek: mt8186: Add MTU3 nodes
  dt-bindings: spmi: spmi-mtk-pmif: Document mediatek,mt8195-spmi as
    fallback of mediatek,mt8186-spmi
  arm64: dts: mediatek: mt8186: Add SPMI node
  arm64: dts: mediatek: mt8186: Add ADSP mailbox nodes
  arm64: dts: mediatek: mt8186: Add ADSP node
  arm64: dts: mediatek: mt8186: Add audio controller node
  arm64: dts: mediatek: mt8186: Add DPI node
  dt-bindings: display: mediatek: Fix the fallback for
    mediatek,mt8186-disp-ccorr
  arm64: dts: mediatek: mt8186: Add display nodes

 .../display/mediatek/mediatek,ccorr.yaml      |   2 +-
 .../bindings/spmi/mtk,spmi-mtk-pmif.yaml      |  11 +-
 arch/arm64/boot/dts/mediatek/mt8186.dtsi      | 335 ++++++++++++++++++
 3 files changed, 344 insertions(+), 4 deletions(-)

-- 
2.18.0


