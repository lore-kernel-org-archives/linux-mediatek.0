Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D335C77B7E
	for <linux-mediatek@archiver.kernel.org>; Thu, 27 Apr 2023 07:49:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xUFG6dXI28QCIPfu7dSckPWPuA9MLPpiho9eXI1hj/8=; b=pthgUizzC61P3I1ppoYoWMKkSX
	MF238YOuyGg0h6BBr0RLDZ20w3PpkJ57rv7cfxQHcsZaRBN2+P2ZF2G6WW9AWk9cB5udBA1eS3Ptd
	IT+b3SEnSJyRGbBADzrMkIqtx4QHqgtruwKDdMjpDcXSJjTdANLQKKBsePWjtNNWyL8BFhgXF7RMZ
	gaqVHOSrcNH72ynmTXOA0OrUPVIsqT/GjN2CPNoXDF/f75juUrD5sgfGg+WqA+LV35HnkBLHXSrvV
	cjWJFqm/H1fFhNTEEoyRdkxqy7ryfxBCh9dCiy+gYt8QEnAAJGSWq+/xJtWkHSyh0zxLFK09XfQiI
	D4fN0Akg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1prwN7-005j2c-1f;
	Thu, 27 Apr 2023 07:48:57 +0000
Received: from muru.com ([72.249.23.125])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1prwN3-005j0O-0n;
	Thu, 27 Apr 2023 07:48:54 +0000
Received: from localhost (localhost [127.0.0.1])
	by muru.com (Postfix) with ESMTPS id AA15480A4;
	Thu, 27 Apr 2023 07:48:46 +0000 (UTC)
Date: Thu, 27 Apr 2023 10:48:45 +0300
From: Tony Lindgren <tony@atomide.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
	Rob Herring <robh+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>,
	Ansuel Smith <ansuelsmth@gmail.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-actions@lists.infradead.org,
	linux-sunxi@lists.linux.dev, linux-omap@vger.kernel.org,
	linux-amlogic@lists.infradead.org, linux-arm-kernel@axis.com,
	linux-aspeed@lists.ozlabs.org, linux-rpi-kernel@lists.infradead.org,
	chrome-platform@lists.linux.dev, linux-renesas-soc@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com, kernel@dh-electronics.com,
	linux-mediatek@lists.infradead.org, openbmc@lists.ozlabs.org,
	linux-tegra@vger.kernel.org, linux-oxnas@groups.io,
	linux-arm-msm@vger.kernel.org, linux-unisoc@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-realtek-soc@lists.infradead.org
Subject: Re: [RFC PATCH 0/1] Categorize ARM dts directory
Message-ID: <20230427074845.GG14287@atomide.com>
References: <20220328000915.15041-1-ansuelsmth@gmail.com>
 <85eb14ec-f465-7447-ad77-a3dabc666f47@kernel.org>
 <YkKRYnN84D9VZhGj@Ansuel-xps.localdomain>
 <CAL_Jsq+RQQ-ADMxLPUFwk6S6kGmb6oNDy4k52fnU0EtbUvqmSA@mail.gmail.com>
 <CAMuHMdWNTE48MFy6fqxAsfMWz9b6E7dVNXtXtESP95sxk2PGwA@mail.gmail.com>
 <CAL_JsqJthKTm8bhRF2B=ae1tvtPeYYXx_Tm76qQtSwLtH5C6VA@mail.gmail.com>
 <1cfc224b-f8b0-3143-42d2-188b56368c61@gmail.com>
 <CAMuHMdU91NtZeFKe6mB3B48TNb64wfPu77xRbOEVX4tV65e38w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMuHMdU91NtZeFKe6mB3B48TNb64wfPu77xRbOEVX4tV65e38w@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230427_004853_342926_5895B11C 
X-CRM114-Status: GOOD (  22.33  )
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

* Geert Uytterhoeven <geert@linux-m68k.org> [230427 07:47]:
> On Thu, Apr 27, 2023 at 9:37 AM Matthias Brugger <matthias.bgg@gmail.com> wrote:
> > On 25/04/2023 17:57, Rob Herring wrote:
> > > On Tue, Apr 25, 2023 at 2:28 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > >> On Tue, Apr 25, 2023 at 12:16 AM Rob Herring <robh+dt@kernel.org> wrote:
> > >>> I have a script[1] that does the conversion written the last time this
> > >>> came up. Just have to agree on directory names. I think the easiest
> > >>> would be for Arnd/Olof to run it at the end of a merge window before
> > >>> rc1.
> > >>
> > >> "emev2" and "sh7" are missing for renesas.
> > >
> > > No doubt it's been bitrotting (or I may have missed some).
> > >
> > >> Does your script also cater for .dts files not matching any pattern,
> > >> but including a .dtsi file that does match a pattern?
> > >
> > > I assume I built everything after moving, but maybe not...
> > >
> > > That's all just "details". First, we need agreement on a) moving
> > > things to subdirs and b) doing it 1-by-1 or all at once. So far we've
> > > been stuck on a) for being 'too much churn'.
> > >
> >
> > I think it makes sense to move them and probably the best way to do so is, as
> > you proposed: that Arnd or Olof run the script to move them just before -rc1
> 
> FTR, no objections from my side.

Sounds good to me.

Regards,

Tony

