Return-Path: <SRS0=6DyL=5M=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DAD68C43331
	for <linux-mediatek@archiver.kernel.org>; Fri, 27 Mar 2020 19:35:08 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A804D20663
	for <linux-mediatek@archiver.kernel.org>; Fri, 27 Mar 2020 19:35:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="i6rbM4Kf";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IKQVqDOb"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A804D20663
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VKN+3cteauJkG0Urr8+NXk3DcPRDc3qcnTMAXLgITnI=; b=i6rbM4Kf7HTlGK
	YZaxJ5xfx7vR+5YeHwRu7DEXtBihKKz3CiIVa/7IA+rFN7PO6GMySvwCacw03YGi386X2XuYLW36f
	gOouyYaYfM7YSrEc/3XF0V7wBXooPdNo3OJFVwqq0iMUVaE2HQVu2ux0z4CGIRN+zcmkjAJKTgjUY
	kBG9mBl0FwPnfbP9SMdVHDK4hNS5k4jmtmzMYgLOsWKcQGz1gL07IOPHSwGgtpvJ/UTqu0ra7DyN3
	gtMyaQG5YFwjeMeZIS1Ksu+BeDl8W+D7WtM+1ZYLOISN9YmlFof80P7nlRjPJGzfLViTu4eMgBA3+
	maDbXHNielVTnre7yp9w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jHukt-0007V4-EW; Fri, 27 Mar 2020 19:34:59 +0000
Received: from mail-lj1-x244.google.com ([2a00:1450:4864:20::244])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jHukp-0007UM-VV
 for linux-mediatek@lists.infradead.org; Fri, 27 Mar 2020 19:34:58 +0000
Received: by mail-lj1-x244.google.com with SMTP id k21so11465249ljh.2
 for <linux-mediatek@lists.infradead.org>; Fri, 27 Mar 2020 12:34:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=SMj8T6qrJVrCsvRvnMqHKkx/zEjw5/o3jySet/s/9RY=;
 b=IKQVqDObYWwt6diGnBoZbSN0g1fZpjZsX+tPBQ7n+JUB6ZtMHDV/yAp5S520sz1hQu
 RWPJ4RCCadtZEJxqMlJlrUrFt6OMRkJ64s7SINwxGHV/YaVZkem+8WaGfCBe2rAGAr0A
 FRDGvKLcrO8YUegjSzNsZaA2O2d4C1gmE1V9Q/u136ROtCUodXyukRcOE7faj1tt5ZHM
 vTdR1DdMBTrfzcbFt2w8N67m1wGB9AM6IqgX0/tgjthV/k5J6Gz5SIKRAgpiXFL7aw1Y
 6fmhMAiJ65vF3LDJSIqgaXXKh84O5vwCAh7DtSazxoHKK0196Q0fxLoTrCgsNsH170BY
 z7fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=SMj8T6qrJVrCsvRvnMqHKkx/zEjw5/o3jySet/s/9RY=;
 b=ha1AlFg5IZOmO7sm/YAVj7dn3VtL7MDss+xTtQYspzQkkT1BEB/KPIPk+dRCPm1bpt
 OMHRk1XeehdDNsS3F3tzs6MnqSthHelcAh9Cmv44fCNT1JnVNAdzpSIjUT8Wj4vMiNHZ
 7qHkVkA73mCAQuNpPwNxXrfT12w8RitcWlKRAwhU3ISpSAL8e6pBAgfMdJ8IVcZej5Q3
 VkDB/efT1wqMICturaOzcStQ9/9YoB6rrzeIkQMnV9Uh3y3K6ufuGHUb7fBHdpS0pEEx
 nWHN0z5bqk1tv0IvLNoBIxgNvZ4mKcqE5VcYoRL2tj12JiWZihgq0Hjl7p9dVmT1DGFF
 wovA==
X-Gm-Message-State: AGi0PubOO7J9/qh8AgbjwinxgvaEYk4Kn5xPYnOYsX9qY6lSczNmp4g3
 cHS7BaOi9N1EJxDXI0EDn2xq43L08xoDmPQ8osaU/w==
