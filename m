Return-Path: <SRS0=rPqH=BG=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7440AC43616
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 Jul 2020 23:26:26 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4017720A8B
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 Jul 2020 23:26:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="EKKJRBnB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4017720A8B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=zAhqZyd2PzedS0jAf6tOk/4mc7auhYZP5wJ4ErTbMm0=; b=EKKJRBnBmXLN6fFPRmO3hN+vk
	ifczQjlKI2/+0f4dIComkIuCu5uYhPdYhXoOx2XqWDeF4ZSCLUANH8M48+LIocgJToJj5L+ofRk7x
	elWuE5D4A06De1AJs2aeaF37Dv8o3CDtLoRSgT5lRugYbpYJq5To5DAI2Nsp7QwbrPGFygHJuANWp
	X1L3kIGzpQeWcWDxWdVnEiiFwDJH7VJ1FUq+qoPRfSsbKrcXg3faU+3xwdBKaCDGFnHipvDsMwVBR
	+RqnhHxczttWJrbbVAY6ZYiZ1dVK3WSsDMeerqTgGF0OF2ojZLfikbuaEfjVT7ztCfkbiSBpGuVAo
	10cZT+L1Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k0CVY-0000Ty-CE; Mon, 27 Jul 2020 23:26:12 +0000
Received: from mga01.intel.com ([192.55.52.88])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k0CUq-00007I-Hn; Mon, 27 Jul 2020 23:25:29 +0000
IronPort-SDR: 5W0rt6jcQWl8EJ0Yd6dNYqTjyCq6oLsLmisTww/w09JefJ9RJCn0+n48YczQrijurMeT2AFlyR
 I8SmqKlKyDAQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9695"; a="169238631"
X-IronPort-AV: E=Sophos;i="5.75,404,1589266800"; d="scan'208";a="169238631"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jul 2020 16:25:26 -0700
IronPort-SDR: I5hFIpPRz/MeeKxICmXiippEuDFNU0wUnicuq5fVYa6zq9TQWr0NVMUAkCrQmKnDWq7igeBT8H
 C/gGqr5NAhng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,404,1589266800"; d="scan'208";a="434114739"
Received: from lkp-server01.sh.intel.com (HELO df0563f96c37) ([10.239.97.150])
 by orsmga004.jf.intel.com with ESMTP; 27 Jul 2020 16:25:24 -0700
Received: from kbuild by df0563f96c37 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1k0CUl-00025h-Fv; Mon, 27 Jul 2020 23:25:23 +0000
Date: Tue, 28 Jul 2020 07:24:51 +0800
From: kernel test robot <lkp@intel.com>
To: Chun-Hung Wu <chun-hung.wu@mediatek.com>
Subject: [RFC PATCH linux-next] mmc: mediatek: msdc_cqe_disable() can be static
Message-ID: <20200727232451.GA16371@cc981e2e651b>
References: <202007280704.Sbr6LVoE%lkp@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <202007280704.Sbr6LVoE%lkp@intel.com>
X-Patchwork-Hint: ignore
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200727_192528_793903_EC808ED2 
X-CRM114-Status: GOOD (  17.42  )
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
Cc: Ulf Hansson <ulf.hansson@linaro.org>, kbuild-all@lists.01.org,
 linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, Chaotian Jing <chaotian.jing@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


Fixes: 88bd652b3c74 ("mmc: mediatek: command queue support")
Signed-off-by: kernel test robot <lkp@intel.com>
---
 mtk-sd.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mmc/host/mtk-sd.c b/drivers/mmc/host/mtk-sd.c
index 734e403a142e4..4e2583f69a631 100644
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
