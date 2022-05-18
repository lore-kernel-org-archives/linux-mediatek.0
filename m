Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3CB2C433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 May 2022 02:57:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1+/J5YWwNW1qKYjUwuCYmALOJwhj3wnH8Ea6r25FzZs=; b=QzNbeeic4tWb31
	xyfc1agrVUHdxQ9UpHqnLLmN4b+Kjn7GuynHOObNlFm6ygMS271BfB40xpGeDbVvxMdaUisBHo1aS
	LsHZwv+lshmpakdF1td25iy9CEDRJfZ2ZcCIBY2HKrAjDH2/l8SruPMtkTL2DPLWLLl7silAt/pQ7
	DLjm8DxOl1XmothZ2rRoSfAD/KlPBmVR2XhK+uWQpvbM9HN0gFBXlh9yvPsBS9WSBvcoVf8JhKTy2
	He2UA4KvZL4c4YMt1SCg0iY4TLW3oAFqEdG/0aEclul9bUJdeSHtrf6IUs1NYf/y0UqP/1aKZnHLc
	UrEEQm03lHCSE+c0+ZHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nr9sO-00Gl5F-GD; Wed, 18 May 2022 02:57:28 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nr9sM-00Gl3h-Oo; Wed, 18 May 2022 02:57:28 +0000
X-UUID: 07484cca59944c729c2947f2ac843793-20220517
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.5, REQID:ef1cd145-f720-4658-9965-289b371bae10, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
 ON:release,TS:0
X-CID-META: VersionHash:2a19b09, CLOUDID:526c91e2-edbf-4bd4-8a34-dfc5f7bb086d,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
 ,QS:0,BEC:nil
X-UUID: 07484cca59944c729c2947f2ac843793-20220517
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <rex-bc.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1763928979; Tue, 17 May 2022 19:57:19 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 17 May 2022 19:51:02 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Wed, 18 May 2022 10:51:00 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 18 May 2022 10:51:00 +0800
Message-ID: <59eb477a3e846e80374b6fe0aa9dd467f2c947f6.camel@mediatek.com>
Subject: Re: [PATCH v2 0/3] Support MediaTek devapc for MT8186
From: Rex-BC Chen <rex-bc.chen@mediatek.com>
To: <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
 <matthias.bgg@gmail.com>
CC: <runyang.chen@mediatek.com>, <linux-mediatek@lists.infradead.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Date: Wed, 18 May 2022 10:51:00 +0800
In-Reply-To: <20220504115501.3490-1-rex-bc.chen@mediatek.com>
References: <20220504115501.3490-1-rex-bc.chen@mediatek.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220517_195726_825421_16ABABBA 
X-CRM114-Status: GOOD (  16.85  )
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

On Wed, 2022-05-04 at 19:54 +0800, Rex-BC Chen wrote:
> This series is for supporting devapc implementation in MT8186.
> 
> V2:
> - Add a patch to separate register offsets from mtk_devapc_data.
> 
> V1:
> - Add dt-binding and add devapc data for MT8186.
> 
> Rex-BC Chen (3):
>   dt-bindings: soc: mediatek: devapc: Add bindings for MT8186
>   soc: mediatek: devapc: Separate register offsets from
> mtk_devapc_data
>   soc: mediatek: devapc: Add support for MT8186
> 
>  .../bindings/soc/mediatek/devapc.yaml         |  1 +
>  drivers/soc/mediatek/mtk-devapc.c             | 45 ++++++++++++-----
> --
>  2 files changed, 31 insertions(+), 15 deletions(-)
> 

Hello Matthias,

Could you spare some time to review this series?
Patches of this this series are reviewed.
The purpose of this series is to add support for MT8186 devapc and it
just adds some driver data and compatible for mt8186.

Thanks for your support!

BRs,
Rex


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
