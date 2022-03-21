Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE671C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Mar 2022 10:00:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=89MhvY6kGlMSg4AcKWgf8ge1pPCJ7XUMEyVA9YgJPl8=; b=dqG1s5qS82Enze
	0uC0lWmQYLa3HhftpNANOxWM6UUm9XaEDzkaoY/Sq5X0oNtVlfOdxbvQLpBVgtKMLSs23otV0l8/z
	uO+0SgpJVOqy4GAk9hMeST3Lu11taY4t9/LdPEDN8QIImM+pCsy9vxtlAQNuZiobYo/kGiEY+6vFb
	dFuk0o+0Hi7u004RZVCV64+XFU4yHKf5fPf1hThh9pxt+VjXnj6+tr/qYz7UDgBQ8LTKgzxHqiJEr
	CjxMEprS5euA4EKm2ZQVtRdlhaECzzOm3e/4049EIT7FV3HuqLrsNCZ5vX20RrYtNYJblmVCGhSmB
	IfyJ9EfUAtSg+bKIvfTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nWEpc-007Fym-DH; Mon, 21 Mar 2022 10:00:08 +0000
Received: from foss.arm.com ([217.140.110.172])
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nWEnl-007Eir-Dc; Mon, 21 Mar 2022 09:58:14 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 732E5106F;
 Mon, 21 Mar 2022 02:58:12 -0700 (PDT)
Received: from e123648.arm.com (unknown [10.57.22.222])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 8F8753F766;
 Mon, 21 Mar 2022 02:58:09 -0700 (PDT)
From: Lukasz Luba <lukasz.luba@arm.com>
To: linux-kernel@vger.kernel.org
Cc: lukasz.luba@arm.com, dietmar.eggemann@arm.com, Pierre.Gondois@arm.com,
 ionela.voinescu@arm.com, viresh.kumar@linaro.org, rafael@kernel.org,
 daniel.lezcano@linaro.org, linux-pm@vger.kernel.org, mka@chromium.org,
 nm@ti.com, sboyd@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, cristian.marussi@arm.com,
 sudeep.holla@arm.com, matthias.bgg@gmail.com
Subject: [RESEND][PATCH 8/8] powercap: DTPM: Check for Energy Model type
Date: Mon, 21 Mar 2022 09:57:29 +0000
Message-Id: <20220321095729.20655-9-lukasz.luba@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220321095729.20655-1-lukasz.luba@arm.com>
References: <20220321095729.20655-1-lukasz.luba@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220321_025813_536639_45FCE743 
X-CRM114-Status: UNSURE (   9.00  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

The Energy Model power values might be artificial. In such case
it's safe to bail out during the registration, since the PowerCap
framework supports only micro-Watts.

Signed-off-by: Lukasz Luba <lukasz.luba@arm.com>
---
 drivers/powercap/dtpm_cpu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/powercap/dtpm_cpu.c b/drivers/powercap/dtpm_cpu.c
index bca2f912d349..f5eced0842b3 100644
--- a/drivers/powercap/dtpm_cpu.c
+++ b/drivers/powercap/dtpm_cpu.c
@@ -211,7 +211,7 @@ static int __dtpm_cpu_setup(int cpu, struct dtpm *parent)
 		return 0;
 
 	pd = em_cpu_get(cpu);
-	if (!pd)
+	if (!pd || em_is_artificial(pd))
 		return -EINVAL;
 
 	dtpm_cpu = kzalloc(sizeof(*dtpm_cpu), GFP_KERNEL);
-- 
2.17.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