X-Google-Smtp-Source: APiQypKQ99E5Hx71aoAtOmel0/W4RsYE6iKctEclwRXPuUqbHFZcrTSAUoDASIRznidz45mNGspx3gCRhXSIB8CeVGg=
X-Received: by 2002:a05:651c:445:: with SMTP id
 g5mr294507ljg.125.1585337693948; 
 Fri, 27 Mar 2020 12:34:53 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1584977512.git.matti.vaittinen@fi.rohmeurope.com>
 <c659a4627bc33b8a7d10e1af16e85edd0ff8637f.1584977512.git.matti.vaittinen@fi.rohmeurope.com>
In-Reply-To: <c659a4627bc33b8a7d10e1af16e85edd0ff8637f.1584977512.git.matti.vaittinen@fi.rohmeurope.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 27 Mar 2020 20:34:42 +0100
Message-ID: <CACRpkdYSEVycRn-8br-o8F9nKYvTa9dgSS5uuubEFsiKMCfR=w@mail.gmail.com>
Subject: Re: [PATCH v6 03/10] lib: add linear ranges helpers
To: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200327_123456_158424_6BC5B616 
X-CRM114-Status: GOOD (  15.07  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, Milo Kim <milo.kim@ti.com>,
 Andrei Stefanescu <andrei.stefanescu@microchip.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Tony Lindgren <tony@atomide.com>,
 Linux-OMAP <linux-omap@vger.kernel.org>,
 Brendan Higgins <brendanhiggins@google.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, mikko.mutanen@fi.rohmeurope.com,
 Vincenzo Frascino <vincenzo.frascino@arm.com>,
 Dan Williams <dan.j.williams@intel.com>,
 linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Herbert Xu <herbert@gondor.apana.org.au>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Chen-Yu Tsai <wens@csie.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Ard Biesheuvel <ardb@kernel.org>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Andy Shevchenko <andy.shevchenko@gmail.com>, Andy Gross <agross@kernel.org>,
 markus.laine@fi.rohmeurope.com, MSM <linux-arm-msm@vger.kernel.org>,
 Borislav Petkov <bp@suse.de>, Petr Mladek <pmladek@suse.com>,
 Mikhail Zaslonko <zaslonko@linux.ibm.com>,
 Charles Keepax <ckeepax@opensource.cirrus.com>, Arnd Bergmann <arnd@arndb.de>,
 Matti Vaittinen <mazziesaccount@gmail.com>, Gary Hook <Gary.Hook@amd.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>, Mark Brown <broonie@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 David Gow <davidgow@google.com>, Shuah Khan <skhan@linuxfoundation.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Support Opensource <support.opensource@diasemi.com>,
 Sangbeom Kim <sbkim73@samsung.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Linux PM list <linux-pm@vger.kernel.org>, Randy Dunlap <rdunlap@infradead.org>,
 Sebastian Reichel <sre@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Tal Gilboa <talgi@mellanox.com>, Changbin Du <changbin.du@intel.com>,
 Rob Herring <robh+dt@kernel.org>,
 =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <uwe@kleine-koenig.org>,
 Masami Hiramatsu <mhiramat@kernel.org>, patches@opensource.cirrus.com,
 Andrew Morton <akpm@linux-foundation.org>, Vladimir Oltean <olteanv@gmail.com>,
 "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, Mar 24, 2020 at 9:29 AM Matti Vaittinen
<matti.vaittinen@fi.rohmeurope.com> wrote:

> Many devices have control registers which control some measurable
> property. Often a register contains control field so that change in
> this field causes linear change in the controlled property. It is not
> a rare case that user wants to give 'meaningful' control values and
> driver needs to convert them to register field values. Even more
> often user wants to 'see' the currently set value - again in
> meaningful units - and driver needs to convert the values it reads
> from register to these meaningful units. Examples of this include:
>
> - regulators, voltage/current configurations
> - power, voltage/current configurations
> - clk(?) NCOs
>
> and maybe others I can't think of right now.
>
> Provide a linear_range helper which can do conversion from user value
> to register value 'selector'.
>
> The idea here is stolen from regulator framework and patches refactoring
> the regulator helpers to use this are following.
>
> Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>

This looks really helpful and just generally like the kind of stuff
we should absolutely have in lib/

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

One day we'll add interpolated a.k.a. non-linear ranges
too, I bet.

Yours,
Linus Walleij

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
