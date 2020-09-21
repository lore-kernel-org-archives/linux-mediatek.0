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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C4C9C43463
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Sep 2020 10:04:56 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D638B21D91
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Sep 2020 10:04:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="saEMM1Gj";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="feXCk+RY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D638B21D91
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=UhN/sRsQfC21u8e/4UScd+3cSVNFr1xVsjCnr52r/0Q=; b=saEMM1GjIC6+gzB4R4ptqzFNY
	HRkadLXy2/ssxB1HlQvyNxt/aD2JGriyFolM7+qKe0pJQHDcDNTvERQ32w/kie2PArViAjf5x3qVU
	F3VoPJNDPkD3VlW/3tO6InGEVnc7GGUDTtyDinO4vUeuwy7Y8W1lf+uU3/cwfFjEjaRUZfQWdwa+e
	4rR3t2rJ1/Q+2keUGoHJafbJCgLw+aTID6/IbVmKNzrgDWz55wobkW7AXFpm8GN5Q7DCNocOWa2yP
	6NFAbJrQkRtzA+6DhDLdl5uMFyKuFLPq8p7wdJFtOMcY6ob7jZRTOg9J2ZC20KdXlZywEmNS8AZ8U
	CKhNa/MAg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kKIgi-0004lV-If; Mon, 21 Sep 2020 10:04:48 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kKIge-0004kR-Pk; Mon, 21 Sep 2020 10:04:45 +0000
Received: by mail-wr1-x443.google.com with SMTP id c18so12069508wrm.9;
 Mon, 21 Sep 2020 03:04:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=UkuH/WWP5BM2+/HjFiAZ6z/l7IuHecE85iZQkNm/w4E=;
 b=feXCk+RYG8aagpwCWUKrBf5bu0pOD+rXTbio6MrX74CO7k3r/KWMqCta7XbsOmjON5
 wOm/xLi4/wTOU51UQ6AvYik5TSds1ylXsBOCy7ha6l4Bt4M6SiAO9BKGeIWkevRFI7kQ
 mgIEYC8kwG1RB6D4kiE10tx871uAGkH1V6MTDIIeWX2rl7pLUW1bgnl+NlbOYfzLDUas
 B5Cy3gQ50wXh2qOnksL3gJL/Ujdeo2hyO7Lv1xNLi5HBH8VvVjo3Q3X7IqD8+H0K0/R0
 qJITPaGA+d3JXjETXHKW4wK/vPoO930uvrtyyDKK5wbLbB8G27IEYFtI9GQpcpWDxfm4
 eibw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=UkuH/WWP5BM2+/HjFiAZ6z/l7IuHecE85iZQkNm/w4E=;
 b=aBq8dfGcLRXCr2BBKjlgPqU/h1mcFayr+IS4TmFa6dY2Z6fIwrz8gHfMrOBo52K6xo
 JNEyvQ4FxxahRz9kixGIM+jTFpfCHm0sg3TYyyxDOcF5wRxReeZ/6joVODLo7bp9KIia
 Tw1oRBdi5IF1OpeKIP4uF2fY+/FYWB5rWMu3BRlMzmVZVP3Ddv980mM+qEFnyQGlW9VD
 htMd/PKawhmk/CZoEGATDQIJQz+M9FmCaRc8eynO93JrqUxxL0ULc41fMO9miJTyL0eO
 HSVFcEPo5ygWGh0Um1iuktMn/x87Zs1C0C17mS3fX3mvZpKtWwPC0ejFdx5Cfoz1CAMo
 Ucsw==
X-Gm-Message-State: AOAM531gB91hySDUwgaPrstKFkeWWIL15CG6QyUkXP0Qs4/2xx5XC/65
 eDhn4PGj11i1RjOdEbknpOc=
X-Google-Smtp-Source: ABdhPJxpykmsqM5GSWO6ureL2EshNJp7ZQNhv3665VbXJ7PZglq45TWDJTqLgbCKs4hA13A2IaFJ6w==
X-Received: by 2002:adf:ea0f:: with SMTP id q15mr36632145wrm.371.1600682683621; 
 Mon, 21 Sep 2020 03:04:43 -0700 (PDT)
Received: from ziggy.stardust ([213.195.113.201])
 by smtp.gmail.com with ESMTPSA id n3sm2582093wmn.28.2020.09.21.03.04.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Sep 2020 03:04:42 -0700 (PDT)
Subject: Re: [PATCH] arm: dts: mt7623: add missing pause for switchport
To: Frank Wunderlich <linux@fw-web.de>, linux-mediatek@lists.infradead.org
References: <20200907070517.51715-1-linux@fw-web.de>
From: Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <ae04ff83-f9f5-ecb0-1221-854d21fc9cfd@gmail.com>
Date: Mon, 21 Sep 2020 12:04:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200907070517.51715-1-linux@fw-web.de>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200921_060444_864532_301D9289 
X-CRM114-Status: GOOD (  18.11  )
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
Cc: devicetree@vger.kernel.org, Landen Chao <landen.chao@mediatek.com>,
 Qingfang DENG <dqfext@gmail.com>, Sean Wang <sean.wang@mediatek.com>,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 Frank Wunderlich <frank-w@public-files.de>,
 =?UTF-8?Q?Ren=c3=a9_van_Dorst?= <opensource@vdorst.com>,
 Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



On 07/09/2020 09:05, Frank Wunderlich wrote:
> From: Frank Wunderlich <frank-w@public-files.de>
> 
> port6 of mt7530 switch (= cpu port 0) on bananapi-r2 misses pause option
> which causes rx drops on running iperf.
> 
> Cc: stable@vger.kernel.org
> Fixes: f4ff257cd160 ("arm: dts: mt7623: add support for Bananapi R2 (BPI-R2) board")
> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>

Applied to v5.9-next/dts32

Thanks!

> ---
>   arch/arm/boot/dts/mt7623n-bananapi-bpi-r2.dts | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm/boot/dts/mt7623n-bananapi-bpi-r2.dts b/arch/arm/boot/dts/mt7623n-bananapi-bpi-r2.dts
> index 2b760f90f38c..5375c6699843 100644
> --- a/arch/arm/boot/dts/mt7623n-bananapi-bpi-r2.dts
> +++ b/arch/arm/boot/dts/mt7623n-bananapi-bpi-r2.dts
> @@ -192,6 +192,7 @@ port@6 {
>   					fixed-link {
>   						speed = <1000>;
>   						full-duplex;
> +						pause;
>   					};
>   				};
>   			};
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
