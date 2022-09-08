Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B258DECAAD5
	for <linux-mediatek@archiver.kernel.org>; Thu,  8 Sep 2022 06:57:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0GlDwqSJlJ62tFCrYz0xSOIlooFAAT4vRDl6xRQBOak=; b=2KUJ2WLZkpeIqJJk7GKoBvl8Op
	BCRzlywiNCpmCL51Ao4eno3k/Vxe4Czg/C9vvMfSNBmSLxhcnMF/OF7XUGyJ08uMVNyUH57spiPGo
	W98vFkvBidFWOMh8LVtaDp5W0p1rwQinLzpYL55XkeAiHa9mh3bmsozlykh7xH6MiD9dv+xVzSHdl
	i4MwSN4KpH8zp3KKCHqdqEQ9ArPXqxdHEeSsSZVXipGWVhkX5nye8E7k9K5IPDb9lzGVkiACdqrcj
	AnlhkcYh5lZ8PQovJDf0PmrWvqt/kkODyK/cxfHuV+vTNkI19Ph7QaWD9rYROtG96b6ZIv4F9Y5sy
	kfQXvNig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWBTi-0002P0-Sm; Thu, 08 Sep 2022 06:57:34 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWBTW-0002BB-Hy; Thu, 08 Sep 2022 06:57:24 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 1315C61B48;
	Thu,  8 Sep 2022 06:57:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22FC6C433C1;
	Thu,  8 Sep 2022 06:57:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1662620241;
	bh=RKj0p7+2DV/jN/iA6U4WYLQVoMCZshcyv2vDEmRBeAo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pzlCI3AR14y4reXJ0jTJZ2rn5kWNEscL5/QYctNJYCYvmijtkfyM6OX9OMlQfkHkx
	 u9CCf4liu5qODolVl6EIhLuqfkNVhsOnayE1Qt1opWUf2gnXqKBzPEV5XB5BGHYkfJ
	 9p2yn8+BU8Db0gy/2EMO3Bl+r0Uzcrxnu7fhqKpjpa97emZdeQVNUxO1owEwl2HCEG
	 uavSMmAL7Q2ckUKI/ZmORqVWqLDBVR9vj0niuISEBSwe91FwkIud2cThoaGBH5nkJI
	 RNx82ugPhxUj03wXqjqJA0kZ79GDbbKllJrBSyCzJyjUKJQHgRZbTMFX/xQ2N5bX2E
	 yB3t4aNVng5fA==
Date: Thu, 8 Sep 2022 07:57:16 +0100
From: Lee Jones <lee@kernel.org>
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>,
	ChiYuan Huang <cy_huang@richtek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	ChiaEn Wu <chiaen_wu@richtek.com>,
	linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
	kernel-janitors <kernel-janitors@vger.kernel.org>
Subject: Re: [PATCH] mfd: mt6370: add bounds checking to regmap_read/write
 functions
Message-ID: <YxmSTH5ETSC0D3Rp@google.com>
References: <Yv8ezribLQbq5ggv@kili>
 <CAHp75VcotcJzqc4iSwNTKcvF3vAYz6VUuMrsj7LF6mi6Xu8D=Q@mail.gmail.com>
 <20220822125705.GD2695@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220822125705.GD2695@kadam>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220907_235722_774143_1B1ABF20 
X-CRM114-Status: GOOD (  24.81  )
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

On Mon, 22 Aug 2022, Dan Carpenter wrote:

> On Fri, Aug 19, 2022 at 09:27:13AM +0300, Andy Shevchenko wrote:
> > On Fri, Aug 19, 2022 at 8:25 AM Dan Carpenter <dan.carpenter@oracle.com> wrote:
> > >
> > > It looks like there are a potential out of bounds accesses in the
> > > read/write() functions.  Also can "len" be negative?  Let's check for
> > > that too.
> > 
> > ...
> > 
> > > Fixes: ab9905c5e38e ("mfd: mt6370: Add MediaTek MT6370 support")
> > 
> > > From static analysis.  This code is obviously harmless however it may
> > > not be required.  The regmap range checking is slightly complicated and
> > > I haven't remembered where all it's done.
> > 
> > Exactement! I do not think this Fixes anything, I believe you are
> > adding a dead code. So, can you do deeper analysis?
> 
> I spent a long time looking at this code before I sent it and I've
> spent a long time looking at it today.
> 
> Smatch said that these values come from the user, but now it seems
> less clear to me and I have rebuilt the DB so I don't have the same
> information I was looking at earlier.
> 
> So I can't see if these come from the user but neither can I find any
> bounds checking.

What's the consensus please?

-- 
Lee Jones [李琼斯]

