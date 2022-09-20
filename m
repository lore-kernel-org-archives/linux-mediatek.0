Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66D28C6FA82
	for <linux-mediatek@archiver.kernel.org>; Tue, 20 Sep 2022 02:42:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sIGqGcIRrPYQKpKAtc4/Ah0ogLUo8Srchgvb8OewzRE=; b=nTI72Nr/VaZS1u5cU1k9riFpgV
	LuO7DHRU4IgBIv/x73JJChnp50uqP0n11THNjw1w/JrYGVgkFpQdLWND8hYpO7OwEj9XbwCWUFR5i
	H+ND/sDlV1lP9LPw+jNo9hrVYktMLdmVksSO9cfYJWVnXANkGWPUiiocWip5Gck/v5NbC9tEkn/rx
	WjCojYGyw8Ie3PF5iStRi2/jZB7V1Qs84ba61A/KjJb/veY0YTNOndeG5MlpL+INt2k214e2CG1Nv
	2i6BLZBhQJlOjJByJ+9F5olBoRlClI+YtKDKHbaffp+yzvB3ccEsYX3M6f0fbpnb0U5REBGkkBP0i
	88xLxB1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaTDS-00HKDb-Jx; Tue, 20 Sep 2022 02:42:30 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaTDQ-00HKCF-BU; Tue, 20 Sep 2022 02:42:29 +0000
X-UUID: 173a5a7ffd8d493eacf8e59cf07841be-20220919
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=sIGqGcIRrPYQKpKAtc4/Ah0ogLUo8Srchgvb8OewzRE=;
	b=aRvQ0VDRfgbGD6rD0Wj566EQJ9zlsbkzJKGh/pNPpEuxrCmVvVbctwupsGNoNCr1IxlPRjst4QgU6qJUtmMBSlQJXiwBtvgmSjec5RgD8tH0Xw5sCt1P7a1ZlA1Af+C2d1B7bKgdDzyYVOj6e6hBOeFpR44rzPYS8Q8M7Ukj68k=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.11,REQID:59470ad6-1975-4f08-ac16-9636112b080d,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:90
X-CID-INFO: VERSION:1.1.11,REQID:59470ad6-1975-4f08-ac16-9636112b080d,IP:0,URL
	:0,TC:0,Content:-5,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Spam_GS981B3D,ACTIO
	N:quarantine,TS:90
X-CID-META: VersionHash:39a5ff1,CLOUDID:b4f65870-dafa-4a42-b716-cf2cd4845592,B
	ulkID:220920002500QDDVP7VP,BulkQuantity:73,Recheck:0,SF:28|17|19|48,TC:nil
	,Content:0,EDM:-3,IP:nil,URL:0,File:nil,Bulk:40,QS:nil,BEC:nil,COL:0
X-UUID: 173a5a7ffd8d493eacf8e59cf07841be-20220919
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw01.mediatek.com
	(envelope-from <jianguo.zhang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1271951992; Mon, 19 Sep 2022 19:42:23 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Tue, 20 Sep 2022 10:41:48 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkmbs11n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Tue, 20 Sep 2022 10:41:47 +0800
Message-ID: <f78e79520b5edc9b477c38131fd97e5e603c0428.camel@mediatek.com>
Subject: Re: [PATCH 2/2] net: dt-bindings: dwmac: add support for mt8188
From: Jianguo Zhang <jianguo.zhang@mediatek.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
CC: <netdev@vger.kernel.org>, Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Biao Huang
	<biao.huang@mediatek.com>, <devicetree@vger.kernel.org>,
	<linux-mediatek@lists.infradead.org>, Jakub Kicinski <kuba@kernel.org>, Paolo
 Abeni <pabeni@redhat.com>, "David S . Miller" <davem@davemloft.net>, Matthias
 Brugger <matthias.bgg@gmail.com>, <linux-arm-kernel@lists.infradead.org>,
	<linux-stm32@st-md-mailman.stormreply.com>, Jose Abreu
	<joabreu@synopsys.com>, Rob Herring <robh+dt@kernel.org>, Maxime Coquelin
	<mcoquelin.stm32@gmail.com>, <linux-kernel@vger.kernel.org>, "Giuseppe
 Cavallaro" <peppe.cavallaro@st.com>, Eric Dumazet <edumazet@google.com>
Date: Tue, 20 Sep 2022 10:41:47 +0800
In-Reply-To: <20220919162453.4kkphzhc2tu6wzou@krzk-bin>
References: <20220919080410.11270-1-jianguo.zhang@mediatek.com>
	 <20220919080410.11270-3-jianguo.zhang@mediatek.com>
	 <20220919162453.4kkphzhc2tu6wzou@krzk-bin>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220919_194228_428982_5400E912 
X-CRM114-Status: UNSURE (   9.10  )
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

Dear Krzysztof,

	Thanks for your comment.

On Mon, 2022-09-19 at 18:24 +0200, Krzysztof Kozlowski wrote:
> 'clk_csr'
'clk_csr' properity is parsed in driver, but it is not documented in
bingings for now. We will push a patch to describe 'clk_csr' in
snps,dwmac.yaml file in next version patches.

BRS
Jianguo


