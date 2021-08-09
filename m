Return-Path: <SRS0=Eo9X=NA=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-22.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6F8AC4338F
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Aug 2021 03:09:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 54D346069E
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Aug 2021 03:09:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 54D346069E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=p6Ac5jYW9jv0j9pu12RTo7jzfoOqepngw8lFvpywIIo=; b=1fqjOg3/4mrX32
	uqrj8GButVwHuw3pCHA8ShgwvfDfObq0otdzvvOQwZSaj8MhNsC4MFww3i/HjkEYH4Lnu5iF9rCto
	e8g9AAgHxFStZdrY+92/vguqxgPc+sI9QrVDWGgs+Ohogo44ilpVXoxvx/Lefad/Mtwyir1+YIJb4
	UPOb8hxsf0rlxe/pdpaLbzZGhb9OXIwYTKjR73YJ/ANyEyME13ZqKAqpqE1KqAPKyPxKZHB19iVAo
	/rVafeSb9wkL46M5eS5kTXZSed/UrRgQKp2FkF3GJlX37PyZDDdiRmtHczFIF+ZXr8GilAnMl5i9m
	OG8MExvBEa3VFwPMiaow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mCvf4-00GyB3-SS; Mon, 09 Aug 2021 03:09:10 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mCveh-00Gy5d-CJ; Mon, 09 Aug 2021 03:08:49 +0000
X-UUID: a42c92a58a304feb836a63ce3de8ef74-20210808
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=4wbncosZGckzcvqXepc+aS9hIjgQJAVMd+QrAfJrStk=; 
 b=qtcNPuVKQa1GnZy8JnIhvvFNUImvCSSRAW5OIHWCEo2XV2L2crNLjm86vByVxqaMI+DiNulouqQEirHk25hRxiCpoIcP/6Eb3Rr6zMDpt3k6alIz4ZWGp1NAoCJ87Lrup/LHyhyxo4bXIhsbgtoKLE5Q5oVBpFbcONPKW1yJTGw=;
X-UUID: a42c92a58a304feb836a63ce3de8ef74-20210808
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <nina-cm.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1703593299; Sun, 08 Aug 2021 20:08:44 -0700
Received: from MTKMBS02N2.mediatek.inc (172.21.101.101) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 8 Aug 2021 20:08:42 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs02n2.mediatek.inc (172.21.101.101) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 9 Aug 2021 11:08:39 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Mon, 9 Aug 2021 11:08:39 +0800
From: Nina Wu <nina-cm.wu@mediatek.com>
To: 
CC: Rob Herring <robh+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Nina Wu <Nina-CM.Wu@mediatek.com>, Neal Liu
 <neal.liu@mediatek.com>, Zhen Lei <thunder.leizhen@huawei.com>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <srv_heupstream@mediatek.com>, <Jackson-kt.Chang@mediatek.com>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [v4 7/7] arm64: dts: mt8192: Add devapc node
Date: Mon, 9 Aug 2021 11:08:19 +0800
Message-ID: <1628478499-29460-7-git-send-email-nina-cm.wu@mediatek.com>
X-Mailer: git-send-email 2.6.4
In-Reply-To: <1628478499-29460-1-git-send-email-nina-cm.wu@mediatek.com>
References: <1628478499-29460-1-git-send-email-nina-cm.wu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210808_200847_467139_02D3F505 
X-CRM114-Status: GOOD (  11.33  )
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

From: Nina Wu <Nina-CM.Wu@mediatek.com>

Add devapc nodes to mt8192.

Signed-off-by: Nina Wu <Nina-CM.Wu@mediatek.com>
---
This patch depends on "Add dt-bindings of MT8192 clocks" [1]
and "Add mt8192 clock controllers" [2]

[1] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/include/dt-bindings/clock/mt8192-clk.h?h=next-20210806&id=f35f1a23e0e12e3173e9e9dedbc150d139027189
[2] https://patchwork.kernel.org/project/linux-mediatek/patch/20210727023205.20319-2-chun-jie.chen@mediatek.com/
---
 arch/arm64/boot/dts/mediatek/mt8192.dtsi | 36 ++++++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8192.dtsi b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
index 6b22441..accbd07 100644
--- a/arch/arm64/boot/dts/mediatek/mt8192.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
@@ -517,6 +517,33 @@
 			clock-names = "clk13m";
 		};
 
+		devapc_infra: devapc@10207000 {
+			compatible = "mediatek,mt8192-devapc";
+			reg = <0 0x10207000 0 0x1000>;
+			vio-idx-num = <367>;
+			interrupts = <GIC_SPI 187 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&infracfg CLK_INFRA_DEVICE_APC>;
+			clock-names = "devapc-infra-clock";
+		};
+
+		devapc_peri: devapc@10274000 {
+			compatible = "mediatek,mt8192-devapc";
+			reg = <0 0x10274000 0 0x1000>;
+			vio-idx-num = <292>;
+			interrupts = <GIC_SPI 187 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&infracfg CLK_INFRA_DEVICE_APC>;
+			clock-names = "devapc-infra-clock";
+		};
+
+		devapc_peri2: devapc@10275000 {
+			compatible = "mediatek,mt8192-devapc";
+			reg = <0 0x10275000 0 0x1000>;
+			vio-idx-num = <242>;
+			interrupts = <GIC_SPI 187 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&infracfg CLK_INFRA_DEVICE_APC>;
+			clock-names = "devapc-infra-clock";
+		};
+
 		scp_adsp: clock-controller@10720000 {
 			compatible = "mediatek,mt8192-scp_adsp";
 			reg = <0 0x10720000 0 0x1000>;
@@ -661,6 +688,15 @@
 			status = "disabled";
 		};
 
+		devapc_peri_par: devapc@11020000 {
+			compatible = "mediatek,mt8192-devapc";
+			reg = <0 0x11020000 0 0x1000>;
+			vio-idx-num = <58>;
+			interrupts = <GIC_SPI 187 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&infracfg CLK_INFRA_DEVICE_APC>;
+			clock-names = "devapc-infra-clock";
+		};
+
 		nor_flash: spi@11234000 {
 			compatible = "mediatek,mt8192-nor";
 			reg = <0 0x11234000 0 0xe0>;
-- 
2.6.4
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
