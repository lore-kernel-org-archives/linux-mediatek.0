Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A769C43217
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 Apr 2022 17:04:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=np6tR9xKU5Sdq2MSHr/PIryGaUMnNOYgpBKVpcgiusA=; b=sKOeI4JjnLHej8
	ClJ8aA+pPs6jSovV9xnB3eKXHkQVqbR93qkIRZZlnUDXTFi2N9qnPT0jQsY7FDye5Qr06X6l82ghb
	qnyLUehZwHA0AWKD5BWffCNWk4ZQYUwUIUHvfmBbyqnxFdqdBKLv4/XRsojStaIQaQOJQaVn/XbWT
	o/TXhWXq6zBq85/ebEdtZyrQXbWPeJxFelqR7lY6RNWTMzR0xg2qzKB7ZyPK5lG5/wJPVi0Qrkecr
	KkZY5NAUvF6gAyr2k4ISm8SqQ6Ew+H5a17DP2O8J8Le4E2meNcd4+Ue2t7zVGhu0mkoEdm2n7WLue
	hF9fznYzk1Az9B9z2Kyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1neJwK-00FAHM-VN; Tue, 12 Apr 2022 17:04:28 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1neJw9-00FAEv-Aq
 for linux-mediatek@lists.infradead.org; Tue, 12 Apr 2022 17:04:18 +0000
Received: by mail-pj1-x102f.google.com with SMTP id
 md20-20020a17090b23d400b001cb70ef790dso3550354pjb.5
 for <linux-mediatek@lists.infradead.org>; Tue, 12 Apr 2022 10:04:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=svCJiNYCVSTSADFJuSISCpOI75wKzQz4JEvN3pdJrsM=;
 b=I0pM3O+HVyaN+WR40sxZKPBujfPiS3TYbtroP2cR9D3EyonmrVjWLo+lFmCjjMF/C9
 cKC95ZxJ5Wrj7D8YYDHGFUDvGV5CqSfJIeyJZp4xia9AH0fNss/9hGUjx3Dc5k/kk+NI
 SK55KI1P+NrSthu6nAnBYzB/AAGQORsGEG9JNxBoBlmcVXq8WOOypF/3nfo1RTjKbfAK
 3wkiCRIRYK/PBpuqmNWFGd3fnVzQpOgfZYmS3EiJjdqvm+ZOuX4X+FXha0FXLcH2RAYv
 wEPfq51y/pCgvHdYlIvMzU1RG15mFEFWbDIbpcC1v792nKvKq9up0JlbsebYKLsxNu3N
 N77w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=svCJiNYCVSTSADFJuSISCpOI75wKzQz4JEvN3pdJrsM=;
 b=5aRZZ8CPuMU8s622AWSIG6AMAt/+j9WiwPxg7gTFY4KPGnNZ1Q8PTZ7G11ciyEqyj8
 RmGW5E72jjxbx5wy+BX3H83HaedcDq1RWvP1/alSueWFu5JAq3WdAkBhjJz7ZuECbbj+
 pMvlfBK0A8mpWUI3V7lVKRaiURezqPa2TBDLD6+V7IVyd+x9NdUNiy8VBu//BROnH+iy
 jC/J6XT1d6Wo9+zfiQBYLmOdjHRvt2u+GL7mhBiNtEZqWyW2Fu0o6H+kx91ylUXSBlhI
 qBBVLBAMGBxZBoRHs55asqcqn7bWQ7sdqHwiclm7UvjlzVfY47QvAtyzNwCS3ZoGXG1f
 PQFg==
X-Gm-Message-State: AOAM533DrpA/FO8RTBpRqzEBQJqHB2kuA7NjJtexnEjEa9suwvxA1DVa
 XCXaCBm3dTe8UF5Dwf3m49Tnjg==
X-Google-Smtp-Source: ABdhPJxED4y9fHEAFYCWz2UyU0Yj+9pcsOz0knbV4/SXxH9hKezQCW0Zl7/FRRX8+OwqcltokcmuJw==
X-Received: by 2002:a17:90b:19d0:b0:1cb:7ef1:d915 with SMTP id
 nm16-20020a17090b19d000b001cb7ef1d915mr6130873pjb.16.1649783053717; 
 Tue, 12 Apr 2022 10:04:13 -0700 (PDT)
Received: from p14s (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
 by smtp.gmail.com with ESMTPSA id
 k92-20020a17090a4ce500b001ca69b5c034sm49060pjh.46.2022.04.12.10.04.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Apr 2022 10:04:12 -0700 (PDT)
Date: Tue, 12 Apr 2022 11:04:10 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
 linux-remoteproc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v2] remoteproc: mtk_scp: Fix a potential double free
Message-ID: <20220412170410.GA465495@p14s>
References: <1d15023b4afb94591435c48482fe1276411b9a07.1648981531.git.christophe.jaillet@wanadoo.fr>
 <34c30f7c-70e2-dc95-a664-9379f91f5aed@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <34c30f7c-70e2-dc95-a664-9379f91f5aed@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220412_100417_403387_B92BA055 
X-CRM114-Status: GOOD (  10.30  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, Apr 11, 2022 at 10:55:52AM +0200, AngeloGioacchino Del Regno wrote:
> Il 09/04/22 08:27, Christophe JAILLET ha scritto:
> > 'scp->rproc' is allocated using devm_rproc_alloc(), so there is no need
> > to free it explicitly in the remove function.
> > 
> > Fixes: c1407ac1099a ("remoteproc: mtk_scp: Use devm variant of rproc_alloc()")
> > Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> 
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Applied.

Thanks,
Mathieu

> 
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
