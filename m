Return-Path: <SRS0=cyKo=BC=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25008C433EC
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Jul 2020 11:20:33 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E4A222086A
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Jul 2020 11:20:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="t/e/SRFM";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="mL8oV3z2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E4A222086A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=gBUdfEcG2i7IT0LXMXV6virw9SOjK9zJCNGxUEic4ts=; b=t/e/SRFMjspj00wkithM3RsY4I
	LJEmBbWe1pKcWESCiouPoOhwvXS53afcKHyEHb83zTnjEKMwv5pw/A/69FxJfxEav/8hou0ZDaDu5
	wbdHw08wDsgiYeXUYh+Iqo03d9VmrRmdKMPmjjfqnh2OUPE9sBv4DLGTPRvrf4tflzHuJgrzz+j+G
	i3+XeDc67gh2l5fVReIfpYt/EPSkJ3ziFpiEcTb49gOv/FzgDy48qSPb3MHE5Gk+IFa5UYmbMi/1F
	36Wytv/rhYfBVtrWMZcojNvB98GZzILMJDLyVfT0Yn8VKBBFnskZuCbDfaK51VU1FhPCXRi8QIKuw
	AfG1wfwA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jyZGv-0007wR-8q; Thu, 23 Jul 2020 11:20:21 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jyZGp-0007u8-AX; Thu, 23 Jul 2020 11:20:17 +0000
X-UUID: ea8f174172314ed2a58f44a92111f269-20200723
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=tV3sW+yzooZrTwqq74INKJCg3NXuaZoZaAi68qo1jlY=; 
 b=mL8oV3z2LyYtvJa93APgzrPeYRehlo3DvksqhMfvjFujmeOsqVGL9Yj+6euTYcTBCz6jOHgECfpNfY61dYwtaY7BFQYbxwHN3sXGRDleu3MBiCEC27xeI28VeYX1ffznDLwNkaEu3gJ6YB8eSFBesqqR2DWfCG3Eye/qXgY5b70=;
X-UUID: ea8f174172314ed2a58f44a92111f269-20200723
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <hanks.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1396365910; Thu, 23 Jul 2020 03:20:08 -0800
Received: from mtkmbs08n2.mediatek.inc (172.21.101.56) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 23 Jul 2020 04:20:07 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs08n2.mediatek.inc (172.21.101.56) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 23 Jul 2020 19:19:58 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 23 Jul 2020 19:19:58 +0800
From: Hanks Chen <hanks.chen@mediatek.com>
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring
 <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, "Michael
 Turquette" <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, "Sean
 Wang" <sean.wang@kernel.org>
Subject: [PATCH v9 0/7] Add basic SoC Support for Mediatek MT6779 SoC
Date: Thu, 23 Jul 2020 19:19:50 +0800
Message-ID: <1595503197-15246-1-git-send-email-hanks.chen@mediatek.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-TM-SNTS-SMTP: 2A791F3F0692A7DBE5E718F5B2112D29A2EB4192CD2A0C165DBA8F8BF7F98E542000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200723_072015_817860_22A9805D 
X-CRM114-Status: GOOD (  14.57  )
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

Change since v9:
Commit "dt-bindings: pinctrl: add bindings for MediaTek MT6779 SoC"
-- remove driving desciprtion and reuse the generic schemas.
Commit "pinctrl: mediatek: add pinctrl support for MT6779 SoC"
-- fix build error to support ko.
-- follow the APIs as below.
   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/drivers/pinctrl/mediatek?h=v5.8-rc6&id=cafe19db7751269bf6b4dd2148cbfa9fbe91d651
   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/drivers/pinctrl/mediatek?h=v5.8-rc6&id=5f755e1f1efe5ca3b475b14169e6e85bf1411bb5
Commit "arm64: dts: add dts nodes for MT6779"
-- remove the clk interface of UART3 in another mail thread.
   https://lkml.org/lkml/2020/7/21/1444


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

 .../pinctrl/mediatek,mt6779-pinctrl.yaml      |  197 ++
 arch/arm64/boot/dts/mediatek/Makefile         |    1 +
 arch/arm64/boot/dts/mediatek/mt6779-evb.dts   |   31 +
 arch/arm64/boot/dts/mediatek/mt6779.dtsi      |  271 +++
 drivers/clk/mediatek/clk-mt6779.c             |    2 +
 drivers/pinctrl/mediatek/Kconfig              |   12 +
 drivers/pinctrl/mediatek/Makefile             |    1 +
 drivers/pinctrl/mediatek/pinctrl-mt6779.c     |  785 +++++++
 .../pinctrl/mediatek/pinctrl-mtk-common-v2.c  |   25 +
 .../pinctrl/mediatek/pinctrl-mtk-common-v2.h  |    1 +
 drivers/pinctrl/mediatek/pinctrl-mtk-mt6779.h | 2085 +++++++++++++++++
 drivers/pinctrl/mediatek/pinctrl-paris.c      |    7 +
 include/dt-bindings/pinctrl/mt6779-pinfunc.h  | 1242 ++++++++++
 13 files changed, 4660 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.yaml
 create mode 100644 arch/arm64/boot/dts/mediatek/mt6779-evb.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt6779.dtsi
 create mode 100644 drivers/pinctrl/mediatek/pinctrl-mt6779.c
 create mode 100644 drivers/pinctrl/mediatek/pinctrl-mtk-mt6779.h
 create mode 100644 include/dt-bindings/pinctrl/mt6779-pinfunc.h

-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
