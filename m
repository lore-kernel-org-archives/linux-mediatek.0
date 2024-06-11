Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05E2EC25B76
	for <linux-mediatek@archiver.kernel.org>; Tue, 11 Jun 2024 10:27:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DUFnmZgSjbyGTvh/ZeQv0nxi/lfK+eX2NuIWKKZBPzA=; b=rIAZCy3wYo1DSmBPcra6LDP8QG
	Yy5SLGg6ATu/+eS8Xps4lvVPvdthRCCYX7Jpr0QnlKI/+5mJkn0CR66WnyPKv0xEdq53kCPZGq4Js
	Vo4mdMdVW+1fgWzw+BMyz1yI6jfrxfA65P/dcwtCvJpnlutYXl+lIJNTJ6ES2deUfkgr79UNAu4+x
	TIn70Mw+Mfzvk2PtvzbXzko/EvfeQkw8TuD8Osfo+RxQl10Xqfe6OltDi53f2wF6N1Dx+ZckzD7eR
	jumj7sWCKIcLvgjpfPcZhHw29lwTC2oZFj3qo2yJbQyODziffBESdwOKFq1Nv6XR7xAGZzJM7eUxP
	ZaDeIz2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sGyie-00000008RYU-2Aq7;
	Tue, 11 Jun 2024 10:27:12 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sGyia-00000008RXL-2w99;
	Tue, 11 Jun 2024 10:27:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1718101626;
	bh=YjCgBc+r+06nJ6IVpW13RFBeFFzWdG5LhXvUogE3Vjo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=T1wzQjsnI/PhpuS+7t5fBwGZr6+q2ZAxBqLXqQMriXE7BFH57QT/sDcseACk0hDbf
	 mHUK99ISk7TYaw9IvJz4Xm7/Msho3y10Pk6CMVUBQYEqCG+1Ej59FukA/UQ5wJFC8I
	 oVoWIgnJte49b4dtn9P85C2PivUVwZocQfrRDJ97i8rroBx750ogE3mmEFdPUBqUjJ
	 i/LBCZuyz+fTPYHH1Ff1dXDOYKvtyP418oMSiCapdk2sHf7eX/KpklshnpPfaOlRlU
	 C8MdxapQvg9t/dnqMlIFQZwAoQOn2tna9za2GKGJjRbmIruV1oX/VQrIVf6Pc9G1yr
	 T45pI9gg3cHSA==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id D799237804C6;
	Tue, 11 Jun 2024 10:27:04 +0000 (UTC)
Message-ID: <6d4173cd-ffe1-427d-ac04-bb9374b4b8d8@collabora.com>
Date: Tue, 11 Jun 2024 12:27:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] PCI: controller: add missing MODULE_DESCRIPTION() macros
To: Jeff Johnson <quic_jjohnson@quicinc.com>,
 Jingoo Han <jingoohan1@gmail.com>, Lorenzo Pieralisi
 <lpieralisi@kernel.org>, =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?=
 <kw@linux.com>, Rob Herring <robh@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>, Krzysztof Kozlowski <krzk@kernel.org>,
 Alim Akhtar <alim.akhtar@samsung.com>, Will Deacon <will@kernel.org>,
 Joyce Ooi <joyce.ooi@intel.com>, Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 Marc Zyngier <maz@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>,
 Jianjun Wang <jianjun.wang@mediatek.com>,
 Sergio Paracuellos <sergio.paracuellos@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Nirmal Patel <nirmal.patel@linux.intel.com>,
 Jonathan Derrick <jonathan.derrick@linux.dev>
Cc: linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, kernel-janitors@vger.kernel.org
References: <20240610-md-drivers-pci-controller-v1-1-b998c242df55@quicinc.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240610-md-drivers-pci-controller-v1-1-b998c242df55@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240611_032708_941711_7CF6B5A1 
X-CRM114-Status: UNSURE (   5.73  )
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

Il 11/06/24 03:04, Jeff Johnson ha scritto:
> When ARCH=x86, make allmodconfig && make W=1 C=1 reports:
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/pci/controller/dwc/pci-exynos.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/pci/controller/pci-host-generic.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/pci/controller/pcie-altera.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/pci/controller/pcie-altera-msi.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/pci/controller/pcie-mediatek.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/pci/controller/pcie-mediatek-gen3.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/pci/controller/vmd.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/pci/controller/pcie-apple.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/pci/controller/pcie-mt7621.o
> 
> Add the missing invocations of the MODULE_DESCRIPTION() macro.
> 
> Signed-off-by: Jeff Johnson <quic_jjohnson@quicinc.com>

For MediaTek

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



