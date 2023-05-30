Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E0F4C7EE2E
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 May 2023 08:17:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Fy7SR/HzB92IkMAazWT76QIOXbthJ6EyN1HdPKvysFk=; b=TYoBxxWxDQTR8oHgvvjm1XiIsb
	x+M8MMNGSpawTjBxE5UFGNlzCzrtsqZgEYYJ4oSI64mGDl/TYn36dee/+qtFeRXtFnuQJmT1QbXQZ
	vCbqLv+BKMNKWz3rvNVSayDOTn9VAxIqUAGwOwFTM2opZHGohbgSnMwgAnsN0a9T0nd/XZzyfShNK
	LcTbLDkXyyJbRKRBp0rLv0r0phjx4H8E5M8pYKUANSAevGUL3C/w/dKLu32YRuN0fq+P7iIR2Hs3Y
	gXkVgC2OxuEAYuTZNdqHNnVyxI/IzKq0SjRNgKwfPpiYbYJ5Z7WHThtnzYUh8drVQNRoGMsHb5NOZ
	JrUGoi4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q3uXh-00CtOx-2T;
	Tue, 30 May 2023 08:17:21 +0000
Received: from mail-io1-xd35.google.com ([2607:f8b0:4864:20::d35])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q3uXT-00CtGY-1i
	for linux-mediatek@lists.infradead.org;
	Tue, 30 May 2023 08:17:08 +0000
Received: by mail-io1-xd35.google.com with SMTP id ca18e2360f4ac-7770c1546e2so103162539f.0
        for <linux-mediatek@lists.infradead.org>; Tue, 30 May 2023 01:17:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1685434624; x=1688026624;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Fy7SR/HzB92IkMAazWT76QIOXbthJ6EyN1HdPKvysFk=;
        b=CJFljht/URfulrX/BQQogdLgAkSiPQ4armqx1rnpAnDA25GIL1uBk1DT6+MFFy7CFz
         fHkftFqZFmrOM3xaCf724X834CCsBoi6QqnNS4npXZCuQho58RU6JSyM/c8aZrOUGxpu
         DCVqYBUTeIi1qwFx3McTy7IiBkpiVVZ+F+/es=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685434624; x=1688026624;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Fy7SR/HzB92IkMAazWT76QIOXbthJ6EyN1HdPKvysFk=;
        b=JC5uBl3O4fAXMWdhf2Ax2C0CEh2f1CZW6KHqaFK2jJa7TrX7k2e+rwTIbf0kL488x7
         pOhg/0d+isHG30e0P63B1wJf+Hnvhkww7DamDCZOLlqDqAD8EeE6/iVmux3IvjEFZ7iS
         +Y8MbOf1am3BBjQSBXmscnkgFn08RMsAIcBruYcwz7Mp0DAQaPHQGvJYVVCBlSWto8Fi
         C8ltOBsDqh9CIzGt8+ILOOFvB1N5VP+D0KyaHo+gyGjrTxjbtWdMyQH/Zm+NhYXeuNbY
         muNl3mwHyNSkYV3vp1d1P5WG8AaaSRTakvV/kRYQG56fjp/aI8qn4CEgOPCSoONfjhjK
         zPzA==
X-Gm-Message-State: AC+VfDy92hJbQ4jy3qOFTyEvCw2Ts7Fia95VIaG7bvrKlAdlidNqYp2q
	gcMjQ26yca4aQCpqrP0cA39cjqSMfIE1lniDD7qYvw==
X-Google-Smtp-Source: ACHHUZ7dX+6887Swu18EzqkpWeZMTbRgNzYYTJ2VvJG6BkRYa9Oe3UhPb4JyBuAIjw+rXVBucmBYHzH71y45f6iv+oE=
X-Received: by 2002:a92:d203:0:b0:335:56cb:a3a with SMTP id
 y3-20020a92d203000000b0033556cb0a3amr1027018ily.16.1685434624188; Tue, 30 May
 2023 01:17:04 -0700 (PDT)
MIME-Version: 1.0
References: <20230526063149.1801196-1-treapking@chromium.org> <2bae7dea-afc5-96b5-c6d1-f4724bae155c@collabora.com>
In-Reply-To: <2bae7dea-afc5-96b5-c6d1-f4724bae155c@collabora.com>
From: Pin-yen Lin <treapking@chromium.org>
Date: Tue, 30 May 2023 16:16:53 +0800
Message-ID: <CAEXTbpcbuRawcqnTQeuSD9Qpym25bpH+2hjHSTA9A2EbxtixGA@mail.gmail.com>
Subject: Re: [PATCH v6] media: mtk-vpu: Ensure alignment of 8 for DTCM buffer
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	Hans Verkuil <hverkuil-cisco@xs4all.nl>, Tiffany Lin <tiffany.lin@mediatek.com>, 
	linux-mediatek@lists.infradead.org, 
	Andrew-CT Chen <andrew-ct.chen@mediatek.com>, Minghsiu Tsai <minghsiu.tsai@mediatek.com>, 
	Houlong Wei <houlong.wei@mediatek.com>, Yunfei Dong <yunfei.dong@mediatek.com>, 
	linux-media@vger.kernel.org, Hsin-Yi Wang <hsinyi@chromium.org>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Alexandre Courbot <acourbot@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230530_011707_623235_D8BB2038 
X-CRM114-Status: GOOD (  18.82  )
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

Hi Angelo,

Thanks for letting me know. Then, this patch is not needed.

Regards,
Pin-yen

On Mon, May 29, 2023 at 4:31=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Il 26/05/23 08:31, Pin-yen Lin ha scritto:
> > From: Alexandre Courbot <acourbot@chromium.org>
> >
> > When running memcpy_toio:
> > memcpy_toio(send_obj->share_buf, buf, len);
> > it was found that errors appear if len is not a multiple of 8:
> >
> > [58.350841] mtk-mdp 14001000.rdma: processing failed: -22
> >
> > This is because in ARM64, memcpy_toio does byte-size access
> > when the length is not a multiple of 8 while access to the
> > vpu iomem must be 4 aligned.
> >
> > This patch ensures the copy of a multiple of 8 size by calling
> > round_up(len, 8) when copying.
> >
> > Fixes: e6599adfad30 ("media: mtk-vpu: avoid unaligned access to DTCM bu=
ffer.")
> > Signed-off-by: Alexandre Courbot <acourbot@chromium.org>
> > Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
> > Signed-off-by: Pin-yen Lin <treapking@chromium.org>
> > Reviewed-by: Houlong Wei <houlong.wei@mediatek.com>
> > Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>
> >
> > ---
> > This is a re-send of v5 because it was marked obsolete, but this patch
> > is required for MT8173 platforms.
> >
>
> Hello,
> I have solved this issue in a different way and the commit was already pi=
cked.
>
> Please check:
> ab14c99c035d ("media: platform: mtk-mdp: Fix mdp_ipi_comm structure align=
ment")
>
> Regards,
> Angelo
>

