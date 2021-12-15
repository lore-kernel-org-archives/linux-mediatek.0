Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7335FC433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 15 Dec 2021 02:07:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qmv+FVGSsn2PlMNW8z1yXTnoHy2vYWcP57bvx/EmEP4=; b=ElF1WgsLKwdehC
	Tb7PEvgSL1vTE3mHzrEidb0jV/5vDvktw6zhUtePGzdsw6SkmiABzd7FiiINHW8ZhreHDfTxFKNNu
	3AWqMWNrZqbJqKu2Mex4uUbcCBMiNZOXydu6XJ3qKMy+tAQUWseoojcKofg9fIdDGgGBt1hMixa7h
	g0LHoqZAa3yN5csVTXfJrwG8Vn/smwOrj9Xb1xQusoOxgp1xQkFzRPpL204J/HsUr0Npkb/5xF5hH
	IgUgFyeplm8iQhwHIQ4kFW12Op0kAOWpZ2410r0LyzA8/puKX1j76z3rZhsHH5ddOj9DEl844IjI0
	3CZyIypj44TmXa/R0C8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mxJhG-00GLXR-Oo; Wed, 15 Dec 2021 02:07:10 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mxJh2-00GLTv-Ec; Wed, 15 Dec 2021 02:06:59 +0000
X-UUID: 24bd7b033ef742a18f86034db33b0d09-20211214
X-UUID: 24bd7b033ef742a18f86034db33b0d09-20211214
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <tinghan.shen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1355597089; Tue, 14 Dec 2021 19:06:50 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 14 Dec 2021 18:03:32 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Wed, 15 Dec 2021 10:03:31 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 15 Dec 2021 10:03:31 +0800
Message-ID: <768b202c7bf78e26102c91ae558d4d0887e11124.camel@mediatek.com>
Subject: Re: [PATCH v6 2/4] dt-bindings: spi: add new clock name 'axi' for
 spi nor
From: Tinghan Shen <tinghan.shen@mediatek.com>
To: Mark Brown <broonie@kernel.org>
CC: <robh+dt@kernel.org>, <linus.walleij@linaro.org>,
 <matthias.bgg@gmail.com>, <bgolaszewski@baylibre.com>,
 <sean.wang@mediatek.com>, <bayi.cheng@mediatek.com>, <gch981213@gmail.com>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-gpio@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-spi@vger.kernel.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Date: Wed, 15 Dec 2021 10:03:31 +0800
In-Reply-To: <YbdvIPq1hKPmKXXs@sirena.org.uk>
References: <20211211204014.8014-1-tinghan.shen@mediatek.com>
 <20211211204014.8014-3-tinghan.shen@mediatek.com>
 <YbdvIPq1hKPmKXXs@sirena.org.uk>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211214_180656_549765_84AE685D 
X-CRM114-Status: GOOD (  16.62  )
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

Hi Mark,

Thanks for the reviews and advice.


On Mon, 2021-12-13 at 16:04 +0000, Mark Brown wrote:
> On Sun, Dec 12, 2021 at 04:40:12AM +0800, Tinghan Shen wrote:
> 
> > Some mtk spi nor has dedicated dma(s) inside. Add a new clock name,
> > axi,
> > for spi nor dma bus clock.
> >    clock-names:
> > +    minItems: 2
> >      items:
> >        - const: spi
> >        - const: sf
> > +      - const: axi
> 
> This will cause any existing DTs that don't have both spi and sf
> clocks
> defined to fail to validate which doesn't seem great.  Given that
> your
> commit message says this is only required for some SoCs shouldn't the
> minimum clocks requirement depend on which particular SoC/IP version
> is
> being used?  Not exactly sure how one specifies that in the YAML
> format.
> 
> Please submit patches using subject lines reflecting the style for
> the
> subsystem, this makes it easier for people to identify relevant
> patches.
> Look at what existing commits in the area you're changing are doing
> and
> make sure your subject lines visually resemble what they're doing.
> There's no need to resubmit to fix this alone.

I'll update the subject at next version.
It'll be "dt-bindings: spi: mtk-spi-nor: ...".


regards,
TingHan


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
