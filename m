Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 778F9CF538B
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Oct 2024 13:48:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v1ErG2T9UQjEKEnbXbgxig/MiNVygt+6QYl0dpxRA+w=; b=ZYkhcNkws83IPMOyuIqlss7ANd
	Jel60lLJNK8aO6/8PWaZ8wWO0JZ9LhMoILJfBCeGh8bolrXJdxi9o7FV2HEjmey9XE0f/q4dBySyj
	GH/vjFpnM0Cqmt0IneqasBJF7NSylTkGaXZcvkajtNpL/ehH0xzvWOBj6vAyNJaqa3vz2jfRY7aKe
	JCWvIHp5uZr4n7gmHSrtJxKaEe1SpjC4YQV5QcC6qz/oU+19+t77HprggNgSpZXEBWv7cBoAKCzHc
	dqQ+c+4PEPXXTLtJu4EKbqSIvxgFRV/YWADFMDblkwvzdepDLAaGEgvqcknChkKByvIvRts8OIc1L
	HylL7yVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3bii-0000000Eb1n-1yl0;
	Wed, 23 Oct 2024 13:48:16 +0000
Received: from mail-ua1-x92a.google.com ([2607:f8b0:4864:20::92a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3bif-0000000Eb0z-2DL7
	for linux-mediatek@lists.infradead.org;
	Wed, 23 Oct 2024 13:48:15 +0000
Received: by mail-ua1-x92a.google.com with SMTP id a1e0cc1a2514c-84fc0212a60so1791906241.2
        for <linux-mediatek@lists.infradead.org>; Wed, 23 Oct 2024 06:48:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1729691292; x=1730296092; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v1ErG2T9UQjEKEnbXbgxig/MiNVygt+6QYl0dpxRA+w=;
        b=V9zT8FtaI+YaOP817lvoy4+AdFoMfTdL0WuRhZAfRaFS36+7wouu3jjmVZ7ruuvUX3
         mmnFEXu1hUfo4eXdBeAILenVPii01ncZQ1aPiKgfyiDanSxWH7NTdbTt4YRQemIf0Caa
         VV6P7pDNPAyguQUne+LMsJ2Cyd7goTrtfUx9k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729691292; x=1730296092;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v1ErG2T9UQjEKEnbXbgxig/MiNVygt+6QYl0dpxRA+w=;
        b=toqTnx1TRWobqlfuqZuQhbSnps73aaZbIptnwJ/p1ZF06Md/R5vQi7LFE7juT68PiH
         7bpshfu8+j7qw7I2/9Dc2fZpYtcc6rYdI8msajy7nULs2XPo2WfgFENRGbiEXUcljNx6
         R13trmS1iMMPWET+sfZR973zgdsMvLZ1+VAN2+szcjE0jB48HyL+LcigBCTxba9xuaTL
         tysNOgcqZcDvw9BrGppegaoqs2jQ7NrdCFHflHXZ1Hw49NDsNYT7WVHm+U6joBNjjFmd
         cq2phjU/NPrwe0JnTZVDjUHAaKdfe2m3p9fYbfXLovWuo424mvtdJQulzgnZJ5qXqdph
         1lug==
X-Forwarded-Encrypted: i=1; AJvYcCVIbvKCuH6GPhaCsruno1FkWNE+2LgEMa7TNCYnmCLMleY3JHylhM6gcVM+gIq+Q/fV8btB114jHEim71QZlg==@lists.infradead.org
X-Gm-Message-State: AOJu0YwcC4jq/yUoOPpcldshtO7oxVy++xzTgavG9iqZAWW3kkdxXmSY
	LQdBe/W0gBo5I2Q+r+HlCLVYxjaqt6513Ks83rXbNM2wfeDV3rermlbTN3UoTsvm4hYTl2r8kLu
	IpQ==
X-Google-Smtp-Source: AGHT+IHQiqq/16TfiPyFT+M0LWfgWSfXa4yyKMRxkTC6rihIZBF7R/rAuzk/Rt+BexaPBi5akbRibg==
X-Received: by 2002:a05:6122:1d42:b0:50a:12e4:2618 with SMTP id 71dfb90a1353d-50fd01b9273mr3294950e0c.2.1729691291761;
        Wed, 23 Oct 2024 06:48:11 -0700 (PDT)
Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com. [209.85.222.53])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-50e19e9717fsm1041211e0c.23.2024.10.23.06.48.10
        for <linux-mediatek@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Oct 2024 06:48:10 -0700 (PDT)
Received: by mail-ua1-f53.google.com with SMTP id a1e0cc1a2514c-84fd057a993so2259210241.3
        for <linux-mediatek@lists.infradead.org>; Wed, 23 Oct 2024 06:48:10 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVWKLJzk3a+nznU36Y65HJvgyDENrCjSAb2Lyfm6JRj2Re1HmekrCRdISU5Hvq2xyVzhI62Nb95XOQTqRlE+A==@lists.infradead.org
X-Received: by 2002:a05:6122:513:b0:50a:d1e3:82f7 with SMTP id
 71dfb90a1353d-50fd031e55fmr3184053e0c.8.1729691290235; Wed, 23 Oct 2024
 06:48:10 -0700 (PDT)
MIME-Version: 1.0
References: <20241023102059.512352-1-fshao@chromium.org> <9b12aaec-504c-4e3a-a606-240341d8e0d3@collabora.com>
 <CAC=S1niSXkCTLXeCv-0sQh4AQmv6eKm8OH_3yH=TeDoMVz72OA@mail.gmail.com>
In-Reply-To: <CAC=S1niSXkCTLXeCv-0sQh4AQmv6eKm8OH_3yH=TeDoMVz72OA@mail.gmail.com>
From: Fei Shao <fshao@chromium.org>
Date: Wed, 23 Oct 2024 21:47:39 +0800
X-Gmail-Original-Message-ID: <CAC=S1ng=ZLB+vB=kNywLGMdeN1RRted0j6d-fC9ANoyu=ni3Mg@mail.gmail.com>
Message-ID: <CAC=S1ng=ZLB+vB=kNywLGMdeN1RRted0j6d-fC9ANoyu=ni3Mg@mail.gmail.com>
Subject: Re: [PATCH] soc: mediatek: mediatek-regulator-coupler: Fix comment
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241023_064813_624879_837C0124 
X-CRM114-Status: GOOD (  18.61  )
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

On Wed, Oct 23, 2024 at 8:03=E2=80=AFPM Fei Shao <fshao@chromium.org> wrote=
:
>
> On Wed, Oct 23, 2024 at 6:40=E2=80=AFPM AngeloGioacchino Del Regno
> <angelogioacchino.delregno@collabora.com> wrote:
> >
> > Il 23/10/24 12:19, Fei Shao ha scritto:
> > > Fix two minor issues in the comments.
> > >
> > > 1. We balance VSRAM voltage based on the target VGPU voltage, so the
> > >     comment likely refers to VGPU.
> >
> > Function `mediatek_regulator_balance_voltage()` refers, as stated in th=
e comment
> > located at the top of its signature, to "GPU<->SRAM" voltages relations=
hips.
> >
> > So, we're taking into consideration only two regulators:
> >                    VGPU and VSRAM
> >
> > The first comment says:
> > "If we're asked to set a voltage (implicit: to VGPU) less than VSRAM mi=
n_uV[...]"
> >
> > ...so, I think that you've misunderstood what the comment says :-)
>
> Let me make sure we're on the same page - VGPU never goes higher than
> VSRAM (VGPU <=3D VSRAM), is that correct?
>
> [ min VGPU, max VGPU ] ... spread ... [    min VSRAM  ,  max VSRAM    ]
>  (min_uV)  (max_uV)                         (vsram_min_uV) (vsram_max_uV)
>
> The longer comment is
> "If we're asked to set a voltage less than VSRAM min_uV, set the
> minimum allowed voltage on VSRAM, ..."
> So VSRAM is the subject here I think? Because we "set voltage *on*
> VSRAM" based on its own minimum allowed voltage? We never set either
> VGPU min/max voltage to vsram_min_uV?
> And it's attached to the line that decides vsram_target_min_uV, with
> the maximum of (1) vsram_min_uV (i.e. minimum allowed VSRAM voltage)
> or (2) min_uV + max_spread (min VGPU + spread)

Ah, I just got your point. Both interpretations can explain..
I linked the "min_uV" in the comment to the one used in code, which
stands for VGPU min_uV, so I had the impression that it was a typo.

Regards,
Fei

