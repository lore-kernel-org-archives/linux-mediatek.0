Return-Path: <SRS0=cpQ6=JW=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F4AEC433ED
	for <linux-mediatek@archiver.kernel.org>; Sun, 25 Apr 2021 01:45:24 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4DA1E61155
	for <linux-mediatek@archiver.kernel.org>; Sun, 25 Apr 2021 01:45:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4DA1E61155
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=vivo.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:MIME-Version:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=K5kFuINoqP/Xhp6Gc9FC+Kdmx1A8CkDD5f4uzta4f3U=; b=rhiUwow+5Rg6FWYP+Ql6zTwbo2
	LQIbLSOn0nndz+RlsTp5pS8XlH58k47R1pLjP/QRjR8xTxq1noNmdCFc4zG+rDGE9PU0UvZ+J/wDk
	hoVI7ZHZkMd0wYxQuoWKuZwK4Y5eF/wCQOWASzfah9vrcWyoP5FHR4sVPrS5geQpdKkjCZgUNqeT3
	YMfdsX4Xw8x3GiSzYw2kjbkrm3i9T7QnI11810gyUG/5FlnU0xiSnX/NBqygClK25/BxEsIbspx4T
	QCtHLKroNK/8mukG5SzAFnF4bRK14DmuE6yVOrHUroA3ttEE5KM2TBpaZuJXWLyU5yT3hQ9btFwXf
	GtkuvYag==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1laTpZ-004ne8-DH; Sun, 25 Apr 2021 01:45:05 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1laTot-004nbp-Q9; Sun, 25 Apr 2021 01:44:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Message-Id:Date:Subject:Cc:To:From:
 Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=9fua0AEgPayc1kEd96eay0I/RoywQO2g8ri/YBjY8e8=; b=qGLV/qP+iLOCU16VTx/EQ8An1S
 dC9jZ53eceh7/zNKClwMTi9VEEk31hwOcGv3vWSeNLs6VM/eccgYvBm0BH9HcsnpXR0kvL8RpVrYH
 2zoOyT4KCzsxs2D3vATOs5DDzfqnq705S4CuIdOai19wlS1b7+0uvTobNbEZWOCFzKqM63Nc5ds6q
 SUYBqVEw+9ge7ohY2uWk5vifzew9r0ZZjqoXdU4AdXjmxcZuH0pYQsz5Lq89lkOPlcKKmOjeR3Udd
 bynIvNhuc8sQVpKiWwUPkS8QixqflBkg91WsyPGEfrbuzGel2jrhNQE9a+chTKX1MypDG4YV79jJA
 bVMf8Z1g==;
Received: from mail-m17640.qiye.163.com ([59.111.176.40])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1laTop-00FE4l-4B; Sun, 25 Apr 2021 01:44:20 +0000
Received: from vivo-HP-ProDesk-680-G4-PCI-MT.vivo.xyz (unknown
 [58.250.176.229])
 by mail-m17640.qiye.163.com (Hmail) with ESMTPA id 02DE254015A;
 Sun, 25 Apr 2021 09:44:08 +0800 (CST)
From: Wang Qing <wangqing@vivo.com>
To: Wim Van Sebroeck <wim@linux-watchdog.org>,
 Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-watchdog@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Wang Qing <wangqing@vivo.com>
Subject: [PATCH V8 0/2] watchdog: mtk: support pre-timeout when the bark irq
 is available
Date: Sun, 25 Apr 2021 09:44:01 +0800
Message-Id: <1619315043-1345-1-git-send-email-wangqing@vivo.com>
X-Mailer: git-send-email 2.7.4
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgYFAkeWUFZS1VLWVdZKFlBSE83V1ktWUFJV1kPCR
 oVCBIfWUFZGhgZHlZNTUJNT0JOT09NQh1VEwETFhoSFyQUDg9ZV1kWGg8SFR0UWUFZT0tIVUpKS0
 hKTFVLWQY+
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6PQg6Qhw4Kj8WOAMwIjIDCDkN
 LxgaCh5VSlVKTUpCSEpOS09CTUlDVTMWGhIXVQwaFRwKEhUcOw0SDRRVGBQWRVlXWRILWUFZTkNV
 SU5LVUpMTVVJSUJZV1kIAVlBSk1CSTcG
X-HM-Tid: 0a7906b2c35fd995kuws02de254015a
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210424_184419_348831_7CDA2E71 
X-CRM114-Status: UNSURE (   5.64  )
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
