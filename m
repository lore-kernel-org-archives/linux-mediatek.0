Return-Path: <SRS0=dK9R=IB=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CD3AC433DB
	for <linux-mediatek@archiver.kernel.org>; Wed,  3 Mar 2021 20:10:42 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6EC5864EDC
	for <linux-mediatek@archiver.kernel.org>; Wed,  3 Mar 2021 20:10:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6EC5864EDC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ingics.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=/qoVYBCA8Pt7nZxpebadMaQfdm55QFfC8SLqq8XD1PA=; b=EEvalYfrM45qQiuPmdcMWc4WI
	ZJTeOFnobxn7tletzROLiX7zuqg9MI/EbSsXHjt1iw2slKQifyXscYpo5cnQkEWoRQ705PtaWLmMv
	UZScc5il8ymEwKISbaXWm6xeqx1dlExlBcL6zxDQPBnNoWmszDgHV8Ona5X/cXfj1rfAE9dcSdyBP
	ntGmSZfXMqzIT6HVYJ/YqUedHn82biLdyl8g1dO8YovxkQV14yxUvO2zoXQgCijw3bmbs/N1qYaQM
	H+ndkm1l2BD8No1TygunrV1d1D9lhHwtZN1LoeoXIvbTkkbdjLzyGitGyNTP5k4K6OL93CtNRql3v
	UlNYBg2kw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lHXp6-006Mpn-9O; Wed, 03 Mar 2021 20:10:20 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lHT5B-005IdT-U6
 for linux-mediatek@desiato.infradead.org; Wed, 03 Mar 2021 15:06:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
 Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender
 :Reply-To:Content-ID:Content-Description;
 bh=RKwqvjc2wk7e2+JEpQKXBE74c6T76PfSJ5fS7l5tMvw=; b=LvlfqrwqW6/sq9/IcQl44ApXfu
 qa3nse5el70wzmyVS6XDiFvazmhntxBo7KNKnSdRyLKZP2SaV2LiX5FUxOVKYlvXOA0DCZtCLePdY
 ewTH6WRWlY+rzqIqNwfBMLRpkkmT0t665lK9sWbOTJEvOKwvXPK7KVVmxrlQ6Yo+dV9dkxR3ubiUs
 GrV04ovSZO7h7C/fFTlRXAGvM7Bi86/GVHx7i5fEhLuDiaVjP63HHIzbxPmLHKzIfntt+fMZfv4AZ
 sCtjC8bdKuusDYiuh3OTtSxxqQHsR39f1wecQxWd3LAxKwzn+193QdTImw3GiN8mN3hzBajaIjGj6
 sb3V+lZw==;
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
 by casper.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lHHrD-0014ho-Ga
 for linux-mediatek@lists.infradead.org; Wed, 03 Mar 2021 03:07:29 +0000
Received: by mail-ej1-x62f.google.com with SMTP id hs11so39381203ejc.1
 for <linux-mediatek@lists.infradead.org>; Tue, 02 Mar 2021 19:07:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ingics-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=RKwqvjc2wk7e2+JEpQKXBE74c6T76PfSJ5fS7l5tMvw=;
 b=bFfFxkZfnEuSe+zD3dOESM/J8Phx3ou9kd9mPXToUzSdfQAb53Qs3YeQEEyLDTBDzM
 SqXy56RHCu+89Z6rlaZ/G920014szsVlNvAyH3Js+p9W5gbReYP9j83NcTH5tGY8rHar
 1OQ3ZP6fXm2KK4F4y19TLAygolEdoc7d0+vHt6kmmMTyL5wDi3Oaw09zpmACmxMt0eNw
 tgbsGnzfLfgUA/ccDdv/wDDoOIiCS4AiK7jHapszlkpK19V7XFeoVOBWUb/5RDW1OzhT
 csD+LtfQ/zQCYu+SdJ3LE8Dzpgc9/pR9p9mLmlAs2SdCrwCO5KE//k0c4i9nH3P9dxix
 hFcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=RKwqvjc2wk7e2+JEpQKXBE74c6T76PfSJ5fS7l5tMvw=;
 b=lU4/iTt/xyTXAJ4ajWTG5H+SY4HaQtoZp9khzfU4Qv1d2s1xAWIWUD3o5mHAbG4JfR
 Encm1InnwWu0JPcjSCDGlInUzC7/1kS7qS3j/KT8tLPi0PMicuKpnsQ8vbeNPZg4sH0A
 0gJxW2/2I0XbDAkBS46Ku2owP392fK3n61nKg7WhUcrmwjikTZaDmLTQZJdr4s1aLIJ8
 ir0CiyxNE/G9ga0Gxma96WAxGpaEhhybmthXMur09lpvVv8QIx37nR/wbeE4JBoxv0WV
 T433swD8agcDw76UVYxhbBEcEN22oLywdhF2F6E0+s/y7phDbuX3lqz6xfLpJrWKiIcA
 +Jrw==
