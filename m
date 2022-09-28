Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08175C07E9D
	for <linux-mediatek@archiver.kernel.org>; Wed, 28 Sep 2022 02:18:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A+qXPRA7ywTuXXDRS+dWtKCRO57wsD96NnkHKCFHm4w=; b=HIawBM9d252s1/EKzGuZCTV2qH
	qgH/SvZ2inAuCqXxx7Y3AhO5WIeMoHl29d+Lb1cEdw/IyFP6YpGyX+6/RNFvueL7+Fd8Rqgg6eYxt
	nOj/wPwI/EuyQU44Q1Dh2KYc05rQgBTTF2ACBRfMyTs3rL1s+LO47mRAsH4bIgNtGN3+QMggiMy7V
	fsLy86lGjIFodn5ZfiuSNoInSdm7HXh28UC0kOY8q8R6ZXs9jlURuP1VIV0mlPrDZgK2BPKbW6yvE
	KcXGiOKV9ONrZoEXspjc9NBimKfc9f+4M3wRUJVpzt9zssG0CEtDtMOMPovoOVmixJN8jlJuoeo1m
	M5b02oUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odMeh-00DXOm-Lm; Wed, 28 Sep 2022 02:18:35 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odMef-00DXO9-2S; Wed, 28 Sep 2022 02:18:34 +0000
X-UUID: 99494350d82440c789168a6f43c438e1-20220927
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=A+qXPRA7ywTuXXDRS+dWtKCRO57wsD96NnkHKCFHm4w=;
	b=EiKXtB0fDGaYwn+THx+6Mzrwx6ggIQwjZnKD4BXrTg4V+C6GFmPcyqv8WsCxgK40PZ1BHDQ5yXO67jebzMgTq3Jnf8+nWMlbFj5k3ZXgInWeBjC1PBHlYgfcrBsjUYsxVcDWhGjQm2qazVwmOKDliXIqfu/jl4v3I7Youc6eWPY=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.11,REQID:55864dde-46ad-44d9-8113-6f0c4ce0ca32,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:39a5ff1,CLOUDID:6f443e07-1cee-4c38-b21b-a45f9682fdc0,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:-5,EDM:-3,IP:nil,
	URL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 99494350d82440c789168a6f43c438e1-20220927
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <miles.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1744780737; Tue, 27 Sep 2022 19:18:24 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Wed, 28 Sep 2022 09:47:50 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Wed, 28 Sep 2022 09:47:50 +0800
From: Miles Chen <miles.chen@mediatek.com>
To: <macpaul.lin@mediatek.com>
CC: <bear.wang@mediatek.com>, <devicetree@vger.kernel.org>,
	<fparent@baylibre.com>, <krzysztof.kozlowski+dt@linaro.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-mediatek@lists.infradead.org>, <linux-usb@vger.kernel.org>,
	<macpaul@gmail.com>, <matthias.bgg@gmail.com>, <miles.chen@mediatek.com>,
	<pablo.sun@mediatek.com>, <robh+dt@kernel.org>, <stable@vger.kernel.org>
Subject: Re: [PATCH] arm64: dts: mediatek: mt8195-demo: fix the memory size of
Date: Wed, 28 Sep 2022 09:47:50 +0800
Message-ID: <20220928014750.17054-1-miles.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <664f3b7d-d629-5af1-cae4-cb5b638a5da1@mediatek.com>
References: <664f3b7d-d629-5af1-cae4-cb5b638a5da1@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220927_191833_135306_2027F0A9 
X-CRM114-Status: GOOD (  12.59  )
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

>On 9/26/22 15:05, Miles Chen wrote:
>> Hi Macpaul,
>> 
>>> The size of device tree node secmon (bl31_secmon_reserved) was
>>> incorrect. It should be increased to 2MiB (0x200000).
>> 
>> 192K should work when the patch(6147314aeedc) was accepted.
>> Does the trusted-firmware-a get larger now, so we need to
>> increase the size to 2MiB?
>> 
>> thanks,
>> Miles
>
>When mt8195-demo.dts sent to the upstream, at that time the size of
>BL31 was small. Because supported functions and modules in BL31 are 
>basic sets when the board was under early development stage.
>
>Now BL31 includes more firmwares of coprocessors and maturer functions
>so the size has grown bigger in real applications. According to the 
>value reported by customers, we think reserved 2MiB for BL31 might be 
>enough for maybe the following 2 or 3 years.

Thanks for your explanation,
please add this to the commit message and submit next version.

With that, feel free to add:
Reviewed-by: Miles Chen <miles.chen@mediatek.com> 

thanks,
Miles

