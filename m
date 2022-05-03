Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2943CC433F5
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 May 2022 14:15:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=fvJxvCV8URpEmGu4LYuUgk5zZqHX3PeaiG0g+ULwlRk=; b=yILGD4z1LIluqb
	5IS4zZL0dSbQttA9wBLTMKgBNq//ur82vrzr933qlW2VtdHUFL7a7N7rZX9cfMb2A0X67mq5iTnVc
	sCkSp/m1sl4XRJUAos98Rwn/3LLeoHcixxBx/p6+rYHE/5Nw6dsAZE1W7r/bk4Ywq/Nnlve4jkdG2
	vNQtCcdajeih5zsScVZydx7Vv0bQ+WzkdGwX/gk0/euNlvV2iwwqhKmqZEDOs1mrlaboHESLgimts
	6ij0AhsnNlWn0JV3uYrWJqElVUqWOV6DF+wCOpyZcKuR1oEIdO8MakoPuoXNBIAUnIU42r5vpX3y9
	FruwNaCeDfXEYwf8JqDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nltIy-006BkQ-VE; Tue, 03 May 2022 14:15:08 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nltIe-006BcX-4a; Tue, 03 May 2022 14:14:49 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 3E21A1F43427
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1651587286;
 bh=/OJe0zKHyv0s6VYqal7THzQhT/MkDhaWtLskuPgNQYY=;
 h=From:To:Cc:Subject:Date:From;
 b=Jidvx/3OhGacb9QpqW4aIYfGTP8NjD8JyWTMWQsQvcUsPjZJKC0ojwAWYZG+6YzFW
 1Sqs9Kbc4Buh6ep+gpa6jxWIXYOwNGow50kkLn34AIeq7Q7sE0fWtzFym1xuhwmPd6
 f09QFD8trUBsYM9cY019MilUJ3S7qB7ecSHAW99Or3rPvcBtbYT3kvC3Ho/o3yA9ku
 I3GtKnaDAgAY4I1guYcsho3TwQqIJN1dNbao5a+mf1vG7psdes6MadYsiCryyVttuJ
 eUH29CcLhEz3zoBUvYQy/yKOxwxDIgSdjoWDgti8xkGTU7khuGBpFx6oaC8VjFwEcU
 d3UNdpsuJIGFw==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: robh+dt@kernel.org
Cc: krzysztof.kozlowski+dt@linaro.org, krzysztof.kozlowski@linaro.org,
 matthias.bgg@gmail.com, chun-jie.chen@mediatek.com,
 angelogioacchino.delregno@collabora.com, weiyi.lu@mediatek.com,
 mbrugger@suse.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, kernel@collabora.com,
 nfraprado@collabora.com
Subject: [PATCH v2 0/2] MediaTek Helio X10 MT6795 - power domains
Date: Tue,  3 May 2022 16:14:39 +0200
Message-Id: <20220503141441.125852-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220503_071448_374685_8A668B19 
X-CRM114-Status: GOOD (  10.26  )
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

In an effort to give some love to the apparently forgotten MT6795 SoC,
I am upstreaming more components that are necessary to support platforms
powered by this one apart from a simple boot to serial console.

This series introduces support for the MTCMOS power domains found on
the Helio X10.

Tested on a Sony Xperia M5 (codename "Holly") smartphone.

Changes in v2:
 - Changed license header for mt6795-power.h binding as per
   Krzysztof's review.

AngeloGioacchino Del Regno (2):
  dt-bindings: power: Add MediaTek Helio X10 MT6795 power domains
  soc: mediatek: pm-domains: Add support for Helio X10 MT6795

 .../power/mediatek,power-controller.yaml      |   2 +
 drivers/soc/mediatek/mt6795-pm-domains.h      | 112 ++++++++++++++++++
 drivers/soc/mediatek/mtk-pm-domains.c         |   5 +
 include/dt-bindings/power/mt6795-power.h      |  16 +++
 4 files changed, 135 insertions(+)
 create mode 100644 drivers/soc/mediatek/mt6795-pm-domains.h
 create mode 100644 include/dt-bindings/power/mt6795-power.h

-- 
2.35.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
