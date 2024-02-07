Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 924ACC4828F
	for <linux-mediatek@archiver.kernel.org>; Wed,  7 Feb 2024 07:19:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6SYbxDYeGniiA6rdtb6/T8QgKPCQ4hLYc/Upt3Qn8Ng=; b=drH3H3wbsd8myPJAlIxLLxPjRp
	OSdsm/oVz3PaFuHkhGkRX+0ZoKNrSzP4JdrPFKJV0O96ZYZwvW2FvHYz1JMnUKe2xSjYC/9ndYJjI
	ug62xa6ab5RUtGnBVMqOOeHmUCvPM7P3jciUoEfcVEvODy8fpz0itsq73gSDysgAx1KnnTyqzQ6Ul
	BDve1jl8P0lTE5HSe/Zawg1+y365bkfZjS3TFth0B8SB0VeNO0nPfdq+pFEkaBjyALo8R0BwwLSmd
	HyXnyEHOlNOqANgYGiYwMRTRNPPNZN+LL2D1okwO6hx3M5zCzzk3n9sta4uMlESSoAIPs3tcVWKFF
	1lF+5NTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXcDt-00000009v6Z-13zA;
	Wed, 07 Feb 2024 07:19:57 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXcDq-00000009v5p-20bm
	for linux-mediatek@lists.infradead.org;
	Wed, 07 Feb 2024 07:19:55 +0000
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-55a5e7fa471so292269a12.1
        for <linux-mediatek@lists.infradead.org>; Tue, 06 Feb 2024 23:19:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707290392; x=1707895192; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6SYbxDYeGniiA6rdtb6/T8QgKPCQ4hLYc/Upt3Qn8Ng=;
        b=hRJX/V6VqB7IDSC8Ph4qD+67HouwgMMc3ViJJbcHPNqMI5Bp6jeFEP27eEapggxJwO
         8hJHvH+dZo8n8SdcgAv2Y/OI3cTqhqnsmjVwGqvXX82i1E5czo1MaBQkpHpuHBvny2vD
         QW9znRi+w5XyJX8fT9dfzL2Kcyoz7MbqGBobrVSvd/aqVqzWRa3ISUFHyZqP3+Fk2WYN
         lg6aFJRV5sQIGBogsv8y558lwKrWnl50b1knOE+xcMLonn0jIg46rVV75EwAGvPGiFNv
         CFkbR3qqMCThj5dWvcufiuDeBBpgPt5viRG+2PJVn4tR/RklgwCK+ajPhtWifYjs9y2i
         FNQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707290392; x=1707895192;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6SYbxDYeGniiA6rdtb6/T8QgKPCQ4hLYc/Upt3Qn8Ng=;
        b=ibpkoEDyLVry5AsGU9yWpFO6ym7hG9e4QDZBSi8GvmxrtU6tQHdFMjFezrCAliLd5h
         pf/i65wsas/YzZGVEDo6Y4y/KvVXjOJNZYr5njSQbws+CNnm7hDsDQ96XpgmIJj4Re5v
         eLdeG3LwRUecdACJDFggOBpHrf3OSfCNBDdo+2rprCe45odIgaLEdXuXJzD7iHJCBZYK
         OFk/dz2eHj7ilElYMewbXB7zMx76nFKUhU9jprRtdKV1ChOfs/MzzS5opC79SXAZs1EL
         SOG8u59QVD8MQ0/Er/Rou7eZeeKeFabwE6lBiaeSuqPEcHzv9ayZB1vA3erTvQfA020h
         VgzQ==
X-Gm-Message-State: AOJu0Yxl6sDhB7CZgE2nxr2SNY65O8/qQ30aur3mHLFrwupj9A5k1mTQ
	YPuSs5mMX5MphDTITfM+WT1aOSrT+TREWSt/jX667E2HhYDNet+PVKv+GoOpfbM+vKbanivNmka
	C
