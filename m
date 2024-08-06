Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE7F2C3DA64
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Aug 2024 12:00:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fFalGrV5LPuH5m9MtaZapm5ai3Cg5stQHsN8KCx3+Xs=; b=FA7rv1Wh/7TLNThZKTr46LKwrk
	Uvh09Gv5fNRCjgl0tA1h7S3Gp2imXhbk5BKB7KGqJrwxtMluR7jnhOwG/3wpD50iBgzZRQrnzn2r1
	ANJAYM36pJaNTL3VqBEiXz7vCw2Ra4+iE69s5xbfoMfHgAATgo5d85VztXC42L5PseEjJQL9iX3gg
	jAGuvMM76AWZQum8GXL7tdCkLciaucsH4MStj1+iIe8bFClMRKPlSwEb3pwyTJryb+s8lKqw0eg3r
	r+omOqwcQ60PxVM6iVIM0gnL0YA/TfB9c/HBcFXlMLIwkthoMcIiuESFzMbiHDssrrFTxNrJ6HN0a
	AzRsmMTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sbIrr-00000001Q3p-0EqL;
	Tue, 06 Aug 2024 12:00:43 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sbIro-00000001Q36-2Yul
	for linux-mediatek@lists.infradead.org;
	Tue, 06 Aug 2024 12:00:42 +0000
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-5a156557026so541741a12.2
        for <linux-mediatek@lists.infradead.org>; Tue, 06 Aug 2024 05:00:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1722945638; x=1723550438; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fFalGrV5LPuH5m9MtaZapm5ai3Cg5stQHsN8KCx3+Xs=;
        b=fgiTFF2GfoqHZAQ0mgfFP8KNiAvU4SsASiIJKDlZlnAoNvISW9TlN+pnJhs9gRm9MQ
         Ps83el7+briVaGjH82il2PnViIlfMFWDRmZoB2DEFNau+zDrM3jCU4GtMWDezK7J2xfY
         ONIA/pfBBwzS7++T3gv62/tWOikuSZ70IwcaQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722945638; x=1723550438;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fFalGrV5LPuH5m9MtaZapm5ai3Cg5stQHsN8KCx3+Xs=;
        b=WiJIVUiEh+gwDteaZ7R1LH1QyZyCZ+UNNlaKx/A0QmB5aRmXmkEnE5QJ1JFSPCITqP
         AqV3dre/G6iEFmV5qGrsT8Sp1ZW+Dz7Yt6verw21qXpc7e8aPl8181+72UnVhlD2z6Q1
         DIxXHB5uaWBkY7MphQW+4chmU+SQrFzJ3Y1JU0fAn1Z80Nie3rudX9cWrQfIPp0IyBxj
         m0tM5AJaA6k9HAF+99jeLs7wcS227TWGN84j0RJTHMaW1GXtYf2TcR/ikBrrpA+Cxq81
         J3omGU8gPV9/ZGM6z7SxWt7zeGoRAuk8iG/vVubTUV+9LwHnTZjQ7nO8xXIS3XWf7A9X
         VNuQ==
X-Forwarded-Encrypted: i=1; AJvYcCWSLkQK5ALssAHitJMc3u2UooU7tRB+xLXDu6w29COsWjN0Qep+oQDz8y0xVk2l4g4Hy1fWQtpb7DAZ/s3pX/NI1/gxGG9feI6J9T1IyZCA/pDo
X-Gm-Message-State: AOJu0YxkkPtlJjjtSnWlq9KBVh0nz/sovizjt8oKZ0oA6hpVahCaAbSb
	CoBBSjrXleeQpM/zgQVOHCnduejmfDhvSvMq/K29wddcHScVAgStIQVR3NMAjg8p69LVOLttMUA
	=
