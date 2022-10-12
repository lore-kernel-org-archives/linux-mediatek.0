Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45397C433FE
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 Oct 2022 15:31:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:References:In-Reply-To:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jgmSGKWiIJIpmvQ8q/p+qHWdSAvJyDT4YhTIosvbO2U=; b=z7XKS1kwIKWcfdVNDuowq5maI8
	QLPmVj8sLCOIgJSSIsJNeXcCXMamQ90jp0G8WV3urxIIlACQseBOQcEfH4qj8LYJqFj43yR05vVe5
	dSr6Vx4z0GDx3+/zJIYCSo9pIBkk1Dwtg6hi3UKyVIT+Mj5QzuR4hyH4wVNbcU0ZufSezUv4wIRLn
	o+oGhxWRtdFPaGvwvqA95Y0EzkpyeghMBuRPzAB1o1jWjN8kaqnm22hIb8WCI/4XUEKWglqTsvLYL
	H+QXK3BFT0zyV/w0IyN4fOiGYsdhwdbZDgG3X4iUdcpWQkh0giGotuqlHmJYONSXyGhC7q7KFwvRg
	75rx/WbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oidh6-008YPL-2e; Wed, 12 Oct 2022 15:30:52 +0000
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oidh3-008YOr-Ns; Wed, 12 Oct 2022 15:30:50 +0000
Received: by mail-pg1-x529.google.com with SMTP id l6so6286183pgu.7;
        Wed, 12 Oct 2022 08:30:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=jgmSGKWiIJIpmvQ8q/p+qHWdSAvJyDT4YhTIosvbO2U=;
        b=lqsttROg2cCrxJ2Bl9FcBPLiU2PO77JZxmRbQppEIbCw40JE4Hma4eaNUJqJWvDFef
         biMxcw/yw2mQRgVWJmG6KxiT2VHCyW9lGM1aIbvpGRRiM3VXkE9a5WiIHcmKBmLoGt9c
         JFofXzrbgVTrOf5WuGZ8hR1Ns6Il9XhkEpqojHHVfFroxh+wWOyfQKTW/c7y4cLQrqM5
         h4he8xr48itJH2jTAcB9z1IVynBEV43U81JlyfbC5L6DD+xMq8LSKYu8SlhqlbM4CD9c
         cbSs1zJ+tP/qPabTWWo8xNUYYI3rh5zzNwOmqGNxXx47PNMZlV6EBm65mtCMXxEDSAU+
         kCyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jgmSGKWiIJIpmvQ8q/p+qHWdSAvJyDT4YhTIosvbO2U=;
        b=l4CYDe2kxkmbmhxOAFOojcS7tDhPNxrfIViyi7qWJ4slHvlL9sAkONZfGmSanzB2W4
         FR3QnmqO1rZs2n0iIdbVmzaGTNjLuF6axmYkq9LC9wBXxOmDJJX8BN2nCDGLjyxICqRG
         XEf5brP4+hJVRKfrKlehH9Rr3T0YdoGx8YBYwwOXg5u1cws5XEp/K88KPvqdKGk2qhNq
         77bYr44QV0lIjY8vUx6iIUX/V6p4VuWAA34vPyv7hDZkz+tWT4/yLAD6d9FQlJZJiSbr
         oz/t9L1ZhF7R04eV4gFI1l4rQn+DASMhKT5eyNyOWWeBZpmBbI7UKpsQ5mJKt5vI9hSV
         QVPg==
X-Gm-Message-State: ACrzQf3yDZApTNuaD8IEWd4coTtmytdPaursmEepAYuf5icrAFGlkbHe
	kOKHuBrol8zKqevoJGk8jCft9TupKi4=
X-Google-Smtp-Source: AMsMyM4Rme9GP63iTEYp6GDtI8cANT8/bRXLd6LmA4Ak4TfcpODAEz3uYTWmpmRdtSuWInqPN4hvmQ==
X-Received: by 2002:a63:2c6:0:b0:43c:1f18:a475 with SMTP id 189-20020a6302c6000000b0043c1f18a475mr25922948pgc.186.1665588648509;
        Wed, 12 Oct 2022 08:30:48 -0700 (PDT)
Received: from ?IPv6:::1? ([2607:fb90:370a:3fc:ad3:2951:4f00:9866])
        by smtp.gmail.com with ESMTPSA id a67-20020a621a46000000b0055f98a2c64bsm11804430pfa.142.2022.10.12.08.30.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Oct 2022 08:30:47 -0700 (PDT)
Date: Wed, 12 Oct 2022 08:30:45 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
CC: Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>,
 Daniel Thompson <daniel.thompson@linaro.org>, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-gpio@vger.kernel.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_6/7=5D_gpiolib=3A_of=3A_factor_o?= =?US-ASCII?Q?ut_code_overriding_gpio_line_polarity?=
User-Agent: K-9 Mail for Android
In-Reply-To: <Y0agrWGm5CR3Rk5e@smile.fi.intel.com>
References: <20221011-gpiolib-quirks-v1-0-e01d9d3e7b29@gmail.com> <20221011-gpiolib-quirks-v1-6-e01d9d3e7b29@gmail.com> <Y0agrWGm5CR3Rk5e@smile.fi.intel.com>
Message-ID: <6D279EC4-6124-45C2-BCBB-D6CBB3385024@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221012_083049_796584_23073669 
X-CRM114-Status: GOOD (  12.26  )
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

On October 12, 2022 4:10:37 AM PDT, Andy Shevchenko <andriy=2Eshevchenko@li=
nux=2Eintel=2Ecom> wrote:
>On Tue, Oct 11, 2022 at 03:19:34PM -0700, Dmitry Torokhov wrote:
>> There are several instances where we use a separate property to
>> override polarity specified in gpio property=2E Factor it out into
>> a separate function=2E
>
>=2E=2E=2E
>
>>  static void of_gpio_flags_quirks(const struct device_node *np,
>>  				 const char *propname,
>>  				 enum of_gpio_flags *flags,
>> @@ -145,7 +167,7 @@ static void of_gpio_flags_quirks(const struct devic=
e_node *np,
>>  	     (!(strcmp(propname, "enable-gpio") &&
>>  		strcmp(propname, "enable-gpios")) &&
>>  	      of_device_is_compatible(np, "regulator-gpio")))) {
>> -		bool active_low =3D !of_property_read_bool(np,
>> +		bool active_high =3D of_property_read_bool(np,
>
>Defining
>
>	bool active_high;
>
>at the top of the function will save you a few ugly indented code lines h=
ere
>and in the next patch=2E
>

Indeed, but I think the idea was to keep the quirks as independent as poss=
ible=2E
I guess I could split it further into separate functions, like the other q=
uirk handling=2E=20

Bartosz, Linus, any preference here?=20

Thanks=2E=20

--=20
Dmitry

