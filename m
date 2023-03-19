Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF537C6FD1F
	for <linux-mediatek@archiver.kernel.org>; Sun, 19 Mar 2023 20:50:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zrqBLpgMvGAw26DRaowqtZ6KNMhJt4QDsaLfvV/8J2M=; b=j3MGoYfxmmCefq
	4K7Y6UWF9kHG63ELFN45aDPtRWT9EtHzpOZ/5g39Lg7LyZHSTzd2hl96VTOaSstPzEzdyRY+bY+Sj
	TjpPy4EJN/NQ+SAj0ljZjPa33XyaR18QEZKi7kUGCo+Wp/VvS6vNJPmg3INuFAvQRXKHtGS6+U5Hh
	wFpvBGoAaJGJV5tEgjSL8swXaaTPuC6Qu0pFp9rW+B+i64VpS2xwfWwDf7C+28sT7r/nMl+pPa+XY
	wPYCmcWeOJdxpuzfWMwohJ6TfDKAVlraUtsTLp9IxvLoF3eABr37ON/lGDYb4LI62J00kRDt3E32v
	YgxmSs2HaQFP6lPpaDSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pdzyR-007Pbz-2q;
	Sun, 19 Mar 2023 20:49:51 +0000
Received: from mail-yb1-xb35.google.com ([2607:f8b0:4864:20::b35])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pdzyO-007PbE-1w
	for linux-mediatek@lists.infradead.org;
	Sun, 19 Mar 2023 20:49:49 +0000
Received: by mail-yb1-xb35.google.com with SMTP id j7so10826652ybg.4
        for <linux-mediatek@lists.infradead.org>; Sun, 19 Mar 2023 13:49:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679258987;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zrqBLpgMvGAw26DRaowqtZ6KNMhJt4QDsaLfvV/8J2M=;
        b=hcVlyh6SCc01tHQEQKl+rMRkXdRlZaBR4PAhhkEscLByfqRTPISUDdvRSlA5rhmVVl
         sthqa0S2nU+jceZDprhsd0t7PBSto5gQblrnyO+mFunTfH+7zT2SHpA4c3HoBI4hI8IE
         8HPXCMvMV/3MqFjwnD9pIPu8B+/kZt8jR2cihllfOHlSnCymg1XkkC9YluVHeYuWeXoo
         IsjCiVSDPun7MF60EXMPWmudtUj5UjGdlsmGVCZj7CD1S8xEQQ8o9bG58eDECB5cR1IV
         InMCxoDbSJyW2nf8uwuTZMEF8pZ4ZP/U2JswAboP/a7fc731qPbcUMwumSeVaXNIVvhj
         79+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679258987;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zrqBLpgMvGAw26DRaowqtZ6KNMhJt4QDsaLfvV/8J2M=;
        b=qOWQ+uKpSK+GdjYz+gow+DiZSR8QM5/VyEC7n2F5YPjBFn1dWmYZKtrCp+tnnJnKeW
         zSKOZeeLB28sjNc1yx4xK1+E2RGnSkoEKx2CGFQleATL/NHqqpMmb2yGNnmuBOg3ZOat
         /OKttWCZnylJDB6I1mRnozwd4qSZhMowYP7ZpRidAHLy8A42M7LNFxS8yKl5ooFpAdxo
         mhNnsHEXLl4mjXJMqIY4leLFNGJRH/65yroUzWUrTd2iaiMQU8tkiKg00yO7fmNyAGSY
         U39TMJRvPpDEs1UskyxhuziPQAfqJ57VObqsb7xusdWepcRi1FjPI8X9ne7IA7lEHlda
         xUnQ==
X-Gm-Message-State: AO0yUKVhnjUeBIbdiQjnzBCiGH7ixfiBDOqehVGKUpygOiFEzsJpNjkB
	13rx5v2HSpHUg4tbu4I0GXOuuCtoHsHXxah4Sp8KYg==
X-Google-Smtp-Source: AK7set9UmCKLhMhtD1XyfXAykvchqeWDh0btzTty+BysNe0ltmHg+QaEhAeymn18rA2vpcmu4EmZo8R4MRqI+S7yupE=
X-Received: by 2002:a05:6902:102d:b0:a6b:bc64:a0af with SMTP id
 x13-20020a056902102d00b00a6bbc64a0afmr4087551ybt.4.1679258987014; Sun, 19 Mar
 2023 13:49:47 -0700 (PDT)
MIME-Version: 1.0
References: <20230317213011.13656-1-arinc.unal@arinc9.com>
In-Reply-To: <20230317213011.13656-1-arinc.unal@arinc9.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sun, 19 Mar 2023 21:49:35 +0100
Message-ID: <CACRpkdbWmtBtpkW2=DUX2v6CR7aJz52R6y5mJ=W+VDena+Fzng@mail.gmail.com>
Subject: Re: [PATCH v3 00/21] pinctrl: ralink: fix ABI, improve driver, move
 to mediatek, improve dt-bindings
To: arinc9.unal@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230319_134948_637756_074EA003 
X-CRM114-Status: UNSURE (   8.45  )
X-CRM114-Notice: Please train this message.
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
Cc: linux-kernel@vger.kernel.org, Daniel Santos <daniel.santos@pobox.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, erkin.bozoglu@xeront.com, =?UTF-8?Q?Bernhard_Rosenkr=C3=A4nzer?= <bero@baylibre.com>, Sergio Paracuellos <sergio.paracuellos@gmail.com>, linux-mips@vger.kernel.org, devicetree@vger.kernel.org, Landen Chao <Landen.Chao@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, Andy Teng <andy.teng@mediatek.com>, Hui Liu <hui.liu@mediatek.com>, Luiz Angelo Daros de Luca <luizluca@gmail.com>, DENG Qingfang <dqfext@gmail.com>, Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org, Del Regno <angelogioacchino.delregno@collabora.com>, =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>, Zhiyong Tao <zhiyong.tao@mediatek.com>, linux-gpio@vger.kernel.org, Sean Wang <sean.wang@kernel.org>, Daniel Golle <daniel@makrotopia.org>, William Dean <williamsukatube@gmail.com>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, Mar 17, 2023 at 10:30=E2=80=AFPM <arinc9.unal@gmail.com> wrote:

> This is an ambitious effort I've been wanting to do for months.

I don't see any major missing ACKs so I just applied the patches, we
can fix any remaining issues in-tree.

Good work!

Yours,
Linus Walleij

