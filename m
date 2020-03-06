Return-Path: <SRS0=MFJx=4X=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E86C5C3F2C6
	for <linux-mediatek@archiver.kernel.org>; Fri,  6 Mar 2020 03:34:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B9F5020848
	for <linux-mediatek@archiver.kernel.org>; Fri,  6 Mar 2020 03:34:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ZREgY2P1";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="to2V9PU8"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B9F5020848
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=IJpc/TIgO6PKndCLxPoic0d4icmXhphwcW5N0shFMrA=; b=ZREgY2P17QafeG
	9NRDg5TkHY5TQwAM8xPXjzh4UP1Zm69vCuL2kx+aWCIspc86CyR23yHBYiOnvNGimHeEZZbFeJ79v
	rkFY32zIgvY64y+Ag+FgbFLAU/Nn4dkUPrabKMPB9l3PKBXN1COgRuDiPodFIBsOWtVhUi8nIFW3j
	Bv+cssN5712JSKNHH0LlO553aVHWQw7FgqDyonZYrIRaAzMuJ0CRwOkUdHudKEoz8FPKQFYSnKnc+
	OMvqRlUdTvBke3S6xqYRbwQ6iN/wY3WfvQ9t9e036KiwmlmBNfegXl/zVUaG0EL7Ku77hGaDEBD56
	6m1W60oD5Q5SyNuLqGow==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jA3kS-0000bV-5t; Fri, 06 Mar 2020 03:34:04 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jA3kP-0000aW-FL
 for linux-mediatek@lists.infradead.org; Fri, 06 Mar 2020 03:34:02 +0000
X-UUID: 55f69aff1bf54caf87350212d67188bb-20200305
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=itlYgQ45be2Ssn2Nzi2Lg0iTSRTOtSvZl1uOUtpZGFQ=; 
 b=to2V9PU8Ie1oJRyCv/CXkuG0op/0lQp9T6MXTLPZsW/Ds+40Glvq9zHlwcXd9slUyHq6/aEwa8G/qF2+iR47I1xzioLYjZ1nMo6J22L9DktjuWbza2O5MoLFDGQ/jwhR098DbOxPktOpxee4H6DWGXNWs+aSKTFOHco59dr4l2M=;
X-UUID: 55f69aff1bf54caf87350212d67188bb-20200305
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <eason.yen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1062394690; Thu, 05 Mar 2020 19:33:57 -0800
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Thu, 5 Mar 2020 19:33:55 -0800
Received: from mtkcas09.mediatek.inc (172.21.101.178) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Fri, 6 Mar 2020 11:33:01 +0800
Received: from mtksdaap41.mediatek.inc (172.21.77.4) by mtkcas09.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via
 Frontend Transport; Fri, 6 Mar 2020 11:33:55 +0800
From: Eason Yen <eason.yen@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Mark Brown <broonie@kernel.org>
Subject: [PATCH 0/2] Add mediatek codec mt6359 driver
Date: Fri, 6 Mar 2020 11:33:40 +0800
Message-ID: <1583465622-16628-1-git-send-email-eason.yen@mediatek.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200305_193401_524937_BAE0BE1B 
X-CRM114-Status: UNSURE (   6.42  )
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
Cc: devicetree@vger.kernel.org, wsd_upstream@mediatek.com,
 linux-kernel@vger.kernel.org, jiaxin.yu@mediatek.com,
 linux-mediatek@lists.infradead.org, eason.yen@mediatek.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add mediatek codec (MT6359) driver

MT6359 support playback, capture and vow feature.

On downlink path, it includes three DACs for handset, headset,
and lineout path. On unlink path, it includeds three ADCs for
main mic, second mic, 3rd mic, and headset mic.

By scenario, select *_MUX widget to create damp path.
And by select mic_type_mux to choose DMIC/AMIC/....

For example, select these MUX widget to create headset path
(1) DAC In Mux --> "Normal Path"
(2) HPL Mux --> "Audio Playback"
(3) HPR Mux --> "Audio Playback"


Eason Yen (2):
  ASoC: mediatek: mt6359: add codec document
  ASoC: codec: mediatek: add mt6359 codec driver

 Documentation/devicetree/bindings/sound/mt6359.txt |   16 +
 sound/soc/codecs/Kconfig                           |    9 +
 sound/soc/codecs/Makefile                          |    2 +
 sound/soc/codecs/mt6359.c                          | 4217 ++++++++++++++++++++
 sound/soc/codecs/mt6359.h                          | 3212 +++++++++++++++
 5 files changed, 7456 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/mt6359.txt
 create mode 100644 sound/soc/codecs/mt6359.c
 create mode 100644 sound/soc/codecs/mt6359.h

-- 
1.9.1
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
