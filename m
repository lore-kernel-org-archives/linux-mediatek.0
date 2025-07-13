Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0573C83F17
	for <linux-mediatek@archiver.kernel.org>; Sun, 13 Jul 2025 09:17:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=teFEt5VYoV+y5Dd7IIHlSpW2pgBGTG1QedDMUy1wx8U=; b=3YXV64KDhDc42/4PsZzvGNQ+i0
	TCuyG383I/PhI++WTjwwGrUvQIGc4NAF5iwBR12oTm5ZG8Wyc+UwUqbw/9CK1yGv3onEqINMFPaQ7
	wGh13WhTheItUavHkOeGN9BV+7ErA4yvX62O/KQyVKuDxSlJoKellklp5JWy0+Q1ON15o+5UfO12/
	e+RW1slZJqT26zmQGuxuOGM5WA+efmk1mqbYoGaSVTA2B0wBAROSdNSzyqKzKSoQLmuy9wOXKLZQw
	8ODfEanwtd56BdB6HyrZJz1s+/nDDMaRMe8LPqhkWc4w3VGgdPmvSThBj2bfZBf5VS15gE0b31pKT
	1sT8b1mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaspe-000000000Az-1Nyj;
	Sun, 13 Jul 2025 09:17:14 +0000
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uasIw-0000000HY5P-22db
	for linux-mediatek@lists.infradead.org;
	Sun, 13 Jul 2025 08:43:30 +0000
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-5550dca1241so3121576e87.0
        for <linux-mediatek@lists.infradead.org>; Sun, 13 Jul 2025 01:43:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1752396204; x=1753001004; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=teFEt5VYoV+y5Dd7IIHlSpW2pgBGTG1QedDMUy1wx8U=;
        b=l+ANhPgMvqyDQ8Dz8xlQyt02MXXq76ovLDivwUkgnZGBdPb+ykiUPT/jo8RzyQ9MuQ
         dXd7qmIv9jk6SeJygEdvSOIkaMSJ4R0H/wq8WejQNn1YM/5ThaoSvNo5gIBM2C5+H1f/
         3kwJ/JW9l8KedYxMmRkK1Dc9CZVrnsNOkiBbhgdQmPq43i2Mm5RtsCoYINRBCv4OLqF4
         pliVK9R7/jsqy+AVe69Garp/eifV11LA4Z3+eDTbtZMry5SP0FoiU9JLLWE/y/9tgTXU
         +D6yGg5sfshPIkgmVC+ewQqbSmKY8dgnkQgLiEhiTE8ghN52UlfsRzXE3jultibaQEBS
         AEgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752396204; x=1753001004;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=teFEt5VYoV+y5Dd7IIHlSpW2pgBGTG1QedDMUy1wx8U=;
        b=Q1HmUBbKdr93D1VoBU9fk47pmGim5uXHx4UYohKUpDh1eWCzFBoJ9r4Q/61A6cQAke
         nCsGPkRVIVYsby17Zu2JAxwvWKgGjAixpJh8RvJHZaZ+XrGBLbWPu9YNgjvTHKIll7mc
         RCG2ndN00/CHSqkH3G53OwXjaDe1y85UUbTnEiekWTV1DLyeQaP6HX1V0xzh2Ls3tL1I
         E3HUf5glgfH/Ih3apAmBv9SQJf/2sFoSjxw5ctOHxHGYo35wLijCWlRONSYi5NcBYHFc
         OKdJ/0r08+dL7JtPAiU/GiQnxH7xVRZa2/zOSOabFuhwXhmE8/haBlG+drJyhTTRu+xR
         H1dQ==
