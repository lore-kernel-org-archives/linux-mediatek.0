Return-Path: <SRS0=tEpm=NI=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FE48C432BE
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Aug 2021 07:52:08 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1CE1A60EFF
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Aug 2021 07:52:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1CE1A60EFF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=90hMhr6iqyYAJzp7OqQ2LxG4MJYP2m+UsG8qXITWYNw=; b=QpUWe8Rj2vipIq
	4O/17sQrYICuB4Qo1GtRL8FZZblQ0MVzwFMqRVUjG5CP6GeRHqbmTMb58ozBgrg+tZIs+G0FCV7VW
	9xuvTt6V5CjUv60o3v/M+zBrLm5PNUIfKvKGNLbwC7A+cZk71wwMYE242wpRwzXoe5/oUCQo9ryGO
	z4SJkmc5HT0dde4r+kaloxyRFpUPKy4A0to3ArduPczp04R1q5qL6zcyPMf4E3tV73ex3h/tBk9L4
	enWrSyBDdbdvpKTjVqlzA4uk5VePv6bmrk+LP8uwVwjvXYAp9jjHaO7o46Lqmo99Ye9XPV7HUgSxN
	K3cxkYU5juBcybM7+d5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mFtt6-001PW4-14; Tue, 17 Aug 2021 07:51:56 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mFto6-001MqZ-IN; Tue, 17 Aug 2021 07:46:49 +0000
X-UUID: c7f8c39baf264833a47398d3031e05cf-20210817
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=PZCYmSWKFeNOAQgoGXh5LWuVLlklmsaz3/B44bmP/o4=; 
 b=tItc1utl6G9OYcpG9rdkGQXT1vKW1ttlR6aixnBqSvjOX7b/nPVC3kzPjtcmqMTPvkMQDzjHL3F7aFLA1k+KmCDNwmhalW/MiI/BMNipr5c2I7UYtpu10ujIFo5uxl9rHJ2DkvaIkdGJ48c3KqOt8hUlmQz/NSDZmEHSmBDqpak=;
X-UUID: c7f8c39baf264833a47398d3031e05cf-20210817
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <sam.shih@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1910520685; Tue, 17 Aug 2021 00:46:43 -0700
Received: from mtkexhb02.mediatek.inc (172.21.101.103) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 17 Aug 2021 00:46:43 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by mtkexhb02.mediatek.inc
 (172.21.101.103) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Tue, 17 Aug 2021 15:46:29 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Tue, 17 Aug 2021 15:46:29 +0800
From: Sam Shih <sam.shih@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Sean Wang <sean.wang@kernel.org>, "Linus
 Walleij" <linus.walleij@linaro.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Matt Mackall <mpm@selenic.com>, Herbert Xu
 <herbert@gondor.apana.org.au>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Wim Van Sebroeck <wim@linux-watchdog.org>,
 Guenter Roeck <linux@roeck-us.net>, Michael Turquette
 <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Hsin-Yi Wang
 <hsinyi@chromium.org>, Enric Balletbo i Serra <enric.balletbo@collabora.com>, 
 Fabien Parent <fparent@baylibre.com>, Seiya Wang <seiya.wang@mediatek.com>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>, <linux-gpio@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-crypto@vger.kernel.org>,
 <linux-serial@vger.kernel.org>, <linux-watchdog@vger.kernel.org>,
 <linux-clk@vger.kernel.org>
CC: John Crispin <john@phrozen.org>, Ryder Lee <Ryder.Lee@mediatek.com>, "Sam
 Shih" <sam.shih@mediatek.com>
Subject: [v2,08/12] dt-bindings: rng: mediatek: add mt7986 to mtk rng binding
Date: Tue, 17 Aug 2021 15:45:53 +0800
Message-ID: <20210817074557.30953-9-sam.shih@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210817074557.30953-1-sam.shih@mediatek.com>
References: <20210817074557.30953-1-sam.shih@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210817_004646_700508_8024CDC0 
X-CRM114-Status: UNSURE (   9.19  )
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

Add RNG binding for MT7986 SoC.

Signed-off-by: Sam Shih <sam.shih@mediatek.com>

---
v2: patch v1 has been applied

---
 Documentation/devicetree/bindings/rng/mtk-rng.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/rng/mtk-rng.yaml b/Documentation/devicetree/bindings/rng/mtk-rng.yaml
index 61888e07bda0..bb32491ee8ae 100644
--- a/Documentation/devicetree/bindings/rng/mtk-rng.yaml
+++ b/Documentation/devicetree/bindings/rng/mtk-rng.yaml
@@ -21,6 +21,7 @@ properties:
           - enum:
               - mediatek,mt7622-rng
               - mediatek,mt7629-rng
+              - mediatek,mt7986-rng
               - mediatek,mt8365-rng
               - mediatek,mt8516-rng
           - const: mediatek,mt7623-rng
-- 
2.29.2
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
