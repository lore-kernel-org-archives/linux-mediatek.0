Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89D01CD691E
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Oct 2023 09:46:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9AzK0Jn8j50sYUoIlyBZPBQKUpXRiNLcb1+hkJS1Ku0=; b=wL9PQuD+qX1yekWJgmTcB2JBUo
	aKMbPuVaUol+UQHwvrdmAABA8rGOQDLcfeHK9ZFUJiKUu+IO6+Ch7LC0qMHMIS5ulwpQ2xDy1RjQz
	0qIz+mczmq1J2+P9hF0+lW99ZlxUddSKoRQpTGoTYIOyeCyrSu0EvQ1fLpiUeI2E8hn51atoHoTiG
	DWMUT4w8v8LuFAOJMCNwJHgwSjATnBHKtNyTYhVVxWQqk1iiFIzKjYcnaC+0KLB7ILyGPe9lXMW1i
	uiuAmzxuykisbZJ6jX9XHNK+fN1L2y+ZPxQLpx5emCI1KXz3fogXHTbT8yBwEmLyfXUn0GgimD+xx
	AZa3IyNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qq9JV-00Cy4g-1l;
	Tue, 10 Oct 2023 09:46:05 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qq9JQ-00Cy3Z-1w;
	Tue, 10 Oct 2023 09:46:03 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 648956607243;
	Tue, 10 Oct 2023 10:45:58 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1696931159;
	bh=6H9Fj2tHWKm+K4ZGzGla2mVcICa34lDD8nktakutjLo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=BOV1amVx1RHjJcfG/Juc7idTOADT5dPAhDeFPXtCHpZEG8Hikn6RKf4HB2LHgMEsK
	 2KAASVv/MZIKZV2hqNAQZftl+QQbgLJm6Qu0Xd3IFngyIS45lZ4e820Lfv4cvrTQVd
	 5gDF60go4lFLlGcBBXM8hwd1eHZzUpOYpIeRtmIV/ZjZh7h1cCsmvvk+3/mk9OCQdx
	 QMOrwfMs8fYy/xlxVxnuZC7fgfLpuiCmGHQthYja4UUFiUZkx/kCVqDrixf6ifSgXB
	 myjaI7Xog2MF1g0M4uJwdi09kmwsr8FfXemLQ2KriBgBIzKq0dcS3Rq38evxPFbm4z
	 GwF5ozFb0IUMQ==
Message-ID: <50bb99ee-8ef3-343e-7359-526662f511cb@collabora.com>
Date: Tue, 10 Oct 2023 11:45:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH v3 1/2] dt-bindings: PCI: mediatek-gen3: Add support for
 controlling power and reset
Content-Language: en-US
To: Jian Yang <jian.yang@mediatek.com>, Bjorn Helgaas <bhelgaas@google.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 =?UTF-8?Q?Krzysztof_Wilczy=c5=84ski?= <kw@linux.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Jianjun Wang <jianjun.wang@mediatek.com>, Rob Herring <robh@kernel.org>
Cc: linux-pci@vger.kernel.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Chuanjia.Liu@mediatek.com, Jieyy.Yang@mediatek.com,
 Qizhong.Cheng@mediatek.com
References: <20231009084957.18536-1-jian.yang@mediatek.com>
 <20231009084957.18536-2-jian.yang@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20231009084957.18536-2-jian.yang@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231010_024600_796535_FD7AB7EF 
X-CRM114-Status: GOOD (  14.14  )
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

Il 09/10/23 10:49, Jian Yang ha scritto:
> From: "jian.yang" <jian.yang@mediatek.com>
> 
> Add new properties to support control power supplies and reset pin of
> a downstream component.
> 
> Signed-off-by: jian.yang <jian.yang@mediatek.com>
> ---
>   .../bindings/pci/mediatek-pcie-gen3.yaml      | 30 +++++++++++++++++++
>   1 file changed, 30 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml b/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml
> index 7e8c7a2a5f9b..eb4ad98549d1 100644
> --- a/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml
> +++ b/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml
> @@ -84,6 +84,26 @@ properties:
>       items:
>         enum: [ phy, mac ]
>   
> +  pcie1v8-supply:

There are another two controllers having such regulators and they all have the
same name for those supplies; Can you please change the names to be consistent
with the other controllers?

vpcie1v8
vpcie3v3
vpcie12v

Regards,
Angelo



