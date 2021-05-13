Return-Path: <SRS0=rIjB=KI=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EAB17C433B4
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 May 2021 01:35:54 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6C68661353
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 May 2021 01:35:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6C68661353
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=mail.ee
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=cvhNMWem/mkIwuYI1jgpc/zfo9RyKLS4VYGw8Ax2awE=; b=UZVFO9oTFyz8C3c6z19iyA4IfD
	YsHPMXMMK/VdrVnsrNIgqXMep9+mPGTH87NMy5eDsyVhB+6TQybGMSRJF+TUNvRV/IOMGw3oNCJNH
	uj1bMuxKNxVl66nGfyZO/s+quON2Gb3YB/zH+n+qT/ERKIvWrtto5ekeC/vjaj4KgLWKVt3Ef+YYs
	QzergrVTK7xrwJR7hV7dI4cO5MXZxuqo2/2cYn+Ap1aIqjqncS1ftTtsocDcH4HtxWX/hUdUcOrx7
	pzpq5u2ezT3x0nhPrqa7cIJlajy8u8kRXDh4lm0+tz4+kRpQ02HuGQxQGfFyK/h1RTd1yETfPpUaS
	4H4AyKKQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lh0GG-004Od5-3R; Thu, 13 May 2021 01:35:37 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lh0GC-004Obw-GP
 for linux-mediatek@desiato.infradead.org; Thu, 13 May 2021 01:35:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=5NVAK79CNz7ohqBEQ/eh+1WAKD7AAiz92dL4T5PHS2U=; b=A/fDYSBEZZ+qztZE9jMZvWOHm3
 fhjr3yngZprKdzbEw2+xTwlHRon9cE2WrrXHdzP6wOS6diYRVVEx8Vz5qPEr9eaZG/xgndg9guXuN
 sMluB3rl8SZh1m6jXThYWTs21xGGEfV7zfKQ9BS874KyFM3MecWz8tqOnZ+5w+0MTiTDTeBlYDKRn
 sJ7TGcCnAIuegtUGL2VWD+CaZHaQuwAa2DhFlE8WxPswvT7xt49TO/HsRo4YvArxBz9cG1Ig3SMm5
 06/kqGnRZp5n7Q39uIn+vTgWpnx90RgWf+P647i+Aim67xhyQSmSOuGYiEI/+Taur6HytBuIdMEDy
 gnR4oDnw==;
Received: from eu-shark2.inbox.eu ([195.216.236.82])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lh0G9-00AxSM-77
 for linux-mediatek@lists.infradead.org; Thu, 13 May 2021 01:35:31 +0000
Received: from eu-shark2.inbox.eu (localhost [127.0.0.1])
 by eu-shark2-out.inbox.eu (Postfix) with ESMTP id C14531E0072D;
 Thu, 13 May 2021 04:35:20 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mail.ee; s=20150108;
 t=1620869720; bh=vRwXFMD6U8q6tmZOmdO31QLgDAt2cRF0CXYaisrB3uQ=;
 h=From:To:Cc:Subject:Date;
 b=WUwLZwEs2OnBbqAcvVuTUpVv1i/tPJrrrExX6xT2GKzeMNzZ/UAS5RhRCXos/j+ly
 hVfKj6r5vR3zF+joHnITuzJUquc1ypGdQ5sdWSbZxgRGG2zHJ77tv3q5dbVGuZH0iE
 rywjhprj9dfT3KMjPeZER1xtDvtWmiujwUjqsEPw=
Received: from localhost (localhost [127.0.0.1])
 by eu-shark2-in.inbox.eu (Postfix) with ESMTP id B4EBC1E00712;
 Thu, 13 May 2021 04:35:20 +0300 (EEST)
Received: from eu-shark2.inbox.eu ([127.0.0.1])
 by localhost (eu-shark2.inbox.eu [127.0.0.1]) (spamfilter, port 35)
 with ESMTP id S4aCr9oxxTeu; Thu, 13 May 2021 04:35:20 +0300 (EEST)
Received: from mail.inbox.eu (eu-pop1 [127.0.0.1])
 by eu-shark2-in.inbox.eu (Postfix) with ESMTP id 346BD1E006E1;
 Thu, 13 May 2021 04:35:20 +0300 (EEST)
Received: from localhost.localdomain (unknown [134.19.185.34])
 (Authenticated sender: arzamas-16@mail.ee)
 by mail.inbox.eu (Postfix) with ESMTPA id 565AB1BE00C5;
 Thu, 13 May 2021 04:35:19 +0300 (EEST)
From: Boris Lysov <arzamas-16@mail.ee>
To: matthias.bgg@gmail.com,
	linux@roeck-us.net,
	robh+dt@kernel.org
Cc: devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v3 0/3] watchdog: mtk_wdt: refactor code to support more
 watchdogs
Date: Thu, 13 May 2021 04:35:12 +0300
Message-Id: <20210513013515.31329-1-arzamas-16@mail.ee>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Virus-Scanned: OK
X-ESPOL: +d1m6vZSY16pi12lXXrXGwc/qjRKWPGHiOq/zG4nkTulcTLmCkUMVRmxn2RySXi7og==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210512_183529_461798_CEC46146 
X-CRM114-Status: UNSURE (   9.51  )
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

Changes since v2 [3]:
- rename the newly introduced structure element ('data' -> 'config') to
  avoid changing the names of already existing variables; suggested [4]
  by Guenter Roeck.

Changes since v1 [1]:
- a complete rewrite to get rid of the configuration flags which made
  the watchdog not support other SoCs; suggested [2] by Guenter Roeck.

[1] https://lore.kernel.org/linux-mediatek/20210131234425.9773-1-arzamas-16@mail.ee/
[2] https://lore.kernel.org/linux-mediatek/050f2f8e-9c3c-10e3-05ef-cd84e949b98f@roeck-us.net/
[3] https://lore.kernel.org/linux-mediatek/20210509211702.549-1-arzamas-16@mail.ee/
[4] https://lore.kernel.org/linux-mediatek/efdce3a5-e5b4-19a8-35f1-8a536220bb3f@roeck-us.net/

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
