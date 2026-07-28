Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 048C7C53219
	for <linux-mediatek@archiver.kernel.org>; Tue, 28 Jul 2026 13:10:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vxbqXLAunmT2qGsW55SMRVrOQZR4H5ggveSMTVA7VUM=; b=10UtHwTLKydrJU3fgg3PLr3qQm
	qQqfKV6WSqnv4ZqRxtMlqa3/f0Aemn6V3XJD7ZBw58wzOxGSLzNlpf4sX0n0mJMoTjGAi9zbqN4g8
	7tOhUd5imPdqkE5EpdZ7HLfwFefmAyO1Mrpt5z+pkOJa3zytrhO1l96SX46jhGaGl1aXbdGTWDEym
	cvZVMz/YaS1lDwDfaBZI3t7pfTR2rH+IHNmM+8W9Qq0uy+O8UH95B5Xw1SfKAGxlQBCT0/iKTPoI/
	YZLXpoAw8/1J5SoJ/P8glP0xJH2Whtm4+tYNoHLhMXZFckdhRrqqzSDNGyBVJy84AkrhiNY0o/00H
	FzwGM8TQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wohZV-00000005Jl9-3PLq;
	Tue, 28 Jul 2026 13:10:13 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wohZT-00000005Jk7-1MMY
	for linux-mediatek@lists.infradead.org;
	Tue, 28 Jul 2026 13:10:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1785244210;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=vxbqXLAunmT2qGsW55SMRVrOQZR4H5ggveSMTVA7VUM=;
	b=cniiXPkPq6JN6ScpGTbB0OvPQ1xbEi0Rkn+eajuY2s0cL9Z+UBaW5IOl9sbM2IO/lB5fwB
	ANFaQXkrj5uahxQw8fzDAOJ1tvmjHTxAICIMnziB8ZVpcwNVwbUqXnKko8rgMvHA98wvoJ
	HxkhV/WdqTG6OHXvXtS1GigQfncIgFk=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-410-C9ggw1vWNT2c3mLdMudcKg-1; Tue, 28 Jul 2026 09:10:08 -0400
X-MC-Unique: C9ggw1vWNT2c3mLdMudcKg-1
X-Mimecast-MFC-AGG-ID: C9ggw1vWNT2c3mLdMudcKg_1785244208
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92e4f27f49bso370899985a.0
        for <linux-mediatek@lists.infradead.org>; Tue, 28 Jul 2026 06:10:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785244208; x=1785849008;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vxbqXLAunmT2qGsW55SMRVrOQZR4H5ggveSMTVA7VUM=;
        b=fvmRjz7KbLh1F/2PmGHkDCMIsxuOluG34jyDwNNWntOTI6hNd90BHBtEvATKwLXkms
         Aoq88joymDB4ZJkrnQGaHfdVRegv+obQ2SOdBB5KZ1m5hTDICY8krnyyBEJwlwvcJNmn
         e6B20JR6vX0u9Ioh+OgkI2QCMu1A+J4Z2lCWzG0AZX8fX7MLtfTddV5pV8Pl9gh60TWw
         x0tx4SPWbj6dGhBzF1RmCUt5TQt2RqF7grMjwuYwyOp89F/TTkCicMAfhw6mgT0WzMId
         6gzdpGsQzUSo4o2uXB2Fc7X/skK6OS7oXvCQTp0jCZ6iZOZZPsf9mU8D1GqBc0Nag1k8
         x1Wg==
X-Forwarded-Encrypted: i=1; AHgh+RpiqeknM3peE8iSgt3mMGi7YyRquATDtAn1faTKf9Vxz9/27X5JITvFEvR5OUfMbBCYdS9S2LRiYfqhMxdr4w==@lists.infradead.org
X-Gm-Message-State: AOJu0YzlksVc3ogbJPugm7RKT5YnmWNbYGdypp8ogL/9BJDLLE/XQehZ
	U4qdbf1DioaK8ZYKiGUMqB3ayjFgdnBqyUczCxmOfS09yO3ZRYHuDfyE4JeoFiK3AuM1Yrt398H
	IbobzoIvnGIhZ6TtiydRqEnYIScZla/dUIYi/yyNpATDIUa9wXjIPm+oRgmggsaJxYj+XwQ6ydA
	==
