Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B12D5C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Mar 2022 13:30:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=I9PdwKyEBQ0VSJfZu/ObH3y7OgcyLCHn9AqBg7PTNNw=; b=U+r+nMoboV/9SU
	2REgF+N202VywW1kbBFZejUHJP5N9zIW5F1b2pBmZjmWnQ4tTIKHGy22zm2pqZQhYiI/xn5qcQ/za
	fFzSbPAFG2rfSDdwGHCwgApiHX//m8EUevGxYLO439/q8Y5kcPiMzGRKENceXHzcdWKAkvIbLLI40
	6y/jc6iqH5MEc+WRJ61PnFrVWMVkYMO9Qvi+a9AVV5nMQqELnEbWX7pxSgGwh8M+u9wiCX5VNBfG+
	aI+je/5wka0zf3Y/6TH5W+C8Xmfpz/4pTLJ1HRXq4pTECQQR/bZwbkYd5xeQoLmvFxNWEEDdMBOq4
	fGchM3jBgbEPtQRaMItg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nVCgY-001jG5-Qg; Fri, 18 Mar 2022 13:30:30 +0000
Received: from mail-lf1-f42.google.com ([209.85.167.42])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nVCgN-001jE4-HW; Fri, 18 Mar 2022 13:30:20 +0000
Received: by mail-lf1-f42.google.com with SMTP id w12so14087705lfr.9;
 Fri, 18 Mar 2022 06:30:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=vq9qQSRELzxWkIVj+hUn/M+Bp2lpfseu1iZAEoXNp4A=;
 b=u3CvcnNDWb3VJ7FuYa+pOZDmAgVBHgI5i+kNj/Z8LrC+N05xbwvia06oG6m8WpoOIm
 blqIEsL0jl2uthmXDX7DS3Q/KokFo4+xW7nimzH5gHkQuLIR66VJNHrRJQrurO1Fvc1O
 6ngJUVkelAYQAEeUw1iFP4/7IfOXmEJ6GuU/bgBgfQgkX2mdacPzetTHbSeP64EeIXM8
 uSprMlst+tNna6xy9slr/SHqgygeDOwsv89hVXCUUssQqlDVMwZAAzBUFyQnYnjB0piv
 QlCcLALtMEveiGjNItafLlt/XU0ErwzctOtwnMrDxmjsJkR5QNIwDTKj3XkDP7AB9e7v
 LW0Q==
X-Gm-Message-State: AOAM53142cRupiyoUvRN6/f5FklddT5sexWfNzD2kRD2uNfUpUhDJ/Ik
 m1mxtMRn+WG3WIQ+pqCSqY8=
X-Google-Smtp-Source: ABdhPJyYBFJsAEi9Ox3ftSywWBGbh5eMDlIwP/i63FzaSWzPLrE9zOrSgh9JWeoOZQHa1ow2OL1Tcg==
X-Received: by 2002:a05:6512:689:b0:448:baa7:154e with SMTP id
 t9-20020a056512068900b00448baa7154emr5791258lfe.230.1647610217735; 
 Fri, 18 Mar 2022 06:30:17 -0700 (PDT)
Received: from [192.168.0.17] (78-11-189-27.static.ip.netia.com.pl.
 [78.11.189.27]) by smtp.googlemail.com with ESMTPSA id
 h14-20020a05651c158e00b00247fda7844dsm954009ljq.90.2022.03.18.06.30.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Mar 2022 06:30:16 -0700 (PDT)
Message-ID: <9e82c55a-51cb-1c1d-8314-cef75797f1ae@kernel.org>
Date: Fri, 18 Mar 2022 14:30:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [RESEND v7 1/3] dt-bindings: mmc: mtk-sd: extend interrupts and
 pinctrls properties
Content-Language: en-US
To: Axe Yang <axe.yang@mediatek.com>, Ulf Hansson <ulf.hansson@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, Chaotian Jing
 <chaotian.jing@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 Adrian Hunter <adrian.hunter@intel.com>
Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 Satya Tangirala <satyat@google.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>, Lucas Stach
 <dev@lynxeye.de>, Eric Biggers <ebiggers@google.com>,
 Andrew Jeffery <andrew@aj.id.au>, Stephen Boyd <swboyd@chromium.org>,
 Kiwoong Kim <kwmad.kim@samsung.com>, Yue Hu <huyue2@yulong.com>,
 Tian Tao <tiantao6@hisilicon.com>, angelogioacchino.delregno@collabora.com,
 linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20220317101215.24985-1-axe.yang@mediatek.com>
 <20220317101215.24985-2-axe.yang@mediatek.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
In-Reply-To: <20220317101215.24985-2-axe.yang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220318_063019_613035_C37FB4F3 
X-CRM114-Status: GOOD (  12.13  )
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

On 17/03/2022 11:12, Axe Yang wrote:
> Extend interrupts and pinctrls for SDIO wakeup interrupt feature.
> This feature allow SDIO devices alarm asynchronous interrupt to host
> even when host stop providing clock to SDIO card. An extra wakeup
> interrupt and pinctrl states for SDIO DAT1 pin state switching are
> required in this scenario.
> 
> Signed-off-by: Axe Yang <axe.yang@mediatek.com>
> ---
>  .../devicetree/bindings/mmc/mtk-sd.yaml       | 24 ++++++++++++++++++-
>  1 file changed, 23 insertions(+), 1 deletion(-)
> 


Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>


Best regards,
Krzysztof

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
