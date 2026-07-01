Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6116C43458
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Jul 2026 16:55:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HfiUSqQBhGBAYvrrFitLkDBGFPvDnaBqCx4Nvg1WAhs=; b=noJWKqFdCRQS00UReFG9j22yid
	txPJ72fxmiR4TicgXQ14BLWz9F4jsaUZ6efQNw/JSwxNoLl/rR5EtppsmpalgPwHP8fZuKSSDALjl
	tFF+MShxN0cZkdEUQxKQvhdCFmK0/3xwwrcGJ6UdEFEg6g9DCCkWCMKz/QYXOhUNbL6Mr+z9oCq0T
	ahrWntCfTC9aGspkSDf5pudOj/j9oOFGdIuXzchhNrbRqKkCwyuMgo7Kj/89jW2A3NeRDiiNTTWJu
	LkYnGxZiTPEUuXJv2MFJbYrbkQIi4R/xGiWkNL8eDDomXFlJCAupII7ZNvX7vW91jC1+iVpg0kkMi
	tPSWIgrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weyDd-00000002ckR-2o4Q;
	Wed, 01 Jul 2026 16:55:25 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weyDZ-00000002cgl-1pkq;
	Wed, 01 Jul 2026 16:55:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1782924919;
	bh=wehnLxMMRrBDItrASTkvWAjFyIoEkEsvXkIvo0kbZK4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=W4bF+CtHxHluTYTTBazDk/DMqkyNEMzzQbbT1GEKzGnSGKRibB2FrGXCIEbMOgdOv
	 mGScluCTbecvVRpamQBfbYnQECedtOAQMZTxNBnDn7Q8J8kl4eQKuJUvyekO8kJ3yD
	 hDc/4oSePedl4M8Qgv09SBMPl3CnUaXVHC+2XHDvI6DZ9WtK0RUnHDUmahR6Tq/Bh8
	 K7SxEdTno5IXXmpATe1fwpQR4GYIjBcZGow8VptpAhFcEU0aFA1snThvMAoMwQNPGN
	 qMoq9rQsd/2vNIb/6BpF+PJKzmG0Tbf5UgoWzVOOY5OkswCsuzppganUL3Z7hXVLhS
	 53/2lM7htwJog==
Received: from [100.64.1.21] (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id A4CDB17E0909;
	Wed,  1 Jul 2026 18:55:18 +0200 (CEST)
Message-ID: <9f59a89f-a58d-4151-bc7e-7e7cde8877f6@collabora.com>
Date: Wed, 1 Jul 2026 18:55:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: PCI: mediatek-gen3: Add support for MT8189
 SoC
To: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>,
 Ryder Lee <ryder.lee@mediatek.com>, Bjorn Helgaas <bhelgaas@google.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Jianjun Wang <jianjun.wang@mediatek.com>
Cc: kernel@collabora.com, linux-pci@vger.kernel.org,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20260701-mt8189-dt-bindings-pcie-v1-1-7c7a65087654@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20260701-mt8189-dt-bindings-pcie-v1-1-7c7a65087654@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260701_095521_624344_52C6DC7D 
X-CRM114-Status: UNSURE (   6.67  )
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

On 7/1/26 17:27, Louis-Alexis Eyraud wrote:
> Add compatible for MT8189 PCIe Gen3 controller, that is compatible with
> the one found MT8192.
> 
> Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


