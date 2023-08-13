Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF742C001DE
	for <linux-mediatek@archiver.kernel.org>; Sun, 13 Aug 2023 19:09:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O/QpMYkfVylryD6M2iD+mLrIio7qI2AYgvZNai1CJhk=; b=V8Kqh04FXB2USG4WGDfSLVONe4
	6jHbAbvSmWaBb5Juc5+oUo9A+m6LDsKoMC8eEZQsMH7Bpu9CVbmtpfDA84pXOwOrQADIn+0q9tznh
	sI9MgV8xUayHBMl0KAa/IIkjueQzHjzVievt3NtF4SrZzealiUJ3707A0r55fXjxx5iGQekpEZIer
	P/P9HxjqalfUb1C6VH9Jwy7pi2Mk+NQFrwlgnvKh/nm+FNABz4m3xGxa9CN6k1U24+oUXNdOyDHOa
	s2vcn/2xMTFNiOr1WCsLXrqhMHZ/cv9YkF8tmHPnzDCNglQG3LdX3D5MSBCY9r8bpyvc0dgzdkR/6
	rvzJn89w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qVGT1-00FbZV-2Y;
	Sun, 13 Aug 2023 19:09:35 +0000
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qVGSz-00FbYM-2N
	for linux-mediatek@lists.infradead.org;
	Sun, 13 Aug 2023 19:09:34 +0000
Received: by mail-lf1-x12f.google.com with SMTP id 2adb3069b0e04-4fe1489ced6so5763836e87.0
        for <linux-mediatek@lists.infradead.org>; Sun, 13 Aug 2023 12:09:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=shruggie-ro.20221208.gappssmtp.com; s=20221208; t=1691953771; x=1692558571;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O/QpMYkfVylryD6M2iD+mLrIio7qI2AYgvZNai1CJhk=;
        b=soOd+1vSrhK2mf/08qrspicdh90zc4DlbhYi/wPIXH6/6MoCB0kYnhIMcELA64rPSZ
         iDzaJnKDRzAvJcl2plGatNlfW5j7ecuZuV4ZDc2a8tO8dsxarEZYa/W8Fr4aTwlWnI+F
         idjkzpdkBYp4cMm1hBSJI8Pwg4GAmZnPLIcN+vVa0v1TwcTVPjXf0koweN72zf7vtrRJ
         gQjTIQj9CPzFUSXUlMLGlR2LQb9ktm9zgDEhOKQOxIwy6mLR4purJeJYQ8iaLgwSPiSN
         x8wyRsYOEHUopNOLPablk6b2ncpow9hG7S8OIy+Wrh4zXltRRTiXWxHsiNcdCA/UA99b
         hIFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691953771; x=1692558571;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O/QpMYkfVylryD6M2iD+mLrIio7qI2AYgvZNai1CJhk=;
        b=ILbA20XLq80jvcr4Ju2QYxp2v96wkQxA+/JszQK+j3Me2UxpvN+tcbIw9HhhRxX6qj
         9VkiyswzmsSVj2PHdSuS/qrznmcXhLZmemvivvlrYRbnsxMo0Def7bZl9USckfRZb2On
         6iXwy/ylIuQb+XskQ+ATdiRLzshE+MoRFKJm/bsgYZ2RiUKC07xZKciJonH+f+zAOVuw
         +BaitGWiB1riOlB+isVIbRJMgUEf1GZ5Lu3wwei/93w9IRKagDbc+FhyfYDhCgFVaiSS
         /W79O3ncT58q8y4XU4UpcRRl1dhSWtz9VGzqUnJ90n/RHVnwVUgq5yO52wtJVpjLfti6
         LYsA==
X-Gm-Message-State: AOJu0YzwmUvrJkhFT+3+boV/pP/LMrmI7ZPnr7cUJvIGDslOGxj359/E
	xM9ODPzjym4jzT5oTLONVEprj/adAFZ7mf+nOpcw7Q==
X-Google-Smtp-Source: AGHT+IFlUyxaaLEci+vedVpOU8DF0eK43GJvsF1qRq+YiT52L6g7e/7RILrtTfKINodPhJ3JYwkCwV8j+PIEdkhs1WE=
X-Received: by 2002:a05:6512:1cf:b0:4fe:5680:db1f with SMTP id
 f15-20020a05651201cf00b004fe5680db1fmr4523365lfp.53.1691953771228; Sun, 13
 Aug 2023 12:09:31 -0700 (PDT)
MIME-Version: 1.0
References: <20230811192847.3838-1-aboutphysycs@gmail.com>
In-Reply-To: <20230811192847.3838-1-aboutphysycs@gmail.com>
From: Alexandru Ardelean <alex@shruggie.ro>
Date: Sun, 13 Aug 2023 22:09:20 +0300
Message-ID: <CAH3L5Qr1SCXq_Uiz=dn1u49So0Jey0r8XqwRg7GcjgcCs31orA@mail.gmail.com>
Subject: Re: [PATCH] thermal: mediatek: auxadc_thermal: removed call to platform_set_drvdata()
To: Andrei Coardos <aboutphysycs@gmail.com>
Cc: linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, rdunlap@infradead.org, 
	void0red@hust.edu.cn, daniel@makrotopia.org, bchihi@baylibre.com, 
	aouledameur@baylibre.com, angelogioacchino.delregno@collabora.com, 
	matthias.bgg@gmail.com, rui.zhang@intel.com, amitk@kernel.org, 
	daniel.lezcano@linaro.org, rafael@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230813_120933_781403_E8A67865 
X-CRM114-Status: GOOD (  15.53  )
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

On Fri, Aug 11, 2023 at 10:28=E2=80=AFPM Andrei Coardos <aboutphysycs@gmail=
.com> wrote:
>
> This function call was found to be unnecessary as there is no equivalent
> platform_get_drvdata() call to access the private data of the driver. Als=
o,
> the private data is defined in this driver, so there is no risk of it bei=
ng
> accessed outside of this driver file.
>

Reviewed-by: Alexandru Ardelean <alex@shruggie.ro>

> Signed-off-by: Andrei Coardos <aboutphysycs@gmail.com>
> ---
>  drivers/thermal/mediatek/auxadc_thermal.c | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/drivers/thermal/mediatek/auxadc_thermal.c b/drivers/thermal/=
mediatek/auxadc_thermal.c
> index f59d36de20a0..99a1c35c68e7 100644
> --- a/drivers/thermal/mediatek/auxadc_thermal.c
> +++ b/drivers/thermal/mediatek/auxadc_thermal.c
> @@ -1283,8 +1283,6 @@ static int mtk_thermal_probe(struct platform_device=
 *pdev)
>                         mtk_thermal_init_bank(mt, i, apmixed_phys_base,
>                                               auxadc_phys_base, ctrl_id);
>
> -       platform_set_drvdata(pdev, mt);
> -
>         tzdev =3D devm_thermal_of_zone_register(&pdev->dev, 0, mt,
>                                               &mtk_thermal_ops);
>         if (IS_ERR(tzdev))
> --
> 2.34.1
>

