Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30EBBC433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 17 Jun 2022 09:30:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n/4Y8owzv2XkMMe5Sjv1ZlZ4Zc77NKJ4gCJ4QSwRlc8=; b=xVQ8CNyNgAzD/TkF0OntTxypne
	6H18RWRHXVqvKcoyDvjGPupScBsdKBt4Cc9J7gloiltFaIZzjw//jBbX6DfHJjG54hJlIEP/FLLPx
	re6v3dytmFhHO4XFMEw5IWV9xkE24ppk8ZTDydu9dcmOWlhXHuL7R2dVHwXuPbc20FPLyURhSqOlJ
	n8VomHit2H4W9FQYFbimELbasPqZwpK/fPoLJtKz0u83MGoiNQyvox0gVN0dUh9bm3h1JLMq280zQ
	jFKch2IFhgbxB813loOQpRo6IIfodDdDEECss2bHlY2UCWOrvStrT1KTDXM+lRbr0tO5KZkm+ZcME
	E0BhLaPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o28Is-006goV-4I; Fri, 17 Jun 2022 09:30:10 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o28Io-006gmL-4F
	for linux-mediatek@lists.infradead.org; Fri, 17 Jun 2022 09:30:08 +0000
X-UUID: 4d9a3f9101324c59b897d18201e6a3ea-20220617
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.6,REQID:bca2bda5-6193-47af-b37c-6c365613f3ee,OB:0,LO
	B:0,IP:0,URL:5,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:5
X-CID-META: VersionHash:b14ad71,CLOUDID:95f7e548-4c92-421c-ad91-b806c0f58b2a,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:1,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: 4d9a3f9101324c59b897d18201e6a3ea-20220617
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
	(envelope-from <deren.wu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
	with ESMTP id 100610120; Fri, 17 Jun 2022 02:29:55 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 17 Jun 2022 02:29:53 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3;
 Fri, 17 Jun 2022 17:29:52 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 17 Jun 2022 17:29:52 +0800
Message-ID: <d441fbdebcf2576bd08b2ad032b4bc4d184fdccc.camel@mediatek.com>
Subject: Re: [PATCH] mt76: mt7921: fix aggregation subframes setting to HE
 max
From: Deren Wu <deren.wu@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>
CC: Sean Wang <sean.wang@mediatek.com>, Soul Huang <Soul.Huang@mediatek.com>,
	YN Chen <YN.Chen@mediatek.com>, Leon Yen <Leon.Yen@mediatek.com>, "Eric-SY
 Chang" <Eric-SY.Chang@mediatek.com>, KM Lin <km.lin@mediatek.com>, Robin Chiu
	<robin.chiu@mediatek.com>, CH Yeh <ch.yeh@mediatek.com>, Posh Sun
	<posh.sun@mediatek.com>, Eric Liang <Eric.Liang@mediatek.com>, Stella Chang
	<Stella.Chang@mediatek.com>, Evelyn Tsai <evelyn.tsai@mediatek.com>, "Ryder
 Lee" <ryder.lee@mediatek.com>, Shayne Chen <shayne.chen@mediatek.com>,
	linux-wireless <linux-wireless@vger.kernel.org>, linux-mediatek
	<linux-mediatek@lists.infradead.org>
Date: Fri, 17 Jun 2022 17:29:52 +0800
In-Reply-To: <b7e3006a-03a9-fad6-3f57-10aed678f211@nbd.name>
References: <7f5145276d732cb4aebcbffd6fc4a5eb852dd3be.1655393246.git.deren.wu@mediatek.com>
	 <b7e3006a-03a9-fad6-3f57-10aed678f211@nbd.name>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220617_023006_221441_617A6C5D 
X-CRM114-Status: GOOD (  14.98  )
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

Hi Felix,

On Fri, 2022-06-17 at 10:39 +0200, Felix Fietkau wrote:
> On 16.06.22 17:57, Deren Wu wrote:
> > From: Deren Wu <deren.wu@mediatek.com>
> > 
> > mt7921/mt7922 support HE max aggregation subframes 256 for both
> > tx/rx.
> > Get better throughput then before.
> > 
> > Fixes: 94bb18b03d43 ("mt76: mt7921: fix max aggregation subframes
> > setting")
> > Tested-by: Ming Yen Hsieh <mingyen.hsieh@mediatek.com>
> > Reviewed-by: Sean Wang <sean.wang@mediatek.com>
> > Signed-off-by: Deren Wu <deren.wu@mediatek.com>
> 
> When I made the change that you're reverting here, I used the values 
> from the reference SDK that I got, and the change actually seemed to 
> improve performance in my tests.
> Did something change in the firmware, or is there a related chipset 
> difference between 7921 and 7922?
> 
> - Felix
> 


Yes, there was some fw changes ready in 2021 and the SDK was updated as
well. After some performance re-check, the test result is much better
with the new patch. We think the max-size-256 can be applied in
mt7921/mt7922 driver now. 

PS: mt7921/mt7922 are the same. Both of them can support this size.

Thanks,
Deren


