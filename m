Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B573C4167B
	for <linux-mediatek@archiver.kernel.org>; Fri, 15 Dec 2023 20:03:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rAzHvZVWa/JEzf8spmnhi72BooWwCm3cMmPhXYXtoQc=; b=Bb5wGRpUFP3u7fl1d7lLbjhnOD
	+OriGdfrSFjuJRjCDqVlJ2Qo4Y0MH3ccrpNAtYQs/h6D/mWo1khT8KiLgoP1Wm+cVHmuyb1s1OWIk
	YC4+DZhw2dKX/q4IamjK33xzLhjtLGev6LbViVIZ2rGy5TZnlIIn7RPxwx5mlnc2hglhJji1Ho3Ju
	//nsjnCmFqlBo+4t9fBOmlHDiKIYneFInJcjpeL1v3S7aNgbIaAqrgttTt0gvly5D90tse2hIdhuY
	uP3zPW4re+owHIhqCURW1y8IZOrl/O5VzH0xlJN8jeTBQliQxpgeHMoW6C+QcAhM1CCRiQvC2L2TF
	2ACpqfHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rEEOt-004Po7-1P;
	Fri, 15 Dec 2023 20:03:11 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rEEOp-004PlK-2w;
	Fri, 15 Dec 2023 20:03:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 04AD06276A;
	Fri, 15 Dec 2023 20:03:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C139CC433C8;
	Fri, 15 Dec 2023 20:03:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702670584;
	bh=D3En7LevwtePTuCguIJqTHsJafw8n5zSzdRFnT9CLAo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oZWFH3LdzjpEwxz/BmgfBuoD4xQVv9+zSf04O7H952be0zt6Gn82JcEbbl7u4R94o
	 Z0i0jcQ7/7hUIfrckfBjYGcDSmVB0c0fIr6qOqRqqdD3oKNz7pSdZYC1fsRDsE9ZbH
	 6jUkCwk11YIvJfLy4PWk6KwjQgccmrL6Pqk9BNc6XM640oMgVyOu8jIEN9mqKBziwH
	 SqaTf/ERlhkEiEuQneDAw3/230kfcky/Vv82xSziwhRbJSom+2qPo53ncrJVhKQJDR
	 jzhc4AaR38XgbNApAnnkIaV1UPhgvBmZ1BRDgvq9BwA6fMG/v9ArjeRj6l8hquM329
	 WI7Xddpo8THkA==
Received: (nullmailer pid 303466 invoked by uid 1000);
	Fri, 15 Dec 2023 20:03:01 -0000
Date: Fri, 15 Dec 2023 14:03:01 -0600
From: Rob Herring <robh@kernel.org>
To: Eugen Hristev <eugen.hristev@collabora.com>
Cc: andrew-ct.chen@mediatek.com, tiffany.lin@mediatek.com, angelogioacchino.delregno@collabora.com, matthias.bgg@gmail.com, linux-media@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/7] dt-bindings: media: mtk-vcodec-encoder: fix
 non-vp8 clock name
Message-ID: <170267057932.303365.14773226712594255838.robh@kernel.org>
References: <20231215104551.233679-1-eugen.hristev@collabora.com>
 <20231215104551.233679-3-eugen.hristev@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231215104551.233679-3-eugen.hristev@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231215_120307_993260_533993A3 
X-CRM114-Status: GOOD (  16.26  )
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


On Fri, 15 Dec 2023 12:45:47 +0200, Eugen Hristev wrote:
> Looking at the binding it makes sense that the `-vp8` compatible has
> the `venc_lt_sel` while the other bindings have the `venc_sel` as name for
> the clock.
> This was also mentioned in the txt version of the binding before the
> conversion:
>  `
>  clock-names: avc encoder must contain "venc_sel", vp8 encoder must
>  contain "venc_lt_sel", decoder must contain "vcodecpll", "univpll_d2",
>  `
> 
> So it is easier to check for compatible that includes vp8, since that's
> just one, to have the requirement for the clock name property as
> `venc_lt_sel`, rather than for all the others, some of which are missing,
> thus for them, the requirement is wrongly `venc_lt_sel`.
> 
> Reordered the if/then/else to match `-vp8` and have all the rest of
> the compatibles using the other clock name (`venc_sel`).
> 
> Signed-off-by: Eugen Hristev <eugen.hristev@collabora.com>
> ---
> Changes in v2:
> - new patch.
>  .../bindings/media/mediatek,vcodec-encoder.yaml       | 11 ++++-------
>  1 file changed, 4 insertions(+), 7 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>


