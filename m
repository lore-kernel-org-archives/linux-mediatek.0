Return-Path: <SRS0=s7tg=JT=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11072C433ED
	for <linux-mediatek@archiver.kernel.org>; Thu, 22 Apr 2021 02:53:20 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C7D3861354
	for <linux-mediatek@archiver.kernel.org>; Thu, 22 Apr 2021 02:53:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C7D3861354
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=vivo.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:MIME-Version:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=T+4QJZtQvg3n/5kxLUpvJF1WgHETqaSsW3tqdoKEDbA=; b=BaTs7c/2E/OoyKo0Qzxq/JI5m/
	f/Ihz31cPApJaURmOjjP6q8vttc9xGB2I/zKIWZLl30tid+PlmwNxj775MNATYhpmgKcQ6iGbFk1C
	flTsvGx7Rvh+zhK71N2MuRNYBcBm6JEWG3FduCRbx9ILk+CanDnlesXWl/o2+lMAUoPn5S1SWroFk
	v7B2lGTJcvqj6jiPguPZUj/anvvxblJCtIjiLZdzah1H+2iH3mkjpBVLeXAuhphlN58CJyU+6Cojs
	F7BfhsToXit8vtmAAGYF3k3C4E1astSD67Mif5wdDRUQiYCnQWwKWYHwhqSgP79azB/iZ/56O5+vG
	EWXJ/sMQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lZPSl-00FeJz-A7; Thu, 22 Apr 2021 02:53:07 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZPLi-00Fdu1-ID; Thu, 22 Apr 2021 02:46:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Message-Id:Date:Subject:Cc:To:From:
 Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=PBtX3pS4G4AbCwpX3yCTHhu6aNlP3VdA2eFV7LinuHY=; b=2BjD/XM8ie9z961+COjbWkSMBS
 UpH8Hjv4AppeIj2wq9SjFEAqJxu3xMjUTNFrikYtzriFRoapwbxIsV/qrnJjpGsPcGJiuL4A8iGbg
 n2EKXS1X1yFP5oicEETKyoVm1e54u2MS31hr4K/7DqvS0ukBZsmQXKiNB1bmh58h9qYCPzkKJLhJD
 bNp1HSkR6mP4IvxMuIxpNcZz3GO76JWU1DGKJal+4wgfQaylA1UdoZ4oZ0mUmsvKSHY7xEyJaPug9
 wGi+p5gUcOHUBqdPLh21pkpYRc8kbTSsNCgxGsbp5VY0IVTlwmIcQSYJhRp/2j5ZS4SNupUznI/kB
 Rb0OZMZQ==;
Received: from mail-m121145.qiye.163.com ([115.236.121.145])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZPLd-00DKUv-Oh; Thu, 22 Apr 2021 02:45:47 +0000
Received: from vivo-HP-ProDesk-680-G4-PCI-MT.vivo.xyz (unknown [58.251.74.232])
 by mail-m121145.qiye.163.com (Hmail) with ESMTPA id 431F68000E6;
 Thu, 22 Apr 2021 10:45:39 +0800 (CST)
From: Wang Qing <wangqing@vivo.com>
To: Wim Van Sebroeck <wim@linux-watchdog.org>,
 Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-watchdog@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Wang Qing <wangqing@vivo.com>
Subject: [PATCH V6 0/2] watchdog: mtk: support pre-timeout when the bark irq
 is available
Date: Thu, 22 Apr 2021 10:45:30 +0800
Message-Id: <1619059532-17805-1-git-send-email-wangqing@vivo.com>
X-Mailer: git-send-email 2.7.4
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgYFAkeWUFZS1VLWVdZKFlBSE83V1ktWUFJV1kPCR
 oVCBIfWUFZGktJTlZNHktKTxhKTk4YT0hVEwETFhoSFyQUDg9ZV1kWGg8SFR0UWUFZT0tIVUpKS0
 hKTFVLWQY+
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6Mz46Qjo5LD8XEg83GkoMFTcw
 AQgwCRZVSlVKTUpCS05CTk9LS05IVTMWGhIXVQwaFRwKEhUcOw0SDRRVGBQWRVlXWRILWUFZTkNV
 SU5KVUxPVUlISVlXWQgBWUFKTUJPNwY+
X-HM-Tid: 0a78f777fea7b03akuuu431f68000e6
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210421_194545_978226_1E3DA664 
X-CRM114-Status: UNSURE (   5.35  )
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

 .../devicetree/bindings/watchdog/mtk-wdt.txt       |  3 ++
 drivers/watchdog/mtk_wdt.c                         | 53 ++++++++++++++++++++--
 2 files changed, 51 insertions(+), 5 deletions(-)

-- 
2.7.4


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
