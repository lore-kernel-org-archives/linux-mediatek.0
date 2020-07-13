Return-Path: <SRS0=TL3J=AY=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C898CC433E8
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Jul 2020 11:11:53 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 95BBD2075B
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Jul 2020 11:11:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="l58Jzkt8";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="dalbMtPH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 95BBD2075B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=WTG0YEtC1gtTQs/J4r3/DKNh76cb/gwb9/mjsLTyPZs=; b=l58Jzkt82o5L/b2acvvOt1Ven
	hmUBR163ZTsNcoFUihbd0kuT4J2EapCzzDO5EQDksAEVY7SJ7VBXYoTzdKXkpLfilIbRSANkOh3V9
	KlbIyBNmm/42PG0620SEzO1Y15iyag85UyGcP1VkWBCaQ/3vKC1f6VTrWzrUZ6aNqDxNtht2pZ4YN
	LD+ui6GUuJEGWNbbflNNxy8duEq6KZYZB4gweKoyr6X4u5KymPIZtucymLe5mVIo5Uh68sOxefKdj
	UcFhTeiff//PTGKbUE9TvtqLbL+jsnFNPj6KefPWLFKcnDZvDxICiCL0C/AbwNHplSI8SAS+F5GfC
	yD24i2Tlw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1juwN6-0007L9-3M; Mon, 13 Jul 2020 11:11:44 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1juwN4-0007KS-2b; Mon, 13 Jul 2020 11:11:43 +0000
X-UUID: 1ebd330eabc7428b8abae446fb5e9a06-20200713
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=q42cPTjFuRIZprsAfqDWm9AEfpK4UiJ6KtTPS0h5+gQ=; 
 b=dalbMtPHsYCfr+r3BRPVH2AY+70HcHJ/jTZX2aVoadN7tBsdL9FyPz8mi5OL8//bsV3AaeRoU3xn7c18LHJvO4QWDNNfdeG2MlRYZqP83ehBSw5vj3o4EEeCG/cFAdnTv/a5sDeLJGS9MadUPsK1w3yEZ8XIjTrW4ShU/aHsCII=;
X-UUID: 1ebd330eabc7428b8abae446fb5e9a06-20200713
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <hanks.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 2105616009; Mon, 13 Jul 2020 03:11:32 -0800
Received: from MTKMBS01N1.mediatek.inc (172.21.101.68) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 13 Jul 2020 04:11:27 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs01n1.mediatek.inc (172.21.101.68) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 13 Jul 2020 19:11:14 +0800
Received: from [172.21.77.33] (172.21.77.33) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 13 Jul 2020 19:11:14 +0800
Message-ID: <1594638676.29621.1.camel@mtkswgap22>
Subject: Re: [PATCH v7 7/7] arm64: dts: add dts nodes for MT6779
From: Hanks Chen <hanks.chen@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>
Date: Mon, 13 Jul 2020 19:11:16 +0800
In-Reply-To: <2eee3a1f-464a-359e-e7d3-0d331c8898ed@gmail.com>
References: <1593694630-26604-1-git-send-email-hanks.chen@mediatek.com>
 <1593694630-26604-9-git-send-email-hanks.chen@mediatek.com>
 <2eee3a1f-464a-359e-e7d3-0d331c8898ed@gmail.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200713_071142_264199_79F9C0BC 
X-CRM114-Status: GOOD (  13.37  )
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

On Fri, 2020-07-10 at 15:47 +0200, Matthias Brugger wrote:
> 
> On 02/07/2020 14:57, Hanks Chen wrote:
> > this adds initial MT6779 dts settings for board support,
> > including cpu, gic, timer, ccf, pinctrl, uart, sysirq...etc.
> > 
> > Signed-off-by: Hanks Chen <hanks.chen@mediatek.com>
> > ---
> >   arch/arm64/boot/dts/mediatek/Makefile       |    1 +
> >   arch/arm64/boot/dts/mediatek/mt6779-evb.dts |   31 +++
> >   arch/arm64/boot/dts/mediatek/mt6779.dtsi    |  271 +++++++++++++++++++++++++++
> >   3 files changed, 303 insertions(+)
> >   create mode 100644 arch/arm64/boot/dts/mediatek/mt6779-evb.dts
> >   create mode 100644 arch/arm64/boot/dts/mediatek/mt6779.dtsi
> > 
> [...]
> > +
> > +		uart2: serial@11004000 {
> > +			compatible = "mediatek,mt6779-uart",
> > +				     "mediatek,mt6577-uart";
> > +			reg = <0 0x11004000 0 0x400>;
> > +			interrupts = <GIC_SPI 117 IRQ_TYPE_LEVEL_LOW>;
> > +			clocks = <&clk26m>, <&infracfg_ao CLK_INFRA_UART1>;
> 
> I suppose that should be:
> 
> clocks = <&clk26m>, <&infracfg_ao CLK_INFRA_UART2>;
> 
My fault, I'll fix the typo in next version.

Thanks!

Hanks

> 
> Regards,
> Matthias
> 
> > +			clock-names = "baud", "bus";
> > +			status = "disabled";
> > +		};
> > +
> > +		audio: clock-controller@11210000 {
> > +			compatible = "mediatek,mt6779-audio", "syscon";
> > +			reg = <0 0x11210000 0 0x1000>;
> > +			#clock-cells = <1>;
> > +		};
> > +
> > +		mfgcfg: clock-controller@13fbf000 {
> > +			compatible = "mediatek,mt6779-mfgcfg", "syscon";
> > +			reg = <0 0x13fbf000 0 0x1000>;
> > +			#clock-cells = <1>;
> > +		};
> > +
> > +		mmsys: syscon@14000000 {
> > +			compatible = "mediatek,mt6779-mmsys", "syscon";
> > +			reg = <0 0x14000000 0 0x1000>;
> > +			#clock-cells = <1>;
> > +		};
> > +
> > +		imgsys: clock-controller@15020000 {
> > +			compatible = "mediatek,mt6779-imgsys", "syscon";
> > +			reg = <0 0x15020000 0 0x1000>;
> > +			#clock-cells = <1>;
> > +		};
> > +
> > +		vdecsys: clock-controller@16000000 {
> > +			compatible = "mediatek,mt6779-vdecsys", "syscon";
> > +			reg = <0 0x16000000 0 0x1000>;
> > +			#clock-cells = <1>;
> > +		};
> > +
> > +		vencsys: clock-controller@17000000 {
> > +			compatible = "mediatek,mt6779-vencsys", "syscon";
> > +			reg = <0 0x17000000 0 0x1000>;
> > +			#clock-cells = <1>;
> > +		};
> > +
> > +		camsys: clock-controller@1a000000 {
> > +			compatible = "mediatek,mt6779-camsys", "syscon";
> > +			reg = <0 0x1a000000 0 0x10000>;
> > +			#clock-cells = <1>;
> > +		};
> > +
> > +		ipesys: clock-controller@1b000000 {
> > +			compatible = "mediatek,mt6779-ipesys", "syscon";
> > +			reg = <0 0x1b000000 0 0x1000>;
> > +			#clock-cells = <1>;
> > +		};
> > +
> > +	};
> > +};
> > 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
