Return-Path: <SRS0=7tkd=FN=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 689D1C433FE
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Dec 2020 11:49:01 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 028FF23B5D
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Dec 2020 11:49:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 028FF23B5D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=f46y3CWCoX4kPRoBRfMT+TBLClw3NIv+ELKgcVHRaxE=; b=G7zmSjUEPSSsv9fOy7wTmOuHc
	o5clvsFyp4QxvySLjqtdxYy4dXwAl5rSyhLZLwIwjQ2xfuTR4ah1zpRoEfd+gXejJDXJMwkRwVEYd
	lpZUMhBjKtTl0toFiH6E7Uj26WBrlop4IKJ6HU4bARPW41OKmSeykeNRlnlKwX+CkV3NY4Bgn0PgI
	vJdOSHeKtlB9A/80/e+MktMdhd7SCeIRQMYpAUu/qoGJHh7hNomo9fptiTpwsENoMG9aQuzKPhhFf
	K9P6VfMlwQHzutuUh22sCsVvliIrxFqi0f9/zK9q0b4hAsvRtkS226EztvdeyyJX7D1BiWibaN1aB
	0WEZkpWgQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kmxxk-0001jY-N2; Wed, 09 Dec 2020 11:48:52 +0000
Received: from mail-io1-xd42.google.com ([2607:f8b0:4864:20::d42])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kmxxf-0001hF-LW
 for linux-mediatek@lists.infradead.org; Wed, 09 Dec 2020 11:48:48 +0000
Received: by mail-io1-xd42.google.com with SMTP id i18so1355080ioa.1
 for <linux-mediatek@lists.infradead.org>; Wed, 09 Dec 2020 03:48:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=j3uGWJhYTw6GKZHD8wfKlSNKe6wdrtYdPYkKgKUgxgg=;
 b=06+rhWd8+y6iJvjo/+iWgqONBMCsCjSjihXULqFxCdI19FRSFOE1qKqDyNI8Py53HG
 x75OopikQdvCY0j75xpQhzRPu6xxO9SbOTXqDwZOBF2F5zhHfSy1TE6N+PZl82GJp6N0
 OlrM1Z2dWgOu9xL/Qc8w2WJQ2os624p0Wcfopz0R4O7uxrOFRX26z0S4U95Y21kP/1c7
 aSQ0quwz7yJMMoWIWsXn4SW75CAGDVQENl3/dfcr3Vw6CCoASlPMUbY1kKEVD9mZtsYe
 nhg5QymztkxgSfizfVJPUWcNih7BRHPPQh1ZZAr+3oncmj6CaKJrLu8Rmddc6m8z5eTa
 QcvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=j3uGWJhYTw6GKZHD8wfKlSNKe6wdrtYdPYkKgKUgxgg=;
 b=ngA1rkMaunysIiI97/iHuALri9BpUtazJMeZ43wNtxa/W+CzuthKcZ+iuH9IZ28PSQ
 LNFZWIU2KKUcIIqJj5yX8ZcgSoC2/eSKX3ngM8QrbfUT17jUV1iH5EAR8P/dJJj2dqzl
 y0FCAQcJAj1jiEad6q9TD9gflO4A9f261M53YPfhcK5MEJs3aNahGW6AVWzgJM1subC4
 Wq0MjEyzi0oncjrXMMheNt3es0MAgalOB6x9UN3X1jWFNq2eouBhYYIODHrwYKIqKV7h
 4aOtOIWGi3jJMoFGD1tA5r7PVQkxY2RD2KatWsp17jlSLCFy+50QpcjHMFgrOpxYvG2U
 97jw==
X-Gm-Message-State: AOAM5303iC6v0/Q/7MR3tyoM+rQK+ux2J/6pnpFGKQma/htwvePpOrqO
 n774WNzFsa4NJPzZQMWfOGeaLO5Ui+NwBCN65uCfFw==
X-Google-Smtp-Source: ABdhPJwbQYL5n5RxpdrD8qygMiWe+C20JC4G4yrDR2T5YkOM/MbdAUfZY6za7jqeE7Dk8OtDbfD6reyrXup+NvBRUpw=
X-Received: by 2002:a02:6557:: with SMTP id u84mr2532784jab.82.1607514525257; 
 Wed, 09 Dec 2020 03:48:45 -0800 (PST)
MIME-Version: 1.0
References: <20201209114440.62950-1-fparent@baylibre.com>
In-Reply-To: <20201209114440.62950-1-fparent@baylibre.com>
From: Fabien Parent <fparent@baylibre.com>
Date: Wed, 9 Dec 2020 12:48:34 +0100
Message-ID: <CAOwMV_xMfSV9+zTZzUgB5XYNZR0ed8J=H9G39++bBJNWiR_Ehg@mail.gmail.com>
Subject: =?UTF-8?Q?Re=3A_=5BPATCH_v2_1=2F2=5D_=F0=9F=93=A4_dt=2Dbindings=3A_dma=3A_mtk=2Dapdma=3A?=
 =?UTF-8?Q?_add_bindings_for_MT8516_SOC?=
To: Sean Wang <sean.wang@mediatek.com>, Vinod Koul <vkoul@kernel.org>, 
 Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201209_064847_798866_A12F4BB1 
X-CRM114-Status: GOOD (  13.99  )
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
Cc: Rob Herring <robh@kernel.org>, DTML <devicetree@vger.kernel.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 dmaengine@vger.kernel.org, Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Sorry, resending without the unicode symbol in the title

On Wed, Dec 9, 2020 at 12:44 PM Fabien Parent <fparent@baylibre.com> wrote:
>
> Add bindings to APDMA for MT8516 SoC. MT8516 is compatible with MT6577.
>
> Signed-off-by: Fabien Parent <fparent@baylibre.com>
> Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>
> Acked-by: Rob Herring <robh@kernel.org>
> ---
>
> V2: no change
>
>  Documentation/devicetree/bindings/dma/mtk-uart-apdma.txt | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/Documentation/devicetree/bindings/dma/mtk-uart-apdma.txt b/Documentation/devicetree/bindings/dma/mtk-uart-apdma.txt
> index 2117db0ce4f2..fef9c1eeb264 100644
> --- a/Documentation/devicetree/bindings/dma/mtk-uart-apdma.txt
> +++ b/Documentation/devicetree/bindings/dma/mtk-uart-apdma.txt
> @@ -4,6 +4,7 @@ Required properties:
>  - compatible should contain:
>    * "mediatek,mt2712-uart-dma" for MT2712 compatible APDMA
>    * "mediatek,mt6577-uart-dma" for MT6577 and all of the above
> +  * "mediatek,mt8516-uart-dma", "mediatek,mt6577" for MT8516 SoC
>
>  - reg: The base address of the APDMA register bank.
>
> --
> 2.29.2
>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