X-Gm-Message-State: AOAM533w09TPiogHXBMYs1cVT0q6RkYB3jAE9L3hialwXuuxwBzUPbZl
 nTp/h2wVEzsyqjr4uk0EnYuTpn2xfLPOrxTD9bHbgQ==
X-Google-Smtp-Source: ABdhPJyYqGm/IkXBg72idjlWOcasJpO+3VO1/ceWLHr+GEA9ohQQX4RYUV2o/t1wOsx2Xn55vwqBtBe54xMV9cUzjVI=
X-Received: by 2002:a17:906:4c8b:: with SMTP id
 q11mr23806065eju.270.1614740775721; 
 Tue, 02 Mar 2021 19:06:15 -0800 (PST)
MIME-Version: 1.0
References: <20210303025636.795-1-leilk.liu@mediatek.com>
In-Reply-To: <20210303025636.795-1-leilk.liu@mediatek.com>
From: Axel Lin <axel.lin@ingics.com>
Date: Wed, 3 Mar 2021 11:05:39 +0800
Message-ID: <CAFRkauDpNmPRpnM-iz8az2N_cUEhEtDKMq6qfP-f++2iyxqVTw@mail.gmail.com>
Subject: Re: [PATCH] spi: mediatek: Re-license MTK SPI driver as Dual MIT/GPL
To: Leilk Liu <leilk.liu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210303_030729_804377_1DF26E71 
X-CRM114-Status: UNSURE (   8.83  )
X-CRM114-Notice: Please train this message.
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 Nicolas Boichat <drinkcat@chromium.org>, Wei Yongjun <weiyj.lk@gmail.com>,
 fparent@baylibre.com, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-spi <linux-spi@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>,
 Stephen Boyd <swboyd@chromium.org>,
 Javier Martinez Canillas <javier@osg.samsung.com>,
 Mark Brown <broonie@kernel.org>, "luhua . xu" <luhua.xu@mediatek.com>,
 Pi-Hsun Shih <pihsun@chromium.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-mediatek@lists.infradead.org, Thomas Gleixner <tglx@linutronix.de>,
 Fengguang Wu <fengguang.wu@intel.com>,
 Markus Elfring <elfring@users.sourceforge.net>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

TGVpbGsgTGl1IDxsZWlsay5saXVAbWVkaWF0ZWsuY29tPiDmlrwgMjAyMeW5tDPmnIgz5pelIOmA
seS4iSDkuIrljYgxMDo1N+Wvq+mBk++8mgo+Cj4gRnJvbTogImxlaWxrLmxpdSIgPGxlaWxrLmxp
dUBtZWRpYXRlay5jb20+Cj4KPiBJdCBpcyB3YW50ZWQgdG8gdXNlIE1USyBzcGkgYnVzIGRyaXZl
ciB3aXRoIEdQTC0yLjAgb3IgTUlUIGxpY2Vuc2UuCj4gQnV0IG5vdyBpdCBpcyBvbmx5IGxpY2Vu
c2VkIGFzIEdQTC0yLjAsIHNvIHJlLWxpY2Vuc2UgaXQgYXMgZHVhbAo+IE1JVC9HUEwuCj4KPiBT
aWduZWQtb2ZmLWJ5OiBsZWlsay5saXUgPGxlaWxrLmxpdUBtZWRpYXRlay5jb20+CkFja2VkLWJ5
OiBBeGVsIExpbiA8YXhlbC5saW5AaW5naWNzLmNvbT4KCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlzdApMaW51
eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
