Return-Path: <SRS0=WaF/=KA=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34337C433B4
	for <linux-mediatek@archiver.kernel.org>; Wed,  5 May 2021 16:45:06 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D1A4F613F9
	for <linux-mediatek@archiver.kernel.org>; Wed,  5 May 2021 16:45:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D1A4F613F9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=TpanJ906VKmNqtFeplqcN+Yei1J+sJDUzE1XIp6a6dI=; b=kGNUfeJYVESttcIAPSxPUmMFY
	C04oG1q+6z8NwIC/l5wo/oqIzU28wxsJuFx5PFUlAhAdnVG2F+PyBz2srq+tZ98nF8Vf/AZujToDq
	DrSudBBY77zwR0jxHAXzMx9E4airkYK+NSi4vMLYYp6zsfn6c9dP62bSMTfpOCPfzgp+UO2ntEJ78
	fxxTpCniRVM5MlML924yg3c7PKpaTydGa7BV+O/nYqTSRr7qCnBgnDa9UmnT399G8k1OKE18Sm+Ge
	pwOqje/I2GhcB3QAg9IrY9BlE8ZNJ0eU+/yeZ1EywIDIqCfWLLFZMknBYKQXnvEAmkEa/exEY9Bod
	LN/l1qo8Q==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1leKdu-001jQC-Ll; Wed, 05 May 2021 16:44:58 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1leKUn-001fcX-O9; Wed, 05 May 2021 16:35:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=6K/BewMVh8+Bov8x5KovPWe2q2DDgpE3mrXcI7CCMZM=; b=a4Lme8bNVigoJjsDoWfEypUeRN
 ufW2OzzYBcpK8QIGhJGKNmEh7ASSDrT4NvUfB1zkgdw6ksbzw9quw2tvVW7eKHkDpUTKixKYJzH1w
 4ysr4/1f/ZtZ4NlKFTWtvrLoEMPJMlwVRNCXjoN1LwWWMJH3S8n0cR6e4nO4RYlYX/Yv792mSUOX4
 QNVBK5yKUh3bthMls95QE2dd55nECiz6VzKGGaSRe5QJcOuRcre620mCWDzOMZMNgvzepCbMl7y9b
 48zTcY7KDtYjBJ/PzSA2oxbwhwSD2D16UUhKdlh7GWlBQz1DapQYb2Y1RleNUnYMd7huU0QImvdJt
 EnB0uSoQ==;
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1leKUl-004x4o-7I; Wed, 05 May 2021 16:35:32 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id B45BF6142D;
 Wed,  5 May 2021 16:35:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1620232530;
 bh=IPp4mfL+XvNC0dERM3oeP/v+YbaufMNi1bDToE++chk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=t2SRv6zqImbPwY6NnWiKxMUvQp7iBp7zuNepg/nMRODq0ZjY8yMAWC1xpN6Vy0m3N
 HAu9foF9HYHsnQg+7p9xdhMui+hLaqtUgxBGUyWqOBEhSz04AaOXrlmqQ1fB1K7YMW
 2sVUbDJc2Gee28vXQmX9iY3L+r+KYRPAbpa4RmdkSmhsRPjxvyFHKUIa1qPb+sCtZ+
 bNwpTly0IB6+MlUY0A/eO4Q7qNvVJI+J2ntlDfihdgw5oqa+n3Ziwsashtv1yOQ+3m
 eTPk8P5FigBgcn1AiayHskRHez2MrKAzKdqX/dEVnX1tUNNi7q7V3Ixv1CHnIOTn69
 Qt43Z0bt8YtXg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: David Bauer <mail@david-bauer.net>, Felix Fietkau <nbd@nbd.name>,
 Sasha Levin <sashal@kernel.org>, linux-wireless@vger.kernel.org,
 netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Subject: [PATCH AUTOSEL 5.11 053/104] mt76: mt76x0: disable GTK offloading
Date: Wed,  5 May 2021 12:33:22 -0400
Message-Id: <20210505163413.3461611-53-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210505163413.3461611-1-sashal@kernel.org>
References: <20210505163413.3461611-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210505_093531_305292_FD7BD6EE 
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
index 7ac20d3c16d7..aaa597b941cd 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76x02_util.c
+++ b/drivers/net/wireless/mediatek/mt76/mt76x02_util.c
@@ -447,6 +447,10 @@ int mt76x02_set_key(struct ieee80211_hw *hw, enum set_key_cmd cmd,
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
