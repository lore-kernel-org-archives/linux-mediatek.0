Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6025CCD183
	for <linux-mediatek@archiver.kernel.org>; Thu, 16 Oct 2025 20:52:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/cKRiSBHedJeuF2YiPC1JdZMWW96N+8/8JV1od4hamE=; b=TcXbahadVSkygyHPUvoCsPetAl
	c2widVPYXrirxN74fh/njmeW6zBhBqZ/ExX36P7BB3f93BkPgbzY+ma8cgD6IsChfS7lA7QTj2VtN
	FDuWVMC53LQcqyWFPrF6sZz45Ok+6n4rcP2qBoH/NC7YH2/YAbPhFXI3/y+E6bs+x/1Lob5HPcWh1
	+GULsTRS5NKyrTK3L9nnM0l822GdyJFpXI7u1Bxm8AYsOvrqrn5v3EX9UoesCHrFw+q3WFfGhbb6A
	eVjSFm65NqP6pfMHWqLIzUeG1jMPG7bpH3oHaXZeSH6H/UoIpaIgUf/MoH+wQ5BNv97g4Ma5BiteA
	sUvBiBBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9Uxk-00000005vS7-2Uw8;
	Thu, 16 Oct 2025 20:52:40 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9Uxg-00000005vQn-3GvE
	for linux-mediatek@lists.infradead.org;
	Thu, 16 Oct 2025 20:52:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1760647955;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/cKRiSBHedJeuF2YiPC1JdZMWW96N+8/8JV1od4hamE=;
	b=LdSJQzpj6VonGYUkTxhD6cg7fx6ksYNMBWqfCoJxDsrxiYT3bMbnpvJKBGU6RMq5xMZTUM
	E5G4qHRdcNT+6dqMw+2O6QDXOnAtL1hxcFaZuHsI9Noy22zpKysZMbTQE1RjKGz3e8A35i
	hjddUnYxW0Up4Ihq3FrHbck0xWBRplY=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-392-LBABZKCdPHuoMdjOWYvDOQ-1; Thu, 16 Oct 2025 16:52:34 -0400
X-MC-Unique: LBABZKCdPHuoMdjOWYvDOQ-1
X-Mimecast-MFC-AGG-ID: LBABZKCdPHuoMdjOWYvDOQ_1760647954
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-871614ad3efso406298185a.0
        for <linux-mediatek@lists.infradead.org>; Thu, 16 Oct 2025 13:52:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760647953; x=1761252753;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/cKRiSBHedJeuF2YiPC1JdZMWW96N+8/8JV1od4hamE=;
        b=rBRP+Lk5NTXhHFVrpIK/q/oW3j/jr6MsabHJR84AqZHTrdKCNRNxa3UWWcqwZ5DETR
         H0dCayuPQBC/EZ54Md7kQOvGcWwMWoW5ZFRRKIg2VWg9yTtZr6X/bjxxMqt6QTUFpIn4
         WfpAcntGN5ni8Ph+cV50pH5P4TW/t2zFE1hs0HsQX9OT5ww+uRoFYbrCqssaqBHY00Mn
         c8Z7O+Am0L40dOB7b97C2rtGtHN8dnKnIHFk4HhSpPeu+OJDp0XNUD82K2zIZuyt4eQj
         kcWrt89+JYNHPFvKMbMhn5wvodE0w8MCe4BZcSXwd2Hz9J7h/WiCV3umdQjMZvTLGpMB
         t5qA==
X-Forwarded-Encrypted: i=1; AJvYcCUU+db70LgFEqjwxfFEnR+91TkG4H8wIWKCrZJIFQXunR5iQecL1+OdBxqd1+hCuvZ8chNWzcrmLAn5Olkj9w==@lists.infradead.org
X-Gm-Message-State: AOJu0YyqaJqg0c0a7m0jG2ggLDqFElui6/9qyL6pSiXmO8sZ6KpZ+H3o
	+PDLKKDMTXYgQtUzwZk6xm//h/+Gz8Sza2uDWBVI3VPrSXFRoR/IQBz+zt0Q3ux5l88YzFPpEGg
	Y00AbYkhwsnQWqlcuAsufxIoEinhHsKmb1UNlTIWOFVrtlTXKL/2PcENQyZjMrJ1FtAmkOqr+EA
	==
X-Gm-Gg: ASbGncuNOdA3H5Du0ig6cqaZm7kVvH1DMzeNBu7rzqu4282L/HOwGrz6tjQybXj1hWT
	b4C+hOdKO86xmpcMpWz0tzNunRqGITsvuwPiPvJk+037ECCE7l3762Nyu3+wyZtynRa+YaXNBiw
	icUyY7oA93hySCwkKkSgzLXIQAh3zjezDuPQOFMfNJf/Q8dh/XWMrqKnZ1rQWM6jRtHYId2YA58
	gXYNWeOEkPkazeAvzmQAUwit4/saambKsEujU+SBxL1cPV/9e5qYKxrjsuK0Hd6nDmKmGX3ca2h
	yLLyV3rMKkg38o1e6eB7fP1tsBbOPRiy6siCIPvqoz1OScLj+00rPJkMp6VgZKpeoLjHhM/hiD2
	JmXthnTg8HnNpRTggewedcGiBXD0lA5sipg+r7ZLjrZNRYffRQyfrzN2CMr1iD0QcMA==
