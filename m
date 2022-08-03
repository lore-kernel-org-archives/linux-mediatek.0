Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15C45C19F28
	for <linux-mediatek@archiver.kernel.org>; Wed,  3 Aug 2022 08:42:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oHeeDipADyRKO/ve/1YLa9FmmcLAxnnHkJPKVvR+xHQ=; b=xUI65hqtjfYUIgJfgWPqoEBGYf
	OSQhVsqc75t0zfXZFXYCgRA28b8OHuIKfXcM557Nb9rMQegAehf1wjL4Nqr4PdDvAmA9LO2FnjTYE
	1TbluBO5rQgmaF5Whkn+KahqcxbsQ9TVLsLI1otbyX38ynqY1Mqs5wpTUCC30o5quZ1OQHP0xrQeg
	ogMY9loo8i9U0hF4VgLvWuyJLCGD8MEaWkLxnR3YbGgYMnoeVPusWV15S7O76wxM6BX5sYqDyj1FE
	uHgRmbXYgR89vx1XUxdvhbbfMabK92heFZo5ZZe0mKO0onxpo9ZuPHmaKeIT7XQ0C8mfL/cIGFF6S
	FgXun5Ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oJ9xU-003za4-JC; Wed, 03 Aug 2022 08:42:28 +0000
Received: from mail-yb1-xb2e.google.com ([2607:f8b0:4864:20::b2e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oJ9xF-003zQR-ET
	for linux-mediatek@lists.infradead.org; Wed, 03 Aug 2022 08:42:16 +0000
Received: by mail-yb1-xb2e.google.com with SMTP id j63so27278408ybb.13
        for <linux-mediatek@lists.infradead.org>; Wed, 03 Aug 2022 01:42:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=oHeeDipADyRKO/ve/1YLa9FmmcLAxnnHkJPKVvR+xHQ=;
        b=Kr1MIzRJHbp82BH18W4AiIBLq8Mi86rLgVOsKfFvL3BonO0chgUjPmci+J1zFj0Py2
         Vo1igVL73/Wa5/hp4+/qxzpjIMlx2XY2Ds/XhZHMe9ePEt35zR/BnUR4i2Nz2Z+8rMhC
         cRGa6vtBP8dSW8uSVD71BSwpgx6x7c0Z3mHyamN7dUZRzv+D5UAYGdt+73U2kTLvHEo1
         cSZjxuVkheDOHbHpKHMzHl02RUM+2G2y3xLBmsepXPPNqOF5j/v68e/XovRKlgS5wqab
         o8LoKWLP7R7ZYP3RE7Zap+r/9UUaC4/G5bDg9nff1q5y2xVYvCpmSbhNKruKOvrmplRC
         3Jvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=oHeeDipADyRKO/ve/1YLa9FmmcLAxnnHkJPKVvR+xHQ=;
        b=wlOQwwvD3W9yUqIccDqfuXYkFORENzzrmr0meOCdn/1P2ZLHqHQZa+54dyrxRgLfJn
         KE1OIFTnXjcAqmzdkPYjEq09NLBBoiy7YO3Zx0o6QNB9kzH+oZyKfePQeoVasMuRN9/T
         iXhfVpA2hpFOmVb+pzwX1EzuBSQcxX0Ua17Bv3IEce+XY8p921X0deWfKCMVDMZt+yV/
         7ie1pRO3jxQklwDFpKg21qq1OLB1wfklKA+/m91MeWrA+MA3+9LPjGin8NWSXsi6dyFV
         Afn1qlaPRPMOOI+1IsJz9Kc6JhVibbBtiggOM5Z044JrDpn+y1vKSQW9VXOEnWEe2sbr
         Z0hw==
X-Gm-Message-State: ACgBeo0bdyWJ0+sQELpymtLV+CJrDI3Xef+9I5ffYHiqRhT/1hAybs+O
	kKepz61P0FFbNng218dKU6n9FrpauEAT8GYAuzUJ5A==
X-Google-Smtp-Source: AA6agR6uuNuubZT7+RUDSt6unHI8cDiPiRdpN0Kt/LW3gXhEFlVJAevNuRyQP/VPFI/DHrq4f8ZEK0XNUzffYOzTlZA=
X-Received: by 2002:a25:4941:0:b0:670:24c7:dc96 with SMTP id
 w62-20020a254941000000b0067024c7dc96mr18031735yba.22.1659516130367; Wed, 03
 Aug 2022 01:42:10 -0700 (PDT)
MIME-Version: 1.0
References: <20220726135506.485108-1-bchihi@baylibre.com> <20220726135506.485108-2-bchihi@baylibre.com>
 <24250d03-b25f-e521-5abd-f36109885c36@linaro.org> <CAGuA+opxZ7DDrWHcnTRhMcm7YveCAypdy9MDSytt58asgekayw@mail.gmail.com>
 <CAGuA+ooOUXaBM+uPvEEohFLtO8sRd4T=DMcc6Fvo9P92gsq4yg@mail.gmail.com> <9b224465-e9e5-43d3-50eb-3614decbd8b2@linaro.org>
In-Reply-To: <9b224465-e9e5-43d3-50eb-3614decbd8b2@linaro.org>
From: Balsam CHIHI <bchihi@baylibre.com>
Date: Wed, 3 Aug 2022 10:41:34 +0200
Message-ID: <CAGuA+op-mO5ZMz_EvSOYUNiZ_4OOwLFQqFqMrCQBVMcG3mbcPQ@mail.gmail.com>
Subject: Re: [PATCH v8 1/6] thermal: mediatek: Relocate driver to mediatek folder
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: rafael@kernel.org, rui.zhang@intel.com, amitk@kernel.org, 
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, khilman@baylibre.com, 
	mka@chromium.org, robh+dt@kernel.org, krzk+dt@kernel.org, 
	matthias.bgg@gmail.com, p.zabel@pengutronix.de, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	james.lo@mediatek.com, fan.chen@mediatek.com, louis.yu@mediatek.com, 
	rex-bc.chen@mediatek.com, abailon@baylibre.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220803_014213_769908_ECBD0CD5 
X-CRM114-Status: GOOD (  10.48  )
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

On Fri, Jul 29, 2022 at 5:35 PM Daniel Lezcano
<daniel.lezcano@linaro.org> wrote:
>
> Hi Balsam,
>
> On 29/07/2022 17:21, Balsam CHIHI wrote:
>
> [ ... ]
>
> You may want to wait next week before sending a new version, I'm still
> reviewing your series (note you can send it anyway if you prefer)
>

Hi Daniel,

Thank you for the review.
I have finished implementing the changes requested by the maintainers
and would like to resubmit the series.
Do I still have to wait for your feedback to send it again?

Best regards,
Balsam

