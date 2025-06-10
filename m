Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7E17C5B552
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Jun 2025 03:53:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nZk/7/4MvcJfckdyvA+r+JfqYVWkeTH5dDDkcVRzYjI=; b=sqz1+2+eH9YuAh
	T1J1Gqf7T3epQJIYUZ2YQawnN0OjJWAy9BgtrexE3JZsjy1QSSp+11o+Y/Cs7LflIxXXPegFLiI27
	QC7uABXFFVz+gHn/fgLpnPAF4DvcPK4F9yg5jNoZNXqJLWbZ4OCEZRmwudTYIHJpTLBfymJaNTh5G
	rWMWM7M0sA8zZ+gb3c32UXAoViyIB6r2ahvkxdVyijwLI9wuzP8z+/n0HfGQbHOQ8krjdyZFHXXCy
	6kfqme/gT6hXH9gMR3CTU/TaB472nwXFg3cWFUUt8XWRY3wZ/Joe7LYdakLPDjtlo1CRRykWjXzmz
	P/DFqHrreduPlMWQTtjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOq3c-00000005iMu-3Kyc;
	Tue, 10 Jun 2025 03:53:52 +0000
Received: from mail-lf1-f52.google.com ([209.85.167.52])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOq3a-00000005iMQ-0zaD;
	Tue, 10 Jun 2025 03:53:51 +0000
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-55324062ea8so6505066e87.3;
        Mon, 09 Jun 2025 20:53:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749527628; x=1750132428;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nZk/7/4MvcJfckdyvA+r+JfqYVWkeTH5dDDkcVRzYjI=;
        b=NvVoQXEEHUqQgLCqad6iDOB2ey1PnDXVYvVBgkk1Ejg388ml+6oI9yd9CYcYlJ7Ink
         rEvNLk8rOE/Yb6MhCgAdUlr9nyt5UY75+g43wyC8KX7YkjB1XAnwZxy6cDF+Aajnz0iZ
         GyF56h/+b+CB+jhMDkYqmqOSXfkq9d+lR7I27Jl9UqCoj5AH7cM1LEdMkAJ71DKvOL0/
         fW9L7ueJsFgKKUD6izPPK/jkq3J3dM27wpNosiWy+ZU5o4jXpe/icvbun+XzZU5ilIuF
         JciY4CFP9e/JCV0VVNc0B82zQUcpaxlPcRzM31UDrCrHLIdSfnQTaopI4h9eKunSeI2Y
         WK0A==
X-Forwarded-Encrypted: i=1; AJvYcCW/KADkwG8o6TzcGhhlRUVv/5sCJucQEhdDXua/GC4ocruucE39FhhzFGtTITQqhTXhW0Zk11ymtN2UPkhyz5o4@lists.infradead.org, AJvYcCW1KXvSBLCX3DFuooh1NDtTf6fIx5StEmCjbdNV9PD2GtVVgm6cG9tpcSBwZXCPCvqPVhnSsLLvu9t96ic=@lists.infradead.org, AJvYcCWhPXitM4TcyNUZ4xEPRgsHGKaIGEFOUFMiAIfQPUO0Px/+a+u35ASqn9tucOknHZs08mh3++bT6IybBXA6VoU=@lists.infradead.org, AJvYcCX6RFNgFJ73cuKyEeuMNUO15kYqVC3b3zRkJJN7oZlkE1Qo44s9NDTs4TB4hMrsksuKhyEcDM1c1aNNKKm0Qe4=@lists.infradead.org
X-Gm-Message-State: AOJu0YwIpJ7rnfQ5pF8sNMJLj+WMbrcEHCboCRab17dEtoRGQSw1Fij1
	0+DJ//7C1y4O6a8JBBLmNHLpn6PjGuJKTAjoevh9v8p9z5ilJ6tDmavIdaP8iOXv2xGTFQ==
X-Gm-Gg: ASbGnct64Xn4NZv/jfmezeyAW5KQqM/EW3Tg0cJQtlcQkvEAGU4ss91a/o20Iwv7kZ/
	L9vAx6opFBzQnaarxIQRZK87x7HArdAljcqrPWxKr97H7bsQN9XHdETHe0vYq2dUbDbE44ED7m9
	Je4JUYpobph4WwrvndAA2DUfTX4/n2Zmj//vrjVLPOUz6imq2xMt11FdlHIp0nA4Zizwj4uC41/
	7Z2Hpcld+Cbsyb40yY+AcPbUQ+X7QKA0bwbFuFTbUIpBRPqglyNH2nM49Bo6bRGvi4Pko3+tMLl
	OBPSOjXG1ZfYbXjqY/7zMcqN3O7Bau7hTQn+UzCqFhUo+YU2tK0hT3EAAzIeZ8fQJcoOSzUXmfH
	6kjrO2RfDMpHxVwY=
