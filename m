Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1F73C07E9D
	for <linux-mediatek@archiver.kernel.org>; Mon, 26 Sep 2022 07:06:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y09of+4Ca7fIldBTzPfxeEaCyJ/Ci1lYdycpsFFRdpM=; b=L3ByzSK3rAQ6ncTs+EAz39GsMC
	TvyS5BjpE+YkGJvv7eziSwpekreZ7B2ZXCIGE2WBaNI0+H1Okd3j/uvxBKJXsDqILOaDBTfqSw/yL
	jszlVrybDebTyV/8KhCe9HF81A3Miy4WRA+yGkKT2mEZWzVxuiWS44N95Eggu6a2vsFq5z5Xcw8JO
	Tkpo3741huKiMfJabdMbbNZqaJHrQLp5bW86Gyph4OAPSn7jKkjCvYvpyDWj1+lfQTtceSUJJv26e
	GLsTPlUq/nHiU0lssfz61IJFWIkyN01rRn0oTMOU8E0QQNqmny4Y4kwCxkpLT+CdovZcuLpXuMi2R
	ygs2LBxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ociBe-002c3V-VX; Mon, 26 Sep 2022 07:05:54 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ociBc-002c14-It; Mon, 26 Sep 2022 07:05:54 +0000
X-UUID: 5bb53ef5ec554cc28cee5e7b44e9c1f0-20220926
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=y09of+4Ca7fIldBTzPfxeEaCyJ/Ci1lYdycpsFFRdpM=;
	b=dUk2wHyDgSw8BUykyu2VxhHfBVKMKXYp+T41XEoGnGYJQLXGPuQN+PTPMYtyy54k1in2aswwo84b0K81GZKVQC7lRYfRslBjYllj4aho3n3rUviuyQU2vvkrXGfGkvYsi7MFTPqn0lZ5gygOSaGaTEWz2vhkyGqWwVRB0DhHB8o=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.11,REQID:85cf6c22-f6a3-402e-a698-e89bbe99598d,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:39a5ff1,CLOUDID:43260207-1cee-4c38-b21b-a45f9682fdc0,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 5bb53ef5ec554cc28cee5e7b44e9c1f0-20220926
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <miles.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1042961961; Mon, 26 Sep 2022 00:05:47 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Mon, 26 Sep 2022 15:05:44 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Mon, 26 Sep 2022 15:05:44 +0800
From: Miles Chen <miles.chen@mediatek.com>
To: <macpaul.lin@mediatek.com>
CC: <bear.wang@mediatek.com>, <devicetree@vger.kernel.org>,
	<fparent@baylibre.com>, <krzysztof.kozlowski+dt@linaro.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-mediatek@lists.infradead.org>, <linux-usb@vger.kernel.org>,
	<macpaul@gmail.com>, <matthias.bgg@gmail.com>, <miles.chen@mediatek.com>,
	<pablo.sun@mediatek.com>, <robh+dt@kernel.org>, <stable@vger.kernel.org>
Subject: Re: [PATCH] arm64: dts: mediatek: mt8195-demo: fix the memory size of node secmon
Date: Mon, 26 Sep 2022 15:05:44 +0800
Message-ID: <20220926070544.13257-1-miles.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220922091648.2821-1-macpaul.lin@mediatek.com>
References: <20220922091648.2821-1-macpaul.lin@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220926_000552_690441_AEDCC786 
X-CRM114-Status: GOOD (  11.68  )
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

Hi Macpaul,

> The size of device tree node secmon (bl31_secmon_reserved) was
> incorrect. It should be increased to 2MiB (0x200000).

192K should work when the patch(6147314aeedc) was accepted.
Does the trusted-firmware-a get larger now, so we need to
increase the size to 2MiB?

thanks,
Miles

> 
> The origin setting will cause some abnormal behavior due to
> trusted-firmware-a and related firmware didn't load correctly.
> The incorrect behavior may vary because of different software stacks.
> For example, it will cause build error in some Yocto project because
> it will check if there was enough memory to load trusted-firmware-a
> to the reserved memory.
> 
> Cc: stable@vger.kernel.org      # v5.19
> Fixes: 6147314aeedc ("arm64: dts: mediatek: Add device-tree for MT8195 Demo board")
> Signed-off-by: Macpaul Lin <macpaul.lin@mediatek.com>

