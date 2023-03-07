Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE3EDC678DB
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Mar 2023 10:27:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oQWWeSgJzRDMlqiwuu81ooiy+d+wn5swGzaHRiZJYgg=; b=USk92QQdGEJ4n1Q+wKgFRq6WRf
	/BsEgJ1yqVuPIsyg+yfcNdkgQ+XZC7FfHgBiA93saOl7J5gqIrH4GwZd8G89g35wzFWNHS2/acC2Y
	t9Y4uhByhKltwVNrB5tRfS+INTlv4NuVe4gj5xHAwpNczF20pE4WLzHz5MUxBZkZte82J4Lr4lkKg
	MwWJqxBqHn1MOEBNCD94kusx5/0pQhKvd8gMsT16qBKpccXm0sTgdCh518mTcmmE7zLNKB/Rm32Gf
	Ifcm8ESD4njVB++ZnrhTYxSa98LkrJqrs0VwbFzj/CqyXwot/VuWO5rLxi1nnRn3Iuiwl2jPR3oOz
	vp+944dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZUXl-00HGGk-SV; Tue, 07 Mar 2023 10:27:41 +0000
Received: from mail-vs1-xe33.google.com ([2607:f8b0:4864:20::e33])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZUXi-00HGCm-7O
	for linux-mediatek@lists.infradead.org; Tue, 07 Mar 2023 10:27:39 +0000
Received: by mail-vs1-xe33.google.com with SMTP id by13so11867459vsb.3
        for <linux-mediatek@lists.infradead.org>; Tue, 07 Mar 2023 02:27:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1678184856;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oQWWeSgJzRDMlqiwuu81ooiy+d+wn5swGzaHRiZJYgg=;
        b=gmu+hdgeQO4DLaMQAIBgOxQcm5fF1Lm3Ar4OTwBQRMayPM9zIf3PwUk72MU09LozmV
         gQ9Tdyj4MicaNl2dDTpGnA7tgGCWFcGhD/rnYjdeuJ90XwqcbNSlVDAbUabd3KaNFxOo
         +QwdamtK++gXs4b7HUfhVRbNXS+wxYKl+SDLw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678184856;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oQWWeSgJzRDMlqiwuu81ooiy+d+wn5swGzaHRiZJYgg=;
        b=rs9sv//FygAcKBQMO8z019NCsKsMCeDut2owkPrZSjh4gET0gtePY98dNstteTnOZG
         KgNw9rvSA8pUytP4LbGmhHoJjIM4tGYlyetK0XKiYjKPgeUejLAjziGibp/a1GGg68tv
         fvqLV4LgMcHLoCUFkteUVEZo5Y77ShNgePy40YYj0gUMR7F2tOMsUbz+yJsNlSkzaWZ0
         W4wu+LOOVfmsVGQVo7kQWLdjE6ClS3djsdxIgaQ7pZ/O/LB2tXPI4a48AxBqX7+hYlxi
         nRMHobYFV8Usll5lJ/Ggz9E8cJkvDQa8SX0G74Y7oocyQ8yH6tQVHl0bOTR5qOewsrJ9
         k0Hg==
X-Gm-Message-State: AO0yUKUx8SGUc9wVMCl4rDlJLh5h+0r2xj6w0ja0BWIGZdKjWfdXRayi
	/TTCzKYYAShUbx7Fl4ylioCNO5wI/G/7TyxMXMzR3Q==
X-Google-Smtp-Source: AK7set/nfUjGPRAD0f9xbAT5uy4DYnrTL6hnkblxAJK9+rSFg8OKB7S+yFpCVZviDWEpneSk0qGS+aaVnvZD9DRlCnQ=
X-Received: by 2002:a67:db97:0:b0:412:2ed6:d79b with SMTP id
 f23-20020a67db97000000b004122ed6d79bmr9301865vsk.3.1678184856050; Tue, 07 Mar
 2023 02:27:36 -0800 (PST)
MIME-Version: 1.0
References: <20230228102704.708150-1-angelogioacchino.delregno@collabora.com> <20230228102704.708150-3-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230228102704.708150-3-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 7 Mar 2023 18:27:24 +0800
Message-ID: <CAGXv+5E8n+OnWY0ChWekgoF26kXaPEEGUmVxmpJYC70+e3K-RA@mail.gmail.com>
Subject: Re: [PATCH v4 03/12] dt-bindings: gpu: mali-bifrost: Fix
 power-domain-names validation
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: airlied@gmail.com, daniel@ffwll.ch, robh+dt@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, steven.price@arm.com, 
	alyssa.rosenzweig@collabora.com, matthias.bgg@gmail.com, robh@kernel.org, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230307_022738_290909_B04FED1D 
X-CRM114-Status: UNSURE (   7.89  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, Feb 28, 2023 at 6:27=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Commit ("dt-bindings: gpu: mali-bifrost: Add Mediatek MT8183")
> incorrectly introduced power domain names for MT8183, causing
> validation issues.
>
> Add power-domain-names to the base schema, allowing a maximum of
> five elements; since platforms having a single power domain don't
> need any actual domain name, disallow that for each sub-schema.
>
> Fixes: a7a596cd3115 ("dt-bindings: gpu: mali-bifrost: Add Mediatek MT8183=
")
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>

Tested-by: Chen-Yu Tsai <wenst@chromium.org>
  with `make dt_binding_check` and `make dtbs_check`

