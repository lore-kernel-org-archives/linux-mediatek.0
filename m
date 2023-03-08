Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 384FCC64EC4
	for <linux-mediatek@archiver.kernel.org>; Wed,  8 Mar 2023 12:04:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=amflx+MPu/55qREv7D1gpSWbJ6NWDsdR+AZRDR7ovnE=; b=HC6Pr+3m3nPlh7m7d1pn3rKbjv
	61Ivm+TiwCtnMoJyB+Qs3/k9UZDgh+ZpRaWyt3gvUOGxyzGGjDDzsacrCWiJaVxpJp2ZFKXbVSG8A
	Ueyw48T/EVswusdNiXBrTDfPXHDkvyZs5nnzuxlQGLQTNwqipkkp6IaFfhGytAorFJ+xJ+jQHL6Ba
	s+sutJLdgc9wh3tKfQ2xrpseMgDNrow7RqRFCk5uQZd2gWvUypc0N95SISCKZI3NCHa4slQO7pJfq
	+6EzgkVmCSUBOsLindw6Ys229+qMNo750NiyiHvB4oIA2jw22jDRwTJVkyhhOhDsEqciY75iUyBTL
	4eMcyGVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZsXC-004kYH-Fd; Wed, 08 Mar 2023 12:04:42 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZsX1-004kVA-Ui
	for linux-mediatek@lists.infradead.org; Wed, 08 Mar 2023 12:04:33 +0000
Received: by mail-wm1-x330.google.com with SMTP id j19-20020a05600c1c1300b003e9b564fae9so1123741wms.2
        for <linux-mediatek@lists.infradead.org>; Wed, 08 Mar 2023 04:04:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678277069;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=amflx+MPu/55qREv7D1gpSWbJ6NWDsdR+AZRDR7ovnE=;
        b=MXXuoAJ25BhikwDMJMbsOMMSMTpkbh236/a+M7b/jvA/yI2WL8SKcnJseSiiTCATdv
         ygqlltiWCufIHuCEJMDnUjiNuXT+L46Bjff6zQncWfRMPoJRqeq88lx1I7fznBoo9f/C
         5i+6ag5xC/vwCsuF5Llp00jNeH+zhHkBKjfiDq4sBIWepdUjQrCx9R1Y7oD5NklTCbmJ
         uu9IEi6ZiZGowy4ePxMiVGKFpRPZwOhe8F5App/XMXzVlJkaC8zDAigwkr4vtC/8q2OT
         54Gj6NJp2shY2QwYlupJrlElYNiF9bzE5fPZf015nbNbfc7C+vs4RmM1/yFmN77Rg97r
         aZ+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678277069;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=amflx+MPu/55qREv7D1gpSWbJ6NWDsdR+AZRDR7ovnE=;
        b=Wykxui3nkIFBrcXZLxx7lR9/REw9j74uTC+L9StEnCDgFbvvXzgBHDs+Xx1znaPZRi
         slBJYMpEwXV2ZlSqu4Ke8VpQSS6pHOUkZzX5YpBJfZNfQlS1g4I6OdGom8g2LcYDBIIN
         8/zK2S7Zm+mfj2DP6yesSns/2XoPzSmlOjRLGT7AIEziNyqniF3KrMjzjvenIYtaRIgV
         bPQGg+VAtTCemNS2qkhye5LBBDUr+mNeS+2Cc1UFFjbKt6BTwnjlnv54fX24Vnlqt4s0
         v1HurEde+ECDx1tbRQTAUoV4rMGlicx9YJ8Kqn4tGATbLDidN74TqBeYcu2ASqbCsI0o
         9zyw==
X-Gm-Message-State: AO0yUKV7mY0tYNwIY/kHim/2wSVFsuxJi8m0DRFA6SqG3/lX0eJwl0yr
	rnAylQLkLddhfwmJWTOo88k4Nw==
X-Google-Smtp-Source: AK7set+BQHFboi4QXgAYqrYtuSpR1zmoAeIuRNLA1tt4tiD/NZOIeUje28/bcJ5vKzbXewtLlkt13Q==
X-Received: by 2002:a05:600c:3512:b0:3ea:e554:7815 with SMTP id h18-20020a05600c351200b003eae5547815mr16957712wmq.9.1678277068004;
        Wed, 08 Mar 2023 04:04:28 -0800 (PST)
Received: from aspen.lan (cpc141216-aztw34-2-0-cust174.18-1.cable.virginm.net. [80.7.220.175])
        by smtp.gmail.com with ESMTPSA id x21-20020a05600c189500b003e71a6be279sm15336997wmp.37.2023.03.08.04.04.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Mar 2023 04:04:27 -0800 (PST)
Date: Wed, 8 Mar 2023 12:04:25 +0000
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Lee Jones <lee@kernel.org>, Jingoo Han <jingoohan1@gmail.com>,
	Helge Deller <deller@gmx.de>,
	Michael Hennerich <michael.hennerich@analog.com>,
	Support Opensource <support.opensource@diasemi.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
	kernel@pengutronix.de,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-pwm@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 00/13] backlight: Convert to platform remove callback
 returning void
Message-ID: <20230308120425.GA6174@aspen.lan>
References: <20230308073945.2336302-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230308073945.2336302-1-u.kleine-koenig@pengutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230308_040431_996888_77930C66 
X-CRM114-Status: UNSURE (   7.06  )
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

On Wed, Mar 08, 2023 at 08:39:32AM +0100, Uwe Kleine-König wrote:
> Uwe Kleine-König (13):
>   backlight: aat2870_bl: Convert to platform remove callback returning
>     void
>   backlight: adp5520_bl: Convert to platform remove callback returning
>     void
>   backlight: cr_bllcd: Convert to platform remove callback returning
>     void
>   backlight: da9052_bl: Convert to platform remove callback returning
>     void
>   backlight: hp680_bl: Convert to platform remove callback returning
>     void
>   backlight: led_bl: Convert to platform remove callback returning void
>   backlight: lm3533_bl: Convert to platform remove callback returning
>     void
>   backlight: lp8788_bl: Convert to platform remove callback returning
>     void
>   backlight: mt6370-backlight: Convert to platform remove callback
>     returning void
>   backlight: pwm_bl: Convert to platform remove callback returning void
>   backlight: qcom-wled: Convert to platform remove callback returning
>     void
>   backlight: rt4831-backlight: Convert to platform remove callback
>     returning void
>   backlight: sky81452-backlight: Convert to platform remove callback
>     returning void

Whole series is:
Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>


Thanks!

