Return-Path: <SRS0=bJmk=MY=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16806C4338F
	for <linux-mediatek@archiver.kernel.org>; Sun,  1 Aug 2021 20:49:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C511661059
	for <linux-mediatek@archiver.kernel.org>; Sun,  1 Aug 2021 20:49:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C511661059
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TrYKhKivn3ELRGORW/ZvHw75lF6KBo/IHq3ls1deq3k=; b=vdUG+lDXid7Q86
	2bL1DsQgrvSybTcsX1CRSjNxf3kl0v4rXyo3OAOloGHH5pVshomOZe3SdvyH8ttK12FepzN3avTsu
	XeJao1TO8kVdnHtNc4cIrZLJjrv+i2UjgMYBnE0p5F7URb+VugijKDYp2PnfbcejwMdXYhwsSx35I
	Ypf9BPgVLAwpIx0dfbh0FiF4D7SPipxmfVy2/bhCUjvKCR5T95UZic1o4FOwr/VdA1f1CkbzG8nm5
	jDJvSHewU15bBCQJVBCqUWK0XmFPfaFTHRyevpcE2oO8n3H7vLZT1i6YmzvNlm6bs00Ccc1Lfhsxh
	nmxGXL4I9y5RGzGcjQAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mAIOG-00ECz1-9x; Sun, 01 Aug 2021 20:48:56 +0000
Received: from mail-ot1-x32e.google.com ([2607:f8b0:4864:20::32e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mAIOC-00ECyZ-3o; Sun, 01 Aug 2021 20:48:53 +0000
Received: by mail-ot1-x32e.google.com with SMTP id
 x15-20020a05683000cfb02904d1f8b9db81so4089255oto.12; 
 Sun, 01 Aug 2021 13:48:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=3wDs4TscZnBfih/RoUBpjRLjosLDw2uLwbF2csntLTo=;
 b=IxfENPjH2e4w5qRT7ASIYRIozgQ+/sX8NCAKqSMc6b8w5WRry3ukSep3aE2Fdahxn6
 06QxofQwMZSunlFhvJ35+J6SYxpVw2+IItEPpV3WL1PO9zjtPi3cPwE4M4guMKfNdiTn
 d06Vtv5iYNjJAk6E3J1cmLMEqxDXekYvaqh8C3R2LpUrtBoMXTXuHEp7GWlQfesx7fKI
 ZmAVqd7Z/Xjr6/bA44sAEb95fSmTPw3Apd/Up7D3P/GfAn3D4X6TmYn4VU0nBl12ATDj
 KCwnHIE1lE8wm7IwmhLBMER1of3SIGWivzBShnm66w1mNspn295cJaqgc5CW/yRPXXY/
 0YTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to;
 bh=3wDs4TscZnBfih/RoUBpjRLjosLDw2uLwbF2csntLTo=;
 b=axT67v3BVjyQFskE5DfvKgog5kjKjWdSMWqf9avjqeNIWGys+0xAqxDCKGw2Iy6c3F
 lZ+ruHVb7NxZaf2mhWOrhi06ShATIT7+p81iK3JZA7hayFEXw4jNqqTQZbET++19mRaS
 INav9n6laAt0McutQ7nvlFOYILCEXGxyV6mFrufz5gmaiNnqf4myAOkGpvQv96wJ6Rjw
 1RHe0enPTZgGva7jsiBJPzKnGWcBz3UOsY5a2mdXCoBrlT8q7tSA1RfMzpIMCJ+9SQHe
 9OW5olF6q45SHj3PeUGDnfnPkeiEPNao/qEbU8m9ezlc4fAUK1pYZnKEIIwAOWcKCOeH
 C7fQ==
X-Gm-Message-State: AOAM530W57TbN+WKiZ+wqcL7leN0+D41CvEST2plFuf2XCMtzpDtVL1R
 teRGc68yNdxaywXszPjxy9+5U/tr+JA=
X-Google-Smtp-Source: ABdhPJzlGbNGz7fO6f3aMCFJPAHsiwpnrYGwxdWj9tPS+NunUjP161qUG9vYt6Ii2t5StdpPw6vNDQ==
X-Received: by 2002:a9d:26a:: with SMTP id 97mr9282002otb.333.1627850930545;
 Sun, 01 Aug 2021 13:48:50 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 c11sm1559290otm.37.2021.08.01.13.48.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 01 Aug 2021 13:48:50 -0700 (PDT)
Date: Sun, 1 Aug 2021 13:48:48 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Sam Shih <sam.shih@mediatek.com>
Cc: Rob Herring <robh+dt@kernel.org>, Sean Wang <sean.wang@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Matt Mackall <mpm@selenic.com>,
 Herbert Xu <herbert@gondor.apana.org.au>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Wim Van Sebroeck <wim@linux-watchdog.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Hsin-Yi Wang <hsinyi@chromium.org>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Fabien Parent <fparent@baylibre.com>,
 Seiya Wang <seiya.wang@mediatek.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-crypto@vger.kernel.org, linux-serial@vger.kernel.org,
 linux-watchdog@vger.kernel.org, linux-clk@vger.kernel.org,
 John Crispin <john@phrozen.org>, Ryder Lee <Ryder.Lee@mediatek.com>
Subject: Re: [PATCH 10/12] dt-bindings: watchdog: Add compatible for Mediatek
 MT7986
Message-ID: <20210801204848.GA2800586@roeck-us.net>
References: <20210726071439.14248-1-sam.shih@mediatek.com>
 <20210726071439.14248-11-sam.shih@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210726071439.14248-11-sam.shih@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210801_134852_215754_16F6B50B 
X-CRM114-Status: GOOD (  14.78  )
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

On Mon, Jul 26, 2021 at 03:14:37PM +0800, Sam Shih wrote:
> This commit adds dt-binding documentation of watchdog for Mediatek MT7986
> SoC Platform.
> 
> Signed-off-by: Sam Shih <sam.shih@mediatek.com>
> Acked-by: Rob Herring <robh@kernel.org>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  Documentation/devicetree/bindings/watchdog/mtk-wdt.txt | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/watchdog/mtk-wdt.txt b/Documentation/devicetree/bindings/watchdog/mtk-wdt.txt
> index 416d716403f6..a4e31ce96e0e 100644
> --- a/Documentation/devicetree/bindings/watchdog/mtk-wdt.txt
> +++ b/Documentation/devicetree/bindings/watchdog/mtk-wdt.txt
> @@ -13,6 +13,7 @@ Required properties:
>  	"mediatek,mt7622-wdt", "mediatek,mt6589-wdt": for MT7622
>  	"mediatek,mt7623-wdt", "mediatek,mt6589-wdt": for MT7623
>  	"mediatek,mt7629-wdt", "mediatek,mt6589-wdt": for MT7629
> +	"mediatek,mt7986-wdt", "mediatek,mt6589-wdt": for MT7986
>  	"mediatek,mt8183-wdt": for MT8183
>  	"mediatek,mt8516-wdt", "mediatek,mt6589-wdt": for MT8516
>  	"mediatek,mt8192-wdt": for MT8192

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
