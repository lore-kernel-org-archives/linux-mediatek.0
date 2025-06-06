Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4117CC5AD49
	for <linux-mediatek@archiver.kernel.org>; Fri,  6 Jun 2025 07:53:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rm4T5ss5l6d5YD6Na8dlxdY8BKrMjQHyc2yVXx42+4w=; b=ShozeQjRfge3BxZZh5jxpqci6d
	EP9uPW1dXfZSPmOxb+T0buNEQ7TR5QD3lOxkhEJiocyXqgir1UTG2G8J+RMPspshM1+Igv9a6lHvl
	JR4kbRWC+0iYgfkYukHZH9A6SuLP7bMac0WY1n9l0vCABI/Mpt+qk8YuZr1xQ8L/bEWiOMCkKp6am
	HRL9ve4XSTjuAmf0S62elW6rBDjiOrQY0mbaWQ1wHfmKgSOOwxlL9N7k7nfzWR72ADmfF9aVTdQPR
	u6ugW+4pGEQjwyv8HtvcfXDEsYGx0B19aoTVbmgvFmktzx+TKVGGatcoclLZkt9apOEOAUAniZuXI
	AM8Pf3ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNRsu-0000000HLpB-0DLh;
	Fri, 06 Jun 2025 07:53:04 +0000
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNRqj-0000000HLZy-2Hv3
	for linux-mediatek@lists.infradead.org;
	Fri, 06 Jun 2025 07:50:51 +0000
Received: by mail-lf1-x12f.google.com with SMTP id 2adb3069b0e04-552206ac67aso2053708e87.2
        for <linux-mediatek@lists.infradead.org>; Fri, 06 Jun 2025 00:50:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1749196247; x=1749801047; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rm4T5ss5l6d5YD6Na8dlxdY8BKrMjQHyc2yVXx42+4w=;
        b=bTn/EPoX5bS0TKV2FXUy9vTG0wKLtP8guR0Uv0mq27902GM9SzERyx8JYi50mG3dX7
         yw+BcqNp6tsSisOGKh1Dob25UqnEJwdEmn7L3QxSpUpLLDcvkFgILm25U8xs9wjXehc3
         HVsS4xLsT4lsTDf9zVNXLVmvW19kustsClbnI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749196247; x=1749801047;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rm4T5ss5l6d5YD6Na8dlxdY8BKrMjQHyc2yVXx42+4w=;
        b=ot+373p39Q+sL7QLRHSxFQj7PTq9VmRqqKKTUQcaQEB8K0Sv9lVgKbc3LZnRtMidgJ
         8gIK8kBHXPdIaDjEkiu9KOa5rfDdb9V5ryXo28jI4AiK6MCKI7eIL0GNac+kMdrvDl1Q
         kT3FJD8N2DvdSNHvxdLqm2L4NG4Tl5caYpnWGFps/vwyt4s+J3ixQZeEZoeql4c+4dz3
         kmij7zidpCO7Xq3dXjWrAm5cQRMsgO6eK/3ojleFU8NpiTQcnkeoiiqHoWhWbuO6rSRb
         Fwc8zIEGL7C4flkGufckE0xbviDUKhaytm4Ry428oiiqVor4pw9vGaindTDjpr+2i1SF
         TwGQ==
X-Forwarded-Encrypted: i=1; AJvYcCVQk+BCTt8JQABuc/WnGIrLAxf7QunfMN9t4iwdg3mFgnjMmtWNqtKg0dg1SQSs36g0hfXg1PLooLP8kEL/Dg==@lists.infradead.org
X-Gm-Message-State: AOJu0YwQEDql+o4YVxlgRjYLgLW6kf8K+X5KX1CDDJgsFu0UHdd1SzyO
	rqvQXn2v93I2wkCRnWlXDTL870LrLmmZSogeZJukM0So7ZqmKEMhax+jOdD+XG7QVLWrXI+IzLV
	JP+yzNjs6SM5Uks0qpgaLArlgN3UIZlnZzbJ9b7KEFWcX/1Uc4NE=
