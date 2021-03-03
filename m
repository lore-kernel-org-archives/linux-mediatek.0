Return-Path: <SRS0=dK9R=IB=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2BF36C433DB
	for <linux-mediatek@archiver.kernel.org>; Wed,  3 Mar 2021 17:14:32 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 55C8564EE6
	for <linux-mediatek@archiver.kernel.org>; Wed,  3 Mar 2021 17:14:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 55C8564EE6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=wvOAfaXyDUucdqJlihy6qNpJwbs6VRND4Y1iHQ+pcsY=; b=j8+QZH3kWmYo5iwNgkkaNQ0/11
	BEhRIM/YXKUEQFgmuI70HuULz5QkqZqQNCNLxlpDX6wjRj5K9pqG0uXnJqexWaTx78xjR0Bzt44tZ
	NN/mPJbot3gB5nugLL5mBAl/9EmAV4GxlRy2ZHGIyuWca3/49q2VC9f8QSXwNXAsi3Q5H47adGK8d
	BPK0uDGygIpfTegWVnkvXPd6z5o5Ck7gTbBKqajfNJ4NXLohkfPn9mOx5wVr8Q3j6csHEx9SJ6IR/
	vWYkPsNT1QD3/Z9gtk9EneFaI77ocd9WOIiJ+JrnO8obbN4Puuc47836J3F77xgYy7kz3vG56sv5p
	rckxqe2g==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lHV4g-005kcq-IN; Wed, 03 Mar 2021 17:14:14 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lHStP-005Ezf-As; Wed, 03 Mar 2021 14:54:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:In-Reply-To:References;
 bh=E/VBV9B29/nC2d2O1RAQAC3lst7yYbwsDT3vsorERWE=; b=TG5K4eKuQjW0e/MaT1QxojC9Qs
 AoMNtqeRyh/fFt6SO0LCEBVl7fsMmq0r/M7xpsBYHSmtVEvW65+COECAjVZkb/QAb/rAv08UVrJ4y
 IUpQEAj+0sCFaC6WkB1BUjhK3wdG7AJlwHF0LAbezeOGmDVicPhhKn+p2UAVtDbWy/zdwhctBR0kx
 IG/P58Vj9JAPWML6vtpv8sZ21UPon/rSzATP7NyWxRcB5xFkxihYeIQdUtx+7BKM0xiEcgYJdsCYA
 vPf81P8ILruwpR1H5ZOK3tUW+wtbkK7MIchdqyl/pkle45Smo4hzZmpRosXm5UibE/cmCvRQ9oOJy
 totscaCA==;
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by casper.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lHNXA-001wxB-I8; Wed, 03 Mar 2021 09:11:09 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: eballetbo) with ESMTPSA id 9DD621F45983
From: Enric Balletbo i Serra <enric.balletbo@collabora.com>
To: linux-kernel@vger.kernel.org
Cc: matthias.bgg@gmail.com, drinkcat@chromium.org, hsinyi@chromium.org,
 weiyi.lu@mediatek.com, Collabora Kernel ML <kernel@collabora.com>,
 kernel test robot <lkp@intel.com>,
 Dan Carpenter <dan.carpenter@oracle.com>,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: [PATCH] soc: mediatek: pm-domains: Fix missing error code in
 scpsys_add_subdomain()
Date: Wed,  3 Mar 2021 10:10:54 +0100
Message-Id: <20210303091054.796975-1-enric.balletbo@collabora.com>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210303_091109_060734_786CEA7D 
X-CRM114-Status: UNSURE (   9.65  )
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

Adding one power domain in scpsys_add_subdomain is missing to assign an
error code when it fails. Fix that assigning an error code to 'ret',
this also fixes the follwowing smatch warning.

  drivers/soc/mediatek/mtk-pm-domains.c:492 scpsys_add_subdomain() warn: missing error code 'ret'

Fixes: dd65030295e2 ("soc: mediatek: pm-domains: Don't print an error if child domain is deferred")
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
Signed-off-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
---

 drivers/soc/mediatek/mtk-pm-domains.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/soc/mediatek/mtk-pm-domains.c b/drivers/soc/mediatek/mtk-pm-domains.c
index 694d6ea6de1d..0af00efa0ef8 100644
--- a/drivers/soc/mediatek/mtk-pm-domains.c
+++ b/drivers/soc/mediatek/mtk-pm-domains.c
@@ -491,8 +491,9 @@ static int scpsys_add_subdomain(struct scpsys *scpsys, struct device_node *paren
 
 		child_pd = scpsys_add_one_domain(scpsys, child);
 		if (IS_ERR(child_pd)) {
-			dev_err_probe(scpsys->dev, PTR_ERR(child_pd),
-				      "%pOF: failed to get child domain id\n", child);
+			ret = PTR_ERR(child_pd);
+			dev_err_probe(scpsys->dev, ret, "%pOF: failed to get child domain id\n",
+				      child);
 			goto err_put_node;
 		}
 
-- 
2.30.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
