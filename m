Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FE9AC636D4
	for <linux-mediatek@archiver.kernel.org>; Fri, 17 Feb 2023 11:05:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hM9rL0JVVNKFO3v5UgE0idKVtxk83f58AH8WYexpF78=; b=EiUvbBcYljfeKagvhI77wF5z3e
	FNytjnMihs1rVbWfIfjRNpjz87fM53k3CmBbie6Rx3CnfaRBFpBwA685eG/tnjl9ymNJb2We/ZDYF
	GFSrhls2SimmtmuVpyCPDC1NtpvlRTHFC3FvpKdcUuVzT+vQalIzBk7IrGqhPHyVW/NfaG37vwVvp
	+hmX1geetSI/JT3WasEtJF1bFkyqGO2MBZZDaVu/wJqZfOZEAo+VNzpfVr/fHh5Oj6WotDkeGd+Dn
	Zn2izCgnYtef2EvQjHhF9IcI+I0YGFYABcSXkDiy1d8oqO40vpy6wKfzsoiF5UkGT6Jree84yLS8e
	YSmpootQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSyYE-00DpHT-WE; Fri, 17 Feb 2023 11:05:15 +0000
Received: from elvis.franken.de ([193.175.24.41])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSyY9-00DpBr-Fd; Fri, 17 Feb 2023 11:05:12 +0000
Received: from uucp (helo=alpha)
	by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
	id 1pSyXr-0008WE-01; Fri, 17 Feb 2023 12:04:51 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
	id 07845C28A0; Fri, 17 Feb 2023 12:03:07 +0100 (CET)
Date: Fri, 17 Feb 2023 12:03:06 +0100
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: arinc9.unal@gmail.com
Cc: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Paul Cercueil <paul@crapouillou.net>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Sergio Paracuellos <sergio.paracuellos@gmail.com>,
	Florian Fainelli <f.fainelli@gmail.com>,
	=?utf-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	devicetree@vger.kernel.org, linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, erkin.bozoglu@xeront.com
Subject: Re: [PATCH 2/2] mips: dts: ralink: mt7621: add port@5 as CPU port
Message-ID: <20230217110306.GB7138@alpha.franken.de>
References: <20230211104915.116253-1-arinc.unal@arinc9.com>
 <20230211104915.116253-2-arinc.unal@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230211104915.116253-2-arinc.unal@arinc9.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230217_030510_820713_3788F03C 
X-CRM114-Status: GOOD (  13.58  )
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

On Sat, Feb 11, 2023 at 01:49:15PM +0300, arinc9.unal@gmail.com wrote:
> From: Arınç ÜNAL <arinc.unal@arinc9.com>
> 
> On MT7621AT, MT7621DAT, and MT7621ST SoCs, port 5 of the MT7530 switch is
> connected to the second MAC of the SoC as a CPU port. Add the port and set
> up the second MAC on the bindings. Revert PHY muxing on GB-PC1.
> 
> There's an external PHY connected to the second MAC of the SoC on GB-PC2,
> therefore, disable port@5 for this device.
> 
> Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
> ---
>  .../boot/dts/ralink/mt7621-gnubee-gb-pc1.dts  | 16 +++++-----------
>  .../boot/dts/ralink/mt7621-gnubee-gb-pc2.dts  |  9 ++++++++-
>  arch/mips/boot/dts/ralink/mt7621.dtsi         | 19 ++++++++++++++++++-
>  3 files changed, 31 insertions(+), 13 deletions(-)

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

