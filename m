Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92B83C76195
	for <linux-mediatek@archiver.kernel.org>; Tue, 28 Mar 2023 00:21:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OWxYxwYnDh/M3AqcQxupiWYE616Su6/3AVIH7JVpi+4=; b=xPXlNYwTQgPLNPOFuyGkWje5i8
	9MdWqcEZ28fEuYtisxHShljYiTeMmjuT0WjMDuYgOJ4gkVcmg7Rr4d3bVNE/iZNtWLWNb/kqieKwq
	EJFPKjRnGJRRBJUMT4D5bFuXXJt+qJeO3hiOx2CvbFfG045HV0xNYPGK2m1HYEm2C6nMGAwZ+vIQL
	bM3jsmAToHMxMzcaPBR4dEIOSRXc8DJiEsUtGpPOZFKWV7sMRR0DIQVraaOvuPwe2fGjkGkCRjqOx
	m2K6aJFrKNNxJeIZ+fYzHd86Gug5ctcgz7ZTPh7Uw01ZeP7g1smDJWO94fdnJJsBFM1bFNuHTzJF5
	tuLtiL2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pgx5I-00Ci3b-1H;
	Tue, 28 Mar 2023 00:21:08 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pgx5D-00Ci2E-0h
	for linux-mediatek@lists.infradead.org;
	Tue, 28 Mar 2023 00:21:07 +0000
Received: by mail-ed1-x533.google.com with SMTP id eg48so42921595edb.13
        for <linux-mediatek@lists.infradead.org>; Mon, 27 Mar 2023 17:21:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112; t=1679962860;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OWxYxwYnDh/M3AqcQxupiWYE616Su6/3AVIH7JVpi+4=;
        b=iQky6ik4kDwcReUzej4+0VfVe0WBZObyKBPejB3AzdUu2vBgMJGvC+HEb/lU/4nPel
         bJgq4p1jPRFqRck8x2nm7QlGy+lf7fVlk+BRnX36blHctgndC8i7E4S3ytJk2+oFQFCt
         IFN7SJiaXctCjcRtLCuRdSt1xDx7g69MgPI8L4K9A1D1a3aFxZHs/bzXulnXGipOr62E
         QEwlTpDKxBx+vvW1ozaLPZnh5qSGFP3fnjd9LIQcGf/qde1kZn4J8FXQZTtnnGB93Dzz
         ZwvpSEbG40ESYC4RpoIciqTuoP6egsu4hhYR5vK9MwSKg+89YBVPHosawxgaaZNL+WZZ
         IsJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679962860;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OWxYxwYnDh/M3AqcQxupiWYE616Su6/3AVIH7JVpi+4=;
        b=KUt0OEIRTIJm2ht8uQQxOXV8QKSea1sCY96LLWqPDutqBh0UV+eNV9ZRJ6GOCTXxoE
         yYhyRMqQbrbXRnlc6FmQyYhyHECh6HRjKkvC6RBlj7xy1wzuTsAVgmVdGqqX0eqMuhPZ
         85Pr5xenSSzGoTStxJTldnJqApR4JO3au7E6pslIHtiJwlnsPW6+/qYWbPW5KJDJyjsU
         E2LIH/CoZiZohzF4ETLNoefrF16hYPclWDd3UZkH1+icQqfm3vYyQC1pHSrbHQOpjORB
         h+ohTztBUH2jrqgx5zHzxlp74tmIqqjHAm3QVn9mW7JSAsXsLfN08hFdYNMQp0KF/xz+
         INmg==
X-Gm-Message-State: AAQBX9fZrK8eJY149P4Urh4qX+AnfHykT5AeY967Xsj9bQsMmO6EaacO
	ENCJIP+8Ehpy7ZEqzyC2encDK8xhV/PC3C0GFhwAjA==
X-Google-Smtp-Source: AKy350bS1Hba9qX/l6pm9XmTzJq4aBCpICVpxhFQWGi17RieKEkZ5vZWKqsJQqRR1BUm/4/yKCLx58qdU8g1jirg1BE=
X-Received: by 2002:a17:907:d48d:b0:93e:c1ab:ae67 with SMTP id
 vj13-20020a170907d48d00b0093ec1abae67mr5715532ejc.2.1679962860515; Mon, 27
 Mar 2023 17:21:00 -0700 (PDT)
MIME-Version: 1.0
References: <20230307163413.143334-1-bchihi@baylibre.com> <CAGXv+5E0wUJYUVD3wx3-=uES612ARQmUE0rxgAruFHxpZCBjzA@mail.gmail.com>
 <CAGuA+ooi7Kx05gagLzXAN3upDiSqDUNOM_djYdGftw6ogVx5gw@mail.gmail.com>
 <CAGuA+oqDPPYFJef_8=YrOpHQNVJ3xgm_zXS6fq_HG2Jy_6t-Zg@mail.gmail.com> <CAGXv+5EZPWohGN5CaEiqVrM4MyAar3cPEUhHtGY_9wTJSJNVFQ@mail.gmail.com>
