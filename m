Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDBB4ECAAD2
	for <linux-mediatek@archiver.kernel.org>; Fri, 26 Aug 2022 08:06:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7Mq11P25bR3wlSS6rhp/KK7HEHcVP2nqSIE7qecBSHI=; b=jYN2O47atkLST0p6tJyCirFNg7
	cb0VEyPPKjGUYuKdZDc+XYZ3UGcTA1m1ZSXZsI9tCQTUObQ4UCstWQeJX3lY0xM6XsDOEbxlNKFYB
	Mu6HOQwdRCtikXrQpf+dajPVxPD5/HV3Y2tClcf2hCHwZG/CVsKDZkWLL03NcjSpY6Nn3XqsdAwtE
	1Tlzx/SV1gmzOrOLV+uaF2hIOa9/Txwxv6Ntqskl+Y3GaVagys+tsXfTAgfgjJtYiXuXWBjHAa3/R
	OQlMmCow1pvSHdAX/yBPFsNyuc+juNLccMzOF2LYYC0y/oqyKi2K1EeUgXnmibihtrBaDi4htzoqF
	4iw4cNjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oRUMP-00Gk70-8A; Fri, 26 Aug 2022 08:06:37 +0000
Received: from mail-yw1-x112f.google.com ([2607:f8b0:4864:20::112f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oRUMK-00Gk4I-Pu
	for linux-mediatek@lists.infradead.org; Fri, 26 Aug 2022 08:06:35 +0000
Received: by mail-yw1-x112f.google.com with SMTP id 00721157ae682-3376851fe13so17491837b3.6
        for <linux-mediatek@lists.infradead.org>; Fri, 26 Aug 2022 01:06:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc;
        bh=7Mq11P25bR3wlSS6rhp/KK7HEHcVP2nqSIE7qecBSHI=;
        b=A6bJ+AnhSeKOqL2xoFgZgqXmcNg60G7gBzknU5skktv31cbrZtiqklVBvs+nmq2jBm
         y6mTIeVsVgtR5v+CnFSal6nO1qBaDJMjwBpArsPYg63W9RrTb5QhdkZMrcMdTmgS5jkv
         PMo5OKXzNGhw7zJ1mOVDZwD2NFY60tqzH//Wul+1voGYIhOKpA/VvmtTNtQXnVHsK7a3
         BcWq3qzH65wl9D4aFjgTkN1zLOTRuV259Th5v16GqLTjQZyxO+JmhDNCEB4Q9PRuIt9J
         NjkE58DwKus4IgFslbGcg0EtNvBEX/paL9LgvEz0rilkjPBepSdq5S1JAQvLlAqunZrs
         1WFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc;
        bh=7Mq11P25bR3wlSS6rhp/KK7HEHcVP2nqSIE7qecBSHI=;
        b=5aUcDapOCripTeZdsC4nUcN0oRX0kFSVOeEanOMtlo8rDzro1WapVzSZeMnr6eRGfW
         CQPCbj8tYTK45JXqPsPZRfeK+fILIoySc8KQ1Nit3ktmn/wJurIwj58phOGYJCXTLWnc
         XHOFKPCWeVLjE4VEhPKSe7VH6Kdf8pkew/HQvBwJpmZCma2Ha3qKQYx0dqFpy04sGTet
         7uc62sKys/q6Rm2AzCT8AnO5RQi+zw+yZVMik9n+U/8OVwzvFuqDVMiuCkOHjZ9zcdlU
         1EGDCzVAAvY4hwqki/BsNiUR9S/wbAtyTmUfVRI0PZq68Y5k3kewMfxNEwK6c9d204Xi
         weIw==
X-Gm-Message-State: ACgBeo3yHclgsXnW7hMXylmFT4O0zSPpq9oLICKfyfRHlx3Mpvnwhwlc
	i1mxy2H2CLV3dRu9aYQJubl6xBYeISDUbPvVrxzjDA==
X-Google-Smtp-Source: AA6agR6FRbsPnMzYQMsuZG4nfrnAtmeF6GVqmVA9wFaaxz61tGMBwBc+pUgqKF23zqjXCnnpgwdYoweEHrVV87xeqLE=
X-Received: by 2002:a81:9296:0:b0:33c:ba30:6ff8 with SMTP id
 j144-20020a819296000000b0033cba306ff8mr7080387ywg.285.1661501190206; Fri, 26
 Aug 2022 01:06:30 -0700 (PDT)
MIME-Version: 1.0
References: <20220817080757.352021-1-bchihi@baylibre.com> <20220817080757.352021-5-bchihi@baylibre.com>
 <05fa19f7-7997-51c3-767f-c40cb321d2a4@linaro.org>
In-Reply-To: <05fa19f7-7997-51c3-767f-c40cb321d2a4@linaro.org>
From: Balsam CHIHI <bchihi@baylibre.com>
Date: Fri, 26 Aug 2022 10:05:52 +0200
Message-ID: <CAGuA+opoKKvQvC0aij_L1t8BQG2rHJDwx-U=XjgvaqK5Bg-WdQ@mail.gmail.com>
Subject: Re: [PATCH v9,4/7] thermal: mediatek: Add LVTS driver for mt8192
 thermal zones
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: rafael@kernel.org, rui.zhang@intel.com, amitk@kernel.org, 
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, khilman@baylibre.com, 
	mka@chromium.org, robh+dt@kernel.org, krzk+dt@kernel.org, 
	matthias.bgg@gmail.com, p.zabel@pengutronix.de, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	james.lo@mediatek.com, fan.chen@mediatek.com, louis.yu@mediatek.com, 
	rex-bc.chen@mediatek.com, abailon@baylibre.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220826_010633_082694_1514F21E 
X-CRM114-Status: GOOD (  21.07  )
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

Hello Daniel,

Thank you for the feedback.

I hope this information will explain better the LVTS Driver.
I will add this like the following.
Is this ok for you?

[v9,7/7] thermal: mediatek: Add LVTS driver settings for mt8195 thermal zon=
es
One Clock and one Reset for Thermal.
Thermal have two domain : CPU related (mcu) and non-CPU related (ap).
TC : Thermal Controller to control the thermal sensor's HW behavior.
TS : Thermal Sensor for measuring temperature the HW module.
thermal
=E2=94=9C=E2=94=80=E2=94=80 ap
=E2=94=82 =E2=94=9C=E2=94=80=E2=94=80 tc_0
=E2=94=82 =E2=94=82 =E2=94=9C=E2=94=80=E2=94=80 TS4_0 - vpu1
=E2=94=82 =E2=94=82 =E2=94=94=E2=94=80=E2=94=80 TS4_1 - vpu2
=E2=94=82 =E2=94=9C=E2=94=80=E2=94=80 tc_1
=E2=94=82 =E2=94=82 =E2=94=9C=E2=94=80=E2=94=80 TS5_0 - gpu1
=E2=94=82 =E2=94=82 =E2=94=94=E2=94=80=E2=94=80 TS5_1 - gpu2
=E2=94=82 =E2=94=9C=E2=94=80=E2=94=80 tc_2
=E2=94=82 =E2=94=82 =E2=94=9C=E2=94=80=E2=94=80 TS6_0 - vdec
=E2=94=82 =E2=94=82 =E2=94=9C=E2=94=80=E2=94=80 TS6_1 - img
=E2=94=82 =E2=94=82 =E2=94=94=E2=94=80=E2=94=80 TS6_2 - infra
=E2=94=82 =E2=94=94=E2=94=80=E2=94=80 tc_3
=E2=94=82 =E2=94=9C=E2=94=80=E2=94=80 TS7_0 - cam1
=E2=94=82 =E2=94=94=E2=94=80=E2=94=80 TS7_1 - cam2
=E2=94=94=E2=94=80=E2=94=80 mcu
=E2=94=9C=E2=94=80=E2=94=80 tc_0
=E2=94=82 =E2=94=9C=E2=94=80=E2=94=80 TS1_0 - cpu_big1
=E2=94=82 =E2=94=94=E2=94=80=E2=94=80 TS1_1 - cpu_big2
=E2=94=9C=E2=94=80=E2=94=80 tc_1
=E2=94=82 =E2=94=9C=E2=94=80=E2=94=80 TS2_0 - cpu_big3
=E2=94=82 =E2=94=94=E2=94=80=E2=94=80 TS2_1 - cpu_big4
=E2=94=94=E2=94=80=E2=94=80 tc_2
=E2=94=9C=E2=94=80=E2=94=80 TS3_0 - cpu_little1
=E2=94=9C=E2=94=80=E2=94=80 TS3_1 - cpu_little2
=E2=94=9C=E2=94=80=E2=94=80 TS3_2 - cpu_little3
=E2=94=94=E2=94=80=E2=94=80 TS3_3 - cpu_little4

[v9,4/7] thermal: mediatek: Add LVTS driver for mt8192 thermal zones
One Clock and one Reset for Thermal.
Thermal have two domain : CPU related (mcu) and non-CPU related (ap).
TC : Thermal Controller to control the thermal sensor's HW behavior.
TS : Thermal Sensor for measuring temperature the HW module.
thermal
=E2=94=9C=E2=94=80=E2=94=80 ap
=E2=94=82 =E2=94=9C=E2=94=80=E2=94=80 tc_0
=E2=94=82 =E2=94=82 =E2=94=9C=E2=94=80=E2=94=80 TS4_0 - vpu1
=E2=94=82 =E2=94=82 =E2=94=94=E2=94=80=E2=94=80 TS4_1 - vpu2
=E2=94=82 =E2=94=9C=E2=94=80=E2=94=80 tc_1
=E2=94=82 =E2=94=82 =E2=94=9C=E2=94=80=E2=94=80 TS5_0 - gpu1
=E2=94=82 =E2=94=82 =E2=94=94=E2=94=80=E2=94=80 TS5_1 - gpu2
=E2=94=82 =E2=94=9C=E2=94=80=E2=94=80 tc_2
=E2=94=82 =E2=94=82 =E2=94=9C=E2=94=80=E2=94=80 TS6_0 - infra
=E2=94=82 =E2=94=82 =E2=94=94=E2=94=80=E2=94=80 TS6_1 - cam
=E2=94=82 =E2=94=94=E2=94=80=E2=94=80 tc_3
=E2=94=82 =E2=94=9C=E2=94=80=E2=94=80 TS7_0 - md2
=E2=94=82 =E2=94=94=E2=94=80=E2=94=80 TS7_1 - md3
| =E2=94=94=E2=94=80=E2=94=80 TS6_2 - md1
=E2=94=94=E2=94=80=E2=94=80 mcu
=E2=94=9C=E2=94=80=E2=94=80 tc_0
=E2=94=82 =E2=94=9C=E2=94=80=E2=94=80 TS1_0 - cpu_big1
=E2=94=82 =E2=94=94=E2=94=80=E2=94=80 TS1_1 - cpu_big2
=E2=94=9C=E2=94=80=E2=94=80 tc_1
=E2=94=82 =E2=94=9C=E2=94=80=E2=94=80 TS2_0 - cpu_big3
=E2=94=82 =E2=94=94=E2=94=80=E2=94=80 TS2_1 - cpu_big4
=E2=94=94=E2=94=80=E2=94=80 tc_2
=E2=94=9C=E2=94=80=E2=94=80 TS3_0 - cpu_little1
=E2=94=9C=E2=94=80=E2=94=80 TS3_1 - cpu_little2
=E2=94=9C=E2=94=80=E2=94=80 TS3_2 - cpu_little3
=E2=94=94=E2=94=80=E2=94=80 TS3_3 - cpu_little4

Best regards,
Balsam.

On Thu, Aug 25, 2022 at 7:29 PM Daniel Lezcano
<daniel.lezcano@linaro.org> wrote:
>
>
> Hi Balsam,
>
> On 17/08/2022 10:07, bchihi@baylibre.com wrote:
> > From: Michael Kao <michael.kao@mediatek.com>
> >
> > Add LVTS v4 (Low Voltage Thermal Sensor) driver to report junction
> > temperatures in MediaTek SoC mt8192 and register the maximum temperatur=
e
> > of sensors and each sensor as a thermal zone.
>
> Thanks for your work
>
> First of all, the patch is way too big.
>
> The organization of the data is hard to understand.
>
> Could you give a description of the sensors, how they are organized ?
>
> I can see the there are 'tc' and each have a group of sensing points? Is
> that correct? Do have the 'tc's a shared clock? etc ...
>
> I have another email with the comments inline but without more insights
> on the hardware it is difficult to review accurately. This driver looks
> more complex than the other ones I've reviewed. At least that is what
> looks like with the different macros names found.
>
>
>
> --
> <http://www.linaro.org/> Linaro.org =E2=94=82 Open source software for AR=
M SoCs
>
> Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
> <http://twitter.com/#!/linaroorg> Twitter |
> <http://www.linaro.org/linaro-blog/> Blog

