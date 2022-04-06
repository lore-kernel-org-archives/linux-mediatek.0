Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C58F0C433F5
	for <linux-mediatek@archiver.kernel.org>; Wed,  6 Apr 2022 05:58:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WV8OmaqENCETa99MowSr+nKl5z6eomjgzB2O4t5GGHM=; b=xHrfaOI0K8qZZo
	rRwoEuOuqgA+MLi7r7msUHuL8jQBMz5uOG4IWGgLObMmDUMD40rH28u26zlV00/fXt1Mx7gOb1Zdd
	sMHkYhEodZ0MWISFmbHJcxd5Np1tEYBuHRoKpPoGJFshnIdUGHCItV1XAZ9WkpUYiF6wd9aYnL1MC
	YyGobCpqJYPPKcEi+7Nuh6CtYPs+0PIJwVD+GGHHLQO6nFBg09pSdjD/fqJPfVvah1ipW5PGDUqFW
	J0XOmbnje9jyvm0Lt3KIL7r2o38mUbvdMXTjMNIKMcxEJS/CZApCTu7c6vSBN/H56KyGEu18BhC/J
	retx+nVfg+J30QZfgmDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nbyg1-003tcF-P3; Wed, 06 Apr 2022 05:57:57 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nbyfw-003taR-VF; Wed, 06 Apr 2022 05:57:55 +0000
X-UUID: 58ca815a7dfc40e59acbddb603c1f8e1-20220405
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=HlR6iuPaf3B52NF+Ji89TsEgizK77o9giYcbI3NVHDw=; 
 b=Fk+zjvp7xP+PwcFZzF1y30St6Mk0aJBKs1Yg8gxZVC6hwcyTyCrWKaDhNZSXaX52IoHqgV60doxmhF3edgXSeRB4WlyAOLlFO/BDOHNQd6Se441aaRB/j8sNvOBmBCCyIPVRy8yiKz9tDpvb5AyvrNA0HyUqzURREe4i+B+/vT4=;
X-UUID: 58ca815a7dfc40e59acbddb603c1f8e1-20220405
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <jianjun.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1474052324; Tue, 05 Apr 2022 22:57:39 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 5 Apr 2022 22:47:37 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 6 Apr 2022 13:47:35 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 6 Apr 2022 13:47:34 +0800
Message-ID: <06c9f2f8236f8dab6b27da9db0332b4ca45a1039.camel@mediatek.com>
Subject: Re: [PATCH v5 0/2] phy: mediatek: Add PCIe PHY driver
From: Jianjun Wang <jianjun.wang@mediatek.com>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>, Kishon Vijay Abraham I
 <kishon@ti.com>, Vinod Koul <vkoul@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, "Chen-Yu
 Tsai" <wenst@chromium.org>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Krzysztof Kozlowski
 <krzk@kernel.org>
CC: Wei-Shun Chang <weishunc@google.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <linux-phy@lists.infradead.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <rex-bc.chen@mediatek.com>,
 <randy.wu@mediatek.com>, <jieyy.yang@mediatek.com>,
 <chuanjia.liu@mediatek.com>, <qizhong.cheng@mediatek.com>,
 <jian.yang@mediatek.com>
Date: Wed, 6 Apr 2022 13:47:34 +0800
In-Reply-To: <20220326022728.2969-1-jianjun.wang@mediatek.com>
References: <20220326022728.2969-1-jianjun.wang@mediatek.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220405_225753_053668_E0CA8565 
X-CRM114-Status: GOOD (  14.47  )
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

Hello Maintainers,

Is there anything I can do to get these patches merged?

Thanks.

On Sat, 2022-03-26 at 10:27 +0800, Jianjun Wang wrote:
> These series patches add support for PCIe PHY driver on MediaTek
> chipsets.
> 
> Changes in v5:
> 1. Fix typo in kerneldoc: "eFues" => "eFuse".
> 
> Changes in v4:
> 1. Fix no return when calling dev_err_probe.
> 
> Changes in v3:
> 1. Add introductions for structure members;
> 2. Add SoC dependent data;
> 3. Dynamically allocate efuse data;
> 4. Check return value if it's an -EPROBE_DEFER.
> 
> Changes in v2:
> 1. Add specific compatible name;
> 2. Read NVMEM data at probe time;
> 3. Fix typos.
> 
> Jianjun Wang (2):
>   dt-bindings: phy: mediatek: Add YAML schema for PCIe PHY
>   phy: mediatek: Add PCIe PHY driver
> 
>  .../bindings/phy/mediatek,pcie-phy.yaml       |  75 +++++
>  drivers/phy/mediatek/Kconfig                  |  11 +
>  drivers/phy/mediatek/Makefile                 |   1 +
>  drivers/phy/mediatek/phy-mtk-pcie.c           | 272
> ++++++++++++++++++
>  4 files changed, 359 insertions(+)
>  create mode 100644
> Documentation/devicetree/bindings/phy/mediatek,pcie-phy.yaml
>  create mode 100644 drivers/phy/mediatek/phy-mtk-pcie.c
> 
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
