Return-Path: <SRS0=WaF/=KA=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64CC0C4360C
	for <linux-mediatek@archiver.kernel.org>; Wed,  5 May 2021 16:34:56 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C9FA46191A
	for <linux-mediatek@archiver.kernel.org>; Wed,  5 May 2021 16:34:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C9FA46191A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=NNzOTcdA8Ukbt27oih1gaMdQZeLnwonm2VvBe3/CR7w=; b=Hk+HVL9Gz+AMIsWeKzsyWz1U4
	czZlA3fL2Ef0xPPbua9nNiEUj1/R40zK2l0Itw4P3po75RNn/W3f3pUgnlzqeVfcfPJ9pT1ZGMwuq
	0lZjNT8C8eAVUpo/BM8SqibnSnfv3/qnLSXfReJQNiw7WaL/blqjO25mgi0AF4nOfsK2n/zgVFa/Y
	CmYay1mehhjCKv9U3l6OyKwnXDvpLnf7FMtG9rnmPnBt+JUBbHofBO9FCIYzTevjSIe+LY5DN+MZh
	QR89ce5t5tQiK+lvmLuc9rp8Pl8oeVQ+2AQc9PFoj4ZZ2fxO8ft9i+yz4fS7cBoflT3VPoXSDIpxz
	0JOPOBYHg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1leKU4-001fHL-N8; Wed, 05 May 2021 16:34:48 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1leKSA-001eXB-8u; Wed, 05 May 2021 16:32:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=06C5c/I4c6g+53pPFS1o4sQY8Jfzslt8EoPrfiIth4Y=; b=Koh5fMvAChu7OV3H97SljHqIX5
 s6dbK1Uhw4qqGpIfKa/k9NE/ib+GO5QZRcAXJ/49XPWCwnZOjwUmIkhZHJ6Eauth19Ksvm66el1q9
 uYJ9EdDpdFmRIwp/d9PSEZXatz6jq/4GDc8/1DhKdInGeDo/DDQNkuW6C3rmUPq00982mERcswdll
 yCQGfUDOI/u8eyzd0GDj8gHT/QWOEMkI9TKCSfFd6aqvpyBgcTSfjhk8CiNCp7oOa0+yLJo2nQ3ec
 SBMsbDkCPEO4hOzdOVlBuPEzeFsRcGPHu+7SsOOQH5RTiFqejnHZBZ9eOOuX3MQMrxiCuEHN2GNdL
 k5ijVsww==;
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1leKS7-004wPR-Q2; Wed, 05 May 2021 16:32:49 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4B05E613F9;
 Wed,  5 May 2021 16:32:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1620232367;
 bh=Lg8lKjSCJjYMIeB/wHTWH+FcGtxaZ7xHRqQ8l346B6k=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=YFCkDYhf/3WVYUjJQtfyZgORE2RKWe7l4g82NsBB38K4+kmhPwIddDqZZ91eOzPgi
 GPAL+r3+b9JF5akleg9bj7yBqHvxRHXoKzvIrjRusmcA23esSt/LzU71yLS3mPKQC3
 LmTjSj5bBjyhvWH5Igi/tyeVXgk32EhX+KkmzKgb7Nig6bDebFxm1q4ByLkMK3xhQD
 CxExOsSTqcQZNdNgud1IEBjCD3MUkxBDQgUMTNYotpu+gw4jzdK9GuPgeWdaBD/vhB
 O5RZi1XLGrnWfoI45F0O0jqe6ghnhNtKFuk8ux7oC1LaqBVL0Y10YBEVY3LWHSoWZU
 DNNRD9lKRL2YQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Lorenzo Bianconi <lorenzo@kernel.org>,
 Dan Carpenter <dan.carpenter@oracle.com>, Felix Fietkau <nbd@nbd.name>,
 Sasha Levin <sashal@kernel.org>, linux-wireless@vger.kernel.org,
 netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Subject: [PATCH AUTOSEL 5.12 059/116] mt76: connac: always check return value
 from mt76_connac_mcu_alloc_wtbl_req
Date: Wed,  5 May 2021 12:30:27 -0400
Message-Id: <20210505163125.3460440-59-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210505163125.3460440-1-sashal@kernel.org>
References: <20210505163125.3460440-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210505_093247_892744_30A5A035 
X-CRM114-Status: UNSURE (   9.43  )
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

From: Lorenzo Bianconi <lorenzo@kernel.org>

[ Upstream commit baa3afb39e94965f4ca5b5d3d274379504b8fa24 ]

Even if this is not a real bug since mt76_connac_mcu_alloc_wtbl_req routine
can fails just if nskb is NULL , always check return value from
mt76_connac_mcu_alloc_wtbl_req in order to avoid possible future
mistake.

Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
Signed-off-by: Felix Fietkau <nbd@nbd.name>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/net/wireless/mediatek/mt76/mt7615/mcu.c      | 3 +++
 drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c | 3 +++
 2 files changed, 6 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c
index 631596fc2f36..4ecbd5406e2a 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c
@@ -1040,6 +1040,9 @@ mt7615_mcu_sta_ba(struct mt7615_dev *dev,
 
 	wtbl_hdr = mt76_connac_mcu_alloc_wtbl_req(&dev->mt76, &msta->wcid,
 						  WTBL_SET, sta_wtbl, &skb);
+	if (IS_ERR(wtbl_hdr))
+		return PTR_ERR(wtbl_hdr);
+
 	mt76_connac_mcu_wtbl_ba_tlv(&dev->mt76, skb, params, enable, tx,
 				    sta_wtbl, wtbl_hdr);
 
diff --git a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
index 6cbccfb05f8b..cd92ff915da5 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
@@ -833,6 +833,9 @@ int mt76_connac_mcu_add_sta_cmd(struct mt76_phy *phy,
 	wtbl_hdr = mt76_connac_mcu_alloc_wtbl_req(dev, wcid,
 						  WTBL_RESET_AND_SET,
 						  sta_wtbl, &skb);
+	if (IS_ERR(wtbl_hdr))
+		return PTR_ERR(wtbl_hdr);
+
 	if (enable) {
 		mt76_connac_mcu_wtbl_generic_tlv(dev, skb, vif, sta, sta_wtbl,
 						 wtbl_hdr);
-- 
2.30.2


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
