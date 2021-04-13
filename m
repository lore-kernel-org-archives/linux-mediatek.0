Return-Path: <SRS0=dZqu=JK=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5990CC433B4
	for <linux-mediatek@archiver.kernel.org>; Tue, 13 Apr 2021 05:58:24 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B6F956102A
	for <linux-mediatek@archiver.kernel.org>; Tue, 13 Apr 2021 05:58:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B6F956102A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=TM5tebarkom3Jsb76XqyCY2ZKsWrnTQkNcnwhgOjm9U=; b=JDR5Z3Q9y8mmdtHTfoGdykf4dt
	eCLOsIRQn3mhroADXSWZdVpsw7hehOOhrSzHRzv1DxS6oC1kOBnsTvKJrIC6duRRyTI9Q/fZ5SLDM
	WGo9P5NxXD4bvvT2q4Jz+b8V8uKbc3r/gXtF6Qoyw2dKlYGBKKeYGzRaukRUfUzbMXOiXb0zbBo8+
	38r7k/YHDNjpbvYRXDGAIBv45gmMw9i2Q0YEDv5f0bkH1/FVgv5wl2yq5xmcMM6nHq9yEhFRhWq7z
	+1kT1rtclKv3i5bAjlvUN6emVt8EHr3B9EfvSYT+fhQl9wIVgUNZ8NC1XYdbuPh1HNzFmWcP+15ej
	ktqkyi1w==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lWC3s-008KdV-2j; Tue, 13 Apr 2021 05:58:08 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lWC3P-008Ka3-L6; Tue, 13 Apr 2021 05:57:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=A8CfPk1QUOVL+/LqXRDCzc9wcn31FrQzWbb99W4KGGA=; b=4WhF43Q9UZ3n2t19lL9skHl/pB
 4NCExA0FSAt1MG/HtQZpWKVptjro+YRH1aLsdjTE9D98ltgZKQkhMVjLpfpnhyq6okgFsYgpggf3y
 mq2lNq/3Vx6pMkXECRNXNN96mRRJT6dUt3J4ve3K1RC3TLgDei4a4hNYn/9sIqnpst2sJmZya5D5d
 C0AbkxKJoJwP+UT7lA6k6pWBujG7i3enroiWOQaVCYchXOuSTiedwaNu2PY+mJj7cP7hi9iKSC7XW
 QYA6J32sXymQFRgUnMLblSqqpAcjgpVm93+o5XcmD+r8BdJDuBtcoZH3tVooc7aw4d6lXBe8JLqUC
 ywjIZfEA==;
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lWC3M-006krG-1b; Tue, 13 Apr 2021 05:57:37 +0000
X-UUID: 0e3572e158c44eaba9fef6a900431ced-20210412
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=A8CfPk1QUOVL+/LqXRDCzc9wcn31FrQzWbb99W4KGGA=; 
 b=fpk3EAx4PvzuIrs6wIoB24t+QNM+NCjmCOiBiTYKN1xEqHDoqRfaHnAPiD189NHeN+rMEi2elDFZtOA+XbYPRg1OEY8DJDg+GJph/JWF1/aHqTrSy9vRo7eMM01CRSoEzz/NIbozSuD13YIvEtJqgiJfFZsUaiUnHY4tHiXUvsI=;
X-UUID: 0e3572e158c44eaba9fef6a900431ced-20210412
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <zhiyong.tao@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1212071293; Mon, 12 Apr 2021 22:57:28 -0700
Received: from MTKMBS06N2.mediatek.inc (172.21.101.130) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 12 Apr 2021 22:57:26 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs06n2.mediatek.inc (172.21.101.130) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 13 Apr 2021 13:57:24 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 13 Apr 2021 13:57:17 +0800
From: Zhiyong Tao <zhiyong.tao@mediatek.com>
To: <robh+dt@kernel.org>, <linus.walleij@linaro.org>, <mark.rutland@arm.com>, 
 <matthias.bgg@gmail.com>, <sean.wang@kernel.org>
CC: <srv_heupstream@mediatek.com>, <zhiyong.tao@mediatek.com>,
 <hui.liu@mediatek.com>, <eddie.huang@mediatek.com>, <jg_poxu@mediatek.com>,
 <biao.huang@mediatek.com>, <hongzhou.yang@mediatek.com>,
 <sean.wang@mediatek.com>, <seiya.wang@mediatek.com>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <linux-gpio@vger.kernel.org>
Subject: [PATCH v4 0/4] Mediatek pinctrl patch on mt8195 
Date: Tue, 13 Apr 2021 13:56:58 +0800
Message-ID: <20210413055702.27535-1-zhiyong.tao@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-TM-SNTS-SMTP: 21E050DD13335117A7EE9990F0D01491D1407F993EF8BB83AEC83DF0538430662000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210412_225736_118710_D1786BD4 
X-CRM114-Status: UNSURE (   9.54  )
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

This series includes 4 patches:
1.add pinctrl file and inding document on mt8195.
2.add pinctrl driver on MT8195.
3.add pinctrl drive for I2C related pins on MT8195.
4.add pinctrl rsel setting on MT8195.

Changes in patch v4:
1)fix pinctrl-mt8195.yaml warning error.
2)remove pinctrl device node patch which is based on "mt8195.dtsi".

Changes in patch v3:
1)change '^pins' to '-pins$'.
2)change 'state_0_node_a' to 'gpio_pin' which is defined in dts.
3)change 'state_0_node_b' to 'i2c0_pin' which is defined in dts.
4)reorder this series patches. change pinctrl file and binding document
together in one patch.

There are no changes in v1 & v2.

Zhiyong Tao (4):
  dt-bindings: pinctrl: mt8195: add pinctrl file and binding document
  pinctrl: add pinctrl driver on mt8195
  pinctrl: add drive for I2C related pins on MT8195
  pinctrl: add rsel setting on MT8195

 .../bindings/pinctrl/pinctrl-mt8195.yaml      |  151 ++
 drivers/pinctrl/mediatek/Kconfig              |    6 +
 drivers/pinctrl/mediatek/Makefile             |    1 +
 drivers/pinctrl/mediatek/pinctrl-mt8195.c     |  872 +++++++++
 .../pinctrl/mediatek/pinctrl-mtk-common-v2.c  |   28 +
 .../pinctrl/mediatek/pinctrl-mtk-common-v2.h  |   15 +
 drivers/pinctrl/mediatek/pinctrl-mtk-mt8195.h | 1669 +++++++++++++++++
 drivers/pinctrl/mediatek/pinctrl-paris.c      |   16 +
 include/dt-bindings/pinctrl/mt8195-pinfunc.h  |  962 ++++++++++
 9 files changed, 3720 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/pinctrl-mt8195.yaml
 create mode 100644 drivers/pinctrl/mediatek/pinctrl-mt8195.c
 create mode 100644 drivers/pinctrl/mediatek/pinctrl-mtk-mt8195.h
 create mode 100644 include/dt-bindings/pinctrl/mt8195-pinfunc.h

--
2.18.0

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
