Return-Path: <SRS0=jsh4=BY=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37813C433DF
	for <linux-mediatek@archiver.kernel.org>; Fri, 14 Aug 2020 10:47:17 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F0E4A2074D
	for <linux-mediatek@archiver.kernel.org>; Fri, 14 Aug 2020 10:47:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="b3f6JUxA";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="IH6vlJtA"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F0E4A2074D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=6zHnTRuCgFmR8AJtzR8yk8JGlTuC3BsF3F+DwSDUZ+Q=; b=b3f6JUxAOC23uFPJ+5b9vs36QX
	ynQDKnz0i3scnId5RrzFpj3VWTx/1tH/XF/we8jHigb+Pe0AbE3NA20Jg4eEnBskrPSl7Km7xUdeu
	BrFiuxAxKtRjY43A4ClAntXPCRveVvpqKE3XzNbkCa4KJdel2mGO3dBCrDiByF1wjnUazgwsEwY+s
	UoOReH3/3C6WvR2YlRT8D+8pms2Vo8o6l9v3AIUqJV/u7EB4noRDbcnmJjFUCqiQ+w9qa0PYGwcQ+
	rsjRth3ELgwCWMorlYzU0d7FsW7P293/hXsRgWiGwp6DKuTz9tZTG7XCwMUjabgazPwuGzMyJvKBd
	xgl/9BHQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k6XEo-00073w-RX; Fri, 14 Aug 2020 10:47:06 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k6XEj-0006yA-9g; Fri, 14 Aug 2020 10:47:02 +0000
X-UUID: bc65a426be4e4ffabdb7506336fde77d-20200814
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=Vg2nMxZsYjEcovPtsX9BS/W+I/gd/3mpy5v2d1HpBk8=; 
 b=IH6vlJtANCNfHanVLG1x/WJLGXR1205kDGmxerhPno8Nb9PvNjGojqtyTRTGS9ACtg+xQ37HMJ+VjoWzAQSj6Ykxork4z+wHSzI+izXsC4ptm0mYvl2dhDO7ujf4PhyvbENV2Poz9jHjjyset5Uo3CGsNjR4GP2YGsREm91Pc4g=;
X-UUID: bc65a426be4e4ffabdb7506336fde77d-20200814
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <jiaxin.yu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1813329222; Fri, 14 Aug 2020 02:46:57 -0800
Received: from mtkmbs05n2.mediatek.inc (172.21.101.140) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 14 Aug 2020 03:46:55 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs05n2.mediatek.inc (172.21.101.140) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 14 Aug 2020 18:46:52 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 14 Aug 2020 18:46:51 +0800
From: Jiaxin Yu <jiaxin.yu@mediatek.com>
To: <broonie@kernel.org>, <matthias.bgg@gmail.com>, <robh+dt@kernel.org>,
 <tiwai@suse.com>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v3 0/2] Add mediatek codec mt6359 driver
Date: Fri, 14 Aug 2020 18:45:52 +0800
Message-ID: <1597401954-28388-1-git-send-email-jiaxin.yu@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200814_064701_554974_8FB9574B 
X-CRM114-Status: GOOD (  10.91  )
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
(2) HPL Mux --> "Audio Playback"
(3) HPR Mux --> "Audio Playback"

v3 changes:
	1. Remove calibration related functions.
	2. Conbined 'HPL Mux' and 'HPR Mux' to 'HP Mux'.
	3. Move the regulator_enable of 'vaud18' to the component probe.
	4. Fix some incorrect coding style.

v2 changes:
	1. patchwork link:
		https://patchwork.kernel.org/cover/11706935/
		https://patchwork.kernel.org/patch/11708865/
		https://patchwork.kernel.org/patch/11706937/

v1 changes:
	1.lkml link:
		https://lkml.org/lkml/2020/3/5/1257

Jiaxin Yu (2):
  WIP: ASoC: mediatek: mt6359: add codec driver
  WIP: dt-bindings: mediatek: mt6359: add codec document

 .../devicetree/bindings/sound/mt6359.yaml     |   68 +
 sound/soc/codecs/Kconfig                      |    8 +
 sound/soc/codecs/Makefile                     |    2 +
 sound/soc/codecs/mt6359.c                     | 2737 +++++++++++++++++
 sound/soc/codecs/mt6359.h                     | 2640 ++++++++++++++++
 5 files changed, 5455 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/mt6359.yaml
 create mode 100644 sound/soc/codecs/mt6359.c
 create mode 100644 sound/soc/codecs/mt6359.h

-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
