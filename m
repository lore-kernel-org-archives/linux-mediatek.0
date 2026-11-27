Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03E85606A323
	for <linux-mediatek@archiver.kernel.org>; Fri, 27 Nov 2026 08:36:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Qpegacql;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nJT9suyx
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=7pm7iq8JiqHL4xi9oAqL3bjWHsk8YnMhzZDNfXZZJac=; b=Qpegacql/V+ugZ2Aoe8uS26f1t
	SrgEs0bllDML+MALWTxRqZKjIIp7YIhMdhDbsCuIktApoSQxfzDxexw6/a/id7Iq+tRRNOUY2DBDd
	DYcmBaB5n2Yqsyg9prC7Gt8jueFaWCcU+avRmmqe1lqsCWQ2jX1toDNTBILK78eU780gTNjTuimrq
	8uMRqxMvSp3h9z5B3++76Fof3v/M1VKeXX/OZHtpNUl4BvYeDZ9w1uwlRHCqdSPFR5/olv39w7Vfg
	QVFjQ30fpvR4AwlCOAoJ58gbAMEdKtIFQcA88NeZx9+5/tc7n9O80EZ2HIxoIH9ek0ysQCB6Hhomj
	o06s9F2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWrRO-0000000FGXk-2CLw;
	Fri, 27 Nov 2026 08:36:22 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWrQs-0000000FGCU-38NS;
	Fri, 27 Nov 2026 08:35:50 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 8257A454BE;
	Fri, 27 Nov 2026 08:35:50 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795768550;
	b=rM3PoitRKps3XHVHhzxNUh3y8+r2kRyMX10ICBtZdbOtZ+Xov2Qjg4DphCA0g+avBn6F
	 myZfE7+uOV4ztqBCLZ/TbPGmbx/WkRf0/9UcjOqjxTbo4g2E4bz5FRQ+v8gd0jiPC79tN
	 +Pzjy7vlust4dc+h6alV0wzRVDprJZJ+HPJO382uXg4S13Asy+4hrKk7Bwjb+lQrEGJmh
	 xo2+6JoRrFo+xWpxlE4z5mtWfiaP+EwxTk7wwKEKKnEzcTV31MT6VLPXCPCLqeeFnPrM0
	 M+p6wgNBPnBXv/5BdqfYu+p0/CL2PBpwzSkywykueO/mHRFZmHiZ3rrF6LD4gYBG/2A==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795768550;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=7pm7iq8JiqHL4xi9oAqL3bjWHsk8YnMhzZDNfXZZJac=;
	b=MdRqJX9EPpb1Q/xQ4+sqGm/pPSeO8pTYeGJOJnnS3xSbvXb7xqVcjBIf8BRqMEP5AMHf
	 0rWGpp3/F/vM8imYuRHa28djCd0F8wqUjprpiIRPmSMp3kyAGmhVnt01W0WxPNtvEnWuV
	 mvzehmiMeuhalxriMXPJ3ewN/QU9VR2B6H/55JtaGTz4DVk++pH24m6dKFkx8EyHTzwrG
	 GEC7XjGs6IcqCQhwfUtPbHavOGfd0ijBWSbWRwY23MN03ThiW0miXWOaxOe0IJSsAJ8EV
	 2MLs8C0XTgdfJgnvkF6+nSaA+Dz/8FiNJutVbuTdBBXCfsbJWVY/CdMoGbHxExR6y/w==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 8BE041F0092F;
	Fri, 27 Nov 2026 08:35:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795768550;
	bh=7pm7iq8JiqHL4xi9oAqL3bjWHsk8YnMhzZDNfXZZJac=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=nJT9suyxIs2k0hcj9mOt6xzbJdpOga8UEwD+REtNJaOErdqdydpyloNyea4BZzf7o
	 VgQX3y9iI304pRfy2EJ9Uu1l8T/mXDupjLuH26YbyQIpIQl4Wp5ZSBQNhwxYctkDKb
	 eLJ8J7gWZsx16GjhdTdfguLfawkQ2gJJiAv8eyE0vE2N3JWB1OtnQ+3IY++3NMDKbR
	 TYcMvMYXI3PF/5Ul1hLBDg2auMXQnDsXgoHEkEtzZPJP+azqr34lDW4CZ/twUfOAX7
	 8446dRQyQBIe3HKRdVxpJWiSPeX/juEHz6mmzMxvwLDKZZzAhVYnKryLmKkdtIfrty
	 NlR0AiPWeWv3g==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 5547E4B65A;
	Fri, 27 Nov 2026 08:35:29 +0000 (UTC)
