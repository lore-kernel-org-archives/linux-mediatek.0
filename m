Return-Path: <SRS0=WaF/=KA=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37EA5C43617
	for <linux-mediatek@archiver.kernel.org>; Wed,  5 May 2021 16:53:00 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 01A036141F
	for <linux-mediatek@archiver.kernel.org>; Wed,  5 May 2021 16:52:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 01A036141F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=11bPhIzG0YGLX0JPXsTimxdSomiR04zrtIWM+ClccXE=; b=RWHQPfI/BpFqXe2nvqj6eNO5C
	YmFoWcytt4mrUdEJjpCEto5qrfxqbn92XRpTqBEh7wuTq1UnrAXLEjw/jXc96pXagGmuP/Izj9OlG
	GLB+BPswqE7M0K72XHmQk3z+aqnJQOeuy8Befw2atxQ07icNioLXBAlVnsuKbtJ5fPA+X/3v9OGHP
	8BzkGuJ1dz3TULfWo4aJgfIu+LSCz1mhI+TA01mCMk/xGK9VvqH+MZOOPSvCKQ6C4t3b9dxjQU62C
	D7JAQDQ0wKmubA0vT9xi8P5fjXf10zUW6/zxJrgsItkj2NyoHpkmB+/ETbhjp3hhYHLrIpLzUWvhg
	WeAgczoDw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1leKlZ-001mMH-4i; Wed, 05 May 2021 16:52:53 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1leKX4-001ggX-2l; Wed, 05 May 2021 16:37:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=WCT/wUsy4P2JyvPokTiNxmu/wtWgrl7lE4INfqHBHMA=; b=bk+JZiCcQLGnoFHCJJUWS8afAg
 K/5gAqqh5TDDaWoC9tPJ4BObTF40gPbzpLbMn+r7jy98K4exlogqzIgf+7QTFD1DKzqQIzMsJzp6J
 HqD0A5TR6sz4N2WSna65GNI9UeFzkr9krEeKuaMrG5BWO7rctVNba0oX0uC29L4EXageqfyeRuqDq
 5A9WUAfsZoxAI9y8A2fzdsjd5EeuTXlc0DKw5hddqEgeVTBOhGetJxnMLJsQffE6ORyBnmy4IOLAU
 O8BNZUcWd3otavrOD7PtRg/6knCpBdaDRkElEELdP8JgbCVvO+Ec5UQL3Siv8S1AYvoDCwwWTVB5p
 Czy7KmaA==;
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1leKX1-004xZk-G1; Wed, 05 May 2021 16:37:52 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 081506197B;
 Wed,  5 May 2021 16:37:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1620232671;
 bh=7/yiiwyr0m7qxRY/F3kNmtS+61oV1lKmu4wBeIw884Y=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=S6qWMCUziKQ5VGff7bVj4cZF/fHv64LIozMgBADs6a4vhp+n8J2Gzm2cxuPdCCnQn
 nOfHHgc8hxUtMVZZViB+0BrOBDsx/x5qXBdBwBcwKihMXYYlekXh2uSADNzmLqZbbd
 N56I86DQ15kdjgVp9WQxMxIBsLALZQ735s2Uohnbq95K3r4jm9bh5JuxR5XarZZ8rM
 Gcyk28OnUkw1Xnr/hnhKk8OIPntiTDkZma0b3he4AQpkeVsY+YVppJ3unnNVFICGSU
 04JneMX1ki94Kspf/T8gk1e86Jx6OmAhF7RlBK61yV8VPsnfyNgNHqVvcfcx+xBHdE
 DDYS7seiu80lA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: David Bauer <mail@david-bauer.net>, Felix Fietkau <nbd@nbd.name>,
 Sasha Levin <sashal@kernel.org>, linux-wireless@vger.kernel.org,
 netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Subject: [PATCH AUTOSEL 5.10 42/85] mt76: mt76x0: disable GTK offloading
Date: Wed,  5 May 2021 12:36:05 -0400
Message-Id: <20210505163648.3462507-42-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210505163648.3462507-1-sashal@kernel.org>
References: <20210505163648.3462507-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210505_093751_601249_1338B024 
X-CRM114-Status: GOOD (  11.51  )
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

From: David Bauer <mail@david-bauer.net>

[ Upstream commit 4b36cc6b390f18dbc59a45fb4141f90d7dfe2b23 ]

When operating two VAP on a MT7610 with encryption (PSK2, SAE, OWE),
only the first one to be created will transmit properly encrypteded
frames.

All subsequently created VAPs will sent out frames with the payload left
unencrypted, breaking multicast traffic (ICMP6 NDP) and potentially
disclosing information to a third party.

Disable GTK offloading and encrypt these frames in software to
circumvent this issue. THis only seems to be necessary on MT7610 chips,
as MT7612 is not affected from our testing.

Signed-off-by: David Bauer <mail@david-bauer.net>
Signed-off-by: Felix Fietkau <nbd@nbd.name>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/net/wireless/mediatek/mt76/mt76x02_util.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt76x02_util.c b/drivers/net/wireless/mediatek/mt76/mt76x02_util.c
index 11b769af2f8f..0f191bd28417 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76x02_util.c
+++ b/drivers/net/wireless/mediatek/mt76/mt76x02_util.c
@@ -446,6 +446,10 @@ int mt76x02_set_key(struct ieee80211_hw *hw, enum set_key_cmd cmd,
 	    !(key->flags & IEEE80211_KEY_FLAG_PAIRWISE))
 		return -EOPNOTSUPP;
 
+	/* MT76x0 GTK offloading does not work with more than one VIF */
+	if (is_mt76x0(dev) && !(key->flags & IEEE80211_KEY_FLAG_PAIRWISE))
+		return -EOPNOTSUPP;
+
 	msta = sta ? (struct mt76x02_sta *)sta->drv_priv : NULL;
 	wcid = msta ? &msta->wcid : &mvif->group_wcid;
 
-- 
2.30.2


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
