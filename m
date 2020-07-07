Return-Path: <SRS0=cZv3=AS=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C9F5C433DF
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Jul 2020 11:25:52 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 47C2C206CD
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Jul 2020 11:25:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="WtpoAkgU";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="a4lwH1jh"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 47C2C206CD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=iWR4LrIXX5wXn5crXFLe2GhFn7Dge8eRHUsrl7BAz3M=; b=WtpoAkgUGpvipujbA9McfV4fv
	qCyI7O1XfmMjTipV72svOS/8C+DcnDEBXvh06dPAObICJtDPeIM3PtQEbLUb88BTd76Pl2N6iZSL9
	q/k/wmdNxd7dwS/IAirMhB06pAGiDKbyW4pK1Yc7P/5F8LRmRzbRgyVvwFUSFfzMME7AfCfqmcqTg
	onYnHhKteNneCm5JibvrA4v7C8obTfj1TOkVLd7t4SU6hPKAQ/yQ6n+guImRR162GtrzIjeZma/zZ
	t2Fi2RGXvEIEG3DXbChjjDiop4L6Dfsh3NfBlG7/uBu7u1Ao0UdCVvnkI2KpGVjG2d8tHppGE+PF/
	Q89Byk26w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jsljM-0004PO-2h; Tue, 07 Jul 2020 11:25:44 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jsljJ-0004OG-Gq; Tue, 07 Jul 2020 11:25:42 +0000
X-UUID: 08cb11a3296c467c9f606ddafc7e2920-20200707
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=vfvjtfH3Qs6aHOw/QXhcQ51ZF1iRs+TYc8vvEskKgac=; 
 b=a4lwH1jhsqzlod4taTS95VZTNCoYXO3ItijaP8jF5e/2Mimn5KW7Kt4ejWZ5YJVTYxSrKcTDqyHwHVkQR1IjhC36+k6nwULgHw0Y+2+TKSA8Z/plz7na4EqiL20klEDy8HzRe8J+6NO3e/W7TMCUkPabj6i9QQGHrIdSHDTRUPk=;
X-UUID: 08cb11a3296c467c9f606ddafc7e2920-20200707
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <hanks.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1695381411; Tue, 07 Jul 2020 03:25:29 -0800
Received: from MTKMBS01N2.mediatek.inc (172.21.101.79) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 7 Jul 2020 04:25:34 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs01n2.mediatek.inc (172.21.101.79) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 7 Jul 2020 19:25:25 +0800
Received: from [172.21.77.33] (172.21.77.33) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 7 Jul 2020 19:25:26 +0800
Message-ID: <1594121128.20610.9.camel@mtkswgap22>
Subject: Re: [PATCH v7 0/7] Add basic SoC Support for Mediatek MT6779 SoC
From: Hanks Chen <hanks.chen@mediatek.com>
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring
 <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, "Michael
 Turquette" <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>
Date: Tue, 7 Jul 2020 19:25:28 +0800
In-Reply-To: <1593694630-26604-2-git-send-email-hanks.chen@mediatek.com>
References: <1593694630-26604-1-git-send-email-hanks.chen@mediatek.com>
 <1593694630-26604-2-git-send-email-hanks.chen@mediatek.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 054C2A82F4257DC0A2C98A1257360749210D114C218370F82C156C88CC470A042000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200707_072541_708978_C6C7F846 
X-CRM114-Status: GOOD (  15.15  )
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
 wsd_upstream@mediatek.com, Stephen Boyd <sboyd@kernel.org>,
 Andy Teng <andy.teng@mediatek.com>,
 Michael Turquette <mturquette@baylibre.com>, Sean Wang <sean.wang@kernel.org>,
 Loda Chou <loda.chou@mediatek.com>, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 mtk01761 <wendell.lin@mediatek.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Michael, Stephen, Matthias and all,

gentle ping for this patch set

If no new comments, I would like to send a newer version for the series.

patch set:
https://lkml.org/lkml/2020/7/2/497


Thanks
Hanks Chen


On Thu, 2020-07-02 at 20:57 +0800, Hanks Chen wrote:
> *** BLURB HERE ***
> 
> Andy Teng (1):
>   dt-bindings: pinctrl: add bindings for MediaTek MT6779 SoC
> 
> Hanks Chen (6):
>   pinctrl: mediatek: update pinmux definitions for mt6779
>   pinctrl: mediatek: avoid virtual gpio trying to set reg
>   pinctrl: mediatek: add pinctrl support for MT6779 SoC
>   pinctrl: mediatek: add mt6779 eint support
>   clk: mediatek: add UART0 clock support
>   arm64: dts: add dts nodes for MT6779
> 
>  .../bindings/pinctrl/mediatek,mt6779-pinctrl.yaml  |  210 ++
>  arch/arm64/boot/dts/mediatek/Makefile              |    1 +
>  arch/arm64/boot/dts/mediatek/mt6779-evb.dts        |   31 +
>  arch/arm64/boot/dts/mediatek/mt6779.dtsi           |  271 +++
>  drivers/clk/mediatek/clk-mt6779.c                  |    2 +
>  drivers/pinctrl/mediatek/Kconfig                   |   12 +
>  drivers/pinctrl/mediatek/Makefile                  |    1 +
>  drivers/pinctrl/mediatek/pinctrl-mt6779.c          |  783 ++++++++
>  drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c   |   25 +
>  drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.h   |    1 +
>  drivers/pinctrl/mediatek/pinctrl-mtk-mt6779.h      | 2085 ++++++++++++++++++++
>  drivers/pinctrl/mediatek/pinctrl-paris.c           |    7 +
>  include/dt-bindings/pinctrl/mt6779-pinfunc.h       | 1242 ++++++++++++
>  13 files changed, 4671 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.yaml
>  create mode 100644 arch/arm64/boot/dts/mediatek/mt6779-evb.dts
>  create mode 100644 arch/arm64/boot/dts/mediatek/mt6779.dtsi
>  create mode 100644 drivers/pinctrl/mediatek/pinctrl-mt6779.c
>  create mode 100644 drivers/pinctrl/mediatek/pinctrl-mtk-mt6779.h
>  create mode 100644 include/dt-bindings/pinctrl/mt6779-pinfunc.h
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
