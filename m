Return-Path: <SRS0=y96F=G4=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13E15C433E0
	for <linux-mediatek@archiver.kernel.org>; Mon, 25 Jan 2021 16:05:51 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C408A221EB
	for <linux-mediatek@archiver.kernel.org>; Mon, 25 Jan 2021 16:05:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C408A221EB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=3K77V0FlRv082iLIJ1dhv83+/nu4K4AKL0/Oa8sie0M=; b=gArtb8FZPejjd2e1hj5CR5IiH
	nL1XrWGUXKV2CQiKwQlcBNfGLhWkY+hsQ/C5tDuWmZZIhEYBD+QxJ/SViNLmo16+m3sVBWRWxyQ/T
	P9CmrPXHgPp5mKOpPU8LxIuGin2+JG/GZCy9rcOaC9IUS6nRgBTAiEibfmgz5RPpIoRXLvZRkH5yW
	tf/FWl0Ky72HtrhidSGLw6ST6Y1ZQFkQwVWD6q6QoTmXxGFGpfli9DXU4Lz1NhxGj81W2RX1AOUtY
	tjLQa/b7Y4nfoyBcR7Ft9RNXvLg1PrT0bSkzg+9LrJ45E42hKCN7adgTDiH8aSSsXD51RJZQ39iHJ
	CTK+rNp6w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l44Mu-0008Iu-Rn; Mon, 25 Jan 2021 16:05:32 +0000
Received: from mail-io1-xd2d.google.com ([2607:f8b0:4864:20::d2d])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l44Ms-0008IL-Am; Mon, 25 Jan 2021 16:05:31 +0000
Received: by mail-io1-xd2d.google.com with SMTP id u17so27595256iow.1;
 Mon, 25 Jan 2021 08:05:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=PKFdQJWox9aZ4PvErLOeFCl9Ca17gHD16VMhp7rOwKE=;
 b=eaWu6IaaAS1LwErvpIhsdIx/0+R9KO4T4Cx31RtpY0Yy3VtFfQ/6s00liOzOGJTwOk
 ZmfNaObMhPCkgFrcxhBQJnozdAfvcDmxBzvZpE4zdNvPQ4lRaGS89XnjAmxrkFp69Bx0
 ZhKsFzCWUwL8RlnSFwESG7dcN2SVziZE/ZDMrFjqu6fCrek5hBSwfzliRQOF29rrJj1Y
 /H8kpeQBkaAi7BpgDuyjRy9y3T87hjGVfICWv/JGyc6P5cI71vwe6zMT9fnpI0WcA+cJ
 JEKSaiNigmSFbpi7TXcrPkiH/nllazHNWPOKEltDzXfEpY0cDwi53GbmCISUT+gtjIXj
 XWBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PKFdQJWox9aZ4PvErLOeFCl9Ca17gHD16VMhp7rOwKE=;
 b=SoIy8vmsGY2dWVopyq/ztgJ85remFepeX1N3hEDEmtYeNX9JkJExOqeTt30+4Grynj
 fjqWXFFizhUNlsAICxtsP5ZyocfmYUq9bzc73oT7NtujGsSTOcwbpgTH0T62CYwNzy7K
 hrMjwhhkyyqoGffgCiwCgUZTvdv3Y46VfYSMytTW+g2b6A4b2bQyLG4MISMA+g55wcXc
 +CpPvVDzD0/ujYf3rN8d4zQw9U3X0ffPZilN7LiQI/BUMJ+f3JGs0MRWJCOWSEqkTuPF
 zP6nc702Num9ghc42MPNvJjQHrPx/CabVz5VEbGhyYzxzDgbUqGEi/0+7KJLppjkG/pm
 jFlw==
X-Gm-Message-State: AOAM5334RHPLFLHnceCyThHYJw2oyHfwT5veAKst6B9qM389Htf5CPks
 fJnFA+P4vHDTuJ8zhp/T9brgLZfKdhA2pxa7hyY=
X-Google-Smtp-Source: ABdhPJya+WW0x+mSKy2+g1N2ELbfh9H+kwJYEORd7Sqf4JqMZg5irYw5+OZ2UJ4CA9yR84lFPe0qiYvozCA2otGsDVc=
X-Received: by 2002:a05:6e02:dea:: with SMTP id
 m10mr950392ilj.241.1611590728327; 
 Mon, 25 Jan 2021 08:05:28 -0800 (PST)
MIME-Version: 1.0
References: <20210125044322.6280-1-dqfext@gmail.com>
 <20210125044322.6280-2-dqfext@gmail.com>
 <20210125155233.GA438031@robh.at.kernel.org>
In-Reply-To: <20210125155233.GA438031@robh.at.kernel.org>
From: DENG Qingfang <dqfext@gmail.com>
Date: Tue, 26 Jan 2021 00:05:17 +0800
Message-ID: <CALW65jb0W3R1fEDM8hGPR8kHFAg9KXpXkdmDJqxiTaVZ4vP+ig@mail.gmail.com>
Subject: Re: [PATCH net-next v2 1/2] dt-bindings: net: dsa: add MT7530 GPIO
 controller binding
To: Rob Herring <robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210125_110530_400809_5248A8E6 
X-CRM114-Status: GOOD (  11.06  )
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
Cc: Andrew Lunn <andrew@lunn.ch>, Linus Walleij <linus.walleij@linaro.org>,
 =?UTF-8?Q?Ren=C3=A9_van_Dorst?= <opensource@vdorst.com>,
 Florian Fainelli <f.fainelli@gmail.com>, Russell King <linux@armlinux.org.uk>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Jakub Kicinski <kuba@kernel.org>, Vivien Didelot <vivien.didelot@gmail.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Landen Chao <Landen.Chao@mediatek.com>,
 Frank Wunderlich <frank-w@public-files.de>, Sean Wang <sean.wang@mediatek.com>,
 linux-gpio@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 netdev <netdev@vger.kernel.org>, linux-kernel@vger.kernel.org,
 Philipp Zabel <p.zabel@pengutronix.de>, Vladimir Oltean <olteanv@gmail.com>,
 "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, Jan 25, 2021 at 11:52 PM Rob Herring <robh@kernel.org> wrote:
>
> Please add Acked-by/Reviewed-by tags when posting new versions. However,
> there's no need to repost patches *only* to add the tags. The upstream
> maintainer will do that for acks received on the version they apply.

Sorry. Will do that next time.

>
> If a tag was not added on purpose, please state why and what changed.
>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
