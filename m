Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B3BAC433EF
	for <linux-mediatek@archiver.kernel.org>; Tue,  1 Feb 2022 22:20:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=B9ybuiL26M3UaoFc4BW2R3QRswzQv9CRBwCViWtSRBs=; b=iWpnWWs/o2dpcx
	qaRBM4uhLbDdJSRV/7aLA9mewB93Qj6/wHUAQb7y4+Xu90mEnl+7EI9YZq7ofuXVLLJTFmCNqc9HX
	sZkRYjAZ/nNPqB6KMtImzDa5a/IIfH7DaWtA6omIti9aKgpYkkbYPY4GB3gLQdv/7ViVePMEclbMx
	3ESXAFDOvlLVgFHPoo5fCSKEhGpLEZAW/+FxWJgRT4GLiwhtQ3nsH9OCeyXRDRwFafMVIJtaPhvgV
	7hYwCYqceUuCF7WGM4FC4xdNPzR5bpiQipLg48JFha0C1tMBKkbybqmqe4mR8fzKH4ToXnlD1bU6p
	vCu/2pUtRADcmILjzM+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nF1VZ-00DlUS-Ai; Tue, 01 Feb 2022 22:20:17 +0000
Received: from fudo.makrotopia.org ([2a07:2ec0:3002::71])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nF1VW-00DlSf-2E; Tue, 01 Feb 2022 22:20:15 +0000
Received: from local
 by fudo.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
 (Exim 4.94.2) (envelope-from <daniel@makrotopia.org>)
 id 1nF1VK-0004B3-6t; Tue, 01 Feb 2022 23:20:02 +0100
Date: Tue, 1 Feb 2022 22:19:59 +0000
From: Daniel Golle <daniel@makrotopia.org>
To: Jiasheng Jiang <jiasheng@iscas.ac.cn>
Cc: justinkb@gmail.com, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, lgirdwood@gmail.com,
 broonie@kernel.org, linux-mediatek@lists.infradead.org,
 matthias.bgg@gmail.com, linux-arm-kernel@lists.infradead.org
Subject: Re: BUG: [PATCH v2] isoc: mediatek: Check for error clk pointer
Message-ID: <YfmyD7bmJS9f+e+m@makrotopia.org>
References: <20220130024335.114461-1-jiasheng@iscas.ac.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220130024335.114461-1-jiasheng@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220201_142014_133157_6AE5BB6C 
X-CRM114-Status: GOOD (  26.92  )
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

On Sun, Jan 30, 2022 at 10:43:35AM +0800, Jiasheng Jiang wrote:
> On Fri, Jan 28, 2022 at 10:26:51PM +0800, Paul Mulders wrote:
> > I guess this breaks all MT7622 SoCs since it'll prematurely exit
> > init_clks (and subsequently init_scp) completely once devm_clk_get
> > fails to get a reference to the mm clock producer (which happens to be
> > the first one tried). This is because MT7623 has a GPU (so no mm
> > clock) and MT7622 doesn't, and as a result the other clock producer
> > pointers never get initialized (and other stuff in init_scp after
> > returning from the error never happens).
> >
> > The patch seems fundamentally flawed, I guess it was either not tested
> > at all, or only tested on a MT7623. The initialization functions seem
> > designed with the idea that it's ok if some clocks aren't present, so
> > stopping the initialization when one of them isn't present seems
> > wrong. (For example, there is also a MT7622B variant of the MT7622
> > which probably also lacks some clocks MT7622(A) does have).
> 
> I don't think the patch for init_clks() is flawed.
> At most it is incompleted.
> What it did is like fixing a potential error in the tool platform
> providing service for the upper application, like what you said,
> MT7623 and MT7622.
> We should not keep the error in the platform because of the upper
> application.
> And it seems like it is MT7622 that is flawed.
> The better way is to fix both the bug in init_clks() and its caller,
> MT7622.

I agree that further cleaning is needed here.
Yet the commit in it's current form very obviously breaks at least the
MT7622 platform if no further fixes are applied.

Imho the whole approach of this driver to hard-code the names of all
clocks it could try to grab in a string-array accompanied by an enum
is flawed.

The correct approach would likely be to add the clocks actually present
to the device tree of each SoC and then grab only those.

I can see that mt2701.dtsi and mt7623.dtsi both have some clocks
defined for scpsys, mt7622.dtsi however lacks them.
I didn't check other MediaTek SoCs which also use scpsys.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
