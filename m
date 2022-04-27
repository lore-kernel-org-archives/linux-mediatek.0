Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99BCBC433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 Apr 2022 02:18:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RDsIjb7ibBSG6EZ8A0Uw8R42LenbB70hvI1s4kG0pbs=; b=uKD7UbYEav+/7m
	NIz44LChGXKVD5UhG2sRL8iy+pYkZBz74I5yo9B6mMrekIcxvDApGrRrZaysAnzMn1blCNYl61qMe
	Cue/jeW1bYGudpRQLdRJp74hccQqEFgxM3WRD3xWOdr2P4KjZR4gBzQeK4g1rKJVBiBm6/asao5px
	bf47xP1xG/8XhYTAUTYHcT2DE7GgAMgbu7WJaiDyx6X2jMhSPIrkRKOvsAl8pbZcWTPkgw0rDM6pU
	imyecBhOa+s/yWfnqoUebnZvJrQ0QKT1eOrdcMFRNWgGVp+R+5jI+S4lv9+1WuLRrxjm2RReAs/3N
	noV1q4HpFmVQqulKAxUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1njXFy-00H2Db-3E; Wed, 27 Apr 2022 02:18:18 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1njXFv-00H2Cl-5G; Wed, 27 Apr 2022 02:18:16 +0000
X-UUID: 51d6b399422e492884894281d51e8b36-20220426
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.4, REQID:4d57e86a-a779-472d-9f8c-4326c4e18dde, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
 ON:release,TS:0
X-CID-META: VersionHash:faefae9, CLOUDID:d96899c6-85ee-4ac1-ac05-bd3f1e72e732,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,File:nil,QS:0,BEC:nil
X-UUID: 51d6b399422e492884894281d51e8b36-20220426
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <miles.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 448082880; Tue, 26 Apr 2022 19:18:06 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 26 Apr 2022 19:13:09 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 27 Apr 2022 10:13:08 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 27 Apr 2022 10:13:07 +0800
From: Miles Chen <miles.chen@mediatek.com>
To: <robin.murphy@arm.com>
CC: <angelogioacchino.delregno@collabora.com>, <hverkuil-cisco@xs4all.nl>,
 <iommu@lists.linux-foundation.org>, <joro@8bytes.org>, <jroedel@suse.de>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>, <matthias.bgg@gmail.com>,
 <mchehab@kernel.org>, <miles.chen@mediatek.com>, <will@kernel.org>,
 <yong.wu@mediatek.com>
Subject: Re: [PATCH v2] iommu/mediatek: fix NULL pointer dereference when
 printing dev_name
Date: Wed, 27 Apr 2022 10:13:08 +0800
Message-ID: <20220427021308.22855-1-miles.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <9debe3ab-603d-0d30-a6aa-8963b48e83d4@arm.com>
References: <9debe3ab-603d-0d30-a6aa-8963b48e83d4@arm.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220426_191815_256291_86D4962A 
X-CRM114-Status: UNSURE (   8.70  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

hi Robin,

>> -	link = device_link_add(dev, larbdev,
>> -			       DL_FLAG_PM_RUNTIME | DL_FLAG_STATELESS);
>> -	if (!link)
>> -		dev_err(dev, "Unable to link %s\n", dev_name(larbdev));
>> +	if (larbdev) {
>
>Until the MT8195 infra MMU support lands, is there ever a case where 
>it's actually valid for larbdev to be NULL? If not, I think it would be 
>a lot clearer to explicitly fail the probe here, rather than silently 
>continue and risk fatal errors, hangs, or other weird behaviour if 
>there's no guarantee that the correct LARB is powered up (plus then the 
>release callbacks wouldn't need to worry about it either).

Thanks, I will do probe fail in patch v3 and remove the release modification.

thanks,
Miles

>
>Robin.


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
