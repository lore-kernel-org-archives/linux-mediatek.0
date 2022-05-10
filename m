Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C94CAC433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 May 2022 13:32:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=8J4nw9cfJH7CKv1mobgvPG1x/ShvU7iqImalc+lMLmI=; b=OrvDqwdOiTW9A9
	RKTDEtIzyKW5iOIT3aOgly76fqmtA78lEeFCWYztxLcK9JbrxC6tRJBDnOzT7jnCCZIcN217IQORI
	hIett70JGFrdDZ1Jlevpc45qP5IBAd8i5T91YuTp6KiLVTRWrYljJQ/NNSrDx7m68zJtjDQCgGpFg
	JSMN1v4IymAB7c8Ql7cV6rpp2Kg8vCcuXEJl+STdRnaUgt58zaxUFWO5hiKcagYxuayGlO3EWiXBF
	47jtp5VEBOlJ7GApaEl+EE/s0OuyvAtPu9i8tAVyYDxMXe1jBPRsfW1Bad3FS89hN9sDIhOwrjpql
	ONt+00gI4gMfN6zu15hA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1noPyI-002G4r-16; Tue, 10 May 2022 13:32:14 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1noPxs-002Fp9-Hm; Tue, 10 May 2022 13:31:49 +0000
X-UUID: 017182a467de44cc81bbe25ad0ef6bfa-20220510
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.4, REQID:c9a374ac-6c20-4179-9b96-2f4ed5fa8c54, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:-20,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,AC
 TION:release,TS:-20
X-CID-META: VersionHash:faefae9, CLOUDID:e12e4ab3-56b5-4c9e-8d83-0070b288eb6a,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,File:nil,QS:0,BEC:nil
X-UUID: 017182a467de44cc81bbe25ad0ef6bfa-20220510
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <allen-kh.cheng@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1003182151; Tue, 10 May 2022 06:31:46 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 10 May 2022 06:26:40 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 10 May 2022 21:26:39 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.3 via Frontend Transport; Tue, 10 May 2022 21:26:39 +0800
From: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>, "Krzysztof
 Kozlowski" <krzysztof.kozlowski@canonical.com>
CC: Lala Lin <lala.lin@mediatek.com>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
 "Chen-Yu Tsai" <wenst@chromium.org>, Allen-kh Cheng
 <allen-kh.cheng@mediatek.corp-partner.google.com>
Subject: [PATCH v4 0/3] dt-bindings: nvmem: mediatek: Convert efuse binding to
 YAML
Date: Tue, 10 May 2022 21:26:34 +0800
Message-ID: <20220510132637.5864-1-allen-kh.cheng@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220510_063148_629807_33D9AA1C 
X-CRM114-Status: GOOD (  11.28  )
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

From: Allen-kh Cheng <allen-kh.cheng@mediatek.corp-partner.google.com>

Convert MediaTek eFuse devicetree binding to YAML.

Based on tag: next-20220510, linux-next/master

Run cmds as following:
make DT_CHECKER_FLAGS=-m dt_binding_check
DT_SCHEMA_FILES=Documentation/devicetree/bindings/nvmem/mediatek,efuse.yaml

make ARCH=arm64
dtbs_check DT_SCHEMA_FILES=Documentation/devicetree/bindings/nvmem/mediatek,efuse.yaml

We mark the mediatek,mt8173-efuse and mediatek,efuse as deprecated to indicate
not use a signle compatible and should always use mediatek,efuse as generic
fallback.

change since v3:
 - use mediatek as vendor name instead of mtk

changes since v2:
 - document deprecated efuse property
 - update efuse compatible fallbacks
 - add two PATCHs into series

changes since v1:
- change file name from mtk,efuse-yaml to mtk,efuse.yaml
- add efuse in commit title
- change compatible entries from const to enum

Allen-KH Cheng (2):
  dt-bindings: nvmem: mediatek: Convert efuse binding to YAML
  arm64: dts: mediatek: update efuse compatible fallbacks

Allen-kh Cheng (1):
  dt-bindings: nvmem: mediatek: document deprecated efuse property

 .../bindings/nvmem/mediatek,efuse.yaml        | 60 +++++++++++++++++++
 .../devicetree/bindings/nvmem/mtk-efuse.txt   | 43 -------------
 arch/arm64/boot/dts/mediatek/mt8173.dtsi      |  3 +-
 arch/arm64/boot/dts/mediatek/mt8192.dtsi      |  3 +-
 4 files changed, 64 insertions(+), 45 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/nvmem/mediatek,efuse.yaml
 delete mode 100644 Documentation/devicetree/bindings/nvmem/mtk-efuse.txt

-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
