Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A77CFA373D
	for <linux-mediatek@archiver.kernel.org>; Thu, 27 Oct 2022 23:25:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/xHQTI8QJNRbEthoCuBC6KXDqaaOg1Lmx0RUoGFdJo4=; b=n/BMnYf9WyRZqP7S+ZIQyWrs2Z
	Nkh2JgHUKlAwRiyS5g8Q//mVRIBPr2tpxlsdyW3u9T857w7rw1RMbp4HabIN9pEx7W6KwGfRVyspE
	X3rkVlZLtsKextKxyyokQnywhjms9Exf1ee4oM9hLbAs0J8c3QUU4jc1FlEnsLUZgBTur4HqFr+kx
	ZL3o23k4v/OIlmtwtelJLde/64CwjEV5MZDoC9s2TcMpdHIv14raEsMaF7vZDvXbb9kOGRxED/LO4
	F8MMCcJZB/YQE1zLNqpSBE5I/69oYuCCN5JUuSW6ajNb9o7TWhZfRkM9RKD75wsU4WzZlgJZDfh7l
	yEJbbMKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ooCFA-00FE5C-1t; Thu, 27 Oct 2022 23:25:00 +0000
Received: from fudo.makrotopia.org ([2a07:2ec0:3002::71])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ooCEz-00FE48-V1; Thu, 27 Oct 2022 23:24:51 +0000
Received: from local
	by fudo.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.94.2)
	(envelope-from <daniel@makrotopia.org>)
	id 1ooCEq-0006Aq-KP; Fri, 28 Oct 2022 01:24:40 +0200
Date: Fri, 28 Oct 2022 00:24:35 +0100
From: Daniel Golle <daniel@makrotopia.org>
To: Stephen Boyd <sboyd@kernel.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
	Sam Shih <sam.shih@mediatek.com>,
	Miles Chen <miles.chen@mediatek.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Chen-Yu Tsai <wenst@chromium.org>
Subject: Re: [PATCH v2] clk: mediatek: fix dependency of MT7986 ADC clocks
Message-ID: <Y1sTM/E1VY+XdHk5@makrotopia.org>
References: <9bde77be-f4ec-11e7-e645-7c4465bcf6db@collabora.com>
 <5e55012567da74870e1fb2edc2dc513b5821e523.1666801017.git.daniel@makrotopia.org>
 <20221027214151.7F112C433D6@smtp.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221027214151.7F112C433D6@smtp.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221027_162450_037475_D509FD21 
X-CRM114-Status: GOOD (  15.30  )
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

On Thu, Oct 27, 2022 at 02:41:49PM -0700, Stephen Boyd wrote:
> Quoting Daniel Golle (2022-10-26 09:18:07)
> > It seems like CLK_INFRA_ADC_FRC_CK always need to be enabled for
> > CLK_INFRA_ADC_26M_CK to work. Instead of adding this dependency to the
> > mtk-thermal and mt6577_auxadc drivers, add dependency to the clock
> > driver clk-mt7986-infracfg.c.
> 
> Is this a cleanup patch? Or a pre-requisite for thermal and auxadc
> drivers? I don't understand the priority of this patch. Should I apply
> it to fix a regression?

I'd say 'no', as AUXADC and thermal has not yet been added to
mt7986a.dtsi, also the corresponding clocks are currently still unused.
So while this commit does fix a previous commit, it doesn't have a direct
impact and will only matter once thermal and auxadc units are added to
mt7986.dtsi.

