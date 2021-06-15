Return-Path: <SRS0=q7ss=LJ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37C93C48BDF
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Jun 2021 20:13:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EFBD2613B1
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Jun 2021 20:13:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EFBD2613B1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6eZMJh0t5GKeD5P9PzOeZI6Y04+sFQbKOzrir6+c00U=; b=dd8V++bx2zM8zn
	3qfd1mWHBleCdil3xnNd2dZ97wX5TusawJCOpuadtx1D7KA3/+auGrSN+iFTpym13xJBpirXVJsFg
	fj8Qcbx61ntLulpfuwGEOjtbZXDFK/pkWiRUOFgR52d9CdWH/o9L745JEMXLXamMmSr8RuxwZ/QBX
	XDsCMNqSsHNvZ7P+7t3HCOi6UPsigxAW1mZbNu8zTkGQdYI23z5G8HqgPY12pI8KWUSU7O5HpaKEl
	qsdWeyf9jlII5kbBwUAgq+PLFCGMjsnHIOJOLLH/W+IbQmxx03SYBM9nRVAnzbfvba9kDipy5+Dun
	cz3N7u3Fkgk4zqVdjzLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ltFQx-002i5h-V6; Tue, 15 Jun 2021 20:13:16 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ltBKT-0016d1-0F; Tue, 15 Jun 2021 15:50:18 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9C51261921;
 Tue, 15 Jun 2021 15:50:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1623772215;
 bh=l1dslkYCdSUrfbKPHqQMHK4DisTF696U3LOjPeX2WJI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=buf3xY6ITRh8BV+M1T1/OAzMFooBzaTO5l/g5Z85kBJ/GaC7hnWzoYiqFpQXtSHff
 LcvgWqcX0mG0DV5F8OB7M0AHz//CXZf2I87Of9hsBhfkplLxUeev6Y8oVazuImpSli
 Co3C4eMqe518fH63HpAzBlpupYgtTsbkulvEnCkwDpOfdgNyWYMUMkxgvWRYUg+lcN
 ZguSssikcs77l8XCAmpScuvUIVtYTPPF0hT+LxmV8u6WvR7bG/GTdpZgrQV19O8ZLL
 vFGwKz2burqM7zqjqYLBbSL6PGNOwreeKnIvNznoBQolZIvuY4xjmlb/WTE8DzyUnl
 FinzQKgEsIxpA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Sergio Paracuellos <sergio.paracuellos@gmail.com>,
 Linus Walleij <linus.walleij@linaro.org>, Sasha Levin <sashal@kernel.org>,
 linux-staging@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Subject: [PATCH AUTOSEL 4.19 04/12] pinctrl: ralink: rt2880: avoid to error in
 calls is pin is already enabled
Date: Tue, 15 Jun 2021 11:50:01 -0400
Message-Id: <20210615155009.62894-4-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210615155009.62894-1-sashal@kernel.org>
References: <20210615155009.62894-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210615_085017_127062_588C4A7A 
X-CRM114-Status: GOOD (  13.63  )
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

From: Sergio Paracuellos <sergio.paracuellos@gmail.com>

[ Upstream commit eb367d875f94a228c17c8538e3f2efcf2eb07ead ]

In 'rt2880_pmx_group_enable' driver is printing an error and returning
-EBUSY if a pin has been already enabled. This begets anoying messages
in the caller when this happens like the following:

rt2880-pinmux pinctrl: pcie is already enabled
mt7621-pci 1e140000.pcie: Error applying setting, reverse things back

To avoid this just print the already enabled message in the pinctrl
driver and return 0 instead to not confuse the user with a real
bad problem.

Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Link: https://lore.kernel.org/r/20210604055337.20407-1-sergio.paracuellos@gmail.com
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/staging/mt7621-pinctrl/pinctrl-rt2880.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/mt7621-pinctrl/pinctrl-rt2880.c b/drivers/staging/mt7621-pinctrl/pinctrl-rt2880.c
index 80e7067cfb79..ad811c0438cc 100644
--- a/drivers/staging/mt7621-pinctrl/pinctrl-rt2880.c
+++ b/drivers/staging/mt7621-pinctrl/pinctrl-rt2880.c
@@ -127,7 +127,7 @@ static int rt2880_pmx_group_enable(struct pinctrl_dev *pctrldev,
 	if (p->groups[group].enabled) {
 		dev_err(p->dev, "%s is already enabled\n",
 			p->groups[group].name);
-		return -EBUSY;
+		return 0;
 	}
 
 	p->groups[group].enabled = 1;
-- 
2.30.2


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
