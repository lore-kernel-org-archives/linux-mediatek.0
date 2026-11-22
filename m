Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E555606A330
	for <linux-mediatek@archiver.kernel.org>; Sun, 22 Nov 2026 11:09:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=pGZqsre1;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=L2EcyR/6
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=s2sjkD46NcJDT+xDH/ZdCg+OR/C0xaYg39VFaMApPuE=; b=pGZqsre1lQ5Q07ZLP1CoWGqc/g
	bHglm5UiiZWJBcNdSQtCWMSeFpQcLT3sXKTCQ8iU079lqllM4LmmZkDt1Ec+MmArMNDWhcvBMwPap
	rIImblIo9UNqBBjcdLjZzqby04EVPncrhLALslZ/fjQ94P/Ybf30H8pqfOe/klKFIRJiEUFI7dWNO
	7i7OJLSYwQufkDzGaEA5m+E8F9j24Z6Y5if4P7SjFEGBrkRQPAJhzMoyjUCpUx6MraPvL1uTXrmP+
	GiWOA+WesznPoNROM56PZ8fsp3q14v/8W3Iui2bIxG3aqfPVcMGBXK/SU6RYCD4g1crwOd0rg3MLn
	kDVpHe8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xV5S4-000000010OR-3MTh;
	Sun, 22 Nov 2026 11:09:44 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xV5S3-000000010OE-3viM;
	Sun, 22 Nov 2026 11:09:43 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id CE0944244C;
	Sun, 22 Nov 2026 11:09:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3588F1F000C0;
	Sun, 22 Nov 2026 11:09:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795345782;
	bh=s2sjkD46NcJDT+xDH/ZdCg+OR/C0xaYg39VFaMApPuE=;
	h=From:Subject:Date:To:Cc;
	b=L2EcyR/6BQbQhMQAK3fmapE/EsR42+v9yn66RrsTF/7ARasFsF1H3wShKs+/KfhGZ
	 vrRSsv26t+ciftptMm8UQbYTu1IFCgr3GSWx4xrGtUhcO3QzSM+ShBE0+ahapj7lrI
	 bWEZTDHjgPS7Lxk2P+18Q1z2aLxsMI7mJJ5tT9eQg0qrpUnf7loeqIO2JuOq/dODwX
	 150b3SzcIWDjVxYvmooocD9iXustSa1Ey4qWf/Od4A5CNnNq17EicxCa3MAiRq06HJ
	 KMGMWCanSIZJedhYwOM0WQ93h6761AmP4rMqaerRcrFsMxVal7o5doCIuKiI/xTknL
	 9xntSt9XnqdQw==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Subject: [PATCH 0/2] wifi: mt76: add some npu missing fixes
Date: Sun, 22 Nov 2026 12:09:13 +0100
Message-Id: <20261122-mt76-npu-fixes-v1-0-8d8876b91970@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3LQQqAIBBA0avIrBtIM6WuEi2ipppFJloRiHdPW
 j4+P0GkwBShFwkCPRz5dAWyEjDvk9sIeSkGVSsjpVJ4XNag8zeu/FLERutJr60ksh2UyQf6Q3m
 GMecPhEtf+2AAAAA=
X-Change-ID: 20261122-mt76-npu-fixes-344a4f51ee79
To: Felix Fietkau <nbd@nbd.name>, Ryder Lee <ryder.lee@mediatek.com>, 
 Shayne Chen <shayne.chen@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-wireless@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, Lorenzo Bianconi <lorenzo@kernel.org>
X-Mailer: b4 0.14.3
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
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hold queue spinlock during mt76 npu napi callback.
Do not run mt76_npu_queue_cleanup() for not allocated queues.

---
Lorenzo Bianconi (2):
      wifi: mt76: npu: acquire queue lock running npu napi
      wifi: mt76: npu: do not run mt76_npu_queue_cleanup() for not allocated queues

 drivers/net/wireless/mediatek/mt76/npu.c | 45 ++++++++++++++++++++++++--------
 1 file changed, 34 insertions(+), 11 deletions(-)
---
base-commit: 7ec7ce74c41551aa39e0c1d6a69c4a2c66377c32
change-id: 20261122-mt76-npu-fixes-344a4f51ee79

Best regards,
-- 
Lorenzo Bianconi <lorenzo@kernel.org>


