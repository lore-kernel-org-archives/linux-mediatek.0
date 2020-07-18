Return-Path: <SRS0=kKdk=A5=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C221C433E1
	for <linux-mediatek@archiver.kernel.org>; Sat, 18 Jul 2020 05:47:54 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DE0922076A
	for <linux-mediatek@archiver.kernel.org>; Sat, 18 Jul 2020 05:47:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="xAEtBEal";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tZEuFSnz"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DE0922076A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Sh75XMqin5ACpk5VGEIiya07wApSckZEXyiDgAy44pw=; b=xAEtBEal2T+kCBcc0OjObq0wzP
	WOG2rox3GZDvJRjcAgmP9pZBmDrZTv2WxZyXH0Dd+qvqwxZLF6cex+TisQJeu6lzshXLcH8kdd2nz
	PNfEECLGRPyWZnzohrR6yAO5OtEDoZCz90eJjTUEwfzfReOAh4lxrM4DfncL2l5++A1Ffv8EHzHSk
	H81rKGDzFtYJelJ5xWGXuvT+WfGnLzZSfiGTl8mIvf0AMTSH2ic5ZMcd1ugJJe1Mkivq4WEkuaFYJ
	cr/lG5JUU1+Zb6IIh2P6lCIfar69O1yCFPthP0+fCFhOdWQh2nFN6DkIHEe6jftP3ajsMtsujzicP
	6aYhS83Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jwfhI-0004cu-DM; Sat, 18 Jul 2020 05:47:44 +0000
Received: from mail-io1-xd41.google.com ([2607:f8b0:4864:20::d41])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jwfhD-0004bs-Rt; Sat, 18 Jul 2020 05:47:40 +0000
Received: by mail-io1-xd41.google.com with SMTP id i4so12531864iov.11;
 Fri, 17 Jul 2020 22:47:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=PfMs+d/8rTE+DczufHJcceGTZEwuJydHZFIhdNSBBA8=;
 b=tZEuFSnzOKQNapUURfRPWVJlMGLxwDsc4jXnrSjXLGBfCvGcdp02PlJzyzbWL+dF+I
 E4qVcG/Rlm+QMeRneEgs6jE0OgLfeBw+DVmu5V7PJRgBXw98TjxGLqCppUf95oqhL64E
 B6ZA7pztL+9zIF8GDAEsm1+20D+2Di3ITfyd9j2FmT9pC/wiBoiMHAxeVhiV2FrjxxPl
 svTx7ET5DMcSr8rED/xMCU+g6bCm2KDH9HqFQ9VgLt6mwm3SDtQ+Z1qe55mqdYLOS2h9
 66+7yI/tO3Zxdj7b4byEhSWMEi/2EwOxTAcXbhEUnJejoVHbzlBomcufa2sBoi15m3f7
 Rnyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=PfMs+d/8rTE+DczufHJcceGTZEwuJydHZFIhdNSBBA8=;
 b=ZlQaq6bIjqOSkPZ0ObnJLEeJXD/UMMKCH+OzXAvl/5Mky49rWi5X43yJcj9HThu+nN
 jfcQd1yEv+6vKKjhnXELOY7zQ6R01qYJmMQfRHBefYQKXy028DlL+XYajZgXyog9/7qW
 wSmU13jLKzfBwe4TK+ayoPewCuK4ODEoY+WDsHpFJSZNpQs9HqNAF7PeAX+xPvHH/5Je
 SsTgH04VQQXwqLpf1+sXmW9Oso/UmPdGuyUf2rF0/zzdcgOulcwrHZj8njGAn0M+q+ha
 gGX7OUkXBcOXcMQGHHy0CQSc0Tag9Nkh/0rl/xTChWTBJEEr+656e/O8EuIb/7aDzxIi
 V2GQ==
X-Gm-Message-State: AOAM533OmqgvKQyfKBEdYxYnowkxZWk1rbaUBLiNFnuqfzinE/ZfWVzR
 pq5BgAuLMhZ9Y9udBHJh2Xc=
X-Google-Smtp-Source: ABdhPJwmz9PHgLFVxAiR8ICQT3HOsuOshxUJ0WFWXkZT30fBjDH8pGlL70enm1kjAc+Wp58AwhZBSg==
X-Received: by 2002:a6b:f911:: with SMTP id j17mr12389586iog.96.1595051257928; 
 Fri, 17 Jul 2020 22:47:37 -0700 (PDT)
Received: from cs-dulles.cs.umn.edu (cs-dulles.cs.umn.edu. [160.94.145.20])
 by smtp.googlemail.com with ESMTPSA id e16sm5852663iow.37.2020.07.17.22.47.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Jul 2020 22:47:37 -0700 (PDT)
From: Navid Emamdoost <navid.emamdoost@gmail.com>
To: Felix Fietkau <nbd@nbd.name>,
 Lorenzo Bianconi <lorenzo.bianconi83@gmail.com>,
 Ryder Lee <ryder.lee@mediatek.com>, Kalle Valo <kvalo@codeaurora.org>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-wireless@vger.kernel.org,
 netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH] mt76: mt76u: add missing release on skb in
 __mt76x02u_mcu_send_msg
Date: Sat, 18 Jul 2020 00:47:26 -0500
Message-Id: <20200718054727.13009-1-navid.emamdoost@gmail.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200718_014739_961181_72E1BD90 
X-CRM114-Status: GOOD (  10.12  )
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
Cc: emamd001@umn.edu, Navid Emamdoost <navid.emamdoost@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

In the implementation of __mt76x02u_mcu_send_msg() the skb is consumed
all execution paths except one. Release skb before returning if
test_bit() fails.

Signed-off-by: Navid Emamdoost <navid.emamdoost@gmail.com>
---
 drivers/net/wireless/mediatek/mt76/mt76x02_usb_mcu.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt76x02_usb_mcu.c b/drivers/net/wireless/mediatek/mt76/mt76x02_usb_mcu.c
index a30bb536fc8a..e43d13d7c988 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76x02_usb_mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt76x02_usb_mcu.c
@@ -87,8 +87,10 @@ __mt76x02u_mcu_send_msg(struct mt76_dev *dev, struct sk_buff *skb,
 	u32 info;
 	int ret;
 
-	if (test_bit(MT76_REMOVED, &dev->phy.state))
-		return 0;
+	if (test_bit(MT76_REMOVED, &dev->phy.state)) {
+		ret = 0;
+		goto out;
+	}
 
 	if (wait_resp) {
 		seq = ++dev->mcu.msg_seq & 0xf;
@@ -111,6 +113,7 @@ __mt76x02u_mcu_send_msg(struct mt76_dev *dev, struct sk_buff *skb,
 	if (wait_resp)
 		ret = mt76x02u_mcu_wait_resp(dev, seq);
 
+out:
 	consume_skb(skb);
 
 	return ret;
-- 
2.17.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