X-Forwarded-Encrypted: i=1; AJvYcCXsnZ3mblL/owO3HBOFkH64fbR95e6NmDcn6dEZxyTL0cjbziU3476pweOZ5yeWFH8BBVBlZgaw1qxle4Rw8g==@lists.infradead.org
X-Gm-Message-State: AOJu0YwYFdxa9chBTUwid5k6qugQlqf0BtnieWQGVsCi8VBAEkbj/fDZ
	U2CxMj7XKbrFDoN8upnH4G29nO7hF7X8rzYNhoj0w3qfGz8vBSORGR4hV3KcXbISOlKSEvRy/hY
	8Q7fIlBF+i75GwG0oKtjgmZb9lmTTJ2pJF3gLUp4/dg==
X-Gm-Gg: ASbGnctIqh+Mm15DKQAPQ/wqQQtYzW+wfPVvui88vXD9XTUPpjuK1zEzcjvw6UHMLET
	eQmreZLC45AIZA7FyfX38yzwAynRrorEZBAJCbuCaVWDhdOKXoWaeEwDlctRl8c+7lRXwj4mqu+
	n1f0LO0Kz5zGFSGvJhN8m6BYwh1H0Zu2ADK9YMw+2NiwreeIYRi9ZjalBX56NG7QxnJIv/eOc6L
	0bJdcHEK2Ua6fo8vk29sgNLdIGWrqZ0uzqiG2LNrsSaZgjSwQ==
X-Google-Smtp-Source: AGHT+IHBAbCKD5IYxg9QHbex64TGGdl/hyMZx/O9ZBosB5HyqtSevaVoy0zG6SyjrmS/Wv0vBuuPHSN0g6Rcj3+48Xc=
X-Received: by 2002:a05:6512:1114:b0:553:d884:7922 with SMTP id
 2adb3069b0e04-55a04668194mr2741453e87.48.1752396203838; Sun, 13 Jul 2025
 01:43:23 -0700 (PDT)
MIME-Version: 1.0
References: <20250709-pinctrl-gpio-pinfuncs-v2-0-b6135149c0d9@linaro.org>
 <20250709-pinctrl-gpio-pinfuncs-v2-8-b6135149c0d9@linaro.org> <CACRpkdYfRv-B=p61tVThFkjoqDGfcqOjmHxmj4wv-NYyky2-kg@mail.gmail.com>
In-Reply-To: <CACRpkdYfRv-B=p61tVThFkjoqDGfcqOjmHxmj4wv-NYyky2-kg@mail.gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Sun, 13 Jul 2025 10:43:12 +0200
X-Gm-Features: Ac12FXyIRZr_PZFqMr5GkGp0O9WQSutVaydnaLLulDe-fCJJJZygxCd1lTC-X0M
Message-ID: <CAMRc=Me561DEHio+zN6oX9oqD6ue7z-y9E+cO_7_Z3L4taQd_A@mail.gmail.com>
Subject: Re: [PATCH v2 08/12] pinctrl: qcom: use generic pin function helpers
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Alexey Klimov <alexey.klimov@linaro.org>, Lorenzo Bianconi <lorenzo@kernel.org>, 
	Sean Wang <sean.wang@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Paul Cercueil <paul@crapouillou.net>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-mips@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250713_014326_770863_CBAF963E 
X-CRM114-Status: GOOD (  15.18  )
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

On Fri, Jul 11, 2025 at 8:37=E2=80=AFPM Linus Walleij <linus.walleij@linaro=
.org> wrote:
>
> On Wed, Jul 9, 2025 at 4:39=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl=
> wrote:
>
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > Use the existing infrastructure for storing and looking up pin function=
s
> > in pinctrl core. Remove hand-crafted callbacks.
> >
> > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> Needless to say I'm a big fan of this patch set and it seems only
> this patch 8/12 has outstanding comments.
>
> Do you think you can do a quick iteration of it or does it require
> a lot of time?
>

I don't want to rush it. Let's make it v6.18 material as I want the
changes to spend some more time in next and not break anything. It
affects literally all qualcomm platforms after all.

> I am tempted to simply apply patches 1-7 to make your life
> easier past v6.17, should I do this?
>

Yes, please, they carry no functional change, it will be less baggage
for the future.

Bart

