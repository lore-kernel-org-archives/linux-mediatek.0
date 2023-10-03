Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1CBBE7544C
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Oct 2023 11:14:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=4KQCD3298cXHTmvXZTqoLnVH8NJUnoLKT/prgEjlF2w=; b=bMdB7//HrTAR8m
	IOANRn0Na3EzJ19nIpAsNbapLS1Vk5tvzi6glleWlkrrjbPc29HS7gefjK7eagCFp68BpwPSkB5JY
	GXeTcpbBmR3U9nP/IoA/jQTicpuGfGK/cZdiNKxKRlUm/v/sfLZmn3lkMzkm/iQoLOqUmHSjg0pqq
	uqnHwiI3b9HloxTX0mCfoCOWXhhHLwv2/ieZKvUFZLUKBxT1xjzT7WnFbTSFBQ/jppGR/P+/m4ZHn
	n8OCBU6iGWUo6C3nHrOljJW9sBIadbDFbb9PzKZr9vJLm5LuheKxRO3/rVi30FGorQ5xzao4vLs8c
	X7tw3rNh+K7ixXzWOpag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qndLl-00EVF4-2G;
	Tue, 03 Oct 2023 11:14:01 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qndLg-00EVAE-2S;
	Tue, 03 Oct 2023 11:13:59 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id E024F6607324;
	Tue,  3 Oct 2023 12:13:51 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1696331632;
	bh=ZIRAP2qm7XJoF1kXFQyj8XANIl0j4JfaME1N/oAEhmA=;
	h=From:Subject:Date:To:Cc:From;
	b=NKdIB6BoXyaqPjYoZBhptnFNXxedY9hPj6uZn7PBF1h8SrjggM7C4P93cU5JVDnP4
	 WK5iUR2Fw6HxFQSIKcoi4VtIHcMyoha0o+Xfs8vYE7YV+lLxwAwi9YVFp53KJkS6Tq
	 Zc1E7GWuXKx1mI1EMhU6PSmE28BJaQj21iFDg024riBIubFUgzoIaAo+jFOndr/LR0
	 7ph25s+MwZ3toIN0xA7/SicCUiDP54fnt4ZsPiRnq/bgJP+rKlOAyN0E2eCLZOYgCd
	 NHbec9BbQ64U8EDaJvhLBGAHNTgLu2eOFaHNtrmne8dcAISN58qmN7eOM3sT6mnZ2k
	 zZJ5BHQlN4xvA==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH 0/5] MediaTek: Update MAINTAINERS and dts fixes for v6.7
Date: Tue, 03 Oct 2023 13:13:42 +0200
Message-Id: <20231003-mediatek-fixes-v6-7-v1-0-dad7cd62a8ff@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAGb3G2UC/x3L0QqDMAxA0V+RPBto7TbBXxk+pG2cYa6OxslA/
 PeFPd4L5wDlKqwwNAdU3kVlLRa+bSDNVB6Mkq2hc13wzgV8cRba+ImTfFlxv2GP4eLjNU05uZ7
 AZCRljJVKms2Wz7LYfFf+Ezv38Tx/T+czfXoAAAA=
To: Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Fabien Parent <fparent@baylibre.com>, 
 Miles Chen <miles.chen@mediatek.com>, 
 Macpaul Lin <macpaul.lin@mediatek.com>, 
 Chunfeng Yun <chunfeng.yun@mediatek.com>, Sam Shih <sam.shih@mediatek.com>, 
 Frank Wunderlich <frank-w@public-files.de>, 
 Jieyy Yang <jieyy.yang@mediatek.com>, 
 Tinghan Shen <tinghan.shen@mediatek.com>, 
 Seiya Wang <seiya.wang@mediatek.com>, soc@kernel.org
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, 
 stable@vger.kernel.org, Eugen Hristev <eugen.hristev@collabora.com>, 
 =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
X-Mailer: b4 0.12.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1438;
 i=angelogioacchino.delregno@collabora.com; h=from:subject:message-id;
 bh=ZIRAP2qm7XJoF1kXFQyj8XANIl0j4JfaME1N/oAEhmA=;
 b=owGbwMvMwCU2y4zl/NrpLRWMp9WSGFKlv+d7zOy97b5a+fUXwat5zHEWRwO/8H/wOBMm91Kr8dpM
 293fOkpZGMS4GGTFFFnU79ZkP1+zkvFI+9kSmDmsTCBDGLg4BWAiEQcY/odt/DpHhnGdyHa/NV0xx5
 aHrZ72t3rz9il17zn93V/G51kz/PfqrEniOKbzk+XWUymr5Il7UpaIHd9auvXFUsk007mlauwA
X-Developer-Key: i=angelogioacchino.delregno@collabora.com; a=openpgp;
 fpr=57152E620CAF29C5DBE574766833ABB5BEBAF7B7
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231003_041356_937687_E1ABA871 
X-CRM114-Status: GOOD (  10.09  )
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

Hello SoC maintainers,
    
As suggested by Arnd in [1], I am sending an update to the MAINTAINERS
file, adding myself to the MediaTek SoC maintainers, and some urgent
bugfixes for MediaTek devicetrees.
    
mt6358 PMIC
 - Bogus property dropped
    
mt7622/mt7986a
 - Fix dtbs_check for t-phy nodes
    
mt8195:
 - Fix early boot failure when DSU PMU enabled
 - Fix memory layout for demo board
    
Regards,
Angelo

---
AngeloGioacchino Del Regno (1):
      MAINTAINERS: Add Angelo as MediaTek SoC co-maintainer

Eugen Hristev (1):
      arm64: dts: mediatek: fix t-phy unit name

Macpaul Lin (2):
      arm64: dts: mediatek: mt8195-demo: fix the memory size to 8GB
      arm64: dts: mediatek: mt8195-demo: update and reorder reserved memory regions

Nícolas F. R. A. Prado (1):
      arm64: dts: mediatek: mt8195: Set DSU PMU status to fail

 MAINTAINERS                                  |  2 +-
 arch/arm64/boot/dts/mediatek/mt7622.dtsi     |  2 +-
 arch/arm64/boot/dts/mediatek/mt7986a.dtsi    |  2 +-
 arch/arm64/boot/dts/mediatek/mt8195-demo.dts | 39 ++++++++++++++++++++++------
 arch/arm64/boot/dts/mediatek/mt8195.dtsi     |  1 +
 5 files changed, 35 insertions(+), 11 deletions(-)
---
base-commit: 0bb80ecc33a8fb5a682236443c1e740d5c917d1d
change-id: 20231003-mediatek-fixes-v6-7-341b5cfdc07a

Best regards,
-- 
AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


