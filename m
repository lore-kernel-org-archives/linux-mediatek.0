Return-Path: <SRS0=J0kT=LE=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 511DEC48BD1
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Jun 2021 17:42:08 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 08E6C613F1
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Jun 2021 17:42:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 08E6C613F1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:To:Cc:From:Subject:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FjGuuP2R0oTNTsql256a4UIZKrxfUGntJNAZYfPjidQ=; b=Sm4vFu9FizxLzf
	WUPVn4bQPqBmd/74CO+3U1v5Wt1Scnb/x839JwCBykdWvHIfgDrJ5HZsWXPH4Ka+q/wQ8htutCHU9
	x/MZMAY9+LwfIbRmoTfk6OGxVhZYkinCVzCkeQOrnpyGDQLTBiN5sY7o6odNFopTu8Th3Xyf1mOAX
	t7FGeT0atW/1F5PSTJC8zJKICmyFVDqPIZFIbeKmkKs4HRLmUaJgEdG/cpw4mJnLvGDbJ7dUham1f
	w8JeOvekz5g6KIrMtP9wxGPBbZMkqGVXL/3mG5cAFzXF0gQDGDMHArpy1gRrhrjMdFjhchQv9uR8h
	GWy+/5jrE6js14g4cHJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lrOgk-001xs2-7q; Thu, 10 Jun 2021 17:41:54 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lrOgV-001xpf-RU; Thu, 10 Jun 2021 17:41:41 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1A19C61181;
 Thu, 10 Jun 2021 17:41:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1623346899;
 bh=0u44FGC7a3WziiHbQXDAv94V5GjTa76Zwoqq1R/GQjw=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=shvP2bsedRa/2cISQn9YjvkvBzNfK1+DOwX24BdQsY/msUbHFudDXSaTCpZf0s9VT
 cVN/K/c1J8qzWZvkGVRPGH3qvnZ9w+TSPYZ4sHik6rbpEDGcXQDqskzydtC9Z/vG96
 sVwNijBS0/PLK83Zz2h9gxr4FRb14cKhxxbRMVhgTDuVA5sKGrhxcdvcPaoTiAUdAs
 Jn8DbSCniWqOllpiAjska/fEk4jJwnfnqnl1d8cOD2Z6nZZfEK4frRZyaW5ogs03bW
 FUDKty9KNZ1km4ycpAf3QNpMICQTBlJpA13fF4cyDxjkX94G91mEbB2ySTc3BjuDqK
 fmj421TqhldfQ==
MIME-Version: 1.0
In-Reply-To: <1f59ed31-4a0e-9719-bf84-1fe4cdd6c57d@gmail.com>
References: <20210524122053.17155-1-chun-jie.chen@mediatek.com>
 <20210524122053.17155-2-chun-jie.chen@mediatek.com>
 <20210602171201.GA3566462@robh.at.kernel.org>
 <66e017401ab93aa02c5d2bbf11be9589b36649ac.camel@mediatek.com>
 <1f59ed31-4a0e-9719-bf84-1fe4cdd6c57d@gmail.com>
Subject: Re: [PATCH v9 01/22] dt-bindings: ARM: Mediatek: Add new document
 bindings of imp i2c wrapper controller
From: Stephen Boyd <sboyd@kernel.org>
Cc: Nicolas Boichat <drinkcat@chromium.org>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, srv_heupstream@mediatek.com,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Weiyi Lu <weiyi.lu@mediatek.com>
To: Chun-Jie Chen <chun-jie.chen@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh@kernel.org>
Date: Thu, 10 Jun 2021 10:41:37 -0700
Message-ID: <162334689784.9598.2709970788186333494@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210610_104139_972169_2726AE10 
X-CRM114-Status: GOOD (  22.88  )
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

Quoting Matthias Brugger (2021-06-08 07:45:49)
> 
> 
> On 07/06/2021 07:20, Chun-Jie Chen wrote:
> > On Wed, 2021-06-02 at 12:12 -0500, Rob Herring wrote:
> >>> +
> >>> +description:
> >>> +  The Mediatek imp i2c wrapper controller provides functional
> >>> configurations and clocks to the system.
> >>> +
> >>> +properties:
> >>> +  compatible:
> >>> +    items:
> >>> +      - enum:
> >>> +          - mediatek,mt8192-imp_iic_wrap_c
> >>> +          - mediatek,mt8192-imp_iic_wrap_e
> >>> +          - mediatek,mt8192-imp_iic_wrap_s
> >>> +          - mediatek,mt8192-imp_iic_wrap_ws
> >>> +          - mediatek,mt8192-imp_iic_wrap_w
> >>> +          - mediatek,mt8192-imp_iic_wrap_n
> >>
> >> Looks to me like these are all the same h/w, but just have differing 
> >> sets of clocks. That's not really a reason to have different 
> >> compatibles. 
> >>
> >> If you need to know what clocks are present, you can walk the DT for 
> >> all 'clocks' properties matching this clock controller instance. Or
> >> use 
> >> 'clock-indices' to define which ones are present.

Is the idea to use clock-indices and then list all the clock ids in
there and match them up at driver probe time to register the clocks
provided by the IO region? Feels like we'll do a lot of parsing at each
boot to match up structures and register clks with the clk framework.

If it's like other SoCs then the clk id maps to a hard macro for a type
of clk, and those hard macros have been glued together with other clks
and then partitioned into different IO regions to make up a clock
controller. Or maybe in this case, those clk hard macros have been
scattered into each IP block like SPI, i2c, uart, etc. so that the clock
controller doesn't really exist and merely the gates and rate control
(mux/divider) for the clk that's clocking some particular IP block all
live inside the IP wrapper. If it's this case then I hope there are a
bunch of PLLs that are fixed rate so that the i2c clk doesn't have to go
outside the wrapper to change frequency (of which there should be two
"standard" frequencies anyway).

> >>
> >> Rob
> > 
> > Some module is divided to sub-modules which are designed in different
> > h/w blocks for different usage, and if we want to use the same
> > compatible to present these h/w blocks, we need to move the clock data
> > provided by these h/w blocks to dts, but we usually use different
> > compatible to get the h/w blocks data in
> > Mediatek's clock driver, so do you suggest to register clock provided
> > by different h/w blocks using same compatible?
> > 
> 
> The mapping of them is as following:
> imp_iic_wrap_c:  11007000
> imp_iic_wrap_e:  11cb1000
> imp_iic_wrap_s:  11d03000
> imp_iic_wrap_ws: 11d23000
> imp_iic_wrap_w:  11e01000
> imp_iic_wrap_n:  11f02000
> 

Sure. What is their purpose though? Are they simply a bunch of different
i2c clks?

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
