Return-Path: <SRS0=NTS1=G2=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34232C433E0
	for <linux-mediatek@archiver.kernel.org>; Sat, 23 Jan 2021 18:43:08 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D5C9F22B2B
	for <linux-mediatek@archiver.kernel.org>; Sat, 23 Jan 2021 18:43:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D5C9F22B2B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=SfE2NC8ZOES5GciIt7XBpvE1H+siHkanfLSCO1+RAgE=; b=BkGV+wDcj/Ylmoc+oqkehhxyA
	eDtKqG+JNjNxw85rCYxZ7FcsfS5BYY2nRuJxPCACV8AXEmHY0vts7wj9+FTJbiPCgPWhj/CAloK5G
	/fJuADI+EjOiDHP1hXIKkTCyw76KwX/exvA0CXQ4/pXb1TTxQPnZLT+JEkhVLZmndvadP4W5FKtkN
	HktJ9NEbveQ4RXH2/apOUR08GxpDH5bsaU5846RClj6uoUrgL703xh/nHeC2IgS3r2coW94YNRHVV
	94o//ANGu7GeXm+t2qRVoZ3/QqCJj4K++TGKFO6bKz4ErXUc961SSL+B7/Zw/TklhcSWPoqoywJNF
	x7drnO9bA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l3Ns7-0004Zr-Dz; Sat, 23 Jan 2021 18:42:55 +0000
Received: from perceval.ideasonboard.com
 ([2001:4b98:dc2:55:216:3eff:fef7:d647])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l3Ns4-0004ZF-5o; Sat, 23 Jan 2021 18:42:53 +0000
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 36C9B4FB;
 Sat, 23 Jan 2021 19:42:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1611427367;
 bh=W2pDXraJ4uax2rWMnZAIrwBwRlIuxMsEVFuamq4Yngk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=pmAq63tKt0HQ2TF3W2uSd31/posqBe/CKjbVL/aTiosiVmm4HDYTVPdlar/oqfyY+
 ypkvSmTiVzKsuNcH+FQLZqSAbPm6hEkblgQH6fsY2uYeqdvBbgi4/i6DxUbo8wYA6y
 hV5WlYp+6TduGE28rkP+aXt1L0FgLjDft2/CKixM=
Date: Sat, 23 Jan 2021 20:42:27 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [RFC v1] clk: core: support clocks that need to be enabled
 during re-parent
Message-ID: <YAxuE8un+nznqtSx@pendragon.ideasonboard.com>
References: <1560138293-4163-1-git-send-email-weiyi.lu@mediatek.com>
 <20190625221415.B0DC22086D@mail.kernel.org>
 <1561511122.24282.10.camel@mtksdaap41>
 <20190626035246.4591A20659@mail.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190626035246.4591A20659@mail.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210123_134252_413015_CD6433CF 
X-CRM114-Status: GOOD (  24.92  )
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

Hi Stephen,

On Tue, Jun 25, 2019 at 08:52:45PM -0700, Stephen Boyd wrote:
> Quoting Weiyi Lu (2019-06-25 18:05:22)
> > On Tue, 2019-06-25 at 15:14 -0700, Stephen Boyd wrote:
> > > Quoting Weiyi Lu (2019-06-09 20:44:53)
> > > > When using property assigned-clock-parents to assign parent clocks,
> > > > core clocks might still be disabled during re-parent.
> > > > Add flag 'CLK_OPS_CORE_ENABLE' for those clocks must be enabled
> > > > during re-parent.
> > > > 
> > > > Signed-off-by: Weiyi Lu <weiyi.lu@mediatek.com>
> > > 
> > > Can you further describe the scenario where this is a problem? Is it
> > > some sort of clk that is enabled by default out of the bootloader and is
> > > then configured to have an 'assigned-clock-parents' property to change
> > > the parent, but that clk needs to be "enabled" so that the framework
> > > turns on the parents for the parent switch?
> > 
> > When driver is built as module(.ko) and install at runtime after the
> > whole initialization stage. Clk might already be turned off before
> > configuring by assigned-clock-parents. For such clock design that need
> > to have clock enabled during re-parent, the configuration of
> > assigned-clock-parents might be failed. That's the problem we have now.
> 
> Great. Please put this sort of information in the commit text.
> 
> > Do you have any suggestion for such usage of clocks? Many thanks.
> 
> Ok, and in this case somehow CLK_OPS_PARENT_ENABLE flag doesn't work? Is
> that because the clk itself doesn't do anything unless it's enabled?  I
> seem to recall that we usually work around this by caching the state of
> the clk parents or frequencies and then when the clk prepare or enable
> op is called we actually write the hardware to change the state. There
> are some qcom clks like this and we basically just use the hardware
> itself to cache the state of the clk while it hasn't actually changed to
> be at that rate, because the clk is not enabled yet.

I'm trying to move the fix to the clock driver itself. Do you have any
pointer to such a clock that I can use as an example ?

> The main concern is that we're having to turn on clks to make things
> work, when it would be best to not turn on clks just so that register
> writes actually make a difference to what the hardware does.

I agree, it's best not to turn the clock on if we can avoid it.

-- 
Regards,

Laurent Pinchart

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
