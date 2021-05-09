Return-Path: <SRS0=dq3f=KE=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6335DC433B4
	for <linux-mediatek@archiver.kernel.org>; Sun,  9 May 2021 21:19:03 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A7B71610A7
	for <linux-mediatek@archiver.kernel.org>; Sun,  9 May 2021 21:19:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A7B71610A7
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=mail.ee
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=8lkvqE2djLOJ2yGGNKPU0PW/y4baGDVsiEiBAwYN5Aw=; b=I2UuXzzxWj3bYpFVxvxjYIjhB
	I0DH/gcmE0LM4S/Zk9v8evAKMPH3egNmmQcnLwNMwUjzRpHmwPIjPjVOSyhXxuoqz6dCt0rTBKgH4
	40EYMPFj7xkgiD0XNSoqYUF1QqNbF+QImVEQycuwjOqgq2bv6lfIbjM47nB10s7s/NIhyuOscvI3p
	9nMeFiXTMFjrDgiqh79+6E0LirsydAt9WgrUykjPM/jCs6jrWJHIGaFVUMxPs4myxLuuwqMXfKzKj
	PUiS6KzcDL4DpL6EePmBbHQADxoxg0IjWmkWK5G1pHPkDo/NpZhkFXmDlEPZLBjZ0Bo8LVViWGQaF
	3lAPcqt1Q==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lfqp1-00CJZJ-Q9; Sun, 09 May 2021 21:18:43 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lfqnh-00CJSj-Tn
 for linux-mediatek@desiato.infradead.org; Sun, 09 May 2021 21:17:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=PWqPKF2mwg3NNfNt3BmTdCp4xvWlHVbHfvuqf/a5960=; b=1EQBtrdk4W779bNMIDhTOgUSSB
 zlwqsue/CrVOhTgDo2Joi4GeYspVAWqKvJs8yUaVj6h1qd1rcHZUl9UhtxlYub2d3zbtg0unHEuZ1
 NEBKCtXENi6bxE00U05Dzp7XDGzoSlib2+YbN7CHt7+SGvstZPvzFhoeW23lULbTWMWSUf9Nw4tkN
 iHBDTX3jR26nchF0H/YoBWCLmHMatiY2Dj2ECJ4AA7Yt7tI2XnP4EbWT0wqLKafE9+HAgYY29PBpP
 LvNjMNFKRLhh9PTbSKA8VSY5uyYrZk9n/zBt2KnQwcHx+oC7FASoG+bfIcxCqDNVgSCnXqCIC7GGR
 LXbFHEVQ==;
Received: from eu-shark2.inbox.eu ([195.216.236.82])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lfqne-0087Vx-C8
 for linux-mediatek@lists.infradead.org; Sun, 09 May 2021 21:17:20 +0000
Received: from eu-shark2.inbox.eu (localhost [127.0.0.1])
 by eu-shark2-out.inbox.eu (Postfix) with ESMTP id B72881E0057D;
 Mon, 10 May 2021 00:17:07 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mail.ee; s=20150108;
 t=1620595027; bh=IZNY4BDS3lmUbMHrkZXJWxFBHVivt/qxVSD6SjtLspk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=ZfxlyRzUOqgQkmQX4EVNSAn+yTKl555rYKZTPITYTrr1uKPcpn4NeaIRq03Hvdkxn
 ouA8q311G4foYXn2TC54lGW8NHrrIjwOO+Y0zQwAgDs2hilyOs5cbzN4lbnTID+UeT
 z5sfxWhrCdqmzWf3pArwp7H8COO4txYApsXBNep0=
Received: from mail.inbox.eu (eu-pop1 [127.0.0.1])
 by eu-shark2-in.inbox.eu (Postfix) with ESMTP id A542A1E0056A;
 Mon, 10 May 2021 00:17:07 +0300 (EEST)
Received: from localhost.localdomain (unknown [196.196.216.231])
 (Authenticated sender: arzamas-16@mail.ee)
 by mail.inbox.eu (Postfix) with ESMTPA id 962AE1BE00A1;
 Mon, 10 May 2021 00:17:06 +0300 (EEST)
From: Boris Lysov <arzamas-16@mail.ee>
To: matthias.bgg@gmail.com,
	linux@roeck-us.net,
	robh+dt@kernel.org
Cc: devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v2 0/3] watchdog: mtk_wdt: refactor code to support more
 watchdogs
Date: Mon, 10 May 2021 00:16:59 +0300
Message-Id: <20210509211702.549-1-arzamas-16@mail.ee>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210131234425.9773-1-arzamas-16@mail.ee>
References: <20210131234425.9773-1-arzamas-16@mail.ee>
MIME-Version: 1.0
X-Virus-Scanned: OK
X-ESPOL: 6NpmlY9HHDysjlqlQGetdgtC2jYwPODk8uGk0RRfgnn7NzCGfUkRI2663TM2UR7LszoX
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210509_141718_723443_5DFD326C 
X-CRM114-Status: GOOD (  10.48  )
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

This series aims to refactor existing mtk_wdt driver by making some
constants dependent on a particular SoC. It is done because some mtk
watchdogs, while working in same manner, have slightly different
parameters such as specific register unlock key value and an offset of a
particular register field.

This patch set adds support for mt6577 watchdog.

Accepting these patches will make ground for submitting additional
changes related to the mainline support of mt6577 (and other compatible
SoCs) in future.

Proposed patches successfully pass all `checkpatch.pl` checks and don't
yield compiler warnings.

Resulting code has been thoroughly tested multiple times for hours on
real hardware (mt6577, mt6589) to ensure that proposed changes are
working properly.

Changes since v1 [1]:
- a complete rewrite to get rid of the configuration flags which made
  the watchdog not support other SoCs; suggested [2] by Guenter Roeck.

[1] https://lore.kernel.org/linux-mediatek/20210131234425.9773-1-arzamas-16@mail.ee/
[2] https://lore.kernel.org/linux-mediatek/050f2f8e-9c3c-10e3-05ef-cd84e949b98f@roeck-us.net/

Boris Lysov (3):
  watchdog: mtk_wdt: Refactor code to support more SoCs
  dt-bindings: watchdog: mediatek: add support for mt6577 SoC
  watchdog: mtk_wdt: add support for mt6577

 .../devicetree/bindings/watchdog/mtk-wdt.txt  |  1 +
 drivers/watchdog/mtk_wdt.c                    | 88 +++++++++++++++----
 2 files changed, 70 insertions(+), 19 deletions(-)

-- 
2.20.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
