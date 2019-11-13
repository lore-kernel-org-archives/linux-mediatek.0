Return-Path: <SRS0=w4bH=ZF=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD09BC43331
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 Nov 2019 06:53:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A6FDE222CD
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 Nov 2019 06:53:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="EIX5kmdv"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A6FDE222CD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=fi.rohmeurope.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AD9jJAp2YFQJ5zRJiDn1jPPBaji0GQsN9ZjA9uEa6Uw=; b=EIX5kmdvFxKc6V
	o7jFpj8LcUviTnmkcc5+A/AJPqusSyaLnqXbvzTiYVGceXGd6rFAUkUMRnA8UZTUUhLhzOkZPNelh
	xD3FlnTnWmIywGgw+Hwg7iiBNAJW3sTJJTOUjMJrlZBDuK9uaHVicpkKzgHfd4Xm9hcCkTPdl5SW6
	aBW3nKlWRsJ6y3HsTnsVxzAk7e3KrXqDKEdAwf572juewwrZcrndiM/FvdTifLNOw3UF+HU+/cL70
	k51H1LR8aWcK2ZBtiM3uclHQ8FMrV0GXzxxZQZ9ewGF4259gchFLdmG1pXHHWjLANWN74oHExrfVV
	vtOwjbuC45TojNY6pDKQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iUmWk-0007lc-Td; Wed, 13 Nov 2019 06:53:18 +0000
Received: from mailgate1.rohmeurope.com ([178.15.145.194])
 by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iUmWT-0007UG-EN; Wed, 13 Nov 2019 06:53:03 +0000
X-AuditID: c0a8fbf4-199ff70000001fa6-37-5dcba8474e9a
Received: from smtp.reu.rohmeu.com (will-cas002.reu.rohmeu.com
 [192.168.251.178])
 by mailgate1.rohmeurope.com (Symantec Messaging Gateway) with SMTP id
 0C.B8.08102.748ABCD5; Wed, 13 Nov 2019 07:52:55 +0100 (CET)
Received: from WILL-MAIL002.REu.RohmEu.com ([fe80::e0c3:e88c:5f22:d174]) by
 WILL-CAS002.REu.RohmEu.com ([fe80::fc24:4cbc:e287:8659%12]) with mapi id
 14.03.0439.000; Wed, 13 Nov 2019 07:52:51 +0100
From: "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>
To: "lkp@intel.com" <lkp@intel.com>
Subject: Re: [PATCH 2/2] pinctrl: Use new GPIO_LINE_DIRECTION
Thread-Topic: [PATCH 2/2] pinctrl: Use new GPIO_LINE_DIRECTION
Thread-Index: AQHVmWQOgs5cHlsmlU+Vdtkf5ZbC06eIlAaAgAAGWoA=
Date: Wed, 13 Nov 2019 06:52:51 +0000
Message-ID: <ac16492e11899ef4ec981f7f2e84714c7d61d2a7.camel@fi.rohmeurope.com>
References: <20191112141819.GA22076@localhost.localdomain>
 <201911131438.KT6pnFZ7%lkp@intel.com>
