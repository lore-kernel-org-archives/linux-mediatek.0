Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F33AC6FA8E
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Mar 2023 01:59:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=NPDcbWjUVSoLLjMtO/Z1QwJgNEyxQ1YYYXl9gvsi2R0=; b=C5DnEWiMZ0/5sxBDqMYUd2YH9L
	7TvVp+QfZKCGgeiUHmCOtTxTt7Iduy817VbKBWc7kzuaehPrxAWYSfSL7Hl58bLdXOW7K0gIEuYM7
	2cekFnS+LJYf35vBD68LbLzJww4ujIiBSCvdkzMPFXWxP8sOYFHc9vSMLtAIY2ZkNmSu9jIAK7zqW
	UpqRUWQaGovP4SX5LPzjSYVnFWeS+8D4fK7/TKCiO44b6WIkS+knnKPlzdzLp4LwbA4mIuK1Jh+Lt
	E0cYjqtMeQXSstQbJQYKjvJjlB8V/xXZXdQCrwcng63XPfO8lSl0M8CVaToW4hG6/Q9t1BgsQ6nX0
	GH3R7p8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXuhi-004MKo-3k; Fri, 03 Mar 2023 01:59:26 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXuhf-004MKN-Ta; Fri, 03 Mar 2023 01:59:25 +0000
X-UUID: 02a1119ab96711eda08d4d6090ec5a5c-20230302
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=NPDcbWjUVSoLLjMtO/Z1QwJgNEyxQ1YYYXl9gvsi2R0=;
	b=mwVx8okudEN/QBfAKR/FusnfwemjkOe5nZJnJih36Hv7O8m9RIK9WygvzSfe8vnZsaX6exbl4+U2G72CXoPnVJKJDsoN6hXSDmujTTjIXi6a5bXMBBURloxt77aXfI4WMCi1OZqdeDBo5jqFAdUK4W0FL4ui8JBTV9HalrsgIXs=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.20,REQID:70a2a58f-849e-43b9-9177-8f1298c64cc5,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:25b5999,CLOUDID:54eb9bf4-ddba-41c3-91d9-10eeade8eac7,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0
X-CID-BVR: 0
X-UUID: 02a1119ab96711eda08d4d6090ec5a5c-20230302
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <allen-kh.cheng@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 772252173; Thu, 02 Mar 2023 18:59:19 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.25; Fri, 3 Mar 2023 09:38:44 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.25 via Frontend Transport; Fri, 3 Mar 2023 09:38:44 +0800
From: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>, "Krzysztof
 Kozlowski" <krzysztof.kozlowski+dt@linaro.org>
CC: <Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-mediatek@lists.infradead.org>, <yunfei.dong@mediatek.com>, "Allen-KH
 Cheng" <allen-kh.cheng@mediatek.com>
Subject: [RESEND 0/6] media: mediatek: Update video decoder nodes for MT8195 and MT8192
Date: Fri, 3 Mar 2023 09:38:36 +0800
Message-ID: <20230303013842.23259-1-allen-kh.cheng@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230302_175923_993899_02D4FEF8 
X-CRM114-Status: UNSURE (   8.08  )
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

This series is based on matthias github v6.3-tmp. Since there is a
dependence in the following series, I resend a series for them.

patchwork.kernel.org/project/linux-mediatek/list/?series=702423
patchwork.kernel.org/project/linux-mediatek/list/?series=702078

Allen-KH Cheng (3):
  media: dt-bindings: media: mediatek: Rename child node names for
    decoder
  media: dt-bindings: media: mediatek: Remove "dma-ranges" property for
    decoder
  arm64: dts: mt8192: Add video-codec nodes

Yunfei Dong (3):
  media: dt-bindings: media: mediatek: vcodec: adapt to the
    'clock-names' of different platforms
  media: dt-bindings: media: mediatek: vcodec: Change the max reg value
    to 2
  arm64: dts: mt8195: Add video decoder node

 .../media/mediatek,vcodec-subdev-decoder.yaml | 113 +++++++-----------
 arch/arm64/boot/dts/mediatek/mt8192.dtsi      |  59 +++++++++
 arch/arm64/boot/dts/mediatek/mt8195.dtsi      |  70 +++++++++++
 3 files changed, 173 insertions(+), 69 deletions(-)

-- 
2.18.0


