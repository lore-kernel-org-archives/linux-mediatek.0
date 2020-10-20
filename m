Return-Path: <SRS0=YCpt=D3=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9D57C433E7
	for <linux-mediatek@archiver.kernel.org>; Tue, 20 Oct 2020 10:07:53 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3A27522253
	for <linux-mediatek@archiver.kernel.org>; Tue, 20 Oct 2020 10:07:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="aemAVLuH";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="oWV03C56"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3A27522253
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=qEZ//vhRyoF/VodGIkCIrPagrWgiwcZcdyagvfe/wjE=; b=aemAVLuHhtBp+nufuz+BzI4pzb
	vjHcuB8kZxYPxBzgdrdSvkQOECCC433YHEzUAU9jcmA7nS5pb3CTtb1vPwtD7wTb87idrr2lzgUC9
	yZfGZCe+7MRQRAeNTSLvrUqaTqtBd3xSYg20dCHZvzl//etkcz35FYygoMMrSEAsEAEMnuLOztgDT
	KGVFJqHpVsHjy0CoRGfzuTnRo+xlVLJ7vJ8ot7TbAdqtogYhT8jTNul0tawSpjEPB46CwiAcm/mdQ
	VdO9xNxglAK+AMD2+N3/EDETH+q256o3/BZIpxhUCZQj96GuL8BAq4JdSrbtJSQZ57sgDwGQQseqU
	20X5rC4g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kUoYS-00077H-Fm; Tue, 20 Oct 2020 10:07:44 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kUoYI-00073q-5y; Tue, 20 Oct 2020 10:07:35 +0000
X-UUID: 26160901479a4d1aa4da03a0887d78e8-20201020
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=d/NOO1/ZvVrjHEZtoazU2Jh5NKFcbgFkHExmk+6HUCk=; 
 b=oWV03C56Qa6itfZmc7SlkJk0hgKBxbdvpIPkcGqsi+C1e4QX7jqOVIfAqXT4Ns4R4D8TQL8pE08r6ez7kk21zock0ephtmaElULJyU9/IzkY6WMuLv+7HPzaZMXI17ejcAIWagZ4P+mf464ZEZikDeoDri0P3Bz3Vff3bnaCex4=;
X-UUID: 26160901479a4d1aa4da03a0887d78e8-20201020
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <hsin-hsiung.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 551217987; Tue, 20 Oct 2020 02:07:29 -0800
Received: from mtkmbs05n1.mediatek.inc (172.21.101.15) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 20 Oct 2020 02:57:26 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs05n1.mediatek.inc (172.21.101.15) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 20 Oct 2020 17:57:24 +0800
Received: from mtksdaap41.mediatek.inc (172.21.77.4) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Tue, 20 Oct 2020 17:57:25 +0800
From: Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, "Rob
 Herring" <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
 Stephen Boyd <sboyd@kernel.org>
Subject: [PATCH v2 0/3] Add support for MT6315 regulator
Date: Tue, 20 Oct 2020 17:56:47 +0800
Message-ID: <1603187810-30481-1-git-send-email-hsin-hsiung.wang@mediatek.com>
X-Mailer: git-send-email 2.6.4
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201020_060734_451182_D811118C 
X-CRM114-Status: GOOD (  14.06  )
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
Cc: devicetree@vger.kernel.org, srv_heupstream@mediatek.com,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, Hsin-Hsiung
 Wang <hsin-hsiung.wang@mediatek.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

This patch series add support for MediaTek PMIC MT6315 regulator driver,
which adds MT6315 related buck voltage data to the driver.

changes since v1:
- update binding document in DT schema format.
- add mtk,combined-regulator properity to show the relationship of MT6315 bucks.
- ignore the regulator registration of combined buck in probe.

Hsin-Hsiung Wang (3):
  spmi: Add driver shutdown support
  dt-bindings: regulator: document binding for MT6315 regulator
  regulator: mt6315: Add support for MT6315 regulator

 .../regulator/mtk,mt6315-regulator.yaml       |  88 +++++
 drivers/regulator/Kconfig                     |  10 +
 drivers/regulator/Makefile                    |   1 +
 drivers/regulator/mt6315-regulator.c          | 364 ++++++++++++++++++
 drivers/spmi/spmi.c                           |   9 +
 include/dt-bindings/regulator/mtk,mt6315.h    |  17 +
 include/linux/regulator/mt6315-regulator.h    |  37 ++
 include/linux/spmi.h                          |   1 +
 8 files changed, 527 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/regulator/mtk,mt6315-regulator.yaml
 create mode 100644 drivers/regulator/mt6315-regulator.c
 create mode 100644 include/dt-bindings/regulator/mtk,mt6315.h
 create mode 100644 include/linux/regulator/mt6315-regulator.h

-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
