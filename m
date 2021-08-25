Return-Path: <SRS0=pvhC=NQ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BF2DC4338F
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 Aug 2021 08:39:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0BD4561181
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 Aug 2021 08:39:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0BD4561181
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dFvPdP2AGZC4OvjcumMehDJH2xwFSdfTwF0yry+EtjE=; b=3qZKsvs2nqG9qJ
	mjU05WYryNYgUeUEFQGgrtwcr4cE8HL9Aam6A5Z0ahLjsa6sJ2kZibA0fWzWbuLsfFn1wRjhSw4NV
	otIZ5yqMfsLEPX2VTF39lcW0pjVU0i9Zu2wXWg06hzOfq9WEvI4E/Yg05MZZJ122gxZY+u5mqHmAX
	iIq9qjt1JJJ0tctmg91d2o56uiFUxoVMqQta4qGaR2VWPTfY96OxaQczGGdJDdKJq5uF0dOei3YwO
	gYcuPWx0680fsQfDTodOd3hF64bFlGIBScOHnhQGj9L8K0KqDsAQtwnx1C9nSW3tNJsU1BvenAXOR
	Y33h3B5YIFE6e1KTxDOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mIoRZ-005x2S-9s; Wed, 25 Aug 2021 08:39:33 +0000
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mIoR0-005wsF-Vy; Wed, 25 Aug 2021 08:39:00 +0000
Received: by mail-pg1-x52f.google.com with SMTP id g184so3857471pgc.6;
 Wed, 25 Aug 2021 01:38:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=Dbzh7P/VLZjz7T/PHz/hbVveQrgt7YUkwRS8X1gGPMQ=;
 b=PTryOgjrkt3xSyLLZ3nI0ySlPsg/rl42Z0nmnf4JRFvvk84qFrsvr2LFark0zt6Zak
 KupWKcKNvx4c7Kp/JxLfkkMJ5hHP0qa0vGDfzYUEcKlfzYynxZH7176zVLY7hjT/webd
 RsJkq6SgkfevzO0pn/U5EJneZBoK5QW6SCi+cP1M/1dOLqYHQ+RmwS0iV51F8yTjm0eF
 r3vARMZhBwWhsOWRwpVF/DAgWgEgb11ZmyT/y6KHl/7s300OE8fwyf9ZYkVgqCCIdvfc
 fex16reT0nrhHm1tz13SsnBM9Ini/rBK9wRaSpkGpdYP1BhHkX/gxzrIdxd6tnqRFXdH
 UUrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Dbzh7P/VLZjz7T/PHz/hbVveQrgt7YUkwRS8X1gGPMQ=;
 b=p6wokiM59gGm00Wxm0thvmG7xbrAXt3xhLtCO6kPYMAJtge6Rq0tjgOWF5cS2nWkaJ
 eg19+D3iZk4N9iYXjTJA+WbZMCPpPwunt6GdVT3lUOKsBkJKibra3uHcevhhhdqNlOlJ
 s1+lIqb5T/LL4OD5dqSNfk75dld29wQolcYusi2d0k/ld7uhcZY58hTgYMzcvsFOmrfP
 KskL2Vw6humR/tgck2mxI8JCjxFIB6We7n2n22NXQ+B36O2K2WPqVjMwprEQVfl+J6f9
 gWwSXZPc5yIqgR/QszqucNW5sW6CQXBxKGT2MDDJXVtFZyeFQNsI8z/HF8QUczWbVWi6
 2FRw==
X-Gm-Message-State: AOAM530js0XODI91k/MPAuQ0tIiTDjs7eGhPnqFsSnvQjjSoO3hZDijY
 Atcs0qpio6JSLFeRK+DhDJM=
X-Google-Smtp-Source: ABdhPJwKwchoRLdo4BZ3JiVc2OLHRyzG0ZZZHm30+1GgS/uyS0K2qPV/3P41I55ugBeCg/tJeNDEHA==
X-Received: by 2002:a63:3dcd:: with SMTP id k196mr1250905pga.387.1629880729365; 
 Wed, 25 Aug 2021 01:38:49 -0700 (PDT)
Received: from haswell-ubuntu20.lan ([138.197.212.246])
 by smtp.gmail.com with ESMTPSA id p18sm24872294pgk.28.2021.08.25.01.38.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Aug 2021 01:38:48 -0700 (PDT)
From: DENG Qingfang <dqfext@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>, Vivien Didelot <vivien.didelot@gmail.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Vladimir Oltean <olteanv@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Sean Wang <sean.wang@mediatek.com>, Landen Chao <Landen.Chao@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Subject: [RFC net-next 1/2] net: dsa: allow taggers to customise netdev
 features
Date: Wed, 25 Aug 2021 16:38:30 +0800
Message-Id: <20210825083832.2425886-2-dqfext@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210825083832.2425886-1-dqfext@gmail.com>
References: <20210825083832.2425886-1-dqfext@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210825_013859_070669_D2F63BCC 
X-CRM114-Status: GOOD (  12.56  )
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

Allow taggers to add netdev features, such as VLAN offload, to slave
devices, which will make it possible for taggers to handle VLAN tags
themselves.

Signed-off-by: DENG Qingfang <dqfext@gmail.com>
---
 include/net/dsa.h | 2 ++
 net/dsa/slave.c   | 3 ++-
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/include/net/dsa.h b/include/net/dsa.h
index f9a17145255a..f65442858f71 100644
--- a/include/net/dsa.h
+++ b/include/net/dsa.h
@@ -96,6 +96,8 @@ struct dsa_device_ops {
 	 * its RX filter.
 	 */
 	bool promisc_on_master;
+	/* Additional features to be applied to the slave. */
+	netdev_features_t features;
 };
 
 /* This structure defines the control interfaces that are overlayed by the
diff --git a/net/dsa/slave.c b/net/dsa/slave.c
index 662ff531d4e2..6d6f1aebf1ca 100644
--- a/net/dsa/slave.c
+++ b/net/dsa/slave.c
@@ -1885,7 +1885,8 @@ void dsa_slave_setup_tagger(struct net_device *slave)
 
 	p->xmit = cpu_dp->tag_ops->xmit;
 
-	slave->features = master->vlan_features | NETIF_F_HW_TC;
+	slave->features = master->vlan_features | cpu_dp->tag_ops->features |
+			  NETIF_F_HW_TC;
 	slave->hw_features |= NETIF_F_HW_TC;
 	slave->features |= NETIF_F_LLTX;
 	if (slave->needed_tailroom)
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
