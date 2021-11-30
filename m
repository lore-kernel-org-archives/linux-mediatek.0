Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16641C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Nov 2021 17:32:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=zOcDi+WCA0dw8hils+0onud+E33wjAJfwXFMqTiZ/2g=; b=amW7S7I1BxeKfG
	oNKNhHcuHGRnQCaJ2UQmbrrOwoqCDgZwJPkyoro8aEDvnskx0GTLHVLe/3L6RGx5WwaHng5d2z8Bb
	pbbuwaYAkXjmzjf1VrJD0ggJFSQHp91Iv4gGrvIZ4zhPpySwwIYzY8k6vP19iMfSJzBkm97lhD2MX
	4q3wP4WF1MJ+Vitlzs/a3PyIhMVe2toTNdh1vNYRWB/vjxmPl8BEhAFY8CHU4OolePHzNh07lyRog
	4Fl4HFmvGUc8t62xQ86JTu6qLaBiWXvdDygzQ6sIfcSnNMhQ3RyDmw0dzNTmARp9JLiDkmCeo66sz
	TJhmBNE4gftoTJ3y3aZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ms6zQ-006KH4-9r; Tue, 30 Nov 2021 17:32:24 +0000
Received: from mta-p8.oit.umn.edu ([134.84.196.208])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ms6zN-006KGQ-QN
 for linux-mediatek@lists.infradead.org; Tue, 30 Nov 2021 17:32:23 +0000
Received: from localhost (unknown [127.0.0.1])
 by mta-p8.oit.umn.edu (Postfix) with ESMTP id 4J3Tn12ZGvz9vjCh
 for <linux-mediatek@lists.infradead.org>; Tue, 30 Nov 2021 17:32:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at umn.edu
