Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BC96ECAAD3
	for <linux-mediatek@archiver.kernel.org>; Thu, 15 Sep 2022 12:12:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=COCs8CgUMAmzuYGyaVhsFXhcAFV32ZY+b7M6MGZVbsQ=; b=EXGbsj2wuTRltpFNEdZCGKNBAp
	QTrthgLqfUw5YvzzWWMhrzMKMBRDqovSoVl1pKTZFja/eRRojpy1QiEYgm0SACkF3mLxRhg0I1a+8
	qU80QZfaIbpIGB+FhKc+uVQFUh+xiB7I9xLpge/+RFMGqhUwrMcqUEmLeB6oN1xzfRnZy2y9qKwDy
	T+9imkKpeXIkrdLKOrF2jk2ZkEPME6fUhhv92qg9k9INE5Lge70diGSOPIAOkHJUlc0Dgc8ILnpl2
	jbNPFYESeZVNTS7PlCftf+6e1VqnYpXwmZgfmkMRC/XIAKkQ0EDMjVneLzEhkNravtc0czmEpTmqe
	Jqc+gbGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYnjY-008FBW-6X; Thu, 15 Sep 2022 12:12:44 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYngQ-008Cdz-MK; Thu, 15 Sep 2022 12:09:32 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 813EB6601DA4;
	Thu, 15 Sep 2022 13:09:27 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1663243768;
	bh=HWBn/M52pLNG9jF9V0WnYR9GDulkLMEO1gk39KXryO0=;
	h=From:To:Cc:Subject:Date:From;
	b=CGOQFirTY6hJdv+pca94IvXspPFLIWe8jJbMe6BrycEJwUI7vtF3U/R84Ux9Rk42F
	 FdL1CKpZt/NbNNWIE1Vdk8qjZD7rQlJuZahFnCDIg9afB+hZ8mzXmpktj9UefE8gRm
	 HWl1grFjaE/SRSE7G7YJ1hSCeOz5W6cSBg8YRJw/ye8SE7DM9Q7Pj7Z0TVysOaJcAC
	 HYyeH2kujmfJg7jQjPcNFOWowMzH4DFUisTJS4MqghCqtKug6Wt5gkzVKDHuNbSERO
	 32J8hQ3jCkPTR8VrcUj7qvlqp5YxOy7TELG54d7EXPqR3Zf5eGlu30+ENjlOyDe/a3
	 MDp0kBu/7fcSw==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: chaotian.jing@mediatek.com
Cc: ulf.hansson@linaro.org,
	matthias.bgg@gmail.com,
	linux-mmc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH 0/2] MMC/SD support for MediaTek MT6795 Helio X10
Date: Thu, 15 Sep 2022 14:09:21 +0200
Message-Id: <20220915120923.86038-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220915_050931_019508_CDCD57F0 
X-CRM114-Status: UNSURE (   7.26  )
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

This series adds support for the MMC/SD controller found on the
MediaTek Helio X10 (MT6795).
While at it, I've also made the compatibles and plat data ordering
consistent.

P.S.: There's no dt-bindings addition because that was already merged
      and it's present [1] in next-20220915

[1]: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?h=next-20220915&id=55e7dceee83ca6584a08bd876ed0ec38de5b13ce

Tested on a MT6795 Sony Xperia M5 smartphone

AngeloGioacchino Del Regno (2):
  mmc: mtk-sd: Reorder of_device_id and platform data by name
  mmc: mtk-sd: Add support for MT6795 Helio X10

 drivers/mmc/host/mtk-sd.c | 109 ++++++++++++++++++++++----------------
 1 file changed, 62 insertions(+), 47 deletions(-)

-- 
2.37.2


