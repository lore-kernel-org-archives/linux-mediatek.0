Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89F5BCD3435
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Sep 2024 13:47:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YVOZDWCkI5gq5GT1DRRpnaiGf/P82/ZwGLvkG+VkGdw=; b=bf1gpUTQGX4jBattS4BhCbJmCF
	P5Onu7Q68C4G0iT3qaTKXmeTU4f4EjER+I5F5xmksotLYu3pxncYJOZCs/5z+6u2R6R7WhAhiTH2u
	DVLh48lteniJtgD1+OAwSihlADYA5K/1BxtsmiDQW3UHDOlDuip8uVVzw96DaQfTxVujPiBBTRdZh
	iRW8c0g2892ukCIivWkQB3fsTl/PBOKiUyz49PL8rqZO2hePCOriPOurmqd3S6zH1ueB1ES3ikfD0
	xgt74zM1ERTNQddDEKpEtzWK6u8m0xHQ+lXwk8tnM8UFhU14XwuNJ6fUK+OwFkoUQ25A8f7Tu1t86
	IfwKMUUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1slTsX-00000000Q1b-13Dl;
	Tue, 03 Sep 2024 13:47:29 +0000
Received: from mail-pj1-f49.google.com ([209.85.216.49])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1slTsU-00000000Q0Y-2Cc4;
	Tue, 03 Sep 2024 13:47:27 +0000
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-2d86f71353dso2889815a91.2;
        Tue, 03 Sep 2024 06:47:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725371245; x=1725976045;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YVOZDWCkI5gq5GT1DRRpnaiGf/P82/ZwGLvkG+VkGdw=;
        b=phn9gOa3Y15aw2hAdy2N79v7BlUv/CqFlisbujEw0egwGg9bT4vCy6bgF4Ev19+19e
         kDWOnAUfxWMUbGt/dDGd2gvIyKOgvQ4w0U8YESP70hjGfCR9OezAG63pjb5Shxsnlr2f
         6QbHql7W3LREpCte13YBuu9I3EsXGyTV5GdRhB3uxDla8F5v3jc6Vyax9felttBK4SJL
         Fgd32vzkClGbvM7IpIDmPEqnU3cR+JrNzYbk18NRPOa9F5F8bcLdeEyfr4Im/CH5zlNB
         rJpUtUvuT764SsWTfgDlKLM+gxottENXNMI4eZnHHhq/QpYq/8Y5hCeP4DCKTazyJgyl
         pJVA==
X-Forwarded-Encrypted: i=1; AJvYcCVLLdyexpwlAMV5qfMW3xMiKSRfxtXZCEPEP5aV32k/MYfRImCLrOdRy4J/viQ2eAfAoGe0rjrwftppfEPIGK3p@lists.infradead.org, AJvYcCXG5cX+LcRmnfDtvKYY02MnrPk8ZNAXpMG2GOEO8mqcF0s0xKUT+6Nd2rSSuO732MzgsWTjVZLgo2x7AHA6RqI=@lists.infradead.org
X-Gm-Message-State: AOJu0YxHBMIeAfOTmjDVlKevDkG3DAwOtmZXZ0wv3A3bWB/wkzkxc7qQ
	o52Px0jhtgI4u0B9yoskmYi5ZKoM0nthCHH190EM5NcNdn6OgKtJ
X-Google-Smtp-Source: AGHT+IEhaO74x3D7NZ/N03KAk2Xu+dCACB1T+nWArP6VhDK7YxC8h/t/H6iyXhI45/BoQU/aoKy7DQ==
X-Received: by 2002:a17:90b:1083:b0:2d8:840d:d9f2 with SMTP id 98e67ed59e1d1-2d8840ddbb7mr13352021a91.24.1725371245433;
        Tue, 03 Sep 2024 06:47:25 -0700 (PDT)
Received: from localhost (fpd11144dd.ap.nuro.jp. [209.17.68.221])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2d8edb8d4ccsm1328458a91.1.2024.09.03.06.47.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Sep 2024 06:47:25 -0700 (PDT)
Date: Tue, 3 Sep 2024 22:47:23 +0900
From: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Lorenzo Bianconi <lorenzo@kernel.org>, linux-pci@vger.kernel.org,
	ryder.lee@mediatek.com, jianjun.wang@mediatek.com,
	lpieralisi@kernel.org, robh@kernel.org, bhelgaas@google.com,
	linux-mediatek@lists.infradead.org, lorenzo.bianconi83@gmail.com,
	linux-arm-kernel@lists.infradead.org,
	krzysztof.kozlowski+dt@linaro.org, devicetree@vger.kernel.org,
	nbd@nbd.name, dd@embedd.com, upstream@airoha.com,
	angelogioacchino.delregno@collabora.com
Subject: Re: [PATCH v4 0/4] Add Airoha EN7581 PCIe support
Message-ID: <20240903134723.GB1403301@rocinante>
References: <ZsRX-Hrn2fCITK4P@lore-desk>
 <20240820140133.GA207494@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240820140133.GA207494@bhelgaas>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240903_064726_585174_867CC267 
X-CRM114-Status: GOOD (  10.98  )
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

Hello,

> > any update about this series? Am I supposed to do something? Thanks in advance.
> 
> No need to do anything, I think Krzysztof will likely pick this up
> when he has a minute.

Everything looks good!  Bjorn, should be able to pull it for 6.12,
hopefully.  Apologies for the delay.

	Krzysztof

