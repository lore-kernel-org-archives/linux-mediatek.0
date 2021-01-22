Return-Path: <SRS0=vrrm=GZ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7A93C433E0
	for <linux-mediatek@archiver.kernel.org>; Fri, 22 Jan 2021 10:07:01 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4F3F022202
	for <linux-mediatek@archiver.kernel.org>; Fri, 22 Jan 2021 10:07:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4F3F022202
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=P/TmnVai5DXZSvsPjywQ+d3X/AA27gAn3yy87GgZPS4=; b=lqTvxcozqc/zbQyUFsxDU+1UB
	7SCP2t56K8LOxjPTwpKyYaxd+QYwnkYr0qNuyoyR9Gh2KM0nlSKwJajOGlPP8Xm8I+9d6+mvRoczM
	erGnELShs5Pk5LVgeViBGcfC8XOfvCaUY46g8vbEmPec8LWfzuVn+4CmfxqrXqdA8DQtX4gJOJgtf
	7QW9ScxlBlRdKkrcV8VEBCLiA1Cm4HkO8atPOLxUiVNYwOVyd2Bc+nEwzM6096MQ3Flf/0Spw92Xf
	MiayvTcDxpJ8xWrPBuL9kPNNgthoh2FxaS8wi6/xqeOD3nZRDBbgOMKZp4joAJJhNzXDqDKtv4g7G
	UNrUoPUTA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l2tL7-0001B2-69; Fri, 22 Jan 2021 10:06:49 +0000
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l2tL3-00019H-8X
 for linux-mediatek@lists.infradead.org; Fri, 22 Jan 2021 10:06:46 +0000
Received: by mail-lf1-x129.google.com with SMTP id q12so6714163lfo.12
 for <linux-mediatek@lists.infradead.org>; Fri, 22 Jan 2021 02:06:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=53LZGt+p3UglMmJ8LC7owG+jDtMJhUwB3mc3c22vo3w=;
 b=yh/tASQseJelhwA8jiNe7G+W3KDRWW1njEvuW/XSR6hWhLACFO+3sS7ZPZgJ9aST0v
 oFk/pn/i82nx2thugENYmvvL3JfDvOlhHldDiLx+runOC2sJlqzLL9M6NpJvY6PV1pcG
 OgpdD/gayiEOFeOg1e6OJxfd/6GJOOgFxOr68V7TeyWGKerpb/HV/1qyQ9LYPNLPv1+z
 hlWzdt0d0bo4bmizD9krbFveuKWYj0dlkBhxBoucYfvdsWW8jV/8zj/FYyUbfLRBhpJ6
 NgC3ooDGAJiOCtisAeBgSmc0XoZ4oEoOF+SVNjhNdQJd6dAEWnj817BaPGSwMmQ2JGR9
 OYbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=53LZGt+p3UglMmJ8LC7owG+jDtMJhUwB3mc3c22vo3w=;
 b=H0Nc9ZCO9brV8yUmSxYkaYAyKaQYHjYUSzHY5rc3vyr7qqfJf2dHYEBvhea7nZBAbc
 IIb8h1F5hCCP4FSCuYFLwjqK1afz4ppy4espyHlE2z+J4cMo5932T9JWzPzEB5d2y+CP
 rrHGtnVWJUYzbBxlJwZRaUVOrFbWB6nSfNJH84MqKJ3wRWVEM3swCyF5EcQTKH56NOpQ
 xJbrycRZ3g9K1LffR/uiVhHODtLPww0GVwhdiXjJHuZ2DPPpR5BB7HPHWY9WBZE6BCpo
 G1Jr3n9huiMQr74PsQMbN3OySBqxEY/NfedZtss5q3SblrbuHzgfLsZ9JkIhgm/gXn+c
 nBZQ==
X-Gm-Message-State: AOAM533bbenYFGU4MGHvWvihIjcOcPofWNFi6uTVbp9VR9d+HUcxHvG8
 hwSAxMSfNyZ+nqWvfvMBUVA9cia+QgLIdJasVBI7dw==
X-Google-Smtp-Source: ABdhPJyoTle4qxXu3NBqEJlHwN6jTzoBM52s7nfkB0Kj/1T93Ni/LPtdYQD6ZORaUqNYGsjXZQISQSEyffbqb3DhuEk=
X-Received: by 2002:ac2:5c45:: with SMTP id s5mr32690lfp.586.1611310001970;
 Fri, 22 Jan 2021 02:06:41 -0800 (PST)
MIME-Version: 1.0
References: <20210111054428.3273-1-dqfext@gmail.com>
 <20210111054428.3273-3-dqfext@gmail.com>
 <CACRpkdYA2fWF_1K+2aYoZnBAsm9H3=VHpeT4ZDU5sCdrOUWx=w@mail.gmail.com>
 <CALW65jbJ2DFqLw-i91y7oRfRhcukHSAS3A0XMuy4kA+1AtLtLQ@mail.gmail.com>
In-Reply-To: <CALW65jbJ2DFqLw-i91y7oRfRhcukHSAS3A0XMuy4kA+1AtLtLQ@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 22 Jan 2021 11:06:30 +0100
Message-ID: <CACRpkdZguQkTNtdeELHQ9HPzqrBFdO3NhbxHrQErcefjb-WpHQ@mail.gmail.com>
Subject: Re: [PATCH net-next 2/2] drivers: net: dsa: mt7530: MT7530 optional
 GPIO support
To: DENG Qingfang <dqfext@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210122_050645_328251_F70576EA 
X-CRM114-Status: GOOD (  11.82  )
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
Cc: Andrew Lunn <andrew@lunn.ch>, Landen Chao <Landen.Chao@mediatek.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, netdev <netdev@vger.kernel.org>,
 Sean Wang <sean.wang@mediatek.com>, Russell King <linux@armlinux.org.uk>,
 "David S. Miller" <davem@davemloft.net>,
 Frank Wunderlich <frank-w@public-files.de>,
 =?UTF-8?Q?Ren=C3=A9_van_Dorst?= <opensource@vdorst.com>,
 Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Vladimir Oltean <olteanv@gmail.com>, Vivien Didelot <vivien.didelot@gmail.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, Jan 19, 2021 at 4:20 AM DENG Qingfang <dqfext@gmail.com> wrote:
> On Mon, Jan 18, 2021 at 10:55 PM Linus Walleij <linus.walleij@linaro.org> wrote:
> >
> > So for offset 0..14 this becomes bits
> > 0, 1, 2, 4, 5, 6, 8, 9, 10, 12  ... 18
> >
> > What is the logic in this and is it what you intend?
>
> Yes. Bit 0..2 are phy 0's LED 0..2, bit 4..6 are phy 1's LED 0..2, etc.

OK add a comment and explain how the bits relate
to each PHY and how the lines are arranged per-phy
so it is crystal clear for people reading the driver.

Thanks!
Linus Walleij

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
