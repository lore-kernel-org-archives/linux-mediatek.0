Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A72C2C6FD1D
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 Mar 2023 10:51:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:To:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qswG2/ZBW7aTCsKI3gXz0TlSSCCucbrgwXXHtDYCg7M=; b=iBriw6kqQj6zqjyPbQHFLaEEjE
	MWZNoxYcS/2JUQZj+uk/3JXjsl13chjFADg3IOmEWqktOSiH1h1bt320xOAypP7Z3XNrxAvcSE43x
	cTRE/f6+zHeWptC3LGMITzolvI9bLzaxBjGCAP++spm8n7XxDFHSqyU1he+4g2s7MAx+9uWEYsQET
	YxMs2+vHyEXAfjSNFrPImDgSC092iPvsHUJnpnM1XD/VXeHyqneYS3QvoOV0C28dt3cqWDNko+c65
	XS6wEa/XhOWOCwY5W3SRQwsfJSYkXH9eHk3OSdDf04RNYdyvU7qYSAQg9Ae4JdjbYT6G8qLFIOYjD
	rPjVKlbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1peZam-00C6WL-0E;
	Tue, 21 Mar 2023 10:51:48 +0000
Received: from mail-pl1-f170.google.com ([209.85.214.170])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1peZaj-00C6V8-1M
	for linux-mediatek@lists.infradead.org;
	Tue, 21 Mar 2023 10:51:46 +0000
Received: by mail-pl1-f170.google.com with SMTP id o2so8147409plg.4
        for <linux-mediatek@lists.infradead.org>; Tue, 21 Mar 2023 03:51:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679395903;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:to:from:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=qswG2/ZBW7aTCsKI3gXz0TlSSCCucbrgwXXHtDYCg7M=;
        b=oSLYhIt0o5wPqCkyqD6i09hZpw8rla/tx56Ed2UHxwEbgub+qraRN4vMk46bJc/Efu
         W1JPMUP2boXNBTxwdRmucasSxBvqukmKuHCP5WDVO2cfour0Ab5rDR4FGyuMYB71jykw
         PtR0iqgRGi7wChNj4fGSZ/FfiFAdTaO+vzAQZvHICu/NT0Up3n7Jxt9zdfJltJMeWbE/
         dhOXYIqGzmcw3PyiPAv6jup9A2CHn4xieYs4UD2zW8qpP8cJgA7I6NHJuVCXZLVyhKSQ
         tI7Ja1MfJe0RzFGqbp2VnkuFIeiS4zBX9uN5ddszObGbfJd1JtYBedy7Yw3tTXFg2zID
         VANg==
X-Gm-Message-State: AO0yUKWr05+LZv6foNF1hhWuaaVV4t5jUXR557MnH9VMEXqC9e1wwvHs
	73f23x4s1M/CxLgG+wsxvqrdkpgUjh4s/SbGHetwRg==
X-Google-Smtp-Source: AK7set/9jppZ/8fvwHpwmrSJGSCQmBWnfdRTrTdLhtDmmxg2bsp/b1grQinpEEOPKC3NJrRBf73Yag==
X-Received: by 2002:a17:903:3092:b0:1a1:a706:5df3 with SMTP id u18-20020a170903309200b001a1a7065df3mr1614761plc.15.1679395903364;
        Tue, 21 Mar 2023 03:51:43 -0700 (PDT)
Received: from localhost (63-228-113-140.tukw.qwest.net. [63.228.113.140])
        by smtp.gmail.com with ESMTPSA id g2-20020a170902c38200b001960706141fsm8408525plg.149.2023.03.21.03.51.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Mar 2023 03:51:42 -0700 (PDT)
From: Kevin Hilman <khilman@kernel.org>
To: Bernhard =?utf-8?Q?Rosenkr=C3=A4nzer?= <bero@baylibre.com>,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-serial@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, angelogioacchino.delregno@collabora.com,
 matthias.bgg@gmail.com, gregkh@linuxfoundation.org,
 krzysztof.kozlowski+dt@linaro.org, robh+dt@kernel.org, maz@kernel.org,
 tglx@linutronix.de
Subject: Re: [PATCH v11 3/3] arm64: dts: mediatek: Initial mt8365-evk support
In-Reply-To: <20230309213501.794764-4-bero@baylibre.com>
References: <20230309213501.794764-1-bero@baylibre.com>
 <20230309213501.794764-4-bero@baylibre.com>
Date: Tue, 21 Mar 2023 03:51:41 -0700
Message-ID: <7h8rfqwf5u.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230321_035145_476051_641E4F12 
X-CRM114-Status: UNSURE (   6.52  )
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

Bernhard Rosenkr=C3=A4nzer <bero@baylibre.com> writes:

> From: Fabien Parent <fparent@baylibre.com>
>
> This adds minimal support for the Mediatek 8365 SOC and the EVK reference
> board, allowing the board to boot to initramfs with serial port I/O.
>
> Signed-off-by: Fabien Parent <fparent@baylibre.com>
> [bero@baylibre.com: Removed parts depending on drivers that aren't upstre=
am yet, cleanups, add CPU cache layout, add systimer, fix GIC]
> Signed-off-by: Bernhard Rosenkr=C3=A4nzer <bero@baylibre.com>
> [aouledameur@baylibre.com: Fix systimer properties]
> Signed-off-by: Amjad Ouled-Ameur <aouledameur@baylibre.com>
> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
> Tested-by: Kevin Hilman <khilman@baylibre.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com>

Tested (again) and things are working well.  This is the last patch
remaining to be merged.  As soon as this lands in linux-next, I'll add
this board to my KernelCI lab.

Kevin

