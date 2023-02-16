Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4624C636CC
	for <linux-mediatek@archiver.kernel.org>; Thu, 16 Feb 2023 18:10:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=13lh7FK6sSGjwHfRkTN4AJWdNr9SQDHletqVLj15aiU=; b=O4yzJP2VYhiFQt0etkiFOIhmtm
	MjPm/H2vYSlAEYg+U8Mwujpdo3zVZMGc8LG6e47TGX/J/MpFm3aAAKtAy9wkMtmfSKi+r0w/HfBgy
	NrU4/Dcd+6NV+r1RGnkn1tpR8QkRdFvVlecjcWYwF4t8+GgDtGXxfxqghfIpY0vTrZiIrHF6w4Wpj
	lIw7ncxPDe9iWp3srN6Iy+r1J9y2v+MgCieic9qtEhpNleQtbYJpSRzduxKmAeq5Wy+xH6hKdN4QJ
	bGVfU+LVemM2kU7OMIzSC5x3WjcZe0MmOGnicdzQWbaiQbn9XqreEeseXDGE1Yjed6CW6Y3cd/RLA
	pgvLfkkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSiiR-00BRiS-Db; Thu, 16 Feb 2023 18:10:43 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSiiO-00BRgb-VW
	for linux-mediatek@lists.infradead.org; Thu, 16 Feb 2023 18:10:42 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 535E0B826BA;
	Thu, 16 Feb 2023 18:10:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E7E4C433D2;
	Thu, 16 Feb 2023 18:10:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1676571036;
	bh=uzqucx/LrtONslFI6zFbkjiUdWhRDsYoF6uZqjKaGG4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=H/uqcPeB8dbJbIn7D3f3VvPmx47rdnEYXZcG/1/Lpz42f35J943dmqEqXlx0ix2+u
	 r6tju1d882rjR9BYYS8VLBVynl+DskaRVSNsrxtS2vvXSScZgMMMEsiielqf6DM6Pw
	 f1a/47K1E8Q3qx6AfFicoDeltN/tqcTjboJkTd3cVzQQP4C1mmSH1/WmUC5cl8Hvdg
	 FKCmPpBys0M8KwplZRU5KyVvj97Lel/qufBoO7hF4AiSewxB924Hzs5xX4aQsxRM/b
	 ULW5Gy2bTk6eHH+2nJ5SwKnCQDYRFcmhQ3+Q9gB/RVSH1dcGfjspq1Y1GpBgGRZxpL
	 C/2ZKBfTNN/LA==
Date: Thu, 16 Feb 2023 10:10:34 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: "Yanchao Yang (=?UTF-8?B?5p2o5b2m6LaF?=)" <Yanchao.Yang@mediatek.com>
Cc: "Chris Feng (=?UTF-8?B?5Yav5L+d5p6X?=)" <Chris.Feng@mediatek.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "Mingliang Xu (=?UTF-8?B?5b6Q5piO5Lqu?=)" <mingliang.xu@mediatek.com>, "Min
 Dong (=?UTF-8?B?6JGj5pWP?=)" <min.dong@mediatek.com>, "linuxwwan@intel.com"
 <linuxwwan@intel.com>, "m.chetan.kumar@intel.com"
 <m.chetan.kumar@intel.com>, "Liang Lu (=?UTF-8?B?5ZCV5Lqu?=)"
 <liang.lu@mediatek.com>, "Haijun Liu (=?UTF-8?B?5YiY5rW35Yab?=)"
 <haijun.liu@mediatek.com>, "Haozhe Chang (=?UTF-8?B?5bi45rWp5ZOy?=)"
 <Haozhe.Chang@mediatek.com>, "Hua Yang (=?UTF-8?B?5p2o5Y2O?=)"
 <Hua.Yang@mediatek.com>, "ryazanov.s.a@gmail.com" <ryazanov.s.a@gmail.com>,
 "Xiayu Zhang (=?UTF-8?B?5byg5aSP5a6H?=)" <Xiayu.Zhang@mediatek.com>,
 "loic.poulain@linaro.org" <loic.poulain@linaro.org>, "pabeni@redhat.com"
 <pabeni@redhat.com>, "edumazet@google.com" <edumazet@google.com>, "Ting
 Wang (=?UTF-8?B?546L5oy6?=)" <ting.wang@mediatek.com>,
 "johannes@sipsolutions.net" <johannes@sipsolutions.net>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "Aiden Wang (
 =?UTF-8?B?546L5ZKP6bqS?=)" <Aiden.Wang@mediatek.com>, "Felix Chen (
 =?UTF-8?B?6ZmI6Z2e?=)" <Felix.Chen@mediatek.com>, "Lambert Wang (
 =?UTF-8?B?546L5Lyf?=)" <Lambert.Wang@mediatek.com>, "davem@davemloft.net"
 <davem@davemloft.net>, "Mingchuang Qiao (=?UTF-8?B?5LmU5piO6Zev?=)"
 <Mingchuang.Qiao@mediatek.com>, "Guohao Zhang (=?UTF-8?B?5byg5Zu96LGq?=)"
 <Guohao.Zhang@mediatek.com>
Subject: Re: [PATCH net-next v3 01/10] net: wwan: tmi: Add PCIe core
Message-ID: <20230216101034.3f742834@kernel.org>
In-Reply-To: <2e518c17bf54298a2108de75fcd35aaf2b3397d3.camel@mediatek.com>
References: <20230211083732.193650-1-yanchao.yang@mediatek.com>
	<20230211083732.193650-2-yanchao.yang@mediatek.com>
	<20230214202229.50d07b89@kernel.org>
	<2e518c17bf54298a2108de75fcd35aaf2b3397d3.camel@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230216_101041_180882_ECB5A5C0 
X-CRM114-Status: UNSURE (   9.64  )
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

On Thu, 16 Feb 2023 12:50:44 +0000 Yanchao Yang (=E6=9D=A8=E5=BD=A6=E8=B6=
=85) wrote:
> > > +	pci_clear_master(pdev);
> > > +	mtk_mhccif_exit(mdev);
> > > +	mtk_pci_free_irq(mdev);
> > > +	mtk_pci_bar_exit(mdev);
> > > +	pci_disable_device(pdev);
> > > +	pci_load_and_free_saved_state(pdev, &priv->saved_state);
> > > +	devm_kfree(dev, priv);
> > > +	devm_kfree(dev, mdev); =20
> >=20
> > Why are you using devm_ if you call kfree explicitly anyway?
> > You can save some memory by using kfree() directly. =20
> devm_kzalloc(), devm_ioremap_resource(), devm_request_irq(),
> devm_gpio_request(), devm_clk_get()=E2=80=A6..
> They will be freed automatically
> when corresponding device is freed, so you don=E2=80=99t have to free them
> explicitly. This also make probe error easier to handle. Is it ok?

Yes.

