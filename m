Return-Path: <SRS0=yOeO=IO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2162C433E0
	for <linux-mediatek@archiver.kernel.org>; Tue, 16 Mar 2021 11:16:18 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7C3A965023
	for <linux-mediatek@archiver.kernel.org>; Tue, 16 Mar 2021 11:16:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7C3A965023
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=iY44IJfOUP13+fzobSOd+uAXBsQ7vnu5rcXXAXbS1OA=; b=kaUhBH/eKamv9ILN6f+03PfwG
	I1/IpnE11PN4cJM+5lAH6XfXgTW9f9CXVPlyPSvrHocMNr/q9ZAbxgFTlmYE1FdXxLhYmVVf8S3Ge
	t0ryA252M4D2TK6tDTbe6c+8xwONU9IqgR0RsfzuzWECJhhHWRMoVQxMurL8aSN2PoNmllITPN+l0
	idacga6iaCGMC+BOJi86Rgazi1gr9UlJ6CBEIZ9F6TCUdwq3YsVrI0vjTjEOvWgoVDYdWCnyOBZAi
	YceauUMjozk2P5Ah3aqX0xajrTE/aAoV47mS7A67JQC4+l48zTx5xl5XxBbW+t03Xv/acuMTUaezl
	ZDzkjn1IA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lM7gK-000WyX-9Z; Tue, 16 Mar 2021 11:16:12 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lM7fj-000Wnb-EV; Tue, 16 Mar 2021 11:15:38 +0000
X-UUID: 36d390378fc2459c874a29bb6f11bda0-20210316
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=oWXUIrTuB8f9CaodHD/O9xyOuJceKfRTRrji8+SReRc=; 
 b=RhSDDdkToR3sKDZS61M91Tr+stGJOsn1qCICMymrJm+3/mhJomCpwccRNSDNfUqFTfh1Kf1XMOn0CkGfPcXS3nUwdoux9bSyhXQRxNnTqA6oyECwhL51vQaB1bOh91t0hJ7HmlgZOdzwYl+Mr9rUTJAip5vwZP61zAP0LtsVEH0=;
X-UUID: 36d390378fc2459c874a29bb6f11bda0-20210316
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <seiya.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 188709361; Tue, 16 Mar 2021 03:15:32 -0800
Received: from mtkmbs08n2.mediatek.inc (172.21.101.56) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 16 Mar 2021 04:15:30 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs08n2.mediatek.inc (172.21.101.56) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 16 Mar 2021 19:15:28 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Tue, 16 Mar 2021 19:15:28 +0800
From: Seiya Wang <seiya.wang@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
CC: Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>, 
 Peter Meerwald-Stadler <pmeerw@pmeerw.net>, Ulf Hansson
 <ulf.hansson@linaro.org>, Chunfeng Yun <chunfeng.yun@mediatek.com>, "Kishon
 Vijay Abraham I" <kishon@ti.com>, Vinod Koul <vkoul@kernel.org>, "Greg
 Kroah-Hartman" <gregkh@linuxfoundation.org>, Mark Brown <broonie@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner
 <tglx@linutronix.de>, Wim Van Sebroeck <wim@linux-watchdog.org>, "Guenter
 Roeck" <linux@roeck-us.net>, Enric Balletbo i Serra
 <enric.balletbo@collabora.com>, Hsin-Yi Wang <hsinyi@chromium.org>, "Seiya
 Wang" <seiya.wang@mediatek.com>, Fabien Parent <fparent@baylibre.com>, "Sean
 Wang" <sean.wang@mediatek.com>, Zhiyong Tao <zhiyong.tao@mediatek.com>,
 Chaotian Jing <chaotian.jing@mediatek.com>, Wenbin Mei
 <wenbin.mei@mediatek.com>, Stanley Chu <stanley.chu@mediatek.com>, Bayi Cheng
 <bayi.cheng@mediatek.com>, Chuanhong Guo <gch981213@gmail.com>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-iio@vger.kernel.org>, <linux-mmc@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <linux-serial@vger.kernel.org>, <linux-spi@vger.kernel.org>,
 <linux-watchdog@vger.kernel.org>, <srv_heupstream@mediatek.com>
Subject: [PATCH 04/10] dt-bindings: mmc: Add compatible for Mediatek MT8195
Date: Tue, 16 Mar 2021 19:14:37 +0800
Message-ID: <20210316111443.3332-5-seiya.wang@mediatek.com>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20210316111443.3332-1-seiya.wang@mediatek.com>
References: <20210316111443.3332-1-seiya.wang@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: 40EFA065568D92D6DF6C39E654DC24CB95C56C62A7E2E2FEE8C06C69D71643032000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210316_111535_858001_FD91B127 
X-CRM114-Status: GOOD (  10.42  )
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
