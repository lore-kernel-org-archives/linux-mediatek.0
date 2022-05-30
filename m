Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0FDAC433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 30 May 2022 13:30:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vzO/03JrudXF2om3og7lFvv3PoYXFgTobgfZV7SHLG4=; b=uEl9vkUBBZVMzM
	bI0HFilcmBDfDucy3+gFgTtoO2y9bOrHuaAVaVrKtUBTRo6anVTrKX2/AR0ZYEAHJH10ziZdq9B6M
	8Xk0PqQd2f8x+OaGIw7Yr34ayxrA4Zo4CMaARgtLX68HFtNxcot2nmQldsYcrN3a6VLWT7VtPk32L
	JdAbureIYLyY820D2heDEAWs40TI8jI8jNWHAZq+IqKGWj7753lHdH30Zes1hnJKEsizYWjLWs8DW
	1lsrVmODlO2zRxZk8Nq8dcFhtlgAjw4ThvfBqx59VPzL9U2IcMbBfiConbHT+dGEamtt9Yuo2Tc4j
	e5x06cpKI4opYcd7I1VA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nvfTi-006iiB-KQ; Mon, 30 May 2022 13:30:38 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nvfST-006i1N-Bz; Mon, 30 May 2022 13:29:22 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 09907B80DAC;
	Mon, 30 May 2022 13:29:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 753B1C36AE3;
	Mon, 30 May 2022 13:29:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1653917357;
	bh=VePB9HYfx5w6HP34ukuWlxDdJC0cAZBd+ZDzUXQyhfQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=u1K2sU4KTLIzppIMW9gb2i6kKWCD29pKfzRv2QLA9SHg+jhXUJfgyN36onWzvCKvx
	 cCnAzgjGLzHW2Yrfcvj/ohgjSIWIU3EpsCJzu+IfcfIXKBAjln0ehvVs+3eRYXP3Jt
	 E06L8WdBiJvFvU73QzJTtlewRHGh1jofOk9VFzsQ/CWnrjts19Ojwdbrn30NYcvhq8
	 4eFiJDSvbJM3RF+dSkEyjgHgPzCd844vDLetttkaPdpzWicUXoNq1embdHG5baKCqq
	 HTvYKrZ8vFAtdZ6um5nZdjeVAW6sDZUlWlUgTiJrS8+I4s7F0+JzM5arsYl4uUZCBB
	 W411Q3u8i3vzg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Felix Fietkau <nbd@nbd.name>,
	Sasha Levin <sashal@kernel.org>,
	lorenzo@kernel.org,
	ryder.lee@mediatek.com,
	kvalo@kernel.org,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	matthias.bgg@gmail.com,
	Bo.Jiao@mediatek.com,
	sujuan.chen@mediatek.com,
	shayne.chen@mediatek.com,
	greearb@candelatech.com,
	linux-wireless@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH AUTOSEL 5.18 109/159] mt76: mt7915: accept rx frames with non-standard VHT MCS10-11
Date: Mon, 30 May 2022 09:23:34 -0400
Message-Id: <20220530132425.1929512-109-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220530132425.1929512-1-sashal@kernel.org>
References: <20220530132425.1929512-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220530_062921_598226_6E98B9CC 
X-CRM114-Status: GOOD (  12.62  )
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

From: Felix Fietkau <nbd@nbd.name>

[ Upstream commit 77045a3740fa3d2325293cf8623899532b39303e ]

The hardware receives them properly, they should not be dropped

Signed-off-by: Felix Fietkau <nbd@nbd.name>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/net/wireless/mediatek/mt76/mt7915/mac.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mac.c b/drivers/net/wireless/mediatek/mt76/mt7915/mac.c
index e9e7efbf350d..a8df65cc115f 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mac.c
@@ -521,7 +521,7 @@ mt7915_mac_fill_rx_rate(struct mt7915_dev *dev,
 		status->encoding = RX_ENC_VHT;
 		if (gi)
 			status->enc_flags |= RX_ENC_FLAG_SHORT_GI;
-		if (i > 9)
+		if (i > 11)
 			return -EINVAL;
 		break;
 	case MT_PHY_TYPE_HE_MU:
-- 
2.35.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
