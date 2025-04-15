Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE799C369AB
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Apr 2025 06:20:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oTt43XJFM8d74lWj5+YE+mCHEBEmob8rG+QikYcC3hM=; b=1ZGA32S3V14zMDAVmqP5SOGxR1
	hhvIduV8tQ282ssQwzqa6EpCqZw/6P4KnPDuEAz9x/eb0Fxli3tfmmISDiMA/BW5AtuxThoG2bVHw
	XH9RkCuZwaqWwEXOKpkhTV0zvWKK24voiCiI8QMpuNiHcSm/MRtTetn1M1ET4k7npZBaIUA/6AP1R
	pHNZygoPrHegk4uMcxHRm5WDMKhuSctIhSMdEbSKHdcbbf1RKLCSALcVdfaEc9CAE9ZcqkNrYTNkx
	CPRdKkhHvn2H3MQAniq9jMJCt7P0W7VO3hlWUZkDcFpICUT+iYui3k+6ZnquurjEjr+dK9l3cazYG
	RkQlO11Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4ZfE-00000004eoj-1mmF;
	Tue, 15 Apr 2025 06:20:56 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4ZfB-00000004ens-1ZB0
	for linux-mediatek@lists.infradead.org;
	Tue, 15 Apr 2025 06:20:54 +0000
Received: by mail-ed1-x52a.google.com with SMTP id 4fb4d7f45d1cf-5edc468a7daso646895a12.2
        for <linux-mediatek@lists.infradead.org>; Mon, 14 Apr 2025 23:20:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744698051; x=1745302851; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oTt43XJFM8d74lWj5+YE+mCHEBEmob8rG+QikYcC3hM=;
        b=kULbMQMbOJ0srNJXBXk5vbsME+h1ISijKCOyvTaUHFRUhDGlV8rUDKT2Sd5KpAHiZK
         P9urYIjW+1f7q6ZmgQKEtY0Mtuc8lQOkdQDo8DakVKk19gn7XoJ89/f5niM7zG/pVJO7
         hXwI7XHJ5br1CYE6t/h5ZF51/pWOF8VCf/8AkB3Q+KESi83tCKK6ylErjABPr3pHWYPU
         SB61aX/vtElim0HSfO6XFwBTe+KOsZOIsyR2k05KEGQIYi5WCm8EyGpoVV/GGDVKU0wu
         jl1B9+/xM12vrhrCuJOoKyYTbRSIdPMUW5W83qBTPQjPcR6h5/Wq9/aYgHysu1HNayRE
         S3Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744698051; x=1745302851;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oTt43XJFM8d74lWj5+YE+mCHEBEmob8rG+QikYcC3hM=;
        b=nKPPXabhfkSxlQIsCPr0pGE5goEreP78dmA+jVoWybSXFn3OgRmkzvSpPnlfgEMaP6
         dhBlown8pDbmh7HlHCD7s0hLarrnVRb72k7a9PHb28FMaqRQtrMWfejYQsauOI95M2E4
         wePmlbk7wHPF3x/0XiSokz5AiiegR/Ob2hHaGEAUfI61J0ycYLkvPt9nSjzcDbf6GIe6
         XtWjtxRmLW+/UYhSx6aueOtlktHeYsf7Q5yLJQDi9PYTl0ObPkB1SBRWAxzrUPHnbjoR
         YNUsxiwzKGC4uFALtvV6Lb9SumUZHOf4wrLDWKP8vQipBHqzXC1ZD4fS1PqIgZTTmj/R
         7XEA==
X-Forwarded-Encrypted: i=1; AJvYcCVt9/SKNJkIagaXrUSigQ9kg1HiqwVKSYUQxuhYNd0GYww/q2glIgK516ajc1hnQRXAHeKsRj4/axc3BHxk4w==@lists.infradead.org
X-Gm-Message-State: AOJu0YwLfPD5OtBvHYgMgUDGqMt7bpnLWAdSxyJwyJoryFFzEgQuCAy9
	fp65xogN/f7vquboRJfIeOSIudjOLZgi7BYYOuOIoo4FMRae1ejoUOfT+aMUQIg=
X-Gm-Gg: ASbGncvo9faGJbR+lxbXdHyrD1i+qZxhCKdmszkxxu5YIl2GVUvj7pSB5IVBn0z0hpM
	Xad5N++uNskBSBFLN3IAG1ajO1+3iOQzjUsZxv3lmhld49cR03yVUZaTHBcD6FCb343+cdx28A1
	1fjUC4Y0iNopKdxD6KTYhdFf6Sr0W2dZ2QEIFoNLCpcMpg7LRbOj7ai8OiomCyqSxe4flto0CnC
	ZQ/QI2I9vVt96WSLVBwLuNhJNPI1FyoSJt+lXwPQov1XbZql8DoB1fsSHYddSNAgH4v8+w0S0Ar
	rHIACJoIv8k7jtV3HSzt7bBWfG/xaPUq5+m/1wxC35FwPuDud9wHJSCCwQmJ7+FdvmnWDh+qrfc
	071gv7WpFDT+fe6E=
X-Google-Smtp-Source: AGHT+IEN0ddkfxeUgfcu3uOUBPG5D5WB3HL16m1L/qkNsUmiRD8iOuxqK/rPwSxrQiytFN9HNB8I7Q==
X-Received: by 2002:a17:907:bc87:b0:ac0:b71e:44e0 with SMTP id a640c23a62f3a-acad34d87admr480746866b.9.1744698051564;
        Mon, 14 Apr 2025 23:20:51 -0700 (PDT)
Received: from [192.168.1.26] (46.150.74.144.lvv.nat.volia.net. [46.150.74.144])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acaa1cb4129sm1053861866b.98.2025.04.14.23.20.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Apr 2025 23:20:51 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: yong.wu@mediatek.com, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: krzk@kernel.org, robh@kernel.org, conor+dt@kernel.org, 
 matthias.bgg@gmail.com, linux-mediatek@lists.infradead.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, kernel@collabora.com
In-Reply-To: <20250410143958.475846-1-angelogioacchino.delregno@collabora.com>
References: <20250410143958.475846-1-angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH v1 0/2] MediaTek Dimensity 1200 - Add SMI support
Message-Id: <174469805024.15476.6855555365246052771.b4-ty@linaro.org>
Date: Tue, 15 Apr 2025 08:20:50 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250414_232053_443032_6AEE15EA 
X-CRM114-Status: UNSURE (   7.33  )
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


On Thu, 10 Apr 2025 16:39:56 +0200, AngeloGioacchino Del Regno wrote:
> In preparation for adding basic support for the OnePlus Nord 2 5G
> DN2103 smartphone, this series adds support for the Smart Multimedia
> Interface and Local Arbiters of the MediaTek Dimensity 1200 (MT6893) SoC.
> 
> AngeloGioacchino Del Regno (2):
>   dt-bindings: memory: mtk-smi: Add support for MT6893
>   memory: mtk-smi: Add support for Dimensity 1200 MT6893 SMI
> 
> [...]

Applied, thanks!

[1/2] dt-bindings: memory: mtk-smi: Add support for MT6893
      https://git.kernel.org/krzk/linux-mem-ctrl/c/98a4109320f9b7007475a9d6706d3434cd8aafb4
[2/2] memory: mtk-smi: Add support for Dimensity 1200 MT6893 SMI
      https://git.kernel.org/krzk/linux-mem-ctrl/c/bd4f5f6c84d074d9347b55731891729f136d35c8

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


