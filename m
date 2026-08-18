Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAF07C5DF7E
	for <linux-mediatek@archiver.kernel.org>; Tue, 18 Aug 2026 11:03:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BPjS6YWQ/poakltSjvNSgNnRZjwLe6wcNcWXaxoAgLk=; b=QZnezsA1v9BxBcBsjfXC72uwyP
	Ng7ijbqVKhRUvPfmhxj9IFvvZ/6xWvaWMhGehMGjdTGFZI33VJ+QzXo9ZSDDbv38n2OWrN7JxzC5c
	7xi6UDb0yqpNg1KJP1IELSaTVA7xqyu7tqUr7b57eFAYgLbguIBiItJDPzYrpDTXat1KQ8uZFJ+Yd
	b2F3OAsCZ0Ci2MjKwj4+uTf+os1ZzzpvHwOyzKDuE7EWPjUSS1xw8PqFoYUBbn5x6DI11sJoWBlC/
	1bP/exySmkkVlCwa3P/Yw3lrqu6Q+nzn1F1U8n3m7Cq5QhAMlu+Pvf8djuL9mIRxHVxs5F70HwzDL
	yVsWjGbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwHas-00000007nxU-1YfZ;
	Tue, 18 Aug 2026 11:02:58 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwHap-00000007nwo-2Vus
	for linux-mediatek@lists.infradead.org;
	Tue, 18 Aug 2026 11:02:56 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-2caed617615so58955665ad.3
        for <linux-mediatek@lists.infradead.org>; Tue, 18 Aug 2026 04:02:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787050974; cv=none;
        d=google.com; s=arc-20260327;
        b=l/EISxE0fH2Qj+Pq0hEp0jjYtN+gg4xPwireQmjTS5vAk0iohfehCnbA+Xt7bEuQ4/
         jbwL+VG99jBDPfw8psjhZzEvbY7hIg9y3CfjSxIU4KCfvjuMVWDlf0aV1+c3/HGi3KAy
         7ZBN82DFg0D6wcIbHNnJxordyYPsu2OZi5gtqlQcg034JOa7bmfwTWGrkKwBDnUHMC2z
         XdJvkkXqJlYY+fYzRbn5s52xGq4Vvyn3Hv3dbdEBeMgYAObMySjFUxSBQmmTPtNKPiUh
         XfzE1hrozhEsi7Z/tnBoOenH5tSG5h8iv+Et1HL25IAGt382l7WrfNNkzi1uiL7gfEhz
         mvoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=BPjS6YWQ/poakltSjvNSgNnRZjwLe6wcNcWXaxoAgLk=;
        fh=jLHvvfQ8FP2oHoN3+W73ht5nTdQTC1lDdF2KuLXWOac=;
        b=sVbbsJm798VTrRSQ3rL2pgLLGPAlvVDnAyQTlI4WsNlEMK8oOhwZP7bnx6K2QZRlAR
         dAlduSC9riFsVUsqW24blepIeUgdWA8Smms2yJFrQWNXa9FtcDGM0+nk35igwvC7OasC
         4mbYxxbL5Mh2a9ASuE6FJb7VfLnjbajNkmDL2LIkhSNkC8Ys356MnWNNfKhRcZG/8Om5
         AhLqCRsTH6qu2gUswOml2K6LtqNWs+j+NvWIQJI3q6Hk6EGet4XmLBBfz9ryw/BG6Xda
         MzoTO5LXXa2pj2D0cQmhDcDfGW+2j2S4LeCs5HziDa+pi8f7AHemE7OIUuMOpu5tEbiL
         C+5g==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787050974; x=1787655774; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BPjS6YWQ/poakltSjvNSgNnRZjwLe6wcNcWXaxoAgLk=;
        b=oa6gu+KLR9MiNJOZDqwJFQ4g0cbdPkkoZAJYZgib1pUaXDJwl4R1/JoGm/UKldCZsC
         DoKQelNfKUO8A1ZfrQvbYVQGfVW+x/hoonH0vEvYU23ClnvJ70uOAG6zuLOtWBgzHFpB
         m29s8OVZTH4eIHV7sqoRfSuns+Ex8kiGnogIMkonobw3DYdTeTrnF0rsxMe121c3dOwy
         OmRJm84zyJ5erTXG8qrnW/OfGdAGiykvsx4/3UgIPj7PfUq6Jstgj4DEccH38k+XUxx5
         crdPrEHjQ8OuxSprU7oGpXP2L12soh7VEGxsecEAkFmApwJ3znLCKfRiP6/7JZr/g5sk
         zkUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787050974; x=1787655774;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=BPjS6YWQ/poakltSjvNSgNnRZjwLe6wcNcWXaxoAgLk=;
        b=JIlvQFC9qU6vAxg2IyY1e7yUnteBejfLIjChjZmgieQeOBUgWQp9Vz3VEbLo4fiLoS
         Q90z/AfN9VxEkTpz7ZDjr7mNBDkUp3jzugCxlto7uzj5rMD7EqUEep5iWVepXkZQexOT
         eqpDkAfuaqfnfWq8p3EIOOPxEd2WVhDGehJm5T2OCDiQhf7LZ5N8f0DWqNAeDM+2Q5l+
         BChdBVtKAdNHhp06CWZIafUl5/UlCc3iElBCzraSdV5J7GCqJI/HWlVsXHX844Txd8/B
         Zyxb+cv7NzJD84D3Y+3pTH+c9lLiaZRA6c8SWNm/ZLkrcoP1DFiN9Gfeu/jTOJxRcI33
         txyg==
