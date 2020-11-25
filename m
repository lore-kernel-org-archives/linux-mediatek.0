Return-Path: <SRS0=wG/x=E7=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A978C5519F
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 Nov 2020 06:37:22 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 107CA206D8
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 Nov 2020 06:37:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="xSWcA4zt";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="npVbsbVB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 107CA206D8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=FE8U/3qOkSnwlKboWQs/J7ZYd6+rRVdgFOq47fAtsIw=; b=xSWcA4ztA5oz5ZJp44HoDKgva
	gah5m+AmJMkxIZk+O1/pw+iYCYs6vPkMBORvQkdBVamlx7VgN5MmEtb8pQe28+WfVcIimmzWPmvQV
	QCRmUBy7VhFHCBbfycHDqkvUnJGHrvHLlxinVa5GJAcDRO12B4yeAz7ZwiZZzK4V5LPwLb3tDB4WK
	ZX5xwiWMNJ2KsTlI/Hb4hbpO1Uu4nq2Etrai+5sMHRvDryfIq8zlRaQDLjfCwHmc+mMy8vt7iAI0z
	AVWsCvZBQKvqMZ6KO8LPhCT3MUcMn+H4xdIv6vhcp1ovq3F4Jwmh7DkKCKTJzOBhrMjqlja4MTl6V
	vJlEjuaoQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1khoQV-0002Go-Iz; Wed, 25 Nov 2020 06:37:15 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1khoQS-0002Ft-DF; Wed, 25 Nov 2020 06:37:13 +0000
X-UUID: fbbedf3856314907912c0fd4d78d21d3-20201124
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=4wT0sL2p4bYjUtORLYx8X9YW4UaRtS4zF13rlFd4m3U=; 
 b=npVbsbVBTp/WKl7ZKsAq2Vb5DWaKBbf3ey98EcKsQMJzpZOo37pKOp2YyF6gQWMog0yXnnK3ajbOEFYbbwSlGP16kYRhkAdqBVjVGjUbYIwEXNhnbpoaN6ryko/kTmwZKhGpkvovfx13IkECLAqzg1U01ZXHEvADGVqF+6fDLNA=;
X-UUID: fbbedf3856314907912c0fd4d78d21d3-20201124
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1025566034; Tue, 24 Nov 2020 22:37:05 -0800
Received: from MTKMBS31N1.mediatek.inc (172.27.4.69) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 24 Nov 2020 22:27:05 -0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS31N1.mediatek.inc
 (172.27.4.69) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Wed, 25 Nov 2020 14:27:02 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 25 Nov 2020 14:27:01 +0800
Message-ID: <1606285623.7284.8.camel@mhfsdcap03>
Subject: Re: [PATCH] phy/mediatek: Make PHY_MTK_XSPHY depend on HAS_IOMEM
 and OF_ADDRESS to fix build errors
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Randy Dunlap <rdunlap@infradead.org>, Tiezhu Yang <yangtiezhu@loongson.cn>
Date: Wed, 25 Nov 2020 14:27:03 +0800
In-Reply-To: <d3cee8b0-b699-a51a-ff33-568e10cb2df7@infradead.org>
References: <1606211233-7425-1-git-send-email-yangtiezhu@loongson.cn>
 <1606271044.32484.20.camel@mhfsdcap03>
 <d3cee8b0-b699-a51a-ff33-568e10cb2df7@infradead.org>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 0B25F89E42C9C88A9D286BF25D5F4853EA184271D894796D64149F03AEBE79732000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201125_013712_589957_5E92D121 
X-CRM114-Status: GOOD (  25.07  )
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
Cc: Heiko Stuebner <heiko@sntech.de>, linux-kernel@vger.kernel.org,
 Kishon Vijay Abraham I <kishon@ti.com>, Vinod Koul <vkoul@kernel.org>,
 linux-mediatek@lists.infradead.org, Tiezhu Yang <yangtiezhu@loongson.cn>,
 Xuefeng Li <lixuefeng@loongson.cn>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, 2020-11-24 at 19:31 -0800, Randy Dunlap wrote:
> On 11/24/20 6:24 PM, Chunfeng Yun wrote:
> > Hi Tiezhu,
> > 
> > On Tue, 2020-11-24 at 17:47 +0800, Tiezhu Yang wrote:
> >> devm_ioremap_resource() will be not built in lib/devres.c if
> >> CONFIG_HAS_IOMEM is not set, of_address_to_resource() will be
> >> not built in drivers/of/address.c if CONFIG_OF_ADDRESS is not
> >> set, and then there exists two build errors about undefined
> >> reference to "devm_ioremap_resource" and "of_address_to_resource"
> >> in phy-mtk-xsphy.c under COMPILE_TEST and CONFIG_PHY_MTK_XSPHY,
> >> make PHY_MTK_XSPHY depend on HAS_IOMEM and OF_ADDRESS to fix it.
> >>
> >> Reported-by: kernel test robot <lkp@intel.com>
> >> Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
> >> ---
> >>  drivers/phy/mediatek/Kconfig | 2 ++
> >>  1 file changed, 2 insertions(+)
> >>
> >> diff --git a/drivers/phy/mediatek/Kconfig b/drivers/phy/mediatek/Kconfig
> >> index 50c5e93..66df045 100644
> >> --- a/drivers/phy/mediatek/Kconfig
> >> +++ b/drivers/phy/mediatek/Kconfig
> >> @@ -30,6 +30,8 @@ config PHY_MTK_XSPHY
> >>  	tristate "MediaTek XS-PHY Driver"
> >>  	depends on ARCH_MEDIATEK || COMPILE_TEST
> >>  	depends on OF
Hi Tiezhu,

Would you please help to put OF and OF_ADDRESS into one line as
following:
depends on OF && OF_ADDRESS.

Also please help to add them for PHY_MTK_TPHY.
And change the tile 'phy/mediatek: ...' as 'phy: mediatek: ...'

Thank you


> >> +	depends on HAS_IOMEM
> >> +	depends on OF_ADDRESS
> > Why not add them into deconfig but here? In fact I don't know which way
> > is better and follow the kernel rule.
> > 
> > Vinod and Kishon, do you have any suggestion about this?
> 
> Putting them into a defconfig won't prevent random build errors
> while putting them here will (or at least should).
hi Randy,

Got it, thank you

> 
> >>  	select GENERIC_PHY
> >>  	help
> >>  	  Enable this to support the SuperSpeedPlus XS-PHY transceiver for
> > 
> 
> The patch LGTM.
> 
> Acked-by: Randy Dunlap <rdunlap@infradead.org>
> 
> thanks.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
