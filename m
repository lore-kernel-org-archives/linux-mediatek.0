Return-Path: <SRS0=qDs2=CS=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.6 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12798C43461
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Sep 2020 09:43:11 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A67CB21973
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Sep 2020 09:43:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="oJjO+6J4";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kevpgpBe"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A67CB21973
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=uHmEoSEAvdS/q8py13SAdotv8fbWTlNSq3YrJcs3gK8=; b=oJjO+6J47RezRUUgVHj/hDLv+
	mES3mAGMbFQWu8T93nUgIGzsRm4VSSjK//wayy3mblkRdt8kCFzzYfKy0VE1u181cclWj8vxeMhdf
	Hc529I9Cl7dqJHwgrSxjR59vvRnczbuyltIx2jfp3Hv6oJ4qfYkHV/xt18n350LJOAFJeIxw35Bli
	wV5/nBWy3Dg6+ZHuGdHlcaF30k6/WnkrCNHQaDU23xqP8ef1vBQ2Cury7V+I9qN4NprGlQnUOWz4a
	woevBxx07e6Zvm5znGk4CDeARnUptiwPZyU1cuzr+QgTPG1NYBkRbqUls+r6avceUcJ3pU5Zb+Mkv
	Pe832lG5w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kFwd2-0001JX-Ee; Wed, 09 Sep 2020 09:43:00 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kFwco-0001Bb-4O; Wed, 09 Sep 2020 09:42:47 +0000
Received: by mail-wr1-x444.google.com with SMTP id g4so2199348wrs.5;
 Wed, 09 Sep 2020 02:42:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Z8RXnpnyBMjt2Rl+qFLfs99Rgx6FHbwDsstUMymIPBQ=;
 b=kevpgpBezl8qGbV7RG2kxXNWEHlnYbeaRmCOmICumPajZr750haas/HIHumLtfoXR7
 5LMTicH6uqLvsYFaD+KcKHT1vcw1oblYbClP7dRMaZHUQ2bSWj+8v3uy4TtjfyichXOD
 utx2VaZh6zLD6xYSXMhvcBl4ufAFx/i1sehZpNvq1sFN87WKO+HRtMe5qbH6vlCCQCVN
 FOfUeUPiuwpuRDFLs9fg71niN3SYxz6dPtHwUn0PM/1pA+x1Q8PgbACwbo2ViPSul9ho
 NYXW6JjPvcnTqJfQrr0CSR8wbilkQCwYwJaARAQ8PN31FkK0fBz/2r3/yP92ShtMeyJV
 nk6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Z8RXnpnyBMjt2Rl+qFLfs99Rgx6FHbwDsstUMymIPBQ=;
 b=nQv5r3u+j2kppusUZ6z0PpgHVYov7sh4Y3PrbIJwcPGCVH+yvCZn419w4RiJMt1mq8
 Rn2434Wklv7Z+GBGQdygtK+6RHkLXrPzY/+iWOE9kCgvs21wxALrZd+P+vbuj07BUU3B
 lMfMwBjSSvW5RgFt19QLnZKYErQxLqzSiKm/H2tA8hYiQ2rMaBQU2EiJ5Q7qdU8ao0uK
 fd3losB8ED/0JPoZ9Y6HgQ/pqWOKUg3biRTRVSCQvWXV9IKd0CA6su/87kcqKOfI12At
 dtDFiASffFolSdfLkxim6b+4FEgn1Y0BRJDsMiSayOwNrhjQEhTsq3t950tp6bpwudjV
 zrQg==
X-Gm-Message-State: AOAM533VB0NRxfvkgcEBQo+sXzjSToneZemx1N9y12JwQv2Wg2+EjkE/
 8Dmp4Uzux30biV+NQ6JglxA=
X-Google-Smtp-Source: ABdhPJyxx21J8UyPGAPaHM/8Ki6ecXPVaEM7uV8gatmLfxzs69Jo48V5cXIPhGqgMe+/DzTyxE7C+w==
X-Received: by 2002:adf:ba83:: with SMTP id p3mr3217999wrg.246.1599644565115; 
 Wed, 09 Sep 2020 02:42:45 -0700 (PDT)
Received: from ziggy.stardust ([213.195.113.201])
 by smtp.gmail.com with ESMTPSA id m185sm3201670wmf.5.2020.09.09.02.42.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Sep 2020 02:42:44 -0700 (PDT)
Subject: Re: [PATCH v6 4/4] arm: dts: mt7623: add lima related regulator
To: Frank Wunderlich <linux@fw-web.de>, linux-mediatek@lists.infradead.org,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>
References: <20200904110002.88966-1-linux@fw-web.de>
 <20200904110002.88966-5-linux@fw-web.de>
From: Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <b893cbdb-2011-88a4-dd57-3ea82cde08d8@gmail.com>
Date: Wed, 9 Sep 2020 11:42:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200904110002.88966-5-linux@fw-web.de>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200909_054246_294206_BCF6DE6D 
X-CRM114-Status: GOOD (  18.04  )
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
Cc: devicetree@vger.kernel.org, Ryder Lee <ryder.lee@mediatek.com>,
 Alex Ryabchenko <d3adme4t@gmail.com>,
 Frank Wunderlich <frank-w@public-files.de>, Sean Wang <sean.wang@mediatek.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Kishon Vijay Abraham I <kishon@ti.com>, Rob Herring <robh+dt@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>, linux-arm-kernel@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



On 04/09/2020 13:00, Frank Wunderlich wrote:
> From: Alex Ryabchenko <d3adme4t@gmail.com>
> 
> GPU needs additional regulator, add it to devicetree of bpi-r2
> 
> Signed-off-by: Alex Ryabchenko <d3adme4t@gmail.com>
> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>

Applied to v5.9-next/dts32

Thanks!

> ---
>   arch/arm/boot/dts/mt7623n-bananapi-bpi-r2.dts | 13 ++++++++++++-
>   1 file changed, 12 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm/boot/dts/mt7623n-bananapi-bpi-r2.dts b/arch/arm/boot/dts/mt7623n-bananapi-bpi-r2.dts
> index f41f221e56ca..826912545ef1 100644
> --- a/arch/arm/boot/dts/mt7623n-bananapi-bpi-r2.dts
> +++ b/arch/arm/boot/dts/mt7623n-bananapi-bpi-r2.dts
> @@ -79,6 +79,13 @@ reg_5v: regulator-5v {
>   		regulator-always-on;
>   	};
>   
> +	reg_vgpu: fixedregulator@0 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "vdd_fixed_vgpu";
> +		regulator-min-microvolt = <1150000>;
> +		regulator-max-microvolt = <1150000>;
> +	};
> +
>   	gpio-keys {
>   		compatible = "gpio-keys";
>   		pinctrl-names = "default";
> @@ -283,6 +290,11 @@ &i2c1 {
>   	status = "okay";
>   };
>   
> +&mali {
> +	mali-supply = <&reg_vgpu>;
> +	status = "okay";
> +};
> +
>   &mmc0 {
>   	pinctrl-names = "default", "state_uhs";
>   	pinctrl-0 = <&mmc0_pins_default>;
> @@ -402,4 +414,3 @@ &u3phy1 {
>   &u3phy2 {
>   	status = "okay";
>   };
> -
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
