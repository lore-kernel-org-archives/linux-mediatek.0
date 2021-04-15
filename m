Return-Path: <SRS0=QSA9=JM=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B901C433B4
	for <linux-mediatek@archiver.kernel.org>; Thu, 15 Apr 2021 23:03:38 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D0327600EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 15 Apr 2021 23:03:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D0327600EF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=gtNOjV/smOQqjJyEfqDQJC3CKzCOTtqNjs9yM6b2XqU=; b=knuzjvLHV16dm/Q5fw75d6Juu9
	h2zI9k6OfIoAbNXZtP/DMTU7+Hcom2zCWdl879xXsW6U9WP1IyASjCxhQrbyY5YTxX9dWslY80Hax
	kSQHwVCzv8PYjV31vzOB6Qg5qS+0USN13Wqx/H5TQJKml6vOVz+tcFrTJ4sf4y1vEvs9og2h1ibPh
	rvXa5QgDC7D27Wvl8dR7u7GgMWu84g1jLRCx3txk0ilZ1KI5tLcZPlJtnvOXft6R+ru+YUn0yWyzb
	rtFy/JrfwiM0j6rgvm3tfinJmIZ5QsxCRhdPVwz+NQF8CoPbY4PQhzVWaJaqQkCsne/h0U+k+3xrI
	jk/j3oUg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lXB18-0000Sk-He; Thu, 15 Apr 2021 23:03:22 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lXB0u-0000Rr-2M; Thu, 15 Apr 2021 23:03:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=VEsA/vSJtUoYWrO4uAbtIW1LBwaGDshRVIPmviTWMZg=; b=FZJpWxvnHVNGyuM5vaFvcZnQMt
 +Z8wHqvAvWoAFttS1EvAXyJLlJtVhYcaW4pFKqaIZ91TBf19Bq9zrrUi/PYELgMgsuipcpj3QwrCy
 g+eJ/psVga5JZ6cT2PWml2/xATOmyV3n3a3H0UFYtT5RVDMydCP33/MYyYA/UNb0voLis8FiizbrU
 /aNDZbkUKuLrYmG+BAsOEPKGB2Rwg/3U5e6HlUPxXXTO9S0SBTnbw/3xJjgfo4U148KZ81aJYyoY1
 3MBOcBY+5aIuVJk1NZSpiDuf5P0ZaDX2wE9lK6gKyOUgXsFvIKpZqoyiquF34fP1YZMRtW46+sT6E
 NE4wt0GA==;
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lXB0r-008xRl-CZ; Thu, 15 Apr 2021 23:03:06 +0000
Received: by mail-pl1-x62a.google.com with SMTP id n10so1803857plc.0;
 Thu, 15 Apr 2021 16:03:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=VEsA/vSJtUoYWrO4uAbtIW1LBwaGDshRVIPmviTWMZg=;
 b=sTY43m/J0eQ1mveMQ0MibuFp5oZf0LZCRmqg4cCRYn0G2Su5DkBrOctoP1pYz2RDYk
 BOPrfaZ60KA9xirVL7WeZms9PlqikmRhClL26Od4u0I0VjIt0Y8p7JWId+JHC0F4f8Ux
 dKvvKixr6qsJqVuQ2eobuojielaJfhM8b3A5yNBlURA0Og7OFB+oIvIoXp426W2GOYv5
 6A/T2XYmKE4gQXAjJd8iES7zbennj5VdzUGlwry8O5ZSVk+0duoacUarPlIrfOpWwaMu
 0VK84C8hyAz8ms0f4LHRMMZVEV7xw29dQzWhZacgIW5J7gFtCA7jUoiM0n2o2PkYF47A
 IPDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=VEsA/vSJtUoYWrO4uAbtIW1LBwaGDshRVIPmviTWMZg=;
 b=Qp5GEauzsgheb0iifLkks9X4/DG9cyKcv6FJKf+E+7J6Gl/cTQWyaYdf3KlEq448aQ
 QtAeSE53e/onxoNYuAsLeDcIH2DjoOeY7KE5fRxiszmHYv900AFdYY1cH1YX36gfalvS
 cNhpubEwHKEw8Esf8A8ZMfs0G2VkauojUpGHJpeuEQto8qHcem841Emliu9ckrfSiB8s
 w9QdqK0We4g/tdCx1m5WgUZ1M2TxfgXFidpTgU0KEo0RdqgS4tRVRrL/28RxbhqpLz8u
 BTTJHv3b9mShRKvhJQW2chPW82t+gu98oz0EsdXDdk9DeW0DQrZvX/M3e0iPuXiodZLQ
 MVOw==
X-Gm-Message-State: AOAM530Dnpg87aOvl+svSzZSkep+fzm8SH8VxkoSjzgMvcBxLPdEf4qX
 ruX29IVlcKppBLoYquJBTHI=
X-Google-Smtp-Source: ABdhPJzvCvR+LUagBVcV1BGlfgoA/0OIIsUcxnNmR0cY9uYIsczoVfDFBbwaGep2Kn8Hf1LBAOsx6A==
X-Received: by 2002:a17:902:8504:b029:e9:ab75:3938 with SMTP id
 bj4-20020a1709028504b02900e9ab753938mr6536729plb.24.1618527783953; 
 Thu, 15 Apr 2021 16:03:03 -0700 (PDT)
Received: from ilya-fury.hpicorp.net ([2602:61:7344:f100::b87])
 by smtp.gmail.com with ESMTPSA id e23sm3004019pfd.48.2021.04.15.16.03.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Apr 2021 16:03:03 -0700 (PDT)
From: Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>
To: Felix Fietkau <nbd@nbd.name>, John Crispin <john@phrozen.org>,
 Sean Wang <sean.wang@mediatek.com>, Mark Lee <Mark-MC.Lee@mediatek.com>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Pablo Neira Ayuso <pablo@netfilter.org>, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>
Subject: [PATCH net-next] net: ethernet: mediatek: ppe: fix busy wait loop
Date: Thu, 15 Apr 2021 16:02:34 -0700
Message-Id: <20210415230234.14895-1-ilya.lipnitskiy@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210415_160305_488808_1FF3215E 
X-CRM114-Status: GOOD (  11.77  )
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

The intention is for the loop to timeout if the body does not succeed.
The current logic calls time_is_before_jiffies(timeout) which is false
until after the timeout, so the loop body never executes.

time_is_after_jiffies(timeout) will return true until timeout is less
than jiffies, which is the intended behavior here.

Fixes: ba37b7caf1ed ("net: ethernet: mtk_eth_soc: add support for initializing the PPE")
Signed-off-by: Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>
Cc: Felix Fietkau <nbd@nbd.name>
---
 drivers/net/ethernet/mediatek/mtk_ppe.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/mediatek/mtk_ppe.c b/drivers/net/ethernet/mediatek/mtk_ppe.c
index 71e1ccea6e72..af3c266297aa 100644
--- a/drivers/net/ethernet/mediatek/mtk_ppe.c
+++ b/drivers/net/ethernet/mediatek/mtk_ppe.c
@@ -46,7 +46,7 @@ static int mtk_ppe_wait_busy(struct mtk_ppe *ppe)
 {
 	unsigned long timeout = jiffies + HZ;
 
-	while (time_is_before_jiffies(timeout)) {
+	while (time_is_after_jiffies(timeout)) {
 		if (!(ppe_r32(ppe, MTK_PPE_GLO_CFG) & MTK_PPE_GLO_CFG_BUSY))
 			return 0;
 
-- 
2.31.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
