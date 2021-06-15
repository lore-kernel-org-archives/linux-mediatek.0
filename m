Return-Path: <SRS0=q7ss=LJ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CACA7C48BE5
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Jun 2021 21:31:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 95FD060FEB
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Jun 2021 21:31:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 95FD060FEB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hHst4XAG02kzXyMsbcvzd/uhY7zevUs9fGbnpyvlU/w=; b=0nmt9/3z1NjPIe
	nTxrCQMINsPd1JxX9ffflSRiWKR+Y+/F7pSykeHmdQx5LxGRRBCDd3zm0FWS/SSiFHDntl8S3EO5d
	jijHDkgYoIXDUoryLOuWTZFHOG+R/jQReXMPlBwmpxRzI8tERMDe9WYqI2XUdpnWDUuYu4tEItvSK
	vSuYJVizVZhZw+OloD59MCKBlc+8dxpXvXaUBg1m8OL/hNNGppxSAhDrOkDPvoWSiqu2GvrBzQzDZ
	b3WjXHsEgyn9L/P/WAZKIr4EVDS8loZbrtZoCblbDnbv1MYmOkQxpins7jjV3dI/GFMPepeg0ByAq
	nWseZBZ79LZP6tFZEacA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ltGed-003Ags-Sq; Tue, 15 Jun 2021 21:31:28 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ltCvx-001lPz-Tg; Tue, 15 Jun 2021 17:33:07 +0000
X-UUID: 9a7dc60405a54614a70d3141b063dacb-20210615
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=QaMDBf+SGCNGX+/8RUbOymXsWFI2H8A+VJtlyL/FJcs=; 
 b=WqP1S/tdKHt1Og4j/tNLZNr0HiqmyPqto8x6VcDb+sr6BiITiE4FcTHX/adxosTASqr3LV8a7Y87e8Gu0UKVst/SoF4GzcGCWKnGPwEl3cq3AixLGXT11I58lMiG4DxOFYSQWEG0UdBE2n0/0/JwVK30pULWXoXLF+pInMaI5aY=;
X-UUID: 9a7dc60405a54614a70d3141b063dacb-20210615
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <tinghan.shen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1971045696; Tue, 15 Jun 2021 10:32:55 -0700
Received: from mtkmbs08n1.mediatek.inc (172.21.101.55) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 15 Jun 2021 10:32:54 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs08n1.mediatek.inc (172.21.101.55) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 16 Jun 2021 01:32:46 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 16 Jun 2021 01:32:46 +0800
From: Tinghan Shen <tinghan.shen@mediatek.com>
To: <robh+dt@kernel.org>, <matthias.bgg@gmail.com>
CC: <devicetree@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <srv_heupstream@mediatek.com>, <seiya.wang@mediatek.com>, <wenst@google.com>, 
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, Tinghan Shen
 <tinghan.shen@mediatek.com>
Subject: [PATCH 26/27] arm64: dts: mt8195: add scp device node
Date: Wed, 16 Jun 2021 01:32:32 +0800
Message-ID: <20210615173233.26682-26-tinghan.shen@mediatek.com>
X-Mailer: git-send-email 2.15.GIT
In-Reply-To: <20210615173233.26682-1-tinghan.shen@mediatek.com>
References: <20210615173233.26682-1-tinghan.shen@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210615_103306_046060_EEEA0342 
X-CRM114-Status: UNSURE (   9.60  )
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

add scp node for mt8195

Signed-off-by: Tinghan Shen <tinghan.shen@mediatek.com>
---
 arch/arm64/boot/dts/mediatek/mt8195.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8195.dtsi b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
index a98609989905..25a6ee7c6659 100644
--- a/arch/arm64/boot/dts/mediatek/mt8195.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
@@ -787,6 +787,16 @@
 			status = "disabled";
 		};
 
+		scp: scp@10500000 {
+			compatible = "mediatek,mt8195-scp";
+			reg = <0 0x10500000 0 0x100000>,
+			      <0 0x10700000 0 0x8000>,
+			      <0 0x10720000 0 0xe0000>;
+			reg-names = "sram", "l1tcm", "cfg";
+			interrupts = <GIC_SPI 462 IRQ_TYPE_LEVEL_HIGH 0>;
+			status = "okay";
+		};
+
 		scp_adsp: syscon@10720000 {
 			compatible = "mediatek,mt8195-scp_adsp", "syscon";
 			reg = <0 0x10720000 0 0x1000>;
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
