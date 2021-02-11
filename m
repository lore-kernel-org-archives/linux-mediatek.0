Return-Path: <SRS0=qwtc=HN=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D31FCC433DB
	for <linux-mediatek@archiver.kernel.org>; Thu, 11 Feb 2021 03:27:14 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 465DB64EBB
	for <linux-mediatek@archiver.kernel.org>; Thu, 11 Feb 2021 03:27:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 465DB64EBB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:Date:To:From:Subject:References:
	In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=LXPerbPiPwGDPJaBZ4wEeCqD8pTEknQYUHTpHU7fcok=; b=YYsDUBuv1Bcfmqn8hINWCWQEQ
	U3R2lUAqGA/qw+DwfMkKhbFRcsqCuRwfSDb9saIgZP8Fow1rCnb14BbZFJpkaP0Kctq52hDkkKL2y
	5YlIUVsKFpxG58S/DnW6Jz5ZtENrKyW0qGyIvMtCHL2AzfjCozhaYlbnYhrwRKXd8XpFRLhufsGYH
	pDSW0KvoVWFFSMuddoSUOOGg5EC99iYlGOO2NoqCQhLAjJw6foM2/nqs4zrf3sI84/qRpOwpbTahQ
	WcY64HyWJSul1MNE+yrMmwb23kchPqPrmD5T3BA0mtb1pT44k3tCyxy4JnO5GpAIl0ioXLJHLmGF0
	63LkF0BTQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lA2dE-00032F-Ve; Thu, 11 Feb 2021 03:27:05 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lA2dB-00031Y-EJ; Thu, 11 Feb 2021 03:27:02 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 99CB064DDA;
 Thu, 11 Feb 2021 03:27:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1613014020;
 bh=PCiw2rBG+NnKh3mugRkCiTperZH5eqqJY5RdAXR3cbs=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=PH1IwJLvbZ5s6LMertC03KILBTRO3b1ofB3HuAwBxY6XspnkdGT5EAHbmVigd7FPi
 f+EXFJZ9m516Ss85NYv+MnmFWkKzKNqku5U4CkKU664kUVNhG/XmW+bUclyLsjedrg
 4976k2+4v21SBVzBRbsH0RZHngWnU3oPjQEbkd78qWjrOesiSTFeiFkwqzjl1Pwdew
 p627CHsBL15h2Dhr3BclTCIZC9nz24LEm6dUgvBXlsOukuF+xrX6sVRqybAxTrkIjj
 /uFz+dgGM+zP1iFnNnLPWFjsXo2PxTB+2rZKselQM4uwjacAOauZhA+simLZXfkGEn
 X1u9sGp0i5yQQ==
MIME-Version: 1.0
In-Reply-To: <YAxuE8un+nznqtSx@pendragon.ideasonboard.com>
References: <1560138293-4163-1-git-send-email-weiyi.lu@mediatek.com>
 <20190625221415.B0DC22086D@mail.kernel.org>
 <1561511122.24282.10.camel@mtksdaap41>
 <20190626035246.4591A20659@mail.kernel.org>
 <YAxuE8un+nznqtSx@pendragon.ideasonboard.com>
Subject: Re: [RFC v1] clk: core: support clocks that need to be enabled during
 re-parent
From: Stephen Boyd <sboyd@kernel.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Date: Wed, 10 Feb 2021 19:26:59 -0800
Message-ID: <161301401933.1254594.17328948754641721355@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210210_222701_645974_156111A3 
X-CRM114-Status: GOOD (  34.06  )
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
Cc: James Liao <jamesjj.liao@mediatek.com>, srv_heupstream@mediatek.com,
 Weiyi Lu <weiyi.lu@mediatek.com>, Biao Huang <biao.huang@mediatek.com>,
 linux-kernel@vger.kernel.org, Fan Chen <fan.chen@mediatek.com>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Quoting Laurent Pinchart (2021-01-23 10:42:27)
> Hi Stephen,
> 
> On Tue, Jun 25, 2019 at 08:52:45PM -0700, Stephen Boyd wrote:
> > Quoting Weiyi Lu (2019-06-25 18:05:22)
> > > On Tue, 2019-06-25 at 15:14 -0700, Stephen Boyd wrote:
> > > > Quoting Weiyi Lu (2019-06-09 20:44:53)
> > > > > When using property assigned-clock-parents to assign parent clocks,
> > > > > core clocks might still be disabled during re-parent.
> > > > > Add flag 'CLK_OPS_CORE_ENABLE' for those clocks must be enabled
> > > > > during re-parent.
> > > > > 
> > > > > Signed-off-by: Weiyi Lu <weiyi.lu@mediatek.com>
> > > > 
> > > > Can you further describe the scenario where this is a problem? Is it
> > > > some sort of clk that is enabled by default out of the bootloader and is
> > > > then configured to have an 'assigned-clock-parents' property to change
> > > > the parent, but that clk needs to be "enabled" so that the framework
> > > > turns on the parents for the parent switch?
> > > 
> > > When driver is built as module(.ko) and install at runtime after the
> > > whole initialization stage. Clk might already be turned off before
> > > configuring by assigned-clock-parents. For such clock design that need
> > > to have clock enabled during re-parent, the configuration of
> > > assigned-clock-parents might be failed. That's the problem we have now.
> > 
> > Great. Please put this sort of information in the commit text.
> > 
> > > Do you have any suggestion for such usage of clocks? Many thanks.
> > 
> > Ok, and in this case somehow CLK_OPS_PARENT_ENABLE flag doesn't work? Is
> > that because the clk itself doesn't do anything unless it's enabled?  I
> > seem to recall that we usually work around this by caching the state of
> > the clk parents or frequencies and then when the clk prepare or enable
> > op is called we actually write the hardware to change the state. There
> > are some qcom clks like this and we basically just use the hardware
> > itself to cache the state of the clk while it hasn't actually changed to
> > be at that rate, because the clk is not enabled yet.
> 
> I'm trying to move the fix to the clock driver itself. Do you have any
> pointer to such a clock that I can use as an example ?

This reminds me of some stuff we did in the qcom clk driver to handle
shared clks. Look at clk_rcg2_shared_ops in drivers/clk/qcom/clk-rcg2.c
for some more details. But there we have hardware that allows you to
write new settings but not set the "go" bit that actually switches the
mux/divider to a new rate. The non-linux entity using the clks doesn't
care what rate the clk is running at, it needs to just make sure the clk
turns on so it can do its thing. But the problem is the clk can be
turned on and off at random and that gets the clk stuck, so we put the
clk at some safe frequency that is always on (XO) and let the other side
go wild. But to the kernel we want it to think the rate is still what it
was set to, so we cache away the rate the kernel thinks in the hardware
and don't set the "go" bit so that when we enable the clk again in linux
it will reconfigure the clk to be the rate we want.

If you don't have that hardware then I suppose you'll have to cache the
register value in the set_rate clk op and return that cached value from
recalc_rate but only write the register value on the prepare/enable
path. Should be doable, but not a lot of fun! It may also be possible to
have some clk flag that makes the core do this for you by calling the
set_rate() call at the right time.

> 
> > The main concern is that we're having to turn on clks to make things
> > work, when it would be best to not turn on clks just so that register
> > writes actually make a difference to what the hardware does.
> 
> I agree, it's best not to turn the clock on if we can avoid it.
>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
