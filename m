Return-Path: <SRS0=FJ4T=K2=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B90A9C47093
	for <linux-mediatek@archiver.kernel.org>; Mon, 31 May 2021 01:52:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4519E61019
	for <linux-mediatek@archiver.kernel.org>; Mon, 31 May 2021 01:52:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4519E61019
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=vivo.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=SbfFICydXvEvmxbTUGCWA9HtCApA8fxlh06nDHlxsmQ=; b=rNke2pFDLs5Fio
	GXg9+r+s7B5SbWME0BnN8Y/UJf89fWzeasRwscjFzi6s0J9vBN7qndP/kHTI32xEzWaxjWN+WCJUm
	EJdxFNH64TstesaH2Ix0GhLqQ44ns9PP3SkDtdvU3gFES1Cye4Ki+gx5LNzsclItMrT4+dkAqzkJx
	eSA0DNsZhNdgE1Yq2jEHZMYzajiYptGrPmWEXK1rIVVesK4cjQl+HvH+jA2rs+FX039DV7bvmvnsz
	rcXpgWbhnmAw8dXJdK3d899rRO/TuYfoTdWrExvpup7A02vX3AouO3rz8Wc1sxqIEWvg+PE/F8Hy1
	sSPUBw8zP8FpWANwuAyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lnX6G-00ARP1-87; Mon, 31 May 2021 01:52:16 +0000
Received: from mail-m17639.qiye.163.com ([59.111.176.39])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lnX5r-00ARNE-47; Mon, 31 May 2021 01:51:53 +0000
Received: from vivo-HP-ProDesk-680-G4-PCI-MT.vivo.xyz (unknown [58.251.74.232])
 by mail-m17639.qiye.163.com (Hmail) with ESMTPA id 825FF380176;
 Mon, 31 May 2021 09:51:38 +0800 (CST)
From: Wang Qing <wangqing@vivo.com>
To: Wim Van Sebroeck <wim@linux-watchdog.org>,
 Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-watchdog@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Wang Qing <wangqing@vivo.com>
Subject: [PATCH V9, RESEND,
 0/2] watchdog: mtk: support pre-timeout when the bark irq is available
Date: Mon, 31 May 2021 09:51:33 +0800
Message-Id: <1622425895-32111-1-git-send-email-wangqing@vivo.com>
X-Mailer: git-send-email 2.7.4
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgYFAkeWUFZS1VLWVdZKFlBSE83V1ktWUFJV1kPCR
 oVCBIfWUFZGU0YQ1ZMSR1JTR1CTUtMSU9VEwETFhoSFyQUDg9ZV1kWGg8SFR0UWUFZT0tIVUpKS0
 hKTFVLWQY+
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6NiI6ARw5LD8PLxMfFg4RPz5L
 TUswC09VSlVKTUlJT0lOQ0JCSUtKVTMWGhIXVQwaFRwKEhUcOw0SDRRVGBQWRVlXWRILWUFZTkNV
 SU5KVUxPVUlISVlXWQgBWUFKTEtDNwY+
X-HM-Tid: 0a79c01e8f7ed994kuws825ff380176
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210530_185151_370121_03B9620E 
X-CRM114-Status: UNSURE (   6.48  )
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

Use the bark interrupt as the pretimeout notifier if available.
The pretimeout notification shall occur at timeout-sec/2.

Wang Qing (2):
  watchdog: mtk: support pre-timeout when the bark irq is available
  doc: mtk-wdt: support pre-timeout when the bark irq is available

 .../devicetree/bindings/watchdog/mtk-wdt.txt       |  5 ++
 drivers/watchdog/mtk_wdt.c                         | 77 ++++++++++++++++++++--
 2 files changed, 77 insertions(+), 5 deletions(-)

-- 
2.7.4


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
