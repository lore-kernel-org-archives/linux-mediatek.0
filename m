Return-Path: <SRS0=QSA9=JM=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1267FC433ED
	for <linux-mediatek@archiver.kernel.org>; Thu, 15 Apr 2021 08:36:35 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C45FA611AD
	for <linux-mediatek@archiver.kernel.org>; Thu, 15 Apr 2021 08:36:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C45FA611AD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:MIME-Version:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Jq6bqHvOteCZcheU+FmWcBtkUdVv23Z/zcvOp97vfRc=; b=NwVMVLzUPMPayf+gSQWsNgRJaM
	yCD9SB8E0LfDq7yqq/0RWTpXeOXCleSmC/um5T006YTspXWEZmQKpZKoMR5FQW+rX93visvXEUrCl
	PFJQY4DBxFlmsEfjzfP68bpsxkIBBgGEBE4bz9/a7cNxbinAGS/Tc6oSqrjEmtnjh4xRJVvNjMgdi
	jYBn+mnAg/EtkFux3CS0RA9WgFPSHizd1NOb/+K6wvSj8Jb/R5jw+w50X7Hckz7AtJZEOkZYF2rts
	au/2msiwyuqwUVyIGdWQ4lgXYzzkZ0gKcXje3/DHXwq3eipRL1NG91w8PoCcLnnoh3h6BXV1xuiJD
	KihbU/PQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lWxU7-00FN4D-8Q; Thu, 15 Apr 2021 08:36:23 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lWxTp-00FN26-Pz; Thu, 15 Apr 2021 08:36:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Message-Id:Date:Subject:Cc:To:From:
 Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=Y+gxG/K4BKCF0iUg2WWlIf86k1/lgqGqJ8DPMPTp//o=; b=a9UzgP8eSBy4kroifLvSXkmyqz
 NqeDF3XF39Dhxnvfy5mUbIczJB1+X9kMO1hCQLAMazZMyzFsGTehF5rfBsXNKMxb7CGatujMxkmRX
 xLLex9r0Rx6juccsmsAPB6yQUl+JXdef9yZgdpsI/YVpqDbfqaKkiJF1hd9QxC5cqzvYv0Wr3UurX
 Yw5b9iM6yT77IIuNe9EeBkYwXm0r6GAtGywWZwgwEhBF8iafVbWqlIFIqWNmotKy7AaNoDpsMBGga
 fZekgc6H2bgi1LSZQmKXOskIm8+oq52d3S4Dzj36+9ng+T1YWSgVRaL4Y4ehZ9AMiZKihiTOXYS41
 jfHNn2QA==;
Received: from out30-130.freemail.mail.aliyun.com ([115.124.30.130])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lWxTn-008Ng2-A7; Thu, 15 Apr 2021 08:36:04 +0000
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R141e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04426;
 MF=jiapeng.chong@linux.alibaba.com; NM=1; PH=DS; RN=9; SR=0;
 TI=SMTPD_---0UVdfZCq_1618475754; 
Received: from
 j63c13417.sqa.eu95.tbsite.net(mailfrom:jiapeng.chong@linux.alibaba.com
 fp:SMTPD_---0UVdfZCq_1618475754) by smtp.aliyun-inc.com(127.0.0.1);
 Thu, 15 Apr 2021 16:36:00 +0800
From: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
To: thierry.reding@gmail.com
Cc: u.kleine-koenig@pengutronix.de, lee.jones@linaro.org,
 matthias.bgg@gmail.com, linux-pwm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org,
 Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
Subject: [PATCH] pwm: mediatek: remove unused function
Date: Thu, 15 Apr 2021 16:35:53 +0800
Message-Id: <1618475753-102123-1-git-send-email-jiapeng.chong@linux.alibaba.com>
X-Mailer: git-send-email 1.8.3.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210415_013603_536068_5F7719C4 
X-CRM114-Status: UNSURE (   5.96  )
X-CRM114-Notice: Please train this message.
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Fix the following clang warning:

drivers/pwm/pwm-mediatek.c:110:19: warning: unused function
'pwm_mediatek_readl' [-Wunused-function].

Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
---
 drivers/pwm/pwm-mediatek.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/pwm/pwm-mediatek.c b/drivers/pwm/pwm-mediatek.c
index fcfc3b1..cae0f48 100644
--- a/drivers/pwm/pwm-mediatek.c
+++ b/drivers/pwm/pwm-mediatek.c
@@ -107,12 +107,6 @@ static void pwm_mediatek_clk_disable(struct pwm_chip *chip,
 	clk_disable_unprepare(pc->clk_top);
 }
 
-static inline u32 pwm_mediatek_readl(struct pwm_mediatek_chip *chip,
-				     unsigned int num, unsigned int offset)
-{
-	return readl(chip->regs + pwm_mediatek_reg_offset[num] + offset);
-}
-
 static inline void pwm_mediatek_writel(struct pwm_mediatek_chip *chip,
 				       unsigned int num, unsigned int offset,
 				       u32 value)
-- 
1.8.3.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
