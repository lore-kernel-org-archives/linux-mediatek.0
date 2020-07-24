Return-Path: <SRS0=BOys=BD=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A4B2C433E0
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Jul 2020 07:50:05 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0FF47206F0
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Jul 2020 07:50:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="1nrTQfF6";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="eq5SIgQy"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0FF47206F0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5Oadzq+HXMMDIx/SmdhiCM0kAttMWW2OrgqOWkby018=; b=1nrTQfF6SPhJ/RvXAW3Uztgly1
	OvIru81gAKAd7a9TtAY4jc7i4MYZ7d+cOhFbEXOuqdpnwUJNBmSyaCKBWv6N6inbPizIyJTXptzJh
	FX4hDm8eiMdO9cDGqELmQEOIb7wVbfyC1TEh5FcUnQzO+uxEUX6JPNOnvqUI6pRcg2fJ6QUgPxxX0
	lPSyw/jcdup8AzlW5t658HyQ0Lwm9pimJdsveYgxDvKTghYCxoX9U9hE/OgvpSsVmEN1YQ7L979DJ
	D2XXv7pb62aNvJbf4bi7/8c+J6YjaA7zgPEvEYIO2nos9dDcPTpuI8nDASfeetiwTX+jeE6C9OICx
	tRoS2akg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jysSa-0006Oc-78; Fri, 24 Jul 2020 07:49:40 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jysMK-0002oM-Tv; Fri, 24 Jul 2020 07:43:13 +0000
Received: from kozik-lap.mshome.net (unknown [194.230.155.213])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0120A20771;
 Fri, 24 Jul 2020 07:43:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1595576592;
 bh=7O0bm2CLZ3Q5OFx8KqB2VK0KoKe3zQms78gh6gShMCc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=eq5SIgQy1QpEy6J7NJ8OQP7Oe76XZjRwGoMXnCBZa+SzQzLVWCEQKqhi/DARA16rd
 b9fJxjbOMZxQtZJ0tgD4kFgWVH5zBFd/LYE3Y+JK9MpC1BXF1gvi3Apzvkm7I/gdfE
 JD7lLQRMFB4B55KQLldXAv/CQgh+pjPMjOvf6aIA=
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
 Markus Mayer <mmayer@broadcom.com>, bcm-kernel-feedback-list@broadcom.com,
 Florian Fainelli <f.fainelli@gmail.com>,
 Santosh Shilimkar <ssantosh@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Roger Quadros <rogerq@ti.com>,
 Tony Lindgren <tony@atomide.com>, Vladimir Zapolskiy <vz@mleia.com>,
 Kukjin Kim <kgene@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-omap@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 linux-tegra@vger.kernel.org
Subject: [PATCH v2 25/29] MAINTAINERS: Add Krzysztof Kozlowski as maintainer
 of memory controllers
Date: Fri, 24 Jul 2020 09:40:34 +0200
Message-Id: <20200724074038.5597-26-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200724074038.5597-1-krzk@kernel.org>
References: <20200724074038.5597-1-krzk@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200724_034313_143161_22D5C5B2 
X-CRM114-Status: GOOD (  11.92  )
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
Cc: Andrew Morton <akpm@linux-foundation.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Krzysztof Kozlowski <krzk@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

The generic parts of memory controllers (of_memory.[ch]) lacked any
care.  The memory controller drivers were not abandoned (usually
picked up by architecture maintainers) but in such case I can take care
about them as well.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
Acked-by: Florian Fainelli <f.fainelli@gmail.com>
---
 MAINTAINERS | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index f4557bc43bd5..cba0ed77775b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -11158,6 +11158,13 @@ F:	Documentation/core-api/boot-time-mm.rst
 F:	include/linux/memblock.h
 F:	mm/memblock.c
 
+MEMORY CONTROLLER DRIVERS
+M:	Krzysztof Kozlowski <krzk@kernel.org>
+L:	linux-kernel@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/memory-controllers/
+F:	drivers/memory/
+
 MEMORY FREQUENCY SCALING DRIVERS FOR NVIDIA TEGRA
 M:	Dmitry Osipenko <digetx@gmail.com>
 L:	linux-pm@vger.kernel.org
-- 
2.17.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
