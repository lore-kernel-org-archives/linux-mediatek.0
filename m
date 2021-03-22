Return-Path: <SRS0=pLce=IU=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF964C433C1
	for <linux-mediatek@archiver.kernel.org>; Mon, 22 Mar 2021 03:25:18 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5FE0561939
	for <linux-mediatek@archiver.kernel.org>; Mon, 22 Mar 2021 03:25:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5FE0561939
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=nX1iXhAv7acAd9uvS/l7EU4Y5TXKfd/pNswVddAKKIw=; b=OcxA36YMbOJYMXQPHjairhZxu
	WxSRNk3YURgOOFXp9QY7rLk4Yp0Dcv0DkYJnCSvURgjJjv9Yy6nNQ42OoiXhfOVhj7E91jWThBsvf
	ITpGL/C4xSqEqivHQwtz86zgpYJ6mvDIG4LtSFsOnJI4+P23L9QFQ7QbDB9+rs5R9JN1Sy+SDQrpk
	2vVJW1OM42ILIqnrmnH/TRIqEVP9yqBATpbOthFYNn2DP2i+Wy6aYP0oynWZ2JWBTo1C/6buufL96
	m2v29yJufNOQcH/369I/1sZi/Txx1OHxNNDWNYXzjasm/fzIKDCUdDh1JPoqGNIfz26ptctJkVgeC
	sytSOhQ8w==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lOBBh-00AmBe-Ts; Mon, 22 Mar 2021 03:25:06 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lOBAi-00Alyy-Or; Mon, 22 Mar 2021 03:24:12 +0000
X-UUID: 8d521ca4f292495cb38f81292f9c5d50-20210321
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=DzqTjM0jd5F//YULfIlrkKYKvIN+/WhonxmaIo1eliM=; 
 b=mQyPCEY+xsOSxgrjLpxMd6jLXk9axCjHQx2ZwVtIHwnP1aN9XZAyH5x5BjJ4Fi5xQYm37HU0rCFafFmZ90fd7nY7hRCR16STB68gmJfr2C8eZ3o7q6oWDDJAx3lWsCaCJkK8zDAxiw4T4nQdOYxloM9LgoWyHvYrCtJ97yBaVPM=;
X-UUID: 8d521ca4f292495cb38f81292f9c5d50-20210321
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1885327437; Sun, 21 Mar 2021 19:24:00 -0800
Received: from MTKMBS06N1.mediatek.inc (172.21.101.129) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 21 Mar 2021 20:14:04 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs06n1.mediatek.inc (172.21.101.129) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 22 Mar 2021 11:14:04 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 22 Mar 2021 11:14:03 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring
 <robh+dt@kernel.org>, Mathias Nyman <mathias.nyman@intel.com>
CC: Chunfeng Yun <chunfeng.yun@mediatek.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, <linux-usb@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>, Eddie Hung
 <eddie.hung@mediatek.com>, Nicolas Boichat <drinkcat@chromium.org>
Subject: [PATCH 13/13] arm64: dts: mt8183: update wakeup register offset
Date: Mon, 22 Mar 2021 11:13:52 +0800
Message-ID: <1616382832-28450-13-git-send-email-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1616382832-28450-1-git-send-email-chunfeng.yun@mediatek.com>
References: <1616382832-28450-1-git-send-email-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210322_032407_819483_0AB5FC5E 
X-CRM114-Status: GOOD (  11.79  )
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

Use wakeup control register offset exactly, and update revision
number

Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
 arch/arm64/boot/dts/mediatek/mt8183.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8183.dtsi b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
index 80519a145f13..9d18a938150c 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
@@ -874,7 +874,7 @@
 			clocks = <&infracfg CLK_INFRA_UNIPRO_SCK>,
 				 <&infracfg CLK_INFRA_USB>;
 			clock-names = "sys_ck", "ref_ck";
-			mediatek,syscon-wakeup = <&pericfg 0x400 0>;
+			mediatek,syscon-wakeup = <&pericfg 0x420 11>;
 			#address-cells = <2>;
 			#size-cells = <2>;
 			ranges;
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
