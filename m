Return-Path: <SRS0=+XBv=7F=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28BFAC433E0
	for <linux-mediatek@archiver.kernel.org>; Sat, 23 May 2020 04:19:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E4F94207DA
	for <linux-mediatek@archiver.kernel.org>; Sat, 23 May 2020 04:19:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="dN8RmhCe";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="brjn7n8m"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E4F94207DA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=3V0ZPGAIyLYO1COFvVKZAVfFP0cJ0LJPN2gRaX14Zn8=; b=dN8RmhCeFdIpGn
	fAt+WlGvEq7QZMbNf4VOOaHWfP4zaGp0O8zmA3QS9r/3tliz4SUMKynDkakPtyBTqOw2bbXq74/YK
	CGc9oiJjQzJcXAaZEwaTUl9oLafomS5fG8szAjqk41uIEzriZUIXyIEflq/VOSZgSSwQ3FNZH+NrG
	6qOlek/S7M86f6FDauRk8KlXVnha7F6Se31ERxH67iCq4dKzL2+YdyqphJEDgmzhC0N6RqZ+Nql81
	ibdXbl9J+LH3fe/WWlo9rzkzub/nSnXqjh1gRhWlMOi3Ily47t6xfJVLphzN4+xg/2D4qKY4W8mGb
	wtJR2+Y3CF060c+I998A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jcLdM-0005er-Js; Sat, 23 May 2020 04:19:40 +0000
Received: from mail-pj1-x1042.google.com ([2607:f8b0:4864:20::1042])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jcLdJ-0005eF-4J
 for linux-mediatek@lists.infradead.org; Sat, 23 May 2020 04:19:38 +0000
Received: by mail-pj1-x1042.google.com with SMTP id q9so5914149pjm.2
 for <linux-mediatek@lists.infradead.org>; Fri, 22 May 2020 21:19:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=lnKO8mEgKG0cuqfZGwVZY3dnnPkJgdITjBuWRWcUqiQ=;
 b=brjn7n8mURXe0FKXGVqBamb/EFgvxQBFyCyv8KRwVVLButg24bt1mO+ShPhCfc8b7b
 qyF0yYPI78ty562/3Y8jNL82dtOcK6AafaszzzWi/T4Q9iy6J1c6Qy8gaFoqzSoKzKNY
 f+mRVVq3hOSP3hmyktnJxhQiFm1YR2Ja2S7zfpuiqFXG1AfMQVJK8IIurdw8PzAXvztH
 OgNBa+L+q9gj/7prZDr7VvFi/Z9UjQnwklLZVdrktiW/83F+jpJ1/3Vv6gqLS9uEpkjg
 3yqgo99VvvnpNWibMzYlO0TrgNKAObuJsEzyJJa4H9Fwf9N9x10aKc1z8WfDnp3SMogA
 WR9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=lnKO8mEgKG0cuqfZGwVZY3dnnPkJgdITjBuWRWcUqiQ=;
 b=CORCpGwgw4wrQ2QSIzm44+VlEzdh8582lr45ui4FzxJEbvhOubBwpHHgYmk0+LDyXu
 nlxKJgrg2s0VsR1d1cOL3RUI76UW5wjTvr+QLH+QDrazgz8sPaszm+0qDRc5usfrokBu
 1ChViurmsHcRTZkmWip3l9d4/zMUUG42iJSYlwWTQA8II83XDi7tvCxQCZgmxhemK7Da
 k5pRX+mcJwkFwOqCBeQs/O85xmNyOKi8wPBtlnq4dhsw74i9+2rXzdaprnMFpLHNvmQO
 aohCRoAqC9O3e0m084fgbAIBnhjhkcr1zVBGAfx69wHHj8OTnybxdhQhQMmP7rkZtBhB
 yxLQ==
X-Gm-Message-State: AOAM533OZ24SZscdPfRmd0W5RowM2t1j+H+kSrNC/xhx6tIwLi8g1VqZ
 mDx0PuISI5UNYp0oz/ov4Z0=
