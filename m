Return-Path: <SRS0=8MWw=JJ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F4FAC433B4
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Apr 2021 11:19:27 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D619C61352
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Apr 2021 11:19:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D619C61352
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=qalren6fTpMimUsZQ1BKWSYLsxGbLwaN5Ka0k4q6sEs=; b=ATEuAFDlYRNUUYj07eEPvHMwdm
	QGG5y1FiC968A+BfUHT7R+GCSb5LMh9MYqfmW38uG8RmzLS/cOk2l06WJnygYRI9Dd2O12UcsJ9Oj
	GqMydivDPFRgwsoPWqrCMt8aAP2/TANasBmcgqnqjJVY30QAE26HUAB/NoK/X82OoPOG2viCE1RyV
	0Gp/2nQMpvHfqjtv39Sxgb6DlNmaC1D/s0CPzrHTI8bGemJj0d4VEUY4VDAxY94W9dWuFt76UUTx0
	YQrseKhutjrYOczsQTSk+qufdA0gsvoiZoMykExrYMKhIwr1aSxnYrcomuOlfA4yuuLIi7wc7el8n
	MVJwksUw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lVub3-006WD3-2z; Mon, 12 Apr 2021 11:19:13 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lVuap-006WAM-JC; Mon, 12 Apr 2021 11:18:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=LZhGOzqBvwz6tfNPELszOuHftEpgOuOkc4tK0XX4+7I=; b=nOpIgUafqafjOFQEuxzfo4YEQn
 d2tM9nmRH5FZyuo/zoFFfSykfds5FzJ71j3IbARCl70O3UcR8lJMqHh5TYrYpODk0YIlhaiWvZusl
 DmXsFWSotXVqVxQp2g159+g94lYO/2mPf6ghQlZ+/Solu72QD873gP+QimEWZRllbKRAoEk1TC2fs
 VqW4sEEfilCv9GOLUtviho1UqxSKER9jNl7hDPAACDNrgkolF+SB+gkp8k6zHk/xfFXe3EBGwNo2w
 VFD6A7x9WOKQP7qgRUkEhe2mT6DyG4tyuBemrAJSZl7/xLx3OR6oR9xuNbyyLrYRO4oXp7dg5mHFA
 t/0GsSlg==;
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lVuam-006AFT-JW; Mon, 12 Apr 2021 11:18:57 +0000
X-UUID: cf364444dbc3423698245307c92099b6-20210412
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=LZhGOzqBvwz6tfNPELszOuHftEpgOuOkc4tK0XX4+7I=; 
 b=utRfNsx4zpXiTVy3RprOgSnSndLFtY+caslQaA4Oiaseq1vKuZNw/3tQ4hI7abKs4SQZT/pbWeRga0A+GHGiRI26HmkRb/DsEkTbm/gi8CGGOGZCOt+2zIwDEFzGupAmwWJjl2HvBLHrE2ILLX2ae8OyPLadNLEuoFq/5VhBiDk=;
X-UUID: cf364444dbc3423698245307c92099b6-20210412
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <yongqiang.niu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 659944570; Mon, 12 Apr 2021 04:18:54 -0700
Received: from mtkmbs08n2.mediatek.inc (172.21.101.56) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 12 Apr 2021 04:18:52 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs08n2.mediatek.inc (172.21.101.56) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 12 Apr 2021 19:18:47 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 12 Apr 2021 19:18:46 +0800
From: Yongqiang Niu <yongqiang.niu@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
CC: Rob Herring <robh+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, "David
 Airlie" <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Jassi Brar
 <jassisinghbrar@gmail.com>, Yongqiang Niu <yongqiang.niu@mediatek.com>,
 Fabien Parent <fparent@baylibre.com>, Dennis YC Hsieh
 <dennis-yc.hsieh@mediatek.com>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v2,
 0/5] Revert "mailbox: mediatek: remove implementation related to
 atomic_exec"
Date: Mon, 12 Apr 2021 19:18:40 +0800
Message-ID: <1618226325-31927-1-git-send-email-yongqiang.niu@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
MIME-Version: 1.0
X-TM-SNTS-SMTP: 389E8F4DE8E8662A451C1C9F583FBEB83B881827185D9C0ABC3A443A8DB4570F2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210412_041856_668946_B8A1C15A 
X-CRM114-Status: UNSURE (   9.26  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

This series base linux 5.12-rc2
these patches will cause home ui flick when cursor moved,
there is no fix solution yet, revert these patches first.

change since v1:
add mtk-gce.txt and dts modification

Yongqiang Niu (5):
  Revert "drm/mediatek: Make sure previous message done or be aborted
    before send"
  Revert "mailbox: mediatek: remove implementation related to
    atomic_exec"
  Revert "dt-bindings: mailbox: mtk-gce: fix incorrect mbox-cells value"
  Revert "arm64: dts: mediatek: mt8183: fix gce incorrect mbox-cells
    value"
  arm64: dts: mediatek: mt8183: add gce information for mmsys

 .../devicetree/bindings/mailbox/mtk-gce.txt        |  2 +-
 arch/arm64/boot/dts/mediatek/mt8183.dtsi           |  5 +-
 drivers/gpu/drm/mediatek/mtk_drm_crtc.c            |  1 -
 drivers/mailbox/mtk-cmdq-mailbox.c                 | 80 +++++++++++++++++++---
 4 files changed, 76 insertions(+), 12 deletions(-)

-- 
1.8.1.1.dirty
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
