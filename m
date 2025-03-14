Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DCE5C28B2F
	for <linux-mediatek@archiver.kernel.org>; Fri, 14 Mar 2025 11:48:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hdKYvo9EwqQsSj/W3cDuFebx92VQj8I1ZsXosDcT2VY=; b=zUuLnpwRdU51EkrrtQs6S6lM1r
	HdlSiCQrhI8zvEYqmWub4iqnSC7Yh7LmwQqFb4g47Xa2sAM6iRI5k7lm176hWGrY1nRefs4CpBJYt
	IhWKYWsEcu2l2sjKz3q5EUaaU+8ui45M5VkvkCVpolLdBvWKlS9QSyk1ywOA3aNiSwjVwxkXUzT4B
	YBT8wxx4v8rrU25ZP7xHgfkMpM57MDGbX6jdCF8onxMet44atTCSJmdgH5IuBMQ30YDRY1hQ663Fr
	SrcHXTEfekP4kKTQ0sgKYmAO+tShjBl2oGDvpnwQ35PJ867cIFnzuCxJM+Mdz/ap7lT/IAq9gVox2
	HgHyxlew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tt3Wx-0000000E3sU-2K4p;
	Fri, 14 Mar 2025 11:48:47 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tt3Wv-0000000E3ry-167l
	for linux-mediatek@lists.infradead.org;
	Fri, 14 Mar 2025 11:48:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id CBDAE5C6216;
	Fri, 14 Mar 2025 11:46:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3E0CC4CEE3;
	Fri, 14 Mar 2025 11:48:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741952924;
	bh=tDRiCOmlmNgcaQNGx5zSIpYTAy20ivUwPHVm38I4HJc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=XsEjdjTp6T3jFtw9iCVpyrWfwrplgwOOgbHkxz59SBECzrRs0MG/jUk6Hqb+xXEnK
	 Qb1ze8pH2KAmI42D1f8GCytNbFYHTP7IWBeWF4f41jLtBepO81UabpqPfaE5JU0xGy
	 26H6Ry2C5x4HUn+cQJer2Pnht502N1NMSq1LdQl3gVV7tyJxLAZFGpz6VIC2E9uT8w
	 ynS9YjzOxSb8VVzRsoCMZlsyv1r/JuAKBlgqNwz6GK/cABoysHSA2UdFC9052UwxCz
	 Ia3BElGMKAMcYSu3tUCvEj20E+tjk+27D9ObYMkSTHjMI/514ALLs9DBxoaEG735fm
	 iv7E/SbZBX7rg==
From: Lee Jones <lee@kernel.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>, 
 Lorenzo Bianconi <lorenzo@kernel.org>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 linux-pci@vger.kernel.org
In-Reply-To: <20250312-en7581-pbus_csr-binding-v3-1-7bd9f00a25a4@kernel.org>
References: <20250312-en7581-pbus_csr-binding-v3-1-7bd9f00a25a4@kernel.org>
Subject: Re: (subset) [PATCH v3] dt-bindings: mfd: syscon: Add the pbus-csr
 node for Airoha EN7581 SoC
Message-Id: <174195292241.4020789.14863170560940675990.b4-ty@kernel.org>
Date: Fri, 14 Mar 2025 11:48:42 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15-dev-510f9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250314_044845_352609_592F18D7 
X-CRM114-Status: UNSURE (   5.78  )
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

On Wed, 12 Mar 2025 09:32:15 +0100, Lorenzo Bianconi wrote:
> Introduce pbus-csr document bindings in syscon.yaml for EN7581 SoC.
> The airoha pbus-csr block provides a configuration interface for the PBUS
> controller used to detect if a given address is accessible on PCIe
> controller.
> 
> 

Applied, thanks!

[1/1] dt-bindings: mfd: syscon: Add the pbus-csr node for Airoha EN7581 SoC
      commit: b904243247d1acb0ebbd4978feb639441dc51fc1

--
Lee Jones [李琼斯]


