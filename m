Return-Path: <SRS0=rPqH=BG=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F082C433E1
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 Jul 2020 17:11:44 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4E0662074F
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 Jul 2020 17:11:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="pvIeutiq"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4E0662074F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=pogvvaBMHg9L3EcJS5F2ODU71ciLH+j1Y+JYRDJfPAc=; b=pvIeutiq/Wk51FoswnpDEAplTp
	UZhOkFmzy5NrWcUAqQUTm/wWtnb7OFz5a78JyivjAZLFHtt3kfWcMq/FYQavRYGlO4Rrwo1fNH7KZ
	1BG4oRALxqH1hNcD+poskDhsHGrraLMcCSx1Z/WVFHofTf4amLXvYcVD6FK1S7BMaiLJ35vIwj28I
	volfovaFHq2lD9bahbBb6CxHmJNh97V92X2HrI4TZWdkLEw0WNqEQC70Y01cyH1pLE9UsaCy31tqc
	LFg7i54suLwZy6CmAnLxceo1oNTVRsQUazRg0CC15Ojnz+FUNfby+7xkZNLY8Cdojzpvpqolng4lz
	y4aKSoAA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k06f1-0005Eq-SU; Mon, 27 Jul 2020 17:11:35 +0000
Received: from szxga06-in.huawei.com ([45.249.212.32] helo=huawei.com)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k06ev-0005Au-Kv; Mon, 27 Jul 2020 17:11:30 +0000
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 0FB6E238D3403D437591;
 Tue, 28 Jul 2020 01:01:46 +0800 (CST)
Received: from kernelci-master.huawei.com (10.175.101.6) by
 DGGEMS414-HUB.china.huawei.com (10.3.19.214) with Microsoft SMTP Server id
 14.3.487.0; Tue, 28 Jul 2020 01:01:38 +0800
From: Wei Yongjun <weiyongjun1@huawei.com>
To: Hulk Robot <hulkci@huawei.com>, Chaotian Jing
 <chaotian.jing@mediatek.com>, Ulf Hansson <ulf.hansson@linaro.org>,
 "Matthias Brugger" <matthias.bgg@gmail.com>, Chun-Hung Wu
 <chun-hung.wu@mediatek.com>
Subject: [PATCH -next] mmc: mediatek: make function msdc_cqe_disable() static
Date: Tue, 28 Jul 2020 01:11:29 +0800
Message-ID: <20200727171129.2945-1-weiyongjun1@huawei.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.175.101.6]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200727_131129_932140_EB07946B 
X-CRM114-Status: GOOD (  10.40  )
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
Cc: linux-mmc@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Wei Yongjun <weiyongjun1@huawei.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

The sparse tool complains as follows:

drivers/mmc/host/mtk-sd.c:2269:6: warning:
 symbol 'msdc_cqe_disable' was not declared. Should it be static?

This function is not used outside of mtk-sd.c, so this commit
marks it static.

Fixes: 88bd652b3c74 ("mmc: mediatek: command queue support")
Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 drivers/mmc/host/mtk-sd.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mmc/host/mtk-sd.c b/drivers/mmc/host/mtk-sd.c
index 734e403a142e..4e2583f69a63 100644
--- a/drivers/mmc/host/mtk-sd.c
+++ b/drivers/mmc/host/mtk-sd.c
@@ -2266,7 +2266,7 @@ static void msdc_cqe_enable(struct mmc_host *mmc)
 	msdc_set_timeout(host, 1000000000ULL, 0);
 }
 
-void msdc_cqe_disable(struct mmc_host *mmc, bool recovery)
+static void msdc_cqe_disable(struct mmc_host *mmc, bool recovery)
 {
 	struct msdc_host *host = mmc_priv(mmc);
 


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