In-Reply-To: <201911131438.KT6pnFZ7%lkp@intel.com>
Accept-Language: en-US, de-DE
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [213.255.186.46]
Content-ID: <C743A44B714FD7408E8547FE06DD0021@de.rohmeurope.com>
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA02TbUxbZRiG855vYIccSmnfoUZXQnCaMTc1ebOvMJ3x8MNlxixLpgTPxpE2
 g7ZpiwP9IQzm1iIKrpmua0GhQGllzBYDTipNnVpXGRtkHQub46MjgluJ2+ICTLCHusGvc+e5
 n/u+3h/PYXDZJTqT0WhNokErlKioZCLgWvBueN0VLnihZmILuji5QKBjsTYafRsNAzR4I4ij
 zrqfCRTujxEoUDUM0HzsPI0cpz8HyO6qQEsTf5GoyjlMoIHaCEDWh+0Y8k5GSNTQP0AjX9ND
 gIbP2Sk0XH0ZoPCcB0ffTccwdHdsCUcNo2dpZIlESTRTPUGhPzuvkuhIzYvI3hoiUOO/nSQK
 fvo26vF9jSN76ApAn7UMEejWKR+FYp4oQCfO5KPZuZ3o15AZR3PBQSwvhz8y+wvFz44cpfnG
 bz7kbTcHKN4zdIziz054SL5hYAP/ve0Gzbd4+ym+yfwA41v6pjHe6zZTfGVgkOCvR/oovvb0
 IsH7nB/tUexP2XZAML3/lqZYu3HHuynqkako0Nenlrf1XqUrwRhrAUkM5F6CJ+q+oCwgmZFx
 VwC0Wh2kZMi4EIBO7zoLYBiK2wYt12hpLOeyYOs9Hy7t45w7DVZ12DDJSOe2w9GPhyhpX87t
 gL7ulITcAs19r0mS4LLhvU+ypGWW2w0D3X4iAToIL800L0OTuM2w3WldLgTcU9BcGVvWOKeE
 3qkHZOLFHHT2DeIJnQGnJxf/n6ugf26ckFA4tx52nduYiOZBl6cLJPQ6aK0dpxNPSIO/nYoS
 9UBhW0WwraRtq9K2VWnbqvRXgHQDWCpoSooFk7gp1yCW5Rp06tL456Cu1AsSF3q/FywF84MA
 Y0AQrGUwVQbbUx0ukKUe0BVVqAWjutBQViIagwAyuErO9paHCmRskVDxgWjQPbKeYAiVks0Z
 byiQcRLrkCjqRcMj90mGUUGWb4+XphnEYrH8PU2JacXGmCSpPDlTbhS1RaJBKDOpC6XbKDTG
 j0Oy1sS5prZ4nDXqhdL4NBG9AJ5n6qcdzThz3tHajMsIrU4rZipZvUTipFV1mfYxaAYoGaBK
 Z49KRWviv+njnpk4Aosjan66ICFMwoqVWQneOHyGkvu1mn/2bO1Wpveongn8fWuvW7F/RH/d
 vddv/zIn+/47xy86Zrb75ptAe93lrsKdebmvJN3Md6GsXc8eOt64b7Hn2ps55sOKBe2PntZw
 cYaXpDbf6fBtPbnbepd7uaklmxoThX7F6O21t0/+cGd+fceuP57e9zvlX5iqjaS+qiKMamHT
 c7jBKPwHB3TLUWMEAAA=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191112_225301_638244_78E5F74B 
X-CRM114-Status: UNSURE (   9.97  )
X-CRM114-Notice: Please train this message.
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
 "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
 "patrice.chotard@st.com" <patrice.chotard@st.com>,
 "paul@crapouillou.net" <paul@crapouillou.net>,
 "eric@anholt.net" <eric@anholt.net>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "jason@lakedaemon.net" <jason@lakedaemon.net>,
 "f.fainelli@gmail.com" <f.fainelli@gmail.com>,
 "gregory.clement@bootlin.com" <gregory.clement@bootlin.com>,
 "ludovic.desroches@microchip.com" <ludovic.desroches@microchip.com>,
 "linux-rockchip@lists.infradead.org" <linux-rockchip@lists.infradead.org>,
 "wens@csie.org" <wens@csie.org>, "agross@kernel.org" <agross@kernel.org>,
 "bcm-kernel-feedback-list@broadcom.com"
 <bcm-kernel-feedback-list@broadcom.com>,
 "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
 "sebastian.hesselbarth@gmail.com" <sebastian.hesselbarth@gmail.com>,
 "alexandre.torgue@st.com" <alexandre.torgue@st.com>,
 "mazziesaccount@gmail.com" <mazziesaccount@gmail.com>,
 "rjui@broadcom.com" <rjui@broadcom.com>,
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


On Wed, 2019-11-13 at 14:30 +0800, kbuild test robot wrote:
> Hi Matti,
> 
> Thank you for the patch! Perhaps something to improve:
> 
> [auto build test WARNING on 70d97e099bb426ecb3ad4bf31e88dbf2ef4b2e4c]
> 

>    480	static int wmt_gpio_get_direction(struct gpio_chip
> *chip, unsigned offset)
>    481	{
>    482		struct wmt_pinctrl_data *data =
> gpiochip_get_data(chip);
>    483		u32 bank = WMT_BANK_FROM_PIN(offset);
>    484		u32 bit = WMT_BIT_FROM_PIN(offset);
>    485		u32 reg_dir = data->banks[bank].reg_dir;
>    486		u32 val;
>    487	
>    488		val = readl_relaxed(data->base + reg_dir);
>    489		if (val & BIT(bit))
>  > 490			GPIO_LINE_DIRECTION_OUT;

Right. Return is missing. I think I already fixed this - I guess I sent
wrong version... Sorry guys. I'll do v3 with only this return added -
and I'll send it to limited amount of recipients as I think most of you
guys may not be interested. Probably to Linus W, Geert and GPIO list
only. Let me know if you want to see the v3 (or other subsequent
patches)

>    491	
>    492		return GPIO_LINE_DIRECTION_IN;
>    493	}
>    494	
> 
> ---
> 0-DAY kernel test infrastructure                 Open Source
> Technology Center
> https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org Intel
> Corporation

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
