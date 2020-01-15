Return-Path: <SRS0=47E0=3E=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01B9AC3F68F
	for <linux-mediatek@archiver.kernel.org>; Wed, 15 Jan 2020 14:01:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CA3BC2467C
	for <linux-mediatek@archiver.kernel.org>; Wed, 15 Jan 2020 14:01:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ngsuN9AD";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="LWjHoDhy"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CA3BC2467C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Fdi3g4QWgK1Hvlx7oI6b1bO3gne3Kg3fDaoiXZKxcCE=; b=ngsuN9ADSUmdlu
	QdFcfdzCbU9NdmhEpPfd5qkVVVJbUSwZGuXUU5YPT8tej6OQEoKBounj70FcJGrdoM4BgGZq0RkcL
	BlrTgbL+eLSXLHzOhwuheHx8H5UGetUFTeuvKrC2rjfaGrpzr9XkUoKBGPYylQAqulfYDJo43WiyT
	NQyZd0LNTwNEjqW7IVqk6tK9MUKxJYcnFK8+CyhfKqWKpl05mZrGpaM1z/9bHA6t+NQH5Lx8RwtdR
	YOq5/WCzmlT9gj/7xgTGi4+3DckOz2e6vulfYzKESpSIBBshV+1LphwlAJiub0cy9Aea/vvPVe7Nm
	5dbgyx5vsSxjYbs7/SfA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1irjEI-0003vw-Nm; Wed, 15 Jan 2020 14:01:06 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1irjEC-0003uJ-3d
 for linux-mediatek@lists.infradead.org; Wed, 15 Jan 2020 14:01:04 +0000
X-UUID: 6e4504113bfd4d4086e494d218e60f56-20200115
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=iqI0/BExz5+Ja7rS3jk0iIZb9us1L2XdgWD3khlwGTc=; 
 b=LWjHoDhyXr0y9XU2gzGe72pGrxYp8ZrRRXLFa+62qWdBtL7esNLE/JgWYwEFgTWo0aIueIpiwqRTrVDFk4tnevdwnFecproMmHrTf4e+5JYiB/ETcw0Z7dB5IxbuVCk2A7RRfz5aU/HcGs3+q7NA/pFQZwSavkUIoMGhHvVBZNQ=;
X-UUID: 6e4504113bfd4d4086e494d218e60f56-20200115
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <jitao.shi@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1271274059; Wed, 15 Jan 2020 06:00:52 -0800
Received: from MTKMBS33N2.mediatek.inc (172.27.4.76) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Wed, 15 Jan 2020 06:00:51 -0800
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by MTKMBS33N2.mediatek.inc
 (172.27.4.76) with Microsoft SMTP Server (TLS) id 15.0.1395.4;
 Wed, 15 Jan 2020 22:01:15 +0800
Received: from mszsdclx1018.gcn.mediatek.inc (10.16.6.18) by
 MTKCAS32.mediatek.inc (172.27.4.170) with Microsoft SMTP Server id
 15.0.1395.4 via Frontend Transport; Wed, 15 Jan 2020 22:00:58 +0800
From: Jitao Shi <jitao.shi@mediatek.com>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg
 <sam@ravnborg.org>, David Airlie <airlied@linux.ie>, Daniel Vetter
 <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v8 0/8] add driver for "boe, tv101wum-nl6", "boe, tv101wum-n53",
 "auo, kd101n80-45na" and "auo, b101uan08.3" panels
Date: Wed, 15 Jan 2020 21:59:50 +0800
Message-ID: <20200115135958.126303-1-jitao.shi@mediatek.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-TM-SNTS-SMTP: E5D42284C1FC6913D7CA8B057FD34836D64D46B9D57845A57AD5644DF877DD162000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200115_060100_156288_8F75F09B 
X-CRM114-Status: UNSURE (   9.10  )
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
Cc: Jitao Shi <jitao.shi@mediatek.com>, srv_heupstream@mediatek.com,
 stonea168@163.com, cawa.cheng@mediatek.com, linux-mediatek@lists.infradead.org,
 bibby.hsieh@mediatek.com, ck.hu@mediatek.com, yingjoe.chen@mediatek.com,
 eddie.huang@mediatek.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Changes since v7:
 - base drm-misc-next branch
 - fix document pass dt_binding_check
 - remove backlight from panel driver

Changes since v6:
 - fix boe_panel_init err uninit.
 - adjust the delay of backlight on.

Changes since v5:
 - covert the documents to yaml
 - fine tune boe, tv101wum-n53 panel video timine

Changes since v4:
 - add auo,b101uan08.3 panel for this driver.
 - add boe,tv101wum-n53 panel for this driver.

Changes since v3:
 - remove check enable_gpio.
 - fine tune the auo,kd101n80-45na panel's power on timing.

Changes since v2:
 - correct the panel size
 - remove blank line in Kconfig
 - move auo,kd101n80-45na panel driver in this series.

Changes since v1:
 - update typo nl6 -> n16.
 - update new panel config and makefile are added in alphabetically order.
 - add the panel mode and panel info in driver data.
 - merge auo,kd101n80-45a and boe,tv101wum-nl6 in one driver

Jitao Shi (8):
  dt-bindings: display: panel: Add BOE tv101wum-n16 panel bindings
  drm/panel: support for BOE tv101wum-nl6 wuxga dsi video mode panel
  dt-bindings: display: panel: add auo kd101n80-45na panel bindings
  drm/panel: support for auo,kd101n80-45na wuxga dsi video mode panel
  dt-bindings: display: panel: add boe tv101wum-n53 panel documentation
  drm/panel: support for boe,tv101wum-n53 wuxga dsi video mode panel
  dt-bindings: display: panel: add AUO auo, b101uan08.3 panel
    documentation
  drm/panel: support for auo,b101uan08.3 wuxga dsi video mode panel

 .../display/panel/auo,b101uan08.3.yaml        |  74 ++
 .../display/panel/auo,kd101n80-45na.yaml      |  74 ++
 .../display/panel/boe,tv101wum-n53.yaml       |  74 ++
 .../display/panel/boe,tv101wum-nl6.yaml       |  74 ++
 drivers/gpu/drm/panel/Kconfig                 |   9 +
 drivers/gpu/drm/panel/Makefile                |   1 +
 .../gpu/drm/panel/panel-boe-tv101wum-nl6.c    | 854 ++++++++++++++++++
 7 files changed, 1160 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/auo,b101uan08.3.yaml
 create mode 100644 Documentation/devicetree/bindings/display/panel/auo,kd101n80-45na.yaml
 create mode 100644 Documentation/devicetree/bindings/display/panel/boe,tv101wum-n53.yaml
 create mode 100644 Documentation/devicetree/bindings/display/panel/boe,tv101wum-nl6.yaml
 create mode 100644 drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c

-- 
2.21.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
