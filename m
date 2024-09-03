Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6775DCD3435
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Sep 2024 13:46:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kYOAtKnoAGXP2+8BC1os9BAhNBSXrRiYgGPXZKA41ec=; b=4gsqjLkO7z6sVzVoSZoctxfEiH
	hFfHOe3/CdVMTsvRYcN+GC4WkT2IbeQbI0Y2iBSC9S8jUIDrPYCkHQJ8U28kwlfacZNgfn7zwcgqD
	uKXPe536UdN1JswQavKYPaMDz/HiXReGFeXplJaR2uxgpqNmfvXRhPElUXApny59niM8jVqrapNQa
	840XkxPh9YD4Qy7FR77fhzUhyqcFju7qtiW3T7YlOn6vJg5bUtXD1gWbvZuXrB4Q4kHIm0s66WxJP
	yXbRojiDFayMcfbj1x6ZIw7hk8T2I7eccypieCbuUzu5A+Sw6VoXG3GmenaDZwAbPVlX0OQnepMyq
	UFZYOxvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1slTrb-00000000Pp0-1RkD;
	Tue, 03 Sep 2024 13:46:31 +0000
Received: from mail-pf1-f181.google.com ([209.85.210.181])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1slTr1-00000000Pk8-1iUa;
	Tue, 03 Sep 2024 13:46:22 +0000
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-71434174201so4337179b3a.0;
        Tue, 03 Sep 2024 06:45:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725371154; x=1725975954;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kYOAtKnoAGXP2+8BC1os9BAhNBSXrRiYgGPXZKA41ec=;
        b=nht+juu6Z1Ttr25NcE0op/sHcA9pjRICSWPfdNC41s1hdhJD/CWakAiOYyPk0AetpZ
         3J69CjayygVKQBRnlbPlcAsrMPv9bYAnp5ND669DwoQTICY311Vx+36cTry2iyEjNmLW
         ekdGablYnA2lpVxemZVGgc8+7j4UdKCVW2X/PUmnQcYOuv1R+J9gCwImwNYSHkKoD6y0
         SdgT6IFIc5ppiX8AWNcLQtHzSZuB/7DZca85QkQ6do0xVMywbZ8MzjSCreAy113m9DX8
         KJqJ8ZW5VG/B5a+ABmRKoa69+PWxq8OwR4QOl/JjBkeY/j1RfFqPbvsjoWwju2g36jdd
         np3A==
X-Forwarded-Encrypted: i=1; AJvYcCU4/I/AU2Wzw6695c3YmZNFIGDE7y3h1hsP5anx/BK7ykoKjNjID8n4n+f7KGdUTPSKQBVSOM8vF1ls8MClaOc=@lists.infradead.org, AJvYcCUgqBt7k3RRBH4tPaGZIxJqaBAueSddNk7M0KoE++iyseSroxmXSefGjjx7fsNZi35OcrqjoN8QgjywybdXMNHE@lists.infradead.org
X-Gm-Message-State: AOJu0YwzHklgROC4EdceJrJIzqXeWzxyuXFvadCP9oiZICAiVnVt17IQ
	jzoMUQmHTKGCqg5UvALpo5c7zpEi8JifpFXuOtbfSHDmd8SULJPE
X-Google-Smtp-Source: AGHT+IFRTbt4L+MgTBuRglEwGKCkDyb1NmD5ZyL59zHUq7QvBrYsy/ljTjbd2mFlKvLYwZfhOb4dgA==
X-Received: by 2002:a05:6a21:e91:b0:1cc:cdb6:c10c with SMTP id adf61e73a8af0-1cecf757e4fmr14195523637.37.1725371153943;
        Tue, 03 Sep 2024 06:45:53 -0700 (PDT)
Received: from localhost (fpd11144dd.ap.nuro.jp. [209.17.68.221])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-715e5576d0esm8538780b3a.3.2024.09.03.06.45.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Sep 2024 06:45:53 -0700 (PDT)
Date: Tue, 3 Sep 2024 22:45:51 +0900
From: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: linux-pci@vger.kernel.org, ryder.lee@mediatek.com,
	jianjun.wang@mediatek.com, lpieralisi@kernel.org, robh@kernel.org,
	bhelgaas@google.com, linux-mediatek@lists.infradead.org,
	lorenzo.bianconi83@gmail.com, linux-arm-kernel@lists.infradead.org,
	krzysztof.kozlowski+dt@linaro.org, devicetree@vger.kernel.org,
	nbd@nbd.name, dd@embedd.com, upstream@airoha.com,
	angelogioacchino.delregno@collabora.com
Subject: Re: [PATCH v4 0/4] Add Airoha EN7581 PCIe support
Message-ID: <20240903134551.GA1403301@rocinante>
References: <cover.1720022580.git.lorenzo@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1720022580.git.lorenzo@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240903_064555_467710_55FCA073 
X-CRM114-Status: UNSURE (   7.16  )
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

Hello,

> Introduce support for EN7581 SoC to mediatek-gen3 PCIe driver

Applied to controller/mediatek-gen3, thank you!

[01/04] dt-bindings: PCI: mediatek-gen3: Add support for Airoha EN7581
        https://git.kernel.org/pci/pci/c/c6abd0eadec6

[02/04] PCI: mediatek-gen3: Add mtk_gen3_pcie_pdata data structure
        https://git.kernel.org/pci/pci/c/dc869a40d73e

[03/04] PCI: mediatek-gen3: Rely on reset_bulk APIs for PHY reset lines
        https://git.kernel.org/pci/pci/c/ee9eabbe3f0f

[04/04] PCI: mediatek-gen3: Add Airoha EN7581 support
        https://git.kernel.org/pci/pci/c/f6ab898356dd

	Krzysztof

