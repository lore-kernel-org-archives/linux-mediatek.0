Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93A73C43334
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 Jun 2022 03:53:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LDaiPDfvzf0xW/QoK2SmWRk2um7Wm3hlI/WWtLvdPlk=; b=vyURx8CM5Kz32F
	TTx5Xwv0vwZjbfYy1SZ39mDNyrd2xtF40LasngCqSn7kaE82QOSBkmIM8AT0GJnTXdbne31t/vw3j
	tXlskuTBXc8nKfPmOiN3Avha5kJx5bzXGgbgMceFMkF0VpgVvKDH1hYSEH+4KwjE9XKUrh6zH7GsI
	mWMV9QUXpKVibTum7PNvG4RiT0we17Ve1iURuNvbkJsYye141GikGNKCTsL9bwz79JSb6pxihqHqH
	cZllDQZpN0P5R2eAvTgt8QwwPpi5hIE1PDOeEhcKdPidP+fUQx6eo6qo2G4rQq0pDuFozbIZ6b3c+
	dQjabmM/LtTI3wbxjl2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwbtL-001HmZ-IE; Thu, 02 Jun 2022 03:52:59 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwbtG-001HfT-Ju; Thu, 02 Jun 2022 03:52:57 +0000
X-UUID: 8a3fe6f8cdee4ca489058ae8523436e8-20220601
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.5,REQID:eea5791d-3938-48cf-8825-e2fb19fe8ef0,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:0
X-CID-META: VersionHash:2a19b09,CLOUDID:57d90015-b515-4766-a72d-4514488fe823,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,QS:0,BEC:nil
X-UUID: 8a3fe6f8cdee4ca489058ae8523436e8-20220601
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
	(envelope-from <tinghan.shen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
	with ESMTP id 385720221; Wed, 01 Jun 2022 20:52:41 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 1 Jun 2022 20:52:40 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Thu, 2 Jun 2022 11:52:38 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.3 via Frontend
 Transport; Thu, 2 Jun 2022 11:52:38 +0800
Message-ID: <016eb93f0bee329c061725cb5096d49ab4240152.camel@mediatek.com>
Subject: Re: [PATCH v1 00/15] Add support for MT8195 SCP 2nd core
From: Tinghan Shen <tinghan.shen@mediatek.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Bjorn Andersson
	<bjorn.andersson@linaro.org>, Mathieu Poirier <mathieu.poirier@linaro.org>,
	Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, Lee Jones <lee.jones@linaro.org>, Benson Leung
	<bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>, Daisuke Nojiri
	<dnojiri@chromium.org>, Sebastian Reichel <sebastian.reichel@collabora.com>,
	"Dustin L. Howett" <dustin@howett.net>, Tzung-Bi Shih <tzungbi@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, Prashant Malani
	<pmalani@chromium.org>, Enric Balletbo i Serra
	<enric.balletbo@collabora.com>, Brian Norris <briannorris@chromium.org>
CC: <linux-remoteproc@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <chrome-platform@lists.linux.dev>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, <weishunc@google.com>
Date: Thu, 2 Jun 2022 11:52:38 +0800
In-Reply-To: <919ca8ee-4b01-e601-714c-26098647d5c7@linaro.org>
References: <20220601112201.15510-1-tinghan.shen@mediatek.com>
	 <919ca8ee-4b01-e601-714c-26098647d5c7@linaro.org>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220601_205254_708941_673FA03A 
X-CRM114-Status: GOOD (  15.32  )
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

Hi Krzysztof,
 
On Wed, 2022-06-01 at 13:46 +0200, Krzysztof Kozlowski wrote:
> On 01/06/2022 13:21, Tinghan Shen wrote:
> > The MT8195 System Companion Processor(SCP) is a dual-core RISC-V MCU.
> > Current mediatek remoteproc driver only supports bring-up single core 
> > SCP or the 1st core of a dual-core SCP. This series support to bring-up 
> 
>       ^^ this or is confusing a bit.
> 
> Does this mean that MT8195 has three RISC-V MCUs?

My intention is to express that current SCP driver supports bring-up,
1. the single core SCP, e.g. MT8183
2. the 1st core of dual-core SCP, e.g. MT8195


Perhaps rewriting as follows is preferable?

"The mediatek remoteproc driver currently only allows bringing up a single 
core SCP. It only supports bringing up the 1st core in SoCs with a dual-core SCP."
> 
> > the 2nd core of a dual-core SCP.
> 
> 
> 
> Best regards,
> Krzysztof


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
