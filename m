Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A08FC77B7F
	for <linux-mediatek@archiver.kernel.org>; Wed,  3 May 2023 12:01:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ix7N5q3ZVqpzch8HgBmAf+2RPj4ErJP5ku/rS3Udqzo=; b=nPEnfpRTa+u/LOvPghrcimdD7O
	Ji7kKmUb7m2S3j0FYyE5s1XJsgJBXG2a6W9vwrpANgkLnJn0XX9TzMyHSx/xin+90fygryImRxwsF
	7nohnB7b2tWsCJ5DN2GwLxI/fe3yyczaeWsRrNJyf9BgkCqxg/RCFY76/6+PSR6keCJBLNOKCXAn1
	21h6x2aCnqnfo3gIrT4fY32fO0Xygf58maKeVHtwIZykLTvR8kSt+VpjP8LqRahHFpHx0Rrac6UXY
	X0rXk24M2DtD8DU1XYKBx60o0HMIFvB5ghZ8+ggjWDspZFy6nX2MOcXWBS1GQ+58d3V8kDJcuqD98
	LZT5T62w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1puBAl-004Ugf-2M;
	Wed, 03 May 2023 12:01:27 +0000
Received: from smtp2.axis.com ([195.60.68.18])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1puBAh-004UeI-0Z;
	Wed, 03 May 2023 12:01:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1683115284;
  x=1714651284;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=Ix7N5q3ZVqpzch8HgBmAf+2RPj4ErJP5ku/rS3Udqzo=;
  b=AcVKgBxHfhQn4WeIYDWNjsO8TyCEHpjZkJDDAPlpqbzNutOYP+WJjpGt
   DQ4Trc98lIuNZX/SurcxDMTnTRo2hPNABV2PbBHmr+V9kKvana9Sr35lY
   tA1J55zSOSgWIy0+gI3uitp1B3qoSuLkqV6C/V+hi5vk7CWKdsqg39ift
   UjNE2frBu9aHRzg3c0r/PjbAwqtWmH9YQr0f9R6UG0eC+ykHYX2JRA0fA
   Nk37xJMHt5qO2QVYKafRET0r0bSkBry+qIP/abnkeiNxW7vK15cRPrIgd
   Js/vVses32NX4U70/c4o8UWi0Zpds7Lnb0+CAolL1jQiV1u51b0HrjI67
   g==;
Date: Wed, 3 May 2023 14:01:12 +0200
From: Jesper Nilsson <jesper.nilsson@axis.com>
To: Rob Herring <robh+dt@kernel.org>
CC: Arnd Bergmann <arnd@arndb.de>, <linux-aspeed@lists.ozlabs.org>,
	<linux-realtek-soc@lists.infradead.org>, <linux-arm-kernel@axis.com>,
	<linux-stm32@st-md-mailman.stormreply.com>,
	<chrome-platform@lists.linux.dev>, <linux-samsung-soc@vger.kernel.org>,
	<openbmc@lists.ozlabs.org>, Krzysztof Kozlowski <krzk@kernel.org>,
	<linux-rockchip@lists.infradead.org>, Geert Uytterhoeven
	<geert@linux-m68k.org>, <linux-sunxi@lists.linux.dev>,
	<devicetree@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
	<linux-actions@lists.infradead.org>, <linux-unisoc@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, <linux-rpi-kernel@lists.infradead.org>,
	<linux-tegra@vger.kernel.org>, <linux-amlogic@lists.infradead.org>,
	Linux-OMAP <linux-omap@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	Christian Marangi <ansuelsmth@gmail.com>, Linux-Renesas
	<linux-renesas-soc@vger.kernel.org>, <kernel@dh-electronics.com>, "Olof
 Johansson" <olof@lixom.net>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	"linux-oxnas@groups.io" <linux-oxnas@groups.io>
Subject: Re: [RFC PATCH 0/1] Categorize ARM dts directory
Message-ID: <20230503120112.GC19396@axis.com>
References: <20220328000915.15041-1-ansuelsmth@gmail.com>
 <85eb14ec-f465-7447-ad77-a3dabc666f47@kernel.org>
 <YkKRYnN84D9VZhGj@Ansuel-xps.localdomain>
 <CAL_Jsq+RQQ-ADMxLPUFwk6S6kGmb6oNDy4k52fnU0EtbUvqmSA@mail.gmail.com>
 <CAMuHMdWNTE48MFy6fqxAsfMWz9b6E7dVNXtXtESP95sxk2PGwA@mail.gmail.com>
 <CAL_JsqJthKTm8bhRF2B=ae1tvtPeYYXx_Tm76qQtSwLtH5C6VA@mail.gmail.com>
 <720a2829-b6b5-411c-ac69-9a53e881f48d@app.fastmail.com>
 <CAL_JsqKCtmkwzKa01gyG65fH8ye6R3KhR41PJbJhOJ4X9j=znA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAL_JsqKCtmkwzKa01gyG65fH8ye6R3KhR41PJbJhOJ4X9j=znA@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230503_050124_038777_6BDB8076 
X-CRM114-Status: GOOD (  13.05  )
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

On Tue, May 02, 2023 at 02:40:19PM -0500, Rob Herring wrote:
> On Tue, May 2, 2023 at 3:15 AM Arnd Bergmann <arnd@arndb.de> wrote:
> I've dusted off my script and made a branch[1] with the result.
> There's just a couple of fixes needed after the script is run (see the
> top commit). The cross arch includes are all fixed up by the script.
> dtbs_install maintains a flat install. I compared the number of .dtbs
> before and after to check the script.
> 
> I think the only issue remaining is finalizing the mapping of
> platforms to subdirs. What I have currently is a mixture of SoC
> families and vendors. The most notable are all the Freescale/NXP
> platforms, pxa, socfpga, and stm32. It's not consistent with arm64
> either. Once that's finalized, I still need to go update MAINTAINERS.
> 
> Here's the current mapping:
> 
> vendor_map = {
> [...]
>     'artpec' : 'axis',

Looks good for our platforms also, thanks!

/^JN - Jesper Nilsson
-- 
               Jesper Nilsson -- jesper.nilsson@axis.com

