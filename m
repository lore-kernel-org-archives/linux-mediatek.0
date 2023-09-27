Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 272E9E82CA8
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 Sep 2023 15:39:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EGIyUnXfYlZrvHeWCo2ngnGTPgOrZHbbiv5X9rjqVAs=; b=4mrAEAn+fgQ+7/n40Vq0uzinlP
	9rAxKb8nJEfP8qYoZXSQiYsNHMenkDfzukbQj8Txxlp2793NhO9LS2pFNj9UzM6SR3/jIYdUuuxeQ
	SUO7s++Mxt8A0WUbnL2ov+OxCiAfzRcxZiLjuubE9HJq5rpAT4ZJHWyLItArW7J30rUs+ekYnqLyN
	+hvxiMgLZhNPmF8qqYae6RlYEqw2I5fMLqS+hGC1bmsoY56tr7YDBvbX87t0mszcE1y61dzPreeeG
	exR6Mn+pyXjUEQS3BdiDNZrdtX/gdf3ZRK6tXrjkIF10cDmD88xNBGwZpTWJBItUP2BuUR1EI+F7U
	JuAexy8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qlWdS-001JkD-0f;
	Wed, 27 Sep 2023 15:39:34 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qlWaV-001Gb6-1G;
	Wed, 27 Sep 2023 15:36:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=EGIyUnXfYlZrvHeWCo2ngnGTPgOrZHbbiv5X9rjqVAs=; b=l9Vh1/dbngfogsiAhOipUrscEW
	NAMNUADnn1YuBSmjdGdkDvGUA0vVvPZqzzhvtE9IdwyxcV8HP7eJA6Ms67eJREWl/M5ZKRmoglKvb
	Mv2TG7NquwCiritIvUHQgLp6jLCTi1SF/cuai+kzG44ofI/TcpStTPu4HiBvNz1l5qhefXga69F2w
	8ioe6mwXFb5/mify7NGe3btmKlGAcmRfGfp2YUTvVZkykHaa5PlFXphLA/0vrsMd7t61AiNq1Wa4B
	89YtxrN9qqmGJQHCBSSvWN1xmU66iF+oE7FGuwDzrUvyVhC03aERf+xuM14Omix3dwTBYrNUCR0az
	OHTCnbsQ==;
Received: from madras.collabora.co.uk ([46.235.227.172])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qlWaQ-004027-23;
	Wed, 27 Sep 2023 15:36:29 +0000
Received: from benjamin-XPS-13-9310.. (unknown [IPv6:2a01:e0a:120:3210:672:46bd:3ec7:6cdf])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 71789660735A;
	Wed, 27 Sep 2023 16:36:20 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1695828980;
	bh=ZWZu+iiWZeSR97TuxWAcPyCT2zWmqcsNlEZTasx6lQc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=RKcQuGAVdJ6Cv1oTnpAdoEh+Vi1SXlNiUCq46ZpmQu5QLeGWFnDieRnhXW3X2oKLV
	 LoRn2KgNYCIQGeEtUKxzK1h3bhlLDmLtXiYnHOvu+JnugNWhANEGDEav/zcxOSjdYV
	 EnBc7goeDhvq3r1VajIRftX8NVExrYpt5jHAjyfZHm9uPANr+KZpoWef2BRcyaqAJM
	 MjyVNWEuMqD45Fwdjy/KeVgTQH1FDo/+fhzPb2Yo9H08Y9gXo9e6DsjIafuDdR0i9+
	 HFXBzqjOnnTtViketeKZTM0+MIDxetHQIAUZD42QXd7HrjKnicCHWvmjGV82bY3ABF
	 VHnXyBdnpIuwA==
From: Benjamin Gaignard <benjamin.gaignard@collabora.com>
To: mchehab@kernel.org,
	tfiga@chromium.org,
	m.szyprowski@samsung.com,
	ming.qian@nxp.com,
	ezequiel@vanguardiasur.com.ar,
	p.zabel@pengutronix.de,
	gregkh@linuxfoundation.org,
	hverkuil-cisco@xs4all.nl,
	nicolas.dufresne@collabora.com
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-staging@lists.linux.dev,
	kernel@collabora.com,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>
Subject: [PATCH v8 27/53] media: pci: netup_unidvb: Remove useless number of buffers check
Date: Wed, 27 Sep 2023 17:35:32 +0200
Message-Id: <20230927153558.159278-28-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230927153558.159278-1-benjamin.gaignard@collabora.com>
References: <20230927153558.159278-1-benjamin.gaignard@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230927_163628_242387_68D84A72 
X-CRM114-Status: UNSURE (   9.12  )
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

vb2 core tests this already so remove it.

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
---
 drivers/media/pci/netup_unidvb/netup_unidvb_core.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/media/pci/netup_unidvb/netup_unidvb_core.c b/drivers/media/pci/netup_unidvb/netup_unidvb_core.c
index d85bfbb77a25..52de9b0af812 100644
--- a/drivers/media/pci/netup_unidvb/netup_unidvb_core.c
+++ b/drivers/media/pci/netup_unidvb/netup_unidvb_core.c
@@ -297,11 +297,9 @@ static int netup_unidvb_queue_setup(struct vb2_queue *vq,
 	dev_dbg(&dma->ndev->pci_dev->dev, "%s()\n", __func__);
 
 	*nplanes = 1;
-	if (vq->num_buffers + *nbuffers < VIDEO_MAX_FRAME)
-		*nbuffers = VIDEO_MAX_FRAME - vq->num_buffers;
 	sizes[0] = PAGE_ALIGN(NETUP_DMA_PACKETS_COUNT * 188);
 	dev_dbg(&dma->ndev->pci_dev->dev, "%s() nbuffers=%d sizes[0]=%d\n",
-		__func__, *nbuffers, sizes[0]);
+		__func__, vb2_get_num_buffers(vq), sizes[0]);
 	return 0;
 }
 
-- 
2.39.2


