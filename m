Return-Path: <SRS0=bg5C=NW=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 408B1C4320E
	for <linux-mediatek@archiver.kernel.org>; Tue, 31 Aug 2021 19:27:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ED517610D1
	for <linux-mediatek@archiver.kernel.org>; Tue, 31 Aug 2021 19:27:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org ED517610D1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bjYLac7MQ1j8JeIwoV99AgHD1TOtPfsqXZ/GEE6vWPw=; b=bxWgp43v5Q10Zt
	BXEHwYXTygiW9VpUysMAqQ7uC96E5Ywe3mdbpAJJXvCYATkFo60huMqqWkryBfy+4Pxlq8YFRJolQ
	vfmOtih785UT+5YB8XEvvQoDUjC6zR5AYipMi/bauprDgzHBx9i1bhP3VIg2gUcz7lWTRhd2V1/Ju
	P4BevVBh/rdDhpRxH+qSk1VJ+9HFMjlbjp8t1YYXL/TIdh7RZndSMMDHQgtV/sNYcCbJmv0oz3sFq
	qgw586ZfhJxl64X8j5ZlEa+DbvwlGCpNCa0h8WyniUGlcUulISm/zHkf0jLbwaDT/AdAiSqF2e34t
	SL3bxA0znmK8wl/OkrCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mL9Py-00325s-6w; Tue, 31 Aug 2021 19:27:34 +0000
Received: from mail-oi1-f179.google.com ([209.85.167.179])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mL9Pv-00325J-Me; Tue, 31 Aug 2021 19:27:32 +0000
Received: by mail-oi1-f179.google.com with SMTP id n27so658035oij.0;
 Tue, 31 Aug 2021 12:27:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=B18XCxdh5roXXYBkgIgsolQaF3/RyCT+RYjyoh97Brk=;
 b=ZFmjMaqLZ2aVZixZMShGyXmDbGqACo472whfZ3XsoQSj04urAajUOv+3UHfV9ZR8/9
 eY0dWLoIhIk2n5JSR1HJbKjjwXptq24At6BJJrE5GvpQ0lvJ7kgWaslgH3toe2XZXYLZ
 4JBe6av6A5PKTYHRLOaGamWN4hHtWYY93WhDbv5vzXdv46pCugM8n1P/ajs4OTzocBH4
 ZvTNu2ckHVPsnyA9oP78N0Ix1OONYaKftzVlYLzxT25LxrgzQ8yjjtT9JmwLFFyf+BEF
 2Zmkq19ToO62TYYRXeQSJynsrBBxaxbifs7eu+dKu+KdH2oX/Ju/B6oWR4W2V+0FEMgc
 GveQ==
X-Gm-Message-State: AOAM533jd4QufSLfZYwAwZ/xbg85wONT2TKX7zwlby/e/ofHtWaAMY6d
 Bsfz8138UAhrwvlxz1w7zg==
X-Google-Smtp-Source: ABdhPJyISGNvUkiwv/aZwGtTy7OmqleXpitzw8KMrZYdmigKN/S7wGPQvq/Drjnoa3iN8bG0Uc6OpA==
X-Received: by 2002:a54:4182:: with SMTP id 2mr4533320oiy.66.1630438050741;
 Tue, 31 Aug 2021 12:27:30 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id o8sm3712041oiw.55.2021.08.31.12.27.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Aug 2021 12:27:30 -0700 (PDT)
Received: (nullmailer pid 515234 invoked by uid 1000);
 Tue, 31 Aug 2021 19:27:28 -0000
Date: Tue, 31 Aug 2021 14:27:28 -0500
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
Subject: Re: [v2,05/12] dt-bindings: pinctrl: update bindings for MT7986 SoC
Message-ID: <YS6CoAxnarhqdTl+@robh.at.kernel.org>
References: <20210817074557.30953-1-sam.shih@mediatek.com>
 <20210817074557.30953-6-sam.shih@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210817074557.30953-6-sam.shih@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210831_122731_784333_81A9E6BB 
X-CRM114-Status: GOOD (  13.91  )
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

On Tue, Aug 17, 2021 at 03:45:50PM +0800, Sam Shih wrote:
> This updates bindings for MT7986 pinctrl driver.
> The difference of pinctrl between mt7986a and mt7986b
> is that pin-41 to pin-65 do not exist on mt7986b
> 
> Signed-off-by: Sam Shih <sam.shih@mediatek.com>
> 
> ---
> v2 : deleted the redundant description of mt7986a/mt7986b
> 
> ---
>  .../bindings/pinctrl/pinctrl-mt7622.txt       | 170 ++++++++++++++++++
>  1 file changed, 170 insertions(+)

This is adding a lot to not be in schema format. I imagine this will 
need to be a separate file if the pin and function names are different 
for each SoC.

Rob

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
