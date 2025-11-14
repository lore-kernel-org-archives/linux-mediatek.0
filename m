Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B811BCDB47B
	for <linux-mediatek@archiver.kernel.org>; Fri, 14 Nov 2025 03:03:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6gf0cDEKhbj5fscbEvHzuZbmEnf4dVk4rDx+EdHDqqA=; b=PgS3Ng7HvmHiq+mr3aY1eCnp94
	UZvlXRv2CULyJZdtufJWdPtPvocX4z7dJUlKgDek5Lf0rRXjzMpHgjbwOxPkTc3zY85/wXpIYiSVU
	n2EtKtm3LWQj5SxtYejAsSq/Kqx6jucoEUfWM+GzsSkcWKDf+b6yCbPI93FJuugkv2Bp7rhwIJECF
	qaNqyYOFg8A2gPh5rsVFvBHWWNHZ8Y7d9f/NFeBIhfj8oYSHI5TZnYLDBUC44VL1itCN8w1nSkiXC
	sZhJVv988WWB1m7yMGJjzv+ghitE6LdDAD75fuKtlU/dp/h8uP9HBPGsswQ7iv89udvqVhanBOABc
	UAjCbJ5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJk6G-0000000BRu9-3jdc;
	Fri, 14 Nov 2025 03:03:48 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJk6D-0000000BRto-2ST4
	for linux-mediatek@lists.infradead.org;
	Fri, 14 Nov 2025 03:03:47 +0000
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com [209.85.128.70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 58CEB3FBD6
	for <linux-mediatek@lists.infradead.org>; Fri, 14 Nov 2025 03:03:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1763089421;
	bh=6gf0cDEKhbj5fscbEvHzuZbmEnf4dVk4rDx+EdHDqqA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=SxcuCcUTja1VUAgyyX2tVO36+E5flTa3VD/UQ5F2woZMj8qSjt074UUmT5NoOf4ih
	 Zd8QOBrMgZn5wWWTh6N2wHGSEx8nI0t+COemzoQoDpUplQpUMZvBjNi1n8+Dj18teY
	 I8xBWQpt+5XOf8Qs0cZ4Y+ndfGS68Z7+WsA0JbGiSN3LHiMYalhxcihsZkOLXFn7ns
	 6MCWjkvuPkNFRlJXc2poXSFQ0Y+oEH6ecr6rt0PqkQF8lK+BNcYPWhT6WXJwQ70sAk
	 Rz7R5xwZ0kdN1EBdGh0ORE+1vikdHeqFifvbsfUXXjiVyoy54+ZLU9gI55+iLpZgu3
	 +P8GuKfHegunUafFeVqnddSdq51hfrKk0QcGbzEU12S+OXCRxH7rywZFNG4SBfL0XL
	 5uajC6Rwr1w0cqdTC5bZmM451zzc0YTp7extV3iPn3sF+ZGk46H8bZFnmfEL5BTQTs
	 1RSFk5x94U2FJVZcN46k4qRPRhoqLt9naHmeDmN91HVc92sx9/hgTOIts9noGwrlOQ
	 EHcTZllJwME4buAC7JReCgC08jD3DIhgG3bqxuv2zL9X23F0jCCJdJQN7hw8yH8LeX
	 OFnlyqIuXc9IGqJk/AkKZOrzDfUeQ5sUdCzIxVEGih94sD2tDpEgjjevoPi83D9oG/
	 LL08kme1k70ELEuiaUtbMfyI=
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-477771366cbso10317625e9.0
        for <linux-mediatek@lists.infradead.org>; Thu, 13 Nov 2025 19:03:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763089421; x=1763694221;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6gf0cDEKhbj5fscbEvHzuZbmEnf4dVk4rDx+EdHDqqA=;
        b=MB1MprGEtuMaAw+akXz/AI7D4/pnjKVaHnoypS8D5VJbfgXfoMtgSpxyYajz7ZxeJl
         5o4hKEEjft2HsgL+rvY60Dd0Ac12xwUW2xRUeY2UaDg3HWsVNatXc60CVfMJAwPodo8O
         Pe50/VZhAOy5lCQRSVLOswoGChiHIFZKn/XIbak3ez+/u8uakawCH0mHs7U5MxvMAPrq
         8IX7EKqySI7pVoWW1eK1JhqK5NaSCIyQ/2Z9Gf+OBSGIJeE2l018iej5N4KCNLyTNnM3
         NMy0l5RTQp2cJ1bhsJGmTyd2VWgmZCL9a+p6cmi/W/GlwWka2U9pSgJl0zYQCpcM8Y/5
         rV3g==
X-Forwarded-Encrypted: i=1; AJvYcCWdnyKGhdu8kLqRVh6O1ImfShHaHtw1Kjf8FMiFwFtNybVx8F39MmX9dTrEtc3PQdumVpA5jE7ZDmiTVccbEQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz0Mjx1JnlazxaSZX4O6Mhq4EZCzwzAxk/XtE9fRUeG5vrlz0An
	ed4iYtvfCOUkJbbM1uc9jdlq1G7pa+II/XNLlwH8dO1hg1odXN4JclFkrQ6EWSyarAWavr3/OVc
	pIvr1zZVd+IB+G7+949jUFKe0h8uPn5IYA5Vn5nYO75OBJrsHHtxoyDGJlsJdsc9OpPKl5dWdr6
	BvBv6QQv7cRKokzubT37KwE9Y4O/x8zp9YamQIQUTE3qsiXxdPUF48dzvedp5tVFMt
X-Gm-Gg: ASbGnctlNrFPUjorYFy1dBKM5Y6+k8XWlBuo2YMDCleLsIh/gwGc8TZPo4VCCkcmCD6
	9JHDFPI6LKedhEjDQVpq2vcph/MflQUOAaO5J4BAV/eFpLUNpPhs5rlN7N9D2dLPeTcj/QiNj6g
	LyxyCC0pVQL0Jwi0ZKr9T9N1Qfo0J8r2PygISoYkG2mdZwp3MxiC8qRD9Gtg==
X-Received: by 2002:a5d:5f47:0:b0:42b:3bfc:d5dd with SMTP id ffacd0b85a97d-42b59384b07mr1348718f8f.54.1763089420780;
        Thu, 13 Nov 2025 19:03:40 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH7lXto+SrYlSZwMjWg2X2Xom9R1MvDo5ZjuJvGkM/TWys4E1pNn82Ax34l1tOXRO3FfFHoszR5+HD2D5hkPkg=
X-Received: by 2002:a5d:5f47:0:b0:42b:3bfc:d5dd with SMTP id
 ffacd0b85a97d-42b59384b07mr1348706f8f.54.1763089420451; Thu, 13 Nov 2025
 19:03:40 -0800 (PST)
MIME-Version: 1.0
References: <20251111124853.2916889-1-jianhui.lee@canonical.com> <589670a9-ac91-4fde-b595-473408b3df18@kernel.org>
In-Reply-To: <589670a9-ac91-4fde-b595-473408b3df18@kernel.org>
From: Jian Hui Lee <jianhui.lee@canonical.com>
Date: Fri, 14 Nov 2025 11:03:28 +0800
X-Gm-Features: AWmQ_bnMo4sgehMAEZ-tiHd0CQ6awtXHzB4uH7_k7YqeDdG-uC5Y-NypoFmYMzg
Message-ID: <CAGmiHmGiDngNCkfkwdoV8M0XjQVFEXTJekPAfuZfUFRui9gSbg@mail.gmail.com>
Subject: Re: [PATCH] memory: mtk-smi: Fix NULL pointer dereference in config_port
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Yong Wu <yong.wu@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Joerg Roedel <jroedel@suse.de>, 
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251113_190345_963889_4C46A1DB 
X-CRM114-Status: GOOD (  19.87  )
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

On Wed, Nov 12, 2025 at 11:51=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.o=
rg> wrote:
>
> Please trim the traces from all irrelevant information.
>
> >
> > Fixes: e6dec92308628 ("iommu/mediatek: Add mt2712 IOMMU support")
>
> Add Cc stable.
>
> > Signed-off-by: Jian Hui Lee <jianhui.lee@canonical.com>
>
> > ---
> >  drivers/memory/mtk-smi.c | 4 ++++
> >  1 file changed, 4 insertions(+)
> >
> > diff --git a/drivers/memory/mtk-smi.c b/drivers/memory/mtk-smi.c
> > index 733e22f695ab..8eb043ff8280 100644
> > --- a/drivers/memory/mtk-smi.c
> > +++ b/drivers/memory/mtk-smi.c
> > @@ -244,6 +244,10 @@ static int mtk_smi_larb_config_port_gen2_general(s=
truct device *dev)
> >       struct arm_smccc_res res;
> >       int i;
> >
> > +     /* larb->mmu and larb->bank are set in bind(), may not be ready y=
et */
>
> And how do you synchronize this between CPUs? IOW, what certainty you
> have that this CPU sees correct data and the checks below have any sense?

Thank you for the review and for pointing this out. Moving
pm_runtime_enable/disable to component bind/unbind should ensure that
the synchronization happens correctly. I will send a v2 to address
those you mentioned.

> > +     if (!larb->mmu || !larb->bank)
> > +             return 0;
> > +
> >       if (BIT(larb->larbid) & larb->larb_gen->larb_direct_to_common_mas=
k)
> >               return 0;
> >
>
> Best regards,
> Krzysztof

