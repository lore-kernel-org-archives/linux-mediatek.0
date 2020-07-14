Return-Path: <SRS0=0yQJ=AZ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95C83C433E2
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Jul 2020 09:15:13 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6480221D7B
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Jul 2020 09:15:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Yx4LK912";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="sDDP88ep"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6480221D7B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=AYWUgDfDSdsRNbSxE5CBow1OFdrdGYGYuqTjH+5Wg2E=; b=Yx4LK912259HR/ShurqHSPblr1
	fGPraehpm1e6Qqu6fUHmGOayxQpKD8AFBASPoRahpk/gSVew4EM8y7G37rS9uas6CcuHpzszcTAkR
	8JQIsi7dNkPMppuUcKHMnc39sSCZ0SK74eCto4myT8lIL9Z7BCQeI3d0hoyzOaVURnN9A33WsplK0
	h8L+GxbCwXwoOnMkzgP7GbfzY3ClNLTgqK8ab+gnB37e+Vfp0E0o8YUASU2bdqKASHdEXvJhZNjBP
	YCTd3DDVOB/TzMO805eeO0ornHsNG9AzL0Ol1fnrEPnKeKkKYNrW83BBc2v0fEhZkDFZ24anBKyNu
	HC3UXJgA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jvH1j-0005UA-SP; Tue, 14 Jul 2020 09:15:03 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jvH1a-0005RD-60; Tue, 14 Jul 2020 09:14:55 +0000
X-UUID: 60da454f8a86409ea86ef2d7bcfd3541-20200714
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=gg/UxrARz1LjEmbIn/dsLyHmNcLosv+d6Ng22kKepIs=; 
 b=sDDP88epJUkUj8RgaMFXMgo40kBqVzr0DTVFEGuVYpuCP53DV8VmZux/yAxoW7XswtJc0RD0/D9sPpldhAaIsJfzOBs6G3vqnM7fMQHRDlkOLgHKBUrkiSkJN5Se+2FCV39HkXke0vGrXhulGn+GgYia9PLw7nsDgLkqe1by14E=;
X-UUID: 60da454f8a86409ea86ef2d7bcfd3541-20200714
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <hanks.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 2018628101; Tue, 14 Jul 2020 01:14:53 -0800
Received: from MTKMBS01N1.mediatek.inc (172.21.101.68) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 14 Jul 2020 02:04:48 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs01n1.mediatek.inc (172.21.101.68) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 14 Jul 2020 17:04:40 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Tue, 14 Jul 2020 17:04:41 +0800
From: Hanks Chen <hanks.chen@mediatek.com>
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring
 <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, "Michael
 Turquette" <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, "Sean
 Wang" <sean.wang@kernel.org>
Subject: [PATCH 0/7] Add basic SoC Support for Mediatek MT6779 SoC
Date: Tue, 14 Jul 2020 17:04:32 +0800
Message-ID: <1594717479-8160-1-git-send-email-hanks.chen@mediatek.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200714_051454_455604_CC23AC97 
X-CRM114-Status: GOOD (  13.70  )
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
Cc: devicetree@vger.kernel.org, CC Hwang <cc.hwang@mediatek.com>,
 wsd_upstream@mediatek.com, Andy Teng <andy.teng@mediatek.com>,
 Hanks Chen <hanks.chen@mediatek.com>, Loda Chou <loda.chou@mediatek.com>,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-mediatek@lists.infradead.org, mtk01761 <wendell.lin@mediatek.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


Change since v8:
Commit "dt-bindings: pinctrl: add bindings for MediaTek"
-- update the format
Commit "arm64: dts: add dts nodes for MT6779"
-- fix the typo in uart node


Change since v7:
Commit "dt-bindings: pinctrl: add bindings for MediaTek"
-- fix typo and change order of patch
Commit "clk: mediatek: add UART0 clock support"
-- add fixes tag and real name
Commit "arm64: dts: add dts nodes for MT6779"
-- expose all three UARTs in the dtsi


Change since v6:
Commit "dt-bindings: pinctrl: add bindings for MediaTek"
-- fix format of bindings and add interrupt definition.
Commit "pinctrl: mediatek: update pinmux definitions for"
-- use the standard include path
Commit "pinctrl: mediatek: avoid virtual gpio trying to set"
-- remove unnecessary error handler
Commit "pinctrl: mediatek: add pinctrl support for MT6779 SoC"
-- add some useful help text in kconfig
Commit "clk: mediatek: add UART0 clock support"
-- add UART0 clock support
Commit "arm64: dts: add dts nodes for MT6779"
-- add "baud" and "bus" clocks for uart
-- add new approach for mmsys


Change since v5:
1. remove unnecessary string in commit message


Change since v4:
1. fix format of pinctrl bindings


Change since v3:
1. add bindings for "mediatek,mt6779-pinctrl"
2. add some comments into the code (e.g. virtual gpio ...)
3. add Acked-by tags
4. add pmu node into dts
5. support ppi partition and fix base address in gic node of dts


Change since v2:
1. add Reviewed-by tags
2. fix checkpatch warnings with strict level


Change since v1:
first patchset

Andy Teng (1):
  dt-bindings: pinctrl: add bindings for MediaTek MT6779 SoC

Hanks Chen (6):
  pinctrl: mediatek: update pinmux definitions for mt6779
  pinctrl: mediatek: avoid virtual gpio trying to set reg
  pinctrl: mediatek: add pinctrl support for MT6779 SoC
  pinctrl: mediatek: add mt6779 eint support
  arm64: dts: add dts nodes for MT6779
  clk: mediatek: add UART0 clock support

 .../bindings/pinctrl/mediatek,mt6779-pinctrl.yaml  |  203 ++
 arch/arm64/boot/dts/mediatek/Makefile              |    1 +
 arch/arm64/boot/dts/mediatek/mt6779-evb.dts        |   31 +
 arch/arm64/boot/dts/mediatek/mt6779.dtsi           |  271 +++
 drivers/clk/mediatek/clk-mt6779.c                  |    2 +
 drivers/pinctrl/mediatek/Kconfig                   |   12 +
 drivers/pinctrl/mediatek/Makefile                  |    1 +
 drivers/pinctrl/mediatek/pinctrl-mt6779.c          |  783 ++++++++
 drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c   |   25 +
 drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.h   |    1 +
 drivers/pinctrl/mediatek/pinctrl-mtk-mt6779.h      | 2085 ++++++++++++++++++++
 drivers/pinctrl/mediatek/pinctrl-paris.c           |    7 +
 include/dt-bindings/pinctrl/mt6779-pinfunc.h       | 1242 ++++++++++++
 13 files changed, 4664 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.yaml
 create mode 100644 arch/arm64/boot/dts/mediatek/mt6779-evb.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt6779.dtsi
 create mode 100644 drivers/pinctrl/mediatek/pinctrl-mt6779.c
 create mode 100644 drivers/pinctrl/mediatek/pinctrl-mtk-mt6779.h
 create mode 100644 include/dt-bindings/pinctrl/mt6779-pinfunc.h

-- 
1.7.9.5
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
