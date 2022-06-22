Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9ED94CCA481
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Jun 2022 16:30:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nhVxaWNtri1CK0PHzSlalIxtbdAU1PUSddkvaK/+5e4=; b=L6euFR6dO9BZnR5u1ZmVtE74Z9
	hCriaLZXzwDCuoqUKslVzHlEa/1D4jfhvN6xx0FZOq9N5CH60q0+SkdKOwjZGTtXosCYGqOdusiFV
	3GWhh6vuJTupjv0d6Zz1OdOG34Fe0m8GzZN8bQE3aOx31bJf7lWAnh83la58YlrxyfT83MCTIND4E
	8/2tWBXfxgJy/nfV51pfU+CvuUy2x9eBiNw9UdHG1HVMyqj0vTdHs9g7QOKb+DC4DIlYMljGdHUVT
	TqkVdeI3FZrtX7RekTF9CmKbRgBu2vxtZgEc7w1ByumVQG4YPdTAg21A+DbttX6X8wFllsF04YF/u
	BH2oUaOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o43FG-00BXR3-6a; Wed, 22 Jun 2022 16:30:22 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o43Ap-00BVQ1-2E
	for linux-mediatek@lists.infradead.org; Wed, 22 Jun 2022 16:25:48 +0000
Received: by mail-pl1-x634.google.com with SMTP id d5so15802526plo.12
        for <linux-mediatek@lists.infradead.org>; Wed, 22 Jun 2022 09:25:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=nhVxaWNtri1CK0PHzSlalIxtbdAU1PUSddkvaK/+5e4=;
        b=PUGiKBVAkeTgsz2FqLGI7rWQhLimJ38Xj+5Zg180pQyl0ruN+w1AjCcu6fqIZDYjAB
         xG7oN1xzGX2iFM2bnPKINZLXHu/lSyd7wtYcs6OqMcEsqPQA2ynY1LEED97pYyPuEA5B
         qtjsWDJ0vo7Vf+PB9f1yhRi+Rw4TyPhDuxJREQV6OxJ3nV4lruvuhc13IAbkfYRrajre
         naFQHrt0Xgp0jY0cOGp6yjxaC3Dv9YICKdu9t5JldYvxQvfXK3p5P16zqjzR9I19PgF3
         /sdblCFTDXUvSKaef4l5DisLWhm6bhKAkqGEKtWAtc5F2Tt7FQx53ATs58M4BElSCBe/
         zQ1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=nhVxaWNtri1CK0PHzSlalIxtbdAU1PUSddkvaK/+5e4=;
        b=UpTe8swblbRiVZIhzfwa8tiTAWYJl60mfph0jAbh0gbwPe3jMNNxKqLgMIUwF5XozZ
         vyG3T+Th1SjFADAnI0/jhdSFqaM2wdeebSefsL9kOEYQatG8tGWYRm4Ut/gIOgXAzh6R
         4WjxBJvCFC/7Ecc8/6ieUmXLBhLHl3zegtP41S+egn3izLqup0UrXsbxRdQOZzTZOWZW
         1pyhj/blzIIV96OIICLtn2PPx13XqtPtKH6IYe3paoO5HnA/W2cWJcVB23Nr+I2GMlEl
         Xv+Kikdio24aI/98flPkgzQVN76mXVh9QVro9sJ56CLOfkvUsEfhN6+lbznSQUwo13tX
         cE2g==
X-Gm-Message-State: AJIora+9B6WKtLiJZJmUaUNVvtxgJobcsZKRjBz6CT6fPUrPLTWh2PsX
	duhsqh6b7f5Jex9wklTmwdtcnA==
X-Google-Smtp-Source: AGRyM1ty3j96F9rBRPvE63v1BVhmw6iHaLjHVSskbjQhiqe7Ui9yA3Lv+QHsTJmdNJXt+uuOX/uoew==
X-Received: by 2002:a17:90a:9408:b0:1ec:9453:2ebc with SMTP id r8-20020a17090a940800b001ec94532ebcmr4523830pjo.150.1655915144128;
        Wed, 22 Jun 2022 09:25:44 -0700 (PDT)
Received: from p14s (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id 74-20020a62164d000000b005254535a2cfsm2035941pfw.136.2022.06.22.09.25.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jun 2022 09:25:43 -0700 (PDT)
Date: Wed, 22 Jun 2022 10:25:40 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Christoph Hellwig <hch@lst.de>
Cc: Mark-PK Tsai <mark-pk.tsai@mediatek.com>, bjorn.andersson@linaro.org,
	robin.murphy@arm.com, m.szyprowski@samsung.com,
	matthias.bgg@gmail.com, linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, yj.chiang@mediatek.com
Subject: Re: [PATCH 0/2] dma-mapping, remoteproc: Fix dma_mem leak after
 rproc_shutdown
Message-ID: <20220622162540.GA1606016@p14s>
References: <20220422062436.14384-1-mark-pk.tsai@mediatek.com>
 <20220423174650.GA29219@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220423174650.GA29219@lst.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220622_092547_122995_78359259 
X-CRM114-Status: GOOD (  10.60  )
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

On Sat, Apr 23, 2022 at 07:46:50PM +0200, Christoph Hellwig wrote:
> Sigh.  In theory drivers should never declare coherent memory like
> this, and there has been some work to fix remoteproc in that regard.
> 
> But I guess until that is merged we'll need somthing like this fix.

Should I take this in the remoteproc tree?  If so, can I get an RB?

Thanks,
Mathieu


