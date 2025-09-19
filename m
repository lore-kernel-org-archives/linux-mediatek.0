Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6A53CAC592
	for <linux-mediatek@archiver.kernel.org>; Fri, 19 Sep 2025 08:32:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1vCBrNiEKTyi9Q3k3Ml4hn7pfySJO9AiRtZz93HFOeM=; b=WEm75gBbzd4V+Zq4N50oJ6u0y/
	E/3H3NBNfgei5sRc72MDFfFump21ArkbaMi7mxX5Fui6Kh91JKf9FDga1DrNrLbJUiiWY18OiKZz3
	444f+1tJhtIcLOIS66PHL4YM/bntc/PZP2iNtimcm7DYE+c2nfFHyr5yaDDzf1+XaG0Kg+jJ2U80n
	EJ7Dvc6d86ixUaZv1Pzq8MxFrK+BMblOCJbAsuiCCe+anHl9gg1GngpXC/MkhiIt4b+jOFfUgRxJ1
	c4n3Xz6d29sjE8Vnx86xy+E7E6KVJwu7gzPVJ2Zwumk/z3w20+gW3xC2rSKWzOlxVPRXZgpHxyJoQ
	GntWaTzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzWXB-00000002GFi-2HSx;
	Fri, 19 Sep 2025 08:32:01 +0000
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzWX9-00000002GEp-1NwY
	for linux-mediatek@lists.infradead.org;
	Fri, 19 Sep 2025 08:32:00 +0000
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-57933d3e498so1762461e87.3
        for <linux-mediatek@lists.infradead.org>; Fri, 19 Sep 2025 01:31:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1758270716; x=1758875516; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1vCBrNiEKTyi9Q3k3Ml4hn7pfySJO9AiRtZz93HFOeM=;
        b=oGTPlAKsvCwNa0vggEAmEKN0tPinDwxBPxER9ypaEpT2FC4LtqR21Wnp4kPMn6sDx/
         0Q7s43hAipdJRA/ShEqV9TB62a1N3rKZVRBQeHPsITxpsOk20gvEl2VIGCMEZ7pSNAbL
         AhHGF/ppuZdHoOh776+AhjjIrFX2vKR6UoDpc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758270716; x=1758875516;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1vCBrNiEKTyi9Q3k3Ml4hn7pfySJO9AiRtZz93HFOeM=;
        b=JO5LR/My6wP0lhab+jxpKBm9VmPM2Wrjlm73RODCGwk+eEntO4Fq2NMmc7A1mhYKch
         rUaZrrrax9iAES68Imk6RWT6o4p4XBH8kKTBIZMWMddqWNCrG5gy4jNQW49a64vXBISi
         p7LNuHUmtjN86SmlHgB6J5yE2OQvzk5q84nDId1EosN5/7f2Bkd/5ZCLHqHsC3lKdHTM
         DHBBsdN/dhLUVNwxRVZKZ4zN21pmMgPkF8fcd/vgdxdYpSFwCPLKNQGXpoaeCKnG/SFN
         2JApMls9Ed8IHBl9xwLHp+XveZbpwHUg7iOpnfikektQxH9MPub4hNd6OZdXEtfDBvsm
         UinA==
X-Forwarded-Encrypted: i=1; AJvYcCV2iUm/LONageiZqMjgYVceF89h1+yBGDps92dIK1sj4W7s3K8Fr04FxH/NP3UpTgSpN4RpgdwAMXGNy6/DUA==@lists.infradead.org
X-Gm-Message-State: AOJu0Ywy4UtTJnY6ejPCPJpFTtfV6cnZ49cXyuZ6gDGJ/R5r/aUTjNsZ
	nEhbJE7YUY7K5Y8cWiFANHvh8IplezJWnPPlma9D0axXoUcklVKNsLRhurgKkrRiGg3Pd5jJxjM
	pWeFkmLBM9MjXW2wOmn7dMT63YeF7VlpBDjpT3i+l
