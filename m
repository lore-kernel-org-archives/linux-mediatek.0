Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADC4EC4332F
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 Apr 2022 13:32:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Tb1k8DouJ/P9wAqsHAAzNRSblB6hs9xwKAq+erbfwVY=; b=I2UfW7eDjXCfma
	skq1WcDpOTO2JQTBH4DMOGh69ITRioakKMYsxDSS2HinpY4j4ueamrlZ2mtBO2xD0YuLcZdSpeP7y
	+ujQ5VsE7uGMM1yGX9R2BM1EUmW+IImgLbwoHqOGFN9u26vG7xAzE/e0V2c130l+BTClqofgTduh+
	bJyaGKHNZMmQZZrvyTumWv81c1JxKSN/MN9lma4ecVEzh0p5pwBOAOSnVA7QFcqVt56mmPSChFpNd
	0zt9EkmG8bqGWIs4iBGbu8EiMK67tUC8HQ+K4rnlIjb/y82rJJIQUBRb1ui7uLvl2F1q9FxBTvrUH
	+KEzW3rqq2aG6j/WqDVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nk4Fp-0074ch-W0; Thu, 28 Apr 2022 13:32:21 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nk49H-0071QQ-H5; Thu, 28 Apr 2022 13:25:36 +0000
X-UUID: 37bd03ab05ec47649830e8580e51549d-20220428
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.4, REQID:77c5d99f-6b74-44d1-8cc9-3f13c0ffdea4, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:-20,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,AC
 TION:release,TS:-20
X-CID-META: VersionHash:faefae9, CLOUDID:4e0b0e2f-6199-437e-8ab4-9920b4bc5b76,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,File:nil,QS:0,BEC:nil
X-UUID: 37bd03ab05ec47649830e8580e51549d-20220428
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <allen-kh.cheng@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1266677639; Thu, 28 Apr 2022 06:25:24 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 28 Apr 2022 06:25:23 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 28 Apr 2022 21:25:21 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 28 Apr 2022 21:25:21 +0800
From: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>, "Krzysztof
 Kozlowski" <krzysztof.kozlowski@canonical.com>
CC: Lala Lin <lala.lin@mediatek.com>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
 "Chen-Yu Tsai" <wenst@chromium.org>, Ryder Lee <ryder.lee@kernel.org>,
 Allen-KH Cheng <allen-kh.cheng@mediatek.com>
Subject: [PATCH v3 0/3] dt-bindings: nvmem: mediatek: Convert efuse binding to
 YAML
Date: Thu, 28 Apr 2022 21:25:17 +0800
Message-ID: <20220428132520.2033-1-allen-kh.cheng@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220428_062535_634988_391A2E8B 
X-CRM114-Status: GOOD (  10.15  )
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

Convert MediaTek eFuse devicetree binding to YAML.

Based on tag: next-20220422, linux-next/master

Run cmds as following:
make DT_CHECKER_FLAGS=-m dt_binding_check
DT_SCHEMA_FILES=Documentation/devicetree/bindings/nvmem/mtk,efuse.yaml

make ARCH=arm64
dtbs_check DT_SCHEMA_FILES=Documentation/devicetree/bindings/nvmem/mtk,efuse.yaml

We mark the mediatek,mt8173-efuse and mediatek,efuse as deprecated to indicate
not use a signle compatible and should always use mediatek,efuse as generic
fallback.

changes since v2:
 - document deprecated efuse property
 - update efuse compatible fallbacks
 - add two PATCHs into series

changes since v1:
- change file name from mtk,efuse-yaml to mtk,efuse.yaml
- add efuse in commit title
- change compatible entries from const to enum

Allen-KH Cheng (3):
  dt-bindings: nvmem: mediatek: Convert efuse binding to YAML
  dt-bindings: nvmem: mediatek: document deprecated efuse property
  arm64: dts: mediatek: update efuse compatible fallbacks

 .../devicetree/bindings/nvmem/mtk,efuse.yaml  | 60 +++++++++++++++++++
 .../devicetree/bindings/nvmem/mtk-efuse.txt   | 43 -------------
 arch/arm64/boot/dts/mediatek/mt8173.dtsi      |  3 +-
 arch/arm64/boot/dts/mediatek/mt8192.dtsi      |  3 +-
 4 files changed, 64 insertions(+), 45 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/nvmem/mtk,efuse.yaml
 delete mode 100644 Documentation/devicetree/bindings/nvmem/mtk-efuse.txt

-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
