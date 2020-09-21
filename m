Return-Path: <SRS0=GXkz=C6=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5E65C43463
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Sep 2020 10:06:10 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4C8A220EDD
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Sep 2020 10:06:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ODL+YDFZ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LRchwCbJ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4C8A220EDD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=5HWajLpFhiOGbz2g+YKrge4DPrCDHu8UKrgHSdaWTAA=; b=ODL+YDFZMjWgPo1oJoKTF1+Bx
	4xpN11ro+7okwrw3gLRCkyXP4eQqjZ0UQs+pqaLcTB2T+1deY8FjtmmAvxEnTq+PwjiuxI+fLLqtz
	wfa+fOfnhpNtiZP+8s7gRqUazPTSknJOWX9gp9z0OpNG+2pmrBbaDz9uFGl8aVDAeKjo5eWQx62a1
	J7YjsbPN7aoXg9eRKZRQvD+o7hUwfCkQe3GJySP90fUrE8poWTBX/j0V90jvPmD8F6utCe1sJBwyZ
	PD4YICcrs8eTtDk147MhYVatQxwN7Ubi+B/BT84jvhYA5+9vaBAPDlYCTG64/ZEiUOycxstKq/SRe
	M+gvBiJ1Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kKIhs-000515-FU; Mon, 21 Sep 2020 10:06:00 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kKIhq-0004zt-45; Mon, 21 Sep 2020 10:05:58 +0000
Received: by mail-wr1-x442.google.com with SMTP id k15so12066131wrn.10;
 Mon, 21 Sep 2020 03:05:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=uB9lgh9yJlLcF4TAFLn2cbmVn5XoptteUACXhtU5Bic=;
 b=LRchwCbJPnQ3FfwWq6KxXaJuPvw2bpddGbkNTXelOPiv5wu8K/WyIv3DPwV0rp3xZ7
 NvPCvZnqiI6OpKif3vcyspZZLq/jFphm1Cdvg6W/ZWAZSyZty8nDm5Za0QGg3e/ccm7l
 tzgryxgODHOsy6oOMQaAVECig51STcIIfAJMYnRkENyTVDAGIDAuapFnCJJ2zHfpSSGp
 ufFdM823BArb7o+Vcm/POXm3A7fHOXfnHR6FlnU8ZJKxAeqvJgmSwJ5vSUaSZ93dJxWC
 fvcHQTjVoddHr8kcSlcuSgo9B/fiik7PgeUoTHMJ+6Q+ZBMzBwE+lNCIHacnHGf2rOnw
 u8/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=uB9lgh9yJlLcF4TAFLn2cbmVn5XoptteUACXhtU5Bic=;
 b=m3WQ748chGXVnXUAs4r/kGcOBopELTEhKY68CT4088vxy/+JNZ4ork7TWswHLcK3g5
 Cqvt4IPwyLzMC5vMJEi1y3jpOcvTJja6QPIJ7EptwkgttNS/3eOeL9RdQynSs70Be5wO
 cJMJadcU5ZaS6iVoL2QdVfW8vYX17lzwhYohDkNop0iNqQXls1WXwgmDk4viiO/n1TTO
 WrgJH1ccfxxMDr3huP9aoXNTjdPhxzzXmivq5DBpoVHKN1VJ4YgnRJD6kuswMKK96CHC
 Ztjf8nXFT3v3YMdq7eSVf2HApQty55Sw8h2JUxPSqo6/Y9Id7q/uv1zSVvLzU3fcRbuq
 uthQ==
X-Gm-Message-State: AOAM530a4FhHiQeOF5K80c+t/B91j4KpGMsQO7l1HQvYiFJCluHVBDKj
 MLjLmqj115TkkiVHfvJbymtTbkDbrApvhg==
X-Google-Smtp-Source: ABdhPJznjBjQq9Ooy+DA0/ORvc9hcl6mLcPMKwkNC+WvnFsAwgjChcVdQBOflj+aNKPJao7ewsbwog==
X-Received: by 2002:adf:f245:: with SMTP id b5mr53928403wrp.288.1600682757069; 
 Mon, 21 Sep 2020 03:05:57 -0700 (PDT)
Received: from ziggy.stardust ([213.195.113.201])
 by smtp.gmail.com with ESMTPSA id p1sm35592072wma.0.2020.09.21.03.05.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Sep 2020 03:05:56 -0700 (PDT)
Subject: Re: [PATCH] arm64: dts: mt8173: elm: Fix nor_flash node property
To: Hsin-Yi Wang <hsinyi@chromium.org>
References: <20200727074124.3779237-1-hsinyi@chromium.org>
From: Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <9ac41633-0133-b6f1-2615-adb5a7c98ed7@gmail.com>
Date: Mon, 21 Sep 2020 12:05:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200727074124.3779237-1-hsinyi@chromium.org>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200921_060558_183312_141E57AE 
X-CRM114-Status: GOOD (  19.29  )
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 linux-arm-kernel@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



On 27/07/2020 09:41, Hsin-Yi Wang wrote:
> bus-width and non-removable is not used by the driver.
> max-frequency should be spi-max-frequency for flash node.
> 
> Fixes: 689b937bedde ("arm64: dts: mediatek: add mt8173 elm and hana board")
> Reported-by: Nicolas Boichat <drinkcat@chromium.org>
> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>

Applied to v5.9-next/dts64

Thanks!

> ---
>   arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi | 5 ++---
>   1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi b/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
> index a5a12b2599a4..01522dd10603 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
> @@ -431,12 +431,11 @@ &nor_flash {
>   	status = "okay";
>   	pinctrl-names = "default";
>   	pinctrl-0 = <&nor_gpio1_pins>;
> -	bus-width = <8>;
> -	max-frequency = <50000000>;
> -	non-removable;
> +
>   	flash@0 {
>   		compatible = "jedec,spi-nor";
>   		reg = <0>;
> +		spi-max-frequency = <50000000>;
>   	};
>   };
>   
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
