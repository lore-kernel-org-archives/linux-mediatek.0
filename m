Return-Path: <SRS0=w4bH=ZF=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94E91C43331
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 Nov 2019 10:06:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 693102245A
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 Nov 2019 10:06:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="B2V+R0qO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 693102245A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=fi.rohmeurope.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3FpUeEPbX5o9rJ6OEdJHea4dRrduqV3Cyg6NG+ROZDo=; b=B2V+R0qOnFQK5y
	WnRqnSaEiKm9jyyBzCeYYFZRgIfgVfzA8DH4/xdKT2QBF75eb/1l6nSV8C66/GnNVrWhIHOgzoXiM
	ntGBulJZ6XdKbx2gmhCpy/x89qxZzFcaKunGGqAYtNW6Kwt+R5Lz8BXql2+OcQ99jmarixoqiDVJK
	bb5XYAdmdYXI/mRdw8RlMtbRUxp9L8STl/je7yYyV353oHnKTs2XfdThvSiLG7KrCplmjGmmvliy6
	eCY9FhcsyGkx8VANEOk2jnXg7ZxBJBSz04lZwDC9N9XPiGCI40IPzHzdjV1gD11RYVWu8E00ilK88
	WaLgHzpY03gMHzaAtmiQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iUpXt-00049Z-US; Wed, 13 Nov 2019 10:06:41 +0000
Received: from mailgate1.rohmeurope.com ([178.15.145.194])
 by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iUpXr-00048u-8f; Wed, 13 Nov 2019 10:06:40 +0000
X-AuditID: c0a8fbf4-183ff70000001fa6-35-5dcbd5aad21d
Received: from smtp.reu.rohmeu.com (will-cas001.reu.rohmeu.com
 [192.168.251.177])
 by mailgate1.rohmeurope.com (Symantec Messaging Gateway) with SMTP id
 09.3A.08102.AA5DBCD5; Wed, 13 Nov 2019 11:06:34 +0100 (CET)
Received: from WILL-MAIL002.REu.RohmEu.com ([fe80::e0c3:e88c:5f22:d174]) by
 WILL-CAS001.REu.RohmEu.com ([fe80::d57e:33d0:7a5d:f0a6%16]) with mapi id
 14.03.0439.000; Wed, 13 Nov 2019 11:06:30 +0100
From: "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>
To: "linus.walleij@linaro.org" <linus.walleij@linaro.org>
Subject: Re: [PATCH 2/2] pinctrl: Use new GPIO_LINE_DIRECTION
Thread-Topic: [PATCH 2/2] pinctrl: Use new GPIO_LINE_DIRECTION
Thread-Index: AQHVmWQOgs5cHlsmlU+Vdtkf5ZbC06eIlAaAgAAGWoCAAC7LgIAAB1AA
Date: Wed, 13 Nov 2019 10:06:29 +0000
Message-ID: <b67faf875fd0060ad36db04b29c109f01e58ab1a.camel@fi.rohmeurope.com>
References: <20191112141819.GA22076@localhost.localdomain>
 <201911131438.KT6pnFZ7%lkp@intel.com>
 <ac16492e11899ef4ec981f7f2e84714c7d61d2a7.camel@fi.rohmeurope.com>
 <CACRpkdYAmye8wT39fqy=LN+6pXDvrcQ0SyDTCvG7aSgea3Uumw@mail.gmail.com>
