Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 150ED606CF8D
	for <linux-mediatek@archiver.kernel.org>; Mon, 26 Oct 2026 09:58:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=x6kgC04H;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=mhWk2P0i
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=ZkrjTGKpjcuZ/tYx9QE/Yhm7rGoild+k5lq+5pxzVsM=; b=x6kgC04Hpvk3my
	zNgi0GUsbRopk9ONN6d5g1wJjkRcg27air/SJwgrxiBG5Xcqh2DBrKIjOXGtN7HppjrUhyC5PcGUI
	HQKfqVtpy6q3zfF6GedYlJjdU/BnFRgm6fSNFXWUUDCezVRK84LGFuU+xtkmQ690Ej3hIz3yJlXPY
	6cGsYmD3DZETOEMUtFL6ZZJsfrx1bIpCn1GodFqmyJJfBp5nytuj72OTrG70ifropjri0q2JmH5eu
	tOAi1yS649USQrY39JLrooFa8+g0ugRiKwMmTv3hHMCaTCrdbyQKLueGFb+YcqphaoVj3S8lomcVl
	XrtrSnGChCKoT+5Hj0zQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLHSx-00000002A5G-2k0u;
	Mon, 26 Oct 2026 09:58:07 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLHSt-000000029wX-16aQ
	for linux-mediatek@lists.infradead.org;
	Mon, 26 Oct 2026 09:58:05 +0000
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-8a39e5161c1so926622b3a.3
        for <linux-mediatek@lists.infradead.org>; Mon, 26 Oct 2026 02:58:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793008682; x=1793613482; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZkrjTGKpjcuZ/tYx9QE/Yhm7rGoild+k5lq+5pxzVsM=;
        b=mhWk2P0i34lcUqs4PzvwvqK6ZJDz5+r9zFEbkvb71n6WRNh20qkkHKcvPKRscp+Uo3
         8WId0ctM9oOw3y+aPFI6NMdGSZEIuGoWmcG8BfeEYedvJlBOC8Mp5cy5vPhtLtp7Po8q
         hesIvwsid+eNOopDsYshEL5eQbxFaTphM/Yp6cvvIE1xezock3US/Wl1fhkwjUFGQntP
         89FUz67YMSxVg0/Z/eRHWRRP862kU6WzkDWjTo+A1Zb7FP2mIGmTU5ti2EMyh/CJ9+Je
         8oj9yvQO2mzhvPHze85K/WafIp9bJ7xtmVUecEnrA0AcVMbuL4RMz+Vh9dR771vcklgV
         SFOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793008682; x=1793613482;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZkrjTGKpjcuZ/tYx9QE/Yhm7rGoild+k5lq+5pxzVsM=;
        b=oPTE71LJ2tfGX1sSk9g9Lt8FZggtipoTDxCf0SGXjn2MnLJ1bYUpg9TFk2SSt5CCum
         XWv3sB4j0XrbwhRfvixFsEizgI6ebl7C/a7O2wzRSYUPaKAAxwkIIZYdeMNEKDGDLzf0
         Bv+otg4uFmc33vSCDQX1S3R8MQc0aF857Mugp7Lbg1x39hTCoN+nw6v9fgAORmMcc/W4
         ad+3JvmEEDCOBhMbsYa70HINbbGx3uH2/I1m6IMRJ+oF97vlYMQMKuLtEuMhVKI+BnRR
         3U95d8at6zO122RAxtPVEGjOFDynR6RpaHj6Z3ndI02sI1FddoByE5SONJ0c6QJie850
         UMwA==
X-Forwarded-Encrypted: i=1; AKwUvByvLlKBi8lrJl1iVJPanpVaDdaZL+NEoloMUTo1WPmAgA7khQB4MhpMNDNJxiIKtyzKJLP+xLLwxqs1wxbuDQ==@lists.infradead.org
X-Gm-Message-State: AFq9FYJaMzyeH01hHRdtHj8wAy6M57qqYDhv3IXHTFxK0FZLguwZjGKw
	te5qgLF6Z0hZqvV5DMedaTXWQoqg5G/Elu+V81LVO/SRq2cwUtP5fZhtBvyIreWd
