Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0123FC433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 14 Jan 2022 05:38:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cQhcpCk25ug920ivsMPjP6T7m430117oAW4p13zPKcs=; b=n1i29XwSGxL9vz
	mZIroEqTHJslVQTrE6x+Y+IrUvYiWBX613pnV3qAI2fSik5U6UfQb1K5ooD9eN6ObRCMy0qZj9H1h
	UfwZtMhjLz+IBBpIi+n5R45lcXOWK5T7qBm25Nupi06NjE773rT1JwpcWp6U+wbVQfohJl9SBNcV1
	mCiLpDmfXVL0rJJv5SEu9AAdoTaON77mfuaqyLh8NXya4EK0VTgbaqlk0dzIqt+vuNjNX2dbbTDXY
	nG4aFbjdNTkcHP4IDLaynqLicumIchFeEA2EQ5cx7i+l3p3KfTK8An3WoNYnZFN9VSVEh3tUkbgwa
	nr3Lzr9HK7d/HMS501nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n8FIL-007nn5-Ge; Fri, 14 Jan 2022 05:38:37 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n8FIJ-007nmQ-5p; Fri, 14 Jan 2022 05:38:36 +0000
X-UUID: f048b2ecb5eb4053a5a9be30063887bd-20220113
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=V12hrFvzoND7XFTwXzjwpbuyXiwP75RBtFiDlxGSn6Q=; 
 b=DoY1hQElKRsA9yIsYmkpI0frsGvZwoWMxAJqofXgL6Bsz9EFT47ujQ3zqJLONqMTuWGk9AluRP8BYehCJmhzL3V9jSsI7TLsJX1gZoxPNYnoERuPVBH4Th9xlcZICZzGcDc04L2Jg8ZDT69XwB16Dka6hpNlX+6NxvOiQ3bMjXE=;
X-UUID: f048b2ecb5eb4053a5a9be30063887bd-20220113
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <biao.huang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1750765129; Thu, 13 Jan 2022 22:38:28 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 13 Jan 2022 21:38:27 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Fri, 14 Jan 2022 13:38:25 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 14 Jan 2022 13:38:24 +0800
Message-ID: <14636842a61bb7631584315901bcc06ccbdb0f90.camel@mediatek.com>
Subject: Re: [PATCH net-next v10 6/6] net: dt-bindings: dwmac: add support
 for mt8195
From: Biao Huang <biao.huang@mediatek.com>
To: Rob Herring <robh@kernel.org>
CC: srv_heupstream <srv_heupstream@mediatek.com>, linux-arm-kernel
 <linux-arm-kernel@lists.infradead.org>, David Miller <davem@davemloft.net>,
 "moderated list:ARM/STM32 ARCHITECTURE"
 <linux-stm32@st-md-mailman.stormreply.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-mediatek@lists.infradead.org>, Giuseppe Cavallaro
 <peppe.cavallaro@st.com>, Jose Abreu <joabreu@synopsys.com>, netdev
 <netdev@vger.kernel.org>, <dkirjanov@suse.de>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, Macpaul Lin <macpaul.lin@mediatek.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, <devicetree@vger.kernel.org>,
 Jakub Kicinski <kuba@kernel.org>
Date: Fri, 14 Jan 2022 13:38:24 +0800
In-Reply-To: <CAL_JsqLo7z-KWtwFx+Kng2aQuCpQwJaO6mHnyBzmCKCJDK5n+Q@mail.gmail.com>
References: <20211216055328.15953-1-biao.huang@mediatek.com>
 <20211216055328.15953-7-biao.huang@mediatek.com>
 <1639662782.987227.4004875.nullmailer@robh.at.kernel.org>
 <be023f9d2fb2a8f947bd0075e8732ba07cfd7b89.camel@mediatek.com>
 <CAL_JsqLo7z-KWtwFx+Kng2aQuCpQwJaO6mHnyBzmCKCJDK5n+Q@mail.gmail.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220113_213835_247423_A4F6EF08 
X-CRM114-Status: GOOD (  23.43  )
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

On Tue, 2022-01-11 at 17:36 -0600, Rob Herring wrote:
> On Thu, Dec 16, 2021 at 8:06 PM Biao Huang <biao.huang@mediatek.com>
> wrote:
> > 
> > Dear Rob,
> >   Thanks for your comments~
> > 
> >   For mt8195, the eth device node will look like:
> >   eth: ethernet@11021000 {
> >     compatible = "mediatek,mt8195-gmac", "snps,dwmac-5.10a";
> >     ...
> >     clock-names = "axi",
> >                   "apb",
> >                   "mac_cg",
> >                   "mac_main",
> >                   "ptp_ref",
> >                   "rmii_internal";
> >     clocks = <&pericfg_ao CLK_PERI_AO_ETHERNET>,
> >              <&pericfg_ao CLK_PERI_AO_ETHERNET_BUS>,
> >              <&pericfg_ao CLK_PERI_AO_ETHERNET_MAC>,
> >              <&topckgen CLK_TOP_SNPS_ETH_250M>,
> >              <&topckgen CLK_TOP_SNPS_ETH_62P4M_PTP>,
> >              <&topckgen CLK_TOP_SNPS_ETH_50M_RMII>;
> >     ...
> >   }
> > 
> > 1. "rmii_internal" is a special clock only required for
> >    RMII phy interface, dwmac-mediatek.c will enable clocks
> >    invoking clk_bulk_prepare_enable(xx, 6) for RMII,
> >    and clk_bulk_prepare_enable(xx, 5) for other phy interfaces.
> >    so, mt2712/mt8195 all put "rmii_internal" clock to the
> >    end of clock list to simplify clock handling.
> > 
> >    If I put mac_cg as described above, a if condition is required
> > for clocks description in dt-binding, just like what I do in v7
> > send:
> >   - if:
> >       properties:
> >         compatible:
> >           contains:
> >             enum:
> >               - mediatek,mt2712-gmac
> > 
> >     then:
> >       properties:
> >         clocks:
> >           minItems: 5
> >           items:
> >             - description: AXI clock
> >             - description: APB clock
> >             - description: MAC Main clock
> >             - description: PTP clock
> >             - description: RMII reference clock provided by MAC
> > 
> >         clock-names:
> >           minItems: 5
> >           items:
> >             - const: axi
> >             - const: apb
> >             - const: mac_main
> >             - const: ptp_ref
> >             - const: rmii_internal
> > 
> >   - if:
> >       properties:
> >         compatible:
> >           contains:
> >             enum:
> >               - mediatek,mt8195-gmac
> > 
> >     then:
> >       properties:
> >         clocks:
> >           minItems: 6
> >           items:
> >             - description: AXI clock
> >             - description: APB clock
> >             - description: MAC clock gate
> >             - description: MAC Main clock
> >             - description: PTP clock
> >             - description: RMII reference clock provided by MAC
> > 
> >    This introduces some duplicated description.
> > 
> > 2. If I put "mac_cg" to the end of clock list,
> >    the dt-binding file can be simple just like
> >    what we do in this v10 patch(need fix warnings reported by "make
> > DT_CHECKER_FLAGS=-m dt_binding_check").
> > 
> >    But for mt8195:
> >      the eth node in dts should be modified,
> 
> I hope you are defining the binding before you use it... That's not
> good practice and not a valid argument.
> 
> >      and eth driver clock handling will be complex;
> 
> How so?
> 
> Rob
OK, I'll add a driver patch to make clock setting more reasonable,
and modify this patch as previous comments.

Thanks for your comments~
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
