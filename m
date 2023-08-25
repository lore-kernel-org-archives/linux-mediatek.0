Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3E63EE49B3
	for <linux-mediatek@archiver.kernel.org>; Fri, 25 Aug 2023 22:12:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e+hge1oDtbK92kc9TmT9Xdf3z4r7E02Hg1hwzgG2crw=; b=FCDrne1pM73Aao9xZFwkB3g6yk
	9wvClmAnEZV2ull63Vq7UQ0LSaY64C2SRfP4S63ThMjT5i2+XgogykQQ48GAXGe435jR/mIaqG0Tt
	lKBYgBENyIb9OcBG/oDAk9C8grds9LwiWlwLRdojoR5uUYDjR3aRrY+EMlhNywDswUg7VoEakLm3k
	YVvGjYOkUMgamLGf9mPeY165gkgLIUI/BXgfPuQ02W3HFfG1oDPnZl2OD4INjUe3gtBHKb8SwMhC5
	tKohDPy5tscYoQIe+WWEl966yfojHQ1FM0foyO/e2tePeTkqKfUp85hwFkY+ZgjMIC2rNospwJjUF
	Yve3zUwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qZf2h-0065n4-1j;
	Fri, 25 Aug 2023 22:12:35 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qZf2e-0065m5-31
	for linux-mediatek@lists.infradead.org;
	Fri, 25 Aug 2023 22:12:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1693001551;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=e+hge1oDtbK92kc9TmT9Xdf3z4r7E02Hg1hwzgG2crw=;
	b=VwgihAGFyMDGzqNbg1jyR1TLaVjUlQ4T36BNI4LsrZNp6+7t3uH89NoVzPulaD+R5vPz+P
	e8Cx0SmilW4NjizO8XYV5kG9okmbiWUYaOHaHe67/daX0GufIJgzXkPPyvQtMWx3Z7lsjq
	bdYDVz5tcVLjZyyDl1woL45wy4ULX/8=
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com
 [209.85.128.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-392-R1DemjJjNemQDj6JdKQf7A-1; Fri, 25 Aug 2023 18:12:30 -0400
X-MC-Unique: R1DemjJjNemQDj6JdKQf7A-1
Received: by mail-yw1-f200.google.com with SMTP id 00721157ae682-58d37b541a2so20829217b3.2
        for <linux-mediatek@lists.infradead.org>; Fri, 25 Aug 2023 15:12:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693001549; x=1693606349;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e+hge1oDtbK92kc9TmT9Xdf3z4r7E02Hg1hwzgG2crw=;
        b=iXM/4jwF5PwUdc+MHsxkQBXQjfHMuDT9unMB/OqMKAVxMQlj6T541yNr32db5AAo2Z
         2tZ8+/4Kfkj0ihngeCzE+XKHckzwPDb2+NAx3pZSqTK33XTv2f10XxsYvHhvBp84OgD+
         SXG5rcQL5ltspFpr56/K261tG6AvcZloaH2tEylFFTTAy4QR2lOGgIHlfcvjJoi3AUcS
         kRYO4PMV3joZePoTUxk1uQbpzKT2XFRMgln0rt/7fmWAb25aGKbfs94WLdPNSyZEjJUA
         Ofrj/lhiCIw96TZ5t25bGXxPctZZMRMvBBWhj658cSiIEIQyqzvUacTreiFN0LTOYXQq
         fGEA==
X-Gm-Message-State: AOJu0YxsU7uvvGuqAT7t46rL8UpUOUAU+86MPK9QczHRD9LXz/UWCHtc
	t6jOH8IzqegbSS9Zba7+o53eX7639sxW/ZgafudrmYfs325NBnQ+SG+pT7JA3dLCJ/H5Mj+yKjW
	FmDKK3hyj4UWGFqKjBPqHzYiAKiqJAux1
X-Received: by 2002:a0d:d713:0:b0:586:e50:fb50 with SMTP id z19-20020a0dd713000000b005860e50fb50mr19547778ywd.28.1693001549714;
        Fri, 25 Aug 2023 15:12:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHqzLCDM3DmOkP06FXZ9bPHPMsAQN6X4+gYJTqa+W/zrzV0quaG3oT8K/t8CMwB/6vm0x/C6Q==
X-Received: by 2002:a0d:d713:0:b0:586:e50:fb50 with SMTP id z19-20020a0dd713000000b005860e50fb50mr19547730ywd.28.1693001549499;
        Fri, 25 Aug 2023 15:12:29 -0700 (PDT)
Received: from localhost (ip98-179-76-75.ph.ph.cox.net. [98.179.76.75])
        by smtp.gmail.com with ESMTPSA id a9-20020a0ce349000000b006418c076f59sm817232qvm.100.2023.08.25.15.12.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Aug 2023 15:12:28 -0700 (PDT)
Date: Fri, 25 Aug 2023 15:12:27 -0700
From: Jerry Snitselaar <jsnitsel@redhat.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Andy Gross <agross@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Bjorn Andersson <andersson@kernel.org>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Gerald Schaefer <gerald.schaefer@linux.ibm.com>, 
	Heiko Stuebner <heiko@sntech.de>, iommu@lists.linux.dev, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Joerg Roedel <joro@8bytes.org>, 
	Kevin Tian <kevin.tian@intel.com>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, linux-arm-kernel@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-s390@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
	linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org, 
	Russell King <linux@armlinux.org.uk>, linuxppc-dev@lists.ozlabs.org, 
	Matthias Brugger <matthias.bgg@gmail.com>, Matthew Rosato <mjrosato@linux.ibm.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	Orson Zhai <orsonzhai@gmail.com>, Rob Clark <robdclark@gmail.com>, 
	Robin Murphy <robin.murphy@arm.com>, Samuel Holland <samuel@sholland.org>, 
	Thierry Reding <thierry.reding@gmail.com>, Krishna Reddy <vdumpa@nvidia.com>, Chen-Yu Tsai <wens@csie.org>, 
	Will Deacon <will@kernel.org>, Yong Wu <yong.wu@mediatek.com>, 
	Chunyan Zhang <zhang.lyra@gmail.com>, Lu Baolu <baolu.lu@linux.intel.com>, 
	Dmitry Osipenko <digetx@gmail.com>, Marek Szyprowski <m.szyprowski@samsung.com>, 
	Nicolin Chen <nicolinc@nvidia.com>, Niklas Schnelle <schnelle@linux.ibm.com>, 
	Steven Price <steven.price@arm.com>, Thierry Reding <treding@nvidia.com>
Subject: Re: [PATCH v7 05/24] iommu/fsl_pamu: Implement a PLATFORM domain
Message-ID: <2sctnqicp6snn7g7xlis2nfa4owdfbfyp6wuxsi65m2jmxmylv@xxa2ppitoelx>
References: <0-v7-de04a3217c48+15055-iommu_all_defdom_jgg@nvidia.com>
 <5-v7-de04a3217c48+15055-iommu_all_defdom_jgg@nvidia.com>
MIME-Version: 1.0
In-Reply-To: <5-v7-de04a3217c48+15055-iommu_all_defdom_jgg@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230825_151233_044186_BE54A125 
X-CRM114-Status: UNSURE (   9.81  )
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

On Wed, Aug 23, 2023 at 01:47:19PM -0300, Jason Gunthorpe wrote:
> This driver is nonsensical. To not block migrating the core API away from
> NULL default_domains give it a hacky of a PLATFORM domain that keeps it
> working exactly as it always did.
> 
> Leave some comments around to warn away any future people looking at this.
> 
> Reviewed-by: Lu Baolu <baolu.lu@linux.intel.com>
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>

Reviewed-by: Jerry Snitselaar <jsnitsel@redhat.com>


