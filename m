Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D5A3EFD206
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 Feb 2026 08:13:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:References:MIME-Version:In-Reply-To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yUGoA5Mdlzfvkphr1VZ4u6c5zcEyJv1/BZWrrk27NlQ=; b=i/FBTCwtS277cQSGDpzp2+4ITz
	S3Hu2hOdpM6b/oUwiVtajOyWr8k54KxRCjaFi4UBuWi2KhhP/yoEODViFimmJ3t09aJk2TV0Z9yyn
	iQ++tUDUzIY3kvU/WwccMB/RRkGjoS6z1brMCdarcJp7aZ61QtfKGMbRRbnXNKN5MYss5zs7WLqdR
	7kHF7eFR/GO0zIjNNzfV4eYD3n0bz9Zlv2zMT/ZhvVU7t6ckfr8t6vmk6qsq2Lx5cszH+QjU/M5ol
	gDe2CxSFk1AlAMoiK/lAIn55fQkcHhjXlo2USclsXpE9cPlOGMFYbD/qo7+sxiFmpz9jiZyBI5vpT
	Gmxust8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvA1n-00000003Txy-3PTP;
	Wed, 25 Feb 2026 08:13:52 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvA1l-00000003TxR-0Nh6
	for linux-mediatek@lists.infradead.org;
	Wed, 25 Feb 2026 08:13:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C474C4424E
	for <linux-mediatek@lists.infradead.org>; Wed, 25 Feb 2026 08:13:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0A03C2BC87
	for <linux-mediatek@lists.infradead.org>; Wed, 25 Feb 2026 08:13:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772007228;
	bh=yUGoA5Mdlzfvkphr1VZ4u6c5zcEyJv1/BZWrrk27NlQ=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc:From;
	b=a1KW1w1NP0SkuWG0/jC6/7GF6KsOUR1Jc9ooB1NefXY+vLKECYAtkuw/lpJC1kBLr
	 qWxlsEiZ6K/7HM4e3ba/q9fc3PZUw66mBnkKFiyc+gGc5sSExWeJn2JYWO5mEwM0p1
	 2kxoJHO8KuKScsV1zlm4CWaB2w98Dj4tjt5f7gxEtRebBvi7k96l+HKCa1DNOiDVOB
	 H2U2gQu9yrg42zKjkFMr35ODOv7oYVk+v0azDNLAfQf75g9AmJmW9D2Ry0vrVVxKbg
	 xpF+Ear+zia6bwdUAxT2XTjULZDAXj0GRRGhlFDc+DSPpMzCfLJ9jBPaRJB00CIVd/
	 pvONpBxcBy2pw==
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-59e62834439so7314025e87.1
        for <linux-mediatek@lists.infradead.org>; Wed, 25 Feb 2026 00:13:48 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCX5/vgAAIEzFOy5zGDZ33uI7xjdS74MkzDpoTs3xkSsTww8FTwQZJHDoJTLlkhG9oxs5dvlSJqpEmcuM0z8kg==@lists.infradead.org
X-Gm-Message-State: AOJu0YyZWZ14hvsIWCttTz7hoKdQW1jfbAkcFRT02BeVsha8GWjfkO/t
	3M4n348taYZSCa7iPe18QVormlmVbxBL3pbEtDTKC7zR0cfVJg7qSQ89RhsI41xbW76nm/dDoD0
	KLSHQdP8/YcBUTOU5OwlFxSObB6L/v2ZJC60YQ/JjHw==
X-Received: by 2002:a05:6512:4010:b0:59b:6d12:6bd7 with SMTP id
 2adb3069b0e04-5a0ed99fae0mr4879974e87.40.1772007227325; Wed, 25 Feb 2026
 00:13:47 -0800 (PST)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 25 Feb 2026 00:13:46 -0800
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 25 Feb 2026 00:13:46 -0800
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260225072225.3345307-4-wenst@chromium.org>
MIME-Version: 1.0
References: <20260225072225.3345307-1-wenst@chromium.org> <20260225072225.3345307-4-wenst@chromium.org>
Date: Wed, 25 Feb 2026 00:13:46 -0800
X-Gmail-Original-Message-ID: <CAMRc=MdH0_JVRLXtc8fWkdr1qMBERCc-kjp58nbyzhVuMnCgrQ@mail.gmail.com>
X-Gm-Features: AaiRm52AQF02eEDkSj7XKJdKxnJmEy0P3IRZQuLjGUKE0XqIuxZJ88cZvI40wzQ
Message-ID: <CAMRc=MdH0_JVRLXtc8fWkdr1qMBERCc-kjp58nbyzhVuMnCgrQ@mail.gmail.com>
Subject: Re: [PATCH 3/7] PCI: mediatek-gen3: Split out device power helpers
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Ryder Lee <ryder.lee@mediatek.com>, Jianjun Wang <jianjun.wang@mediatek.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Bartosz Golaszewski <brgl@bgdev.pl>, linux-pci@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260225_001349_147143_F36EF777 
X-CRM114-Status: UNSURE (   5.89  )
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

On Wed, 25 Feb 2026 08:22:20 +0100, Chen-Yu Tsai <wenst@chromium.org> said:
> Split out existing code that deals with device power sequencing into
> into helpers to allow cleaning up the error paths and integrating the
> new PCI pwrctrl API,
>
> This change is purely code movement.
>
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> ---

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

