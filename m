Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7149FC6FA82
	for <linux-mediatek@archiver.kernel.org>; Fri, 23 Sep 2022 13:32:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=uaxXQyhnnM7G3kWVCzG8j/ehAVubR2JrOeMuyzBOWTI=; b=kIFxscCMQaKDHr5C4xhU4MNXLJ
	I8fR0U3lVfrNYFz10ImApPpNrRTpExKN3/uab47N8xDQ48IV5l3cy/LzHRrHljf3ZHfAao8IM35KX
	cnXNp9rPLwo6eJqCU0ZWxnAKXmk5VJi6ygdt615HW6INB9gtu4Wgcbcl+FRbyYaJ4V2wW6u5uzVOQ
	QwBoKZCRVrTO5TvmAY3dNvhsE+K02TPZVKm+pI/drWM52nom4Pz6begd70XQbBLOakXbTJUQr3ucQ
	2awLIHy1sThz9JgIzX7rtqfdpoISxr6I6pWFdG5DCBYAlJsRb7a3/FcDN9qPbAmwpounw/ISx0pvP
	ZN43FYnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obinG-004Rmi-DD; Fri, 23 Sep 2022 13:32:38 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obinD-004Rl5-Id; Fri, 23 Sep 2022 13:32:36 +0000
X-UUID: 4f2bdea68eaa4af5b1087e36b86637ee-20220923
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=uaxXQyhnnM7G3kWVCzG8j/ehAVubR2JrOeMuyzBOWTI=;
	b=ABs8wwG1GRho6Bd2IKifKFs3R5rNMVlINhReOV/hAfJiDzVlzEYyZC9ZDZ7e13T1d5GP9IGq+iSCX7gIPnA8NT7uICFEgXgjd3dRlmeuT1VWvgxv/x2I7OFVxdS7yWwg591XL6G2fpMiGkeKkqOcrx5vCjeQ+hHH4KKCTGZuGWU=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.11,REQID:cf6dd02b-5df0-425a-bb4e-d66b0ba0fd8e,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:39a5ff1,CLOUDID:d865dea2-dc04-435c-b19b-71e131a5fc35,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 4f2bdea68eaa4af5b1087e36b86637ee-20220923
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <allen-kh.cheng@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 936299232; Fri, 23 Sep 2022 06:32:26 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Fri, 23 Sep 2022 21:11:49 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Fri, 23 Sep 2022 21:11:49 +0800
From: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
To: Lee Jones <lee@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
	"Rob Herring" <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski@linaro.org>
CC: <Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
	<hsinyi@chromium.org>, Allen-KH Cheng <allen-kh.cheng@mediatek.com>
Subject: [PATCH 0/5] Add some driver nodes for MT8186 SoC
Date: Fri, 23 Sep 2022 21:11:43 +0800
Message-ID: <20220923131148.6678-1-allen-kh.cheng@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220923_063235_635718_DE3948BC 
X-CRM114-Status: UNSURE (   7.17  )
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

This series are based on linux next, tag: next-20220923.

Allen-KH Cheng (5):
  dt-bindings: mfd: mediatek: Add scpsys compatible for mt8186
  arm64: dts: mt8186: Add power domains controller
  arm64: dts: mt8186: Add IOMMU and SMI nodes
  arm64: dts: mt8186: Add dpi node
  arm64: dts: mt8186: Add xhci nodes

 .../bindings/mfd/mediatek,mt8195-scpsys.yaml  |   1 +
 arch/arm64/boot/dts/mediatek/mt8186.dtsi      | 421 ++++++++++++++++++
 2 files changed, 422 insertions(+)

-- 
2.18.0


