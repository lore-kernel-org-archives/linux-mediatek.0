Return-Path: <SRS0=QBiq=PI=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C16E9C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 20 Oct 2021 07:15:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6F4E1610FF
	for <linux-mediatek@archiver.kernel.org>; Wed, 20 Oct 2021 07:15:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6F4E1610FF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=VK80JC34vMNX5rUy7GRfDZBKpROVzQUeUqI7i7NQQ6o=; b=srzZ55zQ3InBIQ
	3c5D9cuYFxXNGz7Xh8AP4AorgjdmouW6ziuuNDT8/bjWCSdBCL+eziWg6BIFCXcI6HWHQCxer1ciX
	rB9QrMWoWLo1TuNfiwAduqEF4lNiPUoodtRM3b96doqkLoyQSKfPLbsfGbnEh7HcpR0CjBdvz5mT6
	PrElOs/URJ6uvNZa2Fx4bpkLgFIv/VxYdhoODvTqC3C78f2H/6a3KN/gCwhBzeO/xsXdWd8+d16p9
	K/iUJNF5SsukcC89mGMOAR2GMaIazPc6AMj48Ctt9uGSaqNACW1v/wyQDoyJ+f3t0Z061Z/JtdqdC
	8vfedYe/IHg16G9zbCDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1md5oS-003XtF-Pz; Wed, 20 Oct 2021 07:15:00 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1md5o9-003Xmz-E0; Wed, 20 Oct 2021 07:14:44 +0000
X-UUID: 1f89f5beff874d229ca559fc09044b81-20211020
X-UUID: 1f89f5beff874d229ca559fc09044b81-20211020
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <trevor.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1214247066; Wed, 20 Oct 2021 00:14:35 -0700
Received: from mtkexhb01.mediatek.inc (172.21.101.102) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 20 Oct 2021 00:14:33 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by mtkexhb01.mediatek.inc
 (172.21.101.102) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Wed, 20 Oct 2021 15:14:32 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 20 Oct 2021 15:14:31 +0800
From: Trevor Wu <trevor.wu@mediatek.com>
To: <broonie@kernel.org>, <tiwai@suse.com>, <robh+dt@kernel.org>,
 <matthias.bgg@gmail.com>
CC: <trevor.wu@mediatek.com>, <alsa-devel@alsa-project.org>,
 <linux-mediatek@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <aaronyu@google.com>, <pierre-louis.bossart@linux.intel.com>
Subject: [RESEND,
 v2 0/2] ASoC: mediatek: Add support for MT8195 sound card with rt1011
 and rt5682
Date: Wed, 20 Oct 2021 15:14:26 +0800
Message-ID: <20211020071428.14297-1-trevor.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211020_001441_509668_89148252 
X-CRM114-Status: UNSURE (   9.63  )
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

This series of patches adds support for mt8195 board with mt6359, rt1011
and rt5682.
Patches are based on broonie tree "for-next" branch.

Changes since v1:
  - refined code based on Pierre-Louis's suggestions
  - added missing of_node_put
  - fixed wrong fixup assignment on HDMITX

Trevor Wu (2):
  ASoC: mediatek: mt8195: add machine driver with mt6359, rt1011 and
    rt5682
  dt-bindings: mediatek: mt8195: add mt8195-mt6359-rt1011-rt5682
    document

 .../sound/mt8195-mt6359-rt1011-rt5682.yaml    |   47 +
 sound/soc/mediatek/Kconfig                    |   15 +
 sound/soc/mediatek/mt8195/Makefile            |    1 +
 .../mt8195/mt8195-mt6359-rt1011-rt5682.c      | 1155 +++++++++++++++++
 4 files changed, 1218 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/mt8195-mt6359-rt1011-rt5682.yaml
 create mode 100644 sound/soc/mediatek/mt8195/mt8195-mt6359-rt1011-rt5682.c

-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
