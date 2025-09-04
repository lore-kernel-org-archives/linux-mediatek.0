Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E462CA1012
	for <linux-mediatek@archiver.kernel.org>; Thu,  4 Sep 2025 06:19:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7CQBkphJcdYBghhb0rqPa4FTq1gxFu4hiwbVOVVdraE=; b=uGajcmTvNcCEdU
	pJdJwd97apd6F6JEv4AbQ2eNpNsfRs/mWL4SaU3/F+gNQGfzZAWnf622QYvdPJg26jenuwTDKOKwm
	X0S7HEAynaw6l/x+Pm2yKOfQTmNjal7U/PfkfdOWeZafGae5QHi4tMXfl5mlTP+6XTCkovwVU7fGk
	wX83O08SXLKZHbsDA7OpRRwm2ibmkddZDVQIM1+V0t7496ZGoIzBCvahhrfGQsB3ZDyPN8BI6qLyA
	6Yuz3aiqYKTgNIArT18kt3Xpk2bktBrFuMZS3HgCglAV5F6Plui97mOsCaijyR50Tt0eJyWsHgbKi
	6RPsjyZq/A6KX58A68hA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uu3Jo-00000009TzE-1dik;
	Thu, 04 Sep 2025 06:19:36 +0000
Received: from mail-lj1-x232.google.com ([2a00:1450:4864:20::232])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uu3JA-00000009Tip-3bfG
	for linux-mediatek@lists.infradead.org;
	Thu, 04 Sep 2025 06:18:58 +0000
Received: by mail-lj1-x232.google.com with SMTP id 38308e7fff4ca-336bbcebca9so4953061fa.1
        for <linux-mediatek@lists.infradead.org>; Wed, 03 Sep 2025 23:18:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1756966735; x=1757571535; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7CQBkphJcdYBghhb0rqPa4FTq1gxFu4hiwbVOVVdraE=;
        b=LbBkmUOAw8E43DRIPPSrGAl89H0JByTmy6cptWvXvgkWwVUjcpUupCgMa3Z9DgPOQd
         kRfYb5IZqQiwaga4WqEBqHXh3QnLz0tVwrN5UCeTan80dyeA7FPD22Y+aXumx3ih0kuL
         U7u1pP1PkG+ybuFDsK+CK5yB8T+sj4kkJMvXc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756966735; x=1757571535;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7CQBkphJcdYBghhb0rqPa4FTq1gxFu4hiwbVOVVdraE=;
        b=oYT6Ra0ChSbFm70EJNWNyPMQF7AU2b65M++O9V/shKBv3isZLEe6715VAy0wZYnCP3
         /y7azmx9x7+KaMxHdUfmSBeaklgDNtsIon7ChOF4Ec9yt6Fv4pCD50ifZeiAgzlW3J6f
         RgczNOV0G8WWub7fNLMV8fJOgDXUhzA1UHjd8Qdse9REfHPbZUxUHiNdqUNop+akuaFd
         lT9YlCWvRbhQxVHPPuD5I+p7Vo1o1osjRI0IabtHu2OIfkTCDNE2zjr6PpGiQXtZEMLm
         gGNULTO2Z2KFryzGaVcmzIBQA9TUPw0M+SPpRROcgHKCNCpjJhcGp7QLwecyBCQz8AAs
         KHGA==
X-Forwarded-Encrypted: i=1; AJvYcCUg/hQ6FhoT2v3e52dSmYE4W7Op7IjczCLbHVVaCOmcIPiz5SaxSmvwAKgJxPzQyq2+9vaMuuGzogWS+0ZlkA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzKeqkcoVSDArN1VTY/11VvqUn8MWhTOXHIHel/3ss9WN3Wwxu9
	ktUpL6iNmYAIvlUPZvxSRwcOOY6kQD1FZYQNs0Y/hyumAjByO86Nf4qS2SOgJHMQFVSF7NQLdlx
	c78B/37q6IVs966IekWXpZu7RycYIsO/V0m2O4YLV
X-Gm-Gg: ASbGncssUaFA6QY05XfbCSH5+JFs6LAt0AbVjzSahQBiGW+xz2FUtZYcpEshf4BAWM7
	G7Tmq3XxV88CtYf3upBc3jZzgmvWU6sxD7dlwpqQzmpPQJtiSWxbFUx67oNzMIDe7JsimvMNjeh
	Q1S4wgBefqdootTuK0NgHKJxvmEo0nQIa77DeO6M5oMwXnTDPS4ZBAF2GMAI2AwbzRp7/6L8IOk
	TsQXz96hAvHXMuc4dDfMrA9pNtY0Q49sVzd83Gs3cXljg8fLNxvc/up1y4=
