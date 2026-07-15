Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD728C44508
	for <linux-mediatek@archiver.kernel.org>; Wed, 15 Jul 2026 07:00:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FfUYi4vhDG/NZ5E8zOJ0EWvbRSsTlwPws5qEyE9Tnqk=; b=ExgE2hnaBclL1jsPq7nwq1R2Ri
	vdjc8vOKFLgFE1DWiQHe9pWEh5H/jUhARprUzBJvRs3tsubo2nHvu66sHfToh+a/HKuCOp7JlLUA5
	rx+pFrUN6G838p5j/LLDeN8P0DFGuXnfpaFcjC5kO8Jg7KSTJc7zIJsN5dS4lhfTMdFvHC+IeNr1Z
	3CJ5OvVzwIAbjSjmEkpYwDO8UO+BWHKEQ7SsD4pZYuyGgACEY47gaPz0sX14+a+abc4z6zB6FwxMv
	ckkZeA5cYGt1RV497WrrNHe6vhdVH0/l1HaYeeVumeCtfuCmOinrVDytEDjKNeTf/EQHfHqtiZDd8
	OUxYJJUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjtbe-0000000Dxhx-2HwB;
	Wed, 15 Jul 2026 07:00:34 +0000
Received: from mail-m49198.qiye.163.com ([45.254.49.198])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjtba-0000000DxgH-1VIF;
	Wed, 15 Jul 2026 07:00:32 +0000
Received: from Vostro-3710.. (unknown [113.80.141.85])
	by smtp.qiye.163.com (Hmail) with ESMTP id 463f9b657;
	Wed, 15 Jul 2026 15:00:16 +0800 (GMT+08:00)
From: Chukun Pan <amadeus@jmu.edu.cn>
To: lorenzo@kernel.org
Cc: Bo.Jiao@mediatek.com,
	angelogioacchino.delregno@collabora.com,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	matthias.bgg@gmail.com,
	nbd@nbd.name,
	rex.lu@mediatek.com,
	ryder.lee@mediatek.com,
	sean.wang@mediatek.com,
	shayne.chen@mediatek.com,
	sujuan.chen@mediatek.com,
	Chukun Pan <amadeus@jmu.edu.cn>
Subject: Re: [PATCH mt76 v5 16/16] wifi: mt76: mt7996: Add SW path for HW-RRO v3.1
Date: Wed, 15 Jul 2026 15:00:01 +0800
Message-Id: <20260715070001.1503928-1-amadeus@jmu.edu.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250909-mt7996-rro-rework-v5-16-7d66f6eb7795@kernel.org>
References: <20250909-mt7996-rro-rework-v5-16-7d66f6eb7795@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9f64937fd903a2kunm1a12fe196dbc0
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkaHkJKVhlOGR5ISRlNTU0aT1YeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlKSkhVQ0tVSk9KVUNOWVdZFhoPEhUdFFlBWUtVS1VLVUtZBg
	++
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260715_000030_599732_2C2E752C 
X-CRM114-Status: UNSURE (   5.11  )
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

Hi,

> +	if (dev->mt76.hwrro_mode == MT76_HWRRO_V3_1) {
> +		/* rxdmad_c */
> +		mdev->q_rx[MT_RXQ_RRO_RXDMAD_C].flags = MT_WED_RRO_Q_RXDMAD_C;

This introduces the RRO_Q_RXDMAD_C flag for the MT7992 chipset.
However, the mt76_wed_dma_setup function lacks handling for
MT76_WED_RRO_Q_RXDMAD_C, causing it to return -EINVAL:

[   20.049167] mt7996e 0000:01:00.0: attaching wed device 0 version 3
[   20.114412] platform 15010000.wed: MTK WED WO Firmware Version: ..
[   20.123728] platform 15010000.wed: MTK WED WO Chip ID 00 Region 2
[   20.965401] mt7996e 0000:01:00.0: probe with driver mt7996e failed with error -22

Can you fix this?

Thanks,
Chukun

