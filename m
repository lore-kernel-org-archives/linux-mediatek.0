Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4E07C4321E
	for <linux-mediatek@archiver.kernel.org>; Thu,  1 Dec 2022 10:58:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8DL5vd6PrAea4l4dk6WTDBUf/fZApIdJU9m+K2u16nI=; b=DnayapHECfHAdjrTcQIDEcJKf+
	8GbKcTCWQWzcXYlu31I385wbBsbMlMsbgdxJM8OteiSOFNohu+pO+Nxw7ke3b7T/R/5H0IICouDEY
	2s4eyqhN/YkvbV9iM/mUXO+Pcld8Rhp0Wx5WT59jOQAh6X6jAMj73oIf5yiptlZHx1RQMRM83zIFh
	xb2T/tTht+N3IaNuThNMmUsXNyp7GV7ZkXfTMQYNkEvm2bAIFwCqt8XfyVDrESsD6en8ZKRvR1se6
	0+MOpksMWkTPlApPAcGFxkMcgspVAGmTxce0Sj63YhzpDQ8P3a6zp6K6WkYd4sVBpU5wKX8HrizBQ
	K46/mskQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0hGr-006t6s-Oq; Thu, 01 Dec 2022 10:58:25 +0000
Received: from elvis.franken.de ([193.175.24.41])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0hGf-006szb-CR; Thu, 01 Dec 2022 10:58:16 +0000
Received: from uucp (helo=alpha)
	by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
	id 1p0hGS-0007Uq-01; Thu, 01 Dec 2022 11:58:00 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
	id B5897C1EF5; Thu,  1 Dec 2022 11:51:17 +0100 (CET)
Date: Thu, 1 Dec 2022 11:51:17 +0100
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: =?utf-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
Cc: Sergio Paracuellos <sergio.paracuellos@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	linux-mips@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mips: ralink: mt7621: change DSA port labels to generic
 naming
Message-ID: <20221201105117.GB6569@alpha.franken.de>
References: <20221129111711.2739-1-arinc.unal@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221129111711.2739-1-arinc.unal@arinc9.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221201_025813_623692_48372935 
X-CRM114-Status: GOOD (  12.04  )
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

On Tue, Nov 29, 2022 at 02:17:11PM +0300, Arınç ÜNAL wrote:
> Change the labels of the DSA ports to generic naming for switch ports.
> 
> Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
> ---
>  arch/mips/boot/dts/ralink/mt7621.dtsi | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

