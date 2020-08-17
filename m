Return-Path: <SRS0=yC7h=B3=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17FFEC433DF
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Aug 2020 06:09:11 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C664420758
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Aug 2020 06:09:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="yAz1Nzy3";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="WU8s/2Df"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C664420758
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=VwGVSs73S2hT10CMJpu5yPcH1xTt9hii65+W84CvedI=; b=yAz1Nzy3kGmOgR/Wepe27ezEhs
	SzR5RFcel42b9rrF4vU9XUePw6MQH/yLFGHUbr+KMwpTLbbSOUweDeQLou/YA1ALnll7s05oV9cIJ
	ADn9fqBjdLH8Bgm9cmqevwcmcNFtu/qY5dK+BjRpsvHuVrcfDdckGD+SM8Pv31MZHQWKv/cV/vAi/
	CGT0EhFJP/+ExN/otOWKQxIZh76llLP7H80z1v420QSPhj4Qz6ogJy5Ing43L6AuKVaIDruPSW1MQ
	qoBhB9vKnLVy48cYnccpj10Wpqb3OVrKaPcCYUX2ODH30H0/PkMY7j0I+Ei6KK3jIAshHJquM2C/O
	7FAhUYqw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k7YKJ-0001kz-Ub; Mon, 17 Aug 2020 06:08:59 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k7YKC-0001ig-8B; Mon, 17 Aug 2020 06:08:53 +0000
X-UUID: 2447fbddcb804d91aa068623129c161e-20200816
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=Lu1pMyst1Tuly33CctInw4/3ftqcqaHDiJCV73RnmxQ=; 
 b=WU8s/2DfsA7RlJAnD3vnJD8QMhLS0UrNUK3J5OYVawl5IfkcEvJGGr5ZzGlUZDLWdA+CMBli6Nzx/8PjH+mHQcs6fjBY0gAeI87Flfc9J1w7OEuku5puGAt0CC02dDDMHRUWHanhJCI3ecyuByUkJ+I4LXmCryP5SzNPN6ZQn0M=;
X-UUID: 2447fbddcb804d91aa068623129c161e-20200816
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <jiaxin.yu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 2073804567; Sun, 16 Aug 2020 22:08:43 -0800
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 16 Aug 2020 23:08:45 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 17 Aug 2020 14:08:39 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 17 Aug 2020 14:08:40 +0800
From: Jiaxin Yu <jiaxin.yu@mediatek.com>
To: <broonie@kernel.org>, <matthias.bgg@gmail.com>, <robh+dt@kernel.org>,
 <tiwai@suse.com>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v5 0/2] Add mediatek codec mt6359 driver
Date: Mon, 17 Aug 2020 14:07:33 +0800
Message-ID: <1597644455-8216-1-git-send-email-jiaxin.yu@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200817_020852_550398_36407820 
X-CRM114-Status: GOOD (  11.63  )
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
Cc: alsa-devel@alsa-project.org, shane.chien@mediatek.com,
 howie.huang@mediatek.com, Jiaxin Yu <jiaxin.yu@mediatek.com>,
 tzungbi@google.com, linux-mediatek@lists.infradead.org, eason.yen@mediatek.com,
 bicycle.tsai@mediatek.com, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add mediatek codec (MT6359) driver

MT6359 support playback and capture feature.

On downlink path, it includes three DACs for handset, headset,
and lineout path. On unlink path, it includeds three ADCs for
main mic, second mic, 3rd mic, and headset mic.

By scenario, select *_MUX widget to create damp path.
And by select mic_type_mux to choose DMIC/AMIC/....

For example, select these MUX widget to create headset path
(1) DAC In Mux --> "Normal Path"
(2) HP Mux --> "Audio Playback"

v5 changes:
	1. Don't need to unregister the component which is already relegated to devm.

v4 changes:
	1. Add a remove() function to undo regulator_enable().
	2. Removed unnecessary logs.
	3. patchwork link:
		https://patchwork.kernel.org/cover/11715553/
		https://patchwork.kernel.org/patch/11716015/
		https://patchwork.kernel.org/patch/11715557/
v3 changes:
	1. patchwork link:
		https://patchwork.kernel.org/cover/11714291/
		https://patchwork.kernel.org/patch/11714295/
		https://patchwork.kernel.org/patch/11714339/

v2 changes:
	1. patchwork link:
		https://patchwork.kernel.org/cover/11706935/
		https://patchwork.kernel.org/patch/11708865/
		https://patchwork.kernel.org/patch/11706937/

v1 changes:
	1.lkml link:
		https://lkml.org/lkml/2020/3/5/1257

Jiaxin Yu (2):
  ASoC: mediatek: mt6359: add codec driver
  dt-bindings: mediatek: mt6359: add codec document

 .../devicetree/bindings/sound/mt6359.yaml          |   68 +
 sound/soc/codecs/Kconfig                           |    8 +
 sound/soc/codecs/Makefile                          |    2 +
 sound/soc/codecs/mt6359.c                          | 2753 ++++++++++++++++++++
 sound/soc/codecs/mt6359.h                          | 2640 +++++++++++++++++++
 5 files changed, 5471 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/mt6359.yaml
 create mode 100644 sound/soc/codecs/mt6359.c
 create mode 100644 sound/soc/codecs/mt6359.h

-- 
1.8.1.1.dirty
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
