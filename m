Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDC47C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 May 2022 10:59:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=z9LN2hiGmmaQMp/MCX+zRTcZPSWsUzMJRwqKRNRIpdw=; b=Dji07xs2WNt0JG
	4n7248bdU+qZZEJLJR8MWdzCUQ01xFydNty4UCbQzKkbpYFZD+5AXjS97wLEpauudFcDyQE7DXqnG
	NRBvzJvceHBCnIzyS1+75p8OywwdqiejxiorHuco1SeHxPHT+cbL3HDCeLEYqGnP8g7jC4hcddqtr
	nxH4TyQjlMAt0D4ue9mgdKkfdpIOHekIHidiqlsG9844GZggvNvKuOftTKCPdAlUtnoJoFxxgYgB2
	gz5FAkbTTLUmorpE5eZFzZ9tQq5eNkPQSQAPSezUtANVsnXHHVBQYl/jjgN1SjpyPeREmYKHbqFwl
	ulbZ3icPzTlblQaB3A4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nlqFe-005S4a-M8; Tue, 03 May 2022 10:59:30 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nlqB1-005PBq-MQ; Tue, 03 May 2022 10:54:45 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id B0EA41F43E1A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1651575282;
 bh=KImMtRiNvhnzKT2AFtwuL9K10f7DNftq+ja2O1mLSvs=;
 h=From:To:Cc:Subject:Date:From;
 b=ZEKMHHWSnyZlmj76oYNWJrFljSUXNFbHoFW6KKTLEMu/2ezN0Vq+G8juH2PM8Gtzg
 lkO25sGHy2uiGH9vG71MHm3nOettSPu9DW8ldOW2lJyw8acrCWzZbufdVNy835YejP
 HLmt+OIVh5lnCxd09efEhgcA/V/Oe31AJlAd4WZ+4ktZERwwJQxeXIxi14BPmq5Mmb
 bhMK1GidM+nItlJk2gEAfQLziz+o/MQw27lEEi3unZqqgHvc0kntZBdKHVaR300Gq4
 2Q/ZXOTCBwDQBQ+YM5+dmXD9UXQDZ2vpPrZfCWFvpgCFA2N/Btl2gnr+yuhQLpnCVw
 nTXSGzBwddMoA==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: robh+dt@kernel.org
Cc: krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com,
 chun-jie.chen@mediatek.com, angelogioacchino.delregno@collabora.com,
 weiyi.lu@mediatek.com, mbrugger@suse.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, kernel@collabora.com,
 nfraprado@collabora.com
Subject: [PATCH 0/2] MediaTek Helio X10 MT6795 - power domains
Date: Tue,  3 May 2022 12:54:34 +0200
Message-Id: <20220503105436.54901-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220503_035443_903390_BD419E44 
X-CRM114-Status: UNSURE (   9.71  )
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

In an effort to give some love to the apparently forgotten MT6795 SoC,
I am upstreaming more components that are necessary to support platforms
powered by this one apart from a simple boot to serial console.

This series introduces support for the MTCMOS power domains found on
the Helio X10.

Tested on a Sony Xperia M5 (codename "Holly") smartphone.

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
