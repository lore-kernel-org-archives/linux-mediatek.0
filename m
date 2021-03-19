Return-Path: <SRS0=VEyR=IR=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D20DC433E0
	for <linux-mediatek@archiver.kernel.org>; Fri, 19 Mar 2021 02:35:56 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 154E964F18
	for <linux-mediatek@archiver.kernel.org>; Fri, 19 Mar 2021 02:35:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 154E964F18
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=mkh3sgRvZzF8xB9ugZRyaSBOL3N6UitI/aKl+BWbzwo=; b=Rw7pBhjSpBOJcRUX/e8P1D57T
	Z3QocC6XPTelDdjLxqEheAONhRds/lkcgkRq3qAUrlgEMeUxMsGaajqe56ffjMRqOBpWmqEOaPTd4
	+33RQOmP0w7cX92C3h47Gre0PHKHtagrCvL9WYEhT6/6UCwCEdJ4bpYpxcqay2o4vuMaRIiS0ZvjX
	W2EYvT8QHNbN104FFlqcCL0qY2vxrHkuUlhn7AVhy54RlGL5VfV3A1fgT9jmYZA6sMYfZwKH/ZzPR
	UJEeo0QEzyZO6bMEs/xae4s3pQq4JVrhJC0id8iGxJEk7XCgb94yiTsTo4e8+vul66gwPpeeTreuc
	K65WLWqdQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lN4zJ-006KDU-Mi; Fri, 19 Mar 2021 02:35:45 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lN4z8-006KAX-P2; Fri, 19 Mar 2021 02:35:37 +0000
X-UUID: f47347c55c404d38b9be52bb68258ae3-20210318
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=TPywVyVM07bg4NfW3WaoV7LBQTHfjGbHGXbJQ5oYAUs=; 
 b=qqzpdbDRu2w8D6rOxv+kkH2j6OJqvtwVAEVUri6bZbc7ENx1i6ZkVPgSrRk7+7NgGqG/ZqTjMndES4fVwbpyBbaTLnF09vs+yfd+jF9wQlNpXU7soTn0nBBCASdi5MnExKxOYI16Lpx01075PZX573YpiRWUJUufue8caoixx6E=;
X-UUID: f47347c55c404d38b9be52bb68258ae3-20210318
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <seiya.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 2070714150; Thu, 18 Mar 2021 18:35:29 -0800
Received: from mtkmbs08n2.mediatek.inc (172.21.101.56) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 18 Mar 2021 19:35:28 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs08n2.mediatek.inc (172.21.101.56) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 19 Mar 2021 10:35:25 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Fri, 19 Mar 2021 10:35:26 +0800
From: Seiya Wang <seiya.wang@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
CC: Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>, 
 Peter Meerwald-Stadler <pmeerw@pmeerw.net>, Ulf Hansson
 <ulf.hansson@linaro.org>, Chunfeng Yun <chunfeng.yun@mediatek.com>, "Kishon
 Vijay Abraham I" <kishon@ti.com>, Vinod Koul <vkoul@kernel.org>, "Greg
 Kroah-Hartman" <gregkh@linuxfoundation.org>, Daniel Lezcano
 <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, "Wim Van
 Sebroeck" <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>,
 "Enric Balletbo i Serra" <enric.balletbo@collabora.com>, Hsin-Yi Wang
 <hsinyi@chromium.org>, Seiya Wang <seiya.wang@mediatek.com>, Fabien Parent
 <fparent@baylibre.com>, Sean Wang <sean.wang@mediatek.com>, Zhiyong Tao
 <zhiyong.tao@mediatek.com>, Chaotian Jing <chaotian.jing@mediatek.com>,
 Wenbin Mei <wenbin.mei@mediatek.com>, Stanley Chu <stanley.chu@mediatek.com>, 
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-iio@vger.kernel.org>, <linux-mmc@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <linux-serial@vger.kernel.org>, <linux-watchdog@vger.kernel.org>,
 <srv_heupstream@mediatek.com>
Subject: [PATCH v2 2/8] dt-bindings: serial: Add compatible for Mediatek MT8195
Date: Fri, 19 Mar 2021 10:34:21 +0800
Message-ID: <20210319023427.16711-4-seiya.wang@mediatek.com>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20210319023427.16711-1-seiya.wang@mediatek.com>
References: <20210319023427.16711-1-seiya.wang@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: 540AFE12FAD822E71F8C8D9874E621CED93BA9E0973FCA8DAA5461B6339CCF2C2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210319_023535_838509_84CEC2F8 
X-CRM114-Status: GOOD (  10.61  )
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

This commit adds dt-binding documentation of uart for Mediatek MT8195 SoC
Platform.

Signed-off-by: Seiya Wang <seiya.wang@mediatek.com>
---
 Documentation/devicetree/bindings/serial/mtk-uart.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/serial/mtk-uart.txt b/Documentation/devicetree/bindings/serial/mtk-uart.txt
index 647b5aee86f3..64c4fb59acd1 100644
--- a/Documentation/devicetree/bindings/serial/mtk-uart.txt
+++ b/Documentation/devicetree/bindings/serial/mtk-uart.txt
@@ -20,6 +20,7 @@ Required properties:
   * "mediatek,mt8173-uart" for MT8173 compatible UARTS
   * "mediatek,mt8183-uart", "mediatek,mt6577-uart" for MT8183 compatible UARTS
   * "mediatek,mt8192-uart", "mediatek,mt6577-uart" for MT8192 compatible UARTS
+  * "mediatek,mt8195-uart", "mediatek,mt6577-uart" for MT8195 compatible UARTS
   * "mediatek,mt8516-uart" for MT8516 compatible UARTS
   * "mediatek,mt6577-uart" for MT6577 and all of the above
 
-- 
2.14.1
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
