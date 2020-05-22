Return-Path: <SRS0=9rwW=7E=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D594C433DF
	for <linux-mediatek@archiver.kernel.org>; Fri, 22 May 2020 08:54:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 14860206DD
	for <linux-mediatek@archiver.kernel.org>; Fri, 22 May 2020 08:54:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Vn1tvEtN";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qjnD8pyz"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 14860206DD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Rc7mbMQ1VFU4DsWogudXGJY9TDYa7ISPsyXtCEt9tSU=; b=Vn1tvEtNlaOVGu
	5nkFW96CV35h+zzXBN7V2iIC8StJl4chsgvH/y/FYtk2WCNtDJWaQZZ6xeBX8USjS1XaXg5fTE86f
	t5zYbrkSCV1ngjfPRXGwLCbXJrw9b/os6WtJaD5s5ffAFb+4AZPE0fJ+4sFe4b0TncfyFxGNNo6pK
	74T0bL6fVSY/SGvgF8WtOY/xeJ2igVsCDapOcm+gpoHxSg9OnR+hsbdGL10OBaj+4VxUL/88wZqDx
	306mUZWcegkFm2ujVvVJ9yiEt6LCXOzInABPGvns82TROFtmwxAqqz/1yHuIS2UHz7A5oMrWt10Qn
	iD/deFwrL6yA2GJRVY2A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jc3RV-00004y-9r; Fri, 22 May 2020 08:54:13 +0000
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jc3RQ-0008VO-Gy; Fri, 22 May 2020 08:54:09 +0000
Received: by mail-pl1-x643.google.com with SMTP id q16so4149931plr.2;
 Fri, 22 May 2020 01:54:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=KrT1SoD15NLfQ8qq9A2L0z3L7OIW2vz0cfwoycZIaSk=;
 b=qjnD8pyzQ9vLSGK+9aXm4h6rt56i4s0ANzW6Vh27qbaJB1MZkwcLIaZitcpOn1XAoT
 O5wzjfLRVQ7eurTzJi/uB64raupxzP+oBMlxnXbiuP4QdlKuhKrnMtylQPMWFigxEvlm
 LIfHwh5uL2pKKcXGUNAkVxR4dxtZDEZIyZ/6H44opVpDR8rrrlBwOJzLs8iNe7g5J0TH
 gg5A5VFwSm+7CGU15o78QgWK5okcvbRKe+6UGIg2/kMi4vEmUS82SVeB3naQ8jmRcvrC
 iIMmvVtr33HdqpOuPv0o4OOS54U1vu4PL+jfQ/ftMRFRFoN9075NHtRNKC0mhg+jIsG4
 r7og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KrT1SoD15NLfQ8qq9A2L0z3L7OIW2vz0cfwoycZIaSk=;
 b=T80/jw2yJ5tlEj20G3zbmaGlb5cKPRtYmiYZUcMrFoznZ1g4gr8KEOYJnlckr779QC
 +r/zL55zMpJbQHNno9EqNBfr3QGSpXn0ooyNdZI2Kr44mFX5uGQ9phx3i23IWnPMcIcn
 hjRhZGEQKcR5rxlpV7yVPdzjVuea5Fu2K2MEEzpLkfYk4mlryjIqS+vQeyRiusGVPWk0
 HvyTEyDCXCOzitTsxQ5JalPT8eAtDwffyIY6vkQEkIjNzfGR297cbGrG9x3B1ePjhaEd
 J2pwb4WLxLZC23Xqs2o/qSyitx2K7HIjrV367pWZDtkeJikgUDUpxB1P9Yil3tKuVNO9
 tl7Q==
X-Gm-Message-State: AOAM5318IRISl9WKnBQcaCTpm7IEbQz1dlVqWcyQNKNX1qpiIuuyVu6P
 2WMrS0wGGYxsiyrACr0JFHOyXqVIHVc+PQqGhE8=
