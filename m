Return-Path: <SRS0=9cIZ=6F=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0E49C38A30
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 Apr 2020 03:11:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 30E2020782
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 Apr 2020 03:11:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="iWwrjRiV";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="nvnLbAOO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 30E2020782
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=yk2+/NZWl4vG0Wi+vRt5v7FJjE8P6PXm5z+czJfCaos=; b=iWwrjRiVr+ZNCx
	0N3FnuV4t34L5ShosE9uiLIW9tUoxkN0iPVCE638HO4gQSyMFtWCN35SZYH5WGiE8flvzVsFM3tjp
	YinPByRItzhxKMAeJfFP2vqwIe4cVxsX3GgA+pwO5IOwRxNGMnV4VReBzIT5M2b/PwunmB5TJg96q
	+5eQZNpTubaPpXzux+vZ3VhcvHka5fyGYJcn4vMyuwSeJG0a3v60DmrauJ81am7Xxf8POuxKw98N8
	jwKuz6Re4UpJxzLTt0vX8cBNxKXLwO4zPX6kKcqUVrj+iJy8YWNt9fBsKB/AB5VHUBB8h8x19li/h
	/Rk7wSJ5aU8wfehCCUqQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jQjJp-0003GE-B6; Tue, 21 Apr 2020 03:11:29 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jQjIl-00029R-Um; Tue, 21 Apr 2020 03:10:25 +0000
X-UUID: ac08899137834965a313c6bcbd8653e1-20200420
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=ZLGMpeA19u1Wima9wc0S7lbHcEYXik+4JHiV+qyzH4U=; 
 b=nvnLbAOO6yZQSezBWJkkSM6woLiiZKlWHZ8KNeNUsRnoV7OF0Jdn5Qfdf2OtMywaQ6jXeZsetUEB1IeWsRIJSizrbpijrKL8nv1FBwmaks6ZwtPnacDpRg+sCKf+5AMSdSmdv6mqTkEVPinYdhCGcQhw3jxQZSdHTqPA8aSaav4=;
X-UUID: ac08899137834965a313c6bcbd8653e1-20200420
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <hsin-hsiung.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 124608712; Mon, 20 Apr 2020 19:10:09 -0800
Received: from MTKMBS01N2.mediatek.inc (172.21.101.79) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 20 Apr 2020 20:00:16 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs01n2.mediatek.inc (172.21.101.79) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 21 Apr 2020 11:00:13 +0800
Received: from mtksdaap41.mediatek.inc (172.21.77.4) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Tue, 21 Apr 2020 11:00:12 +0800
From: Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
To: Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Alexandre Belloni
 <alexandre.belloni@bootlin.com>
Subject: [PATCH v13 0/6] Add Support for MediaTek PMIC MT6358
Date: Tue, 21 Apr 2020 11:00:06 +0800
Message-ID: <1587438012-24832-1-git-send-email-hsin-hsiung.wang@mediatek.com>
X-Mailer: git-send-email 2.6.4
MIME-Version: 1.0
X-TM-SNTS-SMTP: F7DE3C45707E7BC4C1C7A2764009051DD0C524407E750491ADB5A3F3C0033AAC2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200420_201024_009753_0997195C 
X-CRM114-Status: UNSURE (   9.97  )
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
Cc: linux-rtc@vger.kernel.org, Alessandro Zummo <a.zummo@towertech.it>,
 Josef Friedl <josef.friedl@speed.at>, drinkcat@chromium.org,
 srv_heupstream@mediatek.com, Frank Wunderlich <frank-w@public-files.de>,
 Ran Bi <ran.bi@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, Sebastian
 Reichel <sre@kernel.org>, linux-kernel@vger.kernel.org,
 Richard Fontana <rfontana@redhat.com>, devicetree@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-pm@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
 Eddie Huang <eddie.huang@mediatek.com>,
 Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

This patchset including modifying suspend/resume behavior and trimming probe function add support to MT6358 PMIC.
MT6358 is the primary PMIC for MT8183 platform.

changes since v12:
- update file date.
- modify patch sign-offs block according to chronological order.
- modify register definition in header file.
- rebase series on 5.7-rc1.

Hsin-Hsiung Wang (5):
  mfd: mt6397: Modify suspend/resume behavior
  mfd: mt6397: Trim probe function to support different chips more
    cleanly
  dt-bindings: mfd: Add compatible for the MediaTek MT6358 PMIC
  mfd: Add support for the MediaTek MT6358 PMIC
  arm64: dts: mt6358: add PMIC MT6358 related nodes

Ran Bi (1):
  rtc: mt6397: Add support for the MediaTek MT6358 RTC

 Documentation/devicetree/bindings/mfd/mt6397.txt |  14 +-
 arch/arm64/boot/dts/mediatek/mt6358.dtsi         | 358 +++++++++++++++++++++++
 arch/arm64/boot/dts/mediatek/mt8183-evb.dts      |   1 +
 drivers/mfd/Makefile                             |   2 +-
 drivers/mfd/mt6358-irq.c                         | 235 +++++++++++++++
 drivers/mfd/mt6397-core.c                        | 101 ++++---
 drivers/mfd/mt6397-irq.c                         |  35 ++-
 drivers/power/reset/mt6323-poweroff.c            |   2 +-
 drivers/rtc/rtc-mt6397.c                         |  18 +-
 include/linux/mfd/mt6358/core.h                  | 158 ++++++++++
 include/linux/mfd/mt6358/registers.h             | 282 ++++++++++++++++++
 include/linux/mfd/mt6397/core.h                  |   5 +
 include/linux/mfd/mt6397/rtc.h                   |   9 +-
 13 files changed, 1158 insertions(+), 62 deletions(-)
 create mode 100644 arch/arm64/boot/dts/mediatek/mt6358.dtsi
 create mode 100644 drivers/mfd/mt6358-irq.c
 create mode 100644 include/linux/mfd/mt6358/core.h
 create mode 100644 include/linux/mfd/mt6358/registers.h

-- 
2.6.4
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
