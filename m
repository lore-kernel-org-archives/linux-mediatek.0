Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 960F1C4332F
	for <linux-mediatek@archiver.kernel.org>; Mon, 25 Apr 2022 08:48:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=q9L9feJkG5HDSVg36vyua/cwD2uj8qd34lqDC/Zhs+g=; b=LIxyMgUVt3hnTN
	bJv207mOEY6Xy/LkoBif92C9oVjqym/UkEk4Yw3qmbpp7qKuqeph6biqrRLkYQreAq6ttJgAVkGot
	wPWMOknRZvDhn1vCyphbJaeckMSl/HMVS7Ti+GjELaBltcZq1iKkT3AoVW7t6s4dZy3EHZtUkQyV+
	7QUPyGX4MZP/lYmOFaS4iwOLU1QNZJU307zMumg5eRIuYPcXDyUVyIn2wdEFkcayuOPkzXAP3LhkJ
	fOQ8eZx2Cgfh9UGLYGOk55MgBrROAvs+zLX6z1BXcOhG+ze7zsTT1F6a12VixU+LdxlzVSND0FUhN
	kO/uQBSA1W9Mssa3Fd+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1niuOF-008o36-7l; Mon, 25 Apr 2022 08:48:15 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1niuOB-008o1W-Qd; Mon, 25 Apr 2022 08:48:13 +0000
X-UUID: 8865ab8532ac425580c67f59d3f09cbd-20220425
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.4, REQID:dc6562ec-2290-4bf7-93a5-1b51bf57f128, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:-20,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,AC
 TION:release,TS:-20
X-CID-META: VersionHash:faefae9, CLOUDID:801d03f0-06b0-4305-bfbf-554bfc9d151a,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,File:nil,QS:0,BEC:nil
X-UUID: 8865ab8532ac425580c67f59d3f09cbd-20220425
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <allen-kh.cheng@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1216180981; Mon, 25 Apr 2022 01:48:05 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 25 Apr 2022 01:48:03 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 25 Apr 2022 16:48:02 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Mon, 25 Apr 2022 16:48:02 +0800
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
Subject: [PATCH v2 0/1] dt-bindings: nvmem: mediatek: Convert mtk-efuse
 binding to YAML
Date: Mon, 25 Apr 2022 16:47:59 +0800
Message-ID: <20220425084800.2021-1-allen-kh.cheng@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220425_014811_900673_A5BD2652 
X-CRM114-Status: UNSURE (   8.52  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Convert MediaTek eFuse devicetree binding to YAML.

Based on tag: next-20220422, linux-next/master

make DT_CHECKER_FLAGS=-m dt_binding_check
DT_SCHEMA_FILES=Documentation/devicetree/bindings/nvmem/mtk,efuse.yaml

make ARCH=arm64
dtbs_check DT_SCHEMA_FILES=Documentation/devicetree/bindings/nvmem/mtk,efuse.yaml

changes since v1:
- change file name from mtk,efuse-yaml to mtk,efuse.yaml
- add mtk-efuse in commit title
- change compatible entries from const to enum

Allen-KH Cheng (1):
  dt-bindings: nvmem: mediatek: Convert mtk-efuse binding to YAML

 .../devicetree/bindings/nvmem/mtk,efuse.yaml  | 70 +++++++++++++++++++
 .../devicetree/bindings/nvmem/mtk-efuse.txt   | 43 ------------
 2 files changed, 70 insertions(+), 43 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/nvmem/mtk,efuse.yaml
 delete mode 100644 Documentation/devicetree/bindings/nvmem/mtk-efuse.txt

-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
