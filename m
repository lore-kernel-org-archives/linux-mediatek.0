Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0034C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri,  4 Mar 2022 09:59:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Lw8em4EfuTktvQMUI9K2UGgsxbQd6KYgwhavzIqbytI=; b=rCWSZWa4kNsROv
	+UbEcq1ilmQwzjLUjmsYOhc57zHOhJYIsrhfBxwCipq9YnG9BUbJXRVAAP2+jo2v7orOErNI/BGZc
	J2i2OOCg8eMVBQmvDGe2Vb4E61wV8pdXP3RsCh6EXZMEBPtthY1s4IWj2GCqqr/CSHifBiuaEs04B
	QSwPPTzNdLkPBaLnVUfS/0XiwU1zcLmF+Qu0JTP0OnbUVqDYgab7fp/P+GPLvRjj/YJgx3VagsajE
	1nnyKAjXOyEmfS6YbluPaUaJ5SGoaXzg/xHlW5kyU3YE+M5KVlVTTQLvm26CuWm1M2/ZmMWV9zxn9
	UGvryFK3fLRADK3tYpFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nQ4ie-009RfP-Fi; Fri, 04 Mar 2022 09:59:28 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nQ4gk-009Qtp-G0; Fri, 04 Mar 2022 09:57:33 +0000
X-UUID: baeeb2f80fae4f7db46a9545d7f090ff-20220304
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=MvTeGFfZNx5aPecZCd6nCPTViNt/b5dswDShJFO4xsE=; 
 b=Y3kmyuC0IGNDj+64mbM98JPTgkJToxVOITGKEqSOyTSRkVHreyL6Bek6kj9MnuuNphaM1/F6zMLuZQNL24pyXHahxs9zc0PlcUCcUFhsb76yQwnDsARSgQGm+CAaf1W6p+749ZUnwbCWKta9yaF3u3oUl7lhxrrKaiQp1oMMVpo=;
X-UUID: baeeb2f80fae4f7db46a9545d7f090ff-20220304
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <yong.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1868415569; Fri, 04 Mar 2022 02:57:24 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 4 Mar 2022 01:57:22 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Fri, 4 Mar 2022 17:57:21 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 4 Mar 2022 17:57:20 +0800
Message-ID: <123cb154ca0e87504c2b663ebdca2ccad967776f.camel@mediatek.com>
Subject: Re: [PATCH v5 00/34] MT8195 IOMMU SUPPORT
From: Yong Wu <yong.wu@mediatek.com>
To: Joerg Roedel <joro@8bytes.org>
CC: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, "Rob
 Herring" <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>, Tomasz Figa
 <tfiga@chromium.org>, <linux-mediatek@lists.infradead.org>,
 <srv_heupstream@mediatek.com>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <iommu@lists.linux-foundation.org>, Hsin-Yi Wang <hsinyi@chromium.org>,
 <youlin.pei@mediatek.com>, <anan.sun@mediatek.com>,
 <xueqi.zhang@mediatek.com>, <yen-chang.chen@mediatek.com>,
 <mingyuan.ma@mediatek.com>, <yf.wang@mediatek.com>, <libo.kang@mediatek.com>, 
 <chengci.xu@mediatek.com>
Date: Fri, 4 Mar 2022 17:57:19 +0800
In-Reply-To: <YiHZ4lq2QClkdyxS@8bytes.org>
References: <20220217113453.13658-1-yong.wu@mediatek.com>
 <YhzBSsn/zUlGg5JE@8bytes.org>
 <7ba0ee87-c193-9834-d0b4-ff3e06ced82b@collabora.com>
 <5ed9278fa0b72b993512cff2316218ab88cafe50.camel@mediatek.com>
 <YiHZ4lq2QClkdyxS@8bytes.org>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220304_015732_005042_944BD0CA 
X-CRM114-Status: GOOD (  16.93  )
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

On Fri, 2022-03-04 at 10:20 +0100, Joerg Roedel wrote:
> On Tue, Mar 01, 2022 at 03:49:18PM +0800, Yong Wu wrote:
> > 
https://patchwork.kernel.org/project/linux-mediatek/list/?series=592275
> 
> Okay, thanks for the clarification. So I can't include linux-next in
> my
> tree, so I think the best option is to wait until v5.18-rc1 (or
> rather
> -rc3, which is where I start merging new stuff) is out and merge it
> then.
> Another option would be if there is a branch which only contains the
> dependencies of this patch-set, which I could pull into my tree, but
> it
> is already pretty late in the cycle.
> So please re-send when the next -rc1 is out and I will pick it up
> then.

Thanks for this info. I will re-send this patchset after the next -rc1.

Could you help apply Dafna's patchset at this time? This patchset
depends on it and it won't conflict with the others.

Thanks.

> 
> Regards,
> 
> 	Joerg
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
