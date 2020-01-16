Return-Path: <SRS0=rC0f=3F=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5DFBC33CAF
	for <linux-mediatek@archiver.kernel.org>; Thu, 16 Jan 2020 17:01:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6F622207FF
	for <linux-mediatek@archiver.kernel.org>; Thu, 16 Jan 2020 17:01:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="srnS0iyb";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="nZJzo/G2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6F622207FF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OmM4DIoZZ1h+XJTRLhkhfv7OFaoOb0+Xk2MS+XQbyeM=; b=srnS0iybadOb3b
	5coeU6p8ulRuptTcYFLxPaDiq1R5O2NtqpDGtwMP1OhGyZ41VljECunUXbYKDv9XfbbSP7jH89Xvp
	zQw3xfMqPeBrVpuSpomb02Vf+1+pR3qtAr/mn/mY400A8kjf13MMVd1Q4hrXcHSV87KjAt92HVjyN
	z+DZTFsUnRrVNzOxdVwm+vOtvNGCQ0d+1Q0nD6IHYrSuHYE/ZWa7qOq/+b3KBvxvAjXbG3XApOsfD
	KO7QQmBipBb4BDUjrYaJI5UkvCean8MZdVsaCs5XFXtIESd5bxqupi9G3+SAZDiM96NG/+82TFSsB
	ROTmlTGtfYbd841pKlSQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1is8WX-0001jO-23; Thu, 16 Jan 2020 17:01:37 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1is8QX-00038f-B8; Thu, 16 Jan 2020 16:55:30 +0000
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id AFC6122522;
 Thu, 16 Jan 2020 16:55:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1579193724;
 bh=bbNkedQdnDzdtuUlAZ2NagqN5EXVfxVOs37adHQ4BEM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=nZJzo/G2HLWjfXwgiP9E493ETgx21Y3sJQQMlGULYOk0ku3sqXHLc1FULYRJhaSOk
 GvpzDlidoGbFLCvofUxpRZsOyG8XwBh8wezrnGs4bGbAbH3dgvdo45cwofUSGJ8QDE
 41KE4O0128ytpB0k4MmpZzNTig7sTOznomoVaOVc=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.19 018/671] mailbox: mediatek: Add check for
 possible failure of kzalloc
Date: Thu, 16 Jan 2020 11:44:09 -0500
Message-Id: <20200116165502.8838-18-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200116165502.8838-1-sashal@kernel.org>
References: <20200116165502.8838-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200116_085525_436513_5E5B1797 
X-CRM114-Status: UNSURE (   9.44  )
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
Cc: Sasha Levin <sashal@kernel.org>, Houlong Wei <houlong.wei@mediatek.com>,
 Jassi Brar <jaswinder.singh@linaro.org>, linux-mediatek@lists.infradead.org,
 Dan Carpenter <dan.carpenter@oracle.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Houlong Wei <houlong.wei@mediatek.com>

[ Upstream commit 9f0a0a381c5db56e7922dbeea6831f27db58372f ]

The patch 623a6143a845("mailbox: mediatek: Add Mediatek CMDQ driver")
introduce the following static checker warning:
  drivers/mailbox/mtk-cmdq-mailbox.c:366 cmdq_mbox_send_data()
  error: potential null dereference 'task'.  (kzalloc returns null)

Fixes: 623a6143a845 ("mailbox: mediatek: Add Mediatek CMDQ driver")
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
Signed-off-by: Houlong Wei <houlong.wei@mediatek.com>
Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
Signed-off-by: Jassi Brar <jaswinder.singh@linaro.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/mailbox/mtk-cmdq-mailbox.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/mailbox/mtk-cmdq-mailbox.c b/drivers/mailbox/mtk-cmdq-mailbox.c
index aec46d5d3506..f7cc29c00302 100644
--- a/drivers/mailbox/mtk-cmdq-mailbox.c
+++ b/drivers/mailbox/mtk-cmdq-mailbox.c
@@ -363,6 +363,9 @@ static int cmdq_mbox_send_data(struct mbox_chan *chan, void *data)
 	WARN_ON(cmdq->suspended);
 
 	task = kzalloc(sizeof(*task), GFP_ATOMIC);
+	if (!task)
+		return -ENOMEM;
+
 	task->cmdq = cmdq;
 	INIT_LIST_HEAD(&task->list_entry);
 	task->pa_base = pkt->pa_base;
-- 
2.20.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
