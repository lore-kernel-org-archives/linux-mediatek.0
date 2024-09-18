Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E0DECCD18B
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 Sep 2024 08:13:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=8b2DOEcrj+iAdmkxLV+nF1EyP0FM6CbVtW1FcFghbgY=; b=EFOTsSBsQHvFdy
	zEf7Q0YeNKfJaQ3qwYXEnBMt9A9aS8WsyMoyFMlyN/jJ1kuvyd5AF5g/fkSor6mEMVWO7MuKqlYg7
	l2Ytl9BUtIj/9c3sX5q7qCWz1mzkP9dEwAcD6czkjt+KwV+mKWa+ogwcVRMGj4A/zIJJIMMy7YZNy
	j4LFs4jyx/zSpOSzaiQYW8YEarQccZC5rOWSMSfpvYSPqYbrTAa3qqY6opbJUPV8jLu89y2AYWJUg
	3Lv/WYmsX9ibw7zcdrWcgzDyKQMFDfosj/3P8WEk8CvRUAwz/DmK7t6FhNilKPMxwYEz09G8NZftQ
	ekPAD55v9i27LA7gwLdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sqpoV-00000007l8h-0SKE;
	Wed, 18 Sep 2024 08:13:27 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sqpoH-00000007l1h-08AH;
	Wed, 18 Sep 2024 08:13:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1726647191;
	bh=urRbQVTN6uGyFkVSFS3UAjiGPLlmo39F+4ctM836QqI=;
	h=From:To:Cc:Subject:Date:From;
	b=Vfl2XgjqdNY53zrFS3PsAnHQlo0rdiw3Zj331BMvPvn4RcQ90NVIhcdyni6PL8jRX
	 vrH0T7qt6+EJbL6bK5Wk/Mz5xr5IYiD7+p0SrrUcwnEIjzw44Ke3bUEnuDI/B1+kOV
	 19cFMot5RIPvW2Nv1tBTBgWoBOgnmy+P6ivbNV/99A8qt5RKfWFdMf34qAX895fB6a
	 /lsmeAUrxIeO629MiTMzxXp6n7btc8aUEMTL2y9JAVaixNhvyiODrgBIc28iDquqaJ
	 bG7FfbKZ+pM3aLQelfq8ja9y2rFWVVg9/pnoMgdzKXaDYCDUjEdLlf8YxzLaiobz34
	 9W+hQ143gH5vA==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 7F2C117E0FE0;
	Wed, 18 Sep 2024 10:13:10 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: linux-pci@vger.kernel.org
Subject: [PATCH v3 0/2] PCI: mediatek-gen3: Support limiting link speed and width
Date: Wed, 18 Sep 2024 10:13:05 +0200
Message-ID: <20240918081307.51264-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240918_011313_244855_34EAAE29 
X-CRM114-Status: UNSURE (   9.38  )
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
Cc: kw@linux.com, ryder.lee@mediatek.com, robh@kernel.org, lpieralisi@kernel.org, linux-kernel@vger.kernel.org, jianjun.wang@mediatek.com, matthias.bgg@gmail.com, linux-mediatek@lists.infradead.org, bhelgaas@google.com, kernel@collabora.com, linux-arm-kernel@lists.infradead.org, angelogioacchino.delregno@collabora.com
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Changes in v3:
 - Addressed comments from Fei Shao's review on v2

Changes in v2:
 - Rebased on next-20240917

This series adds support for limiting the PCI-Express link speed
(or PCIe gen restriction) and link width (number of lanes) in the
pcie-mediatek-gen3 driver.

The maximum supported pcie gen is read from the controller itself,
so defining a max gen through platform data for each SoC is avoided.

Both are done by adding support for the standard devicetree properties
`max-link-speed` and `num-lanes`.

Please note that changing the bindings is not required, as those do
already allow specifying those properties for this controller.

AngeloGioacchino Del Regno (2):
  PCI: mediatek-gen3: Add support for setting max-link-speed limit
  PCI: mediatek-gen3: Add support for restricting link width

 drivers/pci/controller/pcie-mediatek-gen3.c | 75 ++++++++++++++++++++-
 1 file changed, 73 insertions(+), 2 deletions(-)

-- 
2.46.0


