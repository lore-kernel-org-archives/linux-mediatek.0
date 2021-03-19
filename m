Return-Path: <SRS0=VEyR=IR=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 632DBC433E0
	for <linux-mediatek@archiver.kernel.org>; Fri, 19 Mar 2021 02:36:44 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0671264F1B
	for <linux-mediatek@archiver.kernel.org>; Fri, 19 Mar 2021 02:36:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0671264F1B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=iY44IJfOUP13+fzobSOd+uAXBsQ7vnu5rcXXAXbS1OA=; b=A3Uins3qoSYtTnblqGZJ24SwQ
	Da/pO9yIerpOITYVciO0gKsT6vOLElqua+3ajU9OYmZ/0GniUU8fkRb57v2xVyUqLDpNdMNl/5zVL
	gxnpDfNospV3FW3538CSMxGmzoGYAGkroRzlA2qX0RPRkzZhDmURvh1uEoE8B1Nv4q9a0UVFez9Dw
	8KimyCMEo3Mm1F8mA+9ZhXimG2uWYFrUHJkgO6KVUY4lSSGhjDsyZqsJmJ6+wb++7PBiXmuos4hgq
	5VWO+1yvOzze+fxKbt4gjs6nz8o0D7KnRVmC/axs0EeB3/jKwk5eEiqmJd9soF/geQ9RUEEILxb5O
	qjOnQf8BA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lN4zz-006KPV-6e; Fri, 19 Mar 2021 02:36:27 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lN4zc-006KIY-Qf; Fri, 19 Mar 2021 02:36:07 +0000
X-UUID: 6755b750b61749e69660c47e5bb2b604-20210318
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=oWXUIrTuB8f9CaodHD/O9xyOuJceKfRTRrji8+SReRc=; 
 b=h7/+0xjGp8j97G6nBzvPbT3A5EZPK8d1xarldDji/d+krAavSnu89RwHEK6+Zmojc7HE7rlOg+ZxGp2n/C76AasfWW3kKjwdGiXevsWA1o3vgU29djX8uNojLoAMo037h3zXJV7sAvH4xI/YifrSOiMbe65jWm/QNr2vOK9Bguk=;
X-UUID: 6755b750b61749e69660c47e5bb2b604-20210318
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <seiya.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 204301890; Thu, 18 Mar 2021 18:35:59 -0800
Received: from mtkmbs08n2.mediatek.inc (172.21.101.56) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 18 Mar 2021 19:35:58 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs08n2.mediatek.inc (172.21.101.56) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 19 Mar 2021 10:35:55 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Fri, 19 Mar 2021 10:35:56 +0800
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
Subject: [PATCH v2 4/8] dt-bindings: mmc: Add compatible for Mediatek MT8195
Date: Fri, 19 Mar 2021 10:34:23 +0800
Message-ID: <20210319023427.16711-6-seiya.wang@mediatek.com>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20210319023427.16711-1-seiya.wang@mediatek.com>
References: <20210319023427.16711-1-seiya.wang@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: F81013C1CF31E048E3834F52496B7E7A6E633820C41618BEEA21834B3A6E55492000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210319_023605_375900_00BBA421 
X-CRM114-Status: GOOD (  10.30  )
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

This commit adds dt-binding documentation of mmc for Mediatek MT8195 SoC
Platform.

Signed-off-by: Seiya Wang <seiya.wang@mediatek.com>
---
 Documentation/devicetree/bindings/mmc/mtk-sd.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mmc/mtk-sd.yaml b/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
index 01630b0ecea7..8648d48dbbfd 100644
--- a/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
+++ b/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
@@ -31,6 +31,7 @@ properties:
           - const: mediatek,mt2701-mmc
       - items:
           - const: mediatek,mt8192-mmc
+          - const: mediatek,mt8195-mmc
           - const: mediatek,mt8183-mmc
 
   clocks:
-- 
2.14.1
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