X-Google-Smtp-Source: AGHT+IEZXJgo8xjW6Qq7ToW2ArAZV7YYp6fwGGQYbvo71J6K4WR5E/rCrLk5uYVoeBPOFe4ua5uC6Q==
X-Received: by 2002:a17:907:1c85:b0:a7d:a178:cd27 with SMTP id a640c23a62f3a-a7dc5047349mr1207596766b.29.1722945637735;
        Tue, 06 Aug 2024 05:00:37 -0700 (PDT)
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com. [209.85.208.42])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a7dc9bcf044sm539588866b.7.2024.08.06.05.00.36
        for <linux-mediatek@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Aug 2024 05:00:36 -0700 (PDT)
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-5ba43b433beso557617a12.1
        for <linux-mediatek@lists.infradead.org>; Tue, 06 Aug 2024 05:00:36 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCULPhjpoC2a18CA86JNwbJxDI3Jp0TWE9u1N4rdsyQg1Jy1kyeLd/EaMo2kN7tY1BHwHspsglChLw5HW6IBBgCVQKkV7y1OsIA6MAAFCefB6p/i
X-Received: by 2002:a17:906:6a1c:b0:a7a:9ca6:524 with SMTP id
 a640c23a62f3a-a7dc4fe2dd4mr1109632666b.14.1722945635971; Tue, 06 Aug 2024
 05:00:35 -0700 (PDT)
MIME-Version: 1.0
References: <20240801084326.1472-1-yr.yang@mediatek.com>
In-Reply-To: <20240801084326.1472-1-yr.yang@mediatek.com>
From: Fei Shao <fshao@chromium.org>
Date: Tue, 6 Aug 2024 19:59:57 +0800
X-Gmail-Original-Message-ID: <CAC=S1ngP9WvLBmbr6S2C5zs+47ap_FZqCJOJZxZnKOTapJ71eQ@mail.gmail.com>
Message-ID: <CAC=S1ngP9WvLBmbr6S2C5zs+47ap_FZqCJOJZxZnKOTapJ71eQ@mail.gmail.com>
Subject: Re: [PATCH v2] ASoC: mediatek: mt8188: Mark AFE_DAC_CON0 register as volatile
To: "yr.yang" <yr.yang@mediatek.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-sound@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, 
	Project_Global_Chrome_Upstream_Group@mediatek.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240806_050040_689549_E9C6036D 
X-CRM114-Status: GOOD (  19.78  )
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

Hi YR,

On Thu, Aug 1, 2024 at 4:43=E2=80=AFPM yr.yang <yr.yang@mediatek.com> wrote=
:
>
> From: YR Yang <yr.yang@mediatek.com>
>
> Add AFE Control Register 0 to the volatile_register.
> AFE_DAC_CON0 can be modified by both the SOF and ALSA drivers.
> If this register is read and written in cache mode, the cached value
> might not reflect the actual value when the register is modified by
> another driver. It can cause playback or capture failures. Therefore,
> it is necessary to add AFE_DAC_CON0 to the list of volatile registers.
>
> Signed-off-by: YR Yang <yr.yang@mediatek.com>

For this patch for MT8188:
Reviewed-by: Fei Shao <fshao@chromium.org>

And a side question: is the same also required in mt8195-afe-pcm.c?
Their volatile register sets look almost identical (except MT8195 has
some extra lines).

Regards,
Fei


> ---
> Changes in v2:
> - Modify commit message.
> - Link to v1: https://patchwork.kernel.org/project/linux-mediatek/patch/2=
0240801031030.31114-1-yr.yang@mediatek.com/
> ---
>  sound/soc/mediatek/mt8188/mt8188-afe-pcm.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/sound/soc/mediatek/mt8188/mt8188-afe-pcm.c b/sound/soc/media=
tek/mt8188/mt8188-afe-pcm.c
> index ccb6c1f3adc7..73e5c63aeec8 100644
> --- a/sound/soc/mediatek/mt8188/mt8188-afe-pcm.c
> +++ b/sound/soc/mediatek/mt8188/mt8188-afe-pcm.c
> @@ -2748,6 +2748,7 @@ static bool mt8188_is_volatile_reg(struct device *d=
ev, unsigned int reg)
>         case AFE_ASRC12_NEW_CON9:
>         case AFE_LRCK_CNT:
>         case AFE_DAC_MON0:
> +       case AFE_DAC_CON0:
>         case AFE_DL2_CUR:
>         case AFE_DL3_CUR:
>         case AFE_DL6_CUR:
> --
> 2.34.1
>
>

