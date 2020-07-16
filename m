Return-Path: <SRS0=/klC=A3=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_2
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E36A8C433E1
	for <linux-mediatek@archiver.kernel.org>; Thu, 16 Jul 2020 04:11:32 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9A82C20663
	for <linux-mediatek@archiver.kernel.org>; Thu, 16 Jul 2020 04:11:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="S+K+QN4P";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="QBJJ0mwc"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9A82C20663
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=EXGtrKurKRnDiFnSW+N2ebOBb05hBX/ZZSHN6Fxs0Qc=; b=S+K+QN4PBPJMynWtFoIUCcAMA
	yw1pc19UFjV5FaiVNIaHzEgcD6NHWyTWVFS2KxtrUAKx1NasbHcU1HHBdGbJ9nsSQEelmQebF7oE+
	iyTxiUeD2AyeCTuJwF3u59360QWyfoy/8za8r/mocsEFEvw4icLUVwh1L5lzW9KcBNw9eRfvlpkI9
	3szkwicPq5yxls7zlGt5dmdCCl6ddpi/WP8kglzjl2WnVJh7y1rb+aJQFpzeb+iyPlTrXml/Sq922
	980BJx2cYYmlSD7oFiSFMUNK4QJ8cJDixQdeY8mb6T3TcV6Vk8vhJTYwhCvhFBiwAIEamebVZztv4
	Gtfv6zoWg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jvvEx-00028f-DP; Thu, 16 Jul 2020 04:11:23 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jvvEu-00028A-SN; Thu, 16 Jul 2020 04:11:22 +0000
X-UUID: 14b9218e875a4525b084891ef750e3ea-20200715
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=62ZGypyhLbFv7qQkPl4Eyj0oI3ptJBAGbtdl2xMz2ik=; 
 b=QBJJ0mwcI1a1/t7cjMQ7OKSGAblX+rPAgzGvgwGSkT21UE4wSOybWJPyOq8G5R1+PEgq9KU4RfSjiBfhsBgMoGb7fIneMqOdDdsEfB6SJ51QJtFZ2EVn4zbRbXpOG8ZutBSHJGEjypLItGQjIDoXTbyX1ihUub5Vv776AEJP87o=;
X-UUID: 14b9218e875a4525b084891ef750e3ea-20200715
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <hanks.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1093867287; Wed, 15 Jul 2020 20:11:17 -0800
Received: from MTKMBS01N2.mediatek.inc (172.21.101.79) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 15 Jul 2020 21:04:03 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs01n2.mediatek.inc (172.21.101.79) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 16 Jul 2020 12:04:01 +0800
Received: from [172.21.77.33] (172.21.77.33) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 16 Jul 2020 12:04:01 +0800
Message-ID: <1594872242.11090.8.camel@mtkswgap22>
Subject: Re: [PATCH v8 6/7] arm64: dts: add dts nodes for MT6779
From: Hanks Chen <hanks.chen@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>
Date: Thu, 16 Jul 2020 12:04:02 +0800
In-Reply-To: <1b335463-b0af-9010-feed-c4b673ebb6c5@gmail.com>
References: <1594718402-20813-1-git-send-email-hanks.chen@mediatek.com>
 <1594718402-20813-7-git-send-email-hanks.chen@mediatek.com>
 <1b335463-b0af-9010-feed-c4b673ebb6c5@gmail.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 267C81200BBF5CE7F5838CC7DAED8F81F4DD194442EADB67FA1A52BED7ABC1472000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200716_001121_102507_349BA488 
X-CRM114-Status: GOOD (  17.62  )
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

On Tue, 2020-07-14 at 20:14 +0200, Matthias Brugger wrote:
> 
> On 14/07/2020 11:20, Hanks Chen wrote:
> > this adds initial MT6779 dts settings for board support,
> > including cpu, gic, timer, ccf, pinctrl, uart, sysirq...etc.
> > 
> > Signed-off-by: Hanks Chen <hanks.chen@mediatek.com>
> > ---
> >   arch/arm64/boot/dts/mediatek/Makefile       |   1 +
> >   arch/arm64/boot/dts/mediatek/mt6779-evb.dts |  31 +++
> >   arch/arm64/boot/dts/mediatek/mt6779.dtsi    | 271 ++++++++++++++++++++
> >   3 files changed, 303 insertions(+)
> >   create mode 100644 arch/arm64/boot/dts/mediatek/mt6779-evb.dts
> >   create mode 100644 arch/arm64/boot/dts/mediatek/mt6779.dtsi
> > 
> [...]
> > +
> > +		uart0: serial@11002000 {
> > +			compatible = "mediatek,mt6779-uart",
> > +				     "mediatek,mt6577-uart";
> > +			reg = <0 0x11002000 0 0x400>;
> > +			interrupts = <GIC_SPI 115 IRQ_TYPE_LEVEL_LOW>;
> > +			clocks = <&clk26m>, <&infracfg_ao CLK_INFRA_UART0>;
> > +			clock-names = "baud", "bus";
> > +			status = "disabled";
> > +		};
> > +
> > +		uart1: serial@11003000 {
> > +			compatible = "mediatek,mt6779-uart",
> > +				     "mediatek,mt6577-uart";
> > +			reg = <0 0x11003000 0 0x400>;
> > +			interrupts = <GIC_SPI 116 IRQ_TYPE_LEVEL_LOW>;
> > +			clocks = <&clk26m>, <&infracfg_ao CLK_INFRA_UART1>;
> > +			clock-names = "baud", "bus";
> > +			status = "disabled";
> > +		};
> > +
> > +		uart2: serial@11004000 {
> > +			compatible = "mediatek,mt6779-uart",
> > +				     "mediatek,mt6577-uart";
> > +			reg = <0 0x11004000 0 0x400>;
> > +			interrupts = <GIC_SPI 117 IRQ_TYPE_LEVEL_LOW>;
> > +			clocks = <&clk26m>, <&infracfg_ao CLK_INFRA_UART2>;
> > +			clock-names = "baud", "bus";
> > +			status = "disabled";
> > +		};
> 
> Devicetree describes the HW we have. As far as I know, we have 4 UARTs on 
> MT6779. So we should list them all here.
> 

Actually, We have only 3 UARTs HW on MT6779, but have 4 UART clk in
header file of clk.
CLK_INFRA_UART3 is a dummy clk interface, it has no effect on the
operation of the read/write instruction.

If you think it is not good, I can remove it in the header file of clk.

Thanks

> Regards,
> Matthias

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