X-Google-Smtp-Source: AGHT+IGdBxPyBXyrnHPSHM2F9u/oCyDhNJlzKgFj2xDI/+5OYO2QdgsC1LNX75LwkVn1O3UVPPnVZA==
X-Received: by 2002:a05:6402:1a44:b0:560:9906:9f31 with SMTP id bf4-20020a0564021a4400b0056099069f31mr3161100edb.27.1707290391944;
        Tue, 06 Feb 2024 23:19:51 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCW/zdcZSDg4pLH1Rt+RivOPBAEybdDR4XOBF+p0P2MTVI+ITlPExLJz6aP2vR4wY4bD0Kr+LBEn+X5BkmRuCuTKzXHWhd941xh3jYX+JLHAmV90kAmRWUNMWj7iAsSe3JC1WYIqzyWYWKQrXTB9jvgYxIqDpdZZ5qy2GY7FGWOmzZbxXa+X1C2vPCdty640ZQP9B5GftyhfDvl0ro9jYeX42sxJzEacqqg92RmcQr9cXMsmvmALrDL9j5jA74sKkW+MF+y8Qq3lkNA2Gj7ddYm7QHlyjW0K0K78DB0qzPcRH9M5TXELrwvgmM42/kjlCJARJnvdlTeqzwKZt9AaGZmUGeLZ/FGYZIFegYpoam2Y4PjsNOfFR+pwxKTtLGwpyji8GUUKrL4=
Received: from linaro.org ([62.231.97.49])
        by smtp.gmail.com with ESMTPSA id f1-20020aa7d841000000b00560cd4f3098sm360696eds.95.2024.02.06.23.19.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Feb 2024 23:19:51 -0800 (PST)
Date: Wed, 7 Feb 2024 09:19:50 +0200
From: Abel Vesa <abel.vesa@linaro.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Stephen Boyd <sboyd@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH RFC 1/2] spmi: Add support for multi-master
Message-ID: <ZcMvFtAwQQjAZhk6@linaro.org>
References: <20240207-spmi-multi-master-support-v1-0-ce57f301c7fd@linaro.org>
 <20240207-spmi-multi-master-support-v1-1-ce57f301c7fd@linaro.org>
 <CAA8EJpqsJmv36=o1aTjVH6eMHXMg8BHNpiDvs+Q8YB23ezVGtQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAA8EJpqsJmv36=o1aTjVH6eMHXMg8BHNpiDvs+Q8YB23ezVGtQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240206_231954_554533_192706EA 
X-CRM114-Status: GOOD (  20.79  )
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

On 24-02-07 01:55:39, Dmitry Baryshkov wrote:
> On Wed, 7 Feb 2024 at 01:34, Abel Vesa <abel.vesa@linaro.org> wrote:
> >
> > Some newer SPMI controllers support multiple bus masters.
> > Such a master can control multiple slave devices. The generic
> > framework needs to be able to pass on the master id to the
> > controller-specific driver. So do that. The framework will
> > check if the devicetree child nodes are actually bus masters
> > and will register the devices for each master. The legacy
> > approach will still be supported for backwards compatibility.
> 
> Please remind me, are those two actual bus musters driving a single
> bus in parallel or two SPMI buses being handled by a single device? In
> the latter case this implementation is incorrect. There should be
> multiple spmi_controller instances, one for each bus. Allocate them in
> a loop and set ctrl->dev.of_node after allocating.

It's two SPMI buses (two sets of wires) handled by the same controller,
HW-wise.

If we register two spmi controllers with the kernel framework, it will
be HW inaccurate, because there is just one controller which has
multiple masters.

I'm not saying it might not work. But, to me, it looks more like a hack.

Basically, we would be mapping HW bus masters to kernel controllers.

> 
> >
> > Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> > ---
> >  drivers/spmi/spmi-mtk-pmif.c |  6 ++--
> >  drivers/spmi/spmi-pmic-arb.c | 10 +++---
> >  drivers/spmi/spmi.c          | 76 ++++++++++++++++++++++++++++++--------------
> >  include/linux/spmi.h         | 10 +++---
> >  4 files changed, 67 insertions(+), 35 deletions(-)
> 
> -- 
> With best wishes
> Dmitry

