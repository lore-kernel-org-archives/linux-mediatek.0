Return-Path: <SRS0=dAcd=5W=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97817C2BA19
	for <linux-mediatek@archiver.kernel.org>; Mon,  6 Apr 2020 09:39:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 633AE206F8
	for <linux-mediatek@archiver.kernel.org>; Mon,  6 Apr 2020 09:39:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="M23ZeSSd";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="nAWsZPrD"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 633AE206F8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZzZ9jC4yC86ObBweMuUlsE8RtHU58EGm+3w8Nu2aP44=; b=M23ZeSSd9xj7xT
	F78oH4ggEvvMDWqXsmWJP+IV5phrDZleZlyPWJl6qLC5rLjzMprNV8JTCDF+HkiW1a2oFZ4wJ6WDz
	aCq5Jeezp6CIwEtLsPI5tbLif+gGW2ccTPXMCfLlFPncvzVw1rjVf+octk9XNVFqcwOo+SDTk1gwB
	x5/cDHZsxTkNxIJyULk6RSwM5P8ZQIJTkYR+d+6ziNSy4gvP4GlUYiLgaTA462qw+N7mxe91qtPyf
	jpwu7/VMvwAcfTc3Ou4qfuWixI5lqJqNA0wBtS8zxM8Qkf6u5lVXbXgRzmJboygfYOBB2DOi+jxUh
	3TJCdL6t02C75i8ndYXg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jLODY-0000T6-GU; Mon, 06 Apr 2020 09:38:56 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jLOCt-0008Ax-8f; Mon, 06 Apr 2020 09:38:16 +0000
X-UUID: c07a8b1fecf74ff083fd755005dfafd3-20200406
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=AwwsjmBhPYU6ROoZPvj0twrtbVT8+nH58GyVf5fw804=; 
 b=nAWsZPrDGEAVJxeOcjuVNL0A54uzVmo2xLuEXJxky1Utorh65BbOIigjKGWa0S3cScJvssEVh5WpUESHa/lrh3okOce9n1MBOFWuJUxPrvRmCFXTQQ+9gTHR5ttTBA6G2MxvNgq0gnGEdxXynziFbEwddcnyjffi0g514t5AzjY=;
X-UUID: c07a8b1fecf74ff083fd755005dfafd3-20200406
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <chun-hung.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 432689357; Mon, 06 Apr 2020 01:38:10 -0800
Received: from MTKMBS31N1.mediatek.inc (172.27.4.69) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 6 Apr 2020 02:28:05 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 MTKMBS31N1.mediatek.inc (172.27.4.69) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 6 Apr 2020 17:28:05 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Mon, 6 Apr 2020 17:28:04 +0800
From: Chun-Hung Wu <chun-hung.wu@mediatek.com>
To: <mirq-linux@rere.qmqm.pl>, Jonathan Hunter <jonathanh@nvidia.com>, "Al
 Cooper" <alcooperx@gmail.com>, Adrian Hunter <adrian.hunter@intel.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
 <bcm-kernel-feedback-list@broadcom.com>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Michal Simek
 <michal.simek@xilinx.com>, Thierry Reding <thierry.reding@gmail.com>,
 Chaotian Jing <chaotian.jing@mediatek.com>, Ulf Hansson
 <ulf.hansson@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland
 <mark.rutland@arm.com>, Matthias Brugger <matthias.bgg@gmail.com>, "Linus
 Walleij" <linus.walleij@linaro.org>, Pavel Machek <pavel@ucw.cz>, Kate
 Stewart <kstewart@linuxfoundation.org>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>, Pan Bian <bianpan2016@163.com>, "Thomas
 Gleixner" <tglx@linutronix.de>, Allison Randal <allison@lohutok.net>,
 "Mathieu Malaterre" <malat@debian.org>, Stanley Chu
 <stanley.chu@mediatek.com>, "Kuohong Wang" <kuohong.wang@mediatek.com>
Subject: [PATCH 5/5] [5/5] dt-bindings: mmc: mediatek: Add document for mt6779
Date: Mon, 6 Apr 2020 17:28:01 +0800
Message-ID: <1586165281-11888-6-git-send-email-chun-hung.wu@mediatek.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1586165281-11888-1-git-send-email-chun-hung.wu@mediatek.com>
References: <1586165281-11888-1-git-send-email-chun-hung.wu@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: 8B6ED226D887333A20D37789CC4E855045383E3B61A17AF6877632A640788D142000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200406_023815_313589_00C733CE 
X-CRM114-Status: UNSURE (   9.54  )
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
Cc: devicetree@vger.kernel.org, wsd_upstream@mediatek.com,
 linux-arm-msm@vger.kernel.org, Chun-Hung Wu <chun-hung.wu@mediatek.com>,
 linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-tegra@vger.kernel.org,
 kernel-team@android.com, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add compatible node for mt6779 mmc

Signed-off-by: Chun-Hung Wu <chun-hung.wu@mediatek.com>
---
 Documentation/devicetree/bindings/mmc/mtk-sd.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mmc/mtk-sd.txt b/Documentation/devicetree/bindings/mmc/mtk-sd.txt
index 8a532f4..0c9cf6a 100644
--- a/Documentation/devicetree/bindings/mmc/mtk-sd.txt
+++ b/Documentation/devicetree/bindings/mmc/mtk-sd.txt
@@ -12,6 +12,7 @@ Required properties:
 	"mediatek,mt8173-mmc": for mmc host ip compatible with mt8173
 	"mediatek,mt8183-mmc": for mmc host ip compatible with mt8183
 	"mediatek,mt8516-mmc": for mmc host ip compatible with mt8516
+	"mediatek,mt6779-mmc": for mmc host ip compatible with mt6779
 	"mediatek,mt2701-mmc": for mmc host ip compatible with mt2701
 	"mediatek,mt2712-mmc": for mmc host ip compatible with mt2712
 	"mediatek,mt7622-mmc": for MT7622 SoC
-- 
1.9.1
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
