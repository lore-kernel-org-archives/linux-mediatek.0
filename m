Return-Path: <SRS0=3SR4=76=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8850DC433DF
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 Jun 2020 07:15:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2A88D206F1
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 Jun 2020 07:15:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="AvSDUFIT";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="MET7TKhf"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2A88D206F1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RRC5AM7mW6mzE90yA1IqUbGE+UMZAxqHFEMaywDBBJU=; b=AvSDUFITUBBfcy
	o2MbZsaYI2boOBs0py6hYLkT9mIiZa/2osoVLKpSTBhMQaWs6MPUxmCwSbQ34mbBmUPsXlT8Z9gGq
	d1meSgpa8ZcNbscl5ui9K596fUiCZjZZSY+FZNIY8BPX5fT3mMdIc6/adlOL8hN1i7Sqsn5GdDP9W
	yM2tgfUAbclC98VDyVrA6baZ4AWo/hdnsh+aqutcE2KY1ZeIh64lYdgkcxbEs3ikjO91x6iPUlRIM
	9v+JJmJ4VGbtiz6TRQI5a2SC30x1BS7UiHR2blPtJ9yQhaaVFIq3D2P3CaydvZj0wjhzYttJHQ+2j
	Kdik6F3KeLmw78zFl8aA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jlSIF-0002Lm-MP; Wed, 17 Jun 2020 07:15:31 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jlSID-0002Jo-6V; Wed, 17 Jun 2020 07:15:30 +0000
X-UUID: 76dc28f19efe437891a5be126773aaea-20200616
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=dGXGiunHjZndJ6cHTy/bVaVcZvEJmUdgQt8u80wNGMc=; 
 b=MET7TKhfpBhF5XHsrDOXFi56IE4aN8q4SZyjYvKxBJ4d4020JxdSogDIFN0m+c5Ea5EnFHjWf7NN5+r4z7oGqH/oHYjrVL6WLRegA5dGrH4pKpvHLL+hrQeGPJ89ZNdX2fTDX27jdH/w5lDARluzL6W6xXXVHwrA3zo7px6SBgs=;
X-UUID: 76dc28f19efe437891a5be126773aaea-20200616
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <weiyi.lu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 472515419; Tue, 16 Jun 2020 23:15:14 -0800
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 17 Jun 2020 00:05:23 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 17 Jun 2020 15:05:21 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 17 Jun 2020 15:05:22 +0800
From: Weiyi Lu <weiyi.lu@mediatek.com>
To: Enric Balletbo Serra <eballetbo@gmail.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, Nicolas Boichat <drinkcat@chromium.org>, "Rob
 Herring" <robh@kernel.org>, Sascha Hauer <kernel@pengutronix.de>
Subject: [PATCH v16 01/11] dt-bindings: mediatek: Add property to mt8183
 smi-common
Date: Wed, 17 Jun 2020 15:05:07 +0800
Message-ID: <1592377517-14817-2-git-send-email-weiyi.lu@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1592377517-14817-1-git-send-email-weiyi.lu@mediatek.com>
References: <1592377517-14817-1-git-send-email-weiyi.lu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200617_001529_250649_89EEA63C 
X-CRM114-Status: UNSURE (   9.71  )
X-CRM114-Notice: Please train this message.
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
Cc: James Liao <jamesjj.liao@mediatek.com>, Weiyi Lu <weiyi.lu@mediatek.com>,
 srv_heupstream@mediatek.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Fan Chen <fan.chen@mediatek.com>,
 linux-mediatek@lists.infradead.org, Wendell Lin <wendell.lin@mediatek.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

For scpsys driver using regmap based syscon driver API.

Signed-off-by: Weiyi Lu <weiyi.lu@mediatek.com>
Acked-by: Rob Herring <robh@kernel.org>
---
 .../devicetree/bindings/memory-controllers/mediatek,smi-common.txt      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/memory-controllers/mediatek,smi-common.txt b/Documentation/devicetree/bindings/memory-controllers/mediatek,smi-common.txt
index b478ade..01744ec 100644
--- a/Documentation/devicetree/bindings/memory-controllers/mediatek,smi-common.txt
+++ b/Documentation/devicetree/bindings/memory-controllers/mediatek,smi-common.txt
@@ -20,7 +20,7 @@ Required properties:
 	"mediatek,mt2712-smi-common"
 	"mediatek,mt7623-smi-common", "mediatek,mt2701-smi-common"
 	"mediatek,mt8173-smi-common"
-	"mediatek,mt8183-smi-common"
+	"mediatek,mt8183-smi-common", "syscon"
 - reg : the register and size of the SMI block.
 - power-domains : a phandle to the power domain of this local arbiter.
 - clocks : Must contain an entry for each entry in clock-names.
-- 
1.8.1.1.dirty
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
