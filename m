Return-Path: <SRS0=J3PH=OA=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4D41C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Sep 2021 10:45:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6EA2661153
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Sep 2021 10:45:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6EA2661153
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=HCrZJjkzS/718710Y+90WOH1lLrAPOI7JRc+enDlTzY=; b=EsbHVOPEj2SWWM
	fCzLNSyxWPpsRSCLRAWIRHcJddgaOPHMw1uuSG/uzR1WhGU8+SPK50KNcp/kKxFPEinlnrJXwnIxj
	F4ZKT1BPDiEGsO+WGU56lVbEW7FsaO3R3y81EtQs3pZQ3XLUwiEou9m1bXupacKlgStz5LkHYkDl0
	BlHWXrMCp5G43/L52KSn9CmqsTWNbE1su+pu5vslRvSpF6+Ckoa+X8twyhgmfCu4TyhB0Ss8l8U36
	CUAIeYVCJi0AicWCiywspEBrztMFIwxhFMCS4OX0DA9xbJfI6HFgT3ZZ/sND/gO4DmXkU2nQq47/n
	Onj3Sr2NyBbMCuNLWNhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mOe25-00CVcZ-Us; Fri, 10 Sep 2021 10:45:21 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mOe1s-00CVas-73; Fri, 10 Sep 2021 10:45:10 +0000
X-UUID: 2cf1d65a6453480ca9df4bda4f29f46a-20210910
X-UUID: 2cf1d65a6453480ca9df4bda4f29f46a-20210910
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <trevor.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 574214496; Fri, 10 Sep 2021 03:45:05 -0700
Received: from mtkmbs05n2.mediatek.inc (172.21.101.140) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 10 Sep 2021 03:44:08 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs05n2.mediatek.inc (172.21.101.140) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 10 Sep 2021 18:44:07 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Fri, 10 Sep 2021 18:44:07 +0800
From: Trevor Wu <trevor.wu@mediatek.com>
To: <broonie@kernel.org>, <tiwai@suse.com>, <robh+dt@kernel.org>,
 <matthias.bgg@gmail.com>
CC: <trevor.wu@mediatek.com>, <alsa-devel@alsa-project.org>,
 <linux-mediatek@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <aaronyu@google.com>
Subject: [PATCH 0/2] ASoC: mediatek: Add support for MT8195 sound card with
 rt1011 and rt5682
Date: Fri, 10 Sep 2021 18:44:03 +0800
Message-ID: <20210910104405.11420-1-trevor.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210910_034508_327318_FE5925D3 
X-CRM114-Status: UNSURE (   9.70  )
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

Trevor Wu (2):
  ASoC: mediatek: mt8195: add machine driver with mt6359, rt1011 and
    rt5682
  dt-bindings: mediatek: mt8195: add mt8195-mt6359-rt1011-rt5682
    document

 .../sound/mt8195-mt6359-rt1011-rt5682.yaml    |   47 +
 sound/soc/mediatek/Kconfig                    |   15 +
 sound/soc/mediatek/mt8195/Makefile            |    1 +
 .../mt8195/mt8195-mt6359-rt1011-rt5682.c      | 1140 +++++++++++++++++
 4 files changed, 1203 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/mt8195-mt6359-rt1011-rt5682.yaml
 create mode 100644 sound/soc/mediatek/mt8195/mt8195-mt6359-rt1011-rt5682.c

-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
