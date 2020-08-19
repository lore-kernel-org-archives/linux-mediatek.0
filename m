Return-Path: <SRS0=3kTb=B5=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 586E2C433DF
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Aug 2020 07:24:39 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 26B1020786
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Aug 2020 07:24:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="oQgPwET8";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="C88o+Qk+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 26B1020786
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=NsSq8/X7HzhDBb/JIbCeRLIZSE972u4c3v9TZs2CMhk=; b=oQgPwET86pq2kpMDx0tdss1Sp
	E7jj/XdWS4yNoyI3Ljhdc2CslRj//BpOjR++DxP9nJbz2aHWovDiXOtcj13Hn+nQPOIqqazvW5Svd
	X1rIGsNi0HZCNqtWUCKuOIHg0ZiChQIB0EEEe1cBrPHeQacQHvrX1ThuekG5UEbt9rUEosICE4JXk
	EhmXJsy7AhEr3r5VxFWwAAcb4aEquWWULlbVUNl6lqxhu2cIfulRQ9hGxdx/8Lf5z91Ql551URJT9
	PrtNFJwOMsrEiYfOkcqrCmP2X8jQKwtDc4p1MyATA3PFxGwOLaLAMpKdthTt3LG/u0jPI3+UI/QZ5
	yNAcT95wA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k8IST-0001Dr-PR; Wed, 19 Aug 2020 07:24:29 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k8ISQ-0001C2-3i
 for linux-mediatek@lists.infradead.org; Wed, 19 Aug 2020 07:24:26 +0000
Received: by mail-wr1-x442.google.com with SMTP id r4so20424567wrx.9
 for <linux-mediatek@lists.infradead.org>; Wed, 19 Aug 2020 00:24:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=btNFyQ5gdRMB0au+Pev2O+MsXnfVNmHhW/htK7KWPAM=;
 b=C88o+Qk+rULR4JQYPoSUWw4wAno6u1L/Jayo2cvTR2KjNVmvEdSM1h1wku9pGwoOfs
 foI9eXC7YM1wMZh1+VDE1EwCzHjUczt4Ty7HGru7Etar8sY75PnzhPQddbcA8KzUrh5M
 c4KiaW/eol1akNCr2+CxRa8oIFM5Ph1jX4fLbV54K2bj33wlAGaTCq3N+vL20jMoiY/y
 yolCEAbTd153ahWYLyXSRsSAtZKHYmnOc1GQS4rOzAOVMMOjTfyQRCxnHYOwPrZMPluC
 c6IMEak/QYh3kbvu6LY3UNu6DW2P5LeoL3GTvR1BZYWxgk6e0fv/HLnk3BofM+GHyI1a
 K/Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=btNFyQ5gdRMB0au+Pev2O+MsXnfVNmHhW/htK7KWPAM=;
 b=ZhlSZL7V4Ina1N0DL2xhgGlpgSdycVB23piHJ+ZW4UX4RPEE3gOcCi9PmIDECRy98H
 leJuHCAYOYqkptL7uVIHBkfv20F1hlHcnQ4+H0R7xZrWMmDCQWgCyd0XiA9kqKRUCLkU
 Ai48J/DDw6UuvUZMmtsm1TozDHOA8bNOMwl+hqOvsfHUYVoWaFPNrc0jo4zlJgvkII0n
 1Z7I7va13hWUCX8J7tORt1pCWlyHDjA9qJQOoHPP6MFHgZBxTDd9iGykwGgSWiwoOA+w
 O2ZpR1U6cXasI1pfd28H3DenFOnJjnl5SUUYYbX10XUaP6eJTOSlevncgxt6BfYuALwm
 ra0Q==
X-Gm-Message-State: AOAM5323tJWJEtO4/mvXHqk+5SPClFKJZuDOwXirxcCE64CXkhN6cPCX
 NvK+URPfHA9B2wmji3AmSgS5gA==
X-Google-Smtp-Source: ABdhPJxnEhoTD05y07X1+zSPuPGwAfaT9pqBtJ+nZfki86mWBsbbmdiKb7qdBf4fpwOBaVZEVRxcfA==
X-Received: by 2002:adf:e290:: with SMTP id v16mr23353013wri.259.1597821863746; 
 Wed, 19 Aug 2020 00:24:23 -0700 (PDT)
Received: from dell.default ([95.149.164.62])
 by smtp.gmail.com with ESMTPSA id c145sm3795808wmd.7.2020.08.19.00.24.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Aug 2020 00:24:23 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: kvalo@codeaurora.org,
	davem@davemloft.net,
	kuba@kernel.org
Subject: [PATCH 15/28] wireless: mediatek: mt7601u: phy: Fix misnaming when
 documented function parameter 'dac'
Date: Wed, 19 Aug 2020 08:23:49 +0100
Message-Id: <20200819072402.3085022-16-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200819072402.3085022-1-lee.jones@linaro.org>
References: <20200819072402.3085022-1-lee.jones@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200819_032426_241066_5FA99847 
X-CRM114-Status: GOOD (  13.40  )
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
Cc: Felix Fietkau <nbd@openwrt.org>, Jakub Kicinski <kubakici@wp.pl>,
 netdev@vger.kernel.org, linux-wireless@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>, Lee Jones <lee.jones@linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Fixes the following W=1 kernel build warning(s):

 drivers/net/wireless/mediatek/mt7601u/phy.c:1216: warning: Function parameter or member 'dac' not described in 'mt7601u_set_tx_dac'
 drivers/net/wireless/mediatek/mt7601u/phy.c:1216: warning: Excess function parameter 'path' description in 'mt7601u_set_tx_dac'

Cc: Jakub Kicinski <kubakici@wp.pl>
Cc: Kalle Valo <kvalo@codeaurora.org>
Cc: "David S. Miller" <davem@davemloft.net>
Cc: Matthias Brugger <matthias.bgg@gmail.com>
Cc: Felix Fietkau <nbd@openwrt.org>
Cc: linux-wireless@vger.kernel.org
Cc: netdev@vger.kernel.org
Cc: linux-mediatek@lists.infradead.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/net/wireless/mediatek/mt7601u/phy.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt7601u/phy.c b/drivers/net/wireless/mediatek/mt7601u/phy.c
index d863ab4a66c96..3c4462487ab5c 100644
--- a/drivers/net/wireless/mediatek/mt7601u/phy.c
+++ b/drivers/net/wireless/mediatek/mt7601u/phy.c
@@ -1210,7 +1210,7 @@ void mt7601u_set_rx_path(struct mt7601u_dev *dev, u8 path)
 /**
  * mt7601u_set_tx_dac - set which tx DAC to use
  * @dev:	pointer to adapter structure
- * @path:	DAC index, values are 0-based
+ * @dac:	DAC index, values are 0-based
  */
 void mt7601u_set_tx_dac(struct mt7601u_dev *dev, u8 dac)
 {
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
