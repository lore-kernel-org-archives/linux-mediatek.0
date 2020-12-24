Return-Path: <SRS0=bfHw=F4=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B651CC433DB
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Dec 2020 06:20:09 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 41A2022AAA
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Dec 2020 06:20:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 41A2022AAA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=0RXJNZ9aZ54vAeO5sPvmdPs7NheHBx+Xsifs+j83fsY=; b=OUcH+JlJEJcArr/+s1ooc0KI7
	sK80WGAMuwKccLCd6WoDhW1rlY02NxScACwHClVk8w5DiUaUKSAdqaKAWqg1Y6/JIzf3qVZwlDvlZ
	kAL00v9m0ZW1uCl3zr2GTdpz70+Y1BhzUKdaxs9UAGtTw6IQGx17o1SZj1s6GB7W1cm3yy/mSlPhY
	EAXRcRvlaEN6kOgUPxnHJLK06FHV/BpZ7hDuRQ1jck7IiDCQJ0DaTvvmQNULpAoe/USif2qmetJ4F
	fCj9t0zu8SxCE/9++W4N9Y8Eyo21+ER0JwYym7K/74eEc1HAV6+eq2qZxEk6m5R4dKnmUXtIidZFf
	AciIs3sJQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ksJyf-0008Bu-8V; Thu, 24 Dec 2020 06:19:57 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ksJxv-0007kL-Ic; Thu, 24 Dec 2020 06:19:14 +0000
X-UUID: ea28c124fdef498aac52b1f9b2a29cd9-20201223
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=zokDODpcvg7GhJq+oFZHSTeVe/rufEJfVuTP/9fgDho=; 
 b=j0V36gyss9DlwqgRN9nX61eQn5QbPi1+1WiJN9F01KCqtaVjR0+2jQipSTQRHil7p6dxtZ+sQthn9LqobX//zSoqtKGDLGZcrkgtRXkp4ihngaLaklhsjKHYznGCnaQ5HdA6BD3ds/04SEdIoXc/xYa/JaMkLk/+/WdfANfow4A=;
X-UUID: ea28c124fdef498aac52b1f9b2a29cd9-20201223
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <henryc.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1166108841; Wed, 23 Dec 2020 22:19:09 -0800
Received: from MTKMBS02N1.mediatek.inc (172.21.101.77) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 23 Dec 2020 22:09:06 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs02n1.mediatek.inc (172.21.101.77) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 24 Dec 2020 14:08:58 +0800
Received: from mtksdaap41.mediatek.inc (172.21.77.4) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 24 Dec 2020 14:08:58 +0800
From: Henry Chen <henryc.chen@mediatek.com>
To: Georgi Djakov <georgi.djakov@linaro.org>, Rob Herring
 <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, Stephen Boyd
 <swboyd@chromium.org>, Ryan Case <ryandcase@chromium.org>, Mark Brown
 <broonie@kernel.org>
Subject: [PATCH V6 09/13] arm64: dts: mt8183: add dvfsrc related nodes
Date: Thu, 24 Dec 2020 14:08:50 +0800
Message-ID: <1608790134-27425-10-git-send-email-henryc.chen@mediatek.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1608790134-27425-1-git-send-email-henryc.chen@mediatek.com>
References: <1608790134-27425-1-git-send-email-henryc.chen@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201224_011912_749708_31DDFECD 
X-CRM114-Status: GOOD (  13.86  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Mark Rutland <mark.rutland@arm.com>, Nicolas Boichat <drinkcat@google.com>,
 devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, Henry Chen <henryc.chen@mediatek.com>,
 Fan Chen <fan.chen@mediatek.com>, linux-mediatek@lists.infradead.org,
 Arvin Wang <arvin.wang@mediatek.com>, James Liao <jamesjj.liao@mediatek.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add DDR EMI provider dictating dram interconnect bus performance found on
MT8183-based platforms

Signed-off-by: Henry Chen <henryc.chen@mediatek.com>
---
 arch/arm64/boot/dts/mediatek/mt8183.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8183.dtsi b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
index 06ef8e0..22b3a68 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
@@ -11,6 +11,7 @@
 #include <dt-bindings/reset-controller/mt8183-resets.h>
 #include <dt-bindings/phy/phy.h>
 #include "mt8183-pinfunc.h"
+#include <dt-bindings/interconnect/mtk,mt8183-emi.h>
 
 / {
 	compatible = "mediatek,mt8183";
@@ -331,6 +332,7 @@
 		ddr_emi: dvfsrc@10012000 {
 			compatible = "mediatek,mt8183-dvfsrc";
 			reg = <0 0x10012000 0 0x1000>;
+			#interconnect-cells = <1>;
 		};
 
 		pwrap: pwrap@1000d000 {
-- 
1.9.1
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
