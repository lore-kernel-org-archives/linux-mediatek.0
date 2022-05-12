Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F1C7C433FE
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 May 2022 05:37:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DAm9QZzF6b1COZXc5SaaTqNoL8JTekWOS9cbCNTFJFM=; b=djaenBNgYi/VRv
	inp6/K5ObG21ObjhEqbkbZRRFikQf9/DmE0g60D6XEDDY6ITUbftK4RomxYDpI5z5KT1A0xktowWU
	0HYviubXsFx+aOBNdNH0zDjjbvM63xWIucSTKvd7rAucJZSFf+hc2DPK6hD7FOoKjK1HmBVVyexo4
	jhUaNRC7/mw2JDx8Mlc3NGar9zHmf//fqZhPf81jsWKroq3GWt6xy8xygn8XNZQXQUzpaTLXqqhaV
	w5Vkg8XP5SrBbNHyywPve5ctZviQGSXsXhhyLZ2uR4OIa5HLZnKlKq3JX+qsSCNmZJOcCIteTMZXc
	y3DD6zOM2g23DpzJEuHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1np1Vg-00A92Y-Qa; Thu, 12 May 2022 05:37:12 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1np1UW-00A8Qx-9f; Thu, 12 May 2022 05:36:01 +0000
X-UUID: 2ce2b1f0ac4b4d24bb7bc16b1cca2e48-20220511
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.4, REQID:406213b2-201e-4a7d-b89a-d9e37c7d33aa, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
 ON:release,TS:0
X-CID-META: VersionHash:faefae9, CLOUDID:5bfa27f6-13a6-4067-b017-3b2864319134,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,File:nil,QS:0,BEC:nil
X-UUID: 2ce2b1f0ac4b4d24bb7bc16b1cca2e48-20220511
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <rex-bc.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1840492217; Wed, 11 May 2022 22:35:51 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 11 May 2022 22:34:01 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 12 May 2022 13:33:59 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 12 May 2022 13:33:59 +0800
Message-ID: <af82434adea0b648d74ed5ffd123e0faaaac6508.camel@mediatek.com>
Subject: Re: [PATCH v6 00/10] cpufreq: mediatek: Cleanup and support MT8183
 and MT8186
From: Rex-BC Chen <rex-bc.chen@mediatek.com>
To: Viresh Kumar <viresh.kumar@linaro.org>
CC: <rafael@kernel.org>, <robh+dt@kernel.org>, <krzk+dt@kernel.org>,
 <matthias.bgg@gmail.com>, <jia-wei.chang@mediatek.com>,
 <roger.lu@mediatek.com>, <hsinyi@google.com>, <khilman@baylibre.com>,
 <angelogioacchino.delregno@collabora.com>, <linux-pm@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Date: Thu, 12 May 2022 13:33:59 +0800
In-Reply-To: <20220512052732.iqphgpveoyrqjlqg@vireshk-i7>
References: <20220505115226.20130-1-rex-bc.chen@mediatek.com>
 <20220506042004.hqzpb66shak4y7rz@vireshk-i7>
 <86851bd03128cc61082d516ebff929d3637063cb.camel@mediatek.com>
 <20220512052732.iqphgpveoyrqjlqg@vireshk-i7>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220511_223600_389405_E36186A1 
X-CRM114-Status: GOOD (  14.07  )
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

On Thu, 2022-05-12 at 10:57 +0530, Viresh Kumar wrote:
> On 06-05-22, 14:32, Rex-BC Chen wrote:
> > As for rest patch:
> > The cci series [1] is still under reviewing and it depends on
> > chanwoo's
> > series [2].
> > Therefore, I think it won't be so quick to be acked for these
> > patches
> > in my series.
> 
> I have applied 1, 6-7 now. I hope it is safe to apply them ? What
> about other
> three, can you get them acked now ?
> 

Hello Viresh,

Thanks for your help!
Matthias is not the member of mediatek, so I think we still need his
feedback for these three patches.

BRs,
Rex


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
