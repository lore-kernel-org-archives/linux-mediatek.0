Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FF0FC433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 15 Jun 2022 14:24:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kehqwTK451EsS2rFTNlJ7U9OqDHHZ6cUvqo728WRh4k=; b=S1AF1hQn92cbGhKo3HKejRYh8c
	hPk1CrVt6HQjPIa8nPd+Mj4bwMmo4olj4+rvx2Tj6ZWU5BFC56ipwiiHE02bijGF3pm7aLDMhBgB5
	Zy0CZWCAmv0IsuSlyrELOxgGlaWhka9h57Rtn8f+eH6q/54Hf/l6pd57w9DbFF6api0My4/n65dsG
	ZyTga5gbVvX6ehnDGHK5OOZkDmyagl3+IXcxCpLc2MPH0KfwPGuZlu+hMF6epnYc6cb04BsbHSNYY
	jIPlJM3OCFmtehljF8pFS2uSDm+5bOM8jvns+E/wCjD0fmr+Bqt50uAuygKFkuGysuPAaCHuLgIA/
	zN6Czo7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1TwI-00EvyH-82; Wed, 15 Jun 2022 14:24:10 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1Tw5-00EvuA-Vs; Wed, 15 Jun 2022 14:23:59 +0000
Received: from notapiano (pool-98-113-53-228.nycmny.fios.verizon.net [98.113.53.228])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 8E4356601705;
	Wed, 15 Jun 2022 15:23:53 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1655303034;
	bh=eLJb9neGlwiL1HzETCo8YiMDWAxEGSgUuJk+Ye9uRwU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ax6+sknRobFBT30rXJImWD36z3nQJuklAWV7ro+vnA9M6NpGXdUzCiXt2/IX9WX/i
	 KgCg6cVMRYsmxtZE7eRnEvQ4NbUERs6rB39KxieYX1PgecbqEpj8toatfI9l4nHXUk
	 J7QZq1C6rsPcs1Z/j9MStiz+Q6DgTHHGnN78OhkRCZT95/JwNqljX+va0PUWYce1Bx
	 JVi8s3dMLy/xcYttTBiUBkcWIbSRFcZlApHEx7VG1MXFDlIZxi9yMQ686/uyIGO1Uf
	 madLazEw/8ZHrKuDVwO1iNEDGGJNhLXZXXxDUYfWeccEr2LfonoA9UcK3n1J1pFdnc
	 3rtc2rh63HZFw==
Date: Wed, 15 Jun 2022 10:23:49 -0400
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
Message-ID: <20220615142349.qgxsnaln7mtbhgur@notapiano>
References: <20220531221954.160036-1-nfraprado@collabora.com>
 <CACRpkdYe=qhUvyCw-xKRUihWiaezaEyQdHFhPt2aD6bmkWTpBw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACRpkdYe=qhUvyCw-xKRUihWiaezaEyQdHFhPt2aD6bmkWTpBw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220615_072358_181242_E5AF6981 
X-CRM114-Status: GOOD (  17.55  )
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

On Wed, Jun 15, 2022 at 03:31:00PM +0200, Linus Walleij wrote:
> On Wed, Jun 1, 2022 at 12:19 AM Nícolas F. R. A. Prado
> <nfraprado@collabora.com> wrote:
> 
> > The two patches in this series substitute properties in the mt8192
> > pinctrl dt-binding for ones which have a clearer meaning and are more
> > standardized. At this point there's no DT using the mt8192 pinctrl
> > binding, so if such changes are to be made, they need to happen now.
> >
> > v1: https://lore.kernel.org/linux-mediatek/20220525155714.1837360-1-nfraprado@collabora.com/
> >
> > Changes in v2:
> > - Dropped Fixes tags
> > - Added 'if' blocks to enforce mutual exclusion of properties
> 
> This does not apply on the current pinctrl devel branch:
> https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git/log/?h=devel
> 
> Could you please rebase onto my branch and resend as v3?

Hi Linus,

I checked out your branch locally and was able to apply the patch cleanly. Maybe
you haven't pushed out all your local changes to that branch yet? Otherwise let
me know and I'll send a rebased v3 to see if it helps in some way.

Thanks,
Nícolas

> 
> Yours,
> Linus Walleij

