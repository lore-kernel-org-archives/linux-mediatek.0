Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C1D8C77B71
	for <linux-mediatek@archiver.kernel.org>; Tue, 18 Apr 2023 09:15:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RldomnBrij1jN3EC3cpZ3QURKp7TawHPvLF9AvHUWw0=; b=aroQizCbOKV/5Bhi/ljEYV+Sgx
	mg/GKt4gXShCeoHal/EFCAexZH7DCHyl+FzvozGDXcVbHlXyVMAdr3b0l421AlA2007ovEZtLBkyh
	XJlowARnO97Kc9KhRQ1xyqt7dejMJabdOE5gr8rJHbpXlkRJo0pVRUaaat43Gf8FKSVtv/J1gCpCV
	J6hbTq30sYZYMXt82RZA9dxHoBq7fG3GSqMSlyo5XPCueMZpNVLzV0PEboxVhMoxVIgLyQcCK7Shx
	ZPyWpeady8jms3mitNqOAhB/7e520hR0mbPmhQdapKYzMCZzMcjHr/AULQ1uD+qaftK2H9IQSDtDx
	gwuWX7SQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pohRE-001QPM-0r;
	Tue, 18 Apr 2023 09:15:48 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pohR8-001QNo-1P;
	Tue, 18 Apr 2023 09:15:45 +0000
Received: from [IPV6:2001:b07:2ed:14ed:c5f8:7372:f042:90a2] (unknown [IPv6:2001:b07:2ed:14ed:c5f8:7372:f042:90a2])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 67C256603238;
	Tue, 18 Apr 2023 10:15:35 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1681809336;
	bh=zC/TAZzf2xurSfg4uBALXf9z3Fp/VkEw/HUUOGxXljA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Rj9nfVYH09a08kuz3NjQRkdFtge85SZjVxv/6WYw7KTuMe6mfabhLhi1yl7QzLnSi
	 xYiPA+lEP+bEezO6kq1bvKm3GySUVuYyJIhvkv5JelUBvLMb/07zcKs5gjmPufstis
	 0u0fW5wFE1Xm9eKHZ5j1xlgu14PrR7scMaWLQUMEIGFLQQvA2DBkOOV5uCPVz6zc2E
	 xfNe3jsPLLQPmsCEl2Gmvf4HA7PdA0x0mfmvxaGypF1pk/WHF9/8ZhrCgfAghgwwhk
	 xep4Pia4E2FiK2GKCc0HPbu8jR8ojGftLlJz3+32DKq08IfOFq5SzzvzFsYz3oXNAG
	 UALOGzOpxgklA==
Message-ID: <a3bb307a-8deb-a038-56e7-ded2abb87255@collabora.com>
Date: Tue, 18 Apr 2023 11:15:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH v11 7/7] MAINTAINERS: iommu/mediatek: Update the header
 file name
To: Yong Wu <yong.wu@mediatek.com>, Joerg Roedel <joro@8bytes.org>,
 Will Deacon <will@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: Robin Murphy <robin.murphy@arm.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 iommu@lists.linux.dev, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, mingyuan.ma@mediatek.com,
 yf.wang@mediatek.com, jianjiao.zeng@mediatek.com, chengci.xu@mediatek.com
References: <20230418083514.4379-1-yong.wu@mediatek.com>
 <20230418083514.4379-8-yong.wu@mediatek.com>
Content-Language: en-US
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230418083514.4379-8-yong.wu@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230418_021542_697956_5AE7F482 
X-CRM114-Status: UNSURE (   8.23  )
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

Il 18/04/23 10:35, Yong Wu ha scritto:
> We add the prefix "mediatek," for the lastest ports header file name,
> For example, include/dt-bindings/memory/mediatek,mt8188-memory-port.h.
> Add a new entry for this.
> 
> Signed-off-by: Yong Wu <yong.wu@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