X-Forwarded-Encrypted: i=1; AHgh+Rqiw1+caA38vHv3TiuNnLlM4w68Iq15kNvs9BAFsfNdPg6LTSBDW1o2evzkplwwaCldGpraodr2W2rKlQXJnw==@lists.infradead.org
X-Gm-Message-State: AOJu0YyJOn0/jmnJU7N4PizEJGdQo7qJ31GBfcBMwgiOaCuupC6e7oFc
	cO3F29bT28SGT2yTuFBT44RzJ43QbHo6M7iiBSgSo7KxnJXfVGeaj6qWIfHEcNcEiMfjhZigwgY
	dOS7dWBAckBQMYAf1050UtjFHLk0pngg=
X-Gm-Gg: AR+sD11HQFlFN/ZU8uvYI0o4azT9fZ3v+It+EbYehRPR3bSeawhy/xHvp8UVqorgfP/
	ZcCGx0hLuDJbqg7ybqIqmD1sBDflf8Qec53uxWc2/e/1mJm2q8hYWrAuydRSL4Zvx0OlmDpijc8
	DzFznLgnfpuLngG7lhuXToHJcLYhKrypQX/DSWeDdCHvKee+fBKHyU+AergutAqmD+Wqnybfdnf
	JS2ckaH8jj+KPobUYzFFzvaDKrvuROGoVOmlcXr8+quQV/VkaY6h/I9/+KEh3Z8EX/h9RhEeQFw
	nSwopdnV0dHOx/n+uEoOt0cZavM7AkGLuqCTCOALPl8huHK+lyIxuRz/itt9muwnvKPzo9VS5gf
	MaoGEYxzSEhlYzQD297yU8lfBho0+sASBJ+OJSJ5retA0h6G0E+ThUtBZQnireht9toc=
X-Received: by 2002:a17:903:3c44:b0:2d0:8b28:517c with SMTP id
 d9443c01a7336-2d3b0d78141mr373925525ad.3.1787050973910; Tue, 18 Aug 2026
 04:02:53 -0700 (PDT)
MIME-Version: 1.0
References: <20260817104929.63152-1-phucduc.bui@gmail.com> <b3dad816-469b-478a-b6a8-a08ac8610ac9@intel.com>
In-Reply-To: <b3dad816-469b-478a-b6a8-a08ac8610ac9@intel.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Tue, 18 Aug 2026 18:02:42 +0700
X-Gm-Features: AcwNN1U_fcSxMy9R21C80tITgSmylcf4dSivVK9nzajAgmmuEsH3ejkqOedKKGQ
Message-ID: <CAABR9nFME5kYrLZUMn86sT1RaJiqzJeC7QJzqqxedL1NkZUYwA@mail.gmail.com>
Subject: Re: [PATCH 1/3] ASoC: mediatek: mt2701: Use devm_clk_get_optional()
 for audio_mrgif_pd
To: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Jaroslav Kysela <perex@perex.cz>, 
	Takashi Iwai <tiwai@suse.com>, Rosen Penev <rosenp@gmail.com>, Daniel Golle <daniel@makrotopia.org>, 
	linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Mark Brown <broonie@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260818_040255_641428_41B22312 
X-CRM114-Status: GOOD (  16.32  )
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

Hi Cezary,

Thank you for your review.


> > The audio_mrgif_pd clock is optional as some platforms may support the
> > BT path while others do not. Use devm_clk_get_optional() to reflect
> > this.
> >
> > Propagate other errors to the caller.
>
> What does that mean? Did the functional path change?
>

Previously, the code only returned an error for -EPROBE_DEFER and
ignored other errors.
After switching to devm_clk_get_optional(), all other errors are
propagated to the caller as well.

Regarding the functional path, I don't think it changes on platforms
where the clock is present.
The change only allows platforms without this optional clock to
continue probing.


> > Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
> This should be part of a mediatek-patch-series with a cover letter.
> Yeah, the mt6797 changes should be here too.

Currently, the MediaTek ASoC drivers are split into multiple groups by SoC.
I am handling them one group at a time to make the review easier.

I will send each group once it is completed, rather than waiting for the entire
MediaTek cleanup, which would take quite a long time. A single series
covering all
MediaTek SoCs would also be very long and harder to follow,
especially if changes are requested during review.

I hope this approach works for you.

Best regards,
Phuc