X-Gm-Gg: ASbGncuTnFxaulymPYW/NANdRyjGcvgnYFWJs0spjcoI3XD0u+q22ctFJsG4Ve2dWo5
	taSS1ZtSkpWzDo6DkYqiMI7+OElxstm07uEf9gbN3heAjzVjMrVdNwZcznVGpRIgpYagpp8Rp1h
	pDTtoOt4ZLEnm+ZifgMWnDVa7AlgII+X3tYuFspvq1vsl1sVxm5QDsLnwdkY08bnfLxUwyyj9fF
	wSTo2b6r9olwoALZfNMdm0wPHixG8yEiiQ=
X-Google-Smtp-Source: AGHT+IGJyLApucLYoiVvLVyhVW2X95UA+hKEnkJWRx68Jso5l2IUFZ6Lp0yp/otlrkifX0mDYXdbFrB33I4Cq4SdXuY=
X-Received: by 2002:a05:6512:308c:b0:55f:536f:e8a2 with SMTP id
 2adb3069b0e04-579e3d2d463mr792114e87.53.1758270716503; Fri, 19 Sep 2025
 01:31:56 -0700 (PDT)
MIME-Version: 1.0
References: <20250822021217.1598-1-jjian.zhou@mediatek.com>
 <20250822021217.1598-3-jjian.zhou@mediatek.com> <CABb+yY16DPJwVTHap4F6n5YJoOJzQLtqKiCQ-2MUm67pzF8uXg@mail.gmail.com>
In-Reply-To: <CABb+yY16DPJwVTHap4F6n5YJoOJzQLtqKiCQ-2MUm67pzF8uXg@mail.gmail.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 19 Sep 2025 16:31:44 +0800
X-Gm-Features: AS18NWCHPPCOGpgOPgYhcar-Bfyg0XTAKO-xFCzjeyIm7xmJf4PNr7KosKW0NG8
Message-ID: <CAGXv+5F-L2+4PGixx7OG2+vp2yXc_2885yMzqWtkQDwhxVAPxw@mail.gmail.com>
Subject: Re: [PATCH v5 2/2] mailbox: mediatek: Add mtk-vcp-mailbox driver
To: Jassi Brar <jassisinghbrar@gmail.com>
Cc: Jjian Zhou <jjian.zhou@mediatek.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, 
	Project_Global_Chrome_Upstream_Group@mediatek.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250919_013159_382063_91CDF5C8 
X-CRM114-Status: GOOD (  16.84  )
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

On Fri, Sep 19, 2025 at 7:50=E2=80=AFAM Jassi Brar <jassisinghbrar@gmail.co=
m> wrote:
>
> On Thu, Aug 21, 2025 at 9:12=E2=80=AFPM Jjian Zhou <jjian.zhou@mediatek.c=
om> wrote:
>
> .....
>
> > +#include <linux/module.h>
> > +#include <linux/of.h>
> > +#include <linux/platform_device.h>
> > +#include <linux/slab.h>
> > +
> > +struct mtk_vcp_mbox_priv {
> Maybe 'mtk_vcp_mbox' is a more appropriate name ?
>
> > +       void __iomem *base;
> > +       struct device *dev;
> > +       struct mbox_controller mbox;
> > +       const struct mtk_vcp_mbox_cfg *cfg;
> > +       struct mtk_ipi_info ipi_recv;
>
> Maybe also have "struct mbox_chan chan[1]; " so that you don't have to
> allocate one during the probe.

> Also if you have  "struct mbox_controller mbox;" as the first member,
> you could simply typecast that to get this structure.
> Something like "struct mpfs_mbox" in mailbox-mpfs.c

I read somewhere that this way of subclassing is not recommended.
Instead the base class should explicitly not be the first member.
And then container_of() should be used.

I don't remember where I read this though. But I think the explicit
container_of() is easier for understanding the intent.

ChenYu

> ....
> > +
> > +static struct mbox_chan *mtk_vcp_mbox_xlate(struct mbox_controller *mb=
ox,
> > +                                           const struct of_phandle_arg=
s *sp)
> > +{
> > +       if (sp->args_count)
> > +               return NULL;
> > +
> > +       return mbox->chans;
>
> return &mbox->chans[0]   seems better.
>
> thnx

