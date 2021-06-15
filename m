Return-Path: <SRS0=q7ss=LJ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_2 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12E10C48BE5
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Jun 2021 18:34:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CFBCB61209
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Jun 2021 18:34:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CFBCB61209
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1D/xb3bVOFiwKVE74yOWamfO9w55qTSTch9s1F48TtU=; b=rKCQnxLdUlmug3
	2DYPbCmxKPYkWBF1dluQYWwl2o3nS9pdjeeKpzywT2KLTUbMqNNF+TZC9i3ksq36HNjdiTN6Jdr7e
	F7nMIDP5I2GVQMjoA+0eWYPfJumaNZEVDxDhtDq89csCtHaBE++tr2AcY01jMc8lBFoULK5bn8Xhq
	JzeCm8T1grRDyiiuCJpquIwm8oF+bFTgWiBKn3ZE34HiRaCY6GHHUkGTGditStvvaprmqTd1yy9Od
	Nw9jbPLpEycmv3s5Ff8AuXG1bVbyaIv9j3Vta+zYInA34OEP3fuyjkPJABcnVOnJmlOrwQfaxztmL
	keZOUPlaYd7y7u+Izr5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ltDsj-0029rq-LE; Tue, 15 Jun 2021 18:33:49 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lt9Pz-000E8e-4k; Tue, 15 Jun 2021 13:47:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
 :Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID:
 Sender:Reply-To:Content-ID:Content-Description;
 bh=JNXKNmpy51jBAsMEkhMZ98xjcuU+lc4j1vj8Rx5Ai8I=; b=krts4tl479NKvWX6fvGAzXzqoW
 HpulymS7KwpTJAxHsOgFQSDCsUnYN0nJQPeiUcNcuOeAxz5eZueH+DwLNiEh72CTiZg2a3U2MDilI
 1r745g/r9kce7kGmXXhwaw+dc+cEC7z64FqE/nVDHr2gOzyd0mFMWUTLC21UxqJthvN3LVgKUm/go
 ELDwXzWhsLTmAqNJtCBglPuV/qFBEZ9g/xUmmhMuRh0E8EEfFywG0hPcoKXxQOWZGfaIkFbyxtiz8
 KKvEhz5PyVHCtLeWwVwVex+i1ncNFyQnFfrTYxapVHCtYYpUydmMEKuNc0QxmWsAkWegm70wsOQOp
 j95xaxig==;
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lsyuW-007Gaf-0M; Tue, 15 Jun 2021 02:34:49 +0000
X-UUID: 4e238dad13774550939a5239ca9b8451-20210614
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=JNXKNmpy51jBAsMEkhMZ98xjcuU+lc4j1vj8Rx5Ai8I=; 
 b=pGi71SOzJXO1tj0nUNmn32NhoizTYmfootxQ2xckZVUdU2xFVvllMrFugcJ87D9CmVpL9c26088cfc/PJAah0GkL22rKI8CRTUxbxez/KcJNGLvnHLM5K3Up/oBR1wiuZKZjXOMr77ls8v6yiX+HkasoK/VZeSwrHBu3zVIC6RU=;
X-UUID: 4e238dad13774550939a5239ca9b8451-20210614
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <chun-jie.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 2098576690; Mon, 14 Jun 2021 19:34:40 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 14 Jun 2021 19:34:38 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 15 Jun 2021 10:34:37 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 15 Jun 2021 10:34:37 +0800
Message-ID: <c8e8535cef67adeaefcfe943bbd8287806921e03.camel@mediatek.com>
Subject: Re: [PATCH v9 01/22] dt-bindings: ARM: Mediatek: Add new document
 bindings of imp i2c wrapper controller
From: Chun-Jie Chen <chun-jie.chen@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>
CC: Nicolas Boichat <drinkcat@chromium.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>, <linux-clk@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <srv_heupstream@mediatek.com>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, Weiyi Lu
 <weiyi.lu@mediatek.com>
Date: Tue, 15 Jun 2021 10:34:37 +0800
In-Reply-To: <de082c64-ace3-30b5-7404-1f4b607a83e1@gmail.com>
References: <20210524122053.17155-1-chun-jie.chen@mediatek.com>
 <20210524122053.17155-2-chun-jie.chen@mediatek.com>
 <20210602171201.GA3566462@robh.at.kernel.org>
 <66e017401ab93aa02c5d2bbf11be9589b36649ac.camel@mediatek.com>
 <1f59ed31-4a0e-9719-bf84-1fe4cdd6c57d@gmail.com>
 <162334689784.9598.2709970788186333494@swboyd.mtv.corp.google.com>
 <de082c64-ace3-30b5-7404-1f4b607a83e1@gmail.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210615_033447_240770_2433134A 
