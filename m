Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79690C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 25 Feb 2022 19:34:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TcLM3wQ7ktXF5pp0ei0UulKV5yf86GGnR783EeQy6Dk=; b=RpSrEVfgxHwcp5
	sJ+j67Je43RUJdE2TESJah4T0a23KYGx2c3XYMW4gRkZpPYQ3q9PkDsH6RrQUq68NjMsnn+X4NqxL
	zrypW9Qy73EpgA6y4dPOHlcRSYWvAI2nmN24PzA30+G3xldWah3d/VN0cWWEQyEWz7+TMR8NCF+E/
	Rvea/eR2GPwQMP2kmt6NnUjddDAqeBPKc+rx5ohML/+6i+nTGvEsNh+BQLq8yPeMaw+A9iPY7Yt9K
	CeXJ29y1EiKAy8U8FiH2S+5SK5IzIpzKSMWAcDvVYk+4B66mQFU23swSJuiSGdV8HYSBSq0wmCVoq
	nnf2xwNBEGKifixtaZBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nNgMH-006pEw-TU; Fri, 25 Feb 2022 19:34:29 +0000
Received: from mail-oo1-f51.google.com ([209.85.161.51])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nNgMG-006pDS-26; Fri, 25 Feb 2022 19:34:29 +0000
Received: by mail-oo1-f51.google.com with SMTP id
 r41-20020a4a966c000000b0031bf85a4124so7779601ooi.0; 
 Fri, 25 Feb 2022 11:34:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=UICPO9Om+OjZbYZvV1eE9LFKzgVcG+7qGH6VjnvkKI8=;
 b=YZoDn6u+6ZYK1DZaND+YyKMCBR+Q0clWVdBooxvgH/VHPCgkruCJVdBIwffNatOgUT
 qZLmBE5I+0/uPKlzgqhUVlziXuQ9SZrfQwq0WsRkCU3exL8h/AM2yvh3Pv29uLBBetBs
 rmpFS+dGQ0WOBtiNI3p0Moz9jD8axCYoMPlDZ6vnVrxVPoK41TXRXM+n5TJZVq4+Z5XT
 epuiqx2fd9eB2S4h49Ub/NhMLSsxeD8KeqdN2Wt2bxnp0M2nY7t/orUu+pft1EP1VZD4
 ThOCfR/6YYYQFppBzss7NkyTSokCGjK+NH+DhhfOaMy4MLjuZ4JWEQMVrxdAfZ5XQGHt
 horA==
X-Gm-Message-State: AOAM531xXRi/LkIG3QxvWyjeDjXtZOXfVHjRH9J6s1Uq6eNKXWR0px7O
 DLmM2JDbRodmZTI1uDiOEQ==
X-Google-Smtp-Source: ABdhPJyOmdG3rl+cOnFKAoGP1Z8WrEkO0FitJjYvk9EWfzGhRJ2baL6iZ1iEjArJAHpRjo6HZhDxAg==
X-Received: by 2002:a05:6870:9a03:b0:d6:f261:4d04 with SMTP id
 fo3-20020a0568709a0300b000d6f2614d04mr1194467oab.161.1645817666852; 
 Fri, 25 Feb 2022 11:34:26 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213]) by smtp.gmail.com with ESMTPSA id
 l12-20020a056830154c00b005af943e7a4asm1515000otp.71.2022.02.25.11.34.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Feb 2022 11:34:26 -0800 (PST)
Received: (nullmailer pid 1300164 invoked by uid 1000);
 Fri, 25 Feb 2022 19:34:25 -0000
Date: Fri, 25 Feb 2022 13:34:25 -0600
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc: linux-samsung-soc@vger.kernel.org, Alim Akhtar <alim.akhtar@samsung.com>,
 Wei Xu <xuwei5@hisilicon.com>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, devicetree@vger.kernel.org,
 "James E.J. Bottomley" <jejb@linux.ibm.com>,
 Yaniv Gardi <ygardi@codeaurora.org>, Jan Kotas <jank@cadence.com>,
 Nishanth Menon <nm@ti.com>, linux-mediatek@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, Vignesh Raghavendra <vigneshr@ti.com>,
 Avri Altman <avri.altman@wdc.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Tero Kristo <kristo@kernel.org>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Li Wei <liwei213@huawei.com>,
 Rob Herring <robh+dt@kernel.org>, Stanley Chu <stanley.chu@mediatek.com>,
 linux-scsi@vger.kernel.org
Subject: Re: [PATCH v2 06/15] dt-bindings: ufs: hisilicon,ufs: convert to
 dtschema
Message-ID: <YhkvQXomgBnyYF0g@robh.at.kernel.org>
References: <20220222145854.358646-1-krzysztof.kozlowski@canonical.com>
 <20220222145854.358646-7-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220222145854.358646-7-krzysztof.kozlowski@canonical.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220225_113428_155831_56E0AA61 
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, 22 Feb 2022 15:58:45 +0100, Krzysztof Kozlowski wrote:
> Convert the HiSilicon Universal Flash Storage (UFS) Controller to DT
> schema format.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> ---
>  .../bindings/ufs/hisilicon,ufs.yaml           | 90 +++++++++++++++++++
>  .../devicetree/bindings/ufs/ufs-hisi.txt      | 42 ---------
>  2 files changed, 90 insertions(+), 42 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/ufs/hisilicon,ufs.yaml
>  delete mode 100644 Documentation/devicetree/bindings/ufs/ufs-hisi.txt
> 

Reviewed-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
