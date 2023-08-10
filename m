Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4509DC04A94
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Aug 2023 05:36:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EslHdHq3bNylyhIFtlknMEJBi77orec+gHJpWqTOmeI=; b=FvSsRXfWoWirHecM7I9PIJvNDR
	sglZ+M7Ttk8SS3X8cpVhjB5DzIqL+DlHlyXtmKhncIYEYu85uoqNuqt1NmMlHlhgNeM0Tq8qTq2BN
	HMt7g1hQf0ktZ9j3lg0jl2CjyNr353adp3cfeY/sICLSiFv3Gty6h8XsiHJ0OPyQZ+34rLg3jHOuB
	fuAurVYX12MPkWvBhIMgpDsZryXk5k4o78S5Y+2eqcWUAUrHBWa5zld50G2r7VhC7fb5vPC6/Ybz0
	8yE6DMtE8Ku0Ivy8NBW0puhOJlyDgGWz8mbzevYk9/mtKtRfFgQruUXq1KNv40eiGQAFVCNphGgVe
	XWR+su4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qTyLL-006aUt-0O;
	Thu, 10 Aug 2023 05:36:19 +0000
Received: from mail-io1-xd2e.google.com ([2607:f8b0:4864:20::d2e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qTyLI-006aTV-1t
	for linux-mediatek@lists.infradead.org;
	Thu, 10 Aug 2023 05:36:17 +0000
Received: by mail-io1-xd2e.google.com with SMTP id ca18e2360f4ac-790ca0ed6d3so16024739f.3
        for <linux-mediatek@lists.infradead.org>; Wed, 09 Aug 2023 22:36:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1691645774; x=1692250574;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EslHdHq3bNylyhIFtlknMEJBi77orec+gHJpWqTOmeI=;
        b=K4keDQSP/3U2u7hxvZVjvxEjldSgp5MMCthaOwh+Wnk+OQEYA0zl85zPmtk4ClTXq8
         UsvGm1ms/3SS7kCKPdKqSdYYUwAa+u5QtNap8G/gC9Ywi+m4unJSas73ZZpml4vukU87
         4ruzDPC0wzjCIBqRIQb5aP/zUg++jShfPYlJc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691645774; x=1692250574;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EslHdHq3bNylyhIFtlknMEJBi77orec+gHJpWqTOmeI=;
        b=RlygY1moGo24A/Sxi0/f6ZS6PAbh8xAgzEaPUE7o98sREXT3e4WR7dEyZt+y/3ncB0
         Rx8UDQGQ28BbsN0yMQQUyN/Kl26TYT56trZJuKi9epsavO6M2toO/YMIjcgOWeXsXhrc
         2IfA6xJSvT+Zwn8x2Cye8oE1EN0DytyBBoDPe5IvuRFfMRInQV1/sNagcOrHvD/kp9cc
         Id1q6SfWj47esC0DdVMWRCGxUTI6IoQtCnrXKI6dj1IBubxxaLslXnsVcmOJCkwK4QdV
         0uNoOvAFkrH9j7s7YDnDsLSPvu0CqP5bnp5J+Cb83so8udaFTVgwJtX0t7EqOQ6Aq3yC
         9Ifg==
X-Gm-Message-State: AOJu0Yze70KS6txpq8QTkkowy1DuJbGPKBOYyZE95susrPWYPolrtlGq
	J8TI5zXBcqI1kTJZpkLt7OwF3dWKsSjgc6xKaGI=
X-Google-Smtp-Source: AGHT+IFg0WU6Uq2vS2sG7tnRzyZPbs9OY89q3X1pD3xA81C96lEAlBovjmkb8mQ7AzPJ/TSjJxm2uw==
X-Received: by 2002:a05:6602:1804:b0:783:58f4:2e2e with SMTP id t4-20020a056602180400b0078358f42e2emr1903106ioh.0.1691645774337;
        Wed, 09 Aug 2023 22:36:14 -0700 (PDT)
Received: from mail-io1-f53.google.com (mail-io1-f53.google.com. [209.85.166.53])
        by smtp.gmail.com with ESMTPSA id d10-20020a5e8a0a000000b007862c74cec6sm254955iok.1.2023.08.09.22.36.13
        for <linux-mediatek@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Aug 2023 22:36:13 -0700 (PDT)
Received: by mail-io1-f53.google.com with SMTP id ca18e2360f4ac-7910b9bb891so16093539f.2
        for <linux-mediatek@lists.infradead.org>; Wed, 09 Aug 2023 22:36:13 -0700 (PDT)
X-Received: by 2002:a6b:db15:0:b0:786:71d0:ff9b with SMTP id
 t21-20020a6bdb15000000b0078671d0ff9bmr2208984ioc.10.1691645773129; Wed, 09
 Aug 2023 22:36:13 -0700 (PDT)
MIME-Version: 1.0
References: <20230809181525.7561-1-jason-jh.lin@mediatek.com> <20230809181525.7561-3-jason-jh.lin@mediatek.com>
In-Reply-To: <20230809181525.7561-3-jason-jh.lin@mediatek.com>
From: Fei Shao <fshao@chromium.org>
Date: Thu, 10 Aug 2023 13:35:37 +0800
X-Gmail-Original-Message-ID: <CAC=S1njMfS4LBxXg85b4oiwfhXNv5-Bm9+S-ZqupfiWUTs0ssA@mail.gmail.com>
Message-ID: <CAC=S1njMfS4LBxXg85b4oiwfhXNv5-Bm9+S-ZqupfiWUTs0ssA@mail.gmail.com>
Subject: Re: [PATCH v9 2/7] drm/mediatek: Add crtc path enum for all_drm_priv array
To: "Jason-JH.Lin" <jason-jh.lin@mediatek.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Eugen Hristev <eugen.hristev@collabora.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	Jason-ch Chen <jason-ch.chen@mediatek.com>, Johnson Wang <johnson.wang@mediatek.com>, 
	Singo Chang <singo.chang@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>, 
	Shawn Sung <shawn.sung@mediatek.com>, dri-devel@lists.freedesktop.org, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, 
	Project_Global_Chrome_Upstream_Group@mediatek.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230809_223616_628336_F35C7E92 
X-CRM114-Status: UNSURE (   7.88  )
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

On Thu, Aug 10, 2023 at 2:15=E2=80=AFAM Jason-JH.Lin <jason-jh.lin@mediatek=
.com> wrote:
>
> Add mtk_drm_crtc_path enum for each display path.
>
> Instead of using array index of all_drm_priv in mtk_drm_kms_init(),
> mtk_drm_crtc_path enum can make code more readable.
>
> Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>

Tested with MT8188 and the internal display is up and functioning.

Reviewed-by: Fei Shao <fshao@chromium.org>
Tested-by: Fei Shao <fshao@chromium.org>

