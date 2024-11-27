Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5AB2D609A7
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 Nov 2024 07:28:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1oZqeCiNDi+VUMlqaFu0Cj3Hfsp6EOFS1u82qR+tNuM=; b=kp0YwWtwIk1mx7cIWJuJbrlB8G
	NmlipWvDmCIU6l9aFDuucerRjufqbvwqUVASxeuMmGT2gXvr+L+p8G0fKw0WzBafOf3WgPKAV73m6
	lAQa3pq6IlsWdeBJZ2EYrR03SaeBl44NtqfhczYZ6B/8jjDz0cShxVRhY8ngEhdbN7y1FhbtnA+iA
	kinAgoKrgJh6F1R54CJ5NR7Vl6esp0z29hRVRcEnqOvaX6geGOGiIJw9KZCF07hDA7soAy6k6AkNB
	JypjF/4felkTOh5xJtUEfsDFTAFVob4vbG+iQ8wKav8buJmJUihI/sQKFWOqxLUripqg/z/qRxFEc
	Ku4qhjLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGCSu-0000000CREw-3lPR;
	Wed, 27 Nov 2024 07:28:00 +0000
Received: from mail-lj1-x236.google.com ([2a00:1450:4864:20::236])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGCSs-0000000CRES-20z8
	for linux-mediatek@lists.infradead.org;
	Wed, 27 Nov 2024 07:27:59 +0000
Received: by mail-lj1-x236.google.com with SMTP id 38308e7fff4ca-2ffd5b4c0ffso10354511fa.3
        for <linux-mediatek@lists.infradead.org>; Tue, 26 Nov 2024 23:27:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1732692476; x=1733297276; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1oZqeCiNDi+VUMlqaFu0Cj3Hfsp6EOFS1u82qR+tNuM=;
        b=GzXZyAFwgEiqycb6UAPvASzrkyj4FVtce8PKtkZyJqIQsBex+OaHrJMqvXdSLM9IaJ
         r3CSH9SrFMQAycmROBKL9mjjNe9A0hqxJOGXTXpyvyNUsj3S1NYULGs4dvc+4b5+cpS4
         opzZjiio+T4+vUX0Fvm7Xr8m1HzDbuf4EPmFc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732692476; x=1733297276;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1oZqeCiNDi+VUMlqaFu0Cj3Hfsp6EOFS1u82qR+tNuM=;
        b=vNQ0MpXcCDvrMp6BM2g16yLJ19/sJsHJYAa/MXf7rMrY+FpJf5F3f0pQHKRe2wNVHC
         cPEnuVP31b+h9sqjcc2qAVvy2g7n/0GxgFgjKw6HuGQUxvk0Fyix8S4lT+/hhiUHhuJH
         n+YdtcLlvzjT/3/hAYpdD8QeBAD2KmzdP1WpdRbp1x3sHrts9A4uO8RnmjFMgybQWU9r
         fcav2gh4uvojRnpgtjgUOfQbOhFQZsSegnEgeCdArbRlw38cbW2H8oXh95wJvwwq+ahE
         YkYBa6dyaxHnsUM/Hc8Hbwj2sN6hVR7GFefADiPO6wSgExm2/tC7JNSO/8M/7YPVOwBJ
         O/Dg==
X-Forwarded-Encrypted: i=1; AJvYcCVhxYHNkv2xvxrlfFjdsCuJIfdLhLvWU8quKQ3nIbCdrg+gVzSXi+E9ctVTFpcSYoxnBk4cMjzLdv17nl3WaQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yywkr+7Al24JB4M76FXxt+Jv1tNMUpD263lsEgoaekAE0lDMswF
	IbGpcs/h8tsub7Q3+pPvbAVZRRy5x/CKD/dJYg2S0k56UZAQrpgiUZQXJLhiBnlD6uN4SHjXCBd
	dDqtY
X-Gm-Gg: ASbGncuOU+e6gRXjfyswpvc7aAxtnAG7h24YQyFIcuUJWcPZ5YgiM3jGgfxmbgavYRi
	JvsnPr1BLlE5CtoJGKkcGmt4BC8yjxBOoimoVqd7XsnwNZRBlgmReg2wQuN3P8xdpLylhlmz4uL
	yp8mQ5cKR9eWmn+cQIetDfRsbJZixt7gij1ckFqJj4QUuLFxR+k5pq64VCJ2JiL0bM5GKjpSQ2f
	8vYesmQuImAaW+jSM7P21ibio73eIggIJxnAjvFqD+OT5NR7eGb2rdWY35c3HzNOdZdrwXx4oAm
	OT9+NwlpSDQ7j5Gl
X-Google-Smtp-Source: AGHT+IGSxRwqwg7H8eXwnoSnwDeAlbnu7TrKlqa7urk37mQMe1hsfkngWaY+o8VL6PIMB19j34QPpA==
X-Received: by 2002:a05:6512:3b0a:b0:53d:e8f5:f968 with SMTP id 2adb3069b0e04-53df00a9840mr1314802e87.5.1732692474993;
        Tue, 26 Nov 2024 23:27:54 -0800 (PST)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com. [209.85.208.47])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa50b5b178dsm672487666b.170.2024.11.26.23.27.53
        for <linux-mediatek@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 Nov 2024 23:27:53 -0800 (PST)
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-5cfc264b8b6so4724a12.0
        for <linux-mediatek@lists.infradead.org>; Tue, 26 Nov 2024 23:27:53 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXGzUKnlP4Q8AYKzSwIDyrE7+Z5Gd8JAglvq+T2d5lk0RtrgDNyEMjGMUt3zcHj5AAFm7MaKDpWtda9Wi+jVw==@lists.infradead.org
