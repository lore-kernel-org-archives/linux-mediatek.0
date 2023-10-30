Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36D08C4167B
	for <linux-mediatek@archiver.kernel.org>; Mon, 30 Oct 2023 19:26:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iMNn8gw95Mi9aB89F2PItspCe/uKw0JKgKBsspi+cN0=; b=wqhznwSipC5FiccC1NrV+SbKf+
	gxUJRon/zcumsxoAtNJFUS5Hlc/H9/qIzpWsvDlStW7XWs0MTTw9AEu2lpzSEl/GogZrICBv/n2eG
	RDpk78fmUh5N8U+y18LdhDDEPqI3jnNGPJmsqBNYAMb0dHg2s7yaHmbMBCV47J2Xk2v1KbJDlF+dA
	AMzv0Q97m/I5D71341aiMGOzOcZAh8WagKdmntefXjBCI9oShH2YiywBeAgD3+C9Znn7g4xojiU4P
	FhPktQkvQ4MLm19r6VFwrqnIt6/PEwjgEMLXHsQGf+9RhbPoYeqpti2jZDABaEGZolJ/7zNsiW6ix
	Q6NJ+RcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qxXuc-003vQ9-13;
	Mon, 30 Oct 2023 19:26:58 +0000
Received: from mail-oa1-f48.google.com ([209.85.160.48])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qxXuZ-003vPL-22;
	Mon, 30 Oct 2023 19:26:56 +0000
Received: by mail-oa1-f48.google.com with SMTP id 586e51a60fabf-1e9c42fc0c9so2103434fac.1;
        Mon, 30 Oct 2023 12:26:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698694013; x=1699298813;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iMNn8gw95Mi9aB89F2PItspCe/uKw0JKgKBsspi+cN0=;
        b=KCJJU7/waFsVubpn2G/V/ZqrcC4ECHFInh++jd69eGAL4kLiOyY92mB6tZ657gECuN
         Q2r2dakEawHjx92jKAST2KQEnkgG53l78AQJyHAVaA0iWPMup5T3ED3u1g5jHWLmB1xM
         3a0jx3L2oNoWXKXJHWsSpWkg0ym6XKGLI8tshcqwshba8kHvv5XNiVf6hzmU9cGAuaS1
         FHmCA16pmMJ4dPOMXyAGOEJ2wbizKDjGSu1AD1KaF5GzW8kWyS/n/1RiI2TkI8asTFDI
         rzmO3CM3NRuXF1CI6yENA4Rtk+5Sj6XnGhsUZE592wwoYBgCbidUM6slm3CZdnazSPsz
         S+IQ==
X-Gm-Message-State: AOJu0YxfnaTjvad1j/4yh9z7U+2HBwzvAmWdfGz4lr5vafkMoYLQB02p
	Njk96XNV80bAYZUM6Wa0qQ==
X-Google-Smtp-Source: AGHT+IFqVwsmxx+ch82fJSmqPqoTwRaa9+WOEzKyddP42zM17GUxUkOuZQ+88pjFz/wQkY8Sp+ZVPw==
X-Received: by 2002:a05:6870:d8c8:b0:1ea:ce71:dd13 with SMTP id of8-20020a056870d8c800b001eace71dd13mr10661464oac.28.1698694013252;
        Mon, 30 Oct 2023 12:26:53 -0700 (PDT)
Received: from herring.priv ([2607:fb91:e6c7:c3eb:a6fd:69b4:aba3:6929])
        by smtp.gmail.com with ESMTPSA id bh9-20020a056871948900b001cc9bc7b569sm1702946oac.27.2023.10.30.12.26.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Oct 2023 12:26:52 -0700 (PDT)
Received: (nullmailer pid 1994506 invoked by uid 1000);
	Mon, 30 Oct 2023 19:26:50 -0000
Date: Mon, 30 Oct 2023 14:26:50 -0500
From: Rob Herring <robh@kernel.org>
To: Moudy Ho <moudy.ho@mediatek.com>
Cc: David Airlie <airlied@gmail.com>, Maxime Ripard <mripard@kernel.org>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Chun-Kuang Hu <chunkuang.hu@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Daniel Vetter <daniel@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>, Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, linux-mediatek@lists.infradead.org, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Philipp Zabel <p.zabel@pengutronix.de>, devicetree@vger.kernel.org, linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v8 16/16] dt-bindings: display: mediatek: padding: add
 compatible for MT8195
Message-ID: <169869400953.1994265.3434527810955780048.robh@kernel.org>
References: <20231030100022.9262-1-moudy.ho@mediatek.com>
 <20231030100022.9262-17-moudy.ho@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231030100022.9262-17-moudy.ho@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231030_122655_669069_F248706F 
X-CRM114-Status: GOOD (  12.59  )
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


On Mon, 30 Oct 2023 18:00:22 +0800, Moudy Ho wrote:
> Add a compatible string for the PADDING block in MediaTek MT8195 that
> is controlled by MDP3.
> 
> Signed-off-by: Moudy Ho <moudy.ho@mediatek.com>
> ---
>  .../bindings/display/mediatek/mediatek,padding.yaml           | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 

Acked-by: Rob Herring <robh@kernel.org>


