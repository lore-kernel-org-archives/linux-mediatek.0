Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00081FD0654
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Mar 2026 08:18:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:References:MIME-Version:In-Reply-To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VMyK3IS5T6zxlAyxIjDbuz0vXCcz+wF1tKyL7SCLe18=; b=SIABHfmVmLVg/2PA6jRmf4v7nB
	uQ9JXgQL5zQZp0YFDqEW+MvtVPbB+3VJLB5ig1R2PnGp3Lzo/WHxlBPcC+MT8Pfq7cYWAdAozVMUK
	2MsdzNCAzQZrNeJlZb/Z0GORqJZdCQjtcbafWxe1ESlXAPpgtUNx4+5HDdcsC5D0o3dVcBvbHAjpZ
	WDJvqKAGKETz8Buo5jQN2SUqqGLWacE+lG6qP1WL76XnMDTkE8haovOwB2ozVzS+9ezTnzMJeMFEk
	Lg2quTTHO4Zgl8bh949wg0hAxYgqZYt6BZNvk7uDhgXjw0aO+ru3p9zlUYz9BO/DZFI2JBG96PXC2
	Ti5hRBWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0EmA-0000000B9Qd-0Jao;
	Wed, 11 Mar 2026 08:18:42 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0Em8-0000000B9Ot-3HSt
	for linux-mediatek@bombadil.infradead.org;
	Wed, 11 Mar 2026 08:18:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:Subject:Message-ID:
	Date:References:MIME-Version:In-Reply-To:From:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=VMyK3IS5T6zxlAyxIjDbuz0vXCcz+wF1tKyL7SCLe18=; b=I4LepfbtvBUWzHdp8xx75xK5sT
	adehQTB/J9b3m0gk4n3vioVEzCn1YxlXMyBbUs4xFURxuP8Hb6Vmnx1Tx1Su2cn4pUXl0clJqYrGW
	VTCWVoeeuktCmy54tk9mDRkmLNm8i4V61Ybi07j4mO+HkaGoIHmylvhc4Te1ssHjYVS2BROTHsVc/
	DuV6/hcupuovppI/cFrEIVDL5Z15N/3YsnDbN9qzlwt8EV1RfY/hMC+TYR2V67AecRKqZudOGctdB
	RZtxgwH6XNmqh9HapisOJTrSHK+wPm3aTUhl7jiCEidiNoddt+pyFrqemvQeUzrYX5f0OHaGFcu/z
	GF6cC4rg==;
Received: from sea.source.kernel.org ([172.234.252.31])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0Em5-0000000GNiJ-1Rb2
	for linux-mediatek@lists.infradead.org;
	Wed, 11 Mar 2026 08:18:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 8120D4419E
	for <linux-mediatek@lists.infradead.org>; Wed, 11 Mar 2026 08:18:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63841C4AF0C
	for <linux-mediatek@lists.infradead.org>; Wed, 11 Mar 2026 08:18:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773217115;
	bh=VMyK3IS5T6zxlAyxIjDbuz0vXCcz+wF1tKyL7SCLe18=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc:From;
	b=AY8w696yEP+6mEwc6/HColfyucfQEbXQAt7Np1VSggSOqvS7PO9OEbe0hYQUrCyKX
	 eZPX2MJ+bzsBEKL3KS3f6UMpox6OvRKewny/xkj/taxq/flfKWMiccMfmah+AfEzfk
	 ENx11MhDdjzWJZUia0PppoSj5BAklN3TxnV422JQUD/+Wb6RJ+Ykw8RiKrFi5bBJzI
	 mFA6OEQ/a6Os1Ja9Qf+2mij6u08AmNgL8q0B8rY79na4d9PCPV7R7iB5SiGKgXKfG8
	 xxILeDiE/d9fVqPS1U6+IBpEipNnzeskZtKmItwqYb10QtUAfAD2spUq4+UW9IJful
	 yiwLa7GbYK6BQ==
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-38a4118c4f7so57641871fa.2
        for <linux-mediatek@lists.infradead.org>; Wed, 11 Mar 2026 01:18:35 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXaLN3NNvaZGsR4QB9fFoz779t2L1cFDVo+1YPWktF4bD092ZkvCmOl3yA1So8Qt7GxhR8zG33vdc6M3J/FYw==@lists.infradead.org
X-Gm-Message-State: AOJu0YyGrBINH5d6tCXMYjvFIxriBm31vc4f8FiLYcOb7V/MNurc59uM
	J1qq6v+FmFRfx1l3ywN4OIuqb+qXWLQK9VKnXmzJIGHno3TSm89egfPU3I8kQE18c0ba9TqgwCV
	SLHzz/a1vK5ViNo6oh2dflsWirPj/nier5GgfMf982A==
X-Received: by 2002:a05:651c:1473:b0:389:fe21:b33f with SMTP id
 38308e7fff4ca-38a67dca8d3mr5036661fa.1.1773217114053; Wed, 11 Mar 2026
 01:18:34 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 11 Mar 2026 01:18:33 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 11 Mar 2026 01:18:32 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260311075223.3303497-3-wenst@chromium.org>
MIME-Version: 1.0
References: <20260311075223.3303497-1-wenst@chromium.org> <20260311075223.3303497-3-wenst@chromium.org>
Date: Wed, 11 Mar 2026 01:18:32 -0700
X-Gmail-Original-Message-ID: <CAMRc=Mf4eCuFGGgNnBhAWRhuQ26bu_qAFbiMKx357YURA=WBDg@mail.gmail.com>
X-Gm-Features: AaiRm52ewAr7cB4TbZMKbPsFbSjM9f61VT5h7rFCrr-CoxcEKiAxT3uydDGdJfM
Message-ID: <CAMRc=Mf4eCuFGGgNnBhAWRhuQ26bu_qAFbiMKx357YURA=WBDg@mail.gmail.com>
Subject: Re: [PATCH v5 2/7] PCI: mediatek-gen3: Move mtk_pcie_setup_irq() out
 of mtk_pcie_setup()
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, linux-pci@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Bjorn Helgaas <helgaas@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Ryder Lee <ryder.lee@mediatek.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	=?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260311_081837_962447_0A66383E 
X-CRM114-Status: UNSURE (   7.42  )
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

On Wed, 11 Mar 2026 08:52:17 +0100, Chen-Yu Tsai <wenst@chromium.org> said:
> mtk_pcie_setup_irq() just sets up the IRQ domains for PCI INTx and MSI,
> and chains them to the controller's interrupt. It's not really related
> to the setup of the actual PCIe controller.
>
> Move the mtk_pcie_setup_irq() call out of and before mtk_pcie_setup(),
> and add a proper error message for when it fails. Reorder
> mtk_pcie_irq_teardown() in the remove callback to follow. Also create
> an error path in the probe function.
>
> Suggested-by: Bjorn Helgaas <helgaas@kernel.org>
> Link: https://lore.kernel.org/all/20260309215056.GA603013@bhelgaas/
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> ---

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

