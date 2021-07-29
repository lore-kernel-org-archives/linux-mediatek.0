Return-Path: <SRS0=Fikf=MV=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF8F2C4338F
	for <linux-mediatek@archiver.kernel.org>; Thu, 29 Jul 2021 22:55:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 916796023E
	for <linux-mediatek@archiver.kernel.org>; Thu, 29 Jul 2021 22:55:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 916796023E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QWRnbhUNApCQcsGr+InLpnE3VPbAFK7FJ8lltvPQNFk=; b=l8iojfL7D8MhlZ
	1njwr4+lObF+3CP10eD6S9nZHBGRX8alZYLc2iWZeD0OOrl+Vnh1od3/I1i2NP0p9ypskZiGnILLW
	aumAIo2fuHProiIZArg6IcgGXITorDZ6kcgiNVutA3sCPc9sCAtE4EJw0F1KsuZYUsPyp8ZmbKnpT
	jLrLUZvwwPvCrHKTka4CQYQFdnuWO6F6ExUbymo5+x8RWn4BkpFl+DLq2AdD/wIzWJF6rQFmKZFtF
	90kxqSgv6EccVDMyiX3MXGNNiqzTwBGeVh0V/Ob0K2wFZKZ+PIJUHL0xvV9Ws4ix6PQK+CZwTu/lW
	9AtjhnFKX6lWGpnSJv+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m9Ew5-006Jgm-W7; Thu, 29 Jul 2021 22:55:30 +0000
Received: from mail-il1-f179.google.com ([209.85.166.179])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m9Es3-006I2l-Rv; Thu, 29 Jul 2021 22:51:21 +0000
Received: by mail-il1-f179.google.com with SMTP id c3so7514555ilh.3;
 Thu, 29 Jul 2021 15:51:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=gWxlLweJQNhlRL0/DUplNg/SDpZzR8jOTWXmRYnCmmM=;
 b=JrIGqFmN5wHoajIfkkownwKQlMakITv9lsI8jwpA+prpLyyAlvCyFhnsmlab0qX+IB
 XO/7O6ORkyphcB/3AllbrvogH978iKbXT6yYFwO4uUEvLy1nb7AfbiN7XLQ6/8SJY2Ll
 I8j6gRTe9yXV0Qb9eNWj/FYG3GVhLi+SUw0e53ez5zhwzLAmDzTA1TwxkO2gqn3yC4Wq
 pXfbcXxnAbCpBFwLYZaWioXBcH2s4O5DvQ5TfaZdjYNWnjOsIa/WHvINcXwHsLgaOFil
 8iCDhCmx0qL4Bplgds4vFdA/A+kEOK2xUqyH49O23hIawz9kT5mmz9r2vAXy9wU50rdM
 nbwg==
X-Gm-Message-State: AOAM530qb3TB2nzToPKWX+1VtEVLL6hDFYO3qjSFjWki4YIq/vdmSgCY
 4r2qUWDNwfc735eManqKUA==
X-Google-Smtp-Source: ABdhPJxE0S6s3FLD5yKTnzi2Pn4YDBkze8cQUCq7Ay/b4kKYHPu7HwjO3npjdwNFKoGRGzq9+QqVrg==
X-Received: by 2002:a05:6e02:d09:: with SMTP id g9mr39729ilj.153.1627599078974; 
 Thu, 29 Jul 2021 15:51:18 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
 by smtp.gmail.com with ESMTPSA id r3sm2500646ilg.20.2021.07.29.15.51.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Jul 2021 15:51:18 -0700 (PDT)
Received: (nullmailer pid 1053555 invoked by uid 1000);
 Thu, 29 Jul 2021 22:51:15 -0000
Date: Thu, 29 Jul 2021 16:51:15 -0600
From: Rob Herring <robh@kernel.org>
To: Sam Shih <sam.shih@mediatek.com>
Cc: Sean Wang <sean.wang@kernel.org>, Linus Walleij <linus.walleij@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Matt Mackall <mpm@selenic.com>,
 Herbert Xu <herbert@gondor.apana.org.au>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
 Hsin-Yi Wang <hsinyi@chromium.org>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Fabien Parent <fparent@baylibre.com>, Seiya Wang <seiya.wang@mediatek.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-crypto@vger.kernel.org,
 linux-serial@vger.kernel.org, linux-watchdog@vger.kernel.org,
 linux-clk@vger.kernel.org, John Crispin <john@phrozen.org>,
 Ryder Lee <Ryder.Lee@mediatek.com>
Subject: Re: [PATCH 05/12] dt-bindings: pinctrl: update bindings for MT7986 SoC
Message-ID: <YQMw4zbhxCTqXqLC@robh.at.kernel.org>
References: <20210726071439.14248-1-sam.shih@mediatek.com>
 <20210726071439.14248-6-sam.shih@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210726071439.14248-6-sam.shih@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210729_155119_959170_7157AE75 
X-CRM114-Status: GOOD (  12.62  )
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

On Mon, Jul 26, 2021 at 03:14:32PM +0800, Sam Shih wrote:
> This updates bindings for MT7986 pinctrl driver.
> The difference of pinctrl between mt7986a and mt7986b
> is that pin-41 to pin-65 do not exist on mt7986b

Sounds like you could use the same compatible string. Wouldn't the DT 
for mt7986b simply not have any config for those pins?

> 
> Signed-off-by: Sam Shih <sam.shih@mediatek.com>
> ---
>  .../bindings/pinctrl/pinctrl-mt7622.txt       | 284 ++++++++++++++++++
>  1 file changed, 284 insertions(+)

This is a big change. Please convert to a schema. It probably should be 
a separate schema.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
