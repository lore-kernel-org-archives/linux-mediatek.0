Return-Path: <SRS0=zNLT=LW=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55955C2B9F4
	for <linux-mediatek@archiver.kernel.org>; Mon, 28 Jun 2021 12:57:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 12FD661C67
	for <linux-mediatek@archiver.kernel.org>; Mon, 28 Jun 2021 12:57:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 12FD661C67
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0+aVG5Mdtiad6fRylO91a42qz+KuZyD6sVNwvPXov9U=; b=GPdcgAvMTWzVB/
	5greoQCbQ7N2sJdzW+MT37gduGbMAMypcr6xsN1UE4uz4RAa/munMSRLA18vzKDg+Xpp4Lle01IiU
	8bPjvk7Aq/mlbCany87ljZVHk8uIjYD5sObnCy/jNRD7xpEU24GFcfy7zi9iCB5zL9JaxsQmKyd85
	QACUWyg8tq/fJUR+lyG5WB4EP87ceZ9m8QHSp9jAvqOQBmYtyGXEnloUh8s1y60mf7D6oXtFIuZZm
	nTfZGlkE2I71IuZWKp8eWTeuwz1JDKdJmjsClRV9jhU3absWteWyp0Xxtc2TcbkNxcezua/UMNsiH
	yEvz62i+qCcLJDhOVo+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lxqp1-00859I-1g; Mon, 28 Jun 2021 12:57:07 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lxqow-00858C-13; Mon, 28 Jun 2021 12:57:05 +0000
X-UUID: 5718fec195de45018032485778257c56-20210628
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=GL+Mjjx8Quv417PA3VfwMr1zQDua99oGX3zukE+Amuo=; 
 b=Y8Bq90wgQaXu48ZkWANJLdqNwixUSzCHS9hjxlMW5JaQz8rTndR4O5U5OZxkv1Kk0yjpMKd8uyd7T3Z/XGKSzXTL0+iFTmF+4tDX4mmeJGGsmix9KOgwqvQAek9NDefXO4Nvtezeesizjp45M37WKdzpa32wVuUv/3ZLS8vDEyU=;
X-UUID: 5718fec195de45018032485778257c56-20210628
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <chun-jie.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1589800074; Mon, 28 Jun 2021 05:56:56 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 28 Jun 2021 05:56:54 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 28 Jun 2021 20:56:52 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 28 Jun 2021 20:56:52 +0800
Message-ID: <cb333907c9ddc33aa95b96b8352a4f670fd32147.camel@mediatek.com>
Subject: Re: [PATCH v9 01/22] dt-bindings: ARM: Mediatek: Add new document
 bindings of imp i2c wrapper controller
From: Chun-Jie Chen <chun-jie.chen@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Chen-Yu Tsai
 <wenst@chromium.org>, Stephen Boyd <sboyd@kernel.org>
CC: Rob Herring <robh@kernel.org>, Nicolas Boichat <drinkcat@chromium.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>, <linux-clk@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <srv_heupstream@mediatek.com>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, Weiyi Lu
 <weiyi.lu@mediatek.com>, <Kewei.Xu@mediatek.com>
Date: Mon, 28 Jun 2021 20:56:52 +0800
In-Reply-To: <5c0a88c7-7f64-fd00-4e0c-2b3163926f71@gmail.com>
References: <20210524122053.17155-1-chun-jie.chen@mediatek.com>
 <20210524122053.17155-2-chun-jie.chen@mediatek.com>
 <20210602171201.GA3566462@robh.at.kernel.org>
 <66e017401ab93aa02c5d2bbf11be9589b36649ac.camel@mediatek.com>
 <1f59ed31-4a0e-9719-bf84-1fe4cdd6c57d@gmail.com>
 <162334689784.9598.2709970788186333494@swboyd.mtv.corp.google.com>
 <de082c64-ace3-30b5-7404-1f4b607a83e1@gmail.com>
 <c8e8535cef67adeaefcfe943bbd8287806921e03.camel@mediatek.com>
 <CAGXv+5HcV6jbyDdZGzRX-2NHMztSONBKxmLxLQX6k+aQrwJ1ww@mail.gmail.com>
 <5c0a88c7-7f64-fd00-4e0c-2b3163926f71@gmail.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210628_055703_524575_DCF24E05 
X-CRM114-Status: GOOD (  52.06  )
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