From: Murad Dadashev via B4 Relay <devnull+llamapersonaltv.gmail.com@kernel.org>
Date: Fri, 27 Nov 2026 11:35:19 +0300
Subject: [PATCH 08/10] wifi: mt76: usb: add MT7603 queue mapping
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261127-mt7603u-v1-8-369bee9846f8@gmail.com>
References: <20261127-mt7603u-v1-0-369bee9846f8@gmail.com>
In-Reply-To: <20261127-mt7603u-v1-0-369bee9846f8@gmail.com>
To: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>, 
 Ryder Lee <ryder.lee@mediatek.com>, Shayne Chen <shayne.chen@mediatek.com>, 
 Sean Wang <sean.wang@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Murad Dadashev <llamapersonaltv@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795768526; l=1319;
 i=llamapersonaltv@gmail.com; s=20261127; h=from:subject:message-id;
 bh=5B3d4BCSyaO7bzzq/lINhmLDmquQjWLMFM3C15ts8zM=;
 b=Gau8whhKHdfBN/0NI+HmqoqDF/TluTxmq1bujturKXzB8PAWIFiwcqXQUQmuw/8tJN5qmDW2H
 fYxQcUIk8W0AkFludbk37pTarV/NMZ6UUgmfKp7xGZWHpuQ0AnRH+jP
X-Developer-Key: i=llamapersonaltv@gmail.com; a=ed25519;
 pk=CeMIX207ioWRbMAA6A2GYgT+DpeVlKHVn7I0KjfHeCg=
X-Endpoint-Received: by B4 Relay for llamapersonaltv@gmail.com/20261127
 with auth_id=1664
X-Original-From: Murad Dadashev <llamapersonaltv@gmail.com>
Content-Transfer-Encoding: 7bit
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Reply-To: llamapersonaltv@gmail.com
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Murad Dadashev <llamapersonaltv@gmail.com>

MT7603U uses hardware queues 0-3 for BK, BE, VI and VO, sent on the bulk
out endpoints following the inband command endpoint, and hardware queue
4 for management frames, sent on the inband command endpoint.

Signed-off-by: Murad Dadashev <llamapersonaltv@gmail.com>
---
 drivers/net/wireless/mediatek/mt76/usb.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/usb.c b/drivers/net/wireless/mediatek/mt76/usb.c
index f6464315e3741c849f7a5ff13502abaae2150a37..317ef30a597caea21df4e88848f78191e9be4bb6 100644
--- a/drivers/net/wireless/mediatek/mt76/usb.c
+++ b/drivers/net/wireless/mediatek/mt76/usb.c
@@ -976,6 +976,23 @@ mt76u_ac_to_hwq(struct mt76_dev *dev, struct mt76_queue *q, u8 qid)
 	u8 ac = qid < IEEE80211_NUM_ACS ? qid : IEEE80211_AC_BE;
 
 	switch (mt76_chip(dev)) {
+	case 0x7603: {
+		static const u8 wmm_queue_map[] = {
+			[IEEE80211_AC_BK] = 0,
+			[IEEE80211_AC_BE] = 1,
+			[IEEE80211_AC_VI] = 2,
+			[IEEE80211_AC_VO] = 3,
+		};
+
+		if (qid == MT_TXQ_PSD) {
+			q->hw_idx = 4;
+			q->ep = MT_EP_OUT_INBAND_CMD;
+		} else {
+			q->hw_idx = wmm_queue_map[ac];
+			q->ep = q->hw_idx + 1;
+		}
+		break;
+	}
 	case 0x7663: {
 		static const u8 lmac_queue_map[] = {
 			/* ac to lmac mapping */

-- 
2.47.3



