Return-Path: <SRS0=gG0U=EF=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DEE9DC55179
	for <linux-mediatek@archiver.kernel.org>; Fri, 30 Oct 2020 09:13:54 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 674A820728
	for <linux-mediatek@archiver.kernel.org>; Fri, 30 Oct 2020 09:13:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="YC+TnIb+";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="MNkCmVcT"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 674A820728
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=67+d30n8mgzS0vvw+mMDmFhwj3EOEqUCm5du1nVD4HQ=; b=YC+TnIb+raPj4cXuTG2qyJXfGa
	ST6ehhdbH5OYrGDP1yK7v8mZ+NOifG9nfGduzuZUdIrJE82dn6omEK+uhYuRv/wRpTZotfeJQbzQL
	27UUUeupvP2XEID0krpOXzL0tsYUSSzR4o66JGjz5ivym5EAtZ8kXdUbo3aK8HqeTBY7UX8Pdhd4X
	KxSnq3WfvLsa/ZFWjxYThio1SiDaAQ/T1Y+KRRcNNRM/dJQ4QJ6DV8jiN6elysWvC441Kx7/asV/z
	c9zNTj4YQBklxd9nQbGdjLsxMs3DDKKHcGTeO7xzx1KUTe1a+YvGleOwUoLFBzmtMWo7nBd3E5IF3
	tExiMRJw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kYQTd-0004kH-95; Fri, 30 Oct 2020 09:13:41 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kYQTX-0004hZ-5r; Fri, 30 Oct 2020 09:13:36 +0000
X-UUID: 0643696ef5404aef92e023bb45c5c85d-20201030
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=ZpW9Nn3WTF72bsEP3pngt8VigIg6cPhwRlY9GBZBlXw=; 
 b=MNkCmVcTh7UKdYOX/HSUntPfTNAnZfHwST9yaeDdqJVwl3G8XhPDmTVidnhf3FhkHPw4wtybR2xJ8RnbCNR13cQ8AegY7Ti2U/mDebc15ff21wVzI7gvLYzSa8I3CCQwiNlY92Q2lNh5EhZvAMFrXbEEdFAM5sJ8URfs4OvP8cw=;
X-UUID: 0643696ef5404aef92e023bb45c5c85d-20201030
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <yong.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1465273056; Fri, 30 Oct 2020 01:13:17 -0800
Received: from mtkmbs08n2.mediatek.inc (172.21.101.56) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 30 Oct 2020 02:13:15 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs08n2.mediatek.inc (172.21.101.56) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 30 Oct 2020 17:13:13 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 30 Oct 2020 17:13:12 +0800
From: Yong Wu <yong.wu@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Krzysztof Kozlowski
 <krzk@kernel.org>, Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v4 0/3] MT8192 SMI support
Date: Fri, 30 Oct 2020 17:12:51 +0800
Message-ID: <20201030091254.26382-1-yong.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-TM-SNTS-SMTP: 3C519A5FD6F45B54AFFDD85386FD1928BE0CBF7344F9190F98C31982F514EB482000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201030_051335_377253_DCC2E50F 
X-CRM114-Status: GOOD (  11.36  )
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
Cc: youlin.pei@mediatek.com, devicetree@vger.kernel.org,
 Nicolas Boichat <drinkcat@chromium.org>, srv_heupstream@mediatek.com,
 Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
 linux-kernel@vger.kernel.org, Tomasz Figa <tfiga@google.com>,
 iommu@lists.linux-foundation.org, linux-mediatek@lists.infradead.org,
 yong.wu@mediatek.com, ming-fan.chen@mediatek.com, anan.sun@mediatek.com, Will
 Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

This patchset mainly adds SMI support for mt8192.

It comes from the patchset[1]. I seperate the smi part into this patchset.
And the two part(IOMMU/SMI) patchset don't depend on each other.

Rebase on v5.10-rc1.

changenote:
 v4: add if-then segment in the binding.

 v3: [1].

[1] https://lore.kernel.org/linux-iommu/20200930070647.10188-1-yong.wu@mediatek.com/

Yong Wu (3):
  dt-bindings: memory: mediatek: Convert SMI to DT schema
  dt-bindings: memory: mediatek: Add mt8192 support
  memory: mtk-smi: Add mt8192 support

 .../mediatek,smi-common.txt                   |  50 ------
 .../mediatek,smi-common.yaml                  | 142 ++++++++++++++++++
 .../memory-controllers/mediatek,smi-larb.txt  |  50 ------
 .../memory-controllers/mediatek,smi-larb.yaml | 131 ++++++++++++++++
 drivers/memory/mtk-smi.c                      |  19 +++
 5 files changed, 292 insertions(+), 100 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/memory-controllers/mediatek,smi-common.txt
 create mode 100644 Documentation/devicetree/bindings/memory-controllers/mediatek,smi-common.yaml
 delete mode 100644 Documentation/devicetree/bindings/memory-controllers/mediatek,smi-larb.txt
 create mode 100644 Documentation/devicetree/bindings/memory-controllers/mediatek,smi-larb.yaml

-- 
2.18.0

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
