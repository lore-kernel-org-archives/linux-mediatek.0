Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8985BCCD193
	for <linux-mediatek@archiver.kernel.org>; Wed, 15 Oct 2025 08:49:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8drjSWcsdcZC/kN/jOxob14E9lnrkAHkfVWUucGAtpw=; b=2F9uf6om6YaISW8JMbYigtgVPE
	I+KQ7d18Wwt6LykGBD4I8tR2H5t+UaoT2KYAIgBGewrA3fuDQRlqXHIN+f/Qj7QVOW9kgO8ebaSN8
	LF+EGaNgU0sYvZInwmOuBQ/Hk+P3oyf8YzgmAUE6R775df4ghCFfqn2IsAv+D17sDZoD3TmSeUS7w
	X0PCp8eKroUGX+Dozbv77iJ5FTECPi9yiKlf/GMDh6b1lIzZAOULdw5+iNn6PwtFrabH1X26u5VKx
	F2glaU19VtaAKB4RxgxPKhawXmm2Ih8Y6XW/HmZkE1G02e5BzeB4+ApxfchBew1GeBWJCJJvq6mar
	kdlsTJWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8xCg-00000000zNy-35qV;
	Wed, 15 Oct 2025 08:49:50 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8xCd-00000000zMe-3bFq;
	Wed, 15 Oct 2025 08:49:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1760518185;
	bh=aY30yly+tkGS5zXJbvh222ZSEsOj5+wwP+oIx+nOBkc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=mUcMJMjHnh8vPmqIwcdjv9Haez39K5TYaXl8GcMFsaBBsEYH8WuRynYM/p8EvYxd7
	 NHPM5KV4wYcclgdz3WNdEw+5PaBLB4ml3dYvl7HscnuEBHeNUjvf28M5m0LF82YSj5
	 vCrJ8frGibMcq/2unfu080LiEYRQGSR6U3zezEOv4xrNDWTgAlSrdDhRVK1eUFtxU6
	 1bgAYK66jJHsWKWBNr+QRDVA9NZW1VJSX89TPlLADKVPnF6tQocVCqTuVFLSGLEtaQ
	 v9I1GVIVq9s05il89RcDgDMGJ4we2xQ9XrhUH8ijtud/E4gksojfgYBe1B1Unj5GWG
	 Pw+5omfi4wKDQ==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id E4C1717E12C8;
	Wed, 15 Oct 2025 10:49:44 +0200 (CEST)
Message-ID: <4614fe06-061f-462b-8e89-de2c5ff49880@collabora.com>
Date: Wed, 15 Oct 2025 10:49:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/5] iommu/mediatek: mt8189: Add MM IOMMUs support
To: Zhengnan Chen <zhengnan.chen@mediatek.com>, Yong Wu
 <yong.wu@mediatek.com>, Joerg Roedel <joro@8bytes.org>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: iommu@lists.linux.dev, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20251015032509.5057-1-zhengnan.chen@mediatek.com>
 <20251015032509.5057-6-zhengnan.chen@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20251015032509.5057-6-zhengnan.chen@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251015_014948_048314_A383A35C 
X-CRM114-Status: UNSURE (   5.85  )
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

Il 15/10/25 05:24, Zhengnan Chen ha scritto:
> Add support for mt8189 MM IOMMUs.
> 
> Signed-off-by: Zhengnan Chen <zhengnan.chen@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



