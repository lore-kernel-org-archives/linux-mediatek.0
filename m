Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87687ECAAD1
	for <linux-mediatek@archiver.kernel.org>; Thu,  1 Sep 2022 09:09:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mSKU3/XNrzgDEXyKoQN+SoaiHQESlxP9Gq2Nquvsogg=; b=Cxyxn8BXyY9Kf0WOuOgfHz73DQ
	IeGbvip4OUz93Z02cj4oK0eLLGMKtIV8/c5i9PMhQnE8sW3r22Pr+N9CrEVw3RZnQWEWkVcKYEzsT
	2+859GsHTYXR039XlMnX6FYiLS5IdpWqbtITCHDTTUo59+qYL6JLixt3MvjeTGwuNkx26JUUkgsET
	9usZr6XiZBxKn5APEuZI/GylfKnQdPmupmg01gcoJsrdfpWS8CsUX+fXW9WbTon+vmR22FRlFYS/+
	Y1EumT7SkUxvidycvasoMPDTsGrJQumkpdIFi140INN7GYJI7ZefHYyZu/oyGu7hGEjxx4wBZG0Ug
	CqxlM5Yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oTgCO-00AjeE-18; Thu, 01 Sep 2022 09:09:20 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oTgCL-00AjXT-AV; Thu, 01 Sep 2022 09:09:18 +0000
X-UUID: 188b1fdb7d6d4d7db239d7ad3352cfb5-20220901
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=mSKU3/XNrzgDEXyKoQN+SoaiHQESlxP9Gq2Nquvsogg=;
	b=Cqnaie7DGwMn5apetXJgAJtILSyK7TxAv8CLnpsaCuZVZSPQcnJAThFbSDt0X9a2P8gKLgv69Cz5IMZKgxfOadEDs3nFM9MgXU/lcelseBWq4D4Iluy5TB2NYVY8sYASNKkVaKbHT27+xD+482hGs5sj+c2i+AF6tRUbGBL/azc=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.10,REQID:e708709f-1e4f-47b7-95d4-7e21b2e8380a,OB:0,L
	OB:0,IP:0,URL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release
	_Ham,ACTION:release,TS:-5
X-CID-META: VersionHash:84eae18,CLOUDID:aaffcd20-1c20-48a5-82a0-25f9c331906d,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 188b1fdb7d6d4d7db239d7ad3352cfb5-20220901
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <liju-clr.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1632279407; Thu, 01 Sep 2022 01:57:02 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Thu, 1 Sep 2022 16:16:28 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Thu, 1 Sep 2022 16:16:28 +0800
Message-ID: <092345db980b30c577350edc46d88dc3888736d4.camel@mediatek.com>
Subject: Re: [PATCH v2 1/3] dt-bindings: watchdog: Add compatible for
 MediaTek MT8188
From: Liju-clr Chen <liju-clr.chen@mediatek.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, Runyang Chen
	<Runyang.Chen@mediatek.com>, Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
	<nfraprado@collabora.com>
CC: <angelogioacchino.delregno@collabora.com>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>
Date: Thu, 1 Sep 2022 16:16:28 +0800
In-Reply-To: <0b17f336-5c04-e375-ef4a-3804f9702bf8@kernel.org>
References: <20220816065330.27570-1-Runyang.Chen@mediatek.com>
	 <20220816065330.27570-2-Runyang.Chen@mediatek.com>
	 <0b17f336-5c04-e375-ef4a-3804f9702bf8@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220901_020917_395275_3E58BD47 
X-CRM114-Status: GOOD (  10.81  )
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

Hi Maintainers,

Gentle ping for this patch.
It would be appreciated if you could give some suggestions.

Best Regards,
Liju Chen

On Tue, 2022-08-16 at 12:49 +0300, Krzysztof Kozlowski wrote:
> On 16/08/2022 09:53, Runyang Chen wrote:
> > From: Runyang Chen <runyang.chen@mediatek.com>
> > 
> > Add dt-binding documentation of watchdog for MediaTek MT8188 Soc
> > 
> 
> 
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> 
> Best regards,
> Krzysztof


