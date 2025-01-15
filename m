Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1730C02180
	for <linux-mediatek@archiver.kernel.org>; Wed, 15 Jan 2025 19:12:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/4oGFxCwPaJgAdqTBVjzj8myjSC006R3VVcxomH2jWc=; b=LW/mXAdf9HC148cBRTTUxYIzuR
	9HOo8472HtFfPfBFsJdQOuOUemPW5nik+ne0QB1eVAV9+7teiyiOV/6hGDcbcRdm0t8lhS46bsGGi
	+IL3WBhOSrWVVs8hmXbZzfb23e0wOrrsVU9mlcS5jQXcQbke86qiKRrGpVtiyafy3FukBa2BdPnWG
	ElmpW8/QQ78+SsMtsQt5N6gLgMcHiA3hYY9RoTuI7T2A1gLu/9P7cZaAI95jeUfItfxtqwO2EpZu3
	6YyWpbESxvtBwsO0pAe+0o3RIJXzjlsEhVB8ueLeH/9HFyb9ng9xstfd13B5yxlqcXZcVm5R7h3q8
	X85KomgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tY8on-0000000Crfg-214m;
	Wed, 15 Jan 2025 19:12:45 +0000
Received: from mail-qt1-x82c.google.com ([2607:f8b0:4864:20::82c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tY8ol-0000000Creg-1XAM
	for linux-mediatek@lists.infradead.org;
	Wed, 15 Jan 2025 19:12:44 +0000
Received: by mail-qt1-x82c.google.com with SMTP id d75a77b69052e-4678cd314b6so1428581cf.3
        for <linux-mediatek@lists.infradead.org>; Wed, 15 Jan 2025 11:12:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1736968362; x=1737573162; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/4oGFxCwPaJgAdqTBVjzj8myjSC006R3VVcxomH2jWc=;
        b=CxhZXIdDBGbvOk3LpFKKptyg7++mxW2jK/f4l919X8cn/GqdWwWbLPdgfc0s1Yo3ML
         yvE6LE51F4g71XfO1z/prc3qJMsvovuRG+xUHvNi/7WFJxC6TNynrgJqVYRvENPyFch1
         1YMgzY6btbUp7ML4DkG3hjcOk3PWguf2F/P4CAFRE43uyBUph2xg9CpEdNCxvt2Y+k/i
         mehxWNJQHEjySZtRYsgvp7s3jrDm9A+wb9CM4XCIlQUNLd3bp0sorI7Wt9MIXDkTrTjb
         LaggSmihdIEuRGVWQIba7mqs62w2Icendr5EDNjg4oJunnkfiwskUjTfGAMv4xhz90Ud
         PKgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736968362; x=1737573162;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/4oGFxCwPaJgAdqTBVjzj8myjSC006R3VVcxomH2jWc=;
        b=I5Cz2nkTFPEYJokfJ34kLCggQk9pdUgp8f2cdbfAX5/zp5jJZCIOw+6zP6u+EftuMU
         HaOxnIVRkAYjj0ptTR1sVKlFHgwZXth7x9ERWfuCJkkrRONHWn5Znsbysd3opWpVUcO4
         yhoW5bVGKg8RsQI1n3BSa9CaXu0ejYzX0HsEAY8av8NKu5Nyy28cg1btjJ4IL672fY1+
         ziXao090Zv30FLjm6JBV8TxhgWlzx2I6hJGEbccUqlIL1B+Ffn5v6VH1qF9KLpeO6ZXC
         p/Ig56LyksKZ7kwgoXt9CPSC6zcd10mrMOIIo0sNMun5A7dFdEMYUCha/9YqqKT76rkA
         WmUg==
X-Forwarded-Encrypted: i=1; AJvYcCW2Ks7s8EJiuguZHHaVHIZVGQM8A6Q3bjtf3qjyvQ20ahsEyTWgew/bz2/Cz4u5fVuKLgv5fPRO1Kfn00WzDg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy6h5cnicDMGhN6Inri9qx5TLY0DooUzqHW3yua6lGY1uQIzi/R
	64a/4Odw5DcrtE3kOAyE7wyhjSilCWghIXK3ohoz8QQZb2dn4k8h4PXikvprr3k=
X-Gm-Gg: ASbGncvtAGDZvhy3cu7u4w9TeCEi4HVnDC5hH5r7zb7PZc1cknjhOcDyiBeiA6Ajvhi
	zaTmhSRx1iMvMjReZxVtPd4a3fIb765ZnkLgWj4wf77D56U8cAPWseZjdGsux+qfICgLt3iZNlR
	JWM1HFLE/tklxmVp/LfpEcyud0vPlKIKFlV6pWj+IgMUPYf+TMelJDzx7168pb0BvYKYMnB1Aa7
	SmYBz0GCnUgUrrmUTBydGl5zgq+ed7b9QTw/wE1YA7I/8P5yHzWpZHAHx6ZfYDj0G0szLCJdxOO
	hN/e0C6pYwQjKeZ/X1fKA21M4STuSA==
X-Google-Smtp-Source: AGHT+IGLgsr87VLlZ/6vxEgew2f6ev8/p69ziLEOON6TEwqWnOVVTirBJBkB/bFj8Dm/enP76kSGnA==
X-Received: by 2002:a05:622a:1a96:b0:462:ea22:33bb with SMTP id d75a77b69052e-46c7107aa17mr104417681cf.38.1736968361749;
        Wed, 15 Jan 2025 11:12:41 -0800 (PST)
Received: from ziepe.ca (hlfxns017vw-142-68-128-5.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.68.128.5])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-46c873de559sm67648981cf.78.2025.01.15.11.12.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jan 2025 11:12:41 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1tY8oi-00000002pPE-1jhH;
	Wed, 15 Jan 2025 15:12:40 -0400
Date: Wed, 15 Jan 2025 15:12:40 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
	Joerg Roedel <joro@8bytes.org>, Yong Wu <yong.wu@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Heiko Stuebner <heiko@sntech.de>,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linux-rockchip@lists.infradead.org
Subject: Re: [PATCH] iommu: Use str_enable_disable-like helpers
Message-ID: <20250115191240.GA650389@ziepe.ca>
References: <20250114192642.912331-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250114192642.912331-1-krzysztof.kozlowski@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250115_111243_571424_26F7B23D 
X-CRM114-Status: GOOD (  11.84  )
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

On Tue, Jan 14, 2025 at 08:26:42PM +0100, Krzysztof Kozlowski wrote:
> Replace ternary (condition ? "enable" : "disable") syntax with helpers
> from string_choices.h because:
> 1. Simple function call with one argument is easier to read.  Ternary
>    operator has three arguments and with wrapping might lead to quite
>    long code.
> 2. Is slightly shorter thus also easier to read.
> 3. It brings uniformity in the text - same string.
> 4. Allows deduping by the linker, which results in a smaller binary
>    file.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 3 ++-
>  drivers/iommu/arm/arm-smmu/arm-smmu.c       | 3 ++-
>  drivers/iommu/mtk_iommu.c                   | 9 +++++----
>  drivers/iommu/mtk_iommu_v1.c                | 3 ++-
>  drivers/iommu/rockchip-iommu.c              | 3 ++-
>  5 files changed, 13 insertions(+), 8 deletions(-)

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason

