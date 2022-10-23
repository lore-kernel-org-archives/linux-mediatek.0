Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EFE0ECAAA1
	for <linux-mediatek@archiver.kernel.org>; Sun, 23 Oct 2022 17:03:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=4IpEBqScoz0BOsedKQHVHHygIrrSlTk0S77GHPVXhEM=; b=NaSkXjJBqx+67L
	xzhTjo2zEo/lGd0ltPhh2Sh6P8k+kdDiv1yaIcIqusDwgu7mau534wu7/o6gsURqswh298CeDzYg8
	Zj85bxGMLZIT70zDdJuk5BeHZOU568SWM4GpTgoKoUbCinDxZ9wBuKtMnYqdZVAKuFy5uIhFBKMGX
	xn8+ha3bT8f3dFzH8Oz32y2lBm/BmkAuNrUQP8rDMhMST8epKYkbmQy1NeYdmydi7PzDnInMZR/b5
	wZeRWiDBpYlBlX3OP2kjpFarzW/DUyjDx1/LfoWmpeZMr0miNgBsGBLhNsUTCtrbnrQqiIe3pEjH9
	wdaCfTxk2Hhvq76eb3XQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1omeNd-00FmQo-TQ; Sun, 23 Oct 2022 17:03:21 +0000
Received: from mxout2.routing.net ([2a03:2900:1:a::b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1omeNC-00FmJH-02; Sun, 23 Oct 2022 17:02:56 +0000
Received: from mxbox2.masterlogin.de (unknown [192.168.10.89])
	by mxout2.routing.net (Postfix) with ESMTP id 019755FC59;
	Sun, 23 Oct 2022 17:02:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=20200217; t=1666544567;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=4IpEBqScoz0BOsedKQHVHHygIrrSlTk0S77GHPVXhEM=;
	b=tfNPDBVtY0cD9PSSZK9adXpCOkj4k5bc9hh8vqg+d+FqvW3krOa9R71ECgInxPAQ8y0AMG
	fVDyLBbOCNGac0J3r7tg7uv0JSiykr9nvywBYkSZgwQ3QEkuzPlfYsVQ4Z0pKhI5esipp4
	kCRc+nRhY5la0Qk+++QDt7Evb5pBswM=
Received: from frank-G5.. (fttx-pool-80.245.79.234.bambit.de [80.245.79.234])
	by mxbox2.masterlogin.de (Postfix) with ESMTPSA id D978B100352;
	Sun, 23 Oct 2022 17:02:45 +0000 (UTC)
From: Frank Wunderlich <linux@fw-web.de>
To: linux-mediatek@lists.infradead.org
Subject: [PATCH 0/3] rework mtk pcie-gen3 bindings and support mt7986
Date: Sun, 23 Oct 2022 19:02:31 +0200
Message-Id: <20221023170234.83621-1-linux@fw-web.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mail-ID: 0f466a79-bb1f-4f20-bc41-869e0b319303
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221023_100254_199767_A92F8F2B 
X-CRM114-Status: UNSURE (   7.50  )
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
Cc: devicetree@vger.kernel.org, Ryder Lee <ryder.lee@mediatek.com>, Steven Liu <steven.liu@mediatek.com>, Sam Shih <Sam.Shih@mediatek.com>, linux-kernel@vger.kernel.org, Jianjun Wang <jianjun.wang@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-pci@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Frank Wunderlich <frank-w@public-files.de>

This Series prepares support for mt7986 PCIe which is basicly gen3 PCIe
but with slightly differnt clock configuration.

To make differences better to read i split the exiting bindings which
has already different settings with a compatible switch and then add a
new one for mt7986.

Frank Wunderlich (3):
  dt-bindings: PCI: mediatek-gen3: add SoC based clock config
  dt-bindings: PCI: mediatek-gen3: add support for mt7986
  dt-bindings: PCI: mediatek-gen3: add mt7986 clock config

 .../bindings/pci/mediatek-pcie-gen3.yaml      | 65 +++++++++++++++----
 1 file changed, 53 insertions(+), 12 deletions(-)

-- 
2.34.1


