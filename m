Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93ADA1067058
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Mar 2026 15:43:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a0FWnXZcfmBjSJmvownu5+w9xLPXUji+K3un2IYyipc=; b=ZQLpz9sSPLA4QuS/umjqrKVEMS
	d8CngY+DK1RUF/aMIo9BZuz5TF9ux9f/bbVQfHrxHGMOdSro8B/AHjNe0rt67FVyjaJwa6rlg5S5g
	6r1uHmT8488B71mnBLd+J45wVq8rJ8FEvbJX4KBT13DDvVZtn2l3wb9EStH4VsDam5ga8LouCjcUY
	LMI8SPK9QPwsIXEJDBqPYAOhS+WQLXh8TH/T9ek00EBo0rRlZvNSSTXco17BaUqgH4Sp8sIC5x5St
	MqQDcoL+FQdmGo920DaeRFHAxyLLrf6aXGf/Ol7nxCQXTve4vygB9JQPckBN62ISP/hay5uEIOsOK
	+aX5oaYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0iBv-0000000EQAL-0AVz;
	Thu, 12 Mar 2026 15:43:15 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0iBs-0000000EQ9C-2l0L
	for linux-mediatek@lists.infradead.org;
	Thu, 12 Mar 2026 15:43:13 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-439c944bb62so948995f8f.3
        for <linux-mediatek@lists.infradead.org>; Thu, 12 Mar 2026 08:43:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773330190; x=1773934990; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a0FWnXZcfmBjSJmvownu5+w9xLPXUji+K3un2IYyipc=;
        b=WqATUtLVQJHGjmOpUMxoX5ejEvKHmrDYe0rUY9zeWNIl1Nwl1fmB3BN8XX+Q5R2RDx
         4Kl1kG3lbFVa+tAio/sMTKbtsujfOeTL0nF7R9GtGUtOMpc/L2JUM1xfBkGPHtcXyw8q
         Oc5/qC+Hv+sSnZQdMiKUGsNWXm5geMdpXcZpTDNjufqxE/cOQReqVVHkDyJNq2aFWYF4
         pCBO2rhvGm0DFW/6C2szsikff2PG+0xTIB6zOTALr3VnVDwYU3qZ/bs/sVyBzsSGKjBt
         FtyCN3gvQjbtpYkyp5DD7tK3wF0TtVBMn/vfFRw+zB61SPcGnkKquZbAUDSlYLj8wSB8
         gAvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773330190; x=1773934990;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=a0FWnXZcfmBjSJmvownu5+w9xLPXUji+K3un2IYyipc=;
        b=fbwy19PjPuZtHiW8CUwx10HD61DWhIa5Ae4u/FX/6zmmJ5jJop7iesQ+hvJIwFI7nR
         dmubqumAYn1Jx7IeHv2EwGOo1cpig0HshXMmEcIMRcu3xxJeJfmniQprHfWPmqlhSUPz
         iKe0p0Ktl+uk8JSv+oIhj+A3Fd6EGNgBdnlH6Nr7i34JguMHwSYIBjcrsMO1thKg7UAa
         RxFfM92OssPfYevKVrGhvMsRfhdzNicEqBtX16105HocX46u43tWpHs8iJjp6SKyWOLR
         ZzXTiUHK1kcnugqUCJ1zxWaqJapq64oWhN/vQzBSyb/DjTUIO1TocRe6Ftf5GoHvrtLJ
         vs2g==
X-Forwarded-Encrypted: i=1; AJvYcCX0wsQh6e0aRERrCN6yvXTRoi+dO1JT8Zw7fePWclWoA9qHuTYICHj4v2rgV7NlsOTQQivQ5SFgLUGeN/JLVA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxLNieVXKqFE1M4UNVMnH4zVkuIbTphkzTwEJAuqvGXguGGpAF4
	aQPDwPpA00IuXjZqD47eTv3YFRdtaWyle6yiCesBS2EX/xVleSq6e/U5
X-Gm-Gg: ATEYQzxxcEykv6QKCUeo93ZUpwxZgamtv5szvQkc0iPIS/Zs+F/BY4XJcfskJ9CDhVZ
	HDKmJt2fIZBLfTVozOfz+6oEPszhhZORzG48fW+chXLMDsolYJ1QiBk7UoRr+NeQAkSvtWMJnV3
	xPANep+wSU/q4zwRbAODI84q2vU5PsBvJAWfSEHTS17C4pC4jX0TzyA6Z9iec/qLXpcyrQv2hGp
	sj6SN9dohp5BNyclOCyOz/XCoPZ/KHtGT+jALqtAN4r7xpCyTR4KUNGDc1vNy+TqU/3N5UJLXMZ
	2dvh7W5tNke8+8FFugCl8U/AIGQwLiap0TjeTWb0eOERj+JlOinJI/eK5t8IPvg9+DeK0kQ66Yu
	/lhtBTm12qGN8+zDXX1X2UndE8J3lGVtxzZJzZQxSg9+DRWPnvXMSC+vuMihJJFHPNOCIi6jhZg
	junzaWJbetTZ7GzVDWqTTd57hWt+w1JcD+deWCAsN6WzU6+kKZ3Vcgq1aStdENDcx+CTxfXIRYv
	BSF6g==
X-Received: by 2002:a5d:5e01:0:b0:439:be67:a034 with SMTP id ffacd0b85a97d-43a04dc0c3fmr244402f8f.47.1773330189741;
        Thu, 12 Mar 2026 08:43:09 -0700 (PDT)
Received: from jernej-laptop.localnet (86-58-12-163.dynamic.telemach.net. [86.58.12.163])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43a03cfd18fsm2132231f8f.36.2026.03.12.08.43.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2026 08:43:09 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej@kernel.org>,
 Samuel Holland <samuel@sholland.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Chen-Yu Tsai <wenst@chromium.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>, linux-sunxi@lists.linux.dev,
 Paul Kocialkowski <paulk@sys-base.io>, linux-mediatek@lists.infradead.org,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 4/4] drm/sun4i: Use backend/mixer as dedicated DMA device
Date: Thu, 12 Mar 2026 16:43:07 +0100
Message-ID: <2820906.mvXUDI8C0e@jernej-laptop>
In-Reply-To: <20260311094929.3393338-5-wenst@chromium.org>
References: <20260311094929.3393338-1-wenst@chromium.org>
 <20260311094929.3393338-5-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260312_084312_701709_56598A30 
X-CRM114-Status: GOOD (  14.08  )
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

Dne sreda, 11. marec 2026 ob 10:49:28 Srednjeevropski standardni =C4=8Das j=
e Chen-Yu Tsai napisal(a):
> The sun4i DRM driver deals with DMA constraints in a peculiar way.
> Instead of using the actual DMA device in various helpers, it justs
> reconfigures the DMA constraints of the virtual display device using
> the DMA device's device tree node by calling of_dma_configure().
>=20
> Turns out of_dma_configure() should only be called from bus code.
> Lately this also triggers a big warning through of_iommu_configure()
> and ultimately __iommu_probe_device():
>=20
>     late IOMMU probe at driver bind, something fishy here!
>=20
> Now that the GEM DMA helpers have proper support for allocating
> and mapping buffers with a dedicated DMA device, switch over to
> it as the proper solution.
>=20
> The mixer change was tested on a Pine H64 model B. The backend change
> was only compile tested. Though I don't expect any issues, help testing
> on an older device would be appreciated.
>=20
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>

Thanks for fixing this!

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej



