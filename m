Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA9C3C678D5
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Mar 2023 09:27:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h6O4zV+wYZ6GyzPQY6V2bUaFgM1LKFhXGuewMvfDT80=; b=Mz/aJ5DTWS38xIR0e57NARLdcs
	MTj0/uU7Tki/w2Kw+4icIuTvHJLLF8jUIeMlvuEZIBWtbkvyADLlC00GeT0+YpQNI5GE9tyCgJ2BJ
	bg57lreuMK3hCQCf8B/JZPdirfiOBSoncQYYhm6DEpOgSHfs4axLAd8d5ei0tS9Ye6Qm4ZKckuxIf
	D8b6X7xiCP4c33/VL72AuekCJvANjE2bYhIsZudV1w/CU6IYWzgBRGQTeND+pLX4DcnG97c/UMHXm
	9DVxSEf8tYS0Mj2KSTveRxPQdOCD1vPC2yXLfd+nFTJ2xqC2rYvFyXfuwfTfJKYhkxblZbWtCaSlN
	NA45f6Dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZTbI-00GtOZ-Bk; Tue, 07 Mar 2023 09:27:16 +0000
Received: from mail-vs1-xe31.google.com ([2607:f8b0:4864:20::e31])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZTbF-00GtN7-LD
	for linux-mediatek@lists.infradead.org; Tue, 07 Mar 2023 09:27:15 +0000
Received: by mail-vs1-xe31.google.com with SMTP id d7so11754424vsj.2
        for <linux-mediatek@lists.infradead.org>; Tue, 07 Mar 2023 01:27:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1678181231;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h6O4zV+wYZ6GyzPQY6V2bUaFgM1LKFhXGuewMvfDT80=;
        b=H2Ti7FHW+XohgRdhghefx+zObvs6AR32eg8DMi/YKatcYQ4us8hC5AJ8FUxugv/9IM
         9Su2oTgQ4KnbRLrVBDXmeL1Jr9Z/4Y7bJlnOuSG50DBUt2ZdLBI4SvjiUcoKluFEdq5Q
         LX45ksfKK62r0uRdJkZ4DKyyJg/TDkVORPnkE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678181231;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h6O4zV+wYZ6GyzPQY6V2bUaFgM1LKFhXGuewMvfDT80=;
        b=EdQd/nuSnfTE+a1vk9FqIZ69DirQ/sUvlWNtNEKRvCaFPZpO6Y2N2frC89w9/YWV0V
         DkIPocMf3v9WFoWlLN5IIKl0UMYGf4DiemW6qGfeYqOFl69ZdhbLsvbwNI20puRFZYTf
         L0UWGkc+U94x+S8qGJP2Md4V69RjQ8rkn99VrIEUejvTQh3YPbrjrrBZo/ixQqozW77n
         kTF6776IrVVeQ6yo/shqEaisKHIZnyPwA6fXnxa6hpwuxqJyb0pjY0Fl0+zoFcZkcyEE
         mGwvP2fLuCofPYHr/PukopryTknu6yzbW3U5KQWaZlrCzwR03RPvuSDApIk5yFegCEl7
         h8SQ==
X-Gm-Message-State: AO0yUKUhSOAFOI9poj1wC8se8/pveiz+E8DOHGugpw36ZzbSXhjWKBoO
	7kWlQQ7Cr942xJSL94EvmNR7gi1VROr+G/KyOnT6Xw==
X-Google-Smtp-Source: AK7set/ZOW9YeJyWIGClae8/5JYGzkBBuuPzV7Pj8Xj2wGsnc5D4R6oFPYvzHcnhhOA+BAFliMjNDeI+1/R1tjtEifs=
X-Received: by 2002:a67:db97:0:b0:412:2ed6:d79b with SMTP id
 f23-20020a67db97000000b004122ed6d79bmr9219504vsk.3.1678181231626; Tue, 07 Mar
 2023 01:27:11 -0800 (PST)
MIME-Version: 1.0
References: <20230301095523.428461-1-angelogioacchino.delregno@collabora.com>
 <b4fc6bd8-e300-0f40-4216-8b99589c21cc@gmail.com> <895abaa2-5fd3-9928-4e53-86ce160fbad8@collabora.com>
 <CAGXv+5EPVhH-O+ZdoLeW4OZVcEtS824oracmu3jHTa8k-tEU0A@mail.gmail.com> <e5302c3e-f985-b020-5f8c-fba876768eaf@gmail.com>
In-Reply-To: <e5302c3e-f985-b020-5f8c-fba876768eaf@gmail.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 7 Mar 2023 17:27:00 +0800
Message-ID: <CAGXv+5FR5unBbdp0MDZY1TtSMoTtxzi2F4tO=3qZsh=3b3Ru9w@mail.gmail.com>
Subject: Re: [PATCH v4 00/19] Enable GPU with DVFS support on MediaTek SoCs
To: Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230307_012713_722262_53B4607B 
X-CRM114-Status: GOOD (  15.03  )
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

On Thu, Mar 2, 2023 at 7:28=E2=80=AFPM Matthias Brugger <matthias.bgg@gmail=
.com> wrote:
> On 02/03/2023 11:11, Chen-Yu Tsai wrote:
> > On Thu, Mar 2, 2023 at 6:10=E2=80=AFPM AngeloGioacchino Del Regno
> > <angelogioacchino.delregno@collabora.com> wrote:
> >>
> >> Il 02/03/23 10:36, Matthias Brugger ha scritto:
> >>> Series looks good but from my understanding has a dependency on:
> >>> [PATCH v4 00/12] Panfrost: Improve and add MediaTek SoCs support
> >>> (https://lore.kernel.org/linux-mediatek/20230228102610.707605-1-angel=
ogioacchino.delregno@collabora.com/)
> >>>
> >>> Did I get that right?
> >>>
> >>
> >> Yes you got it right - without the mentioned series, this one will do =
nothing
> >> at all (and will also fail binding checks, as the bindings are introdu=
ced in
> >> that other series).
> >
> > Please also let me test them on MT8183 and MT8186 before merging them.
> >
>
> Of course, I'll wait for your tested-by tags then.
> Thanks for testing!

Tested-by: Chen-Yu Tsai <wenst@chromium.org>

on MT8183, MT8186, MT8192 and MT8195 Chromebooks.

BTW, Angelo, I see that Panfrost keeps the GPU regulator enabled, but
the power domains, and thus the SRAM regulator, get powered off when
the GPU is not in use. There doesn't seem to be any damaging effects,
but I worry about idle power consumption.

ChenYu

