Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC6AFC7EE2A
	for <linux-mediatek@archiver.kernel.org>; Mon, 22 May 2023 20:16:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bBzsEFEBaOoamjuMu6tkFnCdq33AsZWodYlngR5umYI=; b=vflUjevqqU+sRJ+L6wuWBkK0pO
	dCWNywujJ4OyKZo0svdASrcgspOGoHjeh6uDmLR+JsPJWegu5fIde/ANLA9T11zvU5Pd7xXe2Oi0G
	0uIRVF017tyt6TJa5qC6dTNmJ8D+dEJgJ6l+z2XKdsARhjiEZ2aHwvoP/XJD5zBgof7ZeibCigBgF
	A1RUHkPPn1BgZqlAgqZlumb06iyiRkLE879xLFezrwjVsxvo6XTjRiruQUb0OW8OU5G6MtQ+6fhaA
	mfU/W06hgr6kYKluV7dCiNfDqzizlDzHpC+8UAkn39jrce+1NajaKRSxetZr1pFOVrc3B4l7eqADV
	OWhybnlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q1Bx3-007sSj-2O;
	Mon, 22 May 2023 20:16:17 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q1Bx0-007sQ8-0r
	for linux-mediatek@lists.infradead.org;
	Mon, 22 May 2023 20:16:16 +0000
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-64d2b42a8f9so3496753b3a.3
        for <linux-mediatek@lists.infradead.org>; Mon, 22 May 2023 13:16:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1684786573; x=1687378573;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=bBzsEFEBaOoamjuMu6tkFnCdq33AsZWodYlngR5umYI=;
        b=NQpIylAo879lZg+bIGPMAEf7DDZr1HUjRDRjXgFFzOZAqJismdNG2vT6fvEGnxixbE
         AO59fHineVN3ZV8SGUip2kK2YNl7yCMhINlOucn3D9rFDYquHDJDjZqxyorrI6Aa1PG3
         dgDmEFNb5d5Gy4SPsHORvJXWSanJ+OBQLiiBo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684786573; x=1687378573;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bBzsEFEBaOoamjuMu6tkFnCdq33AsZWodYlngR5umYI=;
        b=WmNvTMxeJ4I63XihExiio/GySypDQz8imnTklD+ZdROnifh5E7fsdW7uTi7/npYMEA
         GDIMnal/LBHBcuDq0FWTDft/AfN0yRBzClIJMgHhF+eNve8OUgf5r1F8518NEorfW54r
         nKrjzrGaAtIaGJGa+92lBPagG1RfsbkUEKQPBw/BQE9ELC8g80nqgBHRDp3a0aW7rxVM
         0DORs8+McxnQFr2iDICIit0pzB6NfjJUuRdzLUpPwh+Nljzmc7j4KMZz9uHQr76OfpxX
         pGN1EQPH0ynKbLUaAnsGRQUJzOnTrheBDHLsOe3lEcyh4ii4MSj53uhfIHucZZIrx3vg
         3P7A==
X-Gm-Message-State: AC+VfDxkqTYK85a232hXrZpISBAP1DoOjVKzEdS/Un5C6pWBYyanKrat
	tOPc8BWEXUY/YXZuIjOf1TEa3g==
X-Google-Smtp-Source: ACHHUZ5ATfKSsDeoySmt4TpoCC/s6QT9JMih/7kH5QlewrwQzwJyKfURuuEBVyEFMexNU1NyLHmTzg==
X-Received: by 2002:a05:6a00:a20:b0:64a:4bfa:6b8d with SMTP id p32-20020a056a000a2000b0064a4bfa6b8dmr16642693pfh.6.1684786572799;
        Mon, 22 May 2023 13:16:12 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id d26-20020aa7869a000000b00640ddad2e0dsm4512884pfo.47.2023.05.22.13.16.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 May 2023 13:16:12 -0700 (PDT)
Date: Mon, 22 May 2023 13:16:11 -0700
From: Kees Cook <keescook@chromium.org>
To: Azeem Shaikh <azeemshaikh38@gmail.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-hardening@vger.kernel.org, dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] drm/mediatek: Replace all non-returning strlcpy with
 strscpy
Message-ID: <202305221316.5C8770098@keescook>
References: <20230522155306.2336889-1-azeemshaikh38@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230522155306.2336889-1-azeemshaikh38@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230522_131614_303175_25C7160A 
X-CRM114-Status: GOOD (  10.97  )
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

On Mon, May 22, 2023 at 03:53:06PM +0000, Azeem Shaikh wrote:
> strlcpy() reads the entire source buffer first.
> This read may exceed the destination size limit.
> This is both inefficient and can lead to linear read
> overflows if a source string is not NUL-terminated [1].
> In an effort to remove strlcpy() completely [2], replace
> strlcpy() here with strscpy().
> No return values were used, so direct replacement is safe.
> 
> [1] https://www.kernel.org/doc/html/latest/process/deprecated.html#strlcpy
> [2] https://github.com/KSPP/linux/issues/89
> 
> Signed-off-by: Azeem Shaikh <azeemshaikh38@gmail.com>

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook

