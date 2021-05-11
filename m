Return-Path: <SRS0=qC7P=KG=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65A7FC433B4
	for <linux-mediatek@archiver.kernel.org>; Tue, 11 May 2021 13:17:22 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F26A0613CD
	for <linux-mediatek@archiver.kernel.org>; Tue, 11 May 2021 13:17:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F26A0613CD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=bPC1itq87puO8l0KCn1YuMD3bSOH2XNmGtX3E8pdA2I=; b=L0LbsZ1oklOwqSnHDWdR7De9uJ
	lCxBmWGB7+1wDke2vmlA7NaLkh9u7FNO0y0HqLKev1qqi4t9aIujW1Lgy0rV9pxNm5JvroKv91zTh
	D1XV07NzQ/qHwSJS+T78ubX7fTGvvb2f3C7mOC71sgk8c6QBZHn+qSS0wZmIMWp/7yGvEtKx4rDvK
	LDnt4oGFPSRjKsQ7KthvTVxYzsiUKNhlCeV3JMlwZSJO4L5oY0K4OKhltSW97MhBjQvuPeQ38sZ9j
	0XM01Yyvnk4esgN8jK6JqXC5B5hMbkQnBMt+1g31xQ33CxkjkR9e6lAVRIpd8Mi0Xs7GKILKD9T7W
	fitB5JeA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lgSG2-0002NP-VM; Tue, 11 May 2021 13:17:07 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lgR80-00HHXh-BM; Tue, 11 May 2021 12:04:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:
 Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
 Sender:Reply-To:Content-ID:Content-Description:In-Reply-To:References;
 bh=qULWp7C7KXtuyiMkk8+0vKQUWOBYQUUsCMLSjR5H5tA=; b=1IgiW/YNlv1XD8hyWzXh7HDz3k
 xXxoH8fTqaJvIIKpYnDFI7GeOslwrPNstF+OmZh7FYlALLnwdFCsQf9uLN2/o0sF6WSS3SocWnAWi
 bsTmRHV9voprMbFpsg3UovxOqXpfWheB5ch3ulv2/oDdmmWmisIgzxZAPT/oJxTPPqC5ws+jH1p0G
 rzz+fS6yqqZCFKQyCmhb28k0d5Lj1Qj42G6V29drNQvcth5or7Pj79KE7iWDo8LLzzMCdCJJARrZK
 J9z4KeCAuEkonuDxFpGRaTTpP+lRPjbOBo2smCAKyzb/0Idrcsrd55baHuJ402s5twen5puauYjCs
 +aZgVNuw==;
Received: from szxga08-in.huawei.com ([45.249.212.255])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lgR7w-009Y3U-DI; Tue, 11 May 2021 12:04:42 +0000
Received: from dggeml753-chm.china.huawei.com (unknown [172.30.72.57])
 by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4Ffc1c6Msjz14Jp4;
 Tue, 11 May 2021 20:00:20 +0800 (CST)
Received: from dggpemm500006.china.huawei.com (7.185.36.236) by
 dggeml753-chm.china.huawei.com (10.1.199.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2176.2; Tue, 11 May 2021 20:04:34 +0800
Received: from thunder-town.china.huawei.com (10.174.177.72) by
 dggpemm500006.china.huawei.com (7.185.36.236) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Tue, 11 May 2021 20:04:34 +0800
From: Zhen Lei <thunder.leizhen@huawei.com>
To: Ohad Ben-Cohen <ohad@wizery.com>, Bjorn Andersson
 <bjorn.andersson@linaro.org>, Mathieu Poirier <mathieu.poirier@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-remoteproc
 <linux-remoteproc@vger.kernel.org>, linux-mediatek
 <linux-mediatek@lists.infradead.org>, linux-arm-kernel
 <linux-arm-kernel@lists.infradead.org>
CC: Zhen Lei <thunder.leizhen@huawei.com>
Subject: [PATCH 1/1] remoteproc/mediatek: Remove redundant error printing in
 scp_probe()
Date: Tue, 11 May 2021 20:04:26 +0800
Message-ID: <20210511120426.5834-1-thunder.leizhen@huawei.com>
X-Mailer: git-send-email 2.26.0.windows.1
MIME-Version: 1.0
X-Originating-IP: [10.174.177.72]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 dggpemm500006.china.huawei.com (7.185.36.236)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210511_050440_637807_A5B23EA5 
X-CRM114-Status: UNSURE (   9.74  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

When devm_ioremap_resource() fails, a clear enough error message will be
printed by its subfunction __devm_ioremap_resource(). The error
information contains the device name, failure cause, and possibly resource
information.

Therefore, remove the error printing here to simplify code and reduce the
binary size.

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Zhen Lei <thunder.leizhen@huawei.com>
---
 drivers/remoteproc/mtk_scp.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/remoteproc/mtk_scp.c b/drivers/remoteproc/mtk_scp.c
index 9679cc26895e578..edb7f7842cb12ad 100644
--- a/drivers/remoteproc/mtk_scp.c
+++ b/drivers/remoteproc/mtk_scp.c
@@ -749,7 +749,6 @@ static int scp_probe(struct platform_device *pdev)
 	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "sram");
 	scp->sram_base = devm_ioremap_resource(dev, res);
 	if (IS_ERR((__force void *)scp->sram_base)) {
-		dev_err(dev, "Failed to parse and map sram memory\n");
 		ret = PTR_ERR((__force void *)scp->sram_base);
 		goto free_rproc;
 	}
-- 
2.26.0.106.g9fadedd



_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
