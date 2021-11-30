Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB2CFC433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Nov 2021 11:09:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=tR6zy59L8JLZVr1eP5an9TqsFGuyoCqRjd6cWjdbLSo=; b=q32yG4Y75HuEx7
	XVTLQaEUeQWTuh5XKq4Mm0p9hGeQvqnpkINJFy2QcXqJJcBtxTotLHLoBTyV8NSHKGJkgcMi3pQh3
	lUsWdz110EZxVoeEbneQMPiMQ26PgupUXHwu1djyErC18CIO9ZOWrQdzjkong27oq83durS6cdeS6
	ENsvgWVTDX64vXNXmud6n0qJDdi2pUAwzmpYteU3HJycZ9oNigoDwogvRELBKhme8YlBH/J2bojoX
	Ik8JxZVRBF6BftgS+lCYzTBZBXwg60PK5TU5DFhgMRPNTrO0A3D1T9IV9uxQaDI8GKSbG9x4qSg6l
	FepnkwWFy9O+5VC6g9HQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ms10Q-004lpB-EF; Tue, 30 Nov 2021 11:09:02 +0000
Received: from mta-p5.oit.umn.edu ([134.84.196.205])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ms10N-004lnD-40
 for linux-mediatek@lists.infradead.org; Tue, 30 Nov 2021 11:09:00 +0000
Received: from localhost (unknown [127.0.0.1])
 by mta-p5.oit.umn.edu (Postfix) with ESMTP id 4J3KGc20T5z9w940
 for <linux-mediatek@lists.infradead.org>; Tue, 30 Nov 2021 11:08:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at umn.edu
