Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 440C3C00140
	for <linux-mediatek@archiver.kernel.org>; Fri,  5 Aug 2022 09:12:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=zFQyc58jvalmclKjEe2R7WEZHCO2/E0JQyxzQgCcFSA=; b=Gl7MRGDTs3pO6BF8KEZjqwxVqw
	RPvE8H34aubJSeflhhzCpyl3N+1y/oslR/JitlcW/vPaH+EwYHOcCaZGJukLRe53Zx7OFGz0ani7f
	4EYeq4CHJDhrcUU6obtmNIiL/KLdyOGzcNriceyuUS+JMrEYZHHJrkMFk7BWxqnGruPBk7oHuRBn9
	wfQX7u+iTijMFu5kXcN06d50ohG2c2Wwjh6/fEp+WByamZci7hC/GVVzGLrb2mJwd2m9f4sF3gp8l
	sj53NVN5gCBEZprbna5fm0VIekoJCmx1imywX6I4nATZjBqOXCW06nJymc8vTzSHyG+aOKf714Wk4
	WfH1BwCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oJtNf-00DTFK-AU; Fri, 05 Aug 2022 09:12:31 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oJtNc-00DTDp-KF; Fri, 05 Aug 2022 09:12:29 +0000
X-UUID: 827ef1499143474686567e97143b3341-20220805
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.8,REQID:a1ffb05f-295d-40b9-ba6f-5b00f7225a6d,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:26,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACT
	ION:release,TS:26
X-CID-META: VersionHash:0f94e32,CLOUDID:0756df9b-da39-4e3b-a854-56c7d2111b46,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:4,EDM:-3,IP:nil,URL:0,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: 827ef1499143474686567e97143b3341-20220805
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <jia-wei.chang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 245237090; Fri, 05 Aug 2022 02:12:20 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.186) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Fri, 5 Aug 2022 17:12:14 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Fri, 5 Aug 2022 17:12:14 +0800
From: jia-wei.chang <jia-wei.chang@mediatek.com>
To: "Rafael J . Wysocki" <rafael@kernel.org>, Viresh Kumar
	<viresh.kumar@linaro.org>, Rob Herring <robh+dt@kernel.org>, "Krzysztof
 Kozlowski" <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, Hector Yuan <hector.yuan@mediatek.com>
CC: Jia-Wei Chang <jia-wei.chang@mediatek.com>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, <hsinyi@google.com>
Subject: [PATCH 0/2] cpufreq: mediatek-hw: add support for mt8188
Date: Fri, 5 Aug 2022 17:12:09 +0800
Message-ID: <20220805091211.2791-1-jia-wei.chang@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220805_021228_710101_625EB0A5 
X-CRM114-Status: UNSURE (   8.98  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Jia-Wei Chang <jia-wei.chang@mediatek.com>

This series supports MT8188 cpufreq hw driver which used for power
saving to scale the clock frequency and supply the voltage for CPUs.

Jia-Wei Chang (2):
  dt-bindings: cpufreq: add mt8188 cpufreq hw dt-bindings
  cpufreq: mediatek-hw: add support for mt8188

 .../bindings/cpufreq/cpufreq-mediatek-hw.yaml          |  4 +++-
 drivers/cpufreq/mediatek-cpufreq-hw.c                  | 10 ++++++++++
 2 files changed, 13 insertions(+), 1 deletion(-)

-- 
2.18.0


