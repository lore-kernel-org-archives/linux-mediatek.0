Return-Path: <SRS0=Rw5Z=YR=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BCBEBCA9EBC
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Oct 2019 05:29:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7F49120856
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Oct 2019 05:29:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="irGUihaQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7F49120856
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=rX0sJzPlk3kEou+mieOXqKdpNJVIm9lG0NAXZBHcvOc=; b=irGUihaQoqgsxU
	jiuDuCLIDY96t18Ss+b09zpc4lvOSDfoDYaSVAhulPI3YjDgZVO+RoHlG+CvxHSHd23KuN4j7n0lD
	p7L1mJsurWsu52eR0a7TH3D/mQ9XcqrMTpcfUhzXy2N4upXjNK/U9ZDnM4+H0ajAm7ruCPNL0e25f
	ltfmzbDEmTK8FOKwYHs0tPv9AJ8kRmMaKPdCkeZE69vtY4USCbJUyXc9QIP922Rxe8SDrSHCtxGqp
	BbEEnBKeaQe+fjShfwtOITMWF/1W5wUmwVibT4aPqydTaVD/BjRuDyQZgf3PmMZXY0Jg6Dx05DXY7
	tsMy3ABma/lBjl1W+Q6w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iNVgh-00023z-Kp; Thu, 24 Oct 2019 05:29:31 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iNVfI-0000es-VC; Thu, 24 Oct 2019 05:28:06 +0000
X-UUID: 2b6094a2c91d4a05861599a6159e27e5-20191023
X-UUID: 2b6094a2c91d4a05861599a6159e27e5-20191023
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <bibby.hsieh@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 662657021; Wed, 23 Oct 2019 21:27:52 -0800
Received: from mtkmbs08n2.mediatek.inc (172.21.101.56) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Wed, 23 Oct 2019 22:27:40 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs08n2.mediatek.inc (172.21.101.56) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Thu, 24 Oct 2019 13:27:31 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via
 Frontend Transport; Thu, 24 Oct 2019 13:27:33 +0800
From: Bibby Hsieh <bibby.hsieh@mediatek.com>
To: Jassi Brar <jassisinghbrar@gmail.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>, CK HU
 <ck.hu@mediatek.com>
Subject: [PATCH v16 0/5] support gce on mt8183 platform
Date: Thu, 24 Oct 2019 13:27:27 +0800
Message-ID: <20191024052732.7767-1-bibby.hsieh@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-TM-SNTS-SMTP: B039364EEA4D0CD98FA660FC5F352C786E5CD3E32FC419F5E3E4B8E5AE8D9CE92000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191023_222805_064047_6F9A19E0 
X-CRM114-Status: UNSURE (   6.73  )
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
Cc: devicetree@vger.kernel.org, Nicolas Boichat <drinkcat@chromium.org>,
 srv_heupstream@mediatek.com, linux-kernel@vger.kernel.org,
 Houlong Wei <houlong.wei@mediatek.com>,
 Dennis-YC Hsieh <dennis-yc.hsieh@mediatek.com>,
 linux-mediatek@lists.infradead.org, Bibby Hsieh <bibby.hsieh@mediatek.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Changes since v15:
 - rebase onto 5.4-rc1
 - rollback the v14 change
 - add a patch to fixup the combination of return value

Changes since v14:
 - change input argument as pointer in append_commend()

Changes since v13:
 - separate poll function as poll w/ & w/o mask function
 - directly pass inst into append_command function instead
   of returns a pointer
 - fixup coding style
 - rebase onto 5.3-rc1

[... snip ...]

Bibby Hsieh (5):
  soc: mediatek: cmdq: remove OR opertaion from err return
  soc: mediatek: cmdq: define the instruction struct
  soc: mediatek: cmdq: add polling function
  soc: mediatek: cmdq: add cmdq_dev_get_client_reg function
  arm64: dts: add gce node for mt8183

 arch/arm64/boot/dts/mediatek/mt8183.dtsi |  10 ++
 drivers/soc/mediatek/mtk-cmdq-helper.c   | 146 +++++++++++++++++++----
 include/linux/mailbox/mtk-cmdq-mailbox.h |  11 ++
 include/linux/soc/mediatek/mtk-cmdq.h    |  53 ++++++++
 4 files changed, 194 insertions(+), 26 deletions(-)

-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
