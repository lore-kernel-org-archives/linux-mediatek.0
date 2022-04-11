Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4DE9C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Apr 2022 11:21:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eP4L+zPqNpjNGQbF5vKQL/EIw54xLLdwNbHvcFtRhS0=; b=Z50jReoDiCzKeS
	P8RxHUAScXIC5C8/KW6BA7ixJwibMPd1/X6CghQdF6wTdflRiO5zM2/qGLYAh3zuY8xi+0GXBvUP6
	MGbxb6iqjfj2vUEqHhCjTFtTzIQIkhMZmgFWZ6e6l8w1/vqDiYpDbnKSrF/h/z5AR9Sh/+4uqG5Xb
	joG/6h/XBefakShEfgB8z07XhLupsC4xprUab0lBx2E5ESr6HnKGqq7IKv7qT8zml7Dg+xRj7E3EP
	wMxZr79ByDgsPAo70NJU7FML9OuO0wkb/Fn+hDQfhW+lcbvYrJZDFNdui1l8CY8E8gFW2Ouph9O2F
	I7lSd3VkZIPggPreDJ3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nds6Q-008dDS-Rw; Mon, 11 Apr 2022 11:21:02 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nds5N-008cZm-8z; Mon, 11 Apr 2022 11:19:58 +0000
X-UUID: 4030f525342a4e3bad119eda7325bd12-20220411
X-UUID: 4030f525342a4e3bad119eda7325bd12-20220411
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <rex-bc.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 78991425; Mon, 11 Apr 2022 04:19:49 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 11 Apr 2022 04:14:14 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 11 Apr 2022 19:14:13 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 11 Apr 2022 19:14:13 +0800
Message-ID: <869b905e18571debcd5682b61b8cd8cafd0f3ebb.camel@mediatek.com>
Subject: Re: [PATCH V2 14/15] cpufreq: mediatek: Add support for MT8186
From: Rex-BC Chen <rex-bc.chen@mediatek.com>
To: Kevin Hilman <khilman@baylibre.com>, <rafael@kernel.org>,
 <viresh.kumar@linaro.org>, <robh+dt@kernel.org>, <krzk+dt@kernel.org>
CC: <matthias.bgg@gmail.com>, <jia-wei.chang@mediatek.com>,
 <roger.lu@mediatek.com>, <hsinyi@google.com>, <linux-pm@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Date: Mon, 11 Apr 2022 19:14:12 +0800
In-Reply-To: <7h8rsf5lih.fsf@baylibre.com>
References: <20220408045908.21671-1-rex-bc.chen@mediatek.com>
 <20220408045908.21671-15-rex-bc.chen@mediatek.com>
 <7h8rsf5lih.fsf@baylibre.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220411_041957_333797_D94F956A 
X-CRM114-Status: GOOD (  11.07  )
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

On Fri, 2022-04-08 at 14:10 -0700, Kevin Hilman wrote:
> Rex-BC Chen <rex-bc.chen@mediatek.com> writes:
> 
> > From: Jia-Wei Chang <jia-wei.chang@mediatek.com>
> > 
> > The platform data of MT8186 is different from previous MediaTek
> > SoCs,
> > so we add a new compatible and platform data for it.
> > 
> > Signed-off-by: Jia-Wei Chang <jia-wei.chang@mediatek.com>
> > Signed-off-by: Rex-BC Chen <rex-bc.chen@mediatek.com>
> 
> There's no upstream DT for MT8186, so I"m curious how this was
> tested/valiated with upstream?
> 
> Kevin

Hello Kevin,

Thanks for your review.
The series of MT8186 DTS is still upstreaming.
From Matthias's comment, he will review MT8186 DTS series after clock
series is accepted.

We just now test MT8186 cpufreq on chromeos kernel v5.15.

MT8186 DTS series:
message id:20220311130732.22706-1-allen-kh.cheng@mediatek.com

BRs,
Rex


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
