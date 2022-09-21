Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D76EC54EE9
	for <linux-mediatek@archiver.kernel.org>; Wed, 21 Sep 2022 01:18:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f/MwaSUQ0POzLepcYUfXzms96S+fuAIwuOw47LBRhGQ=; b=4eQqy/A/nFH11qSbfTJ35Qk2IY
	Bq8yT/agpgGNSUXq100uLjk6x1Fc5owERzB5DgPFDkwKH0tnoW4zTBFxPrYsuYQYXI8YlogEJ3Rtz
	EbABI3NPvP9bPEyuzVFRXJCLh0d8Q7J2e4JcX0xvOjvUWwwRohLXBKTXxC8Evi0h7GHeC9rwiQLgy
	WhX0x8xi3GzhQSOxy9BNsi/3MR3Sx8ieCVy2zO94zh0l9XXBKKmoQarxDVtHWVM8FdHV5ZwYFzJdC
	QDDg/rSDdGW2F9l6uE5QT2M9B5jbbs1dnTqPix0+Q6pu1n+VVoJCcL+a9GU8sn/FRQFaupNn4L0yZ
	gOOoY7mA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaoNM-007u0z-PR; Wed, 21 Sep 2022 01:18:08 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaoNJ-007tz8-M5; Wed, 21 Sep 2022 01:18:07 +0000
X-UUID: 3d173b3ed19740cdb3548f9ee1e469e5-20220920
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=f/MwaSUQ0POzLepcYUfXzms96S+fuAIwuOw47LBRhGQ=;
	b=QZLHFxn1aCBwAN7FrotW/AudqveIU4ZXlStFvNj2+8TAOB95inETL8gtdo/sFLHYiLaOZM/7yJIaVFW3IGqBzmbPxA21Ei+sVaUswjZtJWzbsTwsWD16F39EQ88pDLSD6S8YxpFKB+irmaqIq01wt6DL9bqYgl3jmtQqaIaxIjs=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.11,REQID:fa7ebcd5-6222-45ea-b704-a7656e33ea9c,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:39a5ff1,CLOUDID:ecdf8356-c0a1-41ff-b4ff-546b4275d2b8,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 3d173b3ed19740cdb3548f9ee1e469e5-20220920
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <jianguo.zhang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 129540121; Tue, 20 Sep 2022 18:17:47 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Wed, 21 Sep 2022 09:17:44 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 21 Sep 2022 09:17:43 +0800
Message-ID: <50729e7386065786e524fd94894d6882a3a77295.camel@mediatek.com>
Subject: Re: [PATCH 1/2] dt-bindings: net: mediatek-dwmac: add support for
 mt8188
From: Jianguo Zhang <jianguo.zhang@mediatek.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, "David S . Miller"
	<davem@davemloft.net>, Rob Herring <robh+dt@kernel.org>, "Krzysztof
 Kozlowski" <krzysztof.kozlowski+dt@linaro.org>
CC: Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>, Giuseppe Cavallaro <peppe.cavallaro@st.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Jose Abreu
	<joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Matthias
 Brugger <matthias.bgg@gmail.com>, Biao Huang <biao.huang@mediatek.com>,
	<netdev@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>
Date: Wed, 21 Sep 2022 09:17:43 +0800
In-Reply-To: <ada6ef7f-0106-6a30-64ad-66b3277d987b@linaro.org>
References: <20220920083617.4177-1-jianguo.zhang@mediatek.com>
	 <20220920083617.4177-2-jianguo.zhang@mediatek.com>
	 <ada6ef7f-0106-6a30-64ad-66b3277d987b@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220920_181805_766837_FF10508E 
X-CRM114-Status: GOOD (  12.46  )
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

Dear Krzysztof,

	Thanks for your comment.

On Tue, 2022-09-20 at 17:26 +0200, Krzysztof Kozlowski wrote:
> On 20/09/2022 10:36, Jianguo Zhang wrote:
> > Add binding document for the ethernet on mt8188
> > 
> > Signed-off-by: Jianguo Zhang <jianguo.zhang@mediatek.com>
> 
> Please version your patches. git format-patch can do it for you.
> 
We will add version info in next version patches.

> Best regards,
> Krzysztof

BRS
Jianguo