X-Google-Smtp-Source: AGHT+IFGLK0tZYKZm1t5cPxA2fB68UgyDQZIdSHhRTXD6PL1o07uVthLCv7vv6A0x5Bilg2FWj/q4Q==
X-Received: by 2002:a05:6512:239e:b0:553:2ee0:7728 with SMTP id 2adb3069b0e04-55366b856damr4020847e87.0.1749527627265;
        Mon, 09 Jun 2025 20:53:47 -0700 (PDT)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com. [209.85.167.43])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553676d052csm1386631e87.34.2025.06.09.20.53.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Jun 2025 20:53:47 -0700 (PDT)
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5534f3722caso5675808e87.0;
        Mon, 09 Jun 2025 20:53:47 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCW944jJbPfKc9/u7g/3DD9NdJpaHr6HFc5k5Px/P2KzjMCQ6XNagBTRRqV5sP/rvhIYxB9cZZIsNAf8Iik=@lists.infradead.org, AJvYcCWo6mdrmkmUQxn7o3f1m3nBZFYmlFWSNqot08e/IZyxTl4lvJdRgJkWrx9xnhpGiaP4DiUrNNTloY/oSBhatd0=@lists.infradead.org, AJvYcCXSV0lhAv0rd0bMXKmYcrAxwpTZ0bMCZTaPTV9C5M7EMLNZrKzlJy/lstNJKQ6yBDOAPOqHcjkGc6JbxJ3V2yHG@lists.infradead.org, AJvYcCXZjsT9lhQx897mhqhjaOPrs9sYLj8BOpRnFIs55xDHp2T4p4k5MGk9+02yg6u/2md2r83SCwhgTSQSWP83SjA=@lists.infradead.org
X-Received: by 2002:a2e:b693:0:b0:32a:ddd2:208e with SMTP id
 38308e7fff4ca-32adfc06f41mr30364041fa.9.1749527274652; Mon, 09 Jun 2025
 20:47:54 -0700 (PDT)
MIME-Version: 1.0
References: <0-v2-68a2e1ba507c+1fb-iommu_rm_ops_pgsize_jgg@nvidia.com> <4-v2-68a2e1ba507c+1fb-iommu_rm_ops_pgsize_jgg@nvidia.com>
In-Reply-To: <4-v2-68a2e1ba507c+1fb-iommu_rm_ops_pgsize_jgg@nvidia.com>
From: Chen-Yu Tsai <wens@csie.org>
Date: Tue, 10 Jun 2025 11:47:42 +0800
X-Gmail-Original-Message-ID: <CAGb2v672aLfjX2_+=gnYEt09Z2m+sDoUi-weN2VsgtqnrK_fDw@mail.gmail.com>
X-Gm-Features: AX0GCFvT3cfnNTYictCtJSVKUrXJH3fCgSrvu85ggYc6KyathRV-zklZHWwYSnM
Message-ID: <CAGb2v672aLfjX2_+=gnYEt09Z2m+sDoUi-weN2VsgtqnrK_fDw@mail.gmail.com>
Subject: Re: [PATCH v2 4/7] iommu: Remove iommu_ops pgsize_bitmap from simple drivers
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Alexandre Ghiti <alex@ghiti.fr>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	asahi@lists.linux.dev, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	David Woodhouse <dwmw2@infradead.org>, Gerald Schaefer <gerald.schaefer@linux.ibm.com>, 
	Heiko Stuebner <heiko@sntech.de>, iommu@lists.linux.dev, Janne Grunau <j@jannau.net>, 
	Jean-Philippe Brucker <jean-philippe@linaro.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Joerg Roedel <joro@8bytes.org>, 
	Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-s390@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
	linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org, 
	Marek Szyprowski <m.szyprowski@samsung.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	Matthew Rosato <mjrosato@linux.ibm.com>, Neal Gompa <neal@gompa.dev>, 
	Orson Zhai <orsonzhai@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Rob Clark <robin.clark@oss.qualcomm.com>, 
	Robin Murphy <robin.murphy@arm.com>, Samuel Holland <samuel@sholland.org>, Sven Peter <sven@kernel.org>, 
	Thierry Reding <thierry.reding@gmail.com>, Krishna Reddy <vdumpa@nvidia.com>, 
	virtualization@lists.linux.dev, Will Deacon <will@kernel.org>, 
	Yong Wu <yong.wu@mediatek.com>, Chunyan Zhang <zhang.lyra@gmail.com>, 
	Lu Baolu <baolu.lu@linux.intel.com>, Kevin Tian <kevin.tian@intel.com>, patches@lists.linux.dev, 
	Niklas Schnelle <schnelle@linux.ibm.com>, Sven Peter <sven@svenpeter.dev>, 
	Tomasz Jeznach <tjeznach@rivosinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250609_205350_274084_012E3B3D 
X-CRM114-Status: GOOD (  10.45  )
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
Reply-To: wens@csie.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, Jun 10, 2025 at 4:41=E2=80=AFAM Jason Gunthorpe <jgg@nvidia.com> wr=
ote:
>
> These drivers just have a constant value for their page size, move it
> into their domain_alloc_paging function before setting up the geometry.
>
> Reviewed-by: Kevin Tian <kevin.tian@intel.com>
> Acked-by: Niklas Schnelle <schnelle@linux.ibm.com> # for s390-iommu.c
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> ---
>  drivers/iommu/exynos-iommu.c   | 3 ++-
>  drivers/iommu/ipmmu-vmsa.c     | 4 ++--
>  drivers/iommu/mtk_iommu_v1.c   | 3 ++-
>  drivers/iommu/omap-iommu.c     | 3 ++-
>  drivers/iommu/rockchip-iommu.c | 3 ++-
>  drivers/iommu/s390-iommu.c     | 2 +-
>  drivers/iommu/sprd-iommu.c     | 3 ++-
>  drivers/iommu/sun50i-iommu.c   | 3 ++-

Acked-by: Chen-Yu Tsai <wens@csie.org> # sun50i-iommu.c

