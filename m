Return-Path: <SRS0=WAzV=DX=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86EAEC43457
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Oct 2020 20:41:08 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 67B1E20878
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Oct 2020 20:41:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="WxOMConM";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mailerdienst.de header.i=@mailerdienst.de header.b="CSs+7sEc"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 67B1E20878
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=fw-web.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=KmLDdZKvuI9AysoFtymyHZ9bIqYW3e5iou440wWTalA=; b=WxOMConMH1wHPtALMyc8cMaPbv
	sWYNiG2N8B9o2Hz+mfkmCrawTd1y86wq+MQ42BUHqvnXCE9OsNKmE4SQaGlYMNsfa+Jyan+pprFJJ
	NmEGZUcjnl0Pa4LVvHgRfyxAbPBysP4oi3GjU4k754d7lZ0Be+ISX9rkZpw78V4ztK/7ac1mKIFsj
	QoQTbkvLe0o1OQHcX/WWNFPPsposp2M3yN0mHZ/EkdDsoBjpTGPadOeeLDB22e7tkl2ODKH74dHOs
	FpKptiWbAepAQ7cgG6mi7yAoKqUUS0YEAGnu7fGXWqG2Jhvv2CGYiDGTjouTfpZcTVHShjMoEVfCF
	xfvNDJmQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kTWX0-0002ih-UO; Fri, 16 Oct 2020 20:40:54 +0000
Received: from mxout1.routing.net ([2a03:2900:1:a::a])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kTWWs-0002gn-Vh; Fri, 16 Oct 2020 20:40:48 +0000
Received: from mxbox3.masterlogin.de (unknown [192.168.10.78])
 by mxout1.routing.net (Postfix) with ESMTP id AE2E040200;
 Fri, 16 Oct 2020 20:40:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
 s=20200217; t=1602880841;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=eByxQJ3Uw+4BTez5687bqBmBgV7qeZW+tNKXlbDd5mo=;
 b=CSs+7sEcIpTLCTKNIQgOYRsKkoXl/FP5ViCDZoRe3iZcWE7urOw/lVdgdiyKD9Ktu7JUr9
 OGoHPObVhvnWBHgp7V/bpeTpB9q1eMRDtanFQQnjQwTPKdBa+Y1N+sro90ZPj/W6a5XqcO
 O1dZYu/hbueXe8xYEi2mZ2+CozqTwXs=
Received: from localhost.localdomain (fttx-pool-80.208.213.194.bambit.de
 [80.208.213.194])
 by mxbox3.masterlogin.de (Postfix) with ESMTPSA id EA325360549;
 Fri, 16 Oct 2020 20:40:40 +0000 (UTC)
From: Frank Wunderlich <linux@fw-web.de>
To: linux-mediatek@lists.infradead.org
Subject: [RFC 0/3] add available pwm for bananapi-r64
Date: Fri, 16 Oct 2020 22:40:16 +0200
Message-Id: <20201016204019.2606-1-linux@fw-web.de>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201016_164047_299659_5260B225 
X-CRM114-Status: UNSURE (   8.54  )
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
Cc: devicetree@vger.kernel.org, Frank Wunderlich <frank-w@public-files.de>,
 Linus Walleij <linus.walleij@linaro.org>, Sean Wang <sean.wang@kernel.org>,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Frank Wunderlich <frank-w@public-files.de>

- mt7622 provides 6 pwm channels and only one is configured in dts
- pinctl-driver contains 7 pwm-channels where one is currently used.
- Mediatek confirmed that pwm7 does not exist and so dts is wrong
  and also the pinctrl definitions.

Frank Wunderlich (3):
  dts64: mt7622: enable all pwm for bananapi r64
  dts64: mt7622: disable spi1 and uart2 because pins are used by pwm
  pinctl: mt7622: drop pwm ch7 as mt7622 only has 6 channels

 .../boot/dts/mediatek/mt7622-bananapi-bpi-r64.dts   | 13 ++++++++-----
 drivers/pinctrl/mediatek/pinctrl-mt7622.c           | 13 +------------
 2 files changed, 9 insertions(+), 17 deletions(-)

-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
