Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC67EC61DA3
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Feb 2023 10:12:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=958ik2d8h0rqs5xPiVi4wdegUDuAm3bJLnk3HJrVN6g=; b=wS4I7NcSAJjS+13QUv2nuK536i
	RwQ33BahmTVCciScmszF48KFvjr3KjpSyN7fpiGWODm4p+hdIr1sV0FV3qY8Fms8dgBsSh1xL82OP
	IOOktur87EjOpI7+ZHIrjJGblt5dhI5UMYCkwRkCkuuar9zM11BZJyhKvNKQ4S8P9OPEYXeNDgPdk
	huQU/6LzNexLKJ3FhD/RZWMmXV/gQb+jlCDf2k3ykrG+odRP/xEk7dqRHU6wQk0Rjo7bs+c4/+rpO
	GZvTz5b3aSvrO/7IT2ZTD0izmUHOYnFn6VCIRp5gsA+pOa9B6KinzNd6XVCg++ygsQ1K8kQJCU8UX
	CGdv2NHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVV47-001vLO-PN; Fri, 24 Feb 2023 10:12:35 +0000
Received: from mail-vs1-xe29.google.com ([2607:f8b0:4864:20::e29])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVV1j-001u3i-F5
	for linux-mediatek@lists.infradead.org; Fri, 24 Feb 2023 10:10:08 +0000
Received: by mail-vs1-xe29.google.com with SMTP id o2so7269966vss.8
        for <linux-mediatek@lists.infradead.org>; Fri, 24 Feb 2023 02:10:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=958ik2d8h0rqs5xPiVi4wdegUDuAm3bJLnk3HJrVN6g=;
        b=geYtILrMhZyPN1m76Js6L2I06THILfyxZELzigrOgZaamrjIq5P20GG4Ltklb2cWIg
         ig+jb6hjYB8q0YWsHTDssLJRDLTdvCzPHF/u+MclpxDKZyNcOM+02n3x1rXwNNfPb2uO
         X4G85Wv5amgQr2H37ch3HJgI3bv3/FHEnRRJs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=958ik2d8h0rqs5xPiVi4wdegUDuAm3bJLnk3HJrVN6g=;
        b=J27usG1GibaQlGiwSTa50uNEzCY4iXhBRFXWqSrtbQt+AFGxHgvC7cGuwEGgS/2nsw
         xKmzVTtrGrMYChKYzoaS7INbPgWaUPMhl5GrSS5yPd73Um+EEiBwrlk9uXSleRrda/JE
         VXL7xiqZTg6D49LrBl0Ug9vVWGGOxjjUvwvV/4HdN9BSusFU/8qK52yZnux182aKCFv1
         6SbvRXu3z1rO8CCfhe5+S9/DSOdcwwjCKFoldFQEharSHzT5ZHtrjd7rqPtaaBFDcqqz
         LD1EI080wAw3tog+ZCVrx1ADaI6UNfoY8KOLUctbIESoURTJER8FjW0j0yKMgksIzKr/
         K8/A==
X-Gm-Message-State: AO0yUKWJV4xXrwfffsi2S0xJkiAZBOfjPthYlkH1z2KySjIVDlMrvNYj
	u3Yscb9+KU+PPhxmI79l0MlCcNJCnTSMd2pesW5kzSU07IkzBsiH
X-Google-Smtp-Source: AK7set9+NfQuPrNJdufHu//12XKpnplgNgl5zZ8Ksiq0QrfjzgZUfHBB+nf4MHufeDSr6TAoH6tCu4h1r7GapdETZYw=
X-Received: by 2002:a67:ec11:0:b0:411:c62b:6bf0 with SMTP id
 d17-20020a67ec11000000b00411c62b6bf0mr2077517vso.3.1677233406576; Fri, 24 Feb
 2023 02:10:06 -0800 (PST)
MIME-Version: 1.0
References: <20230223133440.80941-1-angelogioacchino.delregno@collabora.com>
 <20230223133440.80941-3-angelogioacchino.delregno@collabora.com> <CAGXv+5FK8BjSgwS5276FJj4zG_3STMbQwQWdyn3LjOvQ=108RQ@mail.gmail.com>
In-Reply-To: <CAGXv+5FK8BjSgwS5276FJj4zG_3STMbQwQWdyn3LjOvQ=108RQ@mail.gmail.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 24 Feb 2023 18:09:55 +0800
Message-ID: <CAGXv+5Gv19nijoW5i8=Ouh4H24X3pknM3ZBSo9Tgv8XkLt+XbQ@mail.gmail.com>
Subject: Re: [PATCH v3 02/11] dt-bindings: gpu: mali-bifrost: Split out
 MediaTek power-domains variation
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: airlied@gmail.com, daniel@ffwll.ch, robh+dt@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, steven.price@arm.com, 
	alyssa.rosenzweig@collabora.com, matthias.bgg@gmail.com, robh@kernel.org, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230224_021007_544512_D9FE0D0D 
X-CRM114-Status: GOOD (  13.99  )
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

On Fri, Feb 24, 2023 at 6:08 PM Chen-Yu Tsai <wenst@chromium.org> wrote:
>
> On Thu, Feb 23, 2023 at 9:34 PM AngeloGioacchino Del Regno
> <angelogioacchino.delregno@collabora.com> wrote:
> >
> > In preparation for adding new bindings for new MediaTek SoCs, split out
> > the power-domain-names and power-domainsvariation from the `else` in

                                            ^ missing space

Once fixed,

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

> > the current mediatek,mt8183-mali conditional.
> >
> > The sram-supply part is left in place to be disallowed for anything
> > that is not compatible with "mediatek,mt8183-mali" as this regulator
> > is MediaTek-specific and it is, and will ever be, used only for this
> > specific string due to the addition of the mediatek-regulator-coupler
> > driver.
> >
> > Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>
> Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

