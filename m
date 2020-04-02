Return-Path: <SRS0=GVU/=5S=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFF2FC2BA15
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 Apr 2020 13:07:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A2BD720678
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 Apr 2020 13:07:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="YhBLf4rG";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="uHNS7aBP"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A2BD720678
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jlHCDYC2q6Y8aReb0A55F9mne929iiMlsUb9rgM5gRw=; b=YhBLf4rGPbrBMY
	rIQ1XvghuDEpaBEGir2MWJz2I3ofHJ7R/3tb/X9hx01fl7QOTc/o5zD13S6zP2yIAG3JoJA1UjODe
	Ri535DzU10mQQiP/7ROYNIbtgeThxYVDNiwXzSK7h7G3822rTRao0wTNPxGIDF0+Vljzhu7qhpO0D
	IEs73/MOXjP2jM4QJEA/L5cJU9kV6C6oeNPTxfJWepf1lJLpYDZ4jIf13nWuyey4nAwsI04USyunf
	rRl94vlveSYGbNqYeNtXUhIbDmWjgamOABrXMGYA6F3mcDH7mvCTixB18PJrKui1NWRcRAlPQHu6P
	I7+2VxyP77/IUMdPKzQA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jJzZT-0004sv-Ah; Thu, 02 Apr 2020 13:07:47 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jJzZQ-0004rN-93
 for linux-mediatek@lists.infradead.org; Thu, 02 Apr 2020 13:07:45 +0000
Received: from localhost.localdomain.com (unknown [151.48.151.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 8FC4020678;
 Thu,  2 Apr 2020 13:07:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1585832863;
 bh=da75WNCyElUBj5uGiEqZob3llwVigdpNXgm0uTRUh+I=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=uHNS7aBPuON3nVqcsz2YAA6n6zHDLnAmq+9XaiNr6inUUaQVLkQ4AGvND4gZHUI3Y
 SbdN4uF+A4nJ9YCRKaVy0tKmn7wvcfCLDo/wbI+/wbQcRmsP8ECNkLWJDtIqqN3LHS
 jhtuVhp/bYUnfFgg36L9Wld1PwfwXqjXzgOIPQ+Q=
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: nbd@nbd.name
Subject: [PATCH 04/12] mt76: mt7663: disable RDD commands
Date: Thu,  2 Apr 2020 15:06:34 +0200
Message-Id: <20da56fe7d926dbcf8e4309a530a8b77602fbb75.1585832458.git.lorenzo@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1585832458.git.lorenzo@kernel.org>
References: <cover.1585832458.git.lorenzo@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200402_060744_346629_53786EF7 
X-CRM114-Status: UNSURE (   8.43  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: linux-mediatek@lists.infradead.org, lorenzo.bianconi@redhat.com,
 sean.wang@mediatek.com, linux-wireless@vger.kernel.org, ryder.lee@mediatek.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Disable dfs RDD mcu commands for mt7663 driver since they are not
currently supported by the 7663 firmware

Co-developed-by: Sean Wang <sean.wang@mediatek.com>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/wireless/mediatek/mt76/mt7615/mac.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/mac.c b/drivers/net/wireless/mediatek/mt76/mt7615/mac.c
index ec6ef6c3478e..7be06ece1658 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/mac.c
@@ -2036,6 +2036,9 @@ int mt7615_dfs_init_radar_detector(struct mt7615_phy *phy)
 	bool ext_phy = phy != &dev->phy;
 	int err;
 
+	if (is_mt7663(&dev->mt76))
+		return 0;
+
 	if (dev->mt76.region == NL80211_DFS_UNSET) {
 		phy->dfs_state = -1;
 		if (phy->rdd_state)
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
