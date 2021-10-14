Return-Path: <SRS0=9yZI=PC=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 955A5C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 Oct 2021 09:34:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 67F5C60E96
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 Oct 2021 09:34:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 67F5C60E96
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=da1+QGgQ5yYpUD0BM5UhCwGSbbokaRSf7khQGyZycBM=; b=x9wCz88ayjQOjA
	dscPQ/WgWpqZMEve2YwpKQovVRJ40FrF8gzaHH6wf6blruq0mumJSlWsOnk4oAX3PXTn8lm4ocKC4
	U4aMh4JBOXupTcrNKYot+C3PROcBFkbsjSfLmCg4S1ll9lWBiCaILoWESfOk/qpUwfuLDOGUs1s4I
	iz1dodTdQuLA5h6vmmigP4/g+sUl8qHz7DiAx+E6RvCJKuNhGpmanguh7RtkK+kpfCSi84jlAYZoH
	5f5mBiwDqGrkI57VMvoKld418WSPVxR/0DfbQ6P5RQL4VklipNyx9A6ls4H1d7p4xhTdRipnoCdX/
	j9GaPIyrKdNsEFcGfEvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1max87-002O6J-Rw; Thu, 14 Oct 2021 09:34:27 +0000
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1max6V-002NPn-Jl
 for linux-mediatek@lists.infradead.org; Thu, 14 Oct 2021 09:32:48 +0000
Received: by mail-pj1-x1033.google.com with SMTP id ls18so4296021pjb.3
 for <linux-mediatek@lists.infradead.org>; Thu, 14 Oct 2021 02:32:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=3N7LqSgN+UZnAqVmRLbsz9jNSkFsNbdadLpiAPsmvpk=;
 b=TgDBT/R5HvVKa0u4zhVU3L2rR4sTGVKN8VBSQ/gbIfj4Glo7ia+/8PC5icCb4uRw6+
 Z7sUeLMjbqq7MG5x8IldR+YRUKu8Fn37oI4kfPTO3mV6TeLU75zv4YFHGjjQqad8tYW2
 QDFWX0brHo4Ec/h4sHsklnd0l/SYdQBaAs0lk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=3N7LqSgN+UZnAqVmRLbsz9jNSkFsNbdadLpiAPsmvpk=;
 b=TeXJ97BWPR+1I8lYeO0HNa7UyjkFtaXe65q5fq8fsvcooftdSroqjEL5jr2hBwswWV
 /Bh+Oysf49zX6cRK62lcmPNSAoJr4rtmWOxO00SYsOBDgCOS3cZHOE1Bzi5Xu7qfQpIm
 CKf2/4VuHdVrtT0OVzYUhiSxI9mbhVB6H9cDmBRdzkJpnBDuho3+lqNB8+oc81s8vFzg
 /WR1HrPmqKguiqaWcZZuqlmIDKAB8VmEc5aHMSyzrgB5LSuZxLLqmZdvoz24tzJNVZuo
 b6+/SEdc2ugIu83Se+1Ycwouenq7XFmnN9XVb0OMurJ3Tm04avDXRWjt1o+ggsyWj9TX
 KBYw==
X-Gm-Message-State: AOAM532qOQN3JJbUmSUE/J/ftZEz259Aua9QlOKDRazb2GrNAw0HL550
 YrRp5MJ+0S2hn04qefs3S2DjAw==
X-Google-Smtp-Source: ABdhPJzo8cSv6WRzPAAlW8Vhmr32cF+Mld9yZj/Q/Fo9HPwQ4SN8yXMworzFOb19WFWs05zoDSIJpA==
X-Received: by 2002:a17:90a:b948:: with SMTP id
 f8mr680033pjw.129.1634203965729; 
 Thu, 14 Oct 2021 02:32:45 -0700 (PDT)
Received: from fshao-glinux.tpe.corp.google.com
 ([2401:fa00:1:10:64c0:3f2d:5152:a6f1])
 by smtp.gmail.com with ESMTPSA id k6sm2120116pfg.18.2021.10.14.02.32.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Oct 2021 02:32:45 -0700 (PDT)
From: Fei Shao <fshao@chromium.org>
To: Jassi Brar <jaswinder.singh@linaro.org>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Fei Shao <fshao@chromium.org>,
 Jassi Brar <jassisinghbrar@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 "jason-jh.lin" <jason-jh.lin@mediatek.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org
Subject: [PATCH 1/2] mailbox: mtk-cmdq: Validate alias_id on probe
Date: Thu, 14 Oct 2021 17:31:10 +0800
Message-Id: <20211014093112.3852491-1-fshao@chromium.org>
X-Mailer: git-send-email 2.33.0.882.g93a45727a2-goog
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211014_023247_684016_0709CDE9 
X-CRM114-Status: GOOD (  11.66  )
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

of_alias_get_id() may return -ENODEV which leads to illegal access to
the cmdq->clocks array.
Adding a check over alias_id to prevent the unexpected behavior.

Fixes: 85dfdbfc13ea ("mailbox: cmdq: add multi-gce clocks support for
mt8195")
Signed-off-by: Fei Shao <fshao@chromium.org>
---

 drivers/mailbox/mtk-cmdq-mailbox.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mailbox/mtk-cmdq-mailbox.c b/drivers/mailbox/mtk-cmdq-mailbox.c
index 64175a893312..f3e52dddd422 100644
--- a/drivers/mailbox/mtk-cmdq-mailbox.c
+++ b/drivers/mailbox/mtk-cmdq-mailbox.c
@@ -573,7 +573,7 @@ static int cmdq_probe(struct platform_device *pdev)
 			char clk_id[8];
 
 			alias_id = of_alias_get_id(node, clk_name);
-			if (alias_id < cmdq->gce_num) {
+			if (alias_id >= 0 && alias_id < cmdq->gce_num) {
 				snprintf(clk_id, sizeof(clk_id), "%s%d", clk_name, alias_id);
 				cmdq->clocks[alias_id].id = clk_id;
 				cmdq->clocks[alias_id].clk = of_clk_get(node, 0);
-- 
2.33.0.882.g93a45727a2-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
