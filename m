Return-Path: <SRS0=rC0f=3F=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFDA1C32771
	for <linux-mediatek@archiver.kernel.org>; Thu, 16 Jan 2020 02:15:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A76EA22522
	for <linux-mediatek@archiver.kernel.org>; Thu, 16 Jan 2020 02:15:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="dJCvjgZQ";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="NDcmPLeS"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A76EA22522
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=86w22g4dL/T3va9I2rnEfeJxjLcDKwXa5ZBNV6Bj5T4=; b=dJCvjgZQssImAH
	fr77fKhZfjh4Lj2Hu/5pMxYPoUYpt1d0OGmVa9U4ia9mTET6ZWHGLAkD7n7ijwMZ3Q2bo1uJPFd6v
	FjgeiWc7Q5qIibqmmjEyBD/EzLeKzq5e7HE3K7ql1FGyeCQHfGtrUNDP+90LySJO9r6zp3Zo7vJ/F
	QBrkzk39ai00f8WpyxM4NOIJfX4MXta5d8zuxEuNRf+Jn2AyG+TW85qQXFSCS/ySXXpGnEyn6CgNG
	Y1Wz/ony20GIA9I1piU5d/TqjgQBVFpm07xyfMiStsI+pJB3ED3WDZK1mKOEqAa3aGqyK+nlI9eEl
	zXkKeA7gpHKTv/giIV0w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1irugw-0005Ce-QK; Thu, 16 Jan 2020 02:15:26 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1irugr-0005Be-Gi
 for linux-mediatek@lists.infradead.org; Thu, 16 Jan 2020 02:15:25 +0000
X-UUID: f4f34ac2bbe44bae91baf5e39457a417-20200115
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=itebPIuvSzJr5GaEJLbLuiRcsXbtJlr3jeWCPIKouLg=; 
 b=NDcmPLeS4vxiBV+bNnaiIBLIyDooLmRfENmSdE0L2PHK0a66PMABxDUrq4ZcBMEaD2oaFT4G0uUfsIHmoomZn50LLzxikwL3l8zWBJkNYU6YWs9LBljXXT77VkJFvhtJWQomm1h2+L7cRhrzSX1a4i48B0TENV9x0C1VI5BzMbk=;
X-UUID: f4f34ac2bbe44bae91baf5e39457a417-20200115
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <jitao.shi@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1342914098; Wed, 15 Jan 2020 18:15:16 -0800
Received: from MTKMBS33N1.mediatek.inc (172.27.4.75) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Wed, 15 Jan 2020 18:16:04 -0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS33N1.mediatek.inc
 (172.27.4.75) with Microsoft SMTP Server (TLS) id 15.0.1395.4;
 Thu, 16 Jan 2020 10:14:05 +0800
Received: from mszsdclx1018.gcn.mediatek.inc (10.16.6.18) by
 MTKCAS36.mediatek.inc (172.27.4.170) with Microsoft SMTP Server id
 15.0.1395.4 via Frontend Transport; Thu, 16 Jan 2020 10:14:17 +0800
From: Jitao Shi <jitao.shi@mediatek.com>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg
 <sam@ravnborg.org>, David Airlie <airlied@linux.ie>, Daniel Vetter
 <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v9 0/5] add driver for "boe, tv101wum-nl6", "boe, tv101wum-n53",
 "auo, kd101n80-45na" and "auo, b101uan08.3" panels
Date: Thu, 16 Jan 2020 10:15:06 +0800
Message-ID: <20200116021511.22675-1-jitao.shi@mediatek.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-TM-SNTS-SMTP: A0E5360FFACF32C65E5C1E5739A8C19C64DF2CF0A8C3537E6D2C6A9245318FA22000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200115_181521_564514_A3959D20 
X-CRM114-Status: UNSURE (   8.23  )
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

Changes since v8:
 - merge the panel documents to one.
 - delay move the drm_panel_of_backlight after drm_panel_init

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

Jitao Shi (5):
  dt-bindings: display: panel: Add boe tv101wum-n16 panel bindings
  drm/panel: support for boe tv101wum-nl6 wuxga dsi video mode panel
  drm/panel: support for auo,kd101n80-45na wuxga dsi video mode panel
  drm/panel: support for boe,tv101wum-n53 wuxga dsi video mode panel
  drm/panel: support for auo,b101uan08.3 wuxga dsi video mode panel

 .../display/panel/boe,tv101wum-nl6.yaml       |  81 ++
 drivers/gpu/drm/panel/Kconfig                 |   9 +
 drivers/gpu/drm/panel/Makefile                |   1 +
 .../gpu/drm/panel/panel-boe-tv101wum-nl6.c    | 854 ++++++++++++++++++
 4 files changed, 945 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/boe,tv101wum-nl6.yaml
 create mode 100644 drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c

-- 
2.21.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
