Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4740DC433EF
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 Apr 2022 11:45:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ZbqsqGbGQe2eOttw28JG9K2ik5HU1KvetDM4tXkqBR4=; b=W3TcKhGfunRnCd
	RHsqyBVZ9j9ylWDlCzhIJehxkaUsgURJoAZ2dBL5TiSGOGMON50SzXTOwIh9mzqijGd2vHkQ8rXHC
	IvFNptHW1ymm+e2Y5abaELEvGcUNJJu2Y8EJnFZJEA9zNZjPNtH9+SqbRDaTRKf2qZWbIs3uN24+k
	3yxfrdxzTmCqOwX21adSPKOGI6EpySdBwqhaVkHd3cHPUlH5Q0M0lYzpHE7/b8PAyxVCfFtI+kyNA
	9eeEDm/flzaIHmqAGPKb0TESCX5QADw7h/eiyFEXMnJSGTXIKDT/uPLJ8b0yIUZPiOokQ/dT8WcJu
	riotp2OWqODUI9zC7GtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ncQZK-00BbKa-IB; Thu, 07 Apr 2022 11:44:54 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ncQZ3-00BbBs-Mc; Thu, 07 Apr 2022 11:44:39 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 4637D1F4580C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1649331873;
 bh=3xNDbtKo/QwtU2kZMPDobaM+xLfIkUASVQWxYMAggfM=;
 h=From:To:Cc:Subject:Date:From;
 b=c67OREi0ihF2CjgVqwyotdZpUpPe20ZzIqQsIyoxbQ8qLtO+JfUTzTX4ExhioHjo+
 VgxYPuYwyMH+csxqHP98+dzexkx0H1f2w4DkPnQc4ci+W27bfS/AmHQymnHXE4FfE5
 nzhCMRyt0BC7YofwSYQNwU2ejzFP3zJ/3CTeokQTP6DhKug3pkJ+D+nNbSvVZa7u4g
 DOVyR33WP5Tkt45CYl2cXSAqe/6lf4pcJwrGqO7rtn8yGEidb8z67xBhGeP35OKMSY
 tPcLrdSQ+tcmMARLykKLJwT8oFzDPS2F456ucfq6xPvmT7uAdkMz+90pThPKe+PcDy
 h2mSbc1SNg89g==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: broonie@kernel.org
Cc: matthias.bgg@gmail.com, linux-spi@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, nfraprado@collabora.com,
 kernel@collabora.com,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH v2 0/8] MediaTek SPI controller cleanups and documentation
Date: Thu,  7 Apr 2022 13:44:20 +0200
Message-Id: <20220407114428.167091-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220407_044437_989052_712AC642 
X-CRM114-Status: UNSURE (   6.53  )
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

This series performs some cleanups to the spi-mt65xx driver, removing
all gotos, simplifying the probe function and adding kerneldoc to the
driver structures.

Changes in v2:
- Rebased over next-20220407 for new spimem commits

AngeloGioacchino Del Regno (8):
  spi: mt65xx: Simplify probe function with devm_spi_alloc_master
  spi: mt65xx: Switch to device_get_match_data()
  spi: mt65xx: Add and use pointer to struct device in mtk_spi_probe()
  spi: mt65xx: Move clock parent setting to remove clock disable gotos
  spi: mt65xx: Move pm_runtime_enable() call to remove all gotos
  spi: mt65xx: Simplify probe function with dev_err_probe()
  spi: mt65xx: Add kerneldoc for driver structures
  spi: mt65xx: Fix definitions indentation

 drivers/spi/spi-mt65xx.c | 368 ++++++++++++++++++---------------------
 1 file changed, 171 insertions(+), 197 deletions(-)

-- 
2.35.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
