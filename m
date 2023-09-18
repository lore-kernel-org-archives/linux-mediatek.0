Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8004CD37B0
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 Sep 2023 10:22:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iX6Za3zyMvqmXctAk0a5Iwv/WZyf9mXODoigV6qCMRo=; b=vKgKBFPVH/aGkf2yUYR6tJVUqb
	Yvs4dvxLjaf+5hqHPsn2vU8GbXMuHWeVNgpcH3B7DWWmYTebOqqSDkajCYKAO4mV7tiQ1Pl5/BmQi
	ddFuDFH+2dKI282V6wHwZb/lOgqcBW8Dlj+imgqUnAMQYjRoLBKX/JIgjNmvCHyuVqTvsPT0JjnWp
	orGpIpOXq4uZ0KeTFIR7qHEOwe9ZV2fNBckymCZHl+Uc1rgo8e4jsa3ekAm5CFmNH8bKR9eSuyaH9
	hkFZxxLjQwtk71jSeZA2j9jz+qxE1/Dvpp2DdcrUMnWa0bktUdGyi4QNCT0/tAXw1ULANVk3HaY68
	6GYMv9NQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qiBOd-00F3wl-1W;
	Mon, 18 Sep 2023 10:22:27 +0000
Received: from mail-lj1-x22e.google.com ([2a00:1450:4864:20::22e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qiBOa-00F3s9-34
	for linux-mediatek@lists.infradead.org;
	Mon, 18 Sep 2023 10:22:26 +0000
Received: by mail-lj1-x22e.google.com with SMTP id 38308e7fff4ca-2b703a0453fso72504311fa.3
        for <linux-mediatek@lists.infradead.org>; Mon, 18 Sep 2023 03:22:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1695032533; x=1695637333; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iX6Za3zyMvqmXctAk0a5Iwv/WZyf9mXODoigV6qCMRo=;
        b=OFAJdT3RbO/srioYYoLuUyDYzgZ/fITeRlhHsHFf7BDa74lRZqmXpj22+6KAI2HJAG
         ur3VNnBBH+4NAL3e3UCDkrWoq6b4ODeQL032R8isA1lp6c7oDahTlYSBdQxAFUNKeR39
         NdFxKLOqX9zKJlFSsdfvqXq5kYMbr/Bu9ntFE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695032533; x=1695637333;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iX6Za3zyMvqmXctAk0a5Iwv/WZyf9mXODoigV6qCMRo=;
        b=bPL6O15bQhey1poaabXga9FSwHxt1/8drZMxh4OxQ356tKhGcRhWI0T2j/m2mGHt/w
         mGZq/ChPsre6Szua26fuX+0Wxd3YH+YSguA40yrtQ8v6r+h01XUWrcWYMuj7KO/sGDpc
         SY+hdA0YI27zTuhW2OiARmYvDFUF7/mQlV8wJtDnlE/m+JL+LtT/iY17tsUlqo9uNz3z
         BdZDSD9MTZ0YCwlpgYjHFRZuA88z1ShEuhPYdy2j8aLbwBp9vokuym4r42XowNlMehD5
         +Mu/GVipm8996igwXrkxMXZ+uDgEyIWhfA+gIrweHdhVosw9bAjtPbNZd+nqDVCvM+7s
         tI5Q==
X-Gm-Message-State: AOJu0Yx3dakkyUx6aKG6eHluGiHBG5+WqnhXl830wTO/b6xhdV53V4Yu
	hicOxpSKkv+9Tk2TKkURqr5Yhge0siFXee/Op4q5WQ==
X-Google-Smtp-Source: AGHT+IGrOZ01cn2qw0qI6mUsa0BPS8suIqLpCLQSaooT4447KAkiTjntIXrQMcMfujDWXRNpeNDPG7ExNaXoGbZJW2E=
X-Received: by 2002:a05:6512:1115:b0:4fb:9f93:365f with SMTP id
 l21-20020a056512111500b004fb9f93365fmr8180795lfg.38.1695032532962; Mon, 18
 Sep 2023 03:22:12 -0700 (PDT)
MIME-Version: 1.0
References: <20230822084520.564937-1-wenst@chromium.org> <20230822084520.564937-3-wenst@chromium.org>
 <7f743fba-6cba-cce0-d499-0a9d95e3b026@collabora.com>
In-Reply-To: <7f743fba-6cba-cce0-d499-0a9d95e3b026@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 18 Sep 2023 18:22:01 +0800
Message-ID: <CAGXv+5FgGtpY697e9-Dnk=1Ro0dM7C6qmtdXkWHb5EtocU+t_w@mail.gmail.com>
Subject: Re: [PATCH v2 02/11] mfd: mt6358: Add registers for MT6366 specific regulators
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Zhiyong Tao <zhiyong.tao@mediatek.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230918_032224_993208_21CCC03A 
X-CRM114-Status: GOOD (  23.76  )
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

On Fri, Sep 15, 2023 at 4:55=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Il 22/08/23 10:45, Chen-Yu Tsai ha scritto:
> > The MT6366 PMIC, compared to the MT6358, does away with the VCAM*
> > regulators. Two regulators VM18 and VMDDR reuse their register space.
> > There's also a VSRAM type regulator VSRAM_CORE thats' split between
> > the VCAM* register space and other parts.
> >
> > Add register address macros for these MT6366 specific regulators.
> >
> > Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
>
> For ease of applying to MFD, I think it's ok to have the header changes s=
plit
> from the actual user; so:

Actually that doesn't help, because this is a compile time dependency.
Merging this through the MFD tree and the rest through the regulator
tree would mean either creating an immutable branch, or Lee giving an
ack for this patch to go through the regulator tree. We would be doing
the latter if we squashed the patches together anyway. I think squashing
them does make sense.

ChenYu

> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com>
>
> Cheers!
>
> > ---
> >   include/linux/mfd/mt6358/registers.h | 17 +++++++++++++++++
> >   1 file changed, 17 insertions(+)
> >
> > diff --git a/include/linux/mfd/mt6358/registers.h b/include/linux/mfd/m=
t6358/registers.h
> > index 5ea2590be710..d83e87298ac4 100644
> > --- a/include/linux/mfd/mt6358/registers.h
> > +++ b/include/linux/mfd/mt6358/registers.h
> > @@ -294,4 +294,21 @@
> >   #define MT6358_AUD_TOP_INT_CON0               0x2228
> >   #define MT6358_AUD_TOP_INT_STATUS0            0x2234
> >
> > +/*
> > + * MT6366 has no VCAM*, but has other regulators in its place. The nam=
es
> > + * keep the MT6358 prefix for ease of use in the regulator driver.
> > + */
> > +#define MT6358_LDO_VSRAM_CON5                 0x1bf8
> > +#define MT6358_LDO_VM18_CON0                  MT6358_LDO_VCAMA1_CON0
> > +#define MT6358_LDO_VM18_CON1                  MT6358_LDO_VCAMA1_CON1
> > +#define MT6358_LDO_VM18_CON2                  MT6358_LDO_VCAMA1_CON2
> > +#define MT6358_LDO_VMDDR_CON0                 MT6358_LDO_VCAMA2_CON0
> > +#define MT6358_LDO_VMDDR_CON1                 MT6358_LDO_VCAMA2_CON1
> > +#define MT6358_LDO_VMDDR_CON2                 MT6358_LDO_VCAMA2_CON2
> > +#define MT6358_LDO_VSRAM_CORE_CON0            MT6358_LDO_VCAMD_CON0
> > +#define MT6358_LDO_VSRAM_CORE_DBG0            0x1cb6
> > +#define MT6358_LDO_VSRAM_CORE_DBG1            0x1cb8
> > +#define MT6358_VM18_ANA_CON0                  MT6358_VCAMA1_ANA_CON0
> > +#define MT6358_VMDDR_ANA_CON0                 MT6358_VCAMD_ANA_CON0
> > +
> >   #endif /* __MFD_MT6358_REGISTERS_H__ */
>

