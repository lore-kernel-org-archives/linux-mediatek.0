Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA308C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Feb 2022 11:30:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=wPoeQUAwAiurmnkZVKMt+x4NvQYgaLJliIRgzgGI/o4=; b=LZHFMW1EngNcHV
	/vmeQoj+PvlMLCFFIHwyE21wVmNv3WCn5+/Hkf87/fYxnx2lSASQqzhrHp6BjzcFU0Fimjm7CXPG+
	GgYYSMO8FXokqND53V5FMMP//nQjF8Twwr4H2ABGmFXWQ8rnyIzutg8imM6QlLASNTHEnhCUr7MJ3
	51GPIJY+rxLf4YhrjhK/u/Lx+Yuimyzb5NWXA+LtiVEnsZDYi0Z7zF2bxUX4gQ2EfTpWV1kTadq4S
	FltmzrV/klVvjnixPi9TBVd0oQrEu1tiubA2P3cwBV+JXsGCXgdW3Gs5HxjF6czFz9AKPyYMjJtK6
	9p4/+egZNnPCC7GgaSLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nHlBF-00HSot-71; Wed, 09 Feb 2022 11:30:37 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nHlAX-00HSY0-IJ; Wed, 09 Feb 2022 11:29:54 +0000
X-UUID: 7b2bb29fbd854385a4e1e04cba8f8141-20220209
X-UUID: 7b2bb29fbd854385a4e1e04cba8f8141-20220209
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <leilk.liu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 202081583; Wed, 09 Feb 2022 04:29:50 -0700
Received: from mtkexhb02.mediatek.inc (172.21.101.103) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 9 Feb 2022 03:19:47 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by mtkexhb02.mediatek.inc
 (172.21.101.103) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Wed, 9 Feb 2022 19:19:40 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 9 Feb 2022 19:19:39 +0800
From: Leilk Liu <leilk.liu@mediatek.com>
To: Mark Brown <broonie@kernel.org>
CC: Rob Herring <robh+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-spi@vger.kernel.org>, <linux-mediatek@lists.infradead.org>
Subject: [spi: mediatek: add single/quad mode support]
Date: Wed, 9 Feb 2022 19:19:32 +0800
Message-ID: <20220209111938.16137-1-leilk.liu@mediatek.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220209_032953_643554_E544CA73 
X-CRM114-Status: UNSURE (   7.18  )
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

This series are based on kernel v5.17-rc1 and provide 6 patches to
support IPM IP single/quad mode with spi memory framework.

Leilk Liu (6):
  dt-bindings: spi: Add compatible for Mediatek IPM IP with single mode
  spi: mediatek: add IPM single mode design support
  dt-bindings: spi: Add compatible for Mediatek IPM IP with quad mode
  spi: mediatek: add spi memory support
  dt-bindings: spi: support mediatek,need_ahb_clk flag
  spi: mediatek: add need_ahb_clk support

 .../bindings/spi/mediatek,spi-mt65xx.yaml     |   7 +
 drivers/spi/spi-mt65xx.c                      | 520 ++++++++++++++++--
 2 files changed, 487 insertions(+), 40 deletions(-)

--
2.25.1




_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
