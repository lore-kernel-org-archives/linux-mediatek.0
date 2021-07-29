Return-Path: <SRS0=Fikf=MV=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1CC8C4338F
	for <linux-mediatek@archiver.kernel.org>; Thu, 29 Jul 2021 15:53:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AA74960F4A
	for <linux-mediatek@archiver.kernel.org>; Thu, 29 Jul 2021 15:53:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org AA74960F4A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=cdlA2p3YVGt9AsCWFE33bOg2ELK5Hy7s5mSkVfdTiCo=; b=0KCnzp1L9twDAI
	NzTv6vV2GMFHe/KErRNN2BKtJEdNKJDgafWGkYPdZHO5Q9+S1W6oaaR+VC2ieqyRnSpOrrsMWgb2c
	7vO8B1BjTuQfeItAY7lS4VldcmT9lY2hCLUTqUHhpq60GM5MZyBP/gq+QuK6LvUqXXP+Y8sZOF5Ll
	8a9a+fy+UbN5nPDenZdig+RfN5WZiu1xsZdmE1DDyvaQ3devXOGLD2BXdx/vtRJlOgsJm+oGcbuEv
	yeK6SU9Er8cQC5PZqvobB5nahX0owVwFi/7c/QxRlvwwb0u70ojJtEAqdujfCSV0HTalzRmjr19WR
	LUxkmfTxgZ9LzZn+n76Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m98LH-004qAO-1r; Thu, 29 Jul 2021 15:53:03 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m98Hv-004ovX-Ok; Thu, 29 Jul 2021 15:49:37 +0000
X-UUID: e57c1c45f70640cbbec14d85693d8cb1-20210729
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=WClhs43DmyVmm3C8jwFFVyKJczegUKcZatifDzsfyqs=; 
 b=eLwXUEczumHci+K27gyH5734E0PMLQC87z7UoVXU+82gp19/PE0oNxRUGBDcuLRU3BXc29uyhkxFlr3Vu/s+aM/SFfERaK54NFh/2iekNJn7vfqPGtVgMEZan75lyviizHKeukAVZcWObcIVZBPfOD42fw+eznk9v3QyaaHOl4I=;
X-UUID: e57c1c45f70640cbbec14d85693d8cb1-20210729
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <jason-jh.lin@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 177167699; Thu, 29 Jul 2021 08:49:23 -0700
Received: from MTKMBS02N1.mediatek.inc (172.21.101.77) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 29 Jul 2021 08:49:21 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs02n1.mediatek.inc (172.21.101.77) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 29 Jul 2021 23:49:13 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 29 Jul 2021 23:49:13 +0800
From: jason-jh.lin <jason-jh.lin@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Enric Balletbo Serra
 <eballetbo@gmail.com>
CC: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Matthias
 Brugger <matthias.bgg@gmail.com>, Fabien Parent <fparent@baylibre.com>,
 <jason-jh.lin@mediatek.com>, Jitao shi <jitao.shi@mediatek.com>,
 <fshao@chromium.org>, <nancy.lin@mediatek.com>, <singo.chang@mediatek.com>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH v2 0/5] add mt8195 SoC DRM binding
Date: Thu, 29 Jul 2021 23:49:07 +0800
Message-ID: <20210729154912.20051-1-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210729_084935_884253_E8D85737 
X-CRM114-Status: UNSURE (   9.14  )
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

Change in v2:
- add power-domain property into mediatek,mmsys.yaml
  and modify commit message.

jason-jh.lin (5):
  dt-bindings: arm: mediatek: mmsys: add mt8195 SoC binding
  dt-bindings: mediatek: display: Change format to yaml
  dt-bindings: mediatek: display: add MERGE additional description
  dt-bindings: mediatek: add mediatek,dsc.yaml for mt8195 SoC binding
  dt-bindings: mediatek: display: add mt8195 SoC binding

 .../bindings/arm/mediatek/mediatek,mmsys.yaml |   8 +
 .../display/mediatek/mediatek,disp.txt        | 219 ---------
 .../display/mediatek/mediatek,disp.yaml       | 464 ++++++++++++++++++
 .../display/mediatek/mediatek,dsc.yaml        |  73 +++
 4 files changed, 545 insertions(+), 219 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,disp.txt
 create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,disp.yaml
 create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,dsc.yaml

-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