In-Reply-To: <CAGXv+5EZPWohGN5CaEiqVrM4MyAar3cPEUhHtGY_9wTJSJNVFQ@mail.gmail.com>
From: Balsam CHIHI <bchihi@baylibre.com>
Date: Tue, 28 Mar 2023 02:20:24 +0200
Message-ID: <CAGuA+oqF4jFMyEo09VDmCf-_7g0ua3XDKDAJ+t3Gat14pDM9NA@mail.gmail.com>
Subject: Re: [PATCH 0/4] Add LVTS support for mt8192
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: daniel.lezcano@linaro.org, angelogioacchino.delregno@collabora.com, 
	rafael@kernel.org, amitk@kernel.org, rui.zhang@intel.com, 
	matthias.bgg@gmail.com, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, 
	rdunlap@infradead.org, ye.xingchen@zte.com.cn, p.zabel@pengutronix.de, 
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	devicetree@vger.kernel.org, khilman@baylibre.com, james.lo@mediatek.com, 
	rex-bc.chen@mediatek.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230327_172103_472762_65F75252 
X-CRM114-Status: GOOD (  26.54  )
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

On Sat, Mar 25, 2023 at 5:33=E2=80=AFAM Chen-Yu Tsai <wenst@chromium.org> w=
rote:
>
> On Wed, Mar 22, 2023 at 8:48=E2=80=AFPM Balsam CHIHI <bchihi@baylibre.com=
> wrote:
> >
> > Hi Chen-Yu,
> >
> > I suspect the bug comes from incorrect calibration data offsets for AP
> > Domain because you confirm that MCU Domain probe runs without issues.
> > Is it possible to test something for us to confirm this theory (i
> > don't have an mt8192 board on hand now), when you have the time of
> > course?
> > We would like to test AP Domain's calibration data offsets with a
> > working one, for example :
> >
> >  static const struct lvts_ctrl_data mt8192_lvts_ap_data_ctrl[] =3D {
> >                 {
> > -               .cal_offset =3D { 0x25, 0x28 },
> > +               .cal_offset =3D { 0x04, 0x04 },
> >                 .lvts_sensor =3D {
> >                         { .dt_id =3D MT8192_AP_VPU0 },
> >                         { .dt_id =3D MT8192_AP_VPU1 }
> > @@ -1336,7 +1336,7 @@ static const struct lvts_ctrl_data
> > mt8192_lvts_ap_data_ctrl[] =3D {
> >                 .hw_tshut_temp =3D LVTS_HW_SHUTDOWN_MT8192,
> >         },
> >         {
> > -               .cal_offset =3D { 0x2e, 0x31 },
> > +               .cal_offset =3D { 0x04, 0x04 },
> >                 .lvts_sensor =3D {
> >                         { .dt_id =3D MT8192_AP_GPU0 },
> >                         { .dt_id =3D MT8192_AP_GPU1 }
> > @@ -1346,7 +1346,7 @@ static const struct lvts_ctrl_data
> > mt8192_lvts_ap_data_ctrl[] =3D {
> >                 .hw_tshut_temp =3D LVTS_HW_SHUTDOWN_MT8192,
> >         },
> >         {
> > -               .cal_offset =3D { 0x37, 0x3a },
> > +               .cal_offset =3D { 0x04, 0x04 },
> >                 .lvts_sensor =3D {
> >                         { .dt_id =3D MT8192_AP_INFRA },
> >                         { .dt_id =3D MT8192_AP_CAM },
> > @@ -1356,7 +1356,7 @@ static const struct lvts_ctrl_data
> > mt8192_lvts_ap_data_ctrl[] =3D {
> >                 .hw_tshut_temp =3D LVTS_HW_SHUTDOWN_MT8192,
> >         },
> >         {
> > -               .cal_offset =3D { 0x40, 0x43, 0x46 },
> > +               .cal_offset =3D { 0x04, 0x04, 0x04 },
> >                 .lvts_sensor =3D {
> >                         { .dt_id =3D MT8192_AP_MD0 },
> >                         { .dt_id =3D MT8192_AP_MD1 },
> >
> > This example is tested and works for mt8195,
> > (all sensors use the same calibration data offset for testing purposes)=
.
> >
> > Thank you in advance for your help.
>
> The MCU ones are still tripping though. If I change all of them to 0x04,
> then nothing trips. There's also a bug in the interrupt handling code
> that needs to be dealt with.
>
> AFAICT the calibration data is stored differently. If you look at ChromeO=
S's
> downstream v5.10 driver, you'll see mt6873_efuse_to_cal_data() for MT8192=
,
> and mt8195_efuse_to_cal_data() for MT8195. The difference sums up to:
> MT8195 has all data sequentially stored, while MT8192 has most data store=
d
> in lower 24 bits of each 32-bit word, and the highest 8 bits are then use=
d
> to pack data for the remaining sensors.
>
> Regards
> ChenYu

Hi Chen-Yu Tsai,

Thank you very much for helping me testing this suggestion.

Indeed, calibration data is stored differently in the mt8192 compared to mt=
8195.
So, the mt8192's support will be delayed for now, to allow further debuggin=
g.

In the mean time, we will only continue to upstream the remaining
mt8195's source code, so it will get full LVTS support.
A new series will be submitted soon.

Would you please point me out to the bug in interrupt handling code?

Best regards,
Balsam

