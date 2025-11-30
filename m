Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6819CFD376
	for <linux-mediatek@archiver.kernel.org>; Sun, 30 Nov 2025 06:20:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sGhdmqu2vDJdYvpv29T3Uwo4nDJRMdKfogH8RLeMRKM=; b=LsKXwLoxrJsth2p/G1vHNlTH3n
	utcuHpelnXBVIdMghblhBTFIuf2SgKDleDpFDpk2RzOmlOJN0T3prgdukXyFm6w9PRxrMetETbZD2
	ZtfR1jc1/tOf/Axs66zNKsL4SmK2xw4p9Zmak3oqxCz5kjlPXnxuKvbveJnoBOn1Hm2B+0TfydFgG
	3H5wMY+iQAcKIQWpWHm/nHEL+Uw4ZPPKRwIW+vPr3QljNx7DiffJUctpQjSCW8YvGVkxKWxKrPjom
	Qtpu0mRuOUBeTZrdO3t5Zdf0FEOTcTztrXRk4Erl4dtMxi6ZGnY0iwFPo1A70hUMMl1reVlNT6aN1
	mOIhA4tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vPan0-000000025Zq-1g68;
	Sun, 30 Nov 2025 06:20:06 +0000
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vPamo-000000025Yl-223k
	for linux-mediatek@lists.infradead.org;
	Sun, 30 Nov 2025 06:20:04 +0000
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-59445ee9738so2512691e87.3
        for <linux-mediatek@lists.infradead.org>; Sat, 29 Nov 2025 22:19:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764483592; x=1765088392; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=sGhdmqu2vDJdYvpv29T3Uwo4nDJRMdKfogH8RLeMRKM=;
        b=Fz4rtCKnmynpu8GggizAQQrjoXDbGtYLrIISj16eevCeNBzQ+7MpJ10W8Xaf1K6uJI
         rLzmUcvyOth610T9OCGMVYHsS62KCXYqUdK4Wel9SPtZbAeErP16q/n33W3RzCYLDENh
         GN6Ujl8hUZ6JKrtbGXPjLVnt3LosOq0MskbjdM1hvO2MM/fKdH89J4LJOH/HE+AiPx73
         rLC71XU2hn2LiuAqw9edFxnDRahZFSlatOdr9X+MiMBqX6PrF6dmA5/NL9SDJdFJqeRf
         4WYzcg/S+WAi4s15sBXojhKDzhNtuvLmr+XU6K+w2SOGwuAd4UfrZ+VyVtZrTA5JqVFp
         DFQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764483592; x=1765088392;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sGhdmqu2vDJdYvpv29T3Uwo4nDJRMdKfogH8RLeMRKM=;
        b=BCWTF1QNIhXWacrQV8RQQfVPGlZWE1HyQ7yKlDYFdL0ST/2+8j6/1hf9245cPrUt4W
         7THiT9Arfrh9+LLTFMKHnTsP7LqWhg5hf+AHZs98VocVOHEj2IZGnSZll4PuB7yxDPTW
         kqLwVOFAuT5zXq3S6CUAjgDmYnYwX3dV3owajd86zkAMc+VoPDFCWcl2E76tH/LBqEyV
         3WDF3XJhG/EIvttyrIWySY3qLyj8VBrl0lkGdkg+rKGeDAtHCI/yerznUj+Lp1qgZFbu
         geiJKaS17ZMPBJL0IM0J0OGuXEzi7eqFsGSZ3KDKds+sfA/mSFWfnPe3T5x+vGfJPJBF
         hCMA==
X-Gm-Message-State: AOJu0YxuY0CA3lYcvav0wxX433hKo+gPrVGeK6k43A+bqNWFMlUYKAnL
	Vd6u3wN8KrXs6OfUx7gBv3fDhXEO4T68Rlzxe8Fcm+ZH+NThCbdnXzAS4AANR5Y+X5z7eaKjfrK
	4dXDs/TQvwcvfoslTtHviDF+LB2VdZJ4=
X-Gm-Gg: ASbGncuoE8ak9JGo0ilUY8hHtqNfVh/pqIXzDOAPhrlcMrtmyWnWyYx3yxrlu8lad8U
	zxDgbOzIbrgF8Our0jSEsQU0M/+6JJpc8jOcola+7sAxrd+w+HN+T+7qKzIhUf9NaPvwdZ3xds8
	doc5t+KEQuGz5+2TTcxk0QBZX8nOA5+4Ri4NgDb5pefbFSLI004eOQpGTlNLuB79MK0JKb768wz
	wWF92p/z3b9gzlmFgoFc6zK9SpM70nCyHI+XmQuoGTNMLUC+yY+0l/cNlQ9BDIuA/SLkdE=
X-Google-Smtp-Source: AGHT+IH2MO88uScxHMDf4tuCIJ0inMzI8LHCRFJ99as4ydVsVd0gxL3pNkpLASlnUmvk3UX5aKHdaBU5Ofumb8OBKCU=
X-Received: by 2002:a05:6512:2353:b0:592:f115:292d with SMTP id
 2adb3069b0e04-596a3e9fc81mr12809517e87.6.1764483591650; Sat, 29 Nov 2025
 22:19:51 -0800 (PST)
MIME-Version: 1.0
References: <CAAq5pW8q6V7x6qpYnE3xB99nVwE363keGiu+Jax0_zqPjogULw@mail.gmail.com>
 <CAAq5pW_saBZ+52zz2FYTt9SuWXj2KwX2Ld7AggVKAzca2m0Oow@mail.gmail.com>
 <CAAq5pW9o3itC0G16LnJO7KMAQ_XoqXUpB=cuJ_7e3-H11zKd5Q@mail.gmail.com> <CAAq5pW8-j6UzruT=SU05QgJ1AjLXeUwASLJ3O3SVKttaMbdTXQ@mail.gmail.com>
In-Reply-To: <CAAq5pW8-j6UzruT=SU05QgJ1AjLXeUwASLJ3O3SVKttaMbdTXQ@mail.gmail.com>
From: Evans Jahja <evansjahja13@gmail.com>
Date: Sun, 30 Nov 2025 15:19:40 +0900
X-Gm-Features: AWmQ_blI2ZZ1miUiA1xU7_l8uXC2UgmK51gDMeqlxRs8s6ycdOTn1lyROifxPJw
Message-ID: <CAAq5pW-PLFuUVa9t_gmzhcrMsNRTruh7cD5-i5OPHp0zYfdFHw@mail.gmail.com>
Subject: Re: [REGRESSION] mt8183-kukui: dts: changes in dts caused display to
 no longer initialize - Was: Re: mt8183-kukui: drm/mediatek: dts: Invalid
 display hw pipeline when probing mediatek-drm
To: "angelogioacchino.delregno@collabora.com" <angelogioacchino.delregno@collabora.com>
Cc: linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
	matthias.bgg@gmail.com, regressions@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251129_221954_552303_04DD9E9C 
X-CRM114-Status: UNSURE (   2.72  )
X-CRM114-Notice: Please train this message.
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

#regzbot introduced: v6.17..e72d63fa0563
#regzbot monitor: https://bugzilla.kernel.org/attachment.cgi?id=308962

