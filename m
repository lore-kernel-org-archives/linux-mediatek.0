Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C73C1C43334
	for <linux-mediatek@archiver.kernel.org>; Wed, 15 Jun 2022 22:26:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PhsSixX/qIegggQ5xjphGxZRHvJ/OEH0jIlsRPAAQm0=; b=3AXdyj4/N/4YZU+olt37hkGXxH
	mL/WIpY+pn6uAThCaebjmbuqd62mqCHLIX1PFcvJWQPztCyiZFXnaHzcJSnjQh2Brq1ukgTzsdSc+
	VOHeT/H8YC217iIlhX9PNdR0y7/rhk1v9Ot9szlDEx/QePSECYNVKFiNDk+rIWwyrRCr8lfDCHGDl
	HgXdSM2J0W51DChgNWgFm5y+uu1VJbYJnXUP7POmOL8qAkBguivVsLCZ5nEEih+PfBOQ56SsemGEk
	kp10hoM4LFubI6iZs4Kt1mzYUsOzzaCy1hP3/khvJCUsEYCZXAIhnHzTVfJtboDsCfAqctA7WHmjO
	NFk7vDlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1bSo-00GgAh-UW; Wed, 15 Jun 2022 22:26:15 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1bSd-00Gg6a-2z
	for linux-mediatek@lists.infradead.org; Wed, 15 Jun 2022 22:26:04 +0000
Received: by mail-pf1-x432.google.com with SMTP id w21so12725592pfc.0
        for <linux-mediatek@lists.infradead.org>; Wed, 15 Jun 2022 15:26:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=PhsSixX/qIegggQ5xjphGxZRHvJ/OEH0jIlsRPAAQm0=;
        b=jECmfGSYstnqaxcRrTgZP5JAycoHs5xHRilb4VyHR0fHpBMbaXfFOeO3n6Jbbh5beA
         fR6s7KbigWwSGO/IkBQmncbFf0e5pg1gzOq7k0XxWjSzggZvZUH/Bmd953k52Tsy6GR1
         PyWLuf7heFRun0WTH/TniVecnEBlyLSOzBYG/HObB8A3zzLYc/oBitEkoF4arIpQtBDm
         8OZfJQ8snzRxwFThCUV9khBGxoAV/CH6P3jYjSmzTYx0EFzpTn8sjREmWRLz4Z4FwFIs
         9WlxEeGNNEJ8OA7vE/7trRewubuZI2ft2YiX56n6G1UKocriqe+oLjyTo1yALvrEM/34
         f6ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=PhsSixX/qIegggQ5xjphGxZRHvJ/OEH0jIlsRPAAQm0=;
        b=4aQc7XcJ8tZyxe+2snm1S8qBB+tNCPYk32GDFR45AjCVAloeQ7e+NTk1tbFYuRD8++
         hAH/jaZViI4jfacKRYnym2vlF4eqbXf1xaaFt1rH4TtAllC1adpHLQd5nLQbmeLjy+Va
         sx69CpXd7rQn+lwPJ9SXaNxB1OVZVbk1HkZlOOUGWn1qlAYdBUoQP+nOhjID0vewMgoV
         u/GGVJ7AKOhWGJI6bsaY5dlo9h95/MPN3SqNxF2FwVDDc23t4ONHbOeZOzWFIdANGzqz
         78zEMhN8IfJK3Y6FxgNg3sGBU/oZi3+gtoQQhsz2opfQU3KFUU1UQSxbRrYnV2EpEtm7
         Wq+Q==
X-Gm-Message-State: AJIora9jw9egchs4gUzDB6MFDpZz6Xs2uSkVHsSHFaJG3WdW3bJFFg+H
	hADIB84ml+AMfd+0zej0i82sLA==
X-Google-Smtp-Source: AGRyM1t5Z+CeN6seTkZECmQqflRZfLTXrCI+sKYnhHustZ3Jap6ITSkAmhQieyoPoyDyS7fwC5ngsw==
X-Received: by 2002:a63:6f8a:0:b0:408:bd01:ef4 with SMTP id k132-20020a636f8a000000b00408bd010ef4mr1763774pgc.216.1655331960155;
        Wed, 15 Jun 2022 15:26:00 -0700 (PDT)
Received: from google.com ([192.77.111.2])
        by smtp.gmail.com with ESMTPSA id x5-20020a170902a38500b00168d9630b49sm100605pla.307.2022.06.15.15.25.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jun 2022 15:25:59 -0700 (PDT)
Date: Wed, 15 Jun 2022 23:25:57 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Fabien Parent <fparent@baylibre.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 5/7] mfd: mt6358-irq: add MT6357 PMIC support
Message-ID: <Yqpcdb6sznziWMDo@google.com>
References: <20220531124959.202787-1-fparent@baylibre.com>
 <20220531124959.202787-6-fparent@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220531124959.202787-6-fparent@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220615_152603_242613_E3DB8930 
X-CRM114-Status: UNSURE (   8.03  )
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

On Tue, 31 May 2022, Fabien Parent wrote:

> Add MT6357 PMIC IRQ support.
> 
> Signed-off-by: Fabien Parent <fparent@baylibre.com>
> ---
>  drivers/mfd/mt6358-irq.c        | 24 ++++++++++++++++++++++++
>  include/linux/mfd/mt6397/core.h |  1 +
>  2 files changed, 25 insertions(+)

Fixed the subject line.

Applied, thanks.

-- 
Lee Jones [李琼斯]
Principal Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog

