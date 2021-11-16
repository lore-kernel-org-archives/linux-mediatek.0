Return-Path: <SRS0=fhAu=QD=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21B4BC433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 16 Nov 2021 16:50:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E6BF661A52
	for <linux-mediatek@archiver.kernel.org>; Tue, 16 Nov 2021 16:50:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E6BF661A52
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jk+B9aZjc+eBh/LZ/yiHCG2kHdCiOyk608icmRJkzvM=; b=bOuwaQBtTBZgON
	eV42dzTh/5wD5AvChK9Sx1qrDO+jn+rINhJjrwiJiSjJGRKp43Y3HRcrad03Y5MIjRYAxvsdrtHEi
	wawa/CJFw1SfWZzzao1gdiyJqr9HReqlorutmPhEAucx4WGvazLJUDTF0fSTixrFOLmz/O1jLvYRw
	LsQbST3lKEp+zbnOYWXpA73N5k41J3n26PB6s6i/p0HF/4iE+ZmsNR7dWwmS/Zgp7yruWHmowmLno
	+suDwyCzdki76WfeK7xFe2++7/PHTcI8mCIW9o6mbceIcF5+QDZTA8ZE/sfOrAhtfJPvFQNfA2agJ
	Q0jUCVLoffg498/19rlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mn1fF-002PJ7-Ri; Tue, 16 Nov 2021 16:50:33 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mn1f4-002PGP-3S; Tue, 16 Nov 2021 16:50:23 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8C1EB619BB;
 Tue, 16 Nov 2021 16:50:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1637081421;
 bh=mariJGJLRCU1V8U+1zEQDC5Ctn63ipS/SXz7gKdrEJY=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=URYP1lNgzTC7I0AONpafX2DmXTz/LIpjEjSlEj6zUe6r98sT1Uq5Q8TVH0nR6Y6hj
 PxSYXxaxYEYy3AWKu0e27AcRZdELlwc64BRZsbYfU0f0mItA32Z+aYxKSTvRGua5nW
 +l/16Zc5umP+RVX+1AC7hwjiWfBS0HaACNqSqExEh9pzqStgjAIjD3IabAuGV3gdWz
 7tb/+Mf/6lF2Jxg58V0JxhO7foZJAyPP5/BWvnby69wes1OXhN2mXMaSCtRqtpeLi4
 s21SNqlBuNAXp4EiNRUPxkRvhQYra7FIms6cQQXmhVUN2GCchZ8wtzFd7nzCJLUV+/
 FJecgFbodz2mw==
Received: by mail-ed1-f51.google.com with SMTP id m20so44911666edc.5;
 Tue, 16 Nov 2021 08:50:21 -0800 (PST)
X-Gm-Message-State: AOAM53078ornqsIPpvYnNJr9qYuGqjykvxjsqTcK28ZmKf9VM0RxqRW2
 Kfw0YsyWuhWNinabmLWh1Pp8h2tvHjispAIhqg==
X-Google-Smtp-Source: ABdhPJwpeeor9bitplv96OWutWrM/OLr2WsQy9llndEbBRodAS9WBBUdGUQgDXJ0BT5D5eEOLQjQxhlVbVhuQKqgH9g=
X-Received: by 2002:a17:907:16ac:: with SMTP id
 hc44mr11230766ejc.363.1637081419992; 
 Tue, 16 Nov 2021 08:50:19 -0800 (PST)
MIME-Version: 1.0
References: <20210716081731.80118-1-gene.chen.richtek@gmail.com>
 <20210716081731.80118-3-gene.chen.richtek@gmail.com>
 <20211115140343.GA13493@duo.ucw.cz>
In-Reply-To: <20211115140343.GA13493@duo.ucw.cz>
From: Rob Herring <robh@kernel.org>
Date: Tue, 16 Nov 2021 10:50:08 -0600
X-Gmail-Original-Message-ID: <CAL_JsqJRMVE163LaHTbtFARc4f_qg33bfQx+sD3ukce_xQF+gA@mail.gmail.com>
Message-ID: <CAL_JsqJRMVE163LaHTbtFARc4f_qg33bfQx+sD3ukce_xQF+gA@mail.gmail.com>
Subject: Re: [PATCH v15 2/2] leds: mt6360: Add LED driver for MT6360
To: Pavel Machek <pavel@ucw.cz>, Gene Chen <gene.chen.richtek@gmail.com>
Cc: Jacek Anaszewski <jacek.anaszewski@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, 
 Dan Murphy <dmurphy@ti.com>, Linux LED Subsystem <linux-leds@vger.kernel.org>, 
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Gene Chen <gene_chen@richtek.com>, Wilma.Wu@mediatek.com,
 =?UTF-8?B?c2h1ZmFuX2xlZSjmnY7mm7jluIYp?= <shufan_lee@richtek.com>, 
 =?UTF-8?B?Y3lfaHVhbmco6buD5ZWf5Y6fKQ==?= <cy_huang@richtek.com>, 
 benjamin.chao@mediatek.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211116_085022_206393_BF9186DA 
X-CRM114-Status: GOOD (  10.98  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, Nov 15, 2021 at 8:04 AM Pavel Machek <pavel@ucw.cz> wrote:
>
> On Fri 2021-07-16 16:17:31, Gene Chen wrote:
> > From: Gene Chen <gene_chen@richtek.com>
> >
> > Add MT6360 LED driver include 2-channel Flash LED with torch/strobe mode,
> > 3-channel RGB LED support Register/Flash/Breath Mode, and 1-channel for
> > moonlight LED.
> >
> > Signed-off-by: Gene Chen <gene_chen@richtek.com>
> > Acked-by: Jacek Anaszewski <jacek.anaszewski@gmail.com>
>
> Thanks, applied.

Now linux-next is broken:

Error: Documentation/devicetree/bindings/leds/leds-mt6360.example.dts:114.24-25
syntax error
FATAL ERROR: Unable to parse input tree
make[1]: *** [scripts/Makefile.lib:385:
Documentation/devicetree/bindings/leds/leds-mt6360.example.dt.yaml]
Error 1

I may have reviewed this, but the last 2 versions didn't go to DT list
and no checks ran.

Rob

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
