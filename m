Return-Path: <SRS0=lxeM=EJ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FA95C388F9
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Nov 2020 05:42:43 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 93C2F22277
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Nov 2020 05:42:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="aYncJ09M";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="Y3vj4Z4Y"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 93C2F22277
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=jCB+PPRs7trxuSYgEvo+euQzH+qn/d2mgWGu+S3eiNw=; b=aYncJ09MZvqLNkAPhX0Yb1GbDx
	K2sEEhiG7/Y7R6FH+2jifds4X5odpAJGMcM3Cq4MhVOk1+aq2ylN2oKRER78v2urgEo8hxxshi4og
	5OHVkciVG2/mNr0wVZAjIw7zzayXpUtl1ypE0EzS6BKLH35rDph3jkcYaqfwzNJBH97K/+RUOvpwl
	zSmD7u4TWgW9/GNkVktkBeRajqgQwMsycAjxq9fvVuVOxoUdzCQiWau8H5x/z1awKEZ0Mg8n4t0hi
	PrFC7Cl4Rgf53jq5H+v8dWhJ7R0HHGF/iRa3sCu0wm/HTy7j+DA75Qauys7BsQ9VfvvG79kD+LHlM
	2csrS4/g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kZp5U-0000VZ-Rb; Tue, 03 Nov 2020 05:42:32 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kZp5Q-0000UE-6G; Tue, 03 Nov 2020 05:42:29 +0000
X-UUID: d99f6a947b2b487484f4fb48484fa742-20201102
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=WW0Lmah8IaQQ9ZgPn79i+P0KVknepuLmC9kWTei51Yc=; 
 b=Y3vj4Z4YtSk+qHcluuNrIzG8vR9eA5OJH3u5h+NR4X0wkVL2nlfBbj1wkMK1kxcj3Q9LSaV8AlppobCLL80CTJg10PeyRvF+kSmXLGOs7A9/24gpaJfmWhztHVJR/SRGFqoVvldrIpQ741uDLX0NVcAHg6+gFbXdKGmqIq8KxMY=;
X-UUID: d99f6a947b2b487484f4fb48484fa742-20201102
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <yong.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 683381860; Mon, 02 Nov 2020 21:42:21 -0800
Received: from mtkmbs08n2.mediatek.inc (172.21.101.56) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 2 Nov 2020 21:42:20 -0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs08n2.mediatek.inc (172.21.101.56) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 3 Nov 2020 13:42:17 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 3 Nov 2020 13:42:16 +0800
From: Yong Wu <yong.wu@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Krzysztof Kozlowski
 <krzk@kernel.org>, Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v5 0/3] MT8192 SMI support
Date: Tue, 3 Nov 2020 13:41:57 +0800
Message-ID: <20201103054200.21386-1-yong.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-TM-SNTS-SMTP: EF9423204EAF833543A28E9D29A571C12114AD1C3BD3F5EA68511EA5BB10A7BA2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201103_004228_389453_25A82DBD 
X-CRM114-Status: GOOD (  10.73  )
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
 v5: Fix complain from yamllint.

 v4: https://lore.kernel.org/linux-mediatek/20201030091254.26382-1-yong.wu@mediatek.com/T/#meb03b3f4018894bf40c47fece52fe9b386409934 
    add if-then segment in the binding.

 v3: [1]

[1] https://lore.kernel.org/linux-iommu/20200930070647.10188-1-yong.wu@mediatek.com/


Yong Wu (3):
  dt-bindings: memory: mediatek: Convert SMI to DT schema
  dt-bindings: memory: mediatek: Add mt8192 support
  memory: mtk-smi: Add mt8192 support

 .../mediatek,smi-common.txt                   |  50 ------
 .../mediatek,smi-common.yaml                  | 142 ++++++++++++++++++
 .../memory-controllers/mediatek,smi-larb.txt  |  50 ------
 .../memory-controllers/mediatek,smi-larb.yaml | 132 ++++++++++++++++
 drivers/memory/mtk-smi.c                      |  19 +++
 5 files changed, 293 insertions(+), 100 deletions(-)
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
