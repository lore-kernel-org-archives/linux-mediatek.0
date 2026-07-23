Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEDFFC531CA
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Jul 2026 12:40:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ggIEOu1YQaNTl8uHeapYlP/thX98yYCtXe9fkfUpAZk=; b=pzaTwMCrlD+v7QAJdKSfSwTqln
	NR3fPVxVA1WFoXWof2NOEeLNfq18L9lrUzq7Om7J2AAwB5SiOtxMqWTfA1giYl+wv4i+bdwwW4fum
	S1k6tYBhwpiNZowdR5DuctkU01qZWqQE0FkvKr56lwK0IcqKo+BMrj/Bff31Hy38asBHvHI7Se8bF
	yFCV4E+htZU+YB1X/oo1oOPEk6v9IADmdtdkWU/CnXJjNux8f1jrjXtW91NsCsY3bZFq383QDxX4+
	sm397op2CIWid5FG0sxd5dTd9QJJaUXwf6WdMR/xOCcgRJjIQEwUrobrhA/n6ooBzDBvNY62XJpsI
	W7ay3pHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmsj4-0000000EGFP-0omn;
	Thu, 23 Jul 2026 12:40:34 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmsj2-0000000EGEd-2yRc
	for linux-mediatek@lists.infradead.org;
	Thu, 23 Jul 2026 12:40:32 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 04A87406C6;
	Thu, 23 Jul 2026 12:40:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B31C1F000E9;
	Thu, 23 Jul 2026 12:40:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784810431;
	bh=ggIEOu1YQaNTl8uHeapYlP/thX98yYCtXe9fkfUpAZk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=l9VzRCZBqQAiRTicGOddbAZqMM7Gqlj0/NyLy20NVEGpyg+U9O2/Lq8C7TSHyrV/o
	 ToqbMXYxrOGH2fiwFDJ79uODVKqEyU9F/iHLf4w7dlehVe8zFmHcZt0gOOfJw+WbHc
	 ZCD9I9oUrU5zEbzIIg4UpxdWRPp0Ynglc5pl+zBQu8/EJJoF2JP32+74DRZWZH9yW7
	 h0G9jcIRytXNUALF35AJ2MVPPSdr269a/giz4AMyXfqZtghb39nNUkw6HaVIm7qdBz
	 0+AaD0xhDo83MU0lWtHwZD5mJIeZfDlEWfXDmrJWNueq+tXun8hax0ePzfbdF4+AqP
	 DsBkjhVmuMy5g==
Date: Thu, 23 Jul 2026 14:39:58 +0200
From: Manivannan Sadhasivam <mani@kernel.org>
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Peter Wang =?utf-8?B?KOeOi+S/oeWPiyk=?= <peter.wang@mediatek.com>, 
	CC Chou =?utf-8?B?KOWRqOW/l+adsCk=?= <cc.chou@mediatek.com>, "jejb@linux.ibm.com" <jejb@linux.ibm.com>, 
	"bvanassche@acm.org" <bvanassche@acm.org>, "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>, 
	Eddie Huang =?utf-8?B?KOm7g+aZuuWCkSk=?= <eddie.huang@mediatek.com>, 
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>, 
	Chaotian Jing =?utf-8?B?KOS6leacneWkqSk=?= <Chaotian.Jing@mediatek.com>, "alim.akhtar@samsung.com" <alim.akhtar@samsung.com>, 
	Naomi Chu =?utf-8?B?KOacseipoOeUsCk=?= <Naomi.Chu@mediatek.com>, 
	Alice Chao =?utf-8?B?KOi2meePruWdhyk=?= <Alice.Chao@mediatek.com>, Ed Tsai =?utf-8?B?KOiUoeWul+i7kik=?= <Ed.Tsai@mediatek.com>, 
	wsd_upstream <wsd_upstream@mediatek.com>, "avri.altman@wdc.com" <avri.altman@wdc.com>, 
	"martin.petersen@oracle.com" <martin.petersen@oracle.com>, Tun-yu Yu =?utf-8?B?KOa4uOaVpuiBvyk=?= <Tun-yu.Yu@mediatek.com>, 
	Chun-Hung Wu =?utf-8?B?KOW3q+mnv+Wujyk=?= <Chun-hung.Wu@mediatek.com>
Subject: Re: [PATCH v1] ufs: core: Remove unnecessary block I/O quiesce for
 clock scaling
Message-ID: <yyocxatyi7bitvehm2fgltxpayomt3d6r5zyr2ugbehkvsowcz@cg4if4zdqgbu>
References: <20260604133503.2049288-1-peter.wang@mediatek.com>
 <al8YkXydXJQZrl_Y@QCOM-aGQu4IUr3Y>
 <29b5f4368a63847b84b87e36a1e358f5991b694c.camel@mediatek.com>
 <amAqHFOgPQQY-3rI@QCOM-aGQu4IUr3Y>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <amAqHFOgPQQY-3rI@QCOM-aGQu4IUr3Y>
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, Jul 22, 2026 at 10:25:32AM +0800, Shawn Guo wrote:
> On Tue, Jul 21, 2026 at 12:54:01PM +0000, Peter Wang (王信友) wrote:
> > On Tue, 2026-07-21 at 14:58 +0800, Shawn Guo wrote:
> > > A revert of commit 85b2b9662854 ("scsi: ufs: core: Remove unnecessary
> > > block I/O quiesce for clock scaling") fixes the regression for me.
> > > 
> > > Shawn
> > 
> > Hi Shawn,
> 
> Hi Peter,
> 
> > What is the probability of this issue occurring?
> 
> It seems 100% per my testing.
>

Whenever clk scaling gets triggered. So this affects all Qcom UFS platforms.
 
> > Is this a design limitation of the Qualcomm platform or?
> 

Qcom Host Controllers doesn't support scaling clocks when the traffic is
ongoing. So this patch certainly cannot work on our platforms.

If you want to pursue, you should limit this change to MediaTek platforms. But
nevertheless, this patch should be reverted as it breaks UFS on all Qcom
platforms.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

