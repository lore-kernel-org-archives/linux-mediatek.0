Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74162C77B7F
	for <linux-mediatek@archiver.kernel.org>; Fri, 19 May 2023 14:09:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nO2IMSaci1mLkURs2Rerjvjr6e18HL0QFWSpDQYnXvg=; b=oyDY+YwG+3RmJFUJXeMaZ037ot
	f8xAeSkgyuJJ85srN/zupIGkcc2nhc4jRp5ndlayaLRqoqSSBM3pvIxAuiJO7cu+U0ri+qxxm7A/r
	v/WZ1S5oUGFiIzAN0bBdRRoQjD/IwBNLagC+TJ3Rloz1D2g10tt1TDeJHUQutlbF3v9idC0WZm+YB
	D9wTlEWRZ0Knit1LyMEDO2GxmUfFne9OF/5nUqr5fqqiqlplHia2Xc71YbGohRLYck8Z+/B5vB6bO
	Dl0R0FElARDnm+jzNzVlDmSz9RsGPpnd0QtxR4o4aXk4LTOfZdaGMDSmIT7Mji3Gz4vBQNux0ruzI
	oPgeC37g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q00n3-00GS1H-0W;
	Fri, 19 May 2023 14:09:05 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q00mz-00GS0h-2Q
	for linux-mediatek@lists.infradead.org;
	Fri, 19 May 2023 14:09:03 +0000
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-64384c6797eso2585447b3a.2
        for <linux-mediatek@lists.infradead.org>; Fri, 19 May 2023 07:09:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1684505339; x=1687097339;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nO2IMSaci1mLkURs2Rerjvjr6e18HL0QFWSpDQYnXvg=;
        b=U2U4r2IfK1jqKF/mNm2KBqvjWNjdQTp0YZz6jcDMwgeHMql/r0VVaJW2RthUbcW0ax
         BMCxfExFR9p+czfqKl5v/pNtRk1gq+UPKYyDNdm9IaFkXAmx4bAWzZS3KqgM/whKTF3F
         YzxcIGVt7VJPpvqqLQrpK3Cni8Y+R8aeYnlh0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684505339; x=1687097339;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nO2IMSaci1mLkURs2Rerjvjr6e18HL0QFWSpDQYnXvg=;
        b=MRbtyh9mnX4tAboDg0hLf+gjQuiDxp41dJ1JmPA/B0Rsp5eDcgOVoNgH6ApHxxtNnc
         HMaymqcCnz/ddqmHYikOsrAD8U6R533m1xTdMZ2IWF7Ndb8Bpq+XFaG83wwuwRLNAn/J
         prx5k4HFV0+lzyKdzp5GoOsiHowzXRuekIGpxY/YU6LfcetH0aFXtAGtrsszpNG9+xQb
         n26biNg8IKvctHpPKK4KEDtdzZvJsQmPIGQ+pQwPEIhHlvrTimy+Mh77m5iLlQ1V9jxS
         1KdPMIdVmsYc/N6zrG1ihi2GWV6Ie2tFMuL8vaH6UOspL694fpQ1XqfZo1Eat0ijh54Q
         hIRQ==
X-Gm-Message-State: AC+VfDxjQZZwkky/AurlbVW43mBEBxdihSoY7t0ePvg7T1NDLnNJH4e0
	Q/orbRHQq6Q8kkm29vuR7vEWj1K2rCh3JJYl7mc=
X-Google-Smtp-Source: ACHHUZ7Cdx7ch61FLp6D1nRYwdP6snldwMUJFNN1UorhRGiDCIQdTtsam2F1GmkVoB1+QbkqmVucSA==
X-Received: by 2002:a05:6a00:1783:b0:644:d77:a2c5 with SMTP id s3-20020a056a00178300b006440d77a2c5mr3533645pfg.29.1684505339180;
        Fri, 19 May 2023 07:08:59 -0700 (PDT)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com. [209.85.214.181])
        by smtp.gmail.com with ESMTPSA id u24-20020a62ed18000000b0063f1a1e3003sm3045025pfh.166.2023.05.19.07.08.58
        for <linux-mediatek@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 May 2023 07:08:58 -0700 (PDT)
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-1ac65ab7432so153175ad.0
        for <linux-mediatek@lists.infradead.org>; Fri, 19 May 2023 07:08:58 -0700 (PDT)
X-Received: by 2002:a17:902:dad2:b0:198:af50:e4de with SMTP id
 q18-20020a170902dad200b00198af50e4demr206507plx.4.1684505337704; Fri, 19 May
 2023 07:08:57 -0700 (PDT)
MIME-Version: 1.0
References: <20230427035656.1962698-1-fshao@chromium.org>
In-Reply-To: <20230427035656.1962698-1-fshao@chromium.org>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 19 May 2023 07:08:46 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XVubT-ozs7JssBPz+9UcsZb+q0My8Aq6HNs-nFiJnogg@mail.gmail.com>
Message-ID: <CAD=FV=XVubT-ozs7JssBPz+9UcsZb+q0My8Aq6HNs-nFiJnogg@mail.gmail.com>
Subject: Re: [PATCH v4 0/2] Fix Goodix touchscreen power leakage for MT8186 boards
To: Fei Shao <fshao@chromium.org>
Cc: Jeff LaBundy <jeff@labundy.com>, Benjamin Tissoires <benjamin.tissoires@redhat.com>, 
	Rob Herring <robh+dt@kernel.org>, linux-mediatek <linux-mediatek@lists.infradead.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Jiri Kosina <jikos@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Matthias Kaehlcke <mka@chromium.org>, 
	Stephen Kitt <steve@sk2.org>, devicetree@vger.kernel.org, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230519_070901_810091_680F2539 
X-CRM114-Status: GOOD (  25.12  )
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

Hi,

On Wed, Apr 26, 2023 at 8:57=E2=80=AFPM Fei Shao <fshao@chromium.org> wrote=
:
>
> These changes are based on the series in [1], which modified the
> i2c-hid-of-goodix driver and removed the workaround for a power leakage
> issue, so the issue revisits on Mediatek MT8186 boards (Steelix).
>
> The root cause is that the touchscreen can be powered in different ways
> depending on the hardware designs, and it's not as easy to come up with
> a solution that is both simple and elegant for all the known designs.
>
> To address the issue, I ended up adding a new boolean property for the
> driver so that we can control the power up/down sequence depending on
> that.
>
> Adding a new property might not be the cleanest approach for this, but
> at least the intention would be easy enough to understand, and it
> introduces relatively small change to the code and fully preserves the
> original control flow.
> I hope this is something acceptable, and I'm open to any better
> approaches.
>
> [1] https://lore.kernel.org/all/20230207024816.525938-1-dianders@chromium=
.org/
>
> Changes in v4:
> - Minor coding style improvement
>
> Changes in v3:
> - In power-down, only skip the GPIO but not the regulator calls if the
>   flag is set
>
> Changes in v2:
> - Use a more accurate property name and with "goodix," prefix.
> - Do not change the regulator_enable logic during power-up.
>
> Fei Shao (2):
>   dt-bindings: input: goodix: Add "goodix,no-reset-during-suspend"
>     property
>   HID: i2c-hid: goodix: Add support for "goodix,no-reset-during-suspend"
>     property
>
>  .../bindings/input/goodix,gt7375p.yaml           |  9 +++++++++
>  drivers/hid/i2c-hid/i2c-hid-of-goodix.c          | 16 +++++++++++++++-
>  2 files changed, 24 insertions(+), 1 deletion(-)

Just double-checking if there is any work needed on this series. I
think it's ready to land but I wanted to double-check.

Thanks!

-Doug

