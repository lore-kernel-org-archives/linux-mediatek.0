Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7E80C004D4
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 Jan 2023 06:21:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ssiHBlg9ViK4cAVSgimSmbQQJThFkTp/ayRhvOH0KqM=; b=XL+ZApcXOGoqQPTtPxy0Fg8FDT
	D17FgyUAb54aMSZlSxEsfMA1zYcBFKX8j4dmFGucZo+ZJxUgqGa3vJXrAGp4S7ZL5/dhvKu/iszgg
	eL5S3c3FwUxaU9FnRx+OdDvpBmDIBy9GMdALPgjkWwxDUZkHuwopK/OGcblAxJuLVTiVNR9gzC0+g
	gH2APit7iU6gXLu2GPmUXfjHLgyRnOddrAe0OncXQQPOze2XQffBJE4RfZ8BCKKG/86NM6xUTPH6G
	/ZDwQzlCWStUMNCPA1zQOI/CSD8timRsx/Mw96GXZ37/Jh13OEGpvqpbuuq5woBGEf6Fues9gmBnZ
	SskcoLSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pI1pM-00H4JA-1L; Wed, 18 Jan 2023 06:21:40 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pI1pA-00H4FA-Is; Wed, 18 Jan 2023 06:21:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=ssiHBlg9ViK4cAVSgimSmbQQJThFkTp/ayRhvOH0KqM=; b=V/aIFsk7PbEXd5jKB5VWC8dedF
	3EXc4uuubd0QFr0dQoE5AvBpXbg76S4bNR2S4hEEwpouSl8ic0HmH5tRVgGNStt2v9XS2+MWBbef/
	Zf3AvUMs5kvWBuY9NwtlrQt7uIksXWrLwZi1BfS5j/r+KTLLOiLo4WcRxTKK7d/kbtjQjoCrTMMSh
	AmC9t/lvlgST9gE5n8/i6BxPVA2diEeVnQu2PExlA/RYcbQhxDc2O+xPzPGBrH5czGVmeF23E/PLp
	jjG8lTKC2n/MuEYqQikNSVJsJCfb9YvYam74+Y5rcD5UuCkpsn9vd6QGftXnszVX1oxYkEMUzlBcp
	nYhSjPkQ==;
Received: from [216.200.240.185] (helo=mailgw02.mediatek.com)
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pI1os-006B9p-36;
	Wed, 18 Jan 2023 06:21:16 +0000
X-UUID: 3b83d3a896f811eda08d4d6090ec5a5c-20230117
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=ssiHBlg9ViK4cAVSgimSmbQQJThFkTp/ayRhvOH0KqM=;
	b=qB38iEgssuub0qP7ZKdb9UscZ6XjbVmZxbWvfdS8lurobkDogPePTafZeYZ8VHITg4tCMVtGPJzz0+oYNjr3qOVtPMUnrlzvGVdpKvgK7JPB5YuSWgC76XxLOqGJB2e36V0tx5tZZbGEYdUQHSqtbr2Ubwfx6hshmsTBgqeNmlY=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.18,REQID:ecd134cb-b1c2-4792-94dc-7fab4bc3e3b3,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:3ca2d6b,CLOUDID:8be3fa54-dd49-462e-a4be-2143a3ddc739,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0
X-CID-BVR: 0
X-UUID: 3b83d3a896f811eda08d4d6090ec5a5c-20230117
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw02.mediatek.com
	(envelope-from <guodong.liu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1410561109; Tue, 17 Jan 2023 23:20:41 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Wed, 18 Jan 2023 14:20:38 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Wed, 18 Jan 2023 14:20:37 +0800
From: Guodong Liu <Guodong.Liu@mediatek.com>
To: Sean Wang <sean.wang@kernel.org>, Linus Walleij
	<linus.walleij@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, Light
 Hsieh <light.hsieh@mediatek.com>, Rob Herring <robh@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
CC: <linux-mediatek@lists.infradead.org>, <linux-gpio@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	Zhiyong Tao <zhiyong.tao@mediatek.com>, Guodong Liu
	<Guodong.Liu@mediatek.com>
Subject: [PATCH 0/2] MediaTek pinctrl cleanups and improvements
Date: Wed, 18 Jan 2023 14:20:34 +0800
Message-ID: <20230118062036.26258-1-Guodong.Liu@mediatek.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230118_062113_550764_B59F2A5C 
X-CRM114-Status: GOOD (  11.26  )
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

Patch 1. Fix coverity by initializing pullen and pullup as zero.
Coverity error message:
	This issue is detected by 
		Checker: UNINIT
		Type: Uninitialized scalar variable
	Defect is in:
		File: drivers/pinctrl/mediatek/pinctrl-paris.c
		Function and lines: 
				mtk_pctrl_show_one_pin:627
	CID 10350517 (#1 of 2): Uninitialized scalar variable (UNINIT)
	(7) uninit_use: Using uninitialized value pullen.
	                rsel = pullen;
	                pullen = 1;
	        } else {
	CID 10350553 (#1 of 1): Uninitialized scalar variable (UNINIT)
	(8) uninit_use_in_call: Using uninitialized value pullup when
	    calling scnprintf.
        len += scnprintf(buf + len, buf_len - len,
                        "%03d: %1d%1d%1d%1d%02d%1d%1d%1d%1d",
                        gpio,
                        pinmux,
                        mtk_pctrl_get_direction(hw, gpio),
                        mtk_pctrl_get_out(hw, gpio),
                        mtk_pctrl_get_in(hw, gpio),
                        mtk_pctrl_get_driving(hw, gpio),
                        mtk_pctrl_get_smt(hw, gpio),
                        mtk_pctrl_get_ies(hw, gpio),
                        pullen,
                        pullup);

Patch 2. Fix coverity by initializing *buf as zero.
Coverity error message:
	This issue is detected by 
		Checker: UNINIT
		Type: Uninitialized scalar variable
	Defect is in:
		File: drivers/pinctrl/mediatek/pinctrl-paris.c
		Function and lines: 
				mtk_pctrl_dbg_show
	static void mtk_pctrl_dbg_show(struct pinctrl_dev *pctldev,
				       struct seq_file *s,
				       unsigned int gpio)
	{
	        struct mtk_pinctrl *hw = pinctrl_dev_get_drvdata(pctldev);
        	(1) var_decl: Declaring variable buf without initializer.
	        char buf[PIN_DBG_BUF_SZ];

        	(void)mtk_pctrl_show_one_pin(hw, gpio, buf, PIN_DBG_BUF_SZ);

	CID 10801732 (#1 of 1): Uninitialized scalar variable (UNINIT)
	(2) uninit_use_in_call: Using uninitialized value *buf as argument to %s
	    when calling seq_printf.
	seq_printf(s, "%s", buf);

Guodong Liu (2):
  pinctrl: mediatek: Initialize variable pullen and pullup to zero
  pinctrl: mediatek: Initialize variable *buf to zero

 drivers/pinctrl/mediatek/pinctrl-paris.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

-- 
2.25.1


