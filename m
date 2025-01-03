Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B16FE77188
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Jan 2025 05:59:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sFlWSYAVuSson+OhthOc5MObp0JO2PaKlR/7cwxtKLk=; b=LqCQqoOapeu+mvV5k7c9tST2YC
	HcXnwcgPtqm67xe3X4Zw1w85gTRw6XyTHDknJR6B/WKs5A70/q0uLwClgDEMzJfcy9KPnYtIetfMA
	ulTKgjPofho3qM6JsXz6Dhr9s57biRq4C09s+xNBmItx27YTRWW3+FWeEap2AuGBYO4gvQo39f+Tk
	cTEmN7aIMr60sPOQ8JFB3+usOUcC08l/5ajFZ/URTHvks7BkCZjneUqYYD07lhOAWXnPyUb45WqKf
	Fw4Xs5m5th3XI/Tkhp83B4DdpBoEnloNUVsrCbGZNM8XYDI/FqQhnMRQlY9d2qYTrw8OyTobrpmaI
	jwZY9H9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTai7-0000000C9nY-2WfC;
	Fri, 03 Jan 2025 05:59:03 +0000
Received: from mail-lj1-x231.google.com ([2a00:1450:4864:20::231])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tTai4-0000000C9mN-2mBn
	for linux-mediatek@lists.infradead.org;
	Fri, 03 Jan 2025 05:59:02 +0000
Received: by mail-lj1-x231.google.com with SMTP id 38308e7fff4ca-3022484d4e4so149001441fa.1
        for <linux-mediatek@lists.infradead.org>; Thu, 02 Jan 2025 21:58:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735883938; x=1736488738; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=sFlWSYAVuSson+OhthOc5MObp0JO2PaKlR/7cwxtKLk=;
        b=lJOCF4getyLfCTeb7T9gis1JfTlyqANzE85LuaJJDjqnhHKEfFUXaBl1pOx5+IbRaJ
         WSqfIche3gDO6hCmbpiqvFnUlNhDfvd0kGOThC5LwT6ny2gKBtAhE61MO+wF1+rtiUYI
         901Ozh5JDaLzwB8MmM0CsIOxsK+DOa+2qod6BTSBAORj0cuJuKMWQLuSQXe2wpeQB3Yg
         1o+hmCEU//PxONurY6juhbXJjqrZhCGKL5IJ55Pxz5mN+b3noKKCoqEZblL535LRj0LU
         Yn+9JuQsnp6K6WjQui2ZsyDshsjlwKKioUs1/xn0i9EdK/PMIEWWcniY8Rq8kcb5X2V1
         m88g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735883938; x=1736488738;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sFlWSYAVuSson+OhthOc5MObp0JO2PaKlR/7cwxtKLk=;
        b=OWchaspyLTvsCHbyuQLmik2oYdnn7HavzE2n0T1j+ItvJLXpNjNQJwz0ZHAP90ByxZ
         o/ngw7cSCbPOW6iO/B3VzkDQstF7VO8KisxjrYP67M2O99An41imb3boLdKUi60UtVUR
         O2v7wINxuiGFNEWSby3CXSgn4pudzfQ+SjV08h8D9dUa7bc0xkUmUkeE+lhJJSkGtmfj
         wW3NiciKinRKJjl6hekpbg/IMLQs7RiD6+W3DaaRUD+vg3RA2QRI4wJMd8ITdf646FCO
         tyb1vuy9lAPqonH2RDbyd1AA1dLkKLAtDYkSnTgezVefuP74kEiLFx9NqJyRCIIUQyNn
         Cfmg==
X-Forwarded-Encrypted: i=1; AJvYcCWGpiKcyoMwGD9fTpuR01fqMkRt+FonoalmyB7zd8MYpm3M1bDnPZvTS+2CJXEGHeAx72hUNsBSJXajdyfzjA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwKuDd5pZw4NprrfHof9xgCbmwaGI9x9SKvKed4dukzKYcn7XhB
	WeuCsOprX2GA+iYSXMxHSKvjVinPJ3XP+NfVxpNbN3JCSOq42YpVMsIFZiLinEA=
X-Gm-Gg: ASbGncsjfcCX42tuqEoccxIGR1O0NeNWRpIyM6Uv6BMmFWVgq6AXTNz/b6tYVk2MVyW
	L3KSQk8If49OIigIXte633XfIzMlTdXnBAdRcnZmZUSA3ZTo4cNCGNFT8Lj22EA8xJI6GX06oz6
	T430aItb24tkXlev9khmc/yqlszOa0Lys+CHFOIpN5DEejKhBmL5sARbrg+PY78AtBUc7FTDjjP
	CUSopETcH1UJ+eUGmqKERJfdLPBPe0V1byoLn7dl+B2ogwtqh9IyZcEqDP0nbssRIt9aWwndGrK
	JkWxYzxCWjgPxuHW2jd0nCfueKY1AZZ3qEqb
X-Google-Smtp-Source: AGHT+IE6y4JdTtlzcbrnGGg7v7FjSgwU7e/vWxQ7TgNE5uhhWt7BpBzFop0XHrbVtbgwiv0CXbLJOQ==
X-Received: by 2002:a2e:bc1a:0:b0:302:3a46:10a7 with SMTP id 38308e7fff4ca-3046851f9cemr129431821fa.5.1735883938405;
        Thu, 02 Jan 2025 21:58:58 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3049ec4ca6bsm26165151fa.56.2025.01.02.21.58.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jan 2025 21:58:57 -0800 (PST)
Date: Fri, 3 Jan 2025 07:58:54 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Vignesh Raman <vignesh.raman@collabora.com>
Cc: dri-devel@lists.freedesktop.org, daniels@collabora.com, 
	helen.koike@collabora.com, airlied@gmail.com, daniel@ffwll.ch, robdclark@gmail.com, 
	guilherme.gallo@collabora.com, sergi.blanch.torne@collabora.com, 
	linux-mediatek@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, amd-gfx@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
	intel-gfx@lists.freedesktop.org, virtualization@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] drm/ci: uprev IGT
Message-ID: <dj2r22upxnj2aicjnsvoqnhd4n73tyfgm36jtvixxp4vphocev@gggcjakm3xge>
References: <20241217160655.2371138-1-vignesh.raman@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241217160655.2371138-1-vignesh.raman@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250102_215900_709303_A5428BED 
X-CRM114-Status: GOOD (  10.49  )
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

On Tue, Dec 17, 2024 at 09:36:52PM +0530, Vignesh Raman wrote:
> Uprev IGT to the latest version and update expectation files.
> 
> Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
> ---
> 
> v1:
>   - Pipeline link - https://gitlab.freedesktop.org/vigneshraman/linux/-/pipelines/1327810
>     Will update the flake bug report link after v1 is reviewed.
> 
> v2:
>   - Pipeline link - https://gitlab.freedesktop.org/vigneshraman/linux/-/pipelines/1331363
>     Updated flake test bug report links.
> 

What is the current state of this patch? It would have been really nice
to get it in, we have patches depending on updated IGT.

-- 
With best wishes
Dmitry

