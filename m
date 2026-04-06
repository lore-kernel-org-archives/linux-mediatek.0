Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 231AFEF4EDF
	for <linux-mediatek@archiver.kernel.org>; Mon,  6 Apr 2026 12:35:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=beuVj1GM4stqoqd5lgplEfzpxAtDZ8E4uxY79YaFhyI=; b=44UBzpNMUqQDZpheNAi/qzLQWt
	QJr2TKDsHp+OWpv575aWjR0WEgpKZfAPBV+Il/k/Ga7QX4VtW1C6BG/Lzbr4vQa9GJG0v+2DWNyjk
	DRWy4vHzkFMKLXQo6wHEPwl/DweB9OXWRmXshFPDbolv1VtbKYFIyD43xlM/Kjp2WhbodqbbV82kC
	wfN9kiAily3KaxeF2+icqoCAQXkyMjH2Wm0qnhWdVnwjw77/F+9jbMgz9L92URMgCeokv407gKpyk
	sWld04OkllCMUNWdLpVZPo6wN/ETwZTg6Ft1mau9EybcRq7LnM1CLm2kS/XO0sMijxJ0Kg6s5cntn
	owmDq4bQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9jAc-000000056k5-05Mu;
	Mon, 06 Apr 2026 12:35:10 +0000
Received: from elvis.franken.de ([193.175.24.41])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9jAW-000000056gs-1dot;
	Mon, 06 Apr 2026 12:35:07 +0000
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1w9jAQ-00040l-00; Mon, 06 Apr 2026 14:34:58 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
	id 20329C0988; Mon,  6 Apr 2026 14:29:08 +0200 (CEST)
Date: Mon, 6 Apr 2026 14:29:08 +0200
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Shiji Yang <yangshiji66@outlook.com>
Cc: linux-mips@vger.kernel.org, Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 2/3] mips: pci-mt7620: add more register init values
Message-ID: <adOnFMS2l_diXevH@alpha.franken.de>
References: <OSBPR01MB1670555F549B69B9A5E7F133BC72A@OSBPR01MB1670.jpnprd01.prod.outlook.com>
 <OSBPR01MB167036A58FE6FB745311AF5FBC72A@OSBPR01MB1670.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <OSBPR01MB167036A58FE6FB745311AF5FBC72A@OSBPR01MB1670.jpnprd01.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260406_053504_591928_47DA6A5B 
X-CRM114-Status: GOOD (  11.86  )
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

On Wed, Jun 18, 2025 at 11:42:06AM +0800, Shiji Yang wrote:
> These missing register init values are ported from the vendor SDK.
> It should have some stability enhancements. Tested on both MT7620
> and MT7628.
> 
> Signed-off-by: Shiji Yang <yangshiji66@outlook.com>
> ---
>  arch/mips/pci/pci-mt7620.c | 59 +++++++++++++++++++++++++++++---------
>  1 file changed, 46 insertions(+), 13 deletions(-)

applied to mips-next

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

