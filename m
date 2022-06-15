Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 676DEC43334
	for <linux-mediatek@archiver.kernel.org>; Wed, 15 Jun 2022 14:29:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=53fOj3H2GqAm3448RPXNjEhXY1AXZZRzM6yhRE9gbO0=; b=FP2uBvf2tw1avjsBpCQotlWSQ9
	Bo2pxzcbUXD9JvwgyA60LkHoLXKfsU6LfkLw6JxCvcE6y3agyVWDCT5xeYl1TUqODh7/56v9R8MmC
	912HxAQ3tV2LTkTSPFM4vKK2SCxOiaFR2pscH4+7EWAL72OjcF2qz0OPqrgCxf1b1Nwo3tOb333Iq
	eTiDxbPpryH2aVdVE6bSazI5pDyMuRGV8iQrN8vcoltyvYnDLd1JgVhofGXBVu6Ywrjo3Gc3Ju7E2
	kF0Z7tWm3XDytfWM2bvj83FSH0ABEmEVZgi7q43jb5yRP4+3f9qavbez+rzwy8pfgKGHHmgvhFvuX
	UDh2PmFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1U1Y-00ExSZ-OI; Wed, 15 Jun 2022 14:29:36 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1U1M-00ExP3-VF; Wed, 15 Jun 2022 14:29:26 +0000
Received: from notapiano (pool-98-113-53-228.nycmny.fios.verizon.net [98.113.53.228])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 442EB66016E6;
	Wed, 15 Jun 2022 15:29:22 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1655303363;
	bh=9JJFUJVNM69cglqdy5kB/JmT8zdWEEfScJJyM/93r8U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Lx7ftiZ7fFo/I2xUSkFSy31bmj/czjjhNvJqFApLYbk3djxq0pVVM/zNIBk0NPJY6
	 DGWCD8lfTk3osxb035ANBZgZqStHAEl0ldQ55BgSFvPZ23JDWX7XJtrpOh7C3OluzP
	 1cL35wpEMdYbeTUpYj4oxDO+k3i1VGa9nW4NJ19q9BeIH+PZAVxW6YDvXKPIl/HYhV
	 zvkrosrMjzFG++BKlYsVuTntffwPh7oX+YqhLGXkqchvM4xcrWzem0ObchqxWh06DT
	 DQXlFHw5g/NogtO7tf1uVDHJ1ffK5h780d4oPXeQBDs11MpPtXeB1l1eS319kzwW5Q
	 kSsB0VI2O2zcA==
Date: Wed, 15 Jun 2022 10:29:18 -0400
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	kernel@collabora.com,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Sean Wang <sean.wang@mediatek.com>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v2 0/2] MT8192 pinctrl properties adjustments
Message-ID: <20220615142918.vw4f2hrrxb2r2x6h@notapiano>
References: <20220531221954.160036-1-nfraprado@collabora.com>
 <CACRpkdYe=qhUvyCw-xKRUihWiaezaEyQdHFhPt2aD6bmkWTpBw@mail.gmail.com>
 <20220615142349.qgxsnaln7mtbhgur@notapiano>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220615142349.qgxsnaln7mtbhgur@notapiano>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220615_072925_175273_806685BC 
X-CRM114-Status: GOOD (  21.73  )
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

On Wed, Jun 15, 2022 at 10:23:55AM -0400, Nícolas F. R. A. Prado wrote:
> On Wed, Jun 15, 2022 at 03:31:00PM +0200, Linus Walleij wrote:
> > On Wed, Jun 1, 2022 at 12:19 AM Nícolas F. R. A. Prado
> > <nfraprado@collabora.com> wrote:
> > 
> > > The two patches in this series substitute properties in the mt8192
> > > pinctrl dt-binding for ones which have a clearer meaning and are more
> > > standardized. At this point there's no DT using the mt8192 pinctrl
> > > binding, so if such changes are to be made, they need to happen now.
> > >
> > > v1: https://lore.kernel.org/linux-mediatek/20220525155714.1837360-1-nfraprado@collabora.com/
> > >
> > > Changes in v2:
> > > - Dropped Fixes tags
> > > - Added 'if' blocks to enforce mutual exclusion of properties
> > 
> > This does not apply on the current pinctrl devel branch:
> > https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git/log/?h=devel
> > 
> > Could you please rebase onto my branch and resend as v3?
> 
> Hi Linus,
> 
> I checked out your branch locally and was able to apply the patch cleanly. Maybe
> you haven't pushed out all your local changes to that branch yet? Otherwise let
> me know and I'll send a rebased v3 to see if it helps in some way.

Actually, I just noticed that you applied 2/2 from v1, maybe that's the reason
this v2 series isn't applying?

> 
> Thanks,
> Nícolas
> 
> > 
> > Yours,
> > Linus Walleij

