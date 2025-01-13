Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A92CE7719F
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Jan 2025 08:25:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HsOOejTFjVwFwvDCfWyTG69OVT7YoO10LJVJy5N++GA=; b=N8Hi4JNdtv8dhav/HcpgrAegvp
	lXLd42Y3X2KmZTRg6VC7howrYF9RzsiMrp0C0fV3rVmGwE0xEkHmVbn1ZKbiCiS2lnd+wOrvtHBhz
	EI1h7iLcNhW60EAFVbnmfmQ0uVkdQreRDrdDwvHNeDeh+g1JKqA2oa0VYnZMm0y1U6OhFiGNCMwMi
	yqQfyDbCdx7kBpG/IAz7QPXnaI91gZunfnW4qz1FPJr6fATOtGzhLtcQMT3yRZMVgnYNANd0Dr+S/
	vaZZFZ4jL03J/ONOTpjxy63Mt4dQxRSxOx3vtlK4bvPu4vP87VrrwlieJ7Thoomq/ixLscl5kgE1I
	9/a2vq9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXFlS-00000004NkC-1lEj;
	Mon, 13 Jan 2025 08:25:38 +0000
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXFl5-00000004NhG-0OEx
	for linux-mediatek@lists.infradead.org;
	Mon, 13 Jan 2025 08:25:16 +0000
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-53e3778bffdso4126235e87.0
        for <linux-mediatek@lists.infradead.org>; Mon, 13 Jan 2025 00:25:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736756713; x=1737361513; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=HsOOejTFjVwFwvDCfWyTG69OVT7YoO10LJVJy5N++GA=;
        b=JdasuRrxU5aoyca1Kt9h7UjGSocVPFpkcHWb3A/mJI5NmSKLjPhtN9VFJXr5Ur5a8a
         M7MZNqWVXfeajyTgYlsEITGvqCQO/zuKfHiQqcf4WYkeqxxMaiaTgMExBeLBXcXyjS19
         Q+2AIJfBTjSNkzNMBx22l25zhX6qKv5C/+u1MD63yHe6MdtngmSo6TKSJdiQvIxXOA19
         XuvymAUlCldjsvtlcvcyzln76rinhCd2QRmBhbU00KILBvP/NW0EgBkOZyBIJ+J0qCtt
         dpOlhHxVHq6cz/bo+m+mxtMtbakWk7yadRRn5vrXRtlAOyLTOXw9jYTc/E/prHxpef5N
         oJrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736756713; x=1737361513;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HsOOejTFjVwFwvDCfWyTG69OVT7YoO10LJVJy5N++GA=;
        b=QNpAbIT2GQpw1CHEBYxql6xTzuov+N1KIbCu1+5vt7XAPZcPfoMLbTWRnUFP26lN4P
         DVYPHcgYXKABSj6XgtPRqEjBfF5s9SCAHnl7DqC1oJtB9VRCqcfIhFcDniX8EKXtvhDX
         LOg8SjWDCSUNHdQMmA3ip5QrJ+eltqm204IDZKQen6FPBJEHMj6Acdex7A+ivA1Fxns7
         jvrxD6uEOA3l3xFQb6nCjezLQddVUx83HY0n32uM9KIEpmUxwswmuRZlU/cDP0xtBQin
         Eq3NhKRS76IjEAO1HC/os/2DAiqvGtsmTKu0STbiAOC42sdmCPU0SNw8iYXQ55BPmZjc
         5KqA==
X-Forwarded-Encrypted: i=1; AJvYcCUngpobWsK1/0pG9q/9uQTwyp2HJc8kcZ5fU9OUTDHkLCVQsrf/VQ1fpQRFx6B3JujX58ee509cH89x0rxrjg==@lists.infradead.org
X-Gm-Message-State: AOJu0YyjSQSL2gnI1IUMmnDbqfMQsiOMvNfMrgldpplSm+OJ858mo/Zu
	FkKNbvqUBLtXt6k+ENL6BkTCGEUyDNE2v+Q1iYJp4hf9bdzE0Jk4Maf+F9jwwdc=
X-Gm-Gg: ASbGncvcjI3fWY0lSc8x18yuH4LnM9tocH50BoGvRYz0npBTs9abx7wbB/cjLB0HsY8
	XiPHCr6VcXjzsKUYhSlik1HiTq2lw41R007d9PRnC9EoAL3t+mWb3cTJpvi3eGcdLGJbgzqKhm4
	qSJQpB1c8pxYgk9Vvd26OFCG/VE3IUzUQdPwDOVKOP+qA8A/t5ozZoIHqVcfLhxLE2HMuGMYyOd
	PwVAkt464jFfU5FoUnHKTqlR6arf+q2askmRxRHXBrkHqJy62IpsTkHyxY7UqRk9NkDaFwVZlzG
	0HyBqRcT4lEKjdghg50wxQfTNPYBe4JxAoer
X-Google-Smtp-Source: AGHT+IERZWZtkZrsbkHThnFiBHKfz//tsYW/urMLTgJODZNi9Tp473Grr1NqQ4M0NySCRCOoV5n3Rw==
X-Received: by 2002:a05:6512:138c:b0:540:2188:763c with SMTP id 2adb3069b0e04-542845b0b55mr6338144e87.37.1736756712614;
        Mon, 13 Jan 2025 00:25:12 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5428bec0659sm1286326e87.185.2025.01.13.00.25.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jan 2025 00:25:11 -0800 (PST)
Date: Mon, 13 Jan 2025 10:25:09 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
	airlied@gmail.com, simona@ffwll.ch, dri-devel@lists.freedesktop.org, 
	linux-mediatek@lists.infradead.org, freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
	imx@lists.linux.dev, linux-samsung-soc@vger.kernel.org, nouveau@lists.freedesktop.org, 
	virtualization@lists.linux.dev, spice-devel@lists.freedesktop.org, 
	linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, linux-tegra@vger.kernel.org, 
	intel-xe@lists.freedesktop.org, xen-devel@lists.xenproject.org, Rob Clark <robdclark@gmail.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>
Subject: Re: [PATCH v2 13/25] drm/msm: Compute dumb-buffer sizes with
 drm_mode_size_dumb()
Message-ID: <bbw2n4ccn5jlq7q7lsw3xdnbieazgexkwkycrqvk5aoiq5q3wx@nz6gd3unwkg4>
References: <20250109150310.219442-1-tzimmermann@suse.de>
 <20250109150310.219442-14-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250109150310.219442-14-tzimmermann@suse.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250113_002515_149689_C450C2C3 
X-CRM114-Status: GOOD (  11.92  )
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

On Thu, Jan 09, 2025 at 03:57:07PM +0100, Thomas Zimmermann wrote:
> Call drm_mode_size_dumb() to compute dumb-buffer scanline pitch and
> buffer size. The hardware requires the scnaline pitch to be a multiple
> of 32 pixels. Therefore compute the byte size of 32 pixels in the given
> color mode and align the pitch accordingly.

- scanline, not scnaline
- the statement about 32-pixel alignment needs an explanation that it is
  being currently handled by align_pitch().

With that in mind:

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Rob Clark <robdclark@gmail.com>
> Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Cc: Sean Paul <sean@poorly.run>
> Cc: Marijn Suijten <marijn.suijten@somainline.org>
> ---
>  drivers/gpu/drm/msm/msm_gem.c | 27 +++++++++++++++++++++++++--
>  1 file changed, 25 insertions(+), 2 deletions(-)
> 

-- 
With best wishes
Dmitry

