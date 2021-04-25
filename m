Return-Path: <SRS0=cpQ6=JW=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ECCDDC433ED
	for <linux-mediatek@archiver.kernel.org>; Sun, 25 Apr 2021 01:52:58 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AD572613B0
	for <linux-mediatek@archiver.kernel.org>; Sun, 25 Apr 2021 01:52:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AD572613B0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=vivo.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:MIME-Version:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=SbfFICydXvEvmxbTUGCWA9HtCApA8fxlh06nDHlxsmQ=; b=iJWHl1qCA847c/WuyV3zadMQKa
	99Lcm44F2qze/XjtVGt7X64z+vClEMI4APFoVhC6iZK8E3FtD+mdN8hYsd/U5dpE9TvkduAi1qmvY
	/5eDYw3BfiHaCqvOd6V2E2k2ANNYOD162INA8B3+1w47F0n9XmchwJuXSKw53pQyEluupsFz9eVNv
	hiDEdaRJSvBS2IMEY6MQMtUJHWKxFL7CiQ2Ub/i7rtjDoXjJGi9hxhGYsPe5dhye+1BQGk0hs+k0w
	UGDFkyhw7auO3qf2DTIw2lz5WWf3L9nvJHqdELzthhgxMadHmxK9d/NAXkHfpN9IHB4u3lfp0d9T1
	BrfBPOVg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1laTwr-004ob1-FJ; Sun, 25 Apr 2021 01:52:43 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1laTwY-004oYj-Hq; Sun, 25 Apr 2021 01:52:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Message-Id:Date:Subject:Cc:To:From:
 Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=OfLyUr3ownE/QVZZYzpwqWf5SuAqdynNgc8ZyA7fq9A=; b=yn7UyURl59CBQey1Zuy8i8RQzI
 WlU1oiemVZfeK3wntSZBZGKQ/GdGSo6v/PehB4q0k56PRY8Q6K2yq4j9HsChwEQZyl/8ijMhaMJce
 ZzM06ZIyf+Qr8EYufoaaDAHpCgmxvZNEUTLCURJIialZ67j9e/aWFmWWijEwXn+nM5+Cdh9r63Q6+
 o+MJ8zVggrJf+1a/nqVxQcYyJBDra/kGo+oHaLkzmZdHhKkM1rzhIei6L/JyLuYuex1DA9o62Mj0E
 eVSsHedpC78j9GoGqS1PB8DT8Dvj3SdBoHWS61ZASYQTvidBEv9+Fs7KIO/q8IoPXI5mfEWQz6sB0
 z8xa72MQ==;
Received: from mail-m17640.qiye.163.com ([59.111.176.40])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1laTwV-00FECC-45; Sun, 25 Apr 2021 01:52:16 +0000
Received: from vivo-HP-ProDesk-680-G4-PCI-MT.vivo.xyz (unknown [58.251.74.232])
 by mail-m17640.qiye.163.com (Hmail) with ESMTPA id 9AD30540143;
 Sun, 25 Apr 2021 09:52:12 +0800 (CST)
From: Wang Qing <wangqing@vivo.com>
To: Wim Van Sebroeck <wim@linux-watchdog.org>,
 Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-watchdog@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Wang Qing <wangqing@vivo.com>
Subject: [PATCH V9 0/2] watchdog: mtk: support pre-timeout when the bark irq
 is available
Date: Sun, 25 Apr 2021 09:52:05 +0800
Message-Id: <1619315527-8171-1-git-send-email-wangqing@vivo.com>
X-Mailer: git-send-email 2.7.4
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgYFAkeWUFZS1VLWVdZKFlBSE83V1ktWUFJV1kPCR
 oVCBIfWUFZGUkYSFZCHktKTk1LQhpDHU9VEwETFhoSFyQUDg9ZV1kWGg8SFR0UWUFZT0tIVUpKS0
 hKTFVLWQY+
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6NhA6MBw5Qz8SGgM8Ih0eVg0I
 AzVPCQ9VSlVKTUpCSEpOTkhISE9JVTMWGhIXVQwaFRwKEhUcOw0SDRRVGBQWRVlXWRILWUFZTkNV
 SU5KVUxPVUlISVlXWQgBWUFKTUJJNwY+
X-HM-Tid: 0a7906ba24cdd995kuws9ad30540143
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210424_185215_344481_E2D5626B 
X-CRM114-Status: UNSURE (   5.65  )
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
