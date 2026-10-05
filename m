Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 261EDCA5FCE
	for <linux-mediatek@archiver.kernel.org>; Mon,  5 Oct 2026 07:12:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OpaxwB2ZrsJszCEJA0sJve13Y/99r5lc2MZ3LWkGqeM=; b=j1EV8P7449qTsYla+AUj2aNeeC
	XSIwt1UwsZa/8VdOd1BlrW8EYMadLHGibrSrkzBBReh4w0GPajvhRZTz09hEQrw8knpwphyaKZRaq
	yXGhxb2hciq9q19b/bpkURWHCeRPD2IbtcYdQM1rsmmbNH9jsNlCDOKuFRaHd8/joVjI4OU64dvZl
	uNbEJG4pislFGm+FaeShEIQ3TuXtpk8xOPZAO2JqE12SXRQgYYUQS50W31lh5VBtG5OcyOwjzWm6N
	Kg7ZHWwjkpQi/dACTxZREtu0pBV9zsoHXmKbZTEfnkGGVsFqBS+9I6MzZ6lZmTpHf1OX3utHS87lU
	pBa4eQRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDcsY-0000000Fm48-2vrb;
	Mon, 05 Oct 2026 07:12:54 +0000
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDcsV-0000000Fm3Q-3kDn
	for linux-mediatek@lists.infradead.org;
	Mon, 05 Oct 2026 07:12:53 +0000
Received: by mail-pg1-x52c.google.com with SMTP id 41be03b00d2f7-cc4be0e5351so366041a12.0
        for <linux-mediatek@lists.infradead.org>; Mon, 05 Oct 2026 00:12:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791184371; cv=none;
        d=google.com; s=arc-20260327;
        b=B1mbUgSPUNeTBqpyq75F7dKwRPVBbMfVMyfjr4IF1T3gspUh9NBH5O6v7TfYCC+10/
         d9rOKrWfhmGBQ4UH/HbqyT4dqbE4sqSGZeXw6HWXFWaLmp27hAs7zJx6GdLoW3qcZoHs
         I4dDZn6MsyuAd9nwIUN7QK9ARh6n6GmB+3WS5Ru6xHTW1AuKPkauM7B0fxWSXnLDm09t
         C0jHGV1Gc8T1USs0xA2vorHEr0QQyN5swXZhtj2d14Q7Za6oXHWzJPF+drvrTrmQEhrE
         wYb+rtuzg2TEZxjXfjVa1rL+U0UX0tXC2vNbr7hZZatYXr4c3WvRF0aWAt+4cuVP3ASg
         szdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=OpaxwB2ZrsJszCEJA0sJve13Y/99r5lc2MZ3LWkGqeM=;
        fh=PcztCnGjYYxmGwIay7w4izKdU9bvgFaZUY2pQsDKZgw=;
        b=d81y3r3SyXeCyGUNbo7XvXBoJxMMbxB7i0hmFfqfeMUNVKoQ7r4bvtnlj2lGBvyIrg
         fssz84hNAsuReR0LRK3KFIsSTgyYiiEi10MzZ8V1O1mRcXZYaUUcYTQSnt2cgt3y4f41
         ZxOOLw7b9a0SSjHNQlyCHXls5Gu8Wogo4zDVS8bjkxzQQNAs8lCV0TrQA+YyygH6lAsW
         kwD6hmlaG2B2OpW/OTd6KslkA6qVtoNWunY3KTLCtQcJ4B8zgeOi3E6Aj2eNe17hfhAv
         hexHb5pG0CzDLeOKzA4dUgwZMOXHaVJKvkBFmmC43oAZXrrlFNStF96X1HkUYlUK8VID
         E/zQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791184371; x=1791789171; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OpaxwB2ZrsJszCEJA0sJve13Y/99r5lc2MZ3LWkGqeM=;
        b=O7+wjL5N12Aq5Jb63mMRXk1Q/h9UcQsQWVq/ORerjJCIHZQ7Be4nsBVt1jbgwha26F
         G6q2fGgYcLtTkHQiLSbNidSTI2JbW1aJRMTFWuUzrzZA0jODpN1Y4yRP+qVajZuwNtw4
         Drm1QO3XUzNsuPPU05K+c+YYISjba+GBjv1XdkJK8OgEVria45LNcXIohOJQymDHVU5m
         Qcst1xhOPZYLaMVjUWpK71ktWhNO1nGxkQt/SWbXD1wSPHueWzrqg3lZUi2onY5QQkZm
         nsEoQ2HkETmzcjNYWN6yXVE4PckOUWJPlTIq0PQsCS1Ctzz6LDNRAXT6Yv5HZOCgYtQp
         QGkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791184371; x=1791789171;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=OpaxwB2ZrsJszCEJA0sJve13Y/99r5lc2MZ3LWkGqeM=;
        b=bW6pOJuhiLo/mCOCHLw+Xuk8EMGNbgxWZas4eHJjq8Q+BvvNz8+weiqay2PyhVG1bL
         VE3Ybsg+INnWI6FSEYfm8vwgFRo4Oy6umNmPqJYMjMFcE5ka2Rko7BRSkC9QQn8K5GMX
         KtQDXu7rjo1DG46qqNOwDLcaUQJQa0/txqWZT6y0h9k3nmr1W+V9rvKxhF97+clqfa31
         Y5F8zYGBCY9E0ljqkIP6WF6dFaJFy7xDODbKRa6fR/YXb5EK4vq/QwLyl0cBVJqfGh1P
         cBC6paWjydfgtUvV4kAWHwXyGInzEoSvpmVG1u52K9E/jKiJSHxBvNGdG9AAiBU2RLnN
         QqdQ==
