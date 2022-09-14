Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2089ECAAD8
	for <linux-mediatek@archiver.kernel.org>; Wed, 14 Sep 2022 10:30:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=HtayEMe4s8viILieO7cp7Zf4SQSi0RShFxgNlEy+NDY=; b=HKN3+d9iH17U8PxGTUNWVhY7B9
	6z+dpJwhmuoqpVv+WLbqOwibdeizkQQm6AMT/8iLG1pbC/HJgvnDiSarMP+SfQRs7oMaRFITSG8tZ
	hgCRH6hsRCLuKpiR17/vSZasVvwUyODpRO1uhqs2bzJzCM+csV6pAfBPZTCzrljp/seqs5adVjzNE
	JPiEhA5SstzVY/PBuAH6YH/c/Ya8cHgBgjndaU3mYWlIYRLCkQHCGo1A/yHk8SQXxXBRambmJgXT2
	IG7KlqRiAUgxmjYRtlDUKKjiEsdnUfxuuq5UYGgHW5LMDfqzcwl+3V9ekNX/RRIFtkbD7v9l2K+ti
	re+h8G5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYPfN-00F9ut-Eo; Wed, 14 Sep 2022 10:30:49 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYPfA-00F9SA-OG; Wed, 14 Sep 2022 10:30:38 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 542386601FAD;
	Wed, 14 Sep 2022 11:30:34 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1663151434;
	bh=JeaIcKOvl1wCsTf8RWNpKTL2k0i/vhElw9DGJuWnWB8=;
	h=From:To:Cc:Subject:Date:From;
	b=GJgaqKXVMCcyQl1PHfEDZG+HdO0Cy9Ce2T6XkfNE/R2T5xNg7AWPX4FEm/X7xL0MI
	 yizc4tdi5AnE76uneoh1TJjAXImUxpcP5bSq9GeZcf2z3fCL//zOzi6vRv3AJUvJyT
	 pi+xhAe5Hmr4oII4wKNgaxhOyHqqo/f6IiP9zVUQ4vKn/UbvQ86yOpk9ot7iSeIYdc
	 Tt/KiLxvjrxybZwankLAYo/RD4KNehFgaa4WxD7tcP7YY6iJpo3eDblqjnm0Piuq9j
	 cJdsE7XcXGoVVq3JjF2dmF6EI0MEx8MOynH92XbPjQyT3eBM/OUmtoccCP42u5wCLZ
	 1bhynkmiZ2jDw==
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
Subject: [PATCH v2 0/2] MediaTek PMIC Keys - DT schema conversion
Date: Wed, 14 Sep 2022 12:30:19 +0200
Message-Id: <20220914103021.43593-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220914_033036_938281_1C60A88E 
X-CRM114-Status: UNSURE (   8.69  )
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

Changes in v2:
 - Removed tests leftover interrupts/interrupt-names from examples

AngeloGioacchino Del Regno (2):
  dt-bindings: input: Convert mtk-pmic-keys to DT schema
  dt-bindings: input: mediatek,pmic-keys: Add compatible for MT6331 keys

 .../bindings/input/mediatek,pmic-keys.yaml    | 114 ++++++++++++++++++
 .../bindings/input/mtk-pmic-keys.txt          |  46 -------
 2 files changed, 114 insertions(+), 46 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/input/mediatek,pmic-keys.yaml
 delete mode 100644 Documentation/devicetree/bindings/input/mtk-pmic-keys.txt

-- 
2.37.2