X-Google-Smtp-Source: ABdhPJySNKcXXQ4O+svlbz8UMlrw8yXexA5v6PdsFEo3QaiPpyqed+BtGvQDsL+oQ2C+xIYCZ8vw55AsPQiGlSKaAfE=
X-Received: by 2002:a17:90b:3651:: with SMTP id
 nh17mr3325673pjb.228.1590137647307; 
 Fri, 22 May 2020 01:54:07 -0700 (PDT)
MIME-Version: 1.0
References: <20200522082208.383631-1-alexandru.ardelean@analog.com>
 <20200522082208.383631-5-alexandru.ardelean@analog.com>
In-Reply-To: <20200522082208.383631-5-alexandru.ardelean@analog.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Fri, 22 May 2020 11:53:50 +0300
Message-ID: <CAHp75VewoA-jcRDpvNdoRyS4Tdaw_QsBDJ5_ETc6crwuuefdyg@mail.gmail.com>
Subject: Re: [PATCH 5/5] iio: remove left-over parent assignments
To: Alexandru Ardelean <alexandru.ardelean@analog.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200522_015408_565567_E7761B97 
X-CRM114-Status: UNSURE (   8.60  )
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
Cc: milo.kim@ti.com, tomislav.denis@avl.com,
 Dan Robertson <dan@dlrobertson.com>,
 =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
 linux-aspeed@lists.ozlabs.org, linux-iio <linux-iio@vger.kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>, Eddie James <eajames@linux.ibm.com>,
 Platform Driver <platform-driver-x86@vger.kernel.org>,
 Paul Cercueil <paul@crapouillou.net>,
 Lorenzo Bianconi <lorenzo.bianconi83@gmail.com>,
 Song Qiang <songqiang1304521@gmail.com>,
 Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 "open list:STAGING SUBSYSTEM" <devel@driverdev.osuosl.org>,
 linux-samsung-soc@vger.kernel.org, Kevin Hilman <khilman@baylibre.com>,
 tduszyns@gmail.com, Krzysztof Kozlowski <krzk@kernel.org>,
 linux-rockchip@lists.infradead.org, Chen-Yu Tsai <wens@csie.org>,
 Kukjin Kim <kgene@kernel.org>,
 bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>,
 agross@kernel.org, linux-input <linux-input@vger.kernel.org>,
 orsonzhai@gmail.com, Alexandre TORGUE <alexandre.torgue@st.com>,
 Linux PM <linux-pm@vger.kernel.org>, linux-arm-msm@vger.kernel.org,
 Sascha Hauer <s.hauer@pengutronix.de>, Jiri Kosina <jikos@kernel.org>,
 William Breathitt Gray <vilhelm.gray@gmail.com>,
 Maxime Ripard <mripard@kernel.org>, Vladimir Zapolskiy <vz@mleia.com>,
 Hans de Goede <hdegoede@redhat.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Andreas Klinger <ak@it-klinger.de>, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-amlogic@lists.infradead.org, Fabrice GASNIER <fabrice.gasnier@st.com>,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
 Scott Branden <sbranden@broadcom.com>, rmfrfs@gmail.com,
 Shawn Guo <shawnguo@kernel.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Azael Avalos <coproscefalo@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Ray Jui <rjui@broadcom.com>, Sylvain Lemieux <slemieux.tyco@gmail.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, zhang.lyra@gmail.com,
 baolin.wang7@gmail.com, Kevin Tsai <ktsai@capellamicro.com>,
 Syed Nayyar Waris <syednwaris@gmail.com>, Peter Rosin <peda@axentia.se>,
 Jonathan Cameron <jic23@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, May 22, 2020 at 11:37 AM Alexandru Ardelean
<alexandru.ardelean@analog.com> wrote:
>
> These were found by doing some shell magic:
> ------------
> for file in $(git grep -w devm_iio_device_alloc | cut -d: -f1 | sort | uniq) ; do
>         if grep 'parent =' $file | grep -v trig | grep -vq devm_; then
>                 echo "$file -> $(grep "parent =" $file)"
>         fi
> done
> -----------

Side note: time to learn coccinelle or shell better :-)

-- 
With Best Regards,
Andy Shevchenko

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
