Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B6FBC54EE9
	for <linux-mediatek@archiver.kernel.org>; Wed, 14 Sep 2022 01:26:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L4/UTbLoT54Ap+WkmAw9YNdo09U8g//h3FWaRHVm7nM=; b=U3lhWMIwyOFGaUHc+ZqpjSQ+L8
	15byx9x1BYM8BXbKYWpn6DUcY9RfIBdy27YhiG/F+/AMHvdqc9oEiiEn3R2dTtLG8fYxJWnXWEw6q
	CAkJONcwR4fKm700tEMiRH07pk9AyGLn61a4NYgZeKAvHkTApOApjwKx3w99cNTsONRnDdbxz5wEn
	Z4HxAA8hxm5GIjnQEe2Php5m23l9D8H8rw215gy8JM/iCy5jqnqOdikhHGLWp2IemhEFdAfT7YNdm
	SmlL7aNv5XStcg1FMleF44polbyaQc+DeNaI0imDUk4i+iukc9NDZ1Lrta8bnpqHvUbJNJMhOjfLa
	fpDssGUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYHAu-003U3M-Al; Wed, 14 Sep 2022 01:26:48 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYHAZ-003TQO-CA; Wed, 14 Sep 2022 01:26:29 +0000
X-UUID: 355ddeb9a2b449238be934503db9b827-20220913
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=L4/UTbLoT54Ap+WkmAw9YNdo09U8g//h3FWaRHVm7nM=;
	b=gG7lgnh66YqjMMKnbL+r+nvb05OX90lqnE8PH8VyYsQkdHiBPGCfeAPbzX5MUYiqOb/qWaKA5ZYqxZvK2AuCN4Kp9YeUToBRqvcpP16vyK5kpkRwZSP7fKsL8eyCeJzpRlOXQ5wTcmo0tGoN74xvzSs5LxoR+fWvcvx0tBOC0aQ=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.11,REQID:fec8c405-a0df-4605-9b83-2122903af8c7,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:39a5ff1,CLOUDID:9dc153ec-2856-4fce-b125-09d4c7ebe045,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 355ddeb9a2b449238be934503db9b827-20220913
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <jason-jh.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 687747126; Tue, 13 Sep 2022 18:26:19 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Wed, 14 Sep 2022 09:26:15 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Wed, 14 Sep 2022 09:26:15 +0800
Message-ID: <5f151f5e03fd5dd9822c940cfac8cdf211d78f6f.camel@mediatek.com>
Subject: Re: [PATCH RESEND v3 8/9] drm/mediatek: Add clear RELAY_MODE bit to
 set gamma
From: Jason-JH Lin <jason-jh.lin@mediatek.com>
To: CK Hu <ck.hu@mediatek.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, "Rob
 Herring" <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: Rex-BC Chen <rex-bc.chen@mediatek.com>, Singo Chang
	<singo.chang@mediatek.com>, <dri-devel@lists.freedesktop.org>,
	<linux-mediatek@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Date: Wed, 14 Sep 2022 09:26:15 +0800
In-Reply-To: <ecdb209437e78b3273374ef963fd2c5c64ba88fd.camel@mediatek.com>
References: <20220912013006.27541-1-jason-jh.lin@mediatek.com>
	 <20220912013006.27541-9-jason-jh.lin@mediatek.com>
	 <ecdb209437e78b3273374ef963fd2c5c64ba88fd.camel@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220913_182627_475020_EF222486 
X-CRM114-Status: GOOD (  15.19  )
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

Hi CK,

Thanks for the reviews.

On Mon, 2022-09-12 at 10:26 +0800, CK Hu wrote:
> Hi, Jason:
> 
> On Mon, 2022-09-12 at 09:30 +0800, Jason-JH.Lin wrote:
> > Since the bootlaoder may set the RELAY_MODE to gamma be for the
> > kerenl,
> > we have to clear the RELAY_MODE bit to make sure that the gamma is
> > enabled correctly.
> > 
> > Fixes: b10023b03082 ("FROMGIT: drm/mediatek: Separate gamma
> > module")
> 
> Fixes: 69a4237ab1d1 ("drm/mediatek: Separate gamma module")
> 
> and move this patch to the first patch of this series so this patch
> could be picked to early stable branch.
> 
> Regards,
> CK

Ok, I'll move it to the first patch.
Regards,
Jason-JH.Lin


