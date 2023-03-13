Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7F15C61DA4
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Mar 2023 08:44:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=belhBBFe6e6zrwkZ/uONMoBKOQx9piug4tKXxgccGMg=; b=Mw1TLxObBtYdA0sfjm4AoEraAC
	4osqFuDeFtLpoPzzDjsQRNbxnCvAaal46oBPRUkrKFb8FEc75XsqCJvaqPLq/epCaXe4u77+A42Na
	hbBfh/pg9GAbutrbl54c2XDF+Vsr3xvPOa22HjTIZDkFeD2dtdAzJpyHcDGiScpqWa3lhr/kZ9H4n
	SYei7Ywwl47wbaIUfCOlHxUgVg06u4giy7ciBHbCyObxMFOR82wPeOgU66igdLfbzkazBTJgbBUcR
	8OerNqyUsWYkyO+UGW/obZB1sseJpZXGzCg9EbcPBSpYbP0UUMibEoi969OT/3lSPKkW75uqj9dRS
	IhqlJuzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbdmh-004oW2-VX; Mon, 13 Mar 2023 08:43:59 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbdmU-004oOx-Sd; Mon, 13 Mar 2023 08:43:48 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 901456602F64;
	Mon, 13 Mar 2023 08:43:41 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1678697022;
	bh=4665rYemk6A2Xust8XxLzgdzG2cxoWIBxqr5W23dBBU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=gCrSGv+pa3FO7jv7lAjrOcRNNwZOhG8bnVPxVcMAZV3jbVupV2eD23h7+xM5UqZKq
	 yIFrUAQpgZPrQXJPWQ2RFLfEftrGAy4qlZzCnQzI2CffgTmAbylpOxjEby0sKHIkgx
	 X21RB9a4WBM4zQnnwGQ8H6eObyuYDcE+e29GQJhU/l1syW31ydi1sCab54psgqSK49
	 SzKU25O5AzqhcHcmAuU4EH/4+uOO4Fv8/WJJ7cHNE2p3/uyB0JFITvnz9cMkxRw4Oa
	 CQZUPWa6x3vmdim8mSJTPEIiZ9jPW9E6ZMWg9gOyShmzJRunuRFwEJ24aqDDWvQDCr
	 CiN7YlGwWzXLg==
Message-ID: <ffaf4d60-f8d1-2456-88eb-8c91ed4a6b4a@collabora.com>
Date: Mon, 13 Mar 2023 09:43:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH] PCI: Use of_property_present() for testing DT property
 presence
Content-Language: en-US
To: Rob Herring <robh@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 =?UTF-8?Q?Krzysztof_Wilczy=c5=84ski?= <kw@linux.com>,
 Bjorn Helgaas <bhelgaas@google.com>, Jonathan Hunter <jonathanh@nvidia.com>,
 Ryder Lee <ryder.lee@mediatek.com>, Jianjun Wang
 <jianjun.wang@mediatek.com>, Tyrel Datwyler <tyreld@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: devicetree@vger.kernel.org, linux-tegra@vger.kernel.org,
 linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org
References: <20230310144719.1544443-1-robh@kernel.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230310144719.1544443-1-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230313_014347_083753_A9D7A06B 
X-CRM114-Status: UNSURE (   8.84  )
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

Il 10/03/23 15:47, Rob Herring ha scritto:
> It is preferred to use typed property access functions (i.e.
> of_property_read_<type> functions) rather than low-level
> of_get_property/of_find_property functions for reading properties. As
> part of this, convert of_get_property/of_find_property calls to the
> recently added of_property_present() helper when we just want to test
> for presence of a property and nothing more.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>


Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com> # 
pcie-mediatek