X-Gm-Gg: AYBFou0XWNOiQ7NtQ4VfjXTJFRwV9OZ5TdKtVKYu6phmIlfsnvwGbT+IcZww5NQWMl7
	x6wfE6D9QxkvvE6MQyOlKTyaWx6JOxYf3EkxeFF5x3JFLJGxxBtzxzroMCTktR4ZzmIbbnZT4ge
	zVQ6scetJqoC87FEMtCtj9NZ7/5utfz7UpdzHeNj5c2i39F8C3WHlmxfNqH+0Ockkg4cGEN4iha
	IwP5XjHqLbI8DTetB/3OMXln0/ZP1I77yISdWcif61f3+JDC5wEOWZMFtbLEiD0c5EAyA6rdno4
	JVbvBfemNwIrb2VoML6tCQqWCyYJLdXXE25eTfH71T7p8aH3H0SCIiUijrv/UcJdXwr1VkFMoVg
	4q7ySWZPATmsqLQpVQyS+ynJjloUvor4/qgxcw7mWVMaJzRC3bBQ0PQIprMOepL++nsC9Xt8AWf
	mTZmk2GfkMzLhnBCb89q+qFUnC6mzYexq+3FLr+2dqrjTM+r3fLcVFDijWv03x7KzZst76jLtaO
	MyeodJtynT2697+85U89Sp07U1Jt7hcsKPO+Mvi2kA0C5lxgpCNRVPP9ZS7rIf0d6GPWiwL3Vix
	z0ZuJ4/8zA==
X-Received: by 2002:a05:6a00:9093:b0:878:3783:8a88 with SMTP id d2e1a72fcca58-8a3689a9e0amr5082831b3a.52.1793008682324;
        Mon, 26 Oct 2026 02:58:02 -0700 (PDT)
Received: from [127.0.1.1] (59-127-145-64.hinet-ip.hinet.net. [59.127.145.64])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a36bf0f4dcsm1095577b3a.44.2026.10.26.02.57.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 02:58:02 -0700 (PDT)
From: Zhi-Jun You <hujy652@gmail.com>
Date: Mon, 26 Oct 2026 17:57:29 +0800
Subject: [PATCH net v6 2/4] net: ethernet: mtk_wed: fix reset condition for
 rx wdma
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261026-wedfix-v6-2-a52f6b15d2fc@gmail.com>
References: <20261026-wedfix-v6-0-a52f6b15d2fc@gmail.com>
In-Reply-To: <20261026-wedfix-v6-0-a52f6b15d2fc@gmail.com>
To: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Sujuan Chen <sujuan.chen@mediatek.com>, Rex Lu <rex.lu@mediatek.com>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Sashiko <sashiko-bot@kernel.org>, Zhi-Jun You <hujy652@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793008668; l=1247;
 i=hujy652@gmail.com; s=20261026; h=from:subject:message-id;
 bh=KHuNb2dXEaBZgB0w45LgKUexXhH4JlXqWzUxUbg3sfY=;
 b=ZGYVb454jS3iS7dka2Wxnt/z9ajD8qAN2Wb5iUIt2lWi9KINhIlEdsUJT8NTJapNe+/51Z8Oq
 /hngfvKzvT+AkkuPLM0fGdef/c2DGWGBEQtdQ/RmPTv9fVm7MLdmsdb
X-Developer-Key: i=hujy652@gmail.com; a=ed25519;
 pk=uXjqvnRsKEfHEyUr63sOg4fEJIDs4AmiW/rB1cWarXg=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261026_025803_343783_B1F17848 
X-CRM114-Status: GOOD (  13.10  )
X-Spam-Score: -1.9 (-)
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

In mtk_wdma_rx_reset, currently only resets the CPU index of the rings
that doesn't have a descriptor. This is wrong because no descriptor
means the ring is not configured.

Also mtk_wed_start makes sure that all rx_wdma rings are set up this
would lead to no ring getting their CPU index reset.

Fix this by inverting the reset condition so allocated rings will be
reset.

Fixes: 4c5de09eb0d0 ("net: ethernet: mtk_wed: add configure wed wo support")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Link: https://sashiko.dev/#/patchset/20260724172040.1653-1-hujy652%40gmail.com
Signed-off-by: Zhi-Jun You <hujy652@gmail.com>
---
 drivers/net/ethernet/mediatek/mtk_wed.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/mediatek/mtk_wed.c b/drivers/net/ethernet/mediatek/mtk_wed.c
index d55042ccaff1..3f0be70c3f14 100644
--- a/drivers/net/ethernet/mediatek/mtk_wed.c
+++ b/drivers/net/ethernet/mediatek/mtk_wed.c
@@ -257,7 +257,7 @@ mtk_wdma_rx_reset(struct mtk_wed_device *dev)
 	wdma_w32(dev, MTK_WDMA_RESET_IDX, 0);
 
 	for (i = 0; i < ARRAY_SIZE(dev->rx_wdma); i++) {
-		if (dev->rx_wdma[i].desc)
+		if (!dev->rx_wdma[i].desc)
 			continue;
 
 		wdma_w32(dev,

-- 
2.55.0