X-Received: by 2002:ac8:598b:0:b0:4e7:1f00:2ce8 with SMTP id d75a77b69052e-4e89d281865mr19861921cf.18.1760647953501;
        Thu, 16 Oct 2025 13:52:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHATwA2Ecq5ayw4bx1RtADAqnB2jb/OZrDzGJ991Q3kxbxfK4bp4SH8V/S+x7MWZzR6YqvEcQ==
X-Received: by 2002:ac8:598b:0:b0:4e7:1f00:2ce8 with SMTP id d75a77b69052e-4e89d281865mr19861681cf.18.1760647953054;
        Thu, 16 Oct 2025 13:52:33 -0700 (PDT)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-87c0120cc36sm47970366d6.2.2025.10.16.13.52.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Oct 2025 13:52:32 -0700 (PDT)
Date: Thu, 16 Oct 2025 16:52:30 -0400
From: Brian Masney <bmasney@redhat.com>
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Dong Aisheng <aisheng.dong@nxp.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Yassine Oudjana <y.oudjana@protonmail.com>,
	Laura Nao <laura.nao@collabora.com>,
	=?iso-8859-1?Q?N=EDcolas_F=2E_R=2E_A=2E?= Prado <nfraprado@collabora.com>,
	Chia-I Wu <olvaffe@gmail.com>, Chen-Yu Tsai <wenst@chromium.org>,
	kernel@collabora.com, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v3 1/5] clk: Respect CLK_OPS_PARENT_ENABLE during recalc
Message-ID: <aPFbDl_JKyDay1S5@redhat.com>
References: <20251010-mtk-pll-rpm-v3-0-fb1bd15d734a@collabora.com>
 <20251010-mtk-pll-rpm-v3-1-fb1bd15d734a@collabora.com>
MIME-Version: 1.0
In-Reply-To: <20251010-mtk-pll-rpm-v3-1-fb1bd15d734a@collabora.com>
User-Agent: Mutt/2.2.14 (2025-02-20)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 4N7wW_HLokCldL3r1FzfDotmCkVshelyB7x6pfz7cLo_1760647954
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251016_135236_897484_3A988E2E 
X-CRM114-Status: GOOD (  21.03  )
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

Hi Nicolas,

On Fri, Oct 10, 2025 at 10:47:09PM +0200, Nicolas Frattaroli wrote:
> When CLK_OPS_PARENT_ENABLE was introduced, it guarded various clock
> operations, such as setting the rate or switching parents. However,
> another operation that can and often does touch actual hardware state is
> recalc_rate, which may also be affected by such a dependency.
> 
> Add parent enables/disables where the recalc_rate op is called directly.
> 
> Fixes: fc8726a2c021 ("clk: core: support clocks which requires parents enable (part 2)")
> Fixes: a4b3518d146f ("clk: core: support clocks which requires parents enable (part 1)")
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
> Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> ---
>  drivers/clk/clk.c | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
> index 85d2f2481acf360f0618a4a382fb51250e9c2fc4..1b0f9d567f48e003497afc98df0c0d2ad244eb90 100644
> --- a/drivers/clk/clk.c
> +++ b/drivers/clk/clk.c
> @@ -1921,7 +1921,14 @@ static unsigned long clk_recalc(struct clk_core *core,
>  	unsigned long rate = parent_rate;
>  
>  	if (core->ops->recalc_rate && !clk_pm_runtime_get(core)) {
> +		if (core->flags & CLK_OPS_PARENT_ENABLE)
> +			clk_core_prepare_enable(core->parent);
> +
>  		rate = core->ops->recalc_rate(core->hw, parent_rate);
> +
> +		if (core->flags & CLK_OPS_PARENT_ENABLE)
> +			clk_core_disable_unprepare(core->parent);
> +
>  		clk_pm_runtime_put(core);
>  	}
>  	return rate;

clk_change_rate() has the following code:


        if (core->flags & CLK_OPS_PARENT_ENABLE)
                clk_core_prepare_enable(parent);

	...

        core->rate = clk_recalc(core, best_parent_rate);

	...

        if (core->flags & CLK_OPS_PARENT_ENABLE)
                clk_core_disable_unprepare(parent);

clk_change_rate() ultimately is called by various clk_set_rate
functions. Will that be a problem for the double calls to
clk_core_prepare_enable()?

Fanning this out to the edge further is going to make the code even
more complicated. What do you think about moving this to
clk_core_enable_lock()? I know the set_parent operation has a special
case that would need to be worked around.

Brian


