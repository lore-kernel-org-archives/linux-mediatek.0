Return-Path: <SRS0=SHoq=2V=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DAA0CC2D0C2
	for <linux-mediatek@archiver.kernel.org>; Tue, 31 Dec 2019 14:53:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B13942064B
	for <linux-mediatek@archiver.kernel.org>; Tue, 31 Dec 2019 14:53:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="oAK0eKxf";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="poRD7KZj"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B13942064B
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bSDSfj6PnM1vu1c+JUnUnVI7rJJMFBbJbOUqAZqbkC4=; b=oAK0eKxfZL737y
	0NqBckm4ck/eUB6gzXH0PCThOdEsGirjO50ZcrP70a+aDoRapWt5wIlXlSPTODFOCgGqMgGftObsx
	1tbWgiYkWWMbHoZ/sgItGCuapCcHyhqlstI4HGgx8bP8Uj+2k/Yc6RhpLslmdx3dX4D+pI94jThjq
	PEZoGjZH6zOU6qPTz3o+G78DMi295o9M5K+keaWgdVdkE4dzJ0vI/MgCo1/HZUDKCxj98CkN0SRae
	xsZpOFdE7gIrXj8eMDel1jFgX1UMDQl6LLr0IXCnDXoN/EWNFJXS57kHhITPoOoApqjAmwCes+E50
	o7H6oJ2hRIqeGLK8O+uQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1imItX-0000Py-7V; Tue, 31 Dec 2019 14:53:15 +0000
Received: from mail-ed1-x542.google.com ([2a00:1450:4864:20::542])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1imItL-0000Fb-NE; Tue, 31 Dec 2019 14:53:04 +0000
Received: by mail-ed1-x542.google.com with SMTP id dc19so35398050edb.10;
 Tue, 31 Dec 2019 06:53:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2o20aAqayv6BZ7lYdB775KhwnJD8SsBVJk71b0rde2E=;
 b=poRD7KZjKZr3ORNVyI2Yj3hyY1TSZPoPk95zGZ701aGlD/EuLWIYYGcQNBnu2tZ7En
 xoxgSxs5loO/fAEkWpp678V8OLrQTcgJrUFksGkGuG8BarsWWXMPvtvZE1SfXAOgejml
 SLB+9Fd0k3b41xtxmVe9f/raX5P1W249Yk2AqJ15SARoCzycZA1QzKvuIQ+3j32VCpGz
 iKSAYWHJWSCOuZVvlXBzU8wMmL0ERW8LyW2wYDIQ9WUVbotyuWLM0aScSi3rKSQVm33C
 mvV0Fo4HIPY9SHlLjH+P+IMsRlEgXN4N/aXUFYrOoO0MbtUyKTAwyLZ6UghZzNXybp5c
 gC/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2o20aAqayv6BZ7lYdB775KhwnJD8SsBVJk71b0rde2E=;
 b=a4ixuj7MJOUH7Kwwll9uRdht9P3aF7dk/61FezVtpQQ/0WvyMaD8w56vyvFXRh+JuU
 EBcUl18gK0B4nHenY9bydg+MHGMj9VDUCuvdBrIuk34S+WBKrZLMsPI/KQtEY2BwMEeo
 fw7hhQjwKIzqmy648iKmUsqTzAkhK7Mt8YQQAje5QiuGpG8/IzVJk8L1ALw5Ywts1S60
 ojPSZZwHvpS4LkEDPsCGgU0Uqd2fkqpqh9mfgVyFNL2GxrI3fBJuvxumBusBj3Cy0L7s
 ki1ZkjDKiS/9LBjKVpqm+i844HjwnbpwXnvolwmgsr7DVTxRQ63aMhjE7LQA3oI2Ahnf
 4jQw==
X-Gm-Message-State: APjAAAV833Klb8OqnHzR/mzt3hxt4MlKKYCXC8CysB78WUEGNf/rm/wh
 zTPx6qGdxvPyHZZyKUY/FdOvrn4kkor7h4QsiroKfviU
X-Google-Smtp-Source: APXvYqyRa5i9cLmMHe86c+B4Fx/pd0qP4rUcFH9Tquw1x4/LQC/Oq5YixxDbRdVtRa9R4GKVNAzhEfLEp5Lfo8kVkxk=
X-Received: by 2002:a50:bae1:: with SMTP id x88mr59378035ede.10.1577803980972; 
 Tue, 31 Dec 2019 06:53:00 -0800 (PST)
MIME-Version: 1.0
References: <20191230172113.17222-1-krzk@kernel.org>
 <20191230172113.17222-2-krzk@kernel.org>
In-Reply-To: <20191230172113.17222-2-krzk@kernel.org>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Tue, 31 Dec 2019 15:52:50 +0100
Message-ID: <CAFBinCAeE-mu4+F9vOkp3cMaGjQ7tst0xdd47zSp54wW4ArRug@mail.gmail.com>
Subject: Re: [PATCH 2/2] pwm: Enable compile testing for some of drivers
To: Krzysztof Kozlowski <krzk@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191231_065303_783216_144EC81C 
X-CRM114-Status: UNSURE (   6.93  )
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
Cc: linux-pwm@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
 Thierry Reding <thierry.reding@gmail.com>,
 bcm-kernel-feedback-list@broadcom.com, linux-rpi-kernel@lists.infradead.org,
 =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 linux-tegra@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-riscv@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, Dec 30, 2019 at 6:21 PM Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> Some of the PWM drivers can be compile tested to increase build
> coverage.
>
> The Meson PWM driver requires COMMON_CLK dependency.
>
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
for PWM_MESON:
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

thank you!


Martin

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