X-Google-Smtp-Source: AGHT+IFmpIgZJkgG1TcnUjMeEXxa3OW2u+0iRL2YEUKOrf2DSwzSi6u1IDGdInKUk3OLck6UIHWPn37d12I2FT8Uhls=
X-Received: by 2002:a2e:a991:0:b0:337:e585:8082 with SMTP id
 38308e7fff4ca-337e585814emr40485291fa.22.1756966734673; Wed, 03 Sep 2025
 23:18:54 -0700 (PDT)
MIME-Version: 1.0
References: <20250820075405.1041838-1-wenst@chromium.org> <CAC=S1njQ5z2Ezz2OXDJ6Pk_9EEPgG3gu=Os7uFv6Lmdq0X77og@mail.gmail.com>
In-Reply-To: <CAC=S1njQ5z2Ezz2OXDJ6Pk_9EEPgG3gu=Os7uFv6Lmdq0X77og@mail.gmail.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 4 Sep 2025 14:18:43 +0800
X-Gm-Features: Ac12FXyJUlQIqk0i4ipdL_cOK9k6d650IYlqwO_gxbw4GTZ_J2T6UQ6kDktMWOs
Message-ID: <CAGXv+5GgGs5LEGJV4fpUpxOXC=_Fvo3CA4S10zZGxes9C2HrEQ@mail.gmail.com>
Subject: Re: [PATCH v2] media: mediatek: vcodec: Use spinlock for context list
 protection lock
To: Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil <hverkuil@xs4all.nl>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250903_231856_930883_C0E493D6 
X-CRM114-Status: GOOD (  20.45  )
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
Cc: Yunfei Dong <yunfei.dong@mediatek.com>, linux-kernel@vger.kernel.org, Tomasz Figa <tfiga@chromium.org>, linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-media@vger.kernel.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Ping?

On Wed, Aug 20, 2025 at 6:37=E2=80=AFPM Fei Shao <fshao@chromium.org> wrote=
:
>
> On Wed, Aug 20, 2025 at 3:54=E2=80=AFPM Chen-Yu Tsai <wenst@chromium.org>=
 wrote:
> >
> > Previously a mutex was added to protect the encoder and decoder context
> > lists from unexpected changes originating from the SCP IP block, causin=
g
> > the context pointer to go invalid, resulting in a NULL pointer
> > dereference in the IPI handler.
> >
> > Turns out on the MT8173, the VPU IPI handler is called from hard IRQ
> > context. This causes a big warning from the scheduler. This was first
> > reported downstream on the ChromeOS kernels, but is also reproducible
> > on mainline using Fluster with the FFmpeg v4l2m2m decoders. Even though
> > the actual capture format is not supported, the affected code paths
> > are triggered.
> >

We really should get this in as this triggers a very large and scary
warning every time the encoder or decoder is used.


ChenYu

> > Since this lock just protects the context list and operations on it are
> > very fast, it should be OK to switch to a spinlock.
> >
> > Fixes: 6467cda18c9f ("media: mediatek: vcodec: adding lock to protect d=
ecoder context list")
> > Fixes: afaaf3a0f647 ("media: mediatek: vcodec: adding lock to protect e=
ncoder context list")
> > Cc: Yunfei Dong <yunfei.dong@mediatek.com>
> > Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> > ---
> > Changes since v1:
> > - Switched to _irqsave / _irqrestore variants even in helper only calle=
d
> >   by IRQ handler (Tomasz)
> >
> >  .../mediatek/vcodec/common/mtk_vcodec_fw_vpu.c       | 10 ++++++----
> >  .../mediatek/vcodec/decoder/mtk_vcodec_dec_drv.c     | 12 +++++++-----
> >  .../mediatek/vcodec/decoder/mtk_vcodec_dec_drv.h     |  2 +-
> >  .../platform/mediatek/vcodec/decoder/vdec_vpu_if.c   |  5 +++--
> >  .../mediatek/vcodec/encoder/mtk_vcodec_enc_drv.c     | 12 +++++++-----
> >  .../mediatek/vcodec/encoder/mtk_vcodec_enc_drv.h     |  2 +-
> >  .../platform/mediatek/vcodec/encoder/venc_vpu_if.c   |  5 +++--
> >  7 files changed, 28 insertions(+), 20 deletions(-)
>
> Reviewed-by: Fei Shao <fshao@chromium.org>

