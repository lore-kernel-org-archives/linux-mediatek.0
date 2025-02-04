Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D364DC0218F
	for <linux-mediatek@archiver.kernel.org>; Tue,  4 Feb 2025 08:15:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qnLh3QMe6VAUwKlHbhNimVpnWC+7QnlHiABL0j3xewA=; b=qHESISCKIgVRiCSL/DjbmXo6D/
	jW1wY66F7YCaPw+1M0Jj+Zu/egr/XaJHWOJoSNL7urLU6bXVwOGX029eOJk0O4fw82aj5ehGaB36q
	jKDaH8e88He4rEyPzCd0uXt6QwtJOhX4yWfbFmuMbrYuGTJ0deBMNF8T36gxa39mTHu5u5dOl13h8
	biO6kGjGOV7JwToPMl8B8IOg0bAs7kXkbWu9De0N4bIMx7laz4ZiAiMTfoOcreom38KpXW1lIsdmS
	1tlAGNJiFGXq/5b7fYaUmOJhoyIJt4J8tQBKD4WJmGDYAv8VpWwLo9Wt2UwN6niMzD49cxOIoGccK
	vLgLpc0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfE5q-0000000HVZT-3HJ6;
	Tue, 04 Feb 2025 08:15:38 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfE4U-0000000HVRg-1XdS;
	Tue, 04 Feb 2025 08:14:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E98745C5985;
	Tue,  4 Feb 2025 08:13:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1D47C4CEDF;
	Tue,  4 Feb 2025 08:14:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738656853;
	bh=NABi+abZbTj0AxkLzpEHm04MmqQQL8FK5laY+2FfNwI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=R4QJJz6ctD223xa9a+xa05n4ENBX/8rHr5yspO2YdRb6DRclEGBcgo2w882H8sw6t
	 KT4FYsSr8f/eTWV2Iaw3sNeBIREzv4ychkMfAu3ehcE9Cgs36b5YlXPDoXluDhEKjz
	 V1ovvCOaxdhJwtM94ANrgNvXtH9II1C1fLQMs8m6xY4UqQeelG11Ab85oqbe9yRsu2
	 bIqMRQ5Aa/QUre750ifxr9g8UjJUZ+dN7jZPFlQ8W95rJ2HsM+xkT1czQLiGGikheU
	 p9PMNksdnSCfytde1FrPatbWT104sKvGNieLJ6BvrkmIzo0DbIBIep9gHK4M477EvZ
	 loOWQ3P7KlrmQ==
Date: Tue, 4 Feb 2025 09:14:10 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Ryder Lee <ryder.lee@mediatek.com>, 
	Jianjun Wang <jianjun.wang@mediatek.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-pci@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 1/2] dt-bindings: PCI: mediatek-gen3: Add
 mediatek,pbus-csr phandle property
Message-ID: <20250204-fiery-wisteria-marmoset-97af90@krzk-bin>
References: <20250202-en7581-pcie-pbus-csr-v2-0-65dcb201c9a9@kernel.org>
 <20250202-en7581-pcie-pbus-csr-v2-1-65dcb201c9a9@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250202-en7581-pcie-pbus-csr-v2-1-65dcb201c9a9@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250204_001414_448854_48DA0BE6 
X-CRM114-Status: GOOD (  10.67  )
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

On Sun, Feb 02, 2025 at 08:34:23PM +0100, Lorenzo Bianconi wrote:
> Introduce the mediatek,pbus-csr property for the pbus-csr syscon node
> available on EN7581 SoC. The airoha pbus-csr block provides a configuration
> interface for the PBUS controller used to detect if a given address is on
> PCIE0, PCIE1 or PCIE2.
> 
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> ---
>  .../devicetree/bindings/pci/mediatek-pcie-gen3.yaml          | 12 ++++++++++++
>  1 file changed, 12 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


