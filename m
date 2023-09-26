Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 545DBCE7A91
	for <linux-mediatek@archiver.kernel.org>; Tue, 26 Sep 2023 03:59:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lV5ugLr1Y+ECdRI+pDpUWEKUXpx2iu59FhqsHyyCDrw=; b=ngM57p+wqspr7Kl3nLV+ydB9qU
	+KtABXra8WhcafLlf3wmEB2HP+LpRB+ur+23FKRBM8vjYqWfYw6l5xhk3vSd9fjcCSxhPPDNkTxld
	OclIQBqr5M44rEsoHJgvDbFxLr0MTvDw4+B8m8H46GgtA50XuvXolhy1socFuSd4gBXPtjSpPHG34
	7Zn/gztqp52hNPFEUUNk/DWLY8eS1EaYLgU7B9E5MPVrbSJj9nOc88aiGJE3EB1r2+XMOHq5oGOQ8
	pL2WgyAh8EiQW8pJyGQCFhjw+m9g0rmytOU2iAfwL7odAM+SXieq8NzvpV9MAZQN4KLfSXaKRHxgv
	9ii23jJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qkzE5-00FVrb-09;
	Tue, 26 Sep 2023 03:59:09 +0000
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qkzE2-00FVqO-0p
	for linux-mediatek@lists.infradead.org;
	Tue, 26 Sep 2023 03:59:07 +0000
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-50435ad51bbso10688426e87.2
        for <linux-mediatek@lists.infradead.org>; Mon, 25 Sep 2023 20:58:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1695700735; x=1696305535; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lV5ugLr1Y+ECdRI+pDpUWEKUXpx2iu59FhqsHyyCDrw=;
        b=LUzsmsyhCCp2cL9gq2rvOrP3vMd2y4rAR+8nZiDhbvNcxbfUwCfFI4MgVboozgp90Q
         YcMiE3aAEkz2oz8S9CGkYtG8klZzCyFWLLBJ3W6cHAoPv1T65PSUXR81tQfOA5CuHPBN
         tlNdCQanQB/urrJmDUPVKfrU3NrSiAOhTb6IU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695700735; x=1696305535;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lV5ugLr1Y+ECdRI+pDpUWEKUXpx2iu59FhqsHyyCDrw=;
        b=efd2XYbLW/HblHrD3jK9FW7MvdQKSJwXqkZlcQJ1vxZx21bo4Y/H6FQuvgTvDgNbIi
         bdnkK/HBVpF7IqERy18Ue73TC0fkfXchyhNrad4iwbPzLe20x6G7cWQ/ywENzAL419Cr
         Vw4spmoezsLZuuvTLDhcfkBvP2k0Gq6E2VXXqc1vr9WLvovwJIiqNOqqeSCGa27HE4SR
         hLK2ou2Y5WphtNLhXHz8cJE6v76XnAOp3gFt7VIfLihDo7PqnIJ2FHH/s+zSnvAtLhbE
         f6r5jG34n5XdnFAsKv87oDNxF/ZRM2GTYmYhYUg/GDWrrqrCcQeAeG3BOBrODHpFh0/c
         qABA==
X-Gm-Message-State: AOJu0Yxc6V+JnRk6XWO/+hKlp0Iouj1TP0O5xDzpj5m/K1pfmZYc8z32
	HXrVvh78/f7RqiooXMHrOt9OfAAcsr6pJENQtszwsQ==
X-Google-Smtp-Source: AGHT+IED84e7Z9ZvMCy6KD0tN48KamDFAPmMnsxp6Rme983CevnefjHgV4b4TUXf2SI7ZugBa8QooYdCYqDrJ5Jp4ts=
X-Received: by 2002:ac2:5e2c:0:b0:503:442:5957 with SMTP id
 o12-20020ac25e2c000000b0050304425957mr6838573lfg.41.1695700734958; Mon, 25
 Sep 2023 20:58:54 -0700 (PDT)
MIME-Version: 1.0
References: <20230919104357.3971512-1-wenst@chromium.org> <20230919104357.3971512-8-wenst@chromium.org>
 <ZRF6mbpswWoxdJsl@finisterre.sirena.org.uk>
In-Reply-To: <ZRF6mbpswWoxdJsl@finisterre.sirena.org.uk>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 26 Sep 2023 11:58:43 +0800
Message-ID: <CAGXv+5EeQupoWc880sCSOuGsdc24y6qPBaaypdV749oHi-XjSA@mail.gmail.com>
Subject: Re: [PATCH v3 07/12] regulator: mt6358: Add supply names for MT6358 regulators
To: Mark Brown <broonie@kernel.org>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Zhiyong Tao <zhiyong.tao@mediatek.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230925_205906_292190_760AEE30 
X-CRM114-Status: GOOD (  14.01  )
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

On Mon, Sep 25, 2023 at 8:18=E2=80=AFPM Mark Brown <broonie@kernel.org> wro=
te:
>
> On Tue, Sep 19, 2023 at 06:43:50PM +0800, Chen-Yu Tsai wrote:
> > The DT bindings for MT6358 regulator now defines the supply names for t=
he
> > PMIC.
> >
> > Add support for them by adding .supply_name field settings for each
> > regulator.
>
> This doesn't apply against current code, please check and resend (I was
> using -rc3).

Which parts were you planning to merge? I believe we're still blocked on
the DT bindings. And I need to update the patches to fix a warning reported
by Rob's bot.

ChenYu

