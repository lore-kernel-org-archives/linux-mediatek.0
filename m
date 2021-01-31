Return-Path: <SRS0=AqdA=HC=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C565C433DB
	for <linux-mediatek@archiver.kernel.org>; Sun, 31 Jan 2021 23:45:26 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D1FD764E22
	for <linux-mediatek@archiver.kernel.org>; Sun, 31 Jan 2021 23:45:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D1FD764E22
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=mail.ee
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=GlPlkRv2s1zjnEdNLjAHyXaH1PXFLr4R2ik3+9u4OqM=; b=CyCx8A5X+Vyze6hA0Q76u4v9cB
	QZuEQ4GhF2CoC/vekzBgtYLaHEKJt0dL03mipk5iJbgMY9do1hiugVxfEyUI+BJB7tp0bUC4sPwE4
	U/eBqT7WybO+us6qgMKEzKBwTnMFYZq4flxqJk6+x5TBxx/1+s2xZne5S/rLG87+VCEHxsZiQebIK
	5kmhDlSnDKTjq2fm7/3H+UWx5EepGXSdLgo2vns4SOAjG1U1g3d7T3f2n/xC0Pjvj6kHEUtRrcLwm
	FgWIhLL1hQIy3SeDRd1/z6yqcvmcnh8MC5mePon5cKelXe+wseeYAVBFtiLPLoaXvX5FARfMSY5VR
	Ns51S2MQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l6MP7-0006Pd-EY; Sun, 31 Jan 2021 23:45:17 +0000
Received: from eu-shark1.inbox.eu ([195.216.236.81])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l6MP3-0006PE-5O
 for linux-mediatek@lists.infradead.org; Sun, 31 Jan 2021 23:45:16 +0000
Received: from eu-shark1.inbox.eu (localhost [127.0.0.1])
 by eu-shark1-out.inbox.eu (Postfix) with ESMTP id 4FD426C008E0;
 Mon,  1 Feb 2021 01:45:09 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mail.ee; s=20150108;
 t=1612136709; bh=IFAJlt1BHFeW7aWKm0BJnd3XeKpMsCJpUn+KxcaeWS4=;
 h=From:To:Cc:Subject:Date;
 b=i+E1vXpR/r48F2xRmslG6HLMv6ZnMFLnJM7+tSBpS+s7T6azyurW03iGTrrMfNYiI
 VY1UDrsH0N3GTunJwZ5CjzbhAdvCDxhEkFJReyG9T2H4yoYSSOIo46JR8RlCmDrzRj
 5sqM40ejpP7t/VrKBPkBud21vX+v7PtUl7aCLpvk=
Received: from mail.inbox.eu (eu-pop1 [127.0.0.1])
 by eu-shark1-in.inbox.eu (Postfix) with ESMTP id 2FBE86C00853;
 Mon,  1 Feb 2021 01:45:09 +0200 (EET)
Received: from localhost.localdomain (unknown [165.231.161.4])
 (Authenticated sender: arzamas-16@mail.ee)
 by mail.inbox.eu (Postfix) with ESMTPA id 0BD531BE00BA;
 Mon,  1 Feb 2021 01:45:05 +0200 (EET)
From: Boris Lysov <arzamas-16@mail.ee>
To: matthias.bgg@gmail.com,
	linux@roeck-us.net,
	robh+dt@kernel.org
Subject: [PATCH 0/3] watchdog: mtk_wdt: add support for mt6577
Date: Mon,  1 Feb 2021 02:44:22 +0300
Message-Id: <20210131234425.9773-1-arzamas-16@mail.ee>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Virus-Scanned: OK
X-ESPOL: 885mlYxLBDyni0CgRXrAARpE0ScJA635mZS31gE76Hb7NCeCfEAJVBS0gR8FQAnNog==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210131_184513_447286_B62CA603 
X-CRM114-Status: UNSURE (   8.50  )
X-CRM114-Notice: Please train this message.
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
Cc: devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Boris Lysov <arzamas-16@mail.ee>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

This series adds support for mt6577 watchdog to the:
a) mtk_wdt driver - by bringing support for 16-bit I/O
b) mtk_wdt dt-binding - by declaring compatibility with mt6577

Without these changes user would have to disable watchdog by manually
writing a value to the register, otherwise the device will power off.

Accepting these patches will make ground for submitting additional
changes related to the mainline support of mt6577 (and other compatible
SoCs) in future.

Suggested patches successfully pass all `checkpatch.pl` checks, and they
do not interfere with already supported watchdogs.

Boris Lysov (3):
  dt-bindings: watchdog: mediatek: add support for mt6577 SoC
  watchdog: mtk_wdt: add support for 16-bit control registers
  watchdog: mtk_wdt: declare compatibility with mt6577

 .../devicetree/bindings/watchdog/mtk-wdt.txt  |  1 +
 drivers/watchdog/Kconfig                      |  9 +++++
 drivers/watchdog/mtk_wdt.c                    | 35 +++++++++++++------
 3 files changed, 35 insertions(+), 10 deletions(-)

-- 
2.20.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
