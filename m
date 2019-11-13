Return-Path: <SRS0=w4bH=ZF=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 896B4C432C3
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 Nov 2019 17:18:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CAA26206ED
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 Nov 2019 17:18:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="thizUzO3";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KvuV0fh/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CAA26206ED
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=U+0rp6OcVDJr/stIwiqwrWjWODHA4JZL4fNMhd3cQj8=; b=thizUzO3rG9afh
	2xEwPA3PDlwMUY3TmGlFPilIBJG8aJQ6I8uYQWzsLMGrJspQb+dRPtBCf56j7hC+Pqpz99qw9IchL
	3jSsKcK9fgyIUoGXN8fDmBnvkCbsUAw94nOzIcOzoWfsFg2sC8PessP013vnLYeHTawFjVqh6x8e7
	asdkM0DZGFpI3mPM8P1Kchg+/YH8m6dQFX5WBI6hlfwGA0e+laPrUWdEO3OHvvaGnb9mI5JxGFvUE
	edWesMS4GgwAe4oI+4MfP3iFZOhDeJENgtPK2aQEdkrQJ9eZ6N/xAaei/E5tI2aFNQyQ1hCkZSm1P
	kxXvFmalEhjUPtdFVc+w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iUwHk-0003Eh-3g; Wed, 13 Nov 2019 17:18:28 +0000
Received: from mail-lj1-x243.google.com ([2a00:1450:4864:20::243])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iUwHh-0003DX-Qf
 for linux-mediatek@lists.infradead.org; Wed, 13 Nov 2019 17:18:27 +0000
Received: by mail-lj1-x243.google.com with SMTP id n5so3443994ljc.9
 for <linux-mediatek@lists.infradead.org>; Wed, 13 Nov 2019 09:18:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=WgpjeDP92LtqHtJXxSWI//ZDvUBHvFnRmWqhhvkv3sU=;
 b=KvuV0fh/hJQyvRYAMyLtyX7TtdrS4cRfCetdL0REIkE+MZASromLfykUpUl271O+CX
 vFdpD6FCntAze0eiaLeCGewSPBYzWcMyf8dAip0r8ZYXAdwDlGykLbTwiivROOyI2jcu
 UqZ9m0g904KiBxG4PAMdp1dQu69o/iLfXSGCuUSWnkAM1RZk4SKm02qXOtPg478nMo1w
 2u+noeVIBVZdLdjiJORmfrpGe4D8XpbYfR67n+nowmC4HyebMgPh4pG3a2eeWqFYwJwr
 JuqVAGOMP2v4G0vVkcsS9JARWxnX0VZhRa5GgVLcIqhEySXkSYAdEzE9f/BdNMWNDQFQ
 6eXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=WgpjeDP92LtqHtJXxSWI//ZDvUBHvFnRmWqhhvkv3sU=;
 b=S87Rv3NYpJw+nBltPbpI5iInqw3j7gm0VhvNMwKsFfpoZQrGS12xSyEFomn1UyqL5v
 6biB1n68z+RYo4IUzJvJBTSLJdlchgkjCEIQTSSYl3hn15GHt8sdWxp45Y3X8qqMFjXT
 hxDVkxFl6VEx7LMtlOQfU+MYFsIH3AbU0IG0K3tHenw0uW0jicQnoNAeyr/ChMteg+tN
 xOSo2Le53AZvettNeN/rDkmSF/Yoj7eQlRJunoon9D+yAIAD5/H9L23hxXfCZ50yjf6Y
 014uxD6FDQ5rAm2A2YVh55ptciQui7RJesP76PKocSNyAHWHEwviQAmvEsYuETUn+T7D
 dPvg==
X-Gm-Message-State: APjAAAVHh2lv3AMGbS4griCk3xBsDoDN4Lxhcq+cRUXBp9FBtf9YHGW6
 fBaCycfQWMW9WiUPlqvqnMDIsT3DnoRnlH31wmDzQA==
X-Google-Smtp-Source: APXvYqzb9LSbjvyTYyJro6roGfmfcXuB5wD3OhRztdb8g4aem5VqSxWcjf73KgosmX+l6Ndl56jWPa35+BrI2knRZzU=
X-Received: by 2002:a2e:5c46:: with SMTP id q67mr3315497ljb.42.1573665504123; 
 Wed, 13 Nov 2019 09:18:24 -0800 (PST)
MIME-Version: 1.0
References: <20191112141819.GA22076@localhost.localdomain>
 <201911131438.KT6pnFZ7%lkp@intel.com>
 <ac16492e11899ef4ec981f7f2e84714c7d61d2a7.camel@fi.rohmeurope.com>
 <CACRpkdYAmye8wT39fqy=LN+6pXDvrcQ0SyDTCvG7aSgea3Uumw@mail.gmail.com>
 <b67faf875fd0060ad36db04b29c109f01e58ab1a.camel@fi.rohmeurope.com>
In-Reply-To: <b67faf875fd0060ad36db04b29c109f01e58ab1a.camel@fi.rohmeurope.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 13 Nov 2019 18:18:11 +0100
Message-ID: <CACRpkdZy73oFmHcjGuxCCYD0kxWuAi4xp9s+fHVLcGXwPzc5TQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] pinctrl: Use new GPIO_LINE_DIRECTION
To: "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191113_091825_876212_FA96B640 
X-CRM114-Status: UNSURE (   8.43  )
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

On Wed, Nov 13, 2019 at 11:06 AM Vaittinen, Matti
<Matti.Vaittinen@fi.rohmeurope.com> wrote:
> On Wed, 2019-11-13 at 10:40 +0100, Linus Walleij wrote:

> > I think I already merged it, just send a new patch on top fixing the
> > problem.
>
> Hmm. Are you sure you did merge the pincontrol part already?

No I confused it for the GPIO part. Sorry!

Please keep iterarating this patch.

Yours,
Linus Walleij

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