In-Reply-To: <CACRpkdYAmye8wT39fqy=LN+6pXDvrcQ0SyDTCvG7aSgea3Uumw@mail.gmail.com>
Accept-Language: en-US, de-DE
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [213.255.186.46]
Content-ID: <754252B81D9D734D9DE00A1EDD014380@de.rohmeurope.com>
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA02Tb0wbZRzHfe6ud0dZx1EYfUR9YaNjc7K5OJPHiMs0uhxvpovyRkPYMW4U
 By25lgku0Y6yLS06KRAjpbCNP9uyDoFWNsYwxYJa12BdG0ACRAtlG9WVYJbMbox6t7LBq+f3
 PN/v9/f5vfg9NK4MUJl0idbAC1quVE3KiaELD3qzHWO+/FfmD6Pf5h4Q6GT0HIV6wz6A/DMe
 HHV99ROBfO4ogYaOBQG6Hx2hUEtzPUD2C1UoPvu3DB3rCBJotHYcoMbl8xhyzo3LkNU9SiHX
 6WWAggN2EgVNNwDyxRw46luIYujfv+I4sk71UMgyHpahiGmWRLe7JmSouuZVZO/0Eqj1YZcM
 eU59jK64zuLI7h0D6Ov2AIHmm1wkijrCADV8l4sWY2+hX7xmHMU8fmxPFlu9+DPJLv5xnGJb
 Lx1lbX+OkqwjcJJke2YdMtY6ms1etc1QbLvTTbKnzfcwtn1wAWOdF80kaxzyE+z0+CDJ1jav
 EKyr44v3Mz5KzinkDEc+KCnW7th9IFnTerMOlE/LK6dq2jAj6JdbQBINmV1wxVwHLEBOK5kx
 AEPnXXji4gUwuLwiXmiaZHKgZZKSAunM63DYayekGmfqU2FkeItUpzFvwqkTAVKypzO7oev7
 5IR9L7QPXHpkJ5gXoXFkDJdqBbMPOtp9q6glACduzwNJSGL2w8t246MAYJ6DZmMUS7BU0Hnz
 niwxNAM7Bv14ot4EF+ZWVt/V8IdYiJBmwJmtsHtgRyK6B070nltt8zxsrA1RiRlS4a9NYaIO
 ZNjWEWxradu6tG1d2rYufQbILgJYxpWUFnMGfud2ga/YLug0ZeJxUFfmBIkdvdsP4p5cD8Bo
 4AFP05h6k+KKyZev3FioK6rScHpNgVBRyus9ANK4Ol3RX+nNVyqKuKrPeEH3WHqGJtQqRVbI
 mq9kJNZhni/nhcfqszSthop3R8SmqQJfzFceKik1rMkYnSQ1l2em63ltES9wFQZNgbQeBXpx
 PyRpg8id/F2MK/TlXJn4moheB9vouoWWNpweaelsw5WEVqflM1WK/ZKVkayaCu0TUASoaKBO
 U3T5RXWD+FGf9ImICExE1AxflxAGbk3KNIIvp0/NvEyH4ku3Ck3/dBT2ma66c+OpB7NTfjy6
 Me+hMLv0uc2w+eydyTx397W0N0IpkeMZmhdU751omG+g+preob79sNpx40j4WiPrfeqTCbx2
 73Bng1WV1bprc/PdKU/4P139Hbvy7X15t1LOLFlyAlvsNQdiPZ92Fye9Vn2/vu2bbjWh13A7
 X8IFPfc/bnCeumUEAAA=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191113_020639_457851_F8690253 
X-CRM114-Status: GOOD (  12.16  )
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
Cc: "andrew@lunn.ch" <andrew@lunn.ch>,
 "alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>,
 "heiko@sntech.de" <heiko@sntech.de>,
 "geert+renesas@glider.be" <geert+renesas@glider.be>,
 "narmstrong@baylibre.com" <narmstrong@baylibre.com>,
 "patrice.chotard@st.com" <patrice.chotard@st.com>,
 "paul@crapouillou.net" <paul@crapouillou.net>,
 "eric@anholt.net" <eric@anholt.net>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "jason@lakedaemon.net" <jason@lakedaemon.net>,
 "f.fainelli@gmail.com" <f.fainelli@gmail.com>, "lkp@intel.com" <lkp@intel.com>,
 "gregory.clement@bootlin.com" <gregory.clement@bootlin.com>,
 "ludovic.desroches@microchip.com" <ludovic.desroches@microchip.com>,
 "linux-rockchip@lists.infradead.org" <linux-rockchip@lists.infradead.org>,
 "wens@csie.org" <wens@csie.org>, "agross@kernel.org" <agross@kernel.org>,
 "bcm-kernel-feedback-list@broadcom.com"
 <bcm-kernel-feedback-list@broadcom.com>,
 "rjui@broadcom.com" <rjui@broadcom.com>,
 "sebastian.hesselbarth@gmail.com" <sebastian.hesselbarth@gmail.com>,
 "alexandre.torgue@st.com" <alexandre.torgue@st.com>,
 "mazziesaccount@gmail.com" <mazziesaccount@gmail.com>,
 "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
 "nicolas.ferre@microchip.com" <nicolas.ferre@microchip.com>,
 "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "linux-rpi-kernel@lists.infradead.org" <linux-rpi-kernel@lists.infradead.org>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "kbuild-all@lists.01.org" <kbuild-all@lists.01.org>,
 "sbranden@broadcom.com" <sbranden@broadcom.com>,
 "sean.wang@kernel.org" <sean.wang@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 "wahrenst@gmx.net" <wahrenst@gmx.net>,
 "mcoquelin.stm32@gmail.com" <mcoquelin.stm32@gmail.com>,
 "linux-oxnas@groups.io" <linux-oxnas@groups.io>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


On Wed, 2019-11-13 at 10:40 +0100, Linus Walleij wrote:
> On Wed, Nov 13, 2019 at 7:52 AM Vaittinen, Matti
> <Matti.Vaittinen@fi.rohmeurope.com> wrote:
> > On Wed, 2019-11-13 at 14:30 +0800, kbuild test robot wrote:
> > Right. Return is missing. I think I already fixed this - I guess I
> > sent
> > wrong version... Sorry guys. I'll do v3 with only this return added
> > -
> > and I'll send it to limited amount of recipients as I think most of
> > you
> > guys may not be interested. Probably to Linus W, Geert and GPIO
> > list
> > only. Let me know if you want to see the v3 (or other subsequent
> > patches)
> 
> I think I already merged it, just send a new patch on top fixing the
> problem.

Hmm. Are you sure you did merge the pincontrol part already? I don't
see it in your GPIO tree, devel or for-next branches. Can you please
point me the branch - I already destroyed my original pincontrol commit
which had the bug when I created the v2.

Br,
	Matti Vaittinen

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