X-Received: by 2002:aa7:d80b:0:b0:5d0:3ddd:c773 with SMTP id
 4fb4d7f45d1cf-5d0819b8bf8mr48974a12.4.1732692472728; Tue, 26 Nov 2024
 23:27:52 -0800 (PST)
MIME-Version: 1.0
References: <20241125-mt8192-lvts-filtered-suspend-fix-v1-0-42e3c0528c6c@collabora.com>
 <20241125-mt8192-lvts-filtered-suspend-fix-v1-1-42e3c0528c6c@collabora.com>
 <CAHc4DNKmGA-MjTWdZhKygiaRwN7mHnMCf8UPUxH_V16uZifzFg@mail.gmail.com> <f38e4283-7133-4865-b4fe-eafb6bd30534@notapiano>
In-Reply-To: <f38e4283-7133-4865-b4fe-eafb6bd30534@notapiano>
From: Hsin-Te Yuan <yuanhsinte@chromium.org>
Date: Wed, 27 Nov 2024 15:27:16 +0800
X-Gmail-Original-Message-ID: <CAHc4DN+S6mBy_VRTWEqp-uA13zUyadtqPoo+-WZTmwYHofpkcg@mail.gmail.com>
Message-ID: <CAHc4DN+S6mBy_VRTWEqp-uA13zUyadtqPoo+-WZTmwYHofpkcg@mail.gmail.com>
Subject: Re: [PATCH 1/5] thermal/drivers/mediatek/lvts: Disable monitor mode
 during suspend
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>
Cc: Hsin-Te Yuan <yuanhsinte@chromium.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Daniel Lezcano <daniel.lezcano@linaro.org>, Zhang Rui <rui.zhang@intel.com>, 
	Lukasz Luba <lukasz.luba@arm.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Alexandre Mergnat <amergnat@baylibre.com>, Balsam CHIHI <bchihi@baylibre.com>, kernel@collabora.com, 
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	Chen-Yu Tsai <wenst@chromium.org>, =?UTF-8?Q?Bernhard_Rosenkr=C3=A4nzer?= <bero@baylibre.com>, 
	"Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241126_232758_523443_5BB3FC7A 
X-CRM114-Status: GOOD (  25.42  )
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

On Tue, Nov 26, 2024 at 9:37=E2=80=AFPM N=C3=ADcolas F. R. A. Prado
<nfraprado@collabora.com> wrote:
>
> On Tue, Nov 26, 2024 at 04:00:42PM +0800, Hsin-Te Yuan wrote:
> > On Tue, Nov 26, 2024 at 5:21=E2=80=AFAM N=C3=ADcolas F. R. A. Prado
> > <nfraprado@collabora.com> wrote:
> > >
> > > When configured in filtered mode, the LVTS thermal controller will
> > > monitor the temperature from the sensors and trigger an interrupt onc=
e a
> > > thermal threshold is crossed.
> > >
> > > Currently this is true even during suspend and resume. The problem wi=
th
> > > that is that when enabling the internal clock of the LVTS controller =
in
> > > lvts_ctrl_set_enable() during resume, the temperature reading can gli=
tch
> > > and appear much higher than the real one, resulting in a spurious
> > > interrupt getting generated.
> > >
> > This sounds weird to me. On my end, the symptom is that the device
> > sometimes cannot suspend.
> > To be more precise, `echo mem > /sys/power/state` returns almost
> > immediately. I think the irq is more
> > likely to be triggered during suspension.
>
> Hi Hsin-Te,
>
> please also check the first paragraph of the cover letter, and patch 2, t=
hat
> should clarify it. But anyway, I can explain it here too:
>
> The issue you observed is caused by two things combined:
> * When returning from resume with filtered mode enabled, the sensor tempe=
rature
>   reading can glitch, appearing much higher. (fixed by this patch)
> * Since the Stage 3 threshold is enabled and configured to take the maxim=
um
>   reading from the sensors, it will be triggered by that glitch and bring=
 the
>   system into a state where it can no longer suspend, it will just resume=
 right
>   away. (fixed by patch 2)
>
> So currently, every so often, during resume both these things will happen=
, and
> any future suspend will resume right away. That's why this was never obse=
rved by
> me when testing a single suspend/resume. It only breaks on resume, and on=
ly
> affects future suspends, so you need to test multiple suspend/resumes on =
the
> same run to observe this issue.
>
> And also since both things are needed to cause this issue, if you apply o=
nly
> patch 1 or only patch 2, it will already fix the issue.
>
> Hope this clarifies it.
>
> Thanks,
> N=C3=ADcolas

Thanks for the explanation!

Regards,
Hsin-Te