X-Gm-Gg: ASbGnctM/8Kq9NbYCR0G4V2xXO/V0S/hYec4haAZ756ji1PcAxcTiBvr6pWVdQvwL33
	dNeeVMu9umHbyPCwuTQVEDlC1dlHiRpHEYhmot1TATYBy0VV/qNGV1vpfs68rBrt/ttEePmfYzW
	FNWKRN2RfOsfnpFYgzZj4Qstu7ZuSk5x6DqRMGNWxKAr89yWBVM2FHeX/IsY5RcRK+cGaCYEU=
X-Google-Smtp-Source: AGHT+IFbKR4s9CitEfgNJcsl0QhC9Vk4xSWEUHEwXIP7bIcoci9LebkzJqucGfI4/l4+Z99afgP92CHraRrtTZAdj/I=
X-Received: by 2002:a2e:b8d6:0:b0:32a:8846:9776 with SMTP id
 38308e7fff4ca-32ae70d541bmr2192651fa.22.1749196234912; Fri, 06 Jun 2025
 00:50:34 -0700 (PDT)
MIME-Version: 1.0
References: <20250421101248.426929-1-wenst@chromium.org> <20250421101248.426929-2-wenst@chromium.org>
 <CAD=FV=XLonF5qM+f6diESvnqAHKm4Y7wwPsNssdNqZfkn2OzSw@mail.gmail.com>
In-Reply-To: <CAD=FV=XLonF5qM+f6diESvnqAHKm4Y7wwPsNssdNqZfkn2OzSw@mail.gmail.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 6 Jun 2025 15:50:23 +0800
X-Gm-Features: AX0GCFt9WzCgD2IIEFQ5utFqrLWuXwM5tZhCHvVXVAvSJ22GZSGtAIfEBPnfCtQ
Message-ID: <CAGXv+5E3bJf0o8y4kve_f+EefKqcOeW99VA_HcgKRm2+Bj+uhg@mail.gmail.com>
Subject: Re: [PATCH v2 1/8] dt-bindings: HID: i2c-hid: elan: Introduce Elan eKTH8D18
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Doug Anderson <dianders@chromium.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Benson Leung <bleung@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, chrome-platform@lists.linux.dev, 
	linux-input@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250606_005049_576103_AF646C08 
X-CRM114-Status: GOOD (  22.73  )
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

Hi Dmitry,

On Tue, Apr 29, 2025 at 3:34=E2=80=AFAM Doug Anderson <dianders@chromium.or=
g> wrote:
>
> Hi,
>
> On Mon, Apr 21, 2025 at 3:13=E2=80=AFAM Chen-Yu Tsai <wenst@chromium.org>=
 wrote:
> >
> > The Elan eKTH8D18 touchscreen controller is an I2C HID device with a
> > longer boot-up time. Power sequence timing wise it is compatible with
> > the eKTH6A12NAY, with a power-on delay of at least 5ms, 20ms
> > out-of-reset for I2C ack response, and 150ms out-of-reset for I2C HID
> > enumeration, both shorter than what the eKTH6A12NAY requires.
> > Enumeration and subsequent operation follows the I2C HID standard.
> >
> > Add a compatible string for it with the ekth6a12nay one as a fallback.
> > No enum was used as it is rare to actually add new entries. These
> > chips are commonly completely backward compatible, and unless the
> > power sequencing delays change, there is no real effort being made to
> > keep track of new parts, which come out constantly.
> >
> > Also drop the constraints on the I2C address since it's not really
> > part of the binding.
> >
> > Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> > ---
> > Changes since v1:
> > - Reworded commit message
> > - Dropped the enum for the new compatible string entry
> > - Dropped constraint on I2C address completely
> > ---
> >  .../devicetree/bindings/input/elan,ekth6915.yaml     | 12 +++++++-----
> >  1 file changed, 7 insertions(+), 5 deletions(-)
>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>

Can we get this merged for v6.17? Or could you give an Ack so that
it can go through the soc tree?


Thanks
ChenYu