Received: from mta-p8.oit.umn.edu ([127.0.0.1])
 by localhost (mta-p8.oit.umn.edu [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nrapYBFNErdH for <linux-mediatek@lists.infradead.org>;
 Tue, 30 Nov 2021 11:32:21 -0600 (CST)
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mta-p8.oit.umn.edu (Postfix) with ESMTPS id 4J3Tn10QKPz9vjCD
 for <linux-mediatek@lists.infradead.org>; Tue, 30 Nov 2021 11:32:21 -0600 (CST)
DMARC-Filter: OpenDMARC Filter v1.3.2 mta-p8.oit.umn.edu 4J3Tn10QKPz9vjCD
DKIM-Filter: OpenDKIM Filter v2.11.0 mta-p8.oit.umn.edu 4J3Tn10QKPz9vjCD
Received: by mail-pj1-f72.google.com with SMTP id
 x18-20020a17090a789200b001a7317f995cso11872377pjk.4
 for <linux-mediatek@lists.infradead.org>; Tue, 30 Nov 2021 09:32:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=umn.edu; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=0Up/NfjS7VaEB7cP0OIMaR/6NGfFlxGpUC060f7VlH8=;
 b=LgbIzllkX7OSlmNsxiG9OyhKA9X8UUrr90oDFyxdQ+6FldFgZ8OhhiTr6jrVGJVYxX
 ak2A0Ye/ZBh6tUuTMvOqcMrw7VPz11kYIhLhpXz12X5ydvHHg+rOvXSIWq24u0dqifXb
 XtObr0aB/0rORTIujfzrno9fV2Y58GG7QwMmpbc/eWvHV7SiJzuzFcyEelXQ2jqXwfpr
 BnuBDW/e480tQO66CQRRyD0HGN9LQ056YdZqJgWekP++dGT26QNhjsH1DsSujWu3oeml
 WbKzePa+fT/5g8RC2OXMpb/ae0UE+BvMvjkPF9963Z9e1Zb1rAWZStGyj6+n7JXb31p5
 0QEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=0Up/NfjS7VaEB7cP0OIMaR/6NGfFlxGpUC060f7VlH8=;
 b=76HhEZVAu+ChI4tPIQ5AG6Nwcy8y8XbEYyxkcU699CuPenVnO7Xaw+KbzMPknon2X+
 TSupJD838WrbJy/aZ5wIZwLnEM2DeKU7W51MRmw2iaZUZx6uHHRwId1KVzLase1Kf7FJ
 29tj592yvjkf7DZZnHNQxZFlSR4hwfAS8M2R4iEh4+iXt9+LIvxuDRwMH6sIsvpEUNtM
 zNrkmFP5s0slMy4F3Ig1bLS2S7HytDlrlJ7+42xFIbwJdCK3E4FrGkvSjSOMV+kfQ16V
 ja4hl/WeknL9ifaEBJd6M3urJORd4ua8P6Thuo2Xp14GUjgD6Puo2iPEUVPJodqgJZx9
 aqoQ==
X-Gm-Message-State: AOAM533+G0Row1hGOFDJ5AdDI9KkvZQmgoR+pvlZtYmfLFV2c0+HyqIv
 VvygAR+FMrSstOWtOHenN7GkdAQQtoWfdZAic9aavT9FiFdW5JmbERONWMZN7F++ngnLJ2Cju/5
 Eq52seDGrlK3KqkXEK0QxmTSd+nyYoMP7gCXt
X-Received: by 2002:a17:903:4053:b0:143:6d84:984c with SMTP id
 n19-20020a170903405300b001436d84984cmr722904pla.37.1638293540395; 
 Tue, 30 Nov 2021 09:32:20 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwmkvtdqC18D6/hPwj4l6CmxtmSs28zk1H/DR8W4JVcY3gJp4sR6QDyUJeABZtby3y19rakqQ==
X-Received: by 2002:a17:903:4053:b0:143:6d84:984c with SMTP id
 n19-20020a170903405300b001436d84984cmr722863pla.37.1638293540151; 
 Tue, 30 Nov 2021 09:32:20 -0800 (PST)
Received: from zqy787-GE5S.lan ([36.7.42.137])
 by smtp.gmail.com with ESMTPSA id l9sm1342900pfu.55.2021.11.30.09.32.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Nov 2021 09:32:19 -0800 (PST)
From: Zhou Qingyang <zhou1615@umn.edu>
To: zhou1615@umn.edu
Cc: kjlu@umn.edu, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 "weiyi.lu@mediatek.com" <weiyi.lu@mediatek.com>, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Subject: [PATCH] clk: mediatek: mt2712: Fix a NULL pointer dereference in
 clk_mt2712_top_init_early()
Date: Wed,  1 Dec 2021 01:32:13 +0800
Message-Id: <20211130173215.209258-1-zhou1615@umn.edu>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211130_093221_959283_BD96EA6D 
X-CRM114-Status: GOOD (  15.89  )
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

In clk_mt2712_top_init_early(), mtk_alloc_clk_data() is assigned to
top_clk_data and there is a dereference of it in
clk_mt2712_top_init_early() which could lead to a NULL pointer
dereference on failure of mtk_alloc_clk_data().

Fix this bug by adding a check of top_clk_data.

This bug was found by a static analyzer. The analysis employs
differential checking to identify inconsistent security operations
(e.g., checks or kfrees) between two code paths and confirms that the
inconsistent operations are not recovered in the current function or
the callers, so they constitute bugs.

Note that, as a bug found by static analysis, it can be a false
positive or hard to trigger. Multiple researchers have cross-reviewed
the bug.

Builds with CONFIG_COMMON_CLK_MT2712=y show no new warnings,
and our static analyzer no longer warns about this code.

Fixes: e2f744a82d72 ("clk: mediatek: Add MT2712 clock support")
Signed-off-by: Zhou Qingyang <zhou1615@umn.edu>
---
 drivers/clk/mediatek/clk-mt2712.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/clk/mediatek/clk-mt2712.c b/drivers/clk/mediatek/clk-mt2712.c
index 08ef56f68c7a..9050927d2d5d 100644
--- a/drivers/clk/mediatek/clk-mt2712.c
+++ b/drivers/clk/mediatek/clk-mt2712.c
@@ -1286,6 +1286,11 @@ static void clk_mt2712_top_init_early(struct device_node *node)
 
 	if (!top_clk_data) {
 		top_clk_data = mtk_alloc_clk_data(CLK_TOP_NR_CLK);
+		if (!top_clk_data) {
+			pr_err("%s(): could not register clock provider: %d\n",
+				__func__, -ENOMEM);
+			return;
+		}
 
 		for (i = 0; i < CLK_TOP_NR_CLK; i++)
 			top_clk_data->clks[i] = ERR_PTR(-EPROBE_DEFER);
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
