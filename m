Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C01C1C5AD5A
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 Aug 2026 04:40:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y8EqzbJg8fD3KowEEfKkshsn5eXfhPp6NSIWl0mIxuU=; b=zhZDy7e1HrSheSOq9lqtl5PLU2
	BiHy8RZ2u4I7Vz7KjftYvtnJiQXK367sNGETFVeKDkvTV1+NlMR/9o1hlpWc2UL39AELbWJeCzf/3
	RH4Xi8Z9gj+8toKTTANtNPgvfSuJR1kbUjmTDim8RozZq06UWFS28Xlpy2nr6XR/GwildG6Y0vLUW
	uY9lXBWYMS4EUTLYfJpeFtGdD8IcY4GB8CUFvJTASTz7K0iUCxLQ8jHgDxji1V3VTcaD69Tr0JgAs
	XIwxci8mo6M+JB3WD8AH7NGjOIsFKTDOcKFxck7KEj0KbK0f/JMQewzub72/MObOAqQGLGAGgeSBG
	WrHL1lnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wu0kx-0000000FPHh-13EM;
	Wed, 12 Aug 2026 04:39:59 +0000
Received: from mail-oa1-x2a.google.com ([2001:4860:4864:20::2a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wu0kt-0000000FPGc-0HJH
	for linux-mediatek@lists.infradead.org;
	Wed, 12 Aug 2026 04:39:57 +0000
Received: by mail-oa1-x2a.google.com with SMTP id 586e51a60fabf-456395f4e7bso468720fac.0
        for <linux-mediatek@lists.infradead.org>; Tue, 11 Aug 2026 21:39:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786509594; cv=none;
        d=google.com; s=arc-20260327;
        b=sZ/EDAr+Khcv2jOkzrEJRAioF5DZkc0u/LF/bFIGUB7w/m9WqHUdTEHisSJ5EoOnh4
         YYpNF1SSgoDSAiMZeca/3Ckd5FBNRcm19eCyOkvOHXzv7cZn3Pv4wmKmpwhsPSsf6TqR
         xd1+ujUiTBLX/YoOvwh6soOfo1hQQtFBJ7l3O/bMaMynLXYLdKqfdQgIE2QqSBXijRLU
         CwJ5kaukOCC9WzTgL62AxfJVQIy/4sgX25/SkK/9ZlwUW+FfTOF5v8EN0VpBvxeD/9cB
         2TFi5MU9SSmYGZ7CFByh8XyuYv2wxxdb9WnZPEouq/McaspGtTmDJlmCwZxwAVsryOg3
         HORg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=y8EqzbJg8fD3KowEEfKkshsn5eXfhPp6NSIWl0mIxuU=;
        fh=3xjMrKdcKwCFr7MsaPMMvSWlXjnVZ++WIGqlmUnLWK8=;
        b=KErIPGs5mMDpjiySPaBv3/W4AiqQAbFOsgOL8ikusEt1N6UASvvRBVb40vGwmd/ERh
         3IPOporaY6WPJJNC49kpGOsMKV5c4V25V7ri77zM8ANhRlObZt4voPxH8U7ABe+KxBUC
         esIUEMuZQU1CQJ4oqigG/lXdWpuJAOuBiRggZYpgEGuJU6DupxihqxCKkdq/JnbOFvlH
         0sc22A+XKqjUQ1K3AkzB7+3ckd7OAazr0XaatmM2Xs39AtBFZStgwS5TSzxfmI3CBMwL
         DkB97Q3zVi4AfURGp7pSWxiqCMmzHG4zV2Prn+ZQsv0mtyOwH/C8/goTsX2B+vJlaf2O
         pqIQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1786509594; x=1787114394; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=y8EqzbJg8fD3KowEEfKkshsn5eXfhPp6NSIWl0mIxuU=;
        b=Iup0tSiz9+wfJSEVRQdeBRVC9XX1egfRngUJEofTm95UGhO8gvkO19ZLKtmbRCEId2
         ixvKcKbZSS6iDCvHoasCZUoZPfl3o5OrfaLdJpYTzRKeVbm6RIQ1LCJE70Wg9rWtYfTC
         ZivLYf8ybyDsbLhrRrF99T0+HFBe8j7PxhEsM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786509594; x=1787114394;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=y8EqzbJg8fD3KowEEfKkshsn5eXfhPp6NSIWl0mIxuU=;
        b=hz6naLuv8xN97+Kkkqwx07125FQSzcMH4F9cUUNiBsLiBGJfKfcJIezlzZGLB1+rpt
         satkgMtp8vjRur1EAlgCkuHDARBCzlaPt/I6LHMnpLxxTQ6FXOTVMf02vkcoJY8VupdN
         x9NB0zmp2q1xi+5lJ3ZOPbjeJSzQt5kNGA0QuhpQkpy1fFERK/5dgqr9Z8Jo6Yg4aWio
         e7/L2ti3rLEcSiXsnKQvBaGofReIXSfTjaqq6w2lOKXhjMJJUkHsS71lHm0nhQ4seY3Y
         zPYUINUQi5ARTVynMqyKjJQvLx1H4LCTmY3uyMmjPkYhICPXsFC/9wbj2Qbn3i/0zYtp
         Zwiw==
X-Forwarded-Encrypted: i=1; AHgh+Rr1XJQbivuFBp3CpHUsKbzq3lyDjeYbjpBe7MYFzj++AQpJq+xiub5WBMhUjo7IbheZ9ep1xCOxtSBb4HltRQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxjPx4jKHFUfIemD2mEgELBwZq/g1Ed2PS0Qf2lBPKvqC7COxQO
	rGQljFsGuLN4qY0BUmEQU1/Hi7NKElQ1Tcr2uXyNdCHXW7LRMciCM6jRUJv0CTaet3zX87Cxhr9
	ECX3u6E4Q9T8PfkG5MaKoaD+po3Z6Xnydya6Zwufg
X-Gm-Gg: AR+sD11P3+evCElzeCY0L7j2olywMV18TTkQFMgUqJaxtz8MhgJB7+6X2jadMuSdJ87
	vS5pJYgwg0690x6ecr7pnkwtMZI15C8ek5j+lifIYBgfp1ud8y7eZJvspqsgD/bNJl7VeccYPel
	ecr31O99simUQWp1RgVhx/TF/Ontf+kw6wd5kCCOeSOsUwl6Fq0pphbXE2XO5/+toh0zkYDj2tT
	1RB2c19v1+FtEQuYzlKMGTgRhwzc/wIrXdIBKT/m1KZdeo6DSD2BRBAazJx/4TxbmmqYmlSulZ9
	RlqOacbS7saSZzrbAYAgK6B3oXdDvYm94w54RELDbHbid2mYxzAbKrA42BlMQoJ6/R0KQysG5EF
	UDTWqcTM=
X-Received: by 2002:a05:6808:2f13:b0:495:d7ec:b6be with SMTP id
 5614622812f47-4b210ca8dc6mr1833103b6e.18.1786509593853; Tue, 11 Aug 2026
 21:39:53 -0700 (PDT)
MIME-Version: 1.0
References: <20260811122011.3539250-1-wenst@chromium.org> <20260811122011.3539250-2-wenst@chromium.org>
 <99ad23ba-f8f2-404b-960e-1c22a20c9ac4@sirena.org.uk>
In-Reply-To: <99ad23ba-f8f2-404b-960e-1c22a20c9ac4@sirena.org.uk>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Wed, 12 Aug 2026 12:39:42 +0800
X-Gm-Features: AUfX_myPgwTrMoDWlXxd7K4JTdOxXQP71DAA9qzbfq1hbTylwiYJcqKiFEh4if4
Message-ID: <CAGXv+5EeEQM6O8Vb8e8fGjRzMe1icmz=cPm3GoKLxvEO=weVcA@mail.gmail.com>
Subject: Re: [PATCH v4 1/9] regulator: core: Add "enable and wait" functions
To: Mark Brown <broonie@kernel.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Benson Leung <bleung@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Jiri Kosina <jikos@kernel.org>, 
	Andi Shyti <andi.shyti@kernel.org>, linux-mediatek@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	chrome-platform@lists.linux.dev, linux-input@vger.kernel.org, 
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260811_213955_107603_A85CA383 
X-CRM114-Status: GOOD (  19.40  )
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

On Tue, Aug 11, 2026 at 8:43=E2=80=AFPM Mark Brown <broonie@kernel.org> wro=
te:
>
> On Tue, Aug 11, 2026 at 08:20:01PM +0800, Chen-Yu Tsai wrote:
> > In device power sequencing and initialization use cases, it is common
> > for the driver to enable the regulator and then wait for a certain
> > period of time to pass before continuing.
>
> Please don't bury core changes for subsystems in the middle of random
> other serieses, this is the first time I've seen this.  :(

Sorry, that is entirely my fault. I was using an old v1 recipient list
on the previous two versions and that list didn't include you.

> > One case in particular is not optimized yet: a regulator left on either
> > by hardware reset default or by the bootloader, but does not have the
> > "regulator-boot-on" property set. As the enable timestamp only gets
> > updated when enabled by a consumer or by the core, the first enablement
> > always needs to wait.
>
> Just take a timestamp during registration if the regulator is enabled,
> we check if it's enabled anyway so we may as well take that as the last
> time the enable happened.

Yeah, I just haven't figured out where exactly in regulator_register() to
put it. I think it should be after the supplies are resolved, so maybe
I could do this in the "final setup" part in regulator_resolve_supply()?


Thanks
ChenYu

