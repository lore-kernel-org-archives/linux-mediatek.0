Return-Path: <SRS0=6VVk=OM=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A2D4C433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Sep 2021 23:56:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 39B2D6115A
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Sep 2021 23:56:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 39B2D6115A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=drI/nV+TQYk/zNQpZ+V+R4vehA1PuzH5+tepTZxRxM4=; b=NIrY0gD2w1RepH
	/uC1XvvFAVEYLb7RyvIv6oi5+Itwq9Bedjub1HU+JR8Cug5OlZyUuY25ZkbtxfG/Jaoeg5t++9QmW
	XoQBBJ5hadrlsZPB/jy0QPRa05KcAZ4wLUk3Z71emLSj3hChDdX+BlahQvkAhRSQWokE+/MtCZfAT
	DzoQMkYI1ncj3dGJxGB6Vy15xdIB9as+siAmapRsXditRWtjIrhJ/EmnEBff1vr15i60FVDQyVqbM
	JGRwzGUb4N0utzyePi+xdD0wFadbZQZJJmKDAvF5RRb+IPCqS5ujEwz4Vq5whHXqkLsidQWDGMWF/
	xBo5RcKz+Vm3pPOYdb/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mTC6J-009yDS-Eb; Wed, 22 Sep 2021 23:56:31 +0000
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mTC67-009yBx-AC; Wed, 22 Sep 2021 23:56:20 +0000
Received: by mail-pg1-x52b.google.com with SMTP id e7so4520226pgk.2;
 Wed, 22 Sep 2021 16:56:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8GeJbL+pJAm/EEcPNSUQ0H815jUQQBV0JAJ1k+wFbAw=;
 b=fLwby+9MqsGywGa75uLqPn+OZKy4r7MyL627jF1XB3vUoaI/hSyMfF6iec25aAb8Vi
 l1eppt6OERCN/xJhOG7UXw6PrbKKKeaVVYMXWl5C03nBaNRqmoPOMo/Nt5qPIR3cGYEt
 VRKoTxglziaAyjz826FLwr/VhXkBWysbz4rU79LREHLhYDRqrqSP7jjDXVZFJvdy4jWd
 CWZg5zDUKYaBpeeM8zobANjahoY7xJdf1Z2bhEhfFlhDvTQ0s4zcrsA2IT2j7V9gElIL
 amIy9LqTMt3EuXbvmkFZHfDh+e45AEOvoNcX3mqfrhbaB/uE/JNtDkHbXTmuR31o01R6
 Zjzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8GeJbL+pJAm/EEcPNSUQ0H815jUQQBV0JAJ1k+wFbAw=;
 b=Ji8693PeIXPZ3G/mpdW8WUANgo7/w6evW/iKtAbaIm75a8McMViVooNcIGwCo/OCEM
 RR0LLKDnM7q2z5DwngYDuvi2s2I62+zI25g13UtCaHGw/zq+ARW+5yQJhaR+YkmVT3gg
 oxyOH+qinLtsQFV9c9Dt51GDUT84+XUP6Bya9bYlcLJRIKE3/8nGlpIAy9ktdo8Nmn/1
 oGvZL3XO1I4oho5V1S98IRZGGZ8EyqqlR/zEj7P2yBQ6Y5hnU9r6AYeK6yaDrDXP+JEr
 7BAw+rKcJL/oX94aVnBleNJ9G430F0+UDvm6qruNG+P5/dP9fSt8W39dOUWIhT3SFZm8
 9tWQ==
X-Gm-Message-State: AOAM530LgFvXZMt2kz4NSpJCF+zLwI4LU1VCTR2IpwRvlhyfK9O4j5+q
 I+FwdV7AgW3Gll0T5X0O8Mc=
X-Google-Smtp-Source: ABdhPJy0RcjDGsoi5EgJ+AtjgaucjarMi7aKc30L/g+lbRhenYwQWd7f22F1aFJtBKpNLClesolNhg==
X-Received: by 2002:a63:d002:: with SMTP id z2mr1480578pgf.234.1632354977727; 
 Wed, 22 Sep 2021 16:56:17 -0700 (PDT)
Received: from ilya-fury.hpicorp.net ([2602:61:734d:a400::b87])
 by smtp.gmail.com with ESMTPSA id qe17sm3332445pjb.39.2021.09.22.16.56.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Sep 2021 16:56:17 -0700 (PDT)
From: Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>
To: Felix Fietkau <nbd@nbd.name>, John Crispin <john@phrozen.org>,
 Sean Wang <sean.wang@mediatek.com>, Mark Lee <Mark-MC.Lee@mediatek.com>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Pablo Neira Ayuso <pablo@netfilter.org>, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>
Subject: [PATCH net] net: ethernet: mtk_eth_soc: avoid creating duplicate
 offload entries
Date: Wed, 22 Sep 2021 16:55:48 -0700
Message-Id: <20210922235548.26300-1-ilya.lipnitskiy@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210922_165619_395422_501560C5 
X-CRM114-Status: GOOD (  10.62  )
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

Sometimes multiple CLS_REPLACE calls are issued for the same connection.
rhashtable_insert_fast does not check for these duplicates, so multiple
hardware flow entries can be created.
Fix this by checking for an existing entry early

Fixes: 502e84e2382d ("net: ethernet: mtk_eth_soc: add flow offloading support")
Signed-off-by: Felix Fietkau <nbd@nbd.name>
Signed-off-by: Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>
---
 drivers/net/ethernet/mediatek/mtk_ppe_offload.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/net/ethernet/mediatek/mtk_ppe_offload.c b/drivers/net/ethernet/mediatek/mtk_ppe_offload.c
index b5f68f66d42a..7bb1f20002b5 100644
--- a/drivers/net/ethernet/mediatek/mtk_ppe_offload.c
+++ b/drivers/net/ethernet/mediatek/mtk_ppe_offload.c
@@ -186,6 +186,9 @@ mtk_flow_offload_replace(struct mtk_eth *eth, struct flow_cls_offload *f)
 	int hash;
 	int i;
 
+	if (rhashtable_lookup(&eth->flow_table, &f->cookie, mtk_flow_ht_params))
+		return -EEXIST;
+
 	if (flow_rule_match_key(rule, FLOW_DISSECTOR_KEY_META)) {
 		struct flow_match_meta match;
 
-- 
2.33.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
