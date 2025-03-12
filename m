Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5117C28B28
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 Mar 2025 09:13:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p31Bv5bN7BNGVI00vNLy7V8oFDJbaK09raJJcaYlMWI=; b=jR3ZrHVZ4A1kebhBpzZLofVCQ+
	SVSMWlhUmuLZG7yrRIPb/iQ6gwiP6yh5jWrlKL2aVmbJfdU88mLsQGArfqbbdiDNUCY2p9wPaajPt
	Wq1NlkpDxS44ddE7RYKjUVrIAFlfP7F5Z9X0Qjya2tH51GJqgDAsRk4aB6GGdWcgbyskyWFfJOUmP
	tObVOCfSVJjfczEfU490j3vSzLEe+Gq+tVIE2fkFCkDUAs2Ti1a5xhgIqxIJTsS2K+lcZTtPRu/Dz
	GEGMLjQMB72xL9JMFgEKya1mQxdtJELD7zqto0ugLfTJgVSTOzQDe7RUZLx9WO/ApL5FkX3WRBLj8
	KBff2Wzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsI9X-00000007uxA-1i77;
	Wed, 12 Mar 2025 09:13:27 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsI7M-00000007uQ8-3lc5
	for linux-mediatek@lists.infradead.org;
	Wed, 12 Mar 2025 09:11:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 9035F5C5658;
	Wed, 12 Mar 2025 09:08:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D392C4CEE3;
	Wed, 12 Mar 2025 09:11:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741770672;
	bh=R5u/MPwOptPXQ8G4otFzQXBnW5BpSZsw4xZ1ZzVhQl8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SOVVbM/qeqV9cw8tj8qoRsAo3juv41+N10Po3L/8vRmUfyhydmiamNOFThvZ9xUXw
	 frRARDGSGHpBgUXQ6YtjdBQWUJAxZgmppYg0WSU7Lbm+o9x65aV7tugbLukkPRocrj
	 7yNEFzi3qkSHN0exUG/tSf5CgsNJ7vtIHzHQBAYzZIE5gP/4HgkjR3/TLzItI+1ejD
	 MACY0tO5ied/+zWdCBN/C8xylrr2wD5gK+M/bNS4lJJadHk9eSKaeiI4buUmEI0rrx
	 /CRj+YxjUtpGa/YOLha17Q2IFr1SF9gQQgJyn9nWgZz1Zs0HhvlnQql1uwVleBhPsB
	 t0JwYVe73srgA==
Date: Wed, 12 Mar 2025 10:11:08 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linux-pci@vger.kernel.org
Subject: Re: [PATCH v3] dt-bindings: mfd: syscon: Add the pbus-csr node for
 Airoha EN7581 SoC
Message-ID: <20250312-amigurumi-chamois-of-virtuosity-1ed2a7@krzk-bin>
References: <20250312-en7581-pbus_csr-binding-v3-1-7bd9f00a25a4@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250312-en7581-pbus_csr-binding-v3-1-7bd9f00a25a4@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250312_021112_974819_A53BF10A 
X-CRM114-Status: UNSURE (   8.10  )
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

On Wed, Mar 12, 2025 at 09:32:15AM +0100, Lorenzo Bianconi wrote:
> Introduce pbus-csr document bindings in syscon.yaml for EN7581 SoC.
> The airoha pbus-csr block provides a configuration interface for the PBUS
> controller used to detect if a given address is accessible on PCIe
> controller.
> 
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> ---
> Changes in v3:

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


