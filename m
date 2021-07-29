Return-Path: <SRS0=Fikf=MV=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46E8EC4338F
	for <linux-mediatek@archiver.kernel.org>; Thu, 29 Jul 2021 02:07:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 068916056C
	for <linux-mediatek@archiver.kernel.org>; Thu, 29 Jul 2021 02:07:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 068916056C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Q2IWzovjJE5cFCRLTpOieQLdqcabSwH3lUF/JZQNHkM=; b=rKRw8lDukzKhyp
	JxO6jWvwNSWdo6VAN2e4SRoT8GP2QcTGB4QxO0tjFvGnR0F4bW+/5NS/xVq5Piwt7aldt3I3SSSEj
	1P1jEKVQF9bqvw2hUoQcHfbo3cdHNQH7uFtHTTCtmFKe2Eq4H9XwN1XBcishC1QC4F0UHwIY+dzLt
	AUAMzoe3m1ZEjmAuViH57Yl7FjA2JdtCJScj3YqiTnGRwfsmpQDuxD9IGll9RzSZznUIjl4XQWHoR
	Osbuvl9W0Ophyf7A7VWOMyEtbxOeOD6V1WCj2Nj+Rkk2J5CgNUPHCjDC7WS2wg8btY7cv0OSPz25X
	WlYyIb84alambHyfe2AQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m8vSL-002rtN-6p; Thu, 29 Jul 2021 02:07:29 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m8vSI-002rsR-Go; Thu, 29 Jul 2021 02:07:27 +0000
X-UUID: ab0de2af089e4fe1aceb7d2d90931f81-20210728
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=O2EjKkOYxegpgkqJQBqTMV/YqSo85X66b0oi8ayuUkE=; 
 b=kVlqrVbPizmQxNzNTd3zcZBnSlB9CtyZnR8+/wDcIm0Sy1hF9GWnARKEv96Dc2SBa6oe2mGWZMCt9Hebgwb6Z9B3fuC1cYolHVXgsNJpKzzUE+kM9jF54D2ASH6UF1dXffUwiDoFcH5wSCDw1/gOTLXtOX48C5pL8W64wKgu5DU=;
X-UUID: ab0de2af089e4fe1aceb7d2d90931f81-20210728
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <yee.lee@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 2138620765; Wed, 28 Jul 2021 19:07:24 -0700
Received: from MTKMBS01N2.mediatek.inc (172.21.101.79) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 28 Jul 2021 19:07:22 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs01n2.mediatek.inc (172.21.101.79) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 29 Jul 2021 10:07:20 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 29 Jul 2021 10:07:20 +0800
From: <yee.lee@mediatek.com>
To: <linux-kernel@vger.kernel.org>
CC: <nicholas.Tang@mediatek.com>, <Kuan-Ying.lee@mediatek.com>,
 <chinwen.chang@mediatek.com>, Yee Lee <yee.lee@mediatek.com>, "Matthias
 Brugger" <matthias.bgg@gmail.com>, "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>, "moderated list:ARM/Mediatek SoC
 support" <linux-mediatek@lists.infradead.org>
Subject: [PATCH v2 0/1] Add option to disable mte support
Date: Thu, 29 Jul 2021 10:07:11 +0800
Message-ID: <20210729020717.15142-1-yee.lee@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210728_190726_621887_EE25B462 
X-CRM114-Status: UNSURE (   7.96  )
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

From: Yee Lee <yee.lee@mediatek.com>

For some case of low-end devices with limited resources,
an option to disable mte support is necessary.

This patch Adds an alias in id-reg override mechanism
to suppress the mte feature via passing a param.

=== Test ===
QEMU5.2 + mte
passed "arm64.nomte" in cmdline
boot log:
..(skip)
[    0.000000] CPU features: SYS_ID_AA64PFR1_EL1[11:8]: forced to 0

Changed since v2:
 - Use id-reg override machanism to suppress feature. 

Yee Lee (1):
  arm64/cpufeature: Add arm64.nomte to override id-reg

 arch/arm64/kernel/idreg-override.c | 2 ++
 1 file changed, 2 insertions(+)

-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
