Return-Path: <SRS0=dQnm=BJ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89AB5C433DF
	for <linux-mediatek@archiver.kernel.org>; Thu, 30 Jul 2020 13:31:43 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 586E2206D8
	for <linux-mediatek@archiver.kernel.org>; Thu, 30 Jul 2020 13:31:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="CDmNdeWo";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="AK8rKwd6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 586E2206D8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=mOV9ECSNPZ4+6jVwGDGyMai7DG/ekUAVfWPURUeuQc4=; b=CDmNdeWoIEwYILShjxLUjCfSIc
	E945twCOavofsavmYo17GBUIV+mbxo0cTE6YCxOLjTeTT3fVu8DbVW8JBvklIrYD77HTf+aL4KDtQ
	626cw5F9hkwy3rtc0z+5tfo6XaheU0+INHH7OsUTFhsr5NrX/xHF3/o6RGg674Jf85qGpgzsN+iNt
	1vzZVeUjb7V5oB8cGM76Eogjjyuy2HH5A5in9ZXQfs9gC+v6DckqsuzjGyGoI3QZLZ461cVX2KXKe
	dLvBJ+iK+z/2X62rYjI9KbUPUJS+27tXu7+M/7fjvO+nR72O9NwTFh+jA2aRr1pkk3UnyHnr9vSR8
	6ayMetxQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k18ed-0004PC-VQ; Thu, 30 Jul 2020 13:31:28 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k18du-00047d-Uu; Thu, 30 Jul 2020 13:30:45 +0000
X-UUID: a9fb8f12270a40379bd528f707240c88-20200730
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=TSeOd8gyodenG/vPhw7uxDULq97nWDx64WTQyTn+JuI=; 
 b=AK8rKwd65N/l5S60SS8XkUwT/tnzlKfAMBVL8Cn8x2BuWBVRyY4FUQvhX6pSKP3Wz2/5iHrqjTOPbKcC4r9CTENkksJBhm+A1cn9maA9kmRyuvtaHSWRPD65rSRxCBLZuk6JcXHS2j9dTdWjn/cKkKz2flefMr984paDf69Gsgg=;
X-UUID: a9fb8f12270a40379bd528f707240c88-20200730
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <hanks.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 854095038; Thu, 30 Jul 2020 05:30:20 -0800
Received: from mtkmbs08n1.mediatek.inc (172.21.101.55) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 30 Jul 2020 06:30:30 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs08n1.mediatek.inc (172.21.101.55) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 30 Jul 2020 21:30:15 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 30 Jul 2020 21:30:15 +0800
From: Hanks Chen <hanks.chen@mediatek.com>
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring
 <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, "Michael
 Turquette" <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>
Subject: [PATCH v10 0/3] Add basic SoC Support for Mediatek MT6779 SoC
Date: Thu, 30 Jul 2020 21:30:13 +0800
Message-ID: <1596115816-11758-1-git-send-email-hanks.chen@mediatek.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200730_093043_212388_50D12EDC 
X-CRM114-Status: GOOD (  17.50  )
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
 Andy Teng <andy.teng@mediatek.com>, Hanks Chen <hanks.chen@mediatek.com>,
 YueHaibing <yuehaibing@huawei.com>, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Loda Chou <loda.chou@mediatek.com>, mtk01761 <wendell.lin@mediatek.com>,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


Change since v10:
Commit "dt-bindings: pinctrl: add bindings for MediaTek MT6779 SoC"
-- remove the patches which were applied to linux-next
https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=b07b616214857c9db01e2807cde2f6bba8019fc3
-- follow the latest 'dt-schema' and fix the dts sample


Change since v9:
Commit "dt-bindings: pinctrl: add bindings for MediaTek MT6779 SoC"
-- remove driving desciprtion and reuse the generic schemas.
Commit "pinctrl: mediatek: add pinctrl support for MT6779 SoC"
-- fix build error to support ko.
-- follow the APIs as below.
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

Hanks Chen (2):
  arm64: dts: add dts nodes for MT6779
  clk: mediatek: add UART0 clock support

 .../pinctrl/mediatek,mt6779-pinctrl.yaml      | 202 +++++++++++++
 arch/arm64/boot/dts/mediatek/Makefile         |   1 +
 arch/arm64/boot/dts/mediatek/mt6779-evb.dts   |  31 ++
 arch/arm64/boot/dts/mediatek/mt6779.dtsi      | 271 ++++++++++++++++++
 drivers/clk/mediatek/clk-mt6779.c             |   2 +
 5 files changed, 507 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.yaml
 create mode 100644 arch/arm64/boot/dts/mediatek/mt6779-evb.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt6779.dtsi

-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
