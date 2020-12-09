Return-Path: <SRS0=7tkd=FN=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22569C4361B
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Dec 2020 19:37:12 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C24A023C8F
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Dec 2020 19:37:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C24A023C8F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=eRCS68CAjxyvV2p42ooJhC9wF1/fkd39sHG/rcJEwfw=; b=O2SxVzw1tOwmU+ieUaE3//jtUH
	qgZdKVFwUb6FGmLhav33saAW6l6SKohtlDpsbV/8DxxOjlV6ntuytMwoTOi7wM/qd8jL1zP1xgHqa
	k7RCDp5WIjTm9uOeEQPV5DfmT9iIsqF+ik51/VD9jMPNWttYMjMHY7AAYMjxXqPdhjm5qlvoWiBcI
	AhgyuwYvMP7OUG+DmcMzvKtM6po4nQcanyHUuCF8qol1Rh0tVtZltVRm7uiAuxJbNkWg6kS9f3OTl
	ouMN73fdNViX0DNhEf+hRs4AdxBJwjIrJ3S0I2ilJ/Pktcv8E5qgaDP0U5YX2HWqyWcK9mGpsyx9B
	COH3q/iw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kn5Gl-0005ti-Ph; Wed, 09 Dec 2020 19:36:59 +0000
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kn5Gh-0005sm-S8; Wed, 09 Dec 2020 19:36:56 +0000
Received: by mail-pl1-x644.google.com with SMTP id s2so1485842plr.9;
 Wed, 09 Dec 2020 11:36:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=CyWgjPy4I+HbjxDbhT+g/PzO0BxXYU1ulWjOU7DYulU=;
 b=TPJg7bYIXiUHQ6rRirpCUnu5kGZXP8cRVZwlsH7HBXNcp88TOTj5vkuPs0iczU1dve
 Duw9uO+PmjYt7zP/gqTJMmAonixhykINDhVdskZQzxQ7KB8/8xCFEzW6Q1AGn08kLU5G
 4KkVKOxacMcwgPnn3MqjHUu4iE2u4FfEDKtNUQH9fqQqdN5fJejMpPm03ERAWQqTDgjF
 bPUcJsqN1sjlGDyy1XIRMjgKZHRPfCrholGqi+lVhL+tE3f9tAFZry1sWDL02uWlfEaz
 t7WL5eoMio0ZdlzpVcDG+G35xhGECJ4223Ke3C87s4FbARmG9uDq5ferawYdpjjW0sd/
 Rnlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=CyWgjPy4I+HbjxDbhT+g/PzO0BxXYU1ulWjOU7DYulU=;
 b=G/IYodzp5q1V8AsUOiHNe8HD4ydz5oDxoOXY1uMaSi9OW7Wkr4GftFYTDkbgFobEZz
 9G+Nx6+2JsdvCXgdgCQ5t+yYt8LEvYVYf9WhCxrdYWVGFK/YH+J3wMyYqnte73ZZ5iT9
 2YdhIPZc0XSd7nmg6Wfhop/EdHlxrxAW2rEQxkQvjwzMMgPe4HDbKBVoRCrF7hWVaxAu
 RtAwjKnjvSGTmjRfd89oXFSZxSPDB6nxxPp4/5j3vdshxAFt7rFziml0PPZ8oZa0CBS7
 L4k2P9aHFiaHaJeXWdve0UbqktSJJnO5jcKHOAONIn1yE8B2Z7HPyJ+wc2CzCZS0LkPl
 umOQ==
X-Gm-Message-State: AOAM531gJfvKyYgImNYkfWmBXpybjBdLd6uG5DmTBWGY4JnScAKA8Y51
 qwgyuJdO2RruIqVlqLZ7BQE=
X-Google-Smtp-Source: ABdhPJxwT/EueNc5KNGRYj9S8wYQiuJE2KBwKMWVjhaF+uU06n8Ti11ncw8BL0PtBi4etdv40vsqpQ==
X-Received: by 2002:a17:902:9f8b:b029:da:726d:3f17 with SMTP id
 g11-20020a1709029f8bb02900da726d3f17mr3358980plq.35.1607542611741; 
 Wed, 09 Dec 2020 11:36:51 -0800 (PST)
Received: from jordon-HP-15-Notebook-PC.domain.name ([122.179.87.107])
 by smtp.gmail.com with ESMTPSA id fv22sm3079552pjb.14.2020.12.09.11.36.48
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 09 Dec 2020 11:36:51 -0800 (PST)
From: Souptick Joarder <jrdr.linux@gmail.com>
To: nbd@nbd.name, lorenzo.bianconi83@gmail.com, ryder.lee@mediatek.com,
 kvalo@codeaurora.org, davem@davemloft.net, kuba@kernel.org,
 matthias.bgg@gmail.com
Subject: [PATCH] mt76: Fixed kernel test robot warning
Date: Thu, 10 Dec 2020 01:06:57 +0530
Message-Id: <1607542617-4005-1-git-send-email-jrdr.linux@gmail.com>
X-Mailer: git-send-email 1.9.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201209_143655_942419_D40CF2C8 
X-CRM114-Status: GOOD (  10.79  )
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
Cc: netdev@vger.kernel.org, linux-wireless@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Souptick Joarder <jrdr.linux@gmail.com>, linux-arm-kernel@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Kernel test robot throws below warning ->

   drivers/net/wireless/mediatek/mt76/tx.c: In function
'mt76_txq_schedule':
>> drivers/net/wireless/mediatek/mt76/tx.c:499:21: warning: variable 'q'
>> set but not used [-Wunused-but-set-variable]
     499 |  struct mt76_queue *q;
         |                     ^

This patch will silence this warning.

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Souptick Joarder <jrdr.linux@gmail.com>
---
 drivers/net/wireless/mediatek/mt76/tx.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/tx.c b/drivers/net/wireless/mediatek/mt76/tx.c
index 1e20afb..25627e7 100644
--- a/drivers/net/wireless/mediatek/mt76/tx.c
+++ b/drivers/net/wireless/mediatek/mt76/tx.c
@@ -504,14 +504,11 @@ void mt76_tx_complete_skb(struct mt76_dev *dev, u16 wcid_idx, struct sk_buff *sk
 
 void mt76_txq_schedule(struct mt76_phy *phy, enum mt76_txq_id qid)
 {
-	struct mt76_queue *q;
 	int len;
 
 	if (qid >= 4)
 		return;
 
-	q = phy->q_tx[qid];
-
 	rcu_read_lock();
 
 	do {
-- 
1.9.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
