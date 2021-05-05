Return-Path: <SRS0=WaF/=KA=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20D3CC433ED
	for <linux-mediatek@archiver.kernel.org>; Wed,  5 May 2021 16:56:34 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CD5FA613EB
	for <linux-mediatek@archiver.kernel.org>; Wed,  5 May 2021 16:56:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CD5FA613EB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=5JsdHQ423fyBXTwEdiYESlKvaHD5EhunnJheHkPvFRA=; b=IAsavyyBP6bR6LGwusPby5fc0
	33QTOWj/YhNegXloTAhSZwxwwavB8hEL0B9RQ4JMV8/gOAKUc6yhp0T292IrB6gPq7zP4iFrtqJiK
	zr07ahAfHdUgO0sGqwAsQsVfvYBkPnpRKSi9dwsQcgvoCV+7jWjUVbpl/9AtN3uNlTXXd59NVMOjt
	ch4dQNrPKXYx3kniROdZ8B17sm7VBGP1lHok+O1v7je8mgsN7AoviSgxcVDbf7e26LD0vXJxcBJYB
	EOlYEVOlm131FU4CbE+EfEvVJd3WDy73nqq8k1amySXTrvKRdkjQMkuIID/pVyC8RocPsGgrcXXFy
	Q7cmhAIkA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1leKox-001nhA-N3; Wed, 05 May 2021 16:56:23 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1leKYd-001hOC-9W; Wed, 05 May 2021 16:39:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=3kMIRmN20xPNRozmagyMKX7PRiZyuwFmfg3B2rKEUlw=; b=u2enSeulXsoXzupwu1XlwxGbhb
 h/ombRCBdpQrzgNGGJ4tked5DXTLVQcCEW7RSi7zqhGkeFzPmHgDvqAZL2zOQVu07BtQMCjE5Uy7j
 c6CUsg7A+EAgWQZH/vCHbVOUO/MgI5/w8VbF71FzqD/mSGmKOAixH8VGjc37+NtSPwfuYRGojOYiL
 y8GeL0fKmFiOILl0dimHkTiw+VJFsRFuEd0CNcfOCckNqMw0qPSkUvHIOLDRFUsSI5mQM6mQXBGDX
 DhqjdMYBwa8MWMfF+EsE52U1jxBBwkTeWMEpw9IOEj6GshWNM6vezMyFPF1j9GzrmplBO1LrX6Sun
 o4nGCAkw==;
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1leKYZ-004xxA-Op; Wed, 05 May 2021 16:39:29 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 484C76198E;
 Wed,  5 May 2021 16:39:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1620232767;
 bh=Eg/G/UjjFFu407dQzUK3rl62N3J47c9o9i1w6JqNAWA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=cPqmf2zLuas0GpCMgUssGfQzMKsyJbWo7W5qnWYVUWfJ0/Cl3wmPlJUR9bFrvh4NB
 OkGOH7gYWWEkxo7KolQr09OYrwA3u1SkCqNwQ/TtgqGlyysEdOpCeFr3krR6SOVBmo
 u4d2vP1OEDmhn6l5+qfMdjmT4+MGdWoref8+/F86WC5hx35Qad6O3XHs12RJxfgGq+
 Q172cnvH4ohQqZcAK7Nygl8oMLz0ojALFvy1xh33Qp+fdaV6X3cLeFO7kgAuFNtJs6
 ZO68kbl5eCoG5k8N1tjNisi080WSqcgcWPVZjdWkCRhYnr2HQOy8qlOdFV/G0Ft5hF
 bSWdew+OklPFA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: David Bauer <mail@david-bauer.net>, Felix Fietkau <nbd@nbd.name>,
 Sasha Levin <sashal@kernel.org>, linux-wireless@vger.kernel.org,
 netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Subject: [PATCH AUTOSEL 5.4 21/46] mt76: mt76x0: disable GTK offloading
Date: Wed,  5 May 2021 12:38:31 -0400
Message-Id: <20210505163856.3463279-21-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210505163856.3463279-1-sashal@kernel.org>
References: <20210505163856.3463279-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210505_093927_878474_D98B31EC 
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
index de0d6f21c621..075871f52bad 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76x02_util.c
+++ b/drivers/net/wireless/mediatek/mt76/mt76x02_util.c
@@ -450,6 +450,10 @@ int mt76x02_set_key(struct ieee80211_hw *hw, enum set_key_cmd cmd,
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
