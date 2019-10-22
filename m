Return-Path: <SRS0=62P0=YP=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5D9DCA9EA0
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Oct 2019 03:55:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9597021783
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Oct 2019 03:55:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="IHOXd6m+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9597021783
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ldJyeFrybgIdpPgepBIuW44t2BZ0Jh2HnHC6g2fztK0=; b=IHOXd6m++qDqG9
	KL3/R/cm3PVDN7rFGdSPdI3dWPadApM+x3u2FG43k2yD2Je7gJcWfA+h7ebb4f24YVlDLSWDfAi0R
	kLteO3P9ut/G0jeZcVyX+f4uXoM6NW7CO59Sv2Ny5ZECyp8RFxjYAmcpl+w455v6HXz8VZiIZ1vr+
	3Y2her/871ooQX2cA+3FUY4Cc3LSiLf1poNPtg/DGiOwJxzRa5jEV8K2DfNIQoCwUF/uL63ebuEFX
	OXGeXPsWP8azbXNbmfyj7S7JhGpJ6KfHBdfb+oNnwM2+xZ93GnA7Dm+d690gnVdmuAUlKysp0vqa2
	DYPJoQFIsm7+mg0Cymbg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iMlGO-0000Rc-Sf; Tue, 22 Oct 2019 03:55:16 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iMlG1-0007QB-Je; Tue, 22 Oct 2019 03:54:55 +0000
X-UUID: 0d100ba241454bb082961564c9aa21a5-20191021
X-UUID: 0d100ba241454bb082961564c9aa21a5-20191021
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <anthony.huang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1344912944; Mon, 21 Oct 2019 19:55:00 -0800
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Mon, 21 Oct 2019 20:54:44 -0700
Received: from mtkcas09.mediatek.inc (172.21.101.178) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Tue, 22 Oct 2019 11:54:43 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas09.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via
 Frontend Transport; Tue, 22 Oct 2019 11:54:43 +0800
From: Anthony Huang <anthony.huang@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Subject: [RFC PATCH 0/2] Add Mediatek MMDVFS driver
Date: Tue, 22 Oct 2019 11:51:51 +0800
Message-ID: <1571716313-10215-1-git-send-email-anthony.huang@mediatek.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191021_205453_646496_77DECD0A 
X-CRM114-Status: GOOD (  10.77  )
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
Cc: devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 wsd_upstream@mediatek.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

This RFC patch adds the Mediatek MMDVFS(Multimedia Dynamic Voltage and
Frequency Scaling) driver. The multimedia HWs, such as display, camera,
share the same power supplier, and on some platforms, they share the
same clock MUX. If each HW needs different clock frequency at the same
time, the clock MUX must be set to the clock source which can meet the
highest required clock frequency.

Following implementation is used to achieve the goal. There are OPP tables
for all the clock MUXs for MM HWs defined in DTS, ant these OPP tables have
the same number of levels. The MMDVFS registers the regulator callback and
the MM HWs can get available clock frequencies from OPP tables and set
corresponding voltage by regulor API. The MMDVFS's callback will be
triggered if the voltage is changed and this voltage represents the highest
required OPP level. The MMDVFS has a mapping table: which clock source
should be set to each clock MUX for every OPP level. So all the clock MUXs
will be set to the clock sources according to the current OPP level in the
MMDVFS's regulator callback.



Anthony Huang (2):
  dt-bindings: soc: mediatek: Add document for mmdvfs driver
  soc: mediatek: Add mtk-mmdvfs driver

 .../devicetree/bindings/soc/mediatek/mmdvfs.txt    |  149 ++++++++++
 drivers/soc/mediatek/Kconfig                       |    9 +
 drivers/soc/mediatek/Makefile                      |    1 +
 drivers/soc/mediatek/mtk-mmdvfs.c                  |  313 ++++++++++++++++++++
 4 files changed, 472 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/soc/mediatek/mmdvfs.txt
 create mode 100644 drivers/soc/mediatek/mtk-mmdvfs.c

-- 
1.7.9.5

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
