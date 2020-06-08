Return-Path: <SRS0=8MsW=7V=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2EDB8C433E0
	for <linux-mediatek@archiver.kernel.org>; Mon,  8 Jun 2020 09:59:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0048D206A4
	for <linux-mediatek@archiver.kernel.org>; Mon,  8 Jun 2020 09:59:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="IcGn59zF";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="rZi/A6jC"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0048D206A4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Iij8oEPEKkVsiET2Z8PkQQLm025yfclBhMYdloXCUp0=; b=IcGn59zF44PjBn
	1jyFkuTJG6hTQre63J1YBrAsh4c0QupqxzD+rQnOxERbdgtjVrS9spffHmAsERLsEpH7fiy2QBNXl
	cQR4efVxpH7oCKzsW6IuhSllAaFaXpNB3CbMs39b9s/9TMGMLy3Hug9GMCZP5Nt0vO1QO4S3vFIs6
	s+8XG9u8oSnXDj9i+y/vTG33d4tbrN9U09AcO0Ta+X7pTrXcyvB2MoLplRskvIeIlCkJFUwe74F2q
	IuAOwTHzQcLlCGjWCyDCHnLgAQHsdc9iXu6xzkuhJANJrapXKY1mrQgt/IKa4Jt2AMyDAUaSk20uY
	g9WDE0mrU2Ze6JndPftA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jiEYq-0004Fl-Dm; Mon, 08 Jun 2020 09:59:20 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jiEYj-00049l-Em; Mon, 08 Jun 2020 09:59:14 +0000
Received: from ziggy.de (unknown [213.195.114.138])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9BC73206A4;
 Mon,  8 Jun 2020 09:59:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1591610352;
 bh=mpib/uOnrT5XNPMRVyQcZfC0SPaq1PdztMejF8onGS8=;
 h=From:To:Cc:Subject:Date:From;
 b=rZi/A6jCZMIjJfYqktvREvy0XGdUuO1WvzOfmb49shmRBv0ZTWhwxh6rkPHaTcrjJ
 UFQXK3GIpEI1IjsOyW0iFj38TzA4NhA6PlMdKUpFPcDNtv5+AM/VmsGdfUwY+Rp28s
 62Az6rBqrd2VhE+JjiBl3HoYUxvob58ENUjJoHs4=
From: matthias.bgg@kernel.org
To: lee.jones@linaro.org,
	gene.chen.richtek@gmail.com
Subject: [PATCH] mfd: mt6360: Add name field to the driver
Date: Mon,  8 Jun 2020 11:58:58 +0200
Message-Id: <20200608095859.24393-1-matthias.bgg@kernel.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200608_025913_514522_22B49F13 
X-CRM114-Status: GOOD (  11.22  )
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
Cc: Matthias Brugger <mbrugger@suse.com>, kernel test robot <lkp@intel.com>,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 matthias.bgg@kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Matthias Brugger <mbrugger@suse.com>

The driver does not have a name, this will lead to a NULL pointer
deref when we try to register the driver to a bus.

Fixes: 7edd363421da ("mfd: Add support for PMIC MT6360")
Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Matthias Brugger <mbrugger@suse.com>
---
 drivers/mfd/mt6360-core.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mfd/mt6360-core.c b/drivers/mfd/mt6360-core.c
index db8cdf5272c1..dc2987dab649 100644
--- a/drivers/mfd/mt6360-core.c
+++ b/drivers/mfd/mt6360-core.c
@@ -412,6 +412,7 @@ MODULE_DEVICE_TABLE(of, mt6360_pmu_of_id);
 
 static struct i2c_driver mt6360_pmu_driver = {
 	.driver = {
+		.name = "MT6360",
 		.pm = &mt6360_pmu_pm_ops,
 		.of_match_table = of_match_ptr(mt6360_pmu_of_id),
 	},
-- 
2.26.2


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
