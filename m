Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C243C4332F
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Nov 2023 17:55:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OCPAQiBeVySoeJKAHJeq5sOYdSn0tG90ibTG5f+jP5s=; b=2qU3VB3yHtsEvpswcrIMQmZm0M
	9Bss4u2L/JUIsZichm3eVsFiDa7+owFp3hNdntszs3rPbIG01n6wVJqqMcOJu0l/6Y+yKs/lozNfA
	BSEMVLx9IivYoDkXZxXviYNrZ2WZEy6PwM5m2bZpd4c0856F4GUUpGlnvJ8vl8VyOrzLKHRdmJNPe
	cF4tD0qVWSjV+pb9WfmhxSMNtvgk7sINLKH/dG8r9qOfdHyodUOeb+uSG8E9QKl62t522Z/3Wkc6h
	rvqOrpfojis1lxONwhpM88f70aECPZnk8cjyYfcls5msmltsNf1AuQIQLxdL/fSgWqWA/+aMSJL1x
	THgJRiiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r0QIq-0028lL-0p;
	Tue, 07 Nov 2023 17:55:52 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r0QIo-0028jn-0b
	for linux-mediatek@lists.infradead.org;
	Tue, 07 Nov 2023 17:55:51 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-32deb2809daso3542020f8f.3
        for <linux-mediatek@lists.infradead.org>; Tue, 07 Nov 2023 09:55:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1699379746; x=1699984546; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OCPAQiBeVySoeJKAHJeq5sOYdSn0tG90ibTG5f+jP5s=;
        b=Ix41WoNeK7pxg/Y9M1ZBWQhblrfBu1niyCk7aAGEhEV4iVJ4cTiVIyO1sJUyVxb3Vh
         Zaj77lISEIOv9/80qkCR6XHYZYnj1HY2843GRGT3gBPb6YYS3JSgL7m8Mv4flFWpdotb
         qQ+QKggrJQdJQDvnm15pekYVP3+37ZUD+9+i0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699379746; x=1699984546;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OCPAQiBeVySoeJKAHJeq5sOYdSn0tG90ibTG5f+jP5s=;
        b=faqR8J8enIV4qBS9sDKy/2MzROWBgDtwRvF66MoBd5kcJBARlJ693AoMkGMrC4W3ba
         ZPAc/tEnmRtnOHDckd2kkSJNWCOjklmQPhbPoaVho8F1WGAHIl0BKzcM8k9agDt3pq5K
         je7Jjsm/gkgijtxHzGQc2GSB3Cni5HVucezdBzAkR24QD/20MWb4RhGxC/9Mq3sN91Xr
         r0om1/xaOuBCYOMfM75cwj2a63npsgpcIGy8Rk6FkVPe/vwLMKDlkzql0KUSi1WDR3wH
         PzaHDp201r/6l/pdjmNzAd4drjNVc7+MCTeNO9YsJAPx1lyR+57/Qz6bu96W1lcIMGmk
         aMKQ==
X-Gm-Message-State: AOJu0Yx+2JTv203rWgkTjPdtzKrA+ZGSxoxAj+Khq4dER6UxHKE8zshR
	ueYJix1EjU2mkJA1ueKdAXoJ1liv7pIHi/kO7euimoum
X-Google-Smtp-Source: AGHT+IFgfd/H2RQx0zTKGtSQAkZuopJASCBVZ8PFiHIYhX2jjebip5xpWK5HrdZ0YFz4IJ+sNJ+o2A==
X-Received: by 2002:a17:907:d19:b0:9bf:4e0b:fb05 with SMTP id gn25-20020a1709070d1900b009bf4e0bfb05mr17572877ejc.11.1699379277045;
        Tue, 07 Nov 2023 09:47:57 -0800 (PST)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com. [209.85.128.44])
        by smtp.gmail.com with ESMTPSA id k27-20020a1709063e1b00b009de467a25d5sm1316748eji.13.2023.11.07.09.47.55
        for <linux-mediatek@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Nov 2023 09:47:56 -0800 (PST)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-40853f2e93eso3765e9.0
        for <linux-mediatek@lists.infradead.org>; Tue, 07 Nov 2023 09:47:55 -0800 (PST)
X-Received: by 2002:a05:600c:2217:b0:3f4:fb7:48d4 with SMTP id
 z23-20020a05600c221700b003f40fb748d4mr101271wml.3.1699379275221; Tue, 07 Nov
 2023 09:47:55 -0800 (PST)
MIME-Version: 1.0
References: <20231107072651.v2.1.Ide945748593cffd8ff0feb9ae22b795935b944d6@changeid>
 <9b2e37a0-32ee-4aa4-99e8-d37103674847@collabora.com> <CAD=FV=Xv7XKvePTZ6LKT97EViG81d8hqk+T68B5eXamKTU407A@mail.gmail.com>
 <e2e7762bfd16f67bdc253dc23a967c46@kernel.org>
In-Reply-To: <e2e7762bfd16f67bdc253dc23a967c46@kernel.org>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 7 Nov 2023 09:47:43 -0800
X-Gmail-Original-Message-ID: <CAD=FV=X-5Z0ucRqrqkoEf9T+f7zQeXq2bJ3hpPw=d11mAdvgbQ@mail.gmail.com>
Message-ID: <CAD=FV=X-5Z0ucRqrqkoEf9T+f7zQeXq2bJ3hpPw=d11mAdvgbQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] arm64: Move Mediatek GIC quirk handling from
 irqchip to core
To: Marc Zyngier <maz@kernel.org>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Mark Rutland <mark.rutland@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Chen-Yu Tsai <wenst@chromium.org>, 
	Amit Daniel Kachhap <amit.kachhap@arm.com>, James Morse <james.morse@arm.com>, 
	Joey Gouly <joey.gouly@arm.com>, Mark Brown <broonie@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Thomas Gleixner <tglx@linutronix.de>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231107_095550_246860_30E2A95A 
X-CRM114-Status: GOOD (  18.26  )
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

On Tue, Nov 7, 2023 at 9:43=E2=80=AFAM Marc Zyngier <maz@kernel.org> wrote:
>
> On 2023-11-07 17:37, Doug Anderson wrote:
> > Hi,
> >
> > On Tue, Nov 7, 2023 at 8:30=E2=80=AFAM AngeloGioacchino Del Regno
> > <angelogioacchino.delregno@collabora.com> wrote:
> >>
> >> > +static __init void detect_system_supports_pseudo_nmi(void)
> >> > +{
> >> > +     struct device_node *np;
> >> > +
> >> > +     if (!enable_pseudo_nmi)
> >> > +             return;
> >> > +
> >> > +     /*
> >> > +      * Detect broken Mediatek firmware that doesn't properly save =
and
> >>
> >> s/Mediatek/MediaTek/g
> >>
> >> Apart from that,
> >>
> >> Reviewed-by: AngeloGioacchino Del Regno
> >> <angelogioacchino.delregno@collabora.com>
> >>
> >> On MT8195, MT8192, MT8186:
> >> Tested-by: AngeloGioacchino Del Regno
> >> <angelogioacchino.delregno@collabora.com>
> >
> > Thanks! Unless someone wants me to spin it more quickly, I'll plan to
> > send a V3 with the Mediatek=3D>MediaTek change tomorrow.
>
> I really don't think that's worth the effort.
>
> Catalin can fix this when applying the patch, and even then,
> nobody is going to notice that sort of pretty irrelevant
> detail.

Sure, that's fine with me too--just trying to be helpful! OK, I won't
plan to spin the patch unless someone tells me otherwise.

-Doug

