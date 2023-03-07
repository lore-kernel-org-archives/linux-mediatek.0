Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64769C678D5
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Mar 2023 10:27:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0lIP6QMCX3nExnse1kF0X/k89ASNhvKrsoqP0TvYGno=; b=c1yTbrcQYnyO3sW3wuCWJ/YvIy
	sHt09xncVrNS82k7kO1SqI6kLxxaxevFNY5kJPYTpk+m85g2rAeb4TLPRlOY3fEPZJCntHOpT0ig9
	bRMQtAhj0M3LH49vTm+WjBEcjZi61ETGMIXXlWEt6GYmv9bQgCP0RL9dPhSbxfq9fNWQx45QZdTf2
	icVKwv+5MDqxYt/D379Q7ggK3Y9PRhIkSTB3GOCO69o/iGH+V7GLEkHj1FQCI2cUeOHKoeWLoxviM
	gBNd4nKKPbNbODmlEctY4RYMEGywYp9p6txO3ElFUUQTTsN5n9IpGv4/WWiaarFBMTygieG78mf/9
	snKg/YVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZUXX-00HG7S-LB; Tue, 07 Mar 2023 10:27:27 +0000
Received: from mail-ua1-x929.google.com ([2607:f8b0:4864:20::929])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZUXJ-00HFyW-Hh
	for linux-mediatek@lists.infradead.org; Tue, 07 Mar 2023 10:27:15 +0000
Received: by mail-ua1-x929.google.com with SMTP id s23so8506370uae.5
        for <linux-mediatek@lists.infradead.org>; Tue, 07 Mar 2023 02:27:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1678184830;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0lIP6QMCX3nExnse1kF0X/k89ASNhvKrsoqP0TvYGno=;
        b=YA/vWYLL+KxXY1sPwdyBi7xdV37GzpA+yMEtwec/IcVfnN/Y7OW+zTmdCExJKPTKep
         sUHs6wFhVeM9+EKCrehvRB00bEadA1Lrrw1+brNUyvsK8bbk1z5r7CfTtHvTCt9fE1J2
         p7N36WMUM8nENpwHPcSzU+hfddZn7hAto9rDg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678184830;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0lIP6QMCX3nExnse1kF0X/k89ASNhvKrsoqP0TvYGno=;
        b=hwoz3HjhmqFiCjd62+dF1FkSNpKSfbo0xAnLOgakCOk7/5EVVkP+zarRBttzbIyzwX
         5YNT79OJDGdd5IqXrJlIwxnnQHmRnUveCQjDbCKz3nsTSUL9wjQhf3lFdheizLIxDVeY
         ftPgDWTRdNFMAYVYlYJ1uIwpWDQUhh/5nkVQMGasxTm4rQDkFOFYS6Z4x48znfauupUC
         eP4C8vG1DWXjQbPnMmfljuc4i257pl0LxbqCc7XV6dMlyn8doMfMLn4epMzXOGR+jcEM
         9q/g6VXFgGZd6wHPiLM7BtFtfsVA3GnFDt9i7O0B7itHWtQ5ZJiS5SzRJ90P94dLxbpC
         Ixqw==
X-Gm-Message-State: AO0yUKWPYbjmdn90zAqu9ZUYdUy6C61szC0b1YipDcPo9RnoeStH8eO7
	CSoatTgsAHR5sGI084G2KCDOs/uoQxi3QN7q6tnH/w==
X-Google-Smtp-Source: AK7set819ohzAaSDe0nZOxCmCgvs/Q8sYI8nIk6xQMEmrLHEWghxcsfgqRisZu1xB8xnfMWgTnPegQm6O/nqzaXnSRw=
X-Received: by 2002:ab0:4714:0:b0:68b:90f4:1d8c with SMTP id
 h20-20020ab04714000000b0068b90f41d8cmr3434006uac.1.1678184830022; Tue, 07 Mar
 2023 02:27:10 -0800 (PST)
MIME-Version: 1.0
References: <20230228102704.708150-1-angelogioacchino.delregno@collabora.com> <20230228102704.708150-4-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230228102704.708150-4-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 7 Mar 2023 18:26:59 +0800
Message-ID: <CAGXv+5E6EzucKFUOp1i0CgKh4tmaVMC-MV3FgjtgqmbhbB3_zg@mail.gmail.com>
Subject: Re: [PATCH v4 04/12] dt-bindings: gpu: mali-bifrost: Add sub-schema
 for MT8192's power domains
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
X-CRM114-CacheID: sfid-20230307_022713_618894_8931B128 
X-CRM114-Status: UNSURE (   9.19  )
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
> MediaTek MT8192 (and similar) needs five power domains for the
> Mali GPU and no sram-supply: change the binding to allow so by
> also introducing power-domain-names in the generic binding;
> while at it, also disallow the newly introduced power-domain-names
> for all non-MediaTek bindings.
>
> Fixes: 5d82e74a97c2 ("dt-bindings: Add compatible for Mali Valhall (JM)")
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>
> Reviewed-by: Rob Herring <robh@kernel.org>
> Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

Tested-by: Chen-Yu Tsai <wenst@chromium.org>
  with `make dt_binding_check` and `make dtbs_check`

