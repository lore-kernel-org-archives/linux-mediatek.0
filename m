Return-Path: <SRS0=cyKo=BC=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 488ABC433F4
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Jul 2020 07:41:25 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 147C22086A
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Jul 2020 07:41:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="iAyeYhny";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="kmEPwFNC"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 147C22086A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MgPr0WpijCVhYyAv440yX068GXW1qb+itdFg1UMQ8wA=; b=iAyeYhny3p+VKRzUJPEN5sFB+c
	1svRU5Ycu1Jd775uNpKoVo26qR+YpoqdDHjMi/d0S/LhvvV1C3A2CmU9mYm838tgmIb5josLZSoXo
	jKo5kqZD8ocXTFiFijv1P8MMmCNZa0IIZijcFBoR7zc+xP3G5nzRppqcjCUwNezqPIkeIEhJctzT2
	nYEmz7LF02OTF0+a7Yhx1FR/mjlEuyWKR5vjK2GnZY5U4aWmJiBI3bTi7gKdppZDO3vzXvjHiPmkM
	r4IjFJ9EVp3O0zfeuSM7YicKZstF5VuwtwgJZqeWewloMBYsqQN6l8/C964L9t3eUOGNTSbFNKRfF
	QHuLpZlA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jyVqp-00065v-Hg; Thu, 23 Jul 2020 07:41:11 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jyVoe-0004xK-3T; Thu, 23 Jul 2020 07:38:57 +0000
Received: from kozik-lap.mshome.net (unknown [194.230.155.213])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id A707820888;
 Thu, 23 Jul 2020 07:38:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1595489935;
 bh=kEeIY8BXwH4Tiy+sCCMu4cX9Ql2lsKEB0G7hN7yh/jc=;
 h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=kmEPwFNCb1Yfu9DJFECM5JICjVoHu4ZltjX+8aufxdF4Nkz3ZO/ck17GOsVsAYs5l
 cLDE/rYkhe+GYY+uF3xPJ2EXkmApuBpl+W/x5bMHStqwhSuqtJlu4ntlUQfHmoIG1B
 rxvrGJiiz9AlvAfCVx9Y9zQ6am83qIh9OaGZ1DO8=
From: Krzysztof Kozlowski <krzk@kernel.org>
List-Id: <soc.lore.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
 arm@kernel.org, soc@kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
 Markus Mayer <mmayer@broadcom.com>, bcm-kernel-feedback-list@broadcom.com,
 Florian Fainelli <f.fainelli@gmail.com>,
 Santosh Shilimkar <ssantosh@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Roger Quadros <rogerq@ti.com>,
 Tony Lindgren <tony@atomide.com>, Vladimir Zapolskiy <vz@mleia.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-omap@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: [PATCH 11/23] memory: emif: Put constant in comparison on the right
 side
Date: Thu, 23 Jul 2020 09:37:32 +0200
Message-Id: <20200723073744.13400-12-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200723073744.13400-1-krzk@kernel.org>
References: <20200723073744.13400-1-krzk@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200723_033856_569081_70127CB3 
X-CRM114-Status: GOOD (  15.05  )
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
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Linus Torvalds <torvalds@linux-foundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Fixes checkpatch warning:

    WARNING: Comparisons should place the constant on the right side of the test

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 drivers/memory/emif.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/memory/emif.c b/drivers/memory/emif.c
index 58a82eea5850..97bad1588bba 100644
--- a/drivers/memory/emif.c
+++ b/drivers/memory/emif.c
@@ -282,7 +282,7 @@ static void set_lpmode(struct emif_data *emif, u8 lpmode)
 	 * the EMIF_PWR_MGMT_CTRL[10:8] REG_LP_MODE bit field to 0x4.
 	 */
 	if ((emif->plat_data->ip_rev == EMIF_4D) &&
-	    (EMIF_LP_MODE_PWR_DN == lpmode)) {
+	    (lpmode == EMIF_LP_MODE_PWR_DN)) {
 		WARN_ONCE(1,
 			  "REG_LP_MODE = LP_MODE_PWR_DN(4) is prohibited by"
 			  "erratum i743 switch to LP_MODE_SELF_REFRESH(2)\n");
-- 
2.17.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
