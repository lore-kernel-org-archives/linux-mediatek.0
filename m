Return-Path: <SRS0=76sT=BB=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_2 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ECA18C433E1
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Jul 2020 08:41:43 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B511B205CB
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Jul 2020 08:41:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ewMm8Ai3";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="i2VbugLJ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B511B205CB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Eftijjym7gBsyMWjg7uwWTrPEYldHZvZOQB5meGW0j4=; b=ewMm8Ai3cInQkKwltMd5cfr8l
	hiuzvoB6GZjfxdSTjn5TrhuWM5Ma1T4kHJERyzS6LQXXu0r0L/XvDinix7SWTDjI/wrgjMtiGN/6y
	/2LwrQHSNmJ5TxcHLjaL2U2feW5DDZv92ZPEyELyR/leeCL94aPI5x29n+2gIYEqb9xhfjcNO6ST/
	b/YFcoUY5e/5v2/eqA74o/Jd68DC3PKQYUV8fTrE8eyd2EPiLnZRFxf/LIC7OlseyHjPdQVuJJtuG
	yIVnlNbofqN094KGFc6GwMppqTvy4Rhnp0iQN4GpZWyYbCotNbAxw438KFOnK1G7OOqmse0VHcvYP
	2gbkg2MuQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jyAJd-0003m3-R0; Wed, 22 Jul 2020 08:41:29 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jyAJZ-0003kZ-Cs; Wed, 22 Jul 2020 08:41:26 +0000
X-UUID: c34107bc6e154d9990f43394baa43c89-20200722
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=OiHiZePeDz0TOsdSkkvZbLS+r2xokpaO5HMe7UcOMVM=; 
 b=i2VbugLJMWZHgBybEL2oA2lQsTFt/cbuuff1TBbbBfiguqOzaXmAjkByV4iCNkH8YN0LdhcTZxRaRcUoSlMI7zPw15L3u19gooMiELzg1r1x3zBy2G6QXXkigF0LG6sAR0HnJwJjYGO2PvW48FXnRpuUj2c58qKul7+LVJufya0=;
X-UUID: c34107bc6e154d9990f43394baa43c89-20200722
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <leilk.liu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 2114159195; Wed, 22 Jul 2020 00:41:26 -0800
Received: from MTKMBS33N1.mediatek.inc (172.27.4.75) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 22 Jul 2020 01:39:56 -0700
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS33N1.mediatek.inc
 (172.27.4.75) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Wed, 22 Jul 2020 16:39:52 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 22 Jul 2020 16:39:51 +0800
Message-ID: <1595407127.31408.3.camel@mhfsdcap03>
Subject: Re: [PATCH v2 2/2] spi: mediatek: add spi support for mt8192 IC
From: lei liu <leilk.liu@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>
Date: Wed, 22 Jul 2020 16:38:47 +0800
In-Reply-To: <27e48721-5e54-6947-cd8f-669f4da34c4d@gmail.com>
References: <20200721122436.31544-1-leilk.liu@mediatek.com>
 <20200721122436.31544-2-leilk.liu@mediatek.com>
 <27e48721-5e54-6947-cd8f-669f4da34c4d@gmail.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 2991B1983B43B99D49069B83EC41D5010EC12A25BDF36138515812CDC5EDBB022000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200722_044125_644403_3A125BB3 
X-CRM114-Status: GOOD (  19.48  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Sascha Hauer <s.hauer@pengutronix.de>, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org, Mark Brown <broonie@kernel.org>,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, 2020-07-22 at 00:44 +0200, Matthias Brugger wrote:
> 
> On 21/07/2020 14:24, Leilk Liu wrote:
> > From: "leilk.liu" <leilk.liu@mediatek.com>
> > 
> > This patch add spi support for mt8192 IC.
> > 
> > Signed-off-by: leilk.liu <leilk.liu@mediatek.com>
> > ---
> >   drivers/spi/spi-mt65xx.c | 3 +++
> >   1 file changed, 3 insertions(+)
> > 
> > diff --git a/drivers/spi/spi-mt65xx.c b/drivers/spi/spi-mt65xx.c
> > index 6783e12c40c2..3d0d69fe0c69 100644
> > --- a/drivers/spi/spi-mt65xx.c
> > +++ b/drivers/spi/spi-mt65xx.c
> > @@ -170,6 +170,9 @@ static const struct of_device_id mtk_spi_of_match[] = {
> >   	{ .compatible = "mediatek,mt8183-spi",
> >   		.data = (void *)&mt8183_compat,
> >   	},
> > +	{ .compatible = "mediatek,mt8192-spi",
> > +		.data = (void *)&mt6765_compat,
> > +	},
> 
> That's not needed. We will use the fallback compatible which is 
> "mediatek,mt6765-spi" which will take the correct DT data. If in the future we 
> realize that mt8192 has a difference in the HW we can add the compatible. 
> Otherwise with the binding description we should be fine
> 
So you mean that only the following binding patch is needed? 
[PATCH v2 1/2] dt-bindings: spi: update bindings for MT8192 SoC

> >   	{}
> >   };
> >   MODULE_DEVICE_TABLE(of, mtk_spi_of_match);
> > 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
