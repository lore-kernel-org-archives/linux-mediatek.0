Return-Path: <SRS0=/jeW=BU=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2AFA9C433E0
	for <linux-mediatek@archiver.kernel.org>; Mon, 10 Aug 2020 03:17:21 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ED8772065D
	for <linux-mediatek@archiver.kernel.org>; Mon, 10 Aug 2020 03:17:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="y08y4Gel";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="Oo4P5+db"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ED8772065D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=jch9MyO561Zy2Li6YH7p3Rdh8ij1DN3W8fYXbxK7iBQ=; b=y08y4GellAedj06pcbD/R5+Nmx
	oxd8Mp54i/tyer4s8s8meiz2cfgjuh0gB8k/lLS0ky2MQWOvA2ydaZ1j8/ct1w9HvlIxDHMFwoIQ1
	KmnrAe287oHTTn+Wc4VVg9NcvTA527G/ff+EVlO27t9JAYBfRGON+tBZ3maAFEGSGCp3qLusXHalf
	kxQntNXUz1sJCdOqDw6aAPLfgw3aT3JtIVhrKKiWronBad2FVNZVuhBJTwjseU+BQBnyz0jvpnrGY
	o5gImgXWQOvZZGGFQaphF/lXana7lpmnN3Zipvw4WsIOVd15jamxEydIrmrioaSNMtLhn5MlxhCki
	9NQRHymw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k4yJA-0001uw-1q; Mon, 10 Aug 2020 03:17:08 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k4yJ2-0001sr-5X; Mon, 10 Aug 2020 03:17:01 +0000
X-UUID: 05825749565045b39e5727487ebca3e6-20200809
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=Z4K8Bg/d3lhf7ivZYNBcutHvTqaH5vB2AWGS7QPOWDs=; 
 b=Oo4P5+db221PlU9fSRJrW4XhdqVoOi6Nu9wGFkP1l3aHHo0WxWIKGfiAvP+O/5MUa0a3R4/GpJYBZDdSwQJBMoyd2Ubc0h/n5RokrjF7S9/psipx7Ov97rxXX7B4vDyE77w3XacVdbF32s538STmI8zI6jWMQH/oy7+EKQ1N4S4=;
X-UUID: 05825749565045b39e5727487ebca3e6-20200809
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <jiaxin.yu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1813846492; Sun, 09 Aug 2020 19:17:08 -0800
Received: from mtkmbs05n1.mediatek.inc (172.21.101.15) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 9 Aug 2020 20:06:54 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs05n1.mediatek.inc (172.21.101.15) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 10 Aug 2020 11:06:48 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 10 Aug 2020 11:06:47 +0800
From: Jiaxin Yu <jiaxin.yu@mediatek.com>
To: <broonie@kernel.org>, <matthias.bgg@gmail.com>, <robh+dt@kernel.org>,
 <tiwai@suse.com>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 0/2] Add mediatek codec mt6359 driver
Date: Mon, 10 Aug 2020 11:05:52 +0800
Message-ID: <1597028754-7732-1-git-send-email-jiaxin.yu@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200809_231700_476270_797E70C5 
X-CRM114-Status: GOOD (  11.57  )
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
 linux-arm-kernel@lists.infradead.org
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
(2) HPL Mux --> "Audio Playback"
(3) HPR Mux --> "Audio Playback"

v2 changes:
	1. Move playback_gpio/capture_gpio to the machine driver.
	2. Fix mic_type(ACC/DMIC/DCC/DCC_*) at init stage.
	3. Move devm_regulor_get to mt6359_platform_driver_probe.
	4. Add relulator_disable in remove function.
	5. Use stereo controls to the volume control.
	6. Use SOC_ENUM_SINGLE_DECL instead of SOC_VALUE_ENUM_SINGLE_DECL.
	7. Cleanup unused code.

v1 changes:
	1.lkml link:
		https://lkml.org/lkml/2020/3/5/1257

Jiaxin Yu (2):
  ASoC: mediatek: mt6359: add codec driver
  dt-bindings: mediatek: mt6359: add codec document

 .../devicetree/bindings/sound/mt6359.yaml          |   68 +
 sound/soc/codecs/Kconfig                           |    8 +
 sound/soc/codecs/Makefile                          |    2 +
 sound/soc/codecs/mt6359.c                          | 2966 ++++++++++++++++++++
 sound/soc/codecs/mt6359.h                          | 2653 +++++++++++++++++
 5 files changed, 5697 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/mt6359.yaml
 create mode 100644 sound/soc/codecs/mt6359.c
 create mode 100644 sound/soc/codecs/mt6359.h

-- 
1.8.1.1.dirty
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
