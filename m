Return-Path: <SRS0=ZZ2m=JU=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B03FC433B4
	for <linux-mediatek@archiver.kernel.org>; Fri, 23 Apr 2021 03:21:09 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 32E7F611ED
	for <linux-mediatek@archiver.kernel.org>; Fri, 23 Apr 2021 03:21:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 32E7F611ED
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=vivo.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:MIME-Version:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=K5kFuINoqP/Xhp6Gc9FC+Kdmx1A8CkDD5f4uzta4f3U=; b=b94pTLEYP02h2gLYF6n5xQNoJw
	5uAARtX57tpm1WrDZsp7e9gmvI6KP9tE6oyU2bQ8zP8fVaFmgpooyJ/V/GglwQW8uWkSU+MkwksrM
	050WpqOCzgWa5OGhGaL7UEInyqGHnL2SWWjNqniCe0zLxf7xwuf3DT0sK2G02BeFCfMGNHIPx1BfZ
	0Ir+/maImc5TTAF6JmQA2zLO1cecjEQ9jQRpC1uLeAtMSPBHL8IHLGhweKxhXBJ6bVMd6jb7F+QuQ
	EaJY6zaM7NfKieGwj9kPq/m2ZWTV2qX2BbAs2ax11LMZe6AMoyMjCPpAmiLmG01+l7+yNjbMEcaTS
	TuXwT8xA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lZmN5-000RdP-FU; Fri, 23 Apr 2021 03:20:47 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZmMp-000RaW-FI; Fri, 23 Apr 2021 03:20:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Message-Id:Date:Subject:Cc:To:From:
 Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=9fua0AEgPayc1kEd96eay0I/RoywQO2g8ri/YBjY8e8=; b=Su+177x2Ux0gYqxkS/UdHlNq5j
 J8cg2wsdRNZycutv5fQxIGgxOSCw5eS2q/2UeSbE6anUBy2tCekqQXS/RW7uke/xiTPlrFX/vuZ90
 DbIXk9wMy7w/fqQtJST5cnLm/mKPHPnElaY92MZ+T54GpQ9OBhJ7/M+SQqrnW9s0xLu3wBZz66tyN
 IxL4cbNihpxAG7X9YH7dm1Ee9yncfKwkDnnurNcsd6Xb8uUeFrMmXxH8S9oQ+Guk/WuiE/HI0u/F/
 VmSAJbgMDcc/k+NEoN9jt/11AJRDDlkd5yugL5XNEgg+8R8mVqZJ9yTfOcfk8yiDPCwA30f+5JZMm
 GEzaYoAw==;
Received: from mail-m17640.qiye.163.com ([59.111.176.40])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZmMl-00E72u-C0; Fri, 23 Apr 2021 03:20:28 +0000
Received: from vivo-HP-ProDesk-680-G4-PCI-MT.vivo.xyz (unknown
 [58.250.176.229])
 by mail-m17640.qiye.163.com (Hmail) with ESMTPA id D641A540706;
 Fri, 23 Apr 2021 11:20:24 +0800 (CST)
From: Wang Qing <wangqing@vivo.com>
To: Wim Van Sebroeck <wim@linux-watchdog.org>,
 Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-watchdog@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Wang Qing <wangqing@vivo.com>
Subject: [PATCH V7,
 RESEND 0/2] watchdog: mtk: support pre-timeout when the bark irq is
 available
Date: Fri, 23 Apr 2021 11:20:18 +0800
Message-Id: <1619148020-2236-1-git-send-email-wangqing@vivo.com>
X-Mailer: git-send-email 2.7.4
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgYFAkeWUFZS1VLWVdZKFlBSE83V1ktWUFJV1kPCR
 oVCBIfWUFZQ0NCTVYfQ0pLSU0fQ0lNGhhVEwETFhoSFyQUDg9ZV1kWGg8SFR0UWUFZT0tIVUpKS0
 hKTFVLWQY+
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6Mk06Aww5Kz8VHg03MzA1IT0K
 FA1PCw5VSlVKTUpCSk9DS0lOT0JJVTMWGhIXVQwaFRwKEhUcOw0SDRRVGBQWRVlXWRILWUFZTkNV
 SU5LVUpMTVVJSUJZV1kIAVlBSkxLTTcG
X-HM-Tid: 0a78fcbe2d4fd995kuwsd641a540706
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210422_202027_578526_6596E230 
X-CRM114-Status: UNSURE (   5.47  )
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
 drivers/watchdog/mtk_wdt.c                         | 76 ++++++++++++++++++++--
 2 files changed, 76 insertions(+), 5 deletions(-)

-- 
2.7.4


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