Received: from mta-p5.oit.umn.edu ([127.0.0.1])
 by localhost (mta-p5.oit.umn.edu [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wKXpazUfL3bW for <linux-mediatek@lists.infradead.org>;
 Tue, 30 Nov 2021 05:08:56 -0600 (CST)
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com
 [209.85.215.199])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mta-p5.oit.umn.edu (Postfix) with ESMTPS id 4J3KGb6zSCz9w93x
 for <linux-mediatek@lists.infradead.org>; Tue, 30 Nov 2021 05:08:55 -0600 (CST)
DMARC-Filter: OpenDMARC Filter v1.3.2 mta-p5.oit.umn.edu 4J3KGb6zSCz9w93x
DKIM-Filter: OpenDKIM Filter v2.11.0 mta-p5.oit.umn.edu 4J3KGb6zSCz9w93x
Received: by mail-pg1-f199.google.com with SMTP id
 v3-20020a63b643000000b003255b6cb43aso4823125pgt.6
 for <linux-mediatek@lists.infradead.org>; Tue, 30 Nov 2021 03:08:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=umn.edu; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=L4d1W48kwHHShV4SEtnKYtW4rYy9ZnpgrsWKK2v2g6k=;
 b=GtUW2K/WOpbVkir7I1Tp3FYTarK7YibkN6sNrEotnvhlY9v5OkC6trHYw/B6W6GjNZ
 4QDcoIiSn2o2iY7sELuG/ejW1DjHwKq1RYQVQbSNIJ18HagJl369LgtwiHS69lr/OWGc
 T9klLrFg/3MncZKUeJdY/41Nas3lB1ZKkmi6o0b17UpILbv1gUq3KQhRhVdTq7ILe1UQ
 zd2T9i+Shr2di+mwZKL2sfYUGLgkWXi+38tyEylmcQsJ906rVrb3hH9PkJUybA6jRDf1
 66DsXXSuyZu/3SQ4JzMMN/tXeMdQW1XDcmv1O/Fw5YSblxekSdVUFaMQ+a8OokZdhSIk
 t//g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=L4d1W48kwHHShV4SEtnKYtW4rYy9ZnpgrsWKK2v2g6k=;
 b=ZRPhGVndUpY4bYU3RE9JZsQorlpU7B7xT2n6DlpZTnMn8bncNtXkKqON9DzdPaKoA6
 X1Q9LuODQQ/hbzqDYTp6a/6IgVVZNaQJR5iwEfCzUAi/Yv0FQ4yEIwnbuEB5q2fahJRr
 nCcY3suTyxaaPEMxCbYDRpqPkPIMx1XRBvtgpA/qYTwLkcZ9wpnxqV/hOQaQTBnBtH/O
 9r9R9nn/u7EzGJ+244/dbfx5DRQOMVyOy0YyZJ8ZglBNyEHYuj+FSJm8FOIhUAs36E8e
 oQ8iooTvZe8akerKhBIwgNtTtVUTOogrYGm7QcahQlIi0WdDocQGcywf+C32Qb6lo+2a
 aRWQ==
X-Gm-Message-State: AOAM532rngxMEz96BCukg+5wsJM0Yu1zKmNmsyZrov6lhQFS4ntovhw+
 CzmlL93dP9RHB7MCtrUqe57ssOpFAX3vavWy1wHNSrvXcOHOJI0cZwEBgGmO2u3AXZyqya/qDMf
 joZH20ySMZGD2DTfjLYN9zw7Q8FDTeIkWEheJ
X-Received: by 2002:a63:5204:: with SMTP id g4mr12856352pgb.319.1638270535200; 
 Tue, 30 Nov 2021 03:08:55 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyhQMDrKlRy9nZ2NlLQm9ytvcBmwZ3NlEtd489Hx6S5Lk90kMvYdn8hmVlN3kWuCXwOlhER/w==
X-Received: by 2002:a63:5204:: with SMTP id g4mr12856329pgb.319.1638270534953; 
 Tue, 30 Nov 2021 03:08:54 -0800 (PST)
Received: from zqy787-GE5S.lan ([36.7.42.137])
 by smtp.gmail.com with ESMTPSA id u38sm23783318pfg.0.2021.11.30.03.08.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Nov 2021 03:08:54 -0800 (PST)
From: Zhou Qingyang <zhou1615@umn.edu>
To: zhou1615@umn.edu
Cc: kjlu@umn.edu, Shahed Shaikh <shshaikh@marvell.com>,
 Manish Chopra <manishc@marvell.com>, GR-Linux-NIC-Dev@marvell.com,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Sucheta Chakraborty <sucheta.chakraborty@qlogic.com>,
 Sritej Velaga <sritej.velaga@qlogic.com>,
 Sony Chacko <sony.chacko@qlogic.com>,
 Anirban Chakraborty <anirban.chakraborty@qlogic.com>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: [PATCH] clk: mediatek: net: qlogic: qlcnic: Fix a NULL pointer
 dereference in qlcnic_83xx_add_rings()
Date: Tue, 30 Nov 2021 19:08:48 +0800
Message-Id: <20211130110848.109026-1-zhou1615@umn.edu>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211130_030859_282138_993D11C4 
X-CRM114-Status: GOOD (  18.54  )
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

In qlcnic_83xx_add_rings(), the indirect function of
ahw->hw_ops->alloc_mbx_args will be called to allocate memory for
cmd.req.arg, and there is a dereference of it in qlcnic_83xx_add_rings(),
which could lead to a NULL pointer dereference on failure of the
indirect function like qlcnic_83xx_alloc_mbx_args().

Fix this bug by adding a check of alloc_mbx_args(), this patch
imitates the logic of mbx_cmd()'s failure handling.

This bug was found by a static analyzer. The analysis employs
differential checking to identify inconsistent security operations
(e.g., checks or kfrees) between two code paths and confirms that the
inconsistent operations are not recovered in the current function or
the callers, so they constitute bugs.

Note that, as a bug found by static analysis, it can be a false
positive or hard to trigger. Multiple researchers have cross-reviewed
the bug.

Builds with CONFIG_QLCNIC=m show no new warnings, and our
static analyzer no longer warns about this code.

Fixes: 7f9664525f9c ("qlcnic: 83xx memory map and HW access routine")
Signed-off-by: Zhou Qingyang <zhou1615@umn.edu>
---
 drivers/net/ethernet/qlogic/qlcnic/qlcnic_83xx_hw.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/qlogic/qlcnic/qlcnic_83xx_hw.c b/drivers/net/ethernet/qlogic/qlcnic/qlcnic_83xx_hw.c
index d51bac7ba5af..bd0607680329 100644
--- a/drivers/net/ethernet/qlogic/qlcnic/qlcnic_83xx_hw.c
+++ b/drivers/net/ethernet/qlogic/qlcnic/qlcnic_83xx_hw.c
@@ -1077,8 +1077,14 @@ static int qlcnic_83xx_add_rings(struct qlcnic_adapter *adapter)
 	sds_mbx_size = sizeof(struct qlcnic_sds_mbx);
 	context_id = recv_ctx->context_id;
 	num_sds = adapter->drv_sds_rings - QLCNIC_MAX_SDS_RINGS;
-	ahw->hw_ops->alloc_mbx_args(&cmd, adapter,
-				    QLCNIC_CMD_ADD_RCV_RINGS);
+	err = ahw->hw_ops->alloc_mbx_args(&cmd, adapter,
+					QLCNIC_CMD_ADD_RCV_RINGS);
+	if (err) {
+		dev_err(&adapter->pdev->dev,
+			"Failed to alloc mbx args %d\n", err);
+		return err;
+	}
+
 	cmd.req.arg[1] = 0 | (num_sds << 8) | (context_id << 16);
 
 	/* set up status rings, mbx 2-81 */
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