On Fri, 2021-06-18 at 15:50 +0200, Matthias Brugger wrote:
> 
> On 18/06/2021 08:32, Chen-Yu Tsai wrote:
> > On Wed, Jun 16, 2021 at 2:34 AM Chun-Jie Chen
> > <chun-jie.chen@mediatek.com> wrote:
> > > 
> > > On Fri, 2021-06-11 at 11:56 +0200, Matthias Brugger wrote:
> > > > 
> > > > On 10/06/2021 19:41, Stephen Boyd wrote:
> > > > > Quoting Matthias Brugger (2021-06-08 07:45:49)
> > > > > > 
> > > > > > 
> > > > > > On 07/06/2021 07:20, Chun-Jie Chen wrote:
> > > > > > > On Wed, 2021-06-02 at 12:12 -0500, Rob Herring wrote:
> > > > > > > > > +
> > > > > > > > > +description:
> > > > > > > > > +  The Mediatek imp i2c wrapper controller provides
> > > > > > > > > functional
> > > > > > > > > configurations and clocks to the system.
> > > > > > > > > +
> > > > > > > > > +properties:
> > > > > > > > > +  compatible:
> > > > > > > > > +    items:
> > > > > > > > > +      - enum:
> > > > > > > > > +          - mediatek,mt8192-imp_iic_wrap_c
> > > > > > > > > +          - mediatek,mt8192-imp_iic_wrap_e
> > > > > > > > > +          - mediatek,mt8192-imp_iic_wrap_s
> > > > > > > > > +          - mediatek,mt8192-imp_iic_wrap_ws
> > > > > > > > > +          - mediatek,mt8192-imp_iic_wrap_w
> > > > > > > > > +          - mediatek,mt8192-imp_iic_wrap_n
> > > > > > > > 
> > > > > > > > Looks to me like these are all the same h/w, but just
> > > > > > > > have
> > > > > > > > differing
> > > > > > > > sets of clocks. That's not really a reason to have
> > > > > > > > different
> > > > > > > > compatibles.
> > > > > > > > 
> > > > > > > > If you need to know what clocks are present, you can
> > > > > > > > walk the
> > > > > > > > DT for
> > > > > > > > all 'clocks' properties matching this clock controller
> > > > > > > > instance. Or
> > > > > > > > use
> > > > > > > > 'clock-indices' to define which ones are present.
> > > > > 
> > > > > Is the idea to use clock-indices and then list all the clock
> > > > > ids in
> > > > > there and match them up at driver probe time to register the
> > > > > clocks
> > > > > provided by the IO region? Feels like we'll do a lot of
> > > > > parsing at
> > > > > each
> > > > > boot to match up structures and register clks with the clk
> > > > > framework.
> > > > > 
> > > > > If it's like other SoCs then the clk id maps to a hard macro
> > > > > for a
> > > > > type
> > > > > of clk, and those hard macros have been glued together with
> > > > > other
> > > > > clks
> > > > > and then partitioned into different IO regions to make up a
> > > > > clock
> > > > > controller. Or maybe in this case, those clk hard macros have
> > > > > been
> > > > > scattered into each IP block like SPI, i2c, uart, etc. so
> > > > > that the
> > > > > clock
> > > > > controller doesn't really exist and merely the gates and rate
> > > > > control
> > > > > (mux/divider) for the clk that's clocking some particular IP
> > > > > block
> > > > > all
> > > > > live inside the IP wrapper. If it's this case then I hope
> > > > > there are
> > > > > a
> > > > > bunch of PLLs that are fixed rate so that the i2c clk doesn't
> > > > > have
> > > > > to go
> > > > > outside the wrapper to change frequency (of which there
> > > > > should be
> > > > > two
> > > > > "standard" frequencies anyway).
> > > > > 
> > > > > > > > 
> > > > > > > > Rob
> > > > > > > 
> > > > > > > Some module is divided to sub-modules which are designed
> > > > > > > in
> > > > > > > different
> > > > > > > h/w blocks for different usage, and if we want to use the
> > > > > > > same
> > > > > > > compatible to present these h/w blocks, we need to move
> > > > > > > the
> > > > > > > clock data
> > > > > > > provided by these h/w blocks to dts, but we usually use
> > > > > > > different
> > > > > > > compatible to get the h/w blocks data in
> > > > > > > Mediatek's clock driver, so do you suggest to register
> > > > > > > clock
> > > > > > > provided
> > > > > > > by different h/w blocks using same compatible?
> > > > > > > 
> > > > > > 
> > > > > > The mapping of them is as following:
> > > > > > imp_iic_wrap_c:  11007000
> > > > > > imp_iic_wrap_e:  11cb1000
> > > > > > imp_iic_wrap_s:  11d03000
> > > > > > imp_iic_wrap_ws: 11d23000
> > > > > > imp_iic_wrap_w:  11e01000
> > > > > > imp_iic_wrap_n:  11f02000
> > > > > > 
> > > > > 
> > > > > Sure. What is their purpose though? Are they simply a bunch
> > > > > of
> > > > > different
> > > > > i2c clks?
> > > > > 
> > > > 
> > > > That would be need to be answered by MediaTek as I don't have
> > > > access
> > > > to any
> > > > documentation.
> > > > 
> > > > Regards,
> > > > Matthias
> > > 
> > > We describe which clock controllers are exist in dts and
> > > get the clock data provided by clock controller in driver data
> > > by matching device compatible.
> > > 
> > > The clock data contains several clocks which includes the clock
> > > index,
> > > parent clock source and the details of reg control inside the IP
> > > block
> > > of clock controller.
> > > 
> > > In MT8192 platform, some IP block is divide to several sub-blocks 
> > > and
> > > each sub-block provides clock control by itself.
> > 
> > Some more information:
> > 
> > Based on what I read in the datasheets, I'm guessing that MediaTek
> > groups
> > the I2C controllers into several groups and places them in
> > different parts
> > of the die. The suffix of imp_iic_wrap_XXX is likely pointing to
> > the
> > placement of the group. And the imp_iic_wrap_XXX is what the name
> > suggests
> > a wrapper around the group of I2C controllers. The wrapper contains
> > clock
> > and reset controls, as well as other things that I can't make out.
> > 
> 
> Thanks for the clarification. If the wrapper contains more then just
> clocks,
> then probably we will need a solution as done by MMSYS subsystem.
> Would be good
> if you could work with MediaTek to find out what exactly this
> wrappers contain,
> to get a better picture of if we need an additional driver or not.
> 
> Regards,
> Matthias

+ Kewei

Hi Matthias,

After discuss with i2c owenr(Kewei) in mediatek, although the HW block
of imp_iic_wrap_XXX contains more than just clock, but we only use the
clock part in this HW block and just consider that imp_iic_wrap_XXX is
a pure clock provider.

Thanks!
Best Regards,
Chun-Jie
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
