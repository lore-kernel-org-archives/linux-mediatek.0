Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3537EC43334
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Jun 2022 04:56:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KpXbLIy5zhrU3bCyLyxp3GlPQhSY0YMCjiyAvULuoXg=; b=Q6I04Hjt+VqL2K
	cq1edWresmVXckjdfxELpDNs0LtdqFm6zi/xMebvIdnznKoW0ZcmHF6HD9PGrqFKJot+oQVnscoxo
	f9bM0DgW8cabRuGXyt5DZ1hjMj2ZHUg1+wM5PfUmXkw85x1LPICe1K8HfmYQegUnr29xrcTsqEWHh
	clHe7sYOpw4I4R/PWuvywN5YBYDm5TRtPIxB4hN2AxtpkTGgMWMq4LUx/QR5rkA04gEWyIx3dXIJp
	8Kb/JiMu9HPRJ4xzp4m2/fh8FnFDVtVkXKZqFGXmtBLY+M4eSIAN2Ez0sWrd6rGVRf/HsAE8j82Tk
	ZMCRBrpjTmpAt3V8J0/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyRG0-004hRP-IO; Tue, 07 Jun 2022 04:55:56 +0000
Received: from mail-oi1-x231.google.com ([2607:f8b0:4864:20::231])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyRFp-004hN5-Hx; Tue, 07 Jun 2022 04:55:46 +0000
Received: by mail-oi1-x231.google.com with SMTP id l81so7046608oif.9;
        Mon, 06 Jun 2022 21:55:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=2211zWwQvbcPN7vdSNJ04+hIY6NzzlbGtJIuGZkSz00=;
        b=IOL0TRCfqdzC90Ys8X4dMh0qui/ckanQGO6ak7TANlght56IvkwFGcRCKDSvruzRCk
         2/GwrDL5ZiV7glEjgRu17tLjaW6/m465fq/zLgU55Zy9BoGciIjprTniWx0v4r94pbY9
         SG+VVSa+AgT/7LyoJaV+MN4+mWwupPzxIB26/ObWWoC0LMowsCwarXLgdWwb56AbxBGZ
         3pHTGi31zf/7HQwpERFCg7+G0sig8bmx0MXBzmgY/sg9fyQWGt1YbERDLUXb2L3Of7WK
         7Mh68W1Q7kj/GXnwTQFb7OuhRFt0Sqg76mcwCEgNIwK629e3JNVMJqJvr5w6GT5d5oEH
         yNoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2211zWwQvbcPN7vdSNJ04+hIY6NzzlbGtJIuGZkSz00=;
        b=Ni9nNoFMVKTPwl/coxT7wOCe5tsjMfqWlTosnchaXoGSUMmM+JNJ9jX4xrW/tsaA88
         LXDFfQVdJPGmPMQDFADrBkfS9l2j2zWxR0J63np+t/xZMQmYYDlxSx+ld7wluVYnXowC
         xF18gDG3e9SdFxPTAUj06g8M1uvfroeJcdVYt3EY80RTzVxxBuThc1ORiOq8h88hyw//
         zTEfJGrfREGwwaorkKxSY/j8ZllxHwGUiWeEz3Rd1y66k+egWFlnZ6KZXxKH5cAbuU9c
         TcLYoSIhm8SrVmHSHYWTsbHLLV/VLt8h2OPg6Pz0gKmCfTA1Vj0T6CiUx69Oe84pzEvz
         uheA==
X-Gm-Message-State: AOAM531sffArcJXQP763etVemIhmSumw8KTegyCy5ZXdzoG7ZYIl0bGA
	XHg7rGKAZkXoM3sqhEejpdBupMvYjmJR+ARi1Kc=
X-Google-Smtp-Source: ABdhPJyMINfZsSWQuDY+tdpS3uwFQEf7ov+suuod63s6UXkz60pqt1xhAqQKsZM6fAypZIKLFnPoowS3vhPWD0hg7fY=
X-Received: by 2002:a05:6808:171c:b0:2f9:c685:f4d9 with SMTP id
 bc28-20020a056808171c00b002f9c685f4d9mr16344983oib.21.1654577742369; Mon, 06
 Jun 2022 21:55:42 -0700 (PDT)
MIME-Version: 1.0
References: <20220606212239.1360877-1-robh@kernel.org>
In-Reply-To: <20220606212239.1360877-1-robh@kernel.org>
From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Date: Tue, 7 Jun 2022 06:55:31 +0200
Message-ID: <CAMhs-H9kXsjipHbCXt--yKhNSohDHDiZrUgb04=T4dhTpda4=Q@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: pinctrl: ralink: Fix 'enum' lists with
 duplicate entries
To: Rob Herring <robh@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	"open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, linux-arm-kernel@lists.infradead.org, 
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>, 
	linux-kernel <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220606_215545_648165_8401E1B3 
X-CRM114-Status: GOOD (  12.11  )
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

On Mon, Jun 6, 2022 at 11:22 PM Rob Herring <robh@kernel.org> wrote:
>
> There's no reason to list the same value twice in an 'enum'. This was fixed
> treewide in commit c3b006819426 ("dt-bindings: Fix 'enum' lists with
> duplicate entries"), but this one got added in the merge window.
>
> A meta-schema change will catch future cases.
>
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>  .../pinctrl/ralink,mt7620-pinctrl.yaml        | 26 +++++++++++-------
>  .../pinctrl/ralink,rt305x-pinctrl.yaml        | 27 +++++++++----------
>  2 files changed, 28 insertions(+), 25 deletions(-)

Acked-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>

Thanks,
    Sergio Paracuellos

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
