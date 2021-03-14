Return-Path: <SRS0=n982=IM=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7939EC433E0
	for <linux-mediatek@archiver.kernel.org>; Sun, 14 Mar 2021 23:34:33 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1AC5064E7C
	for <linux-mediatek@archiver.kernel.org>; Sun, 14 Mar 2021 23:34:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1AC5064E7C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:MIME-Version:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6Brzi9EJwmxKI46nmpbC7rOwC4k+bWnkcr3PnuHjNYU=; b=Y9sdz/+q8srKibAiWz2PelwmP4
	R7xto8o53Mc0i+1TS+IdFzlCBXl3f+/19eujnI5+fNf8NEnp903JzgjcT5mH4sjOvxMS7+22uYXVR
	tCeZHTwP5LuwdSviHKwlEncJ17f9BsBm3oJsLRJ1DyowunqW9CRtLwY+v5VTMtV/87Zlce0Scn+EJ
	/Sv82U1KIRIB+Iaa/AvWn8LowPaFk2MeeZOaVj10MAmbgrdWnToME6C7f21F//kRS56RnthD7WOFJ
	+YnoGUL9SoiPjaAnHSldi6+Zfwkpn0mDg7cagGUuDHUnsUCGRYUv6prWYz1C0agSv1kjlDrghTaZB
	lZqc/3hg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lLaFW-00Edwx-W8; Sun, 14 Mar 2021 23:34:19 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lLaEu-00Edss-4F; Sun, 14 Mar 2021 23:33:43 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 18CA464E87;
 Sun, 14 Mar 2021 23:33:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1615764818;
 bh=p+OvM6cie0qKQc+LIUuhfUzqA36ufYyQPLO73t0gzik=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=fPgXTYCzqM4a6K7sWlMCn+e2ClGBUFDx9R3DVzYsJI3kkx4WQ9CTdOL4MIaqcL2UE
 VPbuUj0r37ECiNlAZkveEHUxbjynmYxcxhqXPLzVf0Ngd3fqaHaKu0CJw8E0vjoBgu
 jOPy1ws/Pi7f73G0Tky3T0ZMbdaXag7EzdRcMofnp8BAoEWpo/TIcf/y/fYEP2M5tX
 Kij42ZYVDCUULnTRZwp1feySZjLShJoCLBnmLr3v8gikKSfUJJwlaWuRdE9GqRSqmA
 5i4+ki+II70EcGxlWhKTsNour1xm8dZaivwEeIH9gjxNT9kb0X2BqqJPqbCXu2nwN0
 h2wWIoKfri+Sg==
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
To: Jassi Brar <jassisinghbrar@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: Houlong Wei <houlong.wei@mediatek.com>,
 Bibby Hsieh <bibby.hsieh@mediatek.com>,
 Dennis YC Hsieh <dennis-yc.hsieh@mediatek.com>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, Chun-Kuang Hu <chunkuang.hu@kernel.org>
Subject: [PATCH 3/3] mailbox: mtk-cmdq: Add struct cmdq_pkt in struct
 cmdq_cb_data
Date: Mon, 15 Mar 2021 07:33:23 +0800
Message-Id: <20210314233323.23377-4-chunkuang.hu@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210314233323.23377-1-chunkuang.hu@kernel.org>
References: <20210314233323.23377-1-chunkuang.hu@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210314_233341_945050_D97A05BD 
X-CRM114-Status: UNSURE (   8.59  )
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

Current client use 'struct cmdq_pkt' as callback data, so
change 'void *data' to 'struct cmdq_pkt *pkt'. Keep data
until client use pkt instead of data.

Cc: Jassi Brar <jassisinghbrar@gmail.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>
Cc: Houlong Wei <houlong.wei@mediatek.com>
Cc: Bibby Hsieh <bibby.hsieh@mediatek.com>
Cc: Dennis YC Hsieh <dennis-yc.hsieh@mediatek.com>
Cc: linux-kernel@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-mediatek@lists.infradead.org
Signed-off-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>
---
 drivers/mailbox/mtk-cmdq-mailbox.c       | 2 ++
 include/linux/mailbox/mtk-cmdq-mailbox.h | 1 +
 2 files changed, 3 insertions(+)

diff --git a/drivers/mailbox/mtk-cmdq-mailbox.c b/drivers/mailbox/mtk-cmdq-mailbox.c
index ef59e2234f22..99a9e0787501 100644
--- a/drivers/mailbox/mtk-cmdq-mailbox.c
+++ b/drivers/mailbox/mtk-cmdq-mailbox.c
@@ -188,6 +188,7 @@ static void cmdq_task_exec_done(struct cmdq_task *task, int sta)
 	WARN_ON(cb->cb == (cmdq_async_flush_cb)NULL);
 	data.sta = sta;
 	data.data = cb->data;
+	data.pkt = task->pkt;
 	if (cb->cb)
 		cb->cb(data);
 
@@ -456,6 +457,7 @@ static int cmdq_mbox_flush(struct mbox_chan *chan, unsigned long timeout)
 				 list_entry) {
 		data.sta = -ECONNABORTED;
 		data.data = cb->data;
+		data.pkt = task->pkt;
 		cb = &task->pkt->async_cb;
 		if (cb->cb)
 			cb->cb(data);
diff --git a/include/linux/mailbox/mtk-cmdq-mailbox.h b/include/linux/mailbox/mtk-cmdq-mailbox.h
index 2f7d9a37d611..44365aab043c 100644
--- a/include/linux/mailbox/mtk-cmdq-mailbox.h
+++ b/include/linux/mailbox/mtk-cmdq-mailbox.h
@@ -68,6 +68,7 @@ enum cmdq_code {
 struct cmdq_cb_data {
 	int			sta;
 	void			*data;
+	struct cmdq_pkt		*pkt;
 };
 
 typedef void (*cmdq_async_flush_cb)(struct cmdq_cb_data data);
-- 
2.17.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
