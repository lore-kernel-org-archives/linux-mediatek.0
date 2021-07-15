Return-Path: <SRS0=ob7z=MH=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D25EC1B08C
	for <linux-mediatek@archiver.kernel.org>; Thu, 15 Jul 2021 11:13:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CE980613BC
	for <linux-mediatek@archiver.kernel.org>; Thu, 15 Jul 2021 11:13:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CE980613BC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=m0R/NGYyCugDy6k0ka0r0Lr+nRZGNMbq9p2zZqXxZag=; b=hH3wgWAFgXTxeG
	J3QQyAVfu2cmTjgBdc+k+CWluhweBBugKkE8QWZ4Sgq1wdBWLYazBx6k9BXEowFjbcbZ6TakdNFFW
	jD7C0kJWXNPa9I8Y0Nh2UdqtgtYpV/ofGENYyJeY3Str8QL7swwAmjYb48z6bsodvEXkAxtspyCvt
	1NeElGfgVoN3Qh/wctpzLMGCSSanTaQAxnqoyyt4tanFk/iZAzdJVGzi5bBgi01TxrSi6crujytV9
	TkIBQ30Rc5mHPqwBQOsGS/9tHdEC1udntaL9TodemXEITuVAbKioOCz3KwgwrpGXCuOg2jXKzkuct
	n8E+UGJDfRxsdb0/UsUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m3zIQ-000Z6d-1Z; Thu, 15 Jul 2021 11:12:50 +0000
Received: from mga01.intel.com ([192.55.52.88])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m3zIM-000Z4M-E4; Thu, 15 Jul 2021 11:12:48 +0000
X-IronPort-AV: E=McAfee;i="6200,9189,10045"; a="232348250"
X-IronPort-AV: E=Sophos;i="5.84,240,1620716400"; d="scan'208";a="232348250"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2021 04:12:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,240,1620716400"; d="scan'208";a="466654360"
Received: from lkp-server01.sh.intel.com (HELO 4aae0cb4f5b5) ([10.239.97.150])
 by fmsmga008.fm.intel.com with ESMTP; 15 Jul 2021 04:12:43 -0700
Received: from kbuild by 4aae0cb4f5b5 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1m3zII-000JcR-Mm; Thu, 15 Jul 2021 11:12:42 +0000
Date: Thu, 15 Jul 2021 19:12:41 +0800
From: kernel test robot <lkp@intel.com>
To: Fabien Parent <fparent@baylibre.com>
Cc: kbuild-all@lists.01.org, linux-kernel@vger.kernel.org,
 Linus Walleij <linus.walleij@linaro.org>, Sean Wang <sean.wang@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: [PATCH] pinctrl: mediatek: fix platform_no_drv_owner.cocci warnings
Message-ID: <20210715111241.GA68733@f2b338499183>
References: <202107151930.RDfhAWvb-lkp@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <202107151930.RDfhAWvb-lkp@intel.com>
X-Patchwork-Hint: ignore
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210715_041246_527786_994A80F5 
X-CRM114-Status: GOOD (  13.11  )
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

From: kernel test robot <lkp@intel.com>

drivers/pinctrl/mediatek/pinctrl-mt8365.c:488:3-8: No need to set .owner here. The core will do it.

 Remove .owner field if calls are used which set it automatically

Generated by: scripts/coccinelle/api/platform_no_drv_owner.cocci

CC: Fabien Parent <fparent@baylibre.com>
Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: kernel test robot <lkp@intel.com>
---

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   8096acd7442e613fad0354fc8dfdb2003cceea0b
commit: e94d8b6fb83a81fa8c6595fadcada7b349e7694a pinctrl: mediatek: add support for mt8365 SoC
:::::: branch date: 19 hours ago
:::::: commit date: 7 weeks ago

 pinctrl-mt8365.c |    1 -
 1 file changed, 1 deletion(-)

--- a/drivers/pinctrl/mediatek/pinctrl-mt8365.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mt8365.c
@@ -485,7 +485,6 @@ static struct platform_driver mtk_pinctr
 	.probe = mtk_pinctrl_probe,
 	.driver = {
 		.name = "mediatek-mt8365-pinctrl",
-		.owner = THIS_MODULE,
 		.of_match_table = mt8365_pctrl_match,
 		.pm = &mtk_eint_pm_ops,
 	},

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
