Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77E05C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 26 Nov 2021 08:02:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=FWdSr2jEpZm0Q7K7jnQ7+JYhpy+V8ST4CzljkwNrkrg=; b=yfhRjKVYdHm6X5
	G4kxsphTlTDDTG9eJ7fcVHoz/NS+7k5BESA5t5rBVDTEwpQaIvz3dfBq7rIzmDe8VkKmFfMgwi0e6
	EmQwYjXvoHZiUjpf82bXKquj7tYR+pnZgQi/9r0H30E5ufh1KAcibebpZKubqDXnkC0b5OlxunVNQ
	CXyUxOMXG4NEIGF9aod4k5iDPypRDOeNR00PG1FnapZ/Ni1TKeVtKQJSjF1K4byoV25TrMTm9Y+vG
	cVC7GbZZXB+UosbMjuWWRQDyI0GnD4TltL+PmX91Ikk4algknfkEte0GvvK0zfjxeSnGtJ78RCH4b
	tVrfAm4zsbYaCXjaqwDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mqWBb-009Z8J-Fb; Fri, 26 Nov 2021 08:02:23 +0000
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mqWBO-009Z6Z-Ht; Fri, 26 Nov 2021 08:02:11 +0000
Received: by mail-pj1-x1033.google.com with SMTP id
 o6-20020a17090a0a0600b001a64b9a11aeso7452689pjo.3; 
 Fri, 26 Nov 2021 00:02:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=XzJnyLoKoL2r9pDH+TfKJ6Ptns8brv9wzjSrYeFUJRY=;
 b=jYJZELPktFDX7CAoqTDsvJJLwcNzfbMrmElOJUr1wILVd3TKfNK9SZRHu6MReoeKzX
 /xNnRvvMsmBCTVXsTz0Lh6qogczs0HrsLC9QTWkqPTzeax6bqmTisblUwI2vOc14olut
 YZfoeuGCgOeDGY4RTJhzVx5Btag+g6ZO32+rEQ0Bc9cAk/pWJCHk8aWXybqa8gGj8qBc
 NwOTsOjhhTV8KWOYIOm7HmFFqxOysUS/Y6GL0hIqyn2uKRiza7SXB5ePY+gL6EvJiRmS
 S596D4sN38VUDzi5TfDZ/qWH3aOMjYePRr1l/gEMjXrfXeOEg3ekHoETIuUOEtQCEvls
 PKIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=XzJnyLoKoL2r9pDH+TfKJ6Ptns8brv9wzjSrYeFUJRY=;
 b=CHWcER5KoAurBMMZwgjRhqlYJbw4vz6qQfuKtsitohYr38xMi9QhzCZalNQLC1pGBC
 f9q6cOOrlfwJnoac/+jh8eggrpX0GPcES5rFBK7BZO+1fJ0WVQzCzmLcUR+52oRhdFGW
 y8ZMXqnzJ9fApWDG015OfypVspXtkjF279sBfEI1tqpTyt3wnd5npkYfsZcfTqOWmteD
 d5Br5tBj4c8+n6rLayk9vIPpt/G8EScmNdaGuPqzSPnxRt1GTp7jfe7sTqcVIXSUY5we
 aaFfdlEintPC/Y1Vh5Ay4WrrlaBMWu0ftoZTfrIEzPGOPgML0kHW3SHivZdH3D3Qzub2
 /qzg==
X-Gm-Message-State: AOAM531VN1JiFOCe6OVAeJY71URvV6ofoC/XAmPjS94EClAwYMuvcce8
 WbI0IpkjJdAVgC31H0fJJZY=
X-Google-Smtp-Source: ABdhPJyEIio+8d028r9zLBU0pWPVjuBfThCeUykJYzCCPF1yuy0UCnKT6HniyuVMlUo9f3fCyvvY3A==
X-Received: by 2002:a17:902:ecc7:b0:141:e920:3b4c with SMTP id
 a7-20020a170902ecc700b00141e9203b4cmr36931831plh.64.1637913728169; 
 Fri, 26 Nov 2021 00:02:08 -0800 (PST)
Received: from localhost.localdomain ([193.203.214.57])
 by smtp.gmail.com with ESMTPSA id h128sm5589315pfg.212.2021.11.26.00.02.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Nov 2021 00:02:07 -0800 (PST)
From: cgel.zte@gmail.com
X-Google-Original-From: deng.changcheng@zte.com.cn
To: nbd@nbd.name
Cc: lorenzo.bianconi83@gmail.com, ryder.lee@mediatek.com,
 shayne.chen@mediatek.com, sean.wang@mediatek.com, kvalo@codeaurora.org,
 davem@davemloft.net, kuba@kernel.org, matthias.bgg@gmail.com,
 deren.wu@mediatek.com, deng.changcheng@zte.com.cn,
 linux-wireless@vger.kernel.org, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, Zeal Robot <zealci@zte.com.cn>
Subject: [PATCH] mt76: mt7921: fix boolreturn.cocci warning
Date: Fri, 26 Nov 2021 08:02:01 +0000
Message-Id: <20211126080201.75259-1-deng.changcheng@zte.com.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211126_000210_616808_BA34DD09 
X-CRM114-Status: GOOD (  10.40  )
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

From: Changcheng Deng <deng.changcheng@zte.com.cn>

./drivers/net/wireless/mediatek/mt76/mt7921/sdio_mac.c: 223: 8-9: WARNING:
return of 0/1 in function 'mt7921s_tx_status_data' with return type bool

Return statements in functions returning bool should use true/false
instead of 1/0.

Reported-by: Zeal Robot <zealci@zte.com.cn>
Signed-off-by: Changcheng Deng <deng.changcheng@zte.com.cn>
---
 drivers/net/wireless/mediatek/mt76/mt7921/sdio_mac.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/sdio_mac.c b/drivers/net/wireless/mediatek/mt76/mt7921/sdio_mac.c
index 137f86a6dbf8..be17ce3ff06e 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/sdio_mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/sdio_mac.c
@@ -216,5 +216,5 @@ bool mt7921s_tx_status_data(struct mt76_dev *mdev, u8 *update)
 	mt7921_mac_sta_poll(dev);
 	mt7921_mutex_release(dev);
 
-	return 0;
+	return false;
 }
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