X-Forwarded-Encrypted: i=1; AKwUvBwenq6uUE9wJMsVtGNBfmponDWf5JU3oWqRSrV+6NTEdb7ZrMzV7oyUiiG10oGS3FLlxWxSH/pvQSflXrloxw==@lists.infradead.org
X-Gm-Message-State: AFq9FYLFiM3cvn4OJHdJuOCJQ9weAKqkT2VogeNa2sUVrjBLK1w1llFR
	zv99i2Jrq1Jz6DF014LzsMsxDVQxM5tHUTQ9We6ow+14omTfWXfGoFgOLmgRhZ62oXUA0Kc77f4
	pttdD5vRisJi/xS4NgmD5QD6jCD5GAR8=
X-Gm-Gg: AYBFou0JWqsWriwsBpOyy5TdBUal5jLb29Mz/VAjE027kWG7r6eCYzIgoCaE8tEVBsF
	zgZfGFJptyea0d4ivpneSs2DEKnmNv5jA4v91ocy9nWAmmsDrlViDYx8ymN+x+HyC1jABUbreiS
	j5weYm3WC36fe3Gjb1oY2AKlqMqKWyFYnvpPhGt+J61dqaZoA1vLQsFkJkzmNoknBqvrN37dMgw
	HrvCED2XcnAPiklKaaM0YKdHEBq1VLEKluKPHeLo/3UowdQ1K2EYdtqjTr3TS7JFEwfB6LVuopD
	PJUMWPpdw0bR7Gdbmk2Gn7n78i+7KGb7Jxp4cUxVw3gV1ax8iI3Urf7uRTDe7E1c5DmCxqPdSS8
	aRg9z2xhIO+n7NHRdZEDiBGaKtEeftz+RkS40pZWRWIjgStxavtB2AAmcWO+CnVgfsyn8wDSYUc
	tRMA==
X-Received: by 2002:a17:90b:514e:b0:3a8:10e2:ad05 with SMTP id
 98e67ed59e1d1-3a810e2d610mr1367843a91.50.1791184370925; Mon, 05 Oct 2026
 00:12:50 -0700 (PDT)
MIME-Version: 1.0
References: <20260925044908.450775-1-phucduc.bui@gmail.com>
 <20260925044908.450775-7-phucduc.bui@gmail.com> <asKt42FgsbhSbQUP@sirena.org.uk>
In-Reply-To: <asKt42FgsbhSbQUP@sirena.org.uk>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Mon, 5 Oct 2026 14:12:38 +0700
X-Gm-Features: AclHuK-Et_fC8GWEQTaTqwFWDt-VY_3yjba5DhCZkN25S8jgTJ6mltQqi4wer9o
Message-ID: <CAABR9nFyEJBwXP=4SjuGNfGQJub2y_DPE87c6j6BPmqMBgjESA@mail.gmail.com>
Subject: Re: [PATCH 06/14] ASoC: mediatek: mt8195: Fix FE startup error handling
To: Mark Brown <broonie@kernel.org>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Trevor Wu <trevor.wu@mediatek.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, cassiogabrielcontato@gmail.com, 
	Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>, Liviu Dudau <liviu.dudau@arm.com>, 
	Haotian Zhang <vulab@iscas.ac.cn>, HariKrishna Sagala <hariconscious@gmail.com>, linux-sound@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261005_001251_931502_71B260C7 
X-CRM114-Status: GOOD (  13.68  )
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

Hi Mark,

Thank you for your review.

> > +     ret = snd_pcm_hw_constraint_step(runtime, 0,
> > +                                      SNDRV_PCM_HW_PARAM_BUFFER_BYTES,
> > +                                      MT8195_MEMIF_BUFFER_BYTES_ALIGN);
> > +     if (ret)
> > +             goto err_fe_shutdow;
>
> This will return 1 if a new constraint is installed which is not a
> failure.

Do you mean snd_pcm_hw_constraint_integer() rather than
snd_pcm_hw_constraint_step()?

snd_pcm_hw_constraint_step() returns zero on success or a negative
error code on failure,
so it does not return 1 when a new constraint is installed.

snd_pcm_hw_constraint_integer() is also called from
mtk_afe_fe_startup(), and it can
return a positive value when the interval is changed, zero when it is
unchanged,
or a negative error code on failure.

I will change the caller to check for a negative return value:

-------------------------------------------------------
ret = mtk_afe_fe_startup(substream, dai);
if (ret < 0)
        goto err_clk_unprepare;
-------------------------------------------------------

Best regards,
Phuc

