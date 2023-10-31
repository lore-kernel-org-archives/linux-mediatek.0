Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD71AC4332F
	for <linux-mediatek@archiver.kernel.org>; Tue, 31 Oct 2023 17:55:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3sOmvixHfQMEf6cSX5X+V5dJf4sK0eb9T02qoOsLX1I=; b=3IrvKvn4pXrxsEuHOHeMD76b2E
	bG3iVDgg0ErmtUB5MhtvQ2fU6NTrgPimQ+TZw9O9mZAjzMz1VUWkgUkpx0k1SXSOasGf4XSmyOmcz
	mHS0Njdaroj4Sg7W2zRUCZ2XTWJVHw7dRTlugXrWT3gdn+b/EFDqeqzINVpjtpYDInMldbHti+Vde
	EytKxlYs7s3sPfqGLtpS/3a6uXqMNVgdNCchW+l2ZWFNjv5Cgy32C7w0vEPs4Srzt/AAqj2/e47rh
	uBxgBxGCoxLUzexbgdx+uEn2HcH8vASfqtbylpbfFi6APe3Z3ZC4iAp15TIIyi0zM+pJRGleZ5sEu
	3RC/qE7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qxsxQ-005tnQ-33;
	Tue, 31 Oct 2023 17:55:16 +0000
Received: from mail-ot1-f49.google.com ([209.85.210.49])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qxsxM-005tkw-2u;
	Tue, 31 Oct 2023 17:55:14 +0000
Received: by mail-ot1-f49.google.com with SMTP id 46e09a7af769-6ce37d0f1a9so3752662a34.0;
        Tue, 31 Oct 2023 10:55:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698774907; x=1699379707;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3sOmvixHfQMEf6cSX5X+V5dJf4sK0eb9T02qoOsLX1I=;
        b=hCczlONelN6/7Auc5AY6rB1X4MEfW4DweaJ8hiZw7FZOtMZHhD35r41zCSFqMo6vwF
         AcKQXpJZvd9rbl0bA6sOHt2aFusb8J4fxgJPrDA8riim0ZF1TsJPHKmlKwcPkZara/la
         /vdr9b8hWZUlmrivt91s7KAVPk7i6/xy8CsaK9+cowoH2guelNvhTAE1nuZtaMJoBKh2
         7PbKvgEgsKTkU3PUCpUwtrMexfOcCubYh7uOmzjYaawwvA/smmLelFK8yp52gvFS90g+
         Vq5/jepBFA4Tc4p2L7h1JniAcicqGegc86rCvSfUmcoq27Kl2bRzAD5zPP6K9JalHaTH
         Yr8g==
X-Gm-Message-State: AOJu0YyasQssV1D1TzMoywmY3J7WMmu/Lm7a7/6G7AqdxoyrlNQ4E2ZG
	XPvVieGb8phTQdy7sStLRw==
X-Google-Smtp-Source: AGHT+IFmuj30SZPqXu2EIXyI7kKLettnOwn2LVc9BC4D5MXj13OHIw3L94S9nKTG5g66A8WPtZAtEA==
X-Received: by 2002:a05:6870:cd93:b0:1e9:97cc:59ff with SMTP id xb19-20020a056870cd9300b001e997cc59ffmr16786765oab.9.1698774907268;
        Tue, 31 Oct 2023 10:55:07 -0700 (PDT)
Received: from herring.priv ([4.31.143.193])
        by smtp.gmail.com with ESMTPSA id n1-20020a056870034100b001e9b02b00e9sm368369oaf.22.2023.10.31.10.55.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Oct 2023 10:55:06 -0700 (PDT)
Received: (nullmailer pid 1809590 invoked by uid 1000);
	Tue, 31 Oct 2023 17:55:05 -0000
Date: Tue, 31 Oct 2023 12:55:05 -0500
From: Rob Herring <robh@kernel.org>
To: Moudy Ho <moudy.ho@mediatek.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, Thomas Zimmermann <tzimmermann@suse.de>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, David Airlie <airlied@gmail.com>, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, Philipp Zabel <p.zabel@pengutronix.de>, Daniel Vetter <daniel@ffwll.ch>, linux-media@vger.kernel.org, Maxime Ripard <mripard@kernel.org>, dri-devel@lists.freedesktop.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-kernel@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH v9 02/16] dt-bindings: media: mediatek: mdp3: merge the
 indentical RDMA under display
Message-ID: <169877490486.1809532.9023561200743242448.robh@kernel.org>
References: <20231031083357.13775-1-moudy.ho@mediatek.com>
 <20231031083357.13775-3-moudy.ho@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231031083357.13775-3-moudy.ho@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231031_105512_941893_E9A49612 
X-CRM114-Status: GOOD (  12.93  )
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


On Tue, 31 Oct 2023 16:33:43 +0800, Moudy Ho wrote:
> To simplify maintenance and avoid branches, the identical component
> should be merged and placed in the path belonging to the MDP
> (from display/* to media/*).
> 
> In addition, currently only MDP utilizes RDMA through CMDQ, and the
> necessary properties for "mediatek,gce-events", and "mboxes" have been
> set up for this purpose.
> Within DISP, it directly receives component interrupt signals.
> 
> Signed-off-by: Moudy Ho <moudy.ho@mediatek.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  .../display/mediatek/mediatek,mdp-rdma.yaml   | 88 -------------------
>  .../bindings/media/mediatek,mdp3-rdma.yaml    | 42 ++++++++-
>  2 files changed, 38 insertions(+), 92 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,mdp-rdma.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>


