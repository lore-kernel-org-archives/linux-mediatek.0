Return-Path: <SRS0=QBl7=2I=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48F67C43603
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 Dec 2019 05:42:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1292920733
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 Dec 2019 05:42:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="KdaW93DB";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pEEICwas"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1292920733
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iPL6PK373mQNtAFqF/6I41lBjIbcylyb/tB/PryTQFw=; b=KdaW93DBm8jzXu
	czyo6f+XDjbmJuS1PZ0oap3MYltYRAIihG2jwpR+rdaXe1AyPzpk3PJTfJdz1BVM5QgPdLBbB+N1g
	UgosP8bBNC3ZsBoepMOfxKxfNlR6q+00wNf7+8W0IcN50fSEf851y5/I5ueV7o4vpSQq5PdTa4FvS
	MtzvcCjscQDhfglPXH/V3EGk+nWbEVzCbKyTCMRhL1sjuOvWPJgVVEK73ejHKJ4az8Lwn/JUDWenf
	KquXC7rN5YyAQrecXCsHWIdmidmhKcJHzl8gWB1dhJjedfMQCL01ZqKb1JBhwqPz6F7TP8FQNkHQW
	Ix3/etx5troSIz9XpteA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ihS6T-0002Sj-9F; Wed, 18 Dec 2019 05:42:33 +0000
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ihS6P-0002Rc-CW
 for linux-mediatek@lists.infradead.org; Wed, 18 Dec 2019 05:42:31 +0000
Received: by mail-pg1-x542.google.com with SMTP id r11so648585pgf.1
 for <linux-mediatek@lists.infradead.org>; Tue, 17 Dec 2019 21:42:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=xV4KfJlK4YlnhchUUwxKnteaYwdyYGzcZQcMfxQtzso=;
 b=pEEICwashl/t9nYsbZJNVLzXODux5zOMFmXSAptDtsF9vUIfUAI33C2FPralqEaTvY
 1MlZvXRJ4hKdvSRnd4S8+a9babevrFB/uNOVs0XpWwZIZ96uuWorNIbZ3YqkN35i5qaH
 SPRYJrHojpcfB2XlcMwpI8elGpnb94JQJ4orUHclz5Y6aXFEPkfiISDLVxJI95F2uDeb
 tGy4zO4ZbaehRmteUSqEvXYKbcTGCNBMcdcHb0ez7MRkewuR7EOejC0HcZZ+8XsvUPRC
 pk7grQlH5jvmB3CTeiE6n5qJXboxfhhCFXe8qNNWppwOECUgyfrFu/ykxBxUSaARYREH
 ZH8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=xV4KfJlK4YlnhchUUwxKnteaYwdyYGzcZQcMfxQtzso=;
 b=dJL3bkm/4/NZ3tAlZSQE+GS9NWJzFZrHgT67Mvwb6LlLknZzHlQI3YfIj2EEWmGXJA
 1OKuOtvnvpYPhjtfmAOyo4pHwXDgJwoaJyhRh7B/KplrgWr52N+fy/+PKLes4Wk77OwW
 VmNL8b3Dy8E9eeGTOok+Z28YHJ5b28q7Av0wcv+0BUpC9SiwFUVe0aqJQRFv2U8tCAmj
 vRouQPmKxrWcDzja+yFvHjzBjUlFolC6AwcChoTZJBj4zQwUR1K713HTLNDz/u5UgbDW
 Ux3p4AN+x1mAfsqRqbExNDbSM+3eiYesUwTOPg0XkUWTiWRNB2TXDDUX2RcNTNRC9iNM
 PbeA==
X-Gm-Message-State: APjAAAW1Fb1qtaMDTsQHVl9qe2IPncTq7FrZSH0BR9q8XfJcqpnD9Bd5
 Mpzvy7MoMscuFl8PufaxQwNdqA==
X-Google-Smtp-Source: APXvYqyWesdIIO3qxjlP7JTHe12xBW/M910oPFrSVXRrjw3E1ufF2TfARQMbp5ECnXSXj86QKLMFmg==
X-Received: by 2002:a63:5d03:: with SMTP id r3mr957260pgb.306.1576647747835;
 Tue, 17 Dec 2019 21:42:27 -0800 (PST)
Received: from yoga (104-188-17-28.lightspeed.sndgca.sbcglobal.net.
 [104.188.17.28])
 by smtp.gmail.com with ESMTPSA id g7sm1139962pfq.33.2019.12.17.21.42.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Dec 2019 21:42:27 -0800 (PST)
Date: Tue, 17 Dec 2019 21:42:24 -0800
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: Re: [PATCH v2 2/4] ARM: dts: qcom: Correct USB3503 GPIOs polarity
Message-ID: <20191218054224.GE448416@yoga>
References: <20191211145054.24835-1-m.szyprowski@samsung.com>
 <CGME20191211145213eucas1p2c438f848ba705fa407331bb31b03b626@eucas1p2.samsung.com>
 <20191211145208.24976-1-m.szyprowski@samsung.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191211145208.24976-1-m.szyprowski@samsung.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191217_214229_446851_D03E9F94 
X-CRM114-Status: GOOD (  16.08  )
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
Cc: Stefan Agner <stefan@agner.ch>, linux-samsung-soc@vger.kernel.org,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Linus Walleij <linus.walleij@linaro.org>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>, Chen-Yu Tsai <wens@csie.org>,
 Andy Gross <agross@kernel.org>, linux-mediatek@lists.infradead.org,
 Maxime Ripard <mripard@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed 11 Dec 06:52 PST 2019, Marek Szyprowski wrote:

> Current USB3503 driver ignores GPIO polarity and always operates as if the
> GPIO lines were flagged as ACTIVE_HIGH. Fix the polarity for the existing
> USB3503 chip applications to match the chip specification and common
> convention for naming the pins. The only pin, which has to be ACTIVE_LOW
> is the reset pin. The remaining are ACTIVE_HIGH. This change allows later
> to fix the USB3503 driver to properly use generic GPIO bindings and read
> polarity from DT.
> 
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>

Acked-by: Bjorn Andersson <bjorn.andersson@linaro.org>

> ---
>  arch/arm/boot/dts/qcom-mdm9615-wp8548-mangoh-green.dts | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm/boot/dts/qcom-mdm9615-wp8548-mangoh-green.dts b/arch/arm/boot/dts/qcom-mdm9615-wp8548-mangoh-green.dts
> index 26160c324802..942e3a2cac35 100644
> --- a/arch/arm/boot/dts/qcom-mdm9615-wp8548-mangoh-green.dts
> +++ b/arch/arm/boot/dts/qcom-mdm9615-wp8548-mangoh-green.dts
> @@ -143,7 +143,7 @@
>  				compatible = "smsc,usb3503a";
>  				reg = <0x8>;
>  				connect-gpios = <&gpioext2 1 GPIO_ACTIVE_HIGH>;
> -				intn-gpios = <&gpioext2 0 GPIO_ACTIVE_LOW>;
> +				intn-gpios = <&gpioext2 0 GPIO_ACTIVE_HIGH>;
>  				initial-mode = <1>;
>  			};
>  		};
> -- 
> 2.17.1
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
