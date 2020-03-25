Return-Path: <SRS0=43xy=5K=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A254C1975A
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 Mar 2020 08:13:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 279A420775
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 Mar 2020 08:13:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="tIoBMz0C";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="X85t4PCQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 279A420775
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=9YGqkfpHV82uXOSwOPT4u62qHeV/+4W4BOZ7TPOlu64=; b=tIoBMz0Cilk8MG
	T8s7LT1hquK+y7uR7pKXY6SJIpI5TwN2CcdXpgeqACm1ooqYp7sV264m7VJvxmv+sAINENFsjdGqf
	beMvkV6kiqrELKM5I4X2FHbLzvviDdaURUfe+wmPU4Qd0Rnl7f1JaN341ZlFHDJiryV2opHWAXuzY
	MvyNk+HAiaYKjn1dAb6Tu3Jtrt47ChHSaOJ7wWN4I8yNuCTZ/i72eypHthsUqONzurLYgOpfsSbpv
	aRLTzxp0QjAI+cpAszNmT0GB08HZkw6WLhqwOOzv/a44VSqauU/SkSwlFy0SSNn1XE14ELgvoqCp3
	EZYxOoIon51Tl8pnU+oA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jH1AI-00040L-U3; Wed, 25 Mar 2020 08:13:30 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jH1AG-0003xj-4m
 for linux-mediatek@lists.infradead.org; Wed, 25 Mar 2020 08:13:29 +0000
X-UUID: 62d92fd14a4e4cfb9aca50cbf257071a-20200325
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=RBJRLpRZWMcTql+U1JsklmMlj2x8JdOtzIR7NmCLfes=; 
 b=X85t4PCQMdOyXQHLbV5uy/GiOgzvbVBkXzHxq6c+pgQaYfrZ/0qqUXi3njade9uC3SgFPakp+wSbOTkKNACrhm6sLBn7uF1YEYdlZwO4ilF2pluj5lOVyP/9FGxkjwEitMac2gcNVDicPcNLiuOkXVHMiVeyWjK3hnWUOA3oECc=;
X-UUID: 62d92fd14a4e4cfb9aca50cbf257071a-20200325
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <hanks.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1964101540; Wed, 25 Mar 2020 00:13:22 -0800
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Wed, 25 Mar 2020 01:13:20 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Wed, 25 Mar 2020 16:13:19 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via
 Frontend Transport; Wed, 25 Mar 2020 16:13:19 +0800
From: Hanks Chen <hanks.chen@mediatek.com>
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring
 <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, Sean Wang <sean.wang@kernel.org>
Subject: [PATCH v4 0/6] Add basic SoC Support for Mediatek MT6779 SoC
Date: Wed, 25 Mar 2020 16:12:38 +0800
Message-ID: <1585123964-10791-1-git-send-email-hanks.chen@mediatek.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200325_011328_192542_B88CBA5E 
X-CRM114-Status: UNSURE (   9.09  )
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
Cc: Andy Teng <andy.teng@mediatek.com>, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, wsd_upstream@mediatek.com,
 devicetree@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Change since v4:
1. fix format of pinctrl bindings


Change since v3:
1. add bindings for "mediatek,mt6779-pinctrl"
2. add some comments into the code (e.g. virtual gpio ...) 3. add Acked-by tags 4. add pmu node into dts 5. support ppi partition and fix base address in gic node of dts

[note]
[1] need bindings for "arm,cortex-a75" in patch 6
> Already in Rob's tree here:


Change since v2:
1. add Reviewed-by tags
2. fix checkpatch warnings with strict level


Change since v1:
first patchset




Andy Teng (1):
  dt-bindings: pinctrl: add bindings for MediaTek MT6779 SoC

Hanks Chen (5):
  pinctrl: mediatek: update pinmux definitions for mt6779
  pinctrl: mediatek: avoid virtual gpio trying to set reg
  pinctrl: mediatek: add pinctrl support for MT6779 SoC
  pinctrl: mediatek: add mt6779 eint support
  arm64: dts: add dts nodes for MT6779

 .../bindings/pinctrl/mediatek,mt6779-pinctrl.yaml  |  208 ++
 arch/arm64/boot/dts/mediatek/Makefile              |    1 +
 arch/arm64/boot/dts/mediatek/mt6779-evb.dts        |   31 +
 arch/arm64/boot/dts/mediatek/mt6779.dtsi           |  265 +++
 drivers/pinctrl/mediatek/Kconfig                   |    7 +
 drivers/pinctrl/mediatek/Makefile                  |    1 +
 drivers/pinctrl/mediatek/pinctrl-mt6779.c          |  783 ++++++++
 drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c   |   28 +
 drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.h   |    1 +
 drivers/pinctrl/mediatek/pinctrl-mtk-mt6779.h      | 2085 ++++++++++++++++++++
 drivers/pinctrl/mediatek/pinctrl-paris.c           |    7 +
 include/dt-bindings/pinctrl/mt6779-pinfunc.h       | 1242 ++++++++++++
 12 files changed, 4659 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.yaml
 create mode 100644 arch/arm64/boot/dts/mediatek/mt6779-evb.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt6779.dtsi
 create mode 100644 drivers/pinctrl/mediatek/pinctrl-mt6779.c
 create mode 100644 drivers/pinctrl/mediatek/pinctrl-mtk-mt6779.h
 create mode 100644 include/dt-bindings/pinctrl/mt6779-pinfunc.h
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
