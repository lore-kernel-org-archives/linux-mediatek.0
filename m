Return-Path: <SRS0=Og7P=FG=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B27C1C64E8A
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Dec 2020 04:46:20 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 16414221FE
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Dec 2020 04:46:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 16414221FE
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:From:Subject:Mime-Version:Message-Id:Date:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=qkTbwlPA5no1Ba7PC4PuOuFVZGsQTrjpArDw9uq9m7A=; b=wKtclob1Mo1iC7m6skUS74Fmfh
	4aqX8bnPjajdphCW4wCHk3ml4X6st9GdJUidIRIbzXzYpJUJWTGZf2w4ku2uIOIwG1kGrrUSH3yDo
	7yKf3jEVTIFlvY2q3ojpqjnyQAmIW7jBaNQ7PqG2ob5YB9M6YAz/2eedGMWq8LF9hs3C1PyzFS6Tg
	rVud9aKKe8ihn3hTGvRwMqCkacYdrVV1EXU8AsH5qJMZAXTNpeJpxcI3R9V0+oU+pFusOUQcwEpDT
	NSOclCaNVOrWfvkd6MUEOIMwiz7b36bBbpWMjy90xvKSqKBIpzm28ayp7fZOlHNwmeBDw/AtH6XxK
	CNGbU1Mg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kkK1s-0006PI-6V; Wed, 02 Dec 2020 04:46:12 +0000
Received: from mail-qt1-x84a.google.com ([2607:f8b0:4864:20::84a])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kkK1n-0006O9-Up
 for linux-mediatek@lists.infradead.org; Wed, 02 Dec 2020 04:46:10 +0000
Received: by mail-qt1-x84a.google.com with SMTP id c11so383370qtw.10
 for <linux-mediatek@lists.infradead.org>; Tue, 01 Dec 2020 20:46:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=sender:date:message-id:mime-version:subject:from:to:cc;
 bh=KaD/sETMhQdwAs4CxEJvlROU3dFFHCWo0dFsT9X/rFw=;
 b=HqtyOa7OG56z5TA7PLMydmHYJxsAKx/WMKSXgBPdXYpQbAMfKonL5cSXWbbkl9KjhI
 JdBgvEZTXZGjXhN6yukz5tIIIB3ZeA9f4vzH0+fw1J2jwW2B6ZMxm6iP/KSgC2G1SmGE
 yT3qY0rHdTKa1M0OD9DYU4abtt/AQeZIex8J8aWxexSKwHtb9aa2mpwwX8TSm8p+wk0Y
 DVEJLOxa5SnTwD59EFqZrWzmxpPLeyTlMbxwmWzV6F44qStm3c6oTqAvK1Fucqh/+uXs
 /JWUHmohoaQ+K0MYpGXJX9J1qsGzS2EclWMkPNb2tsBOLgtTwmcbK0QyEqnoBjG9CSv+
 pKmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:message-id:mime-version:subject:from
 :to:cc;
 bh=KaD/sETMhQdwAs4CxEJvlROU3dFFHCWo0dFsT9X/rFw=;
 b=BeaP4shejxfQ7sEboIgGbqUI2HywoZJyW6w1Nhof2z6EAC2hCoxbrU9cOiqRS4o8vv
 U6obtKB7CuvNcxd8cKswtcK+sRCXDle2te06TkV7dEMKzrB/fZ1d8uVx0LInyc0Ya0Pz
 O74ooW67cOKt+zYC5BkIyVMrgknzwIVMDC1SqGekhyjxD3GjkP2NV1RYLTrsFXZhRym7
 TEsqGM3UVRKtX9ZzBKIckdSfL/PBlEE2ENdfSWoQckVKIa4UkAkuvloRvprgSQ73CZ7l
 iL7BERFb4PVvfXRd0eMmcPUOyy6O9RnKX6XBaf0sxGVst7uKjk7SoA5RI0Pf7ZV4irNl
 /4kg==
X-Gm-Message-State: AOAM53369j+/Dq2+mPFM+zydTdz7snN8US22HcbDfjkfY0m+HKOk1Ji3
 iPbGM79w+0fBCFRLcs1t/8rbvoxm3S5+
X-Google-Smtp-Source: ABdhPJxIqcCBWdbzcwmEwprb6kcsp08cmzPY7xMIsej180ilIQOQ7gBZtgOPoEGoGa4RkKipRh5+zEF+lUBj
X-Received: from tzungbi-z840.tpe.corp.google.com
 ([2401:fa00:1:b:725a:fff:fe41:c6a5])
 (user=tzungbi job=sendgmr) by 2002:ad4:4721:: with SMTP id
 l1mr908110qvz.30.1606884364037; Tue, 01 Dec 2020 20:46:04 -0800 (PST)
Date: Wed,  2 Dec 2020 12:45:37 +0800
Message-Id: <20201202044537.2500497-1-tzungbi@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.29.2.454.gaff20da3a2-goog
Subject: [PATCH] remoteproc/mediatek: unprepare clk if scp_before_load fails
From: Tzung-Bi Shih <tzungbi@google.com>
To: ohad@wizery.com, bjorn.andersson@linaro.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201201_234608_003383_35425C28 
X-CRM114-Status: GOOD (  11.87  )
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
Cc: mathieu.poirier@linaro.org, linux-remoteproc@vger.kernel.org,
 tzungbi@google.com, linux-mediatek@lists.infradead.org, pihsun@chromium.org,
 matthias.bgg@gmail.com, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Fixes the error handling to unprepare clk if scp_before_load fails.

Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>
---
 drivers/remoteproc/mtk_scp.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/remoteproc/mtk_scp.c b/drivers/remoteproc/mtk_scp.c
index 5f42b9ce7185..c7d49c861adb 100644
--- a/drivers/remoteproc/mtk_scp.c
+++ b/drivers/remoteproc/mtk_scp.c
@@ -350,11 +350,11 @@ static int scp_load(struct rproc *rproc, const struct firmware *fw)
 
 	ret = scp->data->scp_before_load(scp);
 	if (ret < 0)
-		return ret;
+		goto leave;
 
 	ret = scp_elf_load_segments(rproc, fw);
+leave:
 	clk_disable_unprepare(scp->clk);
-
 	return ret;
 }
 
-- 
2.29.2.454.gaff20da3a2-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
