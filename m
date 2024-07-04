Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9486C41513
	for <linux-mediatek@archiver.kernel.org>; Thu,  4 Jul 2024 08:24:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CM0MGGn4S5QVMwJTZutjGYDfYbBwo96NoQ73LlbcWB0=; b=0PCVnq6jo8SoF5FyEEAXvMbT9+
	pkygVkPgxeHgXXkJXsD86+qVAMObVpTq9/Y5jpWjp7jrwdD9Gxrgo88ZtnxBgVLVTgeJyW2W7IgqI
	kVVyQ0V+ztM4mkBYWT1u9UI70CvICSsMZ5eN4FyjPpP5SDsSherL4EV68lMhnDOGM+yTvH6gZUXav
	JuOShLI2HhPL72rj3Jeevx3HjMolOF+gADzuGEcPSSfmB7yFU6kg6lkZ+H1DmJwVIE/jsfeYL8zSO
	TVQtlGiRDLeGVJ98kIaWDoODvyNbWyLThwM3GV3fVj1rLDMhW0MFIWXgUwulGaHp2mccnJ0fNonnu
	HVsNdi7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPHl3-0000000Ca2o-23NJ;
	Thu, 04 Jul 2024 08:24:01 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPHkq-0000000Ca0r-1wGn;
	Thu, 04 Jul 2024 08:23:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1720081423;
	bh=esn5rcvEb3vNv/CngWyv8T7Sc4+TxLPVDrRzXw12GD0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=wQzwXGsYKsDAeR+5zdRKqJFfOZ1j08lGsYYbpNc4+PmBucADurA1et4EaDLqcHCW8
	 gyk8yAf5nNYyj2DVvcb447GCIdesTFC1kp0Lan59RGR+fHV026WFK375cPaPzN67mx
	 P0jFACM+wiwsiK+OG8/RZax1r0xlsZ4Igv0syUPS6x6rQBjDhmV3IgfdzVy/b+yE6U
	 mSBUy/1LnGArEh9m3rQ3WsUP/1/10bR31lwgxS+3gho/e43/u70YOKWzp/zH3w3swQ
	 iaftYYJYzpvt1p0l6xR7A6uTTHeKM5BRQWqmv9/aM7rNDBRa7u9axQtKITfIV7h9+P
	 fCGpLiIDLgE1w==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id A9445378216A;
	Thu,  4 Jul 2024 08:23:42 +0000 (UTC)
Message-ID: <90342fc9-19ed-4976-8125-f8fccc8d4970@collabora.com>
Date: Thu, 4 Jul 2024 10:23:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/4] dt-bindings: PCI: mediatek-gen3: add support for
 Airoha EN7581
To: Lorenzo Bianconi <lorenzo@kernel.org>, linux-pci@vger.kernel.org
Cc: ryder.lee@mediatek.com, jianjun.wang@mediatek.com, lpieralisi@kernel.org,
 kw@linux.com, robh@kernel.org, bhelgaas@google.com,
 linux-mediatek@lists.infradead.org, lorenzo.bianconi83@gmail.com,
 linux-arm-kernel@lists.infradead.org, krzysztof.kozlowski+dt@linaro.org,
 devicetree@vger.kernel.org, nbd@nbd.name, dd@embedd.com, upstream@airoha.com
References: <cover.1720022580.git.lorenzo@kernel.org>
 <138d65a140c3dcf2a6aefecc33ba6ba3ca300a23.1720022580.git.lorenzo@kernel.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <138d65a140c3dcf2a6aefecc33ba6ba3ca300a23.1720022580.git.lorenzo@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240704_012348_836321_17A138DC 
X-CRM114-Status: UNSURE (   4.51  )
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

Il 03/07/24 18:12, Lorenzo Bianconi ha scritto:
> Introduce Airoha EN7581 entry in mediatek-gen3 PCIe controller binding
> 
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


