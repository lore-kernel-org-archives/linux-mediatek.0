Return-Path: <SRS0=w0xa=BA=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64195C433E4
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 Jul 2020 06:01:06 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 311B4207DD
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 Jul 2020 06:01:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="2z3XDklO";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="WrzwzFfI"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 311B4207DD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=glFIMEdd89SkOJji0Bsq+Wp9ef3Sp5ZG1xhZF48G+tc=; b=2z3XDklOVjYR5sH/kI9OuUP3I
	wuZMub+Ud35L/YW3ZEYH/6w7bqJZvayndDV2gILMi5IMGLq4cJ5ygvLPW8REusDc5K3VZckXHxFQk
	cCNVTKalt+2ueyjDy9oLCgRRzAdgDrH21yIxnvE819ci44gtMy58kdkpfFO6ObUerBr58xJ0thQ5B
	o1/QbC0MuAVm7IvotL7JRRhUB/QMGF3V+fTcdL/gJDsyj30bjnrMgSaBd7Dktn3AiSWH4gAS+prBc
	pCbqto1WrZogTsRODh72uW84C/qQNravmRzsuIwBqhPWJR/XG6qzYX9zQKdEJnmRbYhOYjWAKT1Zj
	S/KDxTtAw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jxlKg-0006Qy-Bi; Tue, 21 Jul 2020 06:00:54 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jxlKc-0006QO-RF; Tue, 21 Jul 2020 06:00:52 +0000
X-UUID: 33396b7aa9104f5092c4bb40489a8c7a-20200720
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=U8PX+F+mnKbPbXqn4UjkWg26k/aBzCM1RQhtMnlz4g8=; 
 b=WrzwzFfIVY7/0UEwUhttN1gyFZ8Pd2vOHdMOD1GRhZ857dctw43hTGHPLJlMTWdrhMc6JNYdgwgPxjNYHe/Er2M1xYVGrmRSDTbED992XTtsDoXReL7wgbHB2yt+IYaLnE917b6DBhX9FYyBnmkaobadO1OWvLdaBFXMqpoP3PM=;
X-UUID: 33396b7aa9104f5092c4bb40489a8c7a-20200720
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <hanks.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 760710010; Mon, 20 Jul 2020 22:00:43 -0800
Received: from MTKMBS01N1.mediatek.inc (172.21.101.68) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 20 Jul 2020 23:00:42 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs01n1.mediatek.inc (172.21.101.68) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 21 Jul 2020 14:00:41 +0800
Received: from [172.21.77.33] (172.21.77.33) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 21 Jul 2020 14:00:41 +0800
Message-ID: <1595311242.5599.3.camel@mtkswgap22>
Subject: Re: [PATCH v8 6/7] arm64: dts: add dts nodes for MT6779
From: Hanks Chen <hanks.chen@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>
Date: Tue, 21 Jul 2020 14:00:42 +0800
In-Reply-To: <742eefe1-954b-eb3f-98b7-469833df729a@gmail.com>
References: <1594718402-20813-1-git-send-email-hanks.chen@mediatek.com>
 <1594718402-20813-7-git-send-email-hanks.chen@mediatek.com>
 <1b335463-b0af-9010-feed-c4b673ebb6c5@gmail.com>
 <1594872242.11090.8.camel@mtkswgap22>
 <742eefe1-954b-eb3f-98b7-469833df729a@gmail.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200721_020051_058076_2DF4C1C5 
X-CRM114-Status: GOOD (  25.39  )
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
 wsd_upstream@mediatek.com, Stephen
 Boyd <sboyd@kernel.org>, Andy Teng <andy.teng@mediatek.com>,
 Linus Walleij <linus.walleij@linaro.org>, Sean Wang <sean.wang@kernel.org>,
 Loda Chou <loda.chou@mediatek.com>, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, mtk01761 <wendell.lin@mediatek.com>,
 Michael Turquette <mturquette@baylibre.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, 2020-07-20 at 18:13 +0200, Matthias Brugger wrote:
> 
> On 16/07/2020 06:04, Hanks Chen wrote:
> > On Tue, 2020-07-14 at 20:14 +0200, Matthias Brugger wrote:
> >>
> >> On 14/07/2020 11:20, Hanks Chen wrote:
> >>> this adds initial MT6779 dts settings for board support,
> >>> including cpu, gic, timer, ccf, pinctrl, uart, sysirq...etc.
> >>>
> >>> Signed-off-by: Hanks Chen <hanks.chen@mediatek.com>
> >>> ---
> >>>    arch/arm64/boot/dts/mediatek/Makefile       |   1 +
> >>>    arch/arm64/boot/dts/mediatek/mt6779-evb.dts |  31 +++
> >>>    arch/arm64/boot/dts/mediatek/mt6779.dtsi    | 271 ++++++++++++++++++++
> >>>    3 files changed, 303 insertions(+)
> >>>    create mode 100644 arch/arm64/boot/dts/mediatek/mt6779-evb.dts
> >>>    create mode 100644 arch/arm64/boot/dts/mediatek/mt6779.dtsi
> >>>
> >> [...]
> >>> +
> >>> +		uart0: serial@11002000 {
> >>> +			compatible = "mediatek,mt6779-uart",
> >>> +				     "mediatek,mt6577-uart";
> >>> +			reg = <0 0x11002000 0 0x400>;
> >>> +			interrupts = <GIC_SPI 115 IRQ_TYPE_LEVEL_LOW>;
> >>> +			clocks = <&clk26m>, <&infracfg_ao CLK_INFRA_UART0>;
> >>> +			clock-names = "baud", "bus";
> >>> +			status = "disabled";
> >>> +		};
> >>> +
> >>> +		uart1: serial@11003000 {
> >>> +			compatible = "mediatek,mt6779-uart",
> >>> +				     "mediatek,mt6577-uart";
> >>> +			reg = <0 0x11003000 0 0x400>;
> >>> +			interrupts = <GIC_SPI 116 IRQ_TYPE_LEVEL_LOW>;
> >>> +			clocks = <&clk26m>, <&infracfg_ao CLK_INFRA_UART1>;
> >>> +			clock-names = "baud", "bus";
> >>> +			status = "disabled";
> >>> +		};
> >>> +
> >>> +		uart2: serial@11004000 {
> >>> +			compatible = "mediatek,mt6779-uart",
> >>> +				     "mediatek,mt6577-uart";
> >>> +			reg = <0 0x11004000 0 0x400>;
> >>> +			interrupts = <GIC_SPI 117 IRQ_TYPE_LEVEL_LOW>;
> >>> +			clocks = <&clk26m>, <&infracfg_ao CLK_INFRA_UART2>;
> >>> +			clock-names = "baud", "bus";
> >>> +			status = "disabled";
> >>> +		};
> >>
> >> Devicetree describes the HW we have. As far as I know, we have 4 UARTs on
> >> MT6779. So we should list them all here.
> >>
> > 
> > Actually, We have only 3 UARTs HW on MT6779, but have 4 UART clk in
> > header file of clk.
> 
> Correct, I got confused by the four clocks.
> With that clarified I'm fine with the patch and will take it as soon as the 
> clock driver patch is accepted.
> 
> Regards,
> Matthias
> 
Got it, I send a new serial to fix the redundant UART clk
https://lkml.org/lkml/2020/7/21/45

Thanks

Hanks Chen

> > CLK_INFRA_UART3 is a dummy clk interface, it has no effect on the
> > operation of the read/write instruction.
> > 
> > If you think it is not good, I can remove it in the header file of clk.
> > 
> > Thanks
> > 
> >> Regards,
> >> Matthias
> > 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