X-CRM114-Status: GOOD (  35.77  )
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

On Fri, 2021-06-11 at 11:56 +0200, Matthias Brugger wrote:
> 
> On 10/06/2021 19:41, Stephen Boyd wrote:
> > Quoting Matthias Brugger (2021-06-08 07:45:49)
> > > 
> > > 
> > > On 07/06/2021 07:20, Chun-Jie Chen wrote:
> > > > On Wed, 2021-06-02 at 12:12 -0500, Rob Herring wrote:
> > > > > > +
> > > > > > +description:
> > > > > > +  The Mediatek imp i2c wrapper controller provides
> > > > > > functional
> > > > > > configurations and clocks to the system.
> > > > > > +
> > > > > > +properties:
> > > > > > +  compatible:
> > > > > > +    items:
> > > > > > +      - enum:
> > > > > > +          - mediatek,mt8192-imp_iic_wrap_c
> > > > > > +          - mediatek,mt8192-imp_iic_wrap_e
> > > > > > +          - mediatek,mt8192-imp_iic_wrap_s
> > > > > > +          - mediatek,mt8192-imp_iic_wrap_ws
> > > > > > +          - mediatek,mt8192-imp_iic_wrap_w
> > > > > > +          - mediatek,mt8192-imp_iic_wrap_n
> > > > > 
> > > > > Looks to me like these are all the same h/w, but just have
> > > > > differing 
> > > > > sets of clocks. That's not really a reason to have different 
> > > > > compatibles. 
> > > > > 
> > > > > If you need to know what clocks are present, you can walk the
> > > > > DT for 
> > > > > all 'clocks' properties matching this clock controller
> > > > > instance. Or
> > > > > use 
> > > > > 'clock-indices' to define which ones are present.
> > 
> > Is the idea to use clock-indices and then list all the clock ids in
> > there and match them up at driver probe time to register the clocks
> > provided by the IO region? Feels like we'll do a lot of parsing at
> > each
> > boot to match up structures and register clks with the clk
> > framework.
> > 
> > If it's like other SoCs then the clk id maps to a hard macro for a
> > type
> > of clk, and those hard macros have been glued together with other
> > clks
> > and then partitioned into different IO regions to make up a clock
> > controller. Or maybe in this case, those clk hard macros have been
> > scattered into each IP block like SPI, i2c, uart, etc. so that the
> > clock
> > controller doesn't really exist and merely the gates and rate
> > control
> > (mux/divider) for the clk that's clocking some particular IP block
> > all
> > live inside the IP wrapper. If it's this case then I hope there are
> > a
> > bunch of PLLs that are fixed rate so that the i2c clk doesn't have
> > to go
> > outside the wrapper to change frequency (of which there should be
> > two
> > "standard" frequencies anyway).
> > 
> > > > > 
> > > > > Rob
> > > > 
> > > > Some module is divided to sub-modules which are designed in
> > > > different
> > > > h/w blocks for different usage, and if we want to use the same
> > > > compatible to present these h/w blocks, we need to move the
> > > > clock data
> > > > provided by these h/w blocks to dts, but we usually use
> > > > different
> > > > compatible to get the h/w blocks data in
> > > > Mediatek's clock driver, so do you suggest to register clock
> > > > provided
> > > > by different h/w blocks using same compatible?
> > > > 
> > > 
> > > The mapping of them is as following:
> > > imp_iic_wrap_c:  11007000
> > > imp_iic_wrap_e:  11cb1000
> > > imp_iic_wrap_s:  11d03000
> > > imp_iic_wrap_ws: 11d23000
> > > imp_iic_wrap_w:  11e01000
> > > imp_iic_wrap_n:  11f02000
> > > 
> > 
> > Sure. What is their purpose though? Are they simply a bunch of
> > different
> > i2c clks?
> > 
> 
> That would be need to be answered by MediaTek as I don't have access
> to any
> documentation.
> 
> Regards,
> Matthias

We describe which clock controllers are exist in dts and
get the clock data provided by clock controller in driver data
by matching device compatible.

The clock data contains several clocks which includes the clock index,
parent clock source and the details of reg control inside the IP block
of clock controller.

In MT8192 platform, some IP block is divide to several sub-blocks and
each sub-block provides clock control by itself.

Best Regards,
Chun-Jie
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
