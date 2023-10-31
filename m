Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EF34C4167D
	for <linux-mediatek@archiver.kernel.org>; Tue, 31 Oct 2023 17:55:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cghi8HzRqMQtZYMVfq+8g/GwoACch6SchmkRjnW1zRM=; b=eFKi6l78TpHBcNK6pxquzYYA6o
	IgGsQ+41q3LSHaqkcQAkdFiX3yGD32XwhYXErmmeHEB43E6+8R3LV/tyNQtvSWXBHEaJADqb6/erg
	SJXhYgmmcIxdg7ieY1BaPri+eQsESsnW6TzvI2HpaOYLj4+0TD2oQZVkrZeK2sAOhJgIcMZFRjiZM
	yfaxvCf+bS0WOZSjVHRi28tN5Zk/5FFQw+KoHU33YNGfxIYqTttpnNnGW++MhTfns4IP163tpbpM8
	eGCJXkthu90+H+cbbzxec8pGPe706gJPkt7mG2gPrFsiaZEtNRrq//D4W2jO9jrdz60LS2wkGSZK1
	kuqlaAjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qxsxg-005tpr-0U;
	Tue, 31 Oct 2023 17:55:32 +0000
Received: from mail-oi1-f173.google.com ([209.85.167.173])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qxsxd-005tp8-0S;
	Tue, 31 Oct 2023 17:55:30 +0000
Received: by mail-oi1-f173.google.com with SMTP id 5614622812f47-3b2e72fe47fso3861085b6e.1;
        Tue, 31 Oct 2023 10:55:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698774928; x=1699379728;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cghi8HzRqMQtZYMVfq+8g/GwoACch6SchmkRjnW1zRM=;
        b=kAiGnIuanzBOJjZSzAc6GurB0asUnAgNv2JOP9biHNBVAGrc93Y+NN5ZYJl9Oeib/H
         O0jEjXHBgrmLFmSpzNuwzJo/2adusePfyMoDeEsly4YBMLXtb2wprhQQh07aDnX3E2it
         oNvcKhD1IEvJ3Ln5UuNKrAbFhXPLzNh1jmzFN2/pM2p4IILTSZumAvvyhz3CMsmm7GBr
         ULvc7zi4XTBp+AHh9gVrofnEw/GyvmNGCmxVkfsd8K/kNlIO96VEuJ4CRGthcbXIJ8mn
         dDgraQwnHCSkBvHZ9dXQFs3dZpyY01R6wEEmDjaT60XMBwcKhvBuY0VenMJrLh/brqTn
         2Aww==
X-Gm-Message-State: AOJu0Yz+S6RrTptnjcJud8vB+pFzZBY0tSckYQHVg2wk3Mz9xsthu5kC
	tKgslGy/h3hpA9RLrJwxmA==
X-Google-Smtp-Source: AGHT+IEzgDoWb29ZJLyxAQR/UtzwH60FOikEPz4ULoPEiWOeX2qzVl3h09iHl3uA/9qvyP/m3aTQpw==
X-Received: by 2002:aca:d03:0:b0:3ae:126b:8bfc with SMTP id 3-20020aca0d03000000b003ae126b8bfcmr13403099oin.4.1698774928201;
        Tue, 31 Oct 2023 10:55:28 -0700 (PDT)
Received: from herring.priv ([4.31.143.193])
        by smtp.gmail.com with ESMTPSA id z3-20020a056808048300b003b2e7231faasm328109oid.28.2023.10.31.10.55.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Oct 2023 10:55:27 -0700 (PDT)
Received: (nullmailer pid 1810151 invoked by uid 1000);
	Tue, 31 Oct 2023 17:55:26 -0000
Date: Tue, 31 Oct 2023 12:55:26 -0500
From: Rob Herring <robh@kernel.org>
To: Moudy Ho <moudy.ho@mediatek.com>
Cc: Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, linux-arm-kernel@lists.infradead.org, Maxime Ripard <mripard@kernel.org>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-kernel@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, Matthias Brugger <matthias.bgg@gmail.com>, devicetree@vger.kernel.org, Daniel Vetter <daniel@ffwll.ch>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, David Airlie <airlied@gmail.com>, linux-media@vger.kernel.org, linux-mediatek@lists.infradead.org, Rob Herring <robh+dt@kernel.org>, dri-devel@lists.freedesktop.org, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>
Subject: Re: [PATCH v9 03/16] dt-bindings: media: mediatek: mdp3: add config
 for MT8195 RDMA
Message-ID: <169877492598.1810050.14443640728512842209.robh@kernel.org>
References: <20231031083357.13775-1-moudy.ho@mediatek.com>
 <20231031083357.13775-4-moudy.ho@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231031083357.13775-4-moudy.ho@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231031_105529_177531_56893346 
X-CRM114-Status: GOOD (  10.07  )
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


On Tue, 31 Oct 2023 16:33:44 +0800, Moudy Ho wrote:
> Added the configuration for MT8195 RDMA. In comparison to MT8183, it
> no longer shares SRAM with RSZ, and there are now preconfigured 5 mbox.
> 
> Signed-off-by: Moudy Ho <moudy.ho@mediatek.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  .../bindings/media/mediatek,mdp3-rdma.yaml    | 21 +++++++++++++++++++
>  1 file changed, 21 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>


