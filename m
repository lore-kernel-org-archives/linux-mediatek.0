Return-Path: <SRS0=5o2P=BZ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,UNWANTED_LANGUAGE_BODY,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 744C2C433E1
	for <linux-mediatek@archiver.kernel.org>; Sat, 15 Aug 2020 17:21:13 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 41C4423B18
	for <linux-mediatek@archiver.kernel.org>; Sat, 15 Aug 2020 17:21:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="SeUUfYUG";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="s2YBefC3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 41C4423B18
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=WX8jQ8FhCtS2Bfe81CRGER3AK6vJ3F+HxwhPRpnkdrE=; b=SeUUfYUGWvMq3+QcmRnRP2+oyn
	xkIEPSsBQdy9pmw+XYi1lQlOZ/6y1BgKakEXIqUH827zyB2pivG8hAVzB2LNFlxCo2ZzhqQiJRF3P
	RkF72UNmIIMCaPj16vHFQ3zucDaO8ag56nSzp0JleDqFapxw5strexd+IYXJm5IBROOP49J/eb5nr
	iCKMDzX7NLmpSWfrYywQhn7QdeGjCi9v2+76B7TihFTUOu2UY0TmAS4huFy9fRx37PhSD6k6BfRDx
	c0BlN0dgrnrqkIW3YN0bRDhFoC6c8IDP6oJBlF6wqj+e9JvRMszgQZFKcR0hf13chOuGXRcGytBqR
	SmI/ljKQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k6zra-0007qy-Vv; Sat, 15 Aug 2020 17:21:03 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k6zrS-0007p7-Hq; Sat, 15 Aug 2020 17:20:56 +0000
X-UUID: f54cce0c0a1c4bb1a4fc79d9f41c233a-20200815
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=FFQUhOYLKuJ9Yfi7yGetNzlRsOXGteiFSi935u14Oys=; 
 b=s2YBefC3dOWhC/CJHQtJwhvqCQ/Mw91K58GoYPpGpKmG9IyfkURn+EvYxDk6x2xw5qJMn9UPo5zkXu9yHG7N733M65kcNGfNtLU/bH1EmOUxk2STewwyjDQSbIAk70ksRz6SBJbcUb62mmu/M6Z1gN/D/Uj2i0DoGwpgpUigXlM=;
X-UUID: f54cce0c0a1c4bb1a4fc79d9f41c233a-20200815
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <jiaxin.yu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1434494382; Sat, 15 Aug 2020 09:20:46 -0800
Received: from mtkmbs05n2.mediatek.inc (172.21.101.140) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 15 Aug 2020 10:20:50 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs05n2.mediatek.inc (172.21.101.140) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 16 Aug 2020 01:20:42 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Sun, 16 Aug 2020 01:20:41 +0800
From: Jiaxin Yu <jiaxin.yu@mediatek.com>
To: <broonie@kernel.org>, <matthias.bgg@gmail.com>, <robh+dt@kernel.org>,
 <tiwai@suse.com>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v4 0/2] Add mediatek codec mt6359 driver
Date: Sun, 16 Aug 2020 01:19:38 +0800
Message-ID: <1597511980-16281-1-git-send-email-jiaxin.yu@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200815_132054_814914_26D56FFA 
X-CRM114-Status: GOOD (  10.25  )
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
 howie.huang@mediatek.com, bicycle.tasi@mediatek.com, tzungbi@google.com,
 linux-mediatek@lists.infradead.org, Jiaxin Yu <jiaxin.yu@mediatek.com>,
 eason.yen@mediatek.com, linux-arm-kernel@lists.infradead.org
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

v4 changes:
	1. Add a remove() function to undo regulator_enable().
	2. Removed unnecessary logs.

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

 .../devicetree/bindings/sound/mt6359.yaml     |   68 +
 sound/soc/codecs/Kconfig                      |    8 +
 sound/soc/codecs/Makefile                     |    2 +
 sound/soc/codecs/mt6359.c                     | 2755 +++++++++++++++++
 sound/soc/codecs/mt6359.h                     | 2640 ++++++++++++++++
 5 files changed, 5473 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/mt6359.yaml
 create mode 100644 sound/soc/codecs/mt6359.c
 create mode 100644 sound/soc/codecs/mt6359.h

-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
