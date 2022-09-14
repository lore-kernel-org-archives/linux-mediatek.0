Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04676ECAAD8
	for <linux-mediatek@archiver.kernel.org>; Wed, 14 Sep 2022 10:22:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=tmYa1gCjW6ya2GxwDfsYeVcyPCmQxjZ+lntIPjJ0CYM=; b=pjKVwLTLNGR4VpXDBVzFAnPZuK
	9kXsFZJztBxwA1iyPUzoR3flmrLJqdW7x3qIQSuPcb8yUYeFepmS9X7/wtHsSEcsSVQpfzgbYS8PB
	cxsUx4K13ojSSwru8XPpX5G5N+BVSju+HyPquSZacFj4fAo85YmDrtwk2N0QU9l7JTy7BCinZK4Ua
	rs+CQloPz8UbfiQKSsxTOqmQpuUh9qa9GUYJcUYpex75/8+Sf4jXawifKCKyiHa5FE1u319keolKs
	3SjaDI8dBJq9eR2Q6V9algRNJAXT4ztwDUaH3TeNJODcz5eulMYVUOtSjr3wTU6obCYYxle4m9qlj
	wAaV5qJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYPWj-00F20l-77; Wed, 14 Sep 2022 10:21:53 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYPW8-00F1AA-OY; Wed, 14 Sep 2022 10:21:19 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 4ADBD6601FAD;
	Wed, 14 Sep 2022 11:21:12 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1663150872;
	bh=QdN2B3QibIErQYqVl05FBiGUQIidoGZDB5zsfyDeIhg=;
	h=From:To:Cc:Subject:Date:From;
	b=kuK208OdpKJ/ygCdBVc8RUw7xLAg1BYoyVlcDRodErz+0HWi7i/2l+mKeQKda9jne
	 3wwhPXTHqokS3xWX4655NL30hnW0ifZXEH85TTEKwFblrHpWgb2d2tXuulQYJwoglt
	 Zist/UvhMfPFDOOVSF1C3BAqaE63EJ1aSbfDBopCfszheoe1tATJDUSgJAZpENvifs
	 HmcH+gQ4bwSaSt1pFeUi+2EYNQR77nwX9L0l4CcgNUmLTDsJD6I03zJqucSpskx403
	 U9uvGpkrmdwRa51socFiI5tNYFBk7CILz/ObpKNO2LMBD/90zH4edl7X7ptdaohYwG
	 snREHz7IobqXg==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: krzysztof.kozlowski+dt@linaro.org
Cc: dmitry.torokhov@gmail.com,
	robh+dt@kernel.org,
	matthias.bgg@gmail.com,
	chen.zhong@mediatek.com,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH 0/2] MediaTek PMIC Keys - DT schema conversion
Date: Wed, 14 Sep 2022 12:20:57 +0200
Message-Id: <20220914102059.41757-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220914_032117_054058_D365EB15 
X-CRM114-Status: UNSURE (   7.92  )
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

This series converts the old mtk-pmic-keys.txt binding to DT schema,
documents the missing support for key press/release interrupts and
adds a compatible for the newly introduced MT6331 keys.

AngeloGioacchino Del Regno (2):
  dt-bindings: input: Convert mtk-pmic-keys to DT schema
  dt-bindings: input: mediatek,pmic-keys: Add compatible for MT6331 keys

 .../bindings/input/mediatek,pmic-keys.yaml    | 118 ++++++++++++++++++
 .../bindings/input/mtk-pmic-keys.txt          |  46 -------
 2 files changed, 118 insertions(+), 46 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/input/mediatek,pmic-keys.yaml
 delete mode 100644 Documentation/devicetree/bindings/input/mtk-pmic-keys.txt

-- 
2.37.2


