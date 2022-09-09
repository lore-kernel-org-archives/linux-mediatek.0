Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34E24ECAAA1
	for <linux-mediatek@archiver.kernel.org>; Fri,  9 Sep 2022 07:00:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o66MHsRIAwadkZeTDf6tPmrJmbsO0jRuPmHDJYtcQEs=; b=mLCWLiloQYywwxj/9tUxdhRXqS
	D1/tyf6we5rRFI7fnoVZDV8pQh5PvRAnPfYFpVES9IUl7jedJQgs6I2UchX0fgZxgf+DyzxLFRBQX
	bs8KQMMpyqxY/LiIOMs8IWNhrWaBNktxB4Oz9BVvlyvCj0Uomsaqz0nt+VWUanhcKYq/nh6wKDL8o
	LsE95Ftj4iF1klA/yOAE9O2iDGyAdxJk9GB4nb3KhEAFNAUq1xMHfAQ3p3pnfQvLJFpxHr/PyhAAq
	pHkwFkd6EgTLBRi4Rn0EEsFTs07/NzdqItZCI42bynUhngHl6BU1c8+wTGy+Hq0dQ4y1YhwU7RSUE
	YHr8TryA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWXzp-00DbaF-5Q; Fri, 09 Sep 2022 07:00:13 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWXzZ-00DbLu-5P; Fri, 09 Sep 2022 06:59:58 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 9B773B8236C;
	Fri,  9 Sep 2022 06:59:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D411C433C1;
	Fri,  9 Sep 2022 06:59:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1662706794;
	bh=NjnETBEQovFTHW/atuk0epV1j9ubAlRp1T2wsPCQGs0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FzGQZ/+Gnbsqio4Xxee9bwn59GpYnV3pdfpVRBm2cSnqmKIoo7JDr7OOZ6dP2bQmw
	 IPbykM6K+kGdeTnfLY5R8h9H+ZhTSlpjJreTuebeComEykTksfLnTJPdmOrMoZLcQm
	 vvtDtC/NgLjctJJFd4m4J2vx1syQ9LsiU24DqYsnlOyDocLTVndtuE9G2gR9utto5Y
	 t9od9fsfDx6+48lUujj0CmstVeugcv8OVwg19tW3BhJe82iF25pZROd2nRjCQp2I+M
	 O0+jvYqhtEQ8drg+PISf0P2gGdv1LE3f0EwT+R/SzTSAaPKMaGGryiJrObVD8zn2gY
	 f8clRYqE5CJ8g==
Date: Fri, 9 Sep 2022 07:59:49 +0100
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
Message-ID: <YxrkZX36wzVlzq5u@google.com>
References: <Yv8ezribLQbq5ggv@kili>
 <CAHp75VcotcJzqc4iSwNTKcvF3vAYz6VUuMrsj7LF6mi6Xu8D=Q@mail.gmail.com>
 <20220822125705.GD2695@kadam>
 <YxmSTH5ETSC0D3Rp@google.com>
 <Yxm7eztkQKDPU/Kl@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Yxm7eztkQKDPU/Kl@kadam>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220908_235957_367738_933C0E19 
X-CRM114-Status: GOOD (  27.32  )
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

On Thu, 08 Sep 2022, Dan Carpenter wrote:

> On Thu, Sep 08, 2022 at 07:57:16AM +0100, Lee Jones wrote:
> > On Mon, 22 Aug 2022, Dan Carpenter wrote:
> > 
> > > On Fri, Aug 19, 2022 at 09:27:13AM +0300, Andy Shevchenko wrote:
> > > > On Fri, Aug 19, 2022 at 8:25 AM Dan Carpenter <dan.carpenter@oracle.com> wrote:
> > > > >
> > > > > It looks like there are a potential out of bounds accesses in the
> > > > > read/write() functions.  Also can "len" be negative?  Let's check for
> > > > > that too.
> > > > 
> > > > ...
> > > > 
> > > > > Fixes: ab9905c5e38e ("mfd: mt6370: Add MediaTek MT6370 support")
> > > > 
> > > > > From static analysis.  This code is obviously harmless however it may
> > > > > not be required.  The regmap range checking is slightly complicated and
> > > > > I haven't remembered where all it's done.
> > > > 
> > > > Exactement! I do not think this Fixes anything, I believe you are
> > > > adding a dead code. So, can you do deeper analysis?
> > > 
> > > I spent a long time looking at this code before I sent it and I've
> > > spent a long time looking at it today.
> > > 
> > > Smatch said that these values come from the user, but now it seems
> > > less clear to me and I have rebuilt the DB so I don't have the same
> > > information I was looking at earlier.
> > > 
> > > So I can't see if these come from the user but neither can I find any
> > > bounds checking.
> > 
> > What's the consensus please?
> 
> Let's drop it.  I think it's not required.

Dropped.

-- 
Lee Jones [李琼斯]

