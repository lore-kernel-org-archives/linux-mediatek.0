Return-Path: <SRS0=LW2f=OE=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BC68C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Sep 2021 18:27:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 67D6D6109E
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Sep 2021 18:27:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 67D6D6109E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=owfjZFoeDKABsZeXreRidteqTEVHAkDNLileP2dQeps=; b=1U5+ZgsXcBQk3L
	SdX2PX2dT3DKy+J/rZ1ZTnItvxVQqqkRIQetDSKW7S1YX0WkQ7IHXBRlsxsilxsv22zKhfPSjXytA
	+3tpCL0+CBBQnDt9yt0eJdVBgQzY19Emeu23KcO/5VttdKmktAWQNSjXh2IrlmgGMie3BwXumN5q6
	3BQrzUFqbkOu78ci3byv1LW2MxeJ4HTAtDLZ0CHjKrkswToeHIaZDjHB17AYd6lb9mvC02R65DF74
	fCLDI4EwpRNcKYWY/bjs4teUfmaMC4EeTfeoJMeZe7S5uPL9hc6VbGUCN1Ta0+p+gsxEC2zs4vvUC
	Cec7SUKpaT4yHvxJQh9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mQD9D-006l0P-Ig; Tue, 14 Sep 2021 18:27:11 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mQCjb-006fKK-IA; Tue, 14 Sep 2021 18:00:44 +0000
Received: by mail-wr1-x42e.google.com with SMTP id x6so21615123wrv.13;
 Tue, 14 Sep 2021 11:00:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=6dFC6G9j2m+rj0GHdvZf5Uzsxvw56U4B4UMYB9UQwLo=;
 b=N1diVjvcLL0DD9LXmypCZBUjV+2UYbD4bpqz2gMmcJxPBvh+g6r1IU+xttsw9Xco5p
 Y8TlgGl+PLzkaLd1swTkvb/5eCG/UEWpT3+nX/gXi3f6Hv6EUo/OCpqqmhd/MBOhubdR
 SAKVN4+AgJx37Bv9cKkQQp44TNCcetP0V86JkvMy/wNAMI7SArXvHEVKkxPrCDQ7JQEj
 ITjizWywYykEMb396i/GFiBlgRQ1uxi1g83BGen4gHkNN/rwjIHs4+qluKRnWApsYH6X
 NWO9MWnbV9KYlRXBumupy4VMj8g/OZxswW+sSzghsWDMV5dOkjhFMN3ANVoW52J7a9DA
 uTPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=6dFC6G9j2m+rj0GHdvZf5Uzsxvw56U4B4UMYB9UQwLo=;
 b=kczpwfXpMEHequH8bNrRT5GVpXSVzddbHBpAm21oF5zE95HwdhBGIEx3SYIj8G2UOM
 te0k4EyLV9kuHqBrOnDSrkI9zr+4LhDSxVzPBqSbVQDDBPGxCvUdlhjsA9J5M64T8HgG
 y8Hs2q0LCw/cImb+lAdYPPbrU3pZkzmm364UOz3gqzqCIC4fR/mL8zZ2r/D0mYBRgmcR
 1ljUQgx4ZZxHUAik/eRQratsrJmtGB+lIAYISma2BeFAyF+edQgISEaV2S5zNSh0d3oF
 GoRD7nrWm2faMBKQO07LErc1i1LflVnAXSdHoolnwPUmYKokjOzeUW1C+81xW+UeqjH6
 sdpQ==
X-Gm-Message-State: AOAM5300RXeJM9o0YUyY2M7QcvHzVj31ADYerCb7rDhxKTG7b2tDDDil
 7y+AckPtftsBpA/lTYCRfV0=
X-Google-Smtp-Source: ABdhPJzfylK+kXHce7KVWJLaOvCn3SkTzG7NheWlvuWVPNshAFAZB4oanYkpP2XWqKXD5RN8kmT+HQ==
X-Received: by 2002:adf:c10b:: with SMTP id r11mr492124wre.336.1631642441638; 
 Tue, 14 Sep 2021 11:00:41 -0700 (PDT)
Received: from [192.168.0.16] ([37.223.140.66])
 by smtp.gmail.com with ESMTPSA id k16sm11109485wrx.87.2021.09.14.11.00.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Sep 2021 11:00:41 -0700 (PDT)
Message-ID: <9aa66a93-4d0c-176e-ea35-b5aa33751d51@gmail.com>
Date: Tue, 14 Sep 2021 20:00:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.0.3
Subject: Re: [v3,5/9] dt-bindings: pinctrl: update bindings for MT7986 SoC
Content-Language: en-US
To: Sam Shih <sam.shih@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 Sean Wang <sean.wang@kernel.org>, Linus Walleij <linus.walleij@linaro.org>,
 Matt Mackall <mpm@selenic.com>, Herbert Xu <herbert@gondor.apana.org.au>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck
 <linux@roeck-us.net>, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Hsin-Yi Wang <hsinyi@chromium.org>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Fabien Parent <fparent@baylibre.com>, Seiya Wang <seiya.wang@mediatek.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-crypto@vger.kernel.org,
 linux-serial@vger.kernel.org, linux-watchdog@vger.kernel.org,
 linux-clk@vger.kernel.org
Cc: John Crispin <john@phrozen.org>, Ryder Lee <Ryder.Lee@mediatek.com>
References: <20210914085137.31761-1-sam.shih@mediatek.com>
 <20210914085137.31761-6-sam.shih@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20210914085137.31761-6-sam.shih@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210914_110043_675593_6C3430D9 
X-CRM114-Status: GOOD (  14.24  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



On 14/09/2021 10:51, Sam Shih wrote:
> This updates bindings for MT7986 pinctrl driver. The
> difference of pinctrl between mt7986a and mt7986b is that pin-41 to pin-65
> do not exist on mt7986b
> 
> Signed-off-by: Sam Shih <sam.shih@mediatek.com>
> 
> ---
> v3 : make mt7986 pinctrl bindings as a separate file
> v2 : deleted the redundant description of mt7986a/mt7986b
> ---
>   .../pinctrl/mediatek,mt7986-pinctrl.txt       | 300 ++++++++++++++++++
>   1 file changed, 300 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/pinctrl/mediatek,mt7986-pinctrl.txt
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/mediatek,mt7986-pinctrl.txt b/Documentation/devicetree/bindings/pinctrl/mediatek,mt7986-pinctrl.txt

Normally new bindings should be using the yaml description instead of txt.

Regards,
Matthias

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
