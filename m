Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 049F2E706FA
	for <linux-mediatek@archiver.kernel.org>; Thu, 21 Sep 2023 09:09:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A3ymofUjZ6cvdicUv/Ni45W5/10AGo0Wvy6M/7t0Upc=; b=CJ4oXDUG4i7O2LTfHEKAnBRO0Q
	QLYHQLH6SM8waD0XXK8h3SWgo/h/6Trlt5U+K/QXHam5XuPd9GGWA7rPsGF9I1pd761ywpml+QsBi
	xWEGPhnrB/dx7zTnhIhQi9+ssHEOOqmgVIN+6t3rnRf9UPCgRzaE431yYWDpUi/1A8XbEHxb2ANPW
	n5D0ufHqR/nMcDO08ahKtvowSGu+wci6T/xJ15pbisvIPySk2oAbWmr3pD4IBx289p/LHjVTqpcSB
	HqEo9Eg0dMPpkI2iZhVFR9kjfxrW7Sq+3KCUPlCnZLJIBh1yaXwpdlZDSYdU+WxORMaHCGfs4CwjJ
	hOFiFeLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qjFga-005YSj-2J;
	Thu, 21 Sep 2023 09:09:24 +0000
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qjFgX-005YRt-2w
	for linux-mediatek@lists.infradead.org;
	Thu, 21 Sep 2023 09:09:23 +0000
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-502fd1e1dd8so1322286e87.1
        for <linux-mediatek@lists.infradead.org>; Thu, 21 Sep 2023 02:09:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1695287357; x=1695892157; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A3ymofUjZ6cvdicUv/Ni45W5/10AGo0Wvy6M/7t0Upc=;
        b=DdLTn3zqt44J942bTqadgfTKeDJWqE9V1uGh/tr63rgsrRImmUXcazdT9Yqch6JzSI
         Ey07GkRQWhmcXcGi/AtJurjHjA7YR4q4mPEHvwJcTL+Z5kXXHz50LrBuWD3lTzpOY2oz
         OS9/MXg12DcRTwuwLxJ+lcO++eXeY3TWllKFM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695287357; x=1695892157;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A3ymofUjZ6cvdicUv/Ni45W5/10AGo0Wvy6M/7t0Upc=;
        b=IjUIatmINzZAWk5tMMm7jivC6qmy1ZDwZLQN3ejKf8GeL521D2sUrkEe0IY0UEig5b
         IdVBSRaSLCKgbjAT3t/uuiaJcsCNRi2NMvShBFtTBQf9fa4SM/f3Skdks1DHJkAvXJJ9
         iwelI5RFgyn1F4O8SrFiFGs1PxwWwUuhT6SqTSy+RVHZPsYq/2voCt07Pd7c0V1E/MOw
         MjsHzDu93JfhBsvWQOWSFF5WGaxQpR6Vt0tL0fST5/dJ+KQvAQt5g043J6QTpYWwbYmv
         3FqYRzTwJRQAETmz4bWGWKPJCrrLuk1Vsz1KOdNXSh4bEWTlMx5Bgln59z5KbIfQ4Ewa
         hrlg==
X-Gm-Message-State: AOJu0YwiaTXkO4VSwO2rLIyH69KtDGMJMpCj5LZCRpkoByh8n4oRKHW2
	IDZ/dFNVUByD23ubAh5JxbI7tI4H1KYe3t2a2Sknew==
X-Google-Smtp-Source: AGHT+IF3ii8PU45QNcqpM+SUljh3J8nnca5RjE0Bdy00FFg9bpSg7BruQWeTpjsLBswRiqH04f9GvW1W1YDy9f62+c0=
X-Received: by 2002:ac2:5288:0:b0:504:3093:1fad with SMTP id
 q8-20020ac25288000000b0050430931fadmr691593lfm.20.1695287357186; Thu, 21 Sep
 2023 02:09:17 -0700 (PDT)
MIME-Version: 1.0
References: <20230919104357.3971512-1-wenst@chromium.org> <20230919104357.3971512-11-wenst@chromium.org>
 <20230919135539.GR13143@google.com>
In-Reply-To: <20230919135539.GR13143@google.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 21 Sep 2023 17:09:06 +0800
Message-ID: <CAGXv+5G6fYh8wULmERrxbJyXmdDJjthnUEqT+_3nTTTndLf15Q@mail.gmail.com>
Subject: Re: [PATCH v3 10/12] regulator: mt6358: Add missing regulators for MT6366
To: Lee Jones <lee@kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Mark Brown <broonie@kernel.org>, 
	Zhiyong Tao <zhiyong.tao@mediatek.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230921_020921_970085_CCF94C15 
X-CRM114-Status: GOOD (  20.35  )
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

On Tue, Sep 19, 2023 at 9:55=E2=80=AFPM Lee Jones <lee@kernel.org> wrote:
>
> On Tue, 19 Sep 2023, Chen-Yu Tsai wrote:
>
> > When support for the MT6366 PMIC regulators was added, it was assumed
> > that it had the same functionality as MT6358. In reality there are
> > differences. A few regulators have different ranges, or were renamed
> > and repurposed, or removed altogether.
> >
> > Add the 3 regulators that were missing from the original submission.
> > These are added for completeness. VSRAM_CORE is not used in existing
> > projects. VM18 and VMDDR feed DRAM related consumers, and are not used
> > in-kernel.
> >
> > Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> > ---
> > Changes since v2:
> > - Linear range selector values fixed
> >
> > Angelo's reviewed-by was dropped.
> >
> >  drivers/regulator/mt6358-regulator.c       | 20 ++++++++++++++++++++
>
> >  include/linux/mfd/mt6358/registers.h       | 17 +++++++++++++++++
>
> Acked-by: Lee Jones <lee@kernel.org>

Thanks! Could you also take a look at another patch this series is
based on and ack that one?

It's "regulator: mt6358: Add output voltage fine tuning to fixed regulators=
",
with message ID "20230913082919.1631287-3-wenst@chromium.org" [1].


ChenYu

[1] https://lore.kernel.org/linux-arm-kernel/20230913082919.1631287-4-wenst=
@chromium.org/

>
> >  include/linux/regulator/mt6358-regulator.h |  3 +++
> >  3 files changed, 40 insertions(+)
>
> [...]
>
> --
> Lee Jones [=E6=9D=8E=E7=90=BC=E6=96=AF]

