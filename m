Return-Path: <SRS0=6w7/=HO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C1ACC433DB
	for <linux-mediatek@archiver.kernel.org>; Fri, 12 Feb 2021 09:46:42 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 47D1C60241
	for <linux-mediatek@archiver.kernel.org>; Fri, 12 Feb 2021 09:46:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 47D1C60241
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=YShtThRxbHani4NLsh0kvA4P+BcYVciKl/CgzdJiCOU=; b=NcrtIL5Pj1CFKTBiHKAsJHeIo
	mgRZDNdEfLl+RqdRPOY3zLyod4b5JuVXHpCm7r5JK5qzH4mvGkfmuNJ9HIqjhOqv1jJNs6ku/CnrL
	Fq5427YJLl9CDf1IjVb5fEiUpoc1qFSb9R9EGFKcOiOKZHvf/M7wlTv+oUpnUss19rr0jUwNUqJYV
	zcluBJb0exxOsSzcE6vvQbOpsW+K87nohF1CzHYc6+qLGHpo6sJjzqHCHMPymaend9FreiSf7s1CE
	LYC046MqzjhALyMN9yAcQNyj/LUPWWzlsCg4w+OxFmZzmp0OiF5uDU8mqRINvNJCuB8U1H5fozAG/
	PyY9mZMXQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lAV21-0004ph-0Z; Fri, 12 Feb 2021 09:46:33 +0000
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lAV1x-0004nl-Si
 for linux-mediatek@lists.infradead.org; Fri, 12 Feb 2021 09:46:31 +0000
Received: by mail-lf1-x129.google.com with SMTP id j19so12180850lfr.12
 for <linux-mediatek@lists.infradead.org>; Fri, 12 Feb 2021 01:46:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=i4ca59SdGEVnFSofi3ZXoX6JlgB2eaV3/YrXqwVKM8w=;
 b=Yy351HLBZUge4sG9PBG2oLCjXOrReyEUMGZdK7mNji7JwMOZqqljspFEyf0HEKVnDc
 ZkyxPuWz5lXXja33P/NlPIJ1NSZGsATcWJKqtMtded81fkJO3ebDhCrDsWb5Np3hwtGL
 WBzhe6ZboL8lBI0ymtSQTMaQfMpmzV+MRwTEOEQw8uCiUwDC3woGumorSBeK6WiQzcoU
 8YwJhBQQKfJAF8+Np3v/9GniuaaJm68pfN/arA/yqwy2xeQnxLIpWNjngsbpUYPWpiqs
 m4EXb4OfhBGb/HP4e9Iql22pw0jzeap/xgK6NHLr6KTupqokL+Wywa/xLc6IOUUmmRDd
 mBlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=i4ca59SdGEVnFSofi3ZXoX6JlgB2eaV3/YrXqwVKM8w=;
 b=jSsp5vDDArukumV4/j4anDm+N0oADfnR/Z96zf+WAr6s2bowcdrD/MhzbsNQj5hDIG
 OnlLlfL9bH7bEBCL3/XfrjFUb+Yswz0tjQWQm3/SjUZ5ciInAIc1SS2nJTCgPsYJ5kwH
 /JNYjtKMASLTHjL+1d3Wwlt23rQy/rerc1JcZm9FySFue7IHGkVCLqmrIQYWUXyFIZSN
 f5cDGghTgo94f0Zp2na9PtQJy/h0JQQm0EU1yp89qImV/9OlB6earsz5hwYG6K38rdmH
 9tjnJb54pluH0P9Sld+ZMpcxoVgMvYjrSqIbNE6Z+dejQUIWfytjESjkFR7tCWr6EvYH
 wsgw==
X-Gm-Message-State: AOAM532x4NJgOMe03xH4iaRYBQtVdrdOYc7pD4HmsTaT2iOX6yOssVdl
 oRUsedmAJfJJRCCdjsUFsDdKp0QcHBikGXwj7uY0Ng==
X-Google-Smtp-Source: ABdhPJwIYedS7M45SGCJ9oNwPA/7hLc3LJLJFqoY2yYENbG6825pEXbq5JXjPw2/Djuva+5uHhN7aTJfuFaSNzpMinQ=
X-Received: by 2002:a19:70e:: with SMTP id 14mr1094188lfh.157.1613123185577;
 Fri, 12 Feb 2021 01:46:25 -0800 (PST)
MIME-Version: 1.0
References: <20210204125718.1646082-1-geert+renesas@glider.be>
In-Reply-To: <20210204125718.1646082-1-geert+renesas@glider.be>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 12 Feb 2021 10:46:14 +0100
Message-ID: <CACRpkdadDRXa=Hv7dkaTL5pU5hYANQicKgTUhE7jEu6m81Hqvw@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: pinctrl: Group tuples in pin control
 properties
To: Geert Uytterhoeven <geert+renesas@glider.be>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210212_044630_422271_72A84F9F 
X-CRM114-Status: UNSURE (   7.80  )
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
Cc: Dong Aisheng <aisheng.dong@nxp.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>,
 linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Fabio Estevam <festevam@gmail.com>, Sean Wang <sean.wang@kernel.org>,
 Tomasz Figa <tomasz.figa@gmail.com>, Stefan Agner <stefan@agner.ch>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, Feb 4, 2021 at 7:02 PM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:

> To improve human readability and enable automatic validation, the tuples
> in "pinctrl-*" properties should be grouped using angle brackets.
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Patch applied.

Yours,
Linus Walleij

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
