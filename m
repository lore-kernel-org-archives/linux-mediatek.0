Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8963C43334
	for <linux-mediatek@archiver.kernel.org>; Wed,  6 Jul 2022 11:50:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bSHjRVPar9koOkxdjkkwZ1okh8e3buyb9glVelQGPJA=; b=KsQaTD7Rb00MHFAJviavNOUjcU
	dV8Zs+9wPL7X6yg03jRysud0JFG+gq3PY2wrhi694xAfXVbTTdj/JtZP4WouHKXzj+F5OaGS5wskE
	4moPEmod2p7Bclmzkpuuymlzq+1YqR6l0qVrLIOfauFRJucHLoAns1s0wyFs+wrZVqnnBsKZW2wiQ
	a+I8ay8ns/YkRkd3PB6vI9cf/V0yOKKputXnLr6lUdLp3kw/PMXiruxhBxMkj690wUBrx08PiGGoj
	D9Qqit062zbHsb8U0/2eZ3US8b6egDIwGlN9xMbyMLPEnZia3ClJyBB0cM9xpmx/1IZBwm3+SnJox
	xAdTblDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o93YR-009ia2-E3; Wed, 06 Jul 2022 11:50:51 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o93YE-009iVZ-MP; Wed, 06 Jul 2022 11:50:39 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id E559B61EF0;
	Wed,  6 Jul 2022 11:50:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E43FFC3411C;
	Wed,  6 Jul 2022 11:50:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1657108237;
	bh=pIkja7u4jVh70cjtOcr/icdaQPCTUe5JoMbq34s2vCA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AZcs/8PQUqBcCYbonWkSDNfeylddwt8DzSYGJceY9yQoymUm1LGtSSG4b7LjShl/7
	 WZ2qs49p9ECdbmNoFL8nhUg0Q0m7QIs0zLU37eHfOGr1GFyMoHEh8juucfoVjyMmIR
	 ajvq7TmLNCUyZHv4keoy/mTWt3SOqE0iwG5syLwvpZymYoObj/wihM6BGcOawmgbrz
	 9uQ1gruOt4q9DFe5vAQv1ino7n6NpOQ+V3+FOiz3OSXF0FdnoZ5C9r6yFG2643vVpN
	 9/N7yibHBWvj1Zmjy0dc0nHzxgb9JO/SxG+7fIHDKcyvqfDrpbhM0h+SSJGjUP1So6
	 OMmUMmPsp7dHw==
Date: Wed, 6 Jul 2022 12:50:31 +0100
From: Will Deacon <will@kernel.org>
To: yf.wang@mediatek.com
Cc: Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
	Yong Wu <Yong.Wu@mediatek.com>,
	Miles Chen <miles.chen@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	wsd_upstream@mediatek.com, Libo Kang <Libo.Kang@mediatek.com>,
	Ning Li <ning.li@mediatek.com>,
	linux-arm-kernel@lists.infradead.org,
	iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v12 0/2] iommu/mediatek: TTBR up to 35bit support
Message-ID: <20220706115028.GC2403@willie-the-truck>
References: <20220630092927.24925-1-yf.wang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220630092927.24925-1-yf.wang@mediatek.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220706_045038_786327_C883032A 
X-CRM114-Status: UNSURE (   9.66  )
X-CRM114-Notice: Please train this message.
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

On Thu, Jun 30, 2022 at 05:29:24PM +0800, yf.wang@mediatek.com wrote:
> This patchset adds MediaTek TTBR up to 35bit support for single normal zone.
> 
> Changes in v12:
> - Update [PATCH 1/2]: remove GENMASK(31, 7)
> - Update [PATCH 2/2]: remove MMU_PT_ADDR_MASK definition.

For both patches:

Acked-by: Will Deacon <will@kernel.org>

Joerg -- please can you pick these up for 5.20?

Thanks,

Will

