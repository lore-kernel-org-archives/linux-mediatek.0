Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C399AD2A53D
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Oct 2024 19:00:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jJE57QERgDknKGW7NPSs5mCwqH+t/ymPS7PbFKtY+i4=; b=OY2lz54PA/70b74kAozMd+CqFF
	qu743GnuSdtKkkY70mKzfQHLgmbGCfKI5GTPVXj6LUB3Lw7UmBtKL023Rc5gxiyxSYx3vuoqJ/dp7
	TIR6pAKaua9D+4ldvvr2xhTc5fkonE6b687JgCskqz0OjNWwPZ86pg3H/eTsN0x+mRmPaK4YnZH02
	VOM3u7xFCZjJix6Fephh4Scrg3v+aE5edF21bNzWpr9KPnsCHl4EUDgO6H4ZfyBFQUOHSykcQeMbn
	H6iGWru4WDGlIZH+rp+B7gvk5Qkwh3AtlM3FUXqT4gXuLWZQ+HystYyWi+w60DwYxr8wzLuEthtxR
	BoGyhAFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t19G3-0000000CkpZ-2HgD;
	Wed, 16 Oct 2024 19:00:31 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t19Du-0000000CkMn-3EAF;
	Wed, 16 Oct 2024 18:58:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 936505C5627;
	Wed, 16 Oct 2024 18:58:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84A48C4CEC5;
	Wed, 16 Oct 2024 18:58:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729105097;
	bh=DI3vXOs2FhFrx3JN5uzYaOYxEOMRWbXlYRHowN6BJ1U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FaLFxaRBwMouJqTGwQCi8Yd5NnSQSDeodJdyqNVUIn0NJp/d46McB2rselzO9Laze
	 m99l/Icwlm2YZho4RVZrZYGmwfmM38H6kNCGE6CfTWP3iCqVx9AiByZ4iBB5ykm/nU
	 wP9dkP0rAieddfzfLpRSY/kcaf+dJvnMbP2T8ALSlFrjl3IpuGzQ9QWxY9EWIAhRhl
	 9B/vlic1SnNh+Flbvyq0gwKBNb00AT2+zPRhhJ2okrs4uC2OHL0Dtg95UC/UOL6z7O
	 UdGXY8i6IjOaGQJoiLjcYUhkvgy4DagbBTMgXkEZXzoYkEkHgcqDlJJAbkTqAVbEqr
	 tJ4X+A0B4RaaQ==
Date: Wed, 16 Oct 2024 19:58:12 +0100
From: Simon Horman <horms@kernel.org>
To: SkyLake Huang =?utf-8?B?KOm7g+WVn+a+pCk=?= <SkyLake.Huang@mediatek.com>
Cc: "andrew@lunn.ch" <andrew@lunn.ch>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"linux@armlinux.org.uk" <linux@armlinux.org.uk>,
	"kuba@kernel.org" <kuba@kernel.org>,
	"pabeni@redhat.com" <pabeni@redhat.com>,
	"edumazet@google.com" <edumazet@google.com>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"dqfext@gmail.com" <dqfext@gmail.com>,
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
	Steven Liu =?utf-8?B?KOWKieS6uuixqik=?= <steven.liu@mediatek.com>,
	"davem@davemloft.net" <davem@davemloft.net>,
	"hkallweit1@gmail.com" <hkallweit1@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"daniel@makrotopia.org" <daniel@makrotopia.org>
Subject: Re: [PATCH net-next 1/1] net: phy: Refactor mediatek-ge-soc.c for
 clarity and correctness
Message-ID: <20241016185812.GN2162@kernel.org>
References: <20241014040521.24949-1-SkyLake.Huang@mediatek.com>
 <20241014081823.GL77519@kernel.org>
 <d2c24d063bea99be5380203ec4fafe3e4f0f9043.camel@mediatek.com>
 <20241016143431.GJ2162@kernel.org>
 <a498aca1ac932d66d38282fbfe614d927691ec01.camel@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a498aca1ac932d66d38282fbfe614d927691ec01.camel@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241016_115818_871923_7595F6E4 
X-CRM114-Status: GOOD (  14.71  )
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

On Wed, Oct 16, 2024 at 04:25:14PM +0000, SkyLake Huang (黃啟澤) wrote:
> > I do think that would be best.
> > But if you strongly think otherwise I can try to review it as-is.
> 
> Hi Simon,
>   If this does cause trouble for reviewing, I can split it into a few
> patches:
> Patch 1: Fix spelling errors + reverse Xmas tree + remove unnecessary
> parens
> Patch 2: Shrink mtk-ge-soc.c line wrapping to 80 characters.
> Patch 3: Propagate error code correctly in cal_cycle() + FIELD_GET()
> change
> Patch 4: Fix multi functions with FIELD_PREP().
> 
>   Is this okay for you? Do I need to split them into more patches?

Yes, I think that is a good way to split things up.

