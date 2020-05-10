Return-Path: <SRS0=ZjOp=6Y=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F173C47255
	for <linux-mediatek@archiver.kernel.org>; Sun, 10 May 2020 02:55:06 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D4C77208DB
	for <linux-mediatek@archiver.kernel.org>; Sun, 10 May 2020 02:55:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="r6rYD9c/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D4C77208DB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=25Wv5DlsLhj9n2sNkfFcVY+Gozau11u7xtmuwBDZw7Q=; b=r6rYD9c/ZBS+sf
	Fsa81MUIqRjHSOYo7th/BOhQWTm0JAqq9vF9GlB6hzm+MA2sm5souLMnXuRVTqxQ8vibvqUCRldt+
	Af/j07yWfg/XbKpDNk9WduZHGY6iVr7ZrNtWsZ2K2hazcF86XQujjOUrrozQQT/PquESAAzLFcdYY
	F7+22GLNRG1qnANJBCLWu8HUTuS0KS92bYpexHR5PYyCWIwV5wkthf1QtIAHI8Tv3m93m55jkYaCD
	H0vLUFN4EMhZiv/WulFmvRQ6GkWTT7Wy5Qenf4CWRlOfoGRFP+XLNCO6oHUEqyOAel2FOJyTmjm2r
	xBXdCMbtmBVIwy156uWw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jXc7A-0002kY-Vk; Sun, 10 May 2020 02:54:52 +0000
Received: from mga11.intel.com ([192.55.52.93])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jXc70-0002dT-Ah; Sun, 10 May 2020 02:54:43 +0000
IronPort-SDR: BtmXI79gpR+w5I5ALVxwZdYlUTNDhWPrXb/yRNU/lxYveL+4egsx+Ej7i1kl7aAIalVyyKbPWq
 m+SS4rwBXuKQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2020 19:54:38 -0700
IronPort-SDR: gLKSvjqdhbFY4l42K/I6C8Hflg+fYb1UnAK0Ulzu6tNFma4fxWlGHlzxU/T38VqqW4RoPcNiOh
 GHgKRIPPfxmg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,374,1583222400"; d="scan'208";a="261397162"
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
 by orsmga003.jf.intel.com with ESMTP; 09 May 2020 19:54:36 -0700
Received: from kbuild by lkp-server01 with local (Exim 4.89)
 (envelope-from <lkp@intel.com>)
 id 1jXc6u-000E33-2R; Sun, 10 May 2020 10:54:36 +0800
Date: Sun, 10 May 2020 10:53:38 +0800
From: kbuild test robot <lkp@intel.com>
To: Matthias Brugger <mbrugger@suse.com>
Subject: [PATCH] clk / soc: mediatek: fix ptr_ret.cocci warnings
Message-ID: <20200510025338.GA81310@f5ba873997c7>
References: <202005101033.xLBIJF9V%lkp@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <202005101033.xLBIJF9V%lkp@intel.com>
X-Patchwork-Hint: ignore
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200509_195442_376601_6AF9D161 
X-CRM114-Status: GOOD (  11.36  )
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
Cc: kbuild-all@lists.01.org, Stephen Boyd <sboyd@kernel.org>,
 linux-kernel@vger.kernel.org, CK Hu <ck.hu@mediatek.com>,
 linux-mediatek@lists.infradead.org,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: kbuild test robot <lkp@intel.com>

drivers/soc/mediatek/mtk-mmsys.c:28:1-3: WARNING: PTR_ERR_OR_ZERO can be used


 Use PTR_ERR_OR_ZERO rather than if(IS_ERR(...)) + PTR_ERR

Generated by: scripts/coccinelle/api/ptr_ret.cocci

Fixes: 13032709e232 ("clk / soc: mediatek: Move mt8173 MMSYS to platform driver")
CC: Matthias Brugger <mbrugger@suse.com>
Signed-off-by: kbuild test robot <lkp@intel.com>
---

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   30e2206e11ce27ae910cc0dab21472429e400a87
commit: 13032709e2328553970f0002df5edce6aac69425 [1266/7905] clk / soc: mediatek: Move mt8173 MMSYS to platform driver

 mtk-mmsys.c |    5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

--- a/drivers/soc/mediatek/mtk-mmsys.c
+++ b/drivers/soc/mediatek/mtk-mmsys.c
@@ -25,10 +25,7 @@ static int mtk_mmsys_probe(struct platfo
 
 	clks = platform_device_register_data(&pdev->dev, data->clk_driver,
 					     PLATFORM_DEVID_AUTO, NULL, 0);
-	if (IS_ERR(clks))
-		return PTR_ERR(clks);
-
-	return 0;
+	return PTR_ERR_OR_ZERO(clks);
 }
 
 static const struct of_device_id of_match_mtk_mmsys[] = {

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