X-Gm-Gg: AR+sD10NkywRDry5C7T/Rg5X3C1juJN406tbn1ojwz84cT+VcSCOFmZzg0fhbqL3uAs
	Lvd3g/RSGiGaVrPPpquFhypRDtQLoLjCdWhl1BSpGOoab8mkMDmp1pCa9HbmzGlJYlJvgnswWw3
	tJS5bIdurTNo3z9aBPVPq2zH1+Ac0DUXmg/yUv+R103kO6mGiTucO1rDXwB+0LRAwc+iXKxUzeM
	AhW+Xp05kPIjqxYMYfQhaEWYSegMhfZK5YM+AYc56Xug1UGlchyV9/su9D7aAayPHXKJN+ACtgn
	CbQhP+IaEvoVkSsKSotoPszMjwhGKI2CO7vVkZc9CmZnZihea2PVDZ/ZrrSvUWC+lY6x4KAx9sz
	oElhMvKoOSLy6Jh4F/QXcXqFu9msNB9JIvNQ=
X-Received: by 2002:a05:620a:4446:b0:92e:7a3c:add7 with SMTP id af79cd13be357-933025a4606mr215984985a.27.1785244206186;
        Tue, 28 Jul 2026 06:10:06 -0700 (PDT)
X-Received: by 2002:a05:620a:4446:b0:92e:7a3c:add7 with SMTP id af79cd13be357-933025a4606mr215965785a.27.1785244204887;
        Tue, 28 Jul 2026 06:10:04 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-932de635f6csm831797885a.26.2026.07.28.06.10.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 06:10:03 -0700 (PDT)
Date: Tue, 28 Jul 2026 09:10:01 -0400
From: Brian Masney <bmasney@redhat.com>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Stephen Boyd <sboyd@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Alessio Belle <alessio.belle@imgtec.com>,
	Luigi Santivetti <luigi.santivetti@imgtec.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	imagination@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Icenowy Zheng <zhengxingda@iscas.ac.cn>,
	YoungJoon Lee <getfeus@gmail.com>
Subject: Re: [PATCH v4 0/5] powervr: MT8173 GPU support
Message-ID: <amiqKRkFItYwD6oL@redhat.com>
References: <20260728091804.382753-1-wenst@chromium.org>
MIME-Version: 1.0
In-Reply-To: <20260728091804.382753-1-wenst@chromium.org>
User-Agent: Mutt/2.4.0 (2026-06-19)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: MtP3Cd8FmOJQh9q_tab70R0kSqv_GttATLYaPYuMw-w_1785244208
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260728_061011_464703_E3B53966 
X-CRM114-Status: GOOD (  16.84  )
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

Hi Chen-Yu,

On Tue, Jul 28, 2026 at 05:17:58PM +0800, Chen-Yu Tsai wrote:
> Hi everyone,
> 
> This is v4 of my MT8173 PowerVR GPU support series.
> 
> This time around Mesa was ready for basic testing, using both vulkanmark
> and glmark2-es2-drm (with Zink). Details below.
> 
> Changes since v3 (all in the clk driver patch):
> - Changed pm_runtime_put() to pm_runtime_put_sync()
> - Added missing of_node_put() in remove function
> 
> Changes since v2 (all in the clk driver patch):
> - Made COMMON_CLK_MT8173_MFGTOP depend on PM
>   - Needed since the driver implements PM domains using the generic PM
>     domain library, which also depends on PM
>   - Fixes build breakage (kernel test robot)
> - Fixed "RST_DELAY_CNT" name (Brian)
> - Dropped unused mfg_desc (Brian)
> - Added check of clk_prepare_enable()'s return value in
>   clk_mt8173_mfgtop_power_on() (Brian)
> - Saved error value for return in IS_ERR(data->clk_26m) branch
>   (Dan Carpenter / kernel test robot w/ smatch)
> 
> Changes since v1:
> - Adapted to changed DT bindings
> - Dropped driver change
> - Use same power domain for "a" and "b" GPU power domains
> 
> 
> This series enables the PowerVR GPU found in the MT8173 SoC, found in
> some Chromebooks.

I'm making a pull for Stephen for the clk changes. Should patches 1,2,4
go through the clk tree? Patches 3,5 go through the DRM tree?

Brian


