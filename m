Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A212C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 May 2022 10:56:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=se4v2KQ6N20OWgH9xtTk0Yw3ThOT0I6Ly+eHNaFQjpI=; b=bqVqHVlVNyv0aV
	YF/si7mOulLrlNQHkHE/b/bXQmYRSA9kZXQqFYxrKjz7hK0ywj8i5/aZWZE7TSL6AKlzaWNYweCl5
	TRkrgfzbnQU59Ae3bZqHr/A//1RWF/AK+pA/7vwZ4txmnWHqpUcAbpHJxdE9KQD680dYOdVS7TvRW
	IqyXDGn81VTwLhWANGJ2TJWK2ZUOeO2ahWscYrh97M20yHanhhr4aC6d98OzOQ1fZO5SEhIwT/Lao
	FhimNlhAgwk/AnsZHQR5+tPQ/wQ6xjWN32NOJqeJ4DKPeV20bCcNh8xubaDPO2izQursLvaI5VgRm
	zqOHmb7y3paPH0DXZwGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nlqCM-005Ps1-Ro; Tue, 03 May 2022 10:56:06 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nlq9v-005OVS-CG; Tue, 03 May 2022 10:53:40 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 869FF1F43E22
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1651575214;
 bh=vD1CX0oiP/NhStt+r5eRlNmVAcc80XzoQPqgY8PYNLI=;
 h=From:To:Cc:Subject:Date:From;
 b=Zcsfl8bf4NgCjl/eU91EUz+RDKJp8JCDdajucFkR6/BpY8mqDKnsShBs0hE5mQJ7p
 GAQXfdY+/3B0t5yCPMYzjDy5sdhNxO6ki9DtVe1XbqEzgxmykn/pzMrdKgOa4BxELK
 nCLwGrdwZGWIkX7Nl2/OxprDG7XOtyLFPgsZ84w8dM6+hjrvZKuuIOSl5FY8+7hCvz
 h+Bu7nWTWWtIwcxSBv6Wv1yacjGTtrXALMfNFSfzR4sGsde+4yy9McYsx4v7bIK63k
 4oJ1s9zGCtiYwmXiCPDjUjl8oXjUeYlQWvdda4+4iCTxQ+X5sJkfKHTHTnXjECrfAI
 bzjXNI8dT74Uw==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: sean.wang@mediatek.com
Cc: vkoul@kernel.org, matthias.bgg@gmail.com, dmaengine@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, kernel@collabora.com,
 nfraprado@collabora.com,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH 0/2] MediaTek Helio X10 MT6795 - CQDMA driver
Date: Tue,  3 May 2022 12:53:26 +0200
Message-Id: <20220503105328.54755-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220503_035335_610782_FFECF235 
X-CRM114-Status: UNSURE (   6.45  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

In an effort to give some love to the apparently forgotten MT6795 SoC,
I am upstreaming more components that are necessary to support platforms
powered by this one apart from a simple boot to serial console.

This series introduces support for CQDMA on the Helio X10 SoC.

Tested on a Sony Xperia M5 (codename "Holly") smartphone.

AngeloGioacchino Del Regno (2):
  dmaengine: mediatek-cqdma: Add SoC-specific match data
  dmaengine: mediatek-cqdma: Add support for MediaTek MT6795

 drivers/dma/mediatek/mtk-cqdma.c | 40 ++++++++++++++++++++++++++------
 1 file changed, 33 insertions(+), 7 deletions(-)

-- 
2.35.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
