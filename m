Return-Path: <SRS0=/Mgn=GV=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C069C433E0
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 Jan 2021 14:55:56 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5563E22C7E
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 Jan 2021 14:55:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5563E22C7E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=45kPaNd9dUpri1HBMdhbyD5LXBW4rzfJPWsRGOCIl4s=; b=ZkKhWE2eFX/Sq9LD3tHWb8FmJ
	clCytkPxjY9F/S22XcDFaUyA8/X7G+3xy3yyRlY8kuFunPRhP0ebBlhyaI23p+je1XCkHW53SCLwU
	vhFu+j3ML7HQh2tT2CGOe0ICnMkcQtpySeCjVvI7QBG40xMaefo4+WI159I50B9T1WGVfA4dwiUMY
	87vfRJ/sAFQwZYKHQqvnJGYeKnvNwayVu3tkbGcKZxjAsrk9Y4fRfBNGK8ubEHNB7USUJ2544Vvrp
	zmDl1RGHLqLR87cJck7qPjXnV53NthrGaV4kDBEsca4UZv1fb4tlActDR9psLSInnVWV1S5lxIXEd
	cMGoK1U9A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l1Vwa-00012U-5N; Mon, 18 Jan 2021 14:55:48 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l1VwX-00011E-3X
 for linux-mediatek@lists.infradead.org; Mon, 18 Jan 2021 14:55:46 +0000
Received: by mail-ed1-x535.google.com with SMTP id f1so3785551edr.12
 for <linux-mediatek@lists.infradead.org>; Mon, 18 Jan 2021 06:55:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=09OWnlfXjcogYNVXeufU+daH3KK6SF0uozk3EDI2xc0=;
 b=Ev4ise7mk+YfkUErtOqsnwcDFyrMpCScNp5Psyu6jm+IHZGb5AwxdoGBoXxuFX61mn
 v2wNMdPzRA6DGQ8J8z4yP8QZBUdxpmSc05ndX3QWTS6XRi52tsQwLDjoAaMSXQn7zPLo
 PsvzPQv221Crp/lfaRs//J6sa5jk4TF72mUxit1qwocnPg4B8nnuhf0d4TM0t7cDiQ0F
 JcXBLfrE+G/mFv1ucW2UAxMuvZZbQWbewZ2DpHcPPDqqkxwgBbCEy2W4Wk+jD/4X+8xJ
 ficH1ht6iUzOuUBsJ5itApxU1eCDRDbauNKd7+kNvcME5dJbo+1Odl9v0dDFzTN1mZy/
 RBeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=09OWnlfXjcogYNVXeufU+daH3KK6SF0uozk3EDI2xc0=;
 b=RNh3ZMG6IJJ0uMllz2pVaCDfnZNZsK8rAgDnI7zUrHsC6yzuwFKRw+YznPSsLVPXXw
 8rRH0H2aeF8SLvtgX9vgfLHpbiZR6EH0rP52lElNedL/9vGkgFvfxGE1qdWXaZuiQlnK
 6Tp2SwxSZ1MeVbxjojMc4JPZUOrS5gCEqMy9PmqF4LSUae7bgUgyYzakVLDM/wSOJjTO
 yAnKrvVoSVJfghPVnH7+8hlm+Jxb26FovcKjv0JR20U9x3qPrMgNHme7QGC/fzs1uUzm
 8OC9tbPhc6wmeyitzBfavP8Son3IfxTp2N4MX4xqFrOPpb81QjskVW+mAb78Xevu81m0
 /JSA==
X-Gm-Message-State: AOAM53351k6Zxw/iZgyjKpZ+CZvL54z/m7AmyXz/hB2jNLP1ktZwFVim
 6EEYe527xW74pBRo9S6KLb9HZ0eTexEfzUcD4uJT0w==
X-Google-Smtp-Source: ABdhPJy+a9+KdfIbj4llUoSCWn/X0q20L19eACDpfVzZgzCAWDztQO7cPFmXXFG84iqiR4H9I/Tc4icao+FF/ozbz+k=
X-Received: by 2002:a50:d6dc:: with SMTP id l28mr19968203edj.105.1610981741946; 
 Mon, 18 Jan 2021 06:55:41 -0800 (PST)
MIME-Version: 1.0
References: <20210111054428.3273-1-dqfext@gmail.com>
 <20210111054428.3273-3-dqfext@gmail.com>
In-Reply-To: <20210111054428.3273-3-dqfext@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 18 Jan 2021 15:55:30 +0100
Message-ID: <CACRpkdYA2fWF_1K+2aYoZnBAsm9H3=VHpeT4ZDU5sCdrOUWx=w@mail.gmail.com>
Subject: Re: [PATCH net-next 2/2] drivers: net: dsa: mt7530: MT7530 optional
 GPIO support
To: DENG Qingfang <dqfext@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210118_095545_165830_6EECA2A8 
X-CRM114-Status: GOOD (  13.24  )
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

On Mon, Jan 11, 2021 at 6:46 AM DENG Qingfang <dqfext@gmail.com> wrote:

> MT7530's LED controller can drive up to 15 LED/GPIOs.
>
> Add support for GPIO control and allow users to use its GPIOs by
> setting gpio-controller property in device tree.
>
> Signed-off-by: DENG Qingfang <dqfext@gmail.com>

Double-check the initial output conditions as indicated by
Russell, if you really want to be thorough, use an oscilloscope
but check the specs at least.

> +static u32
> +mt7530_gpio_to_bit(unsigned int offset)
> +{
> +       return BIT(offset + offset / 3);
> +}

So for offset 0..14 this becomes bits
0, 1, 2, 4, 5, 6, 8, 9, 10, 12  ... 18

What is the logic in this and is it what you intend?
Please add a comment explaining what the offset is supposed
to become for offsets 0..14 and why.

> +       gc->ngpio = 15;

And it really IS 15 not 16? Not that I know network equipment
very well...

Yours,
Linus Walleij

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
