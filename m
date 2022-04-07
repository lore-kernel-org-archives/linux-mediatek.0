Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE8ABC433F5
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 Apr 2022 09:06:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OV5frMInhScoBd1qO8Ti5Rx7E45SVmwzriY7i58svQA=; b=xwp/ZjxQsmoNxg
	Nr/BJ5ASspnNqPJ5xHhTPtMSf91Ahmdbx8p9+8YJ5utVEuiKdeEpSTssdVKKku8oZzp95hyWVYpvR
	4aExWrEKA8LpqkgqmsS03yrUp2PCCPB/omuexBMAxfrN0ns1J+ABqgIQ9D/t84+8KMX54Bn0Yg5CI
	wrUBLdeboRuEsvpzte95Jq7OxNHd2RpaNQIkbLGSzkvEp0f9Cd+KWkTQZf0nr0xGmicLjgzf48/vk
	2yV0LcW+3twMPGsO6XPyCx8SPatAlk8ZkR4JBSslEVK3HPltvk/x5A6XbneXkE16qNlCBxbM6fxUa
	W91gK0VSdXGQeXijffxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ncO6A-00AhEk-7k; Thu, 07 Apr 2022 09:06:38 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ncNjy-00AWet-6p; Thu, 07 Apr 2022 08:43:43 +0000
X-UUID: 949243d68fb9492a925cc068f862d7d5-20220407
X-UUID: 949243d68fb9492a925cc068f862d7d5-20220407
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <rex-bc.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 568347240; Thu, 07 Apr 2022 01:43:40 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 7 Apr 2022 01:43:38 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 7 Apr 2022 16:43:37 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 7 Apr 2022 16:43:37 +0800
Message-ID: <4cc43ee8c2b9e3f9eb42a4a762ab637138df6a89.camel@mediatek.com>
Subject: Re: [PATCH 3/3] dt-bindings: display: mediatek: Correct disp_aal
 binding for MT8192
From: Rex-BC Chen <rex-bc.chen@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>, "robh+dt@kernel.org"
 <robh+dt@kernel.org>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>
CC: "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>, "airlied@linux.ie"
 <airlied@linux.ie>, Yongqiang Niu
 =?UTF-8?Q?=28=E7=89=9B=E6=B0=B8=E5=BC=BA=29?= <yongqiang.niu@mediatek.com>,
 Jason-JH Lin =?UTF-8?Q?=28=E6=9E=97=E7=9D=BF=E7=A5=A5=29?=
 <Jason-JH.Lin@mediatek.com>, Nancy Lin
 =?UTF-8?Q?=28=E6=9E=97=E6=AC=A3=E8=9E=A2=29?= <Nancy.Lin@mediatek.com>,
 Allen-KH Cheng =?UTF-8?Q?=28=E7=A8=8B=E5=86=A0=E5=8B=B3=29?=
 <Allen-KH.Cheng@mediatek.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "linux-mediatek@lists.infradead.org"
 <linux-mediatek@lists.infradead.org>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Date: Thu, 7 Apr 2022 16:43:37 +0800
In-Reply-To: <2449070b-d7e1-122f-abe6-4148855a9aba@collabora.com>
References: <20220406094654.29722-1-rex-bc.chen@mediatek.com>
 <20220406094654.29722-4-rex-bc.chen@mediatek.com>
 <2449070b-d7e1-122f-abe6-4148855a9aba@collabora.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220407_014342_322006_EAF8E750 
X-CRM114-Status: GOOD (  10.37  )
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

On Wed, 2022-04-06 at 18:40 +0800, AngeloGioacchino Del Regno wrote:
> Il 06/04/22 11:46, Rex-BC Chen ha scritto:
> > The driver data for MT8192 is the same with MT8183. Therefore, we
> > correct it.
> > 
> > Signed-off-by: Rex-BC Chen <rex-bc.chen@mediatek.com>
> 
> Reviewed-by: AngeloGioacchino Del Regno <
> angelogioacchino.delregno@collabora.com>
> 
> ...though, from what I know, you should also move MT8195 down there!

Hello Angelo,

We have some misunderstanding for disp_aal of MT8195.
The MT8195 has independent disp_gamma which is seperated from disp_aal
since MT8173.
Therefore, for MT8195, the disp_aal should be the same with MT8183.
I have checked this with Jason-JH Lin who is drm owner of MT8195.

I will update disp_aal binding in next version.

BRs,
Rex


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