X-Google-Smtp-Source: ABdhPJysX9LqXvkIYAcO2nda8F8H3jXr/8IwdGUWf9qFEo01Q6E3ECDmQaGCBwTTxTKz38LznCi7FA==
X-Received: by 2002:a17:902:bd07:: with SMTP id
 p7mr17186991pls.293.1590207573197; 
 Fri, 22 May 2020 21:19:33 -0700 (PDT)
Received: from localhost.localdomain ([2604:1380:4111:8b00::1])
 by smtp.gmail.com with ESMTPSA id g18sm8202317pfq.146.2020.05.22.21.19.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 May 2020 21:19:32 -0700 (PDT)
From: Nathan Chancellor <natechancellor@gmail.com>
To: Felix Fietkau <nbd@nbd.name>,
 Lorenzo Bianconi <lorenzo.bianconi83@gmail.com>
Subject: [PATCH] mt76: mt7915: Use proper enum type in __mt7915_mcu_msg_send
Date: Fri, 22 May 2020 21:19:23 -0700
Message-Id: <20200523041923.3332257-1-natechancellor@gmail.com>
X-Mailer: git-send-email 2.27.0.rc0
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200522_211937_187757_D129B20C 
X-CRM114-Status: UNSURE (   9.51  )
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
Cc: Ryder Lee <ryder.lee@mediatek.com>, netdev@vger.kernel.org,
 linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 clang-built-linux@googlegroups.com, linux-mediatek@lists.infradead.org,
 Nathan Chancellor <natechancellor@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Clang warns:

drivers/net/wireless/mediatek/mt76/mt7915/mcu.c:232:9: warning: implicit
conversion from enumeration type 'enum mt76_txq_id' to different
enumeration type 'enum mt7915_txq_id' [-Wenum-conversion]
                txq = MT_TXQ_FWDL;
                    ~ ^~~~~~~~~~~
drivers/net/wireless/mediatek/mt76/mt7915/mcu.c:239:9: warning: implicit
conversion from enumeration type 'enum mt76_txq_id' to different
enumeration type 'enum mt7915_txq_id' [-Wenum-conversion]
                txq = MT_TXQ_MCU_WA;
                    ~ ^~~~~~~~~~~~~
drivers/net/wireless/mediatek/mt76/mt7915/mcu.c:243:9: warning: implicit
conversion from enumeration type 'enum mt76_txq_id' to different
enumeration type 'enum mt7915_txq_id' [-Wenum-conversion]
                txq = MT_TXQ_MCU;
                    ~ ^~~~~~~~~~
drivers/net/wireless/mediatek/mt76/mt7915/mcu.c:287:36: warning:
implicit conversion from enumeration type 'enum mt7915_txq_id' to
different enumeration type 'enum mt76_txq_id' [-Wenum-conversion]
        return mt76_tx_queue_skb_raw(dev, txq, skb, 0);
               ~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~

txq should be a "enum mt76_txq_id" as values of that type are the only
ones assigned to it and that is the type that mt76_tx_queue_skb_raw
expects.

Fixes: e57b7901469f ("mt76: add mac80211 driver for MT7915 PCIe-based chipsets")
Link: https://github.com/ClangBuiltLinux/linux/issues/1035
Signed-off-by: Nathan Chancellor <natechancellor@gmail.com>
---
 drivers/net/wireless/mediatek/mt76/mt7915/mcu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
index f00ad2b66761..916f664e964e 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
@@ -220,7 +220,7 @@ static int __mt7915_mcu_msg_send(struct mt7915_dev *dev, struct sk_buff *skb,
 {
 	struct mt7915_mcu_txd *mcu_txd;
 	u8 seq, pkt_fmt, qidx;
-	enum mt7915_txq_id txq;
+	enum mt76_txq_id txq;
 	__le32 *txd;
 	u32 val;
 

base-commit: c11d28ab4a691736e30b49813fb801847bd44e83
-- 
2.27.0.rc0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
