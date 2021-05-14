Return-Path: <SRS0=SQT7=KJ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE9D1C433ED
	for <linux-mediatek@archiver.kernel.org>; Fri, 14 May 2021 07:00:45 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5E1BE61354
	for <linux-mediatek@archiver.kernel.org>; Fri, 14 May 2021 07:00:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5E1BE61354
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=odBAvrgsXZTFhi0sSBBiyRTJcNplYC/93BhDXHjSKFI=; b=grMSJYrWW+na+fwt/vU70eU4HZ
	X9X6CV9skC0IYCqe/JzI7hanRz/V6P149uSeLDBkhh1exBK09hwIPCQE541Y5d+0LFd4vV6y9fdtm
	YNBGUK8J4PQa0L/dUAJ5qK0fSgu1MYAXKw2V7mQp9IYsC4gsUya6JfsfKxY6+17QXwkx/3ocAmqFM
	cEaFtdurDusqyHM37uCy21R8ueGRJ0JvHnQNfGMEU4AxdUniVo0S/5Ft2zgpdJ/0J5jl5f0VCGb7N
	HMWes2ds+oi3+B/whsynQOrIlFSVLM0dAI6JJsvqXbaM+1Ea25AMok04sSEhn2FAV7hMsk+HULRsO
	Jzs+p0eg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lhRoC-007LYk-SA; Fri, 14 May 2021 07:00:28 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lhRnu-007LVK-1P; Fri, 14 May 2021 07:00:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=aiMaVaWm68M4BpAcl2nBR3Z6wvR143PoDRBJjOjsNeY=; b=NTpDvPQHol1QTp3hbhlaIjcxEq
 2/6JIKQgvh0u67UYdDxf+KkKCX6MqOfHce20XgaCbD4d7shZy/KPB1wGAbPatRCz2BSCd8kdCjCF5
 QyF77oBTSkVmNuyzUmC1eO8JU592xbtr3FM90KDOWBrq3alOJiAxg63bAvbR/CN1RF247qspt4meM
 ehUZ8fOxDPdll3chmZLbYXbg4npRgTKetc8b0I6a17Z88m3srH3HKQil6Q6qVY4LYHflLjUrFal9R
 zW3A9aceEEFj4VQRj/I3cl4YOtJJKOwx+27h8zsMvMnUtztOy/4G4sjJHodT4/C00S9i2rBeFsCQf
 Nqq2+BkQ==;
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lhRnq-00BlGJ-Ll; Fri, 14 May 2021 07:00:07 +0000
X-UUID: 2b2c0226da53471db3161d6a1192191e-20210513
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=aiMaVaWm68M4BpAcl2nBR3Z6wvR143PoDRBJjOjsNeY=; 
 b=fmWVXrADCzZJz8VNQYqcpGQOuFihjAPNCjJ7v1oA7UuibIdvgGGJltXuHG5Nba7KufKdJDOKevCgpDJsngTFq+D0xYY+FTcMlLltI5TG7Szr+FVE8EqL6+FFi2mpYqhIry+IC+HconBY02yxI2nVv8v7d9gGPf4fWQTiI05Rn24=;
X-UUID: 2b2c0226da53471db3161d6a1192191e-20210513
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <jianjun.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1398150866; Thu, 13 May 2021 23:59:53 -0700
Received: from mtkmbs05n1.mediatek.inc (172.21.101.15) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 13 May 2021 23:59:52 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs05n1.mediatek.inc (172.21.101.15) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 14 May 2021 14:59:50 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 14 May 2021 14:59:49 +0800
From: Jianjun Wang <jianjun.wang@mediatek.com>
To: Bjorn Helgaas <bhelgaas@google.com>, Rob Herring <robh+dt@kernel.org>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Ryder Lee
 <ryder.lee@mediatek.com>
CC: Matthias Brugger <matthias.bgg@gmail.com>, <linux-pci@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 Jianjun Wang <jianjun.wang@mediatek.com>, <youlin.pei@mediatek.com>,
 <chuanjia.liu@mediatek.com>, <qizhong.cheng@mediatek.com>,
 <sin_jieyang@mediatek.com>, <drinkcat@chromium.org>,
 <Rex-BC.Chen@mediatek.com>, Krzysztof Wilczyski <kw@linux.com>,
 <Ryan-JH.Yu@mediatek.com>
Subject: [PATCH 0/2] PCI: mediatek-gen3: Add support for disable dvfsrc
Date: Fri, 14 May 2021 14:59:25 +0800
Message-ID: <20210514065927.20774-1-jianjun.wang@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210514_000006_730316_DF66EACD 
X-CRM114-Status: UNSURE (   8.09  )
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

These series patches add support for disable dvfsrc voltage request.

Jianjun Wang (2):
  dt-bindings: PCI: mediatek-gen3: Add property to disable dvfsrc
    voltage request
  PCI: mediatek-gen3: Add support for disable dvfsrc voltage request

 .../bindings/pci/mediatek-pcie-gen3.yaml      |  8 +++++
 drivers/pci/controller/pcie-mediatek-gen3.c   | 32 +++++++++++++++++++
 2 files changed, 40 insertions(+)

-- 
2.25.1
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
