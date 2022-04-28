Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06702C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 Apr 2022 11:18:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5Y4DIr7CDaKB/DPqhuon3MM6a2fnRPczHqRItN/xOrE=; b=X8nvJO8l5aOM2O
	NKTCNEnb37/89a+n6z6kbKFbzr5EZgKXS4H/i/XBIF3RJSPvYLjFzZgR8nFIzwgJOcrn4/2RaPBwg
	dN5CEDffVt+zgM0Hhjiq9VQ/D41gVRMUg37Ub16xoUtnKwyO2e8zHBDZrGznrDo7jWZSbhw6RPWy9
	qKc39nMsYDSllhyw7JbTQgCFCqDhp8KoMlCcyLaT++94vhVGjTEbr0v4y1gy/X9G4dkg//KZangnk
	jlN94TEkrTm9nNrFpkIul3ziPDGK0+LhusV9djd4WA8sNNbvbr53z+nJE5LY1lim6ZNURTaJsnYkq
	ESGOct2yEyyKhTRvcHaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nk29w-006UJX-GG; Thu, 28 Apr 2022 11:18:08 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nk28X-006Tlq-9V; Thu, 28 Apr 2022 11:16:44 +0000
X-UUID: 5927e988ed8a46608a90b3e1ca54df42-20220428
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.4, REQID:cbc27842-8eb9-4afa-8328-5d073ba77223, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
 ON:release,TS:0
X-CID-META: VersionHash:faefae9, CLOUDID:bc8dd3c6-85ee-4ac1-ac05-bd3f1e72e732,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,File:nil,QS:0,BEC:nil
X-UUID: 5927e988ed8a46608a90b3e1ca54df42-20220428
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <rex-bc.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1002336782; Thu, 28 Apr 2022 04:16:36 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 28 Apr 2022 04:16:34 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Thu, 28 Apr 2022 19:16:33 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 28 Apr 2022 19:16:32 +0800
Message-ID: <346736a339bed576817179ded3795d61f71fa06a.camel@mediatek.com>
Subject: Re: [PATCH V4 07/14] cpufreq: mediatek: Add .get function
From: Rex-BC Chen <rex-bc.chen@mediatek.com>
To: Viresh Kumar <viresh.kumar@linaro.org>
CC: <rafael@kernel.org>, <robh+dt@kernel.org>, <krzk+dt@kernel.org>,
 <matthias.bgg@gmail.com>, <jia-wei.chang@mediatek.com>,
 <roger.lu@mediatek.com>, <hsinyi@google.com>, <khilman@baylibre.com>,
 <angelogioacchino.delregno@collabora.com>, <linux-pm@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Date: Thu, 28 Apr 2022 19:16:32 +0800
In-Reply-To: <20220427031141.or2owu5wrh2cadfo@vireshk-i7>
References: <20220422075239.16437-1-rex-bc.chen@mediatek.com>
 <20220422075239.16437-8-rex-bc.chen@mediatek.com>
 <20220425053548.72w2jh2g6lpzgz6g@vireshk-i7>
 <64c690e8edf493ec0a4a14e0fdaad2d8e88e6da7.camel@mediatek.com>
 <20220425100058.4kbvmpi63ygni6k5@vireshk-i7>
 <078b1f9b39690da98cbd3c4528ba28374a097083.camel@mediatek.com>
 <20220427031141.or2owu5wrh2cadfo@vireshk-i7>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220428_041641_376406_72A003FA 
X-CRM114-Status: GOOD (  25.40  )
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

On Wed, 2022-04-27 at 08:41 +0530, Viresh Kumar wrote:
> On 26-04-22, 19:13, Rex-BC Chen wrote:
> > We have a non-upstream driver which tries to get frequency by
> > 'cpufreq_get'.
> 
> This is the right thing to do there.
> 
> > When we use that non-upstream driver, 'cpufreq_verify_current_freq'
> > will be further invoked by 'cpufreq_get' and it would cause voltage
> > pulse issue as I described previously.
> 
> I see this will eventually resolve to __cpufreq_driver_target(),
> which
> should return without any frequency updates.
> 

Hello Viresh,

Yes, the call stack will eventually go to __cpufreq_driver_target.
However, we can observe the mismatch between target_freq and policy-cur 
with a tiny difference.
e.g.
[ 553.065356] cpufreq: target for CPU 0: 500000 kHz, relation 0,
requested 500000 kHz
[ 553.066366] cpufreq: target_freq/policy->cur: 500000/499999 kHz

We check the assignment of policy->cur could be either from
cpufreq_driver->get_intermediate or from cpufreq_driver->get.
But it is strange to have the frequency value like 499999 kHz.
Is the result of tiny frequency difference expected from your point of
view?

> What do you mean by "voltage pulse" here? What actually happens which
> you want to avoid.
> 

When cpufreq is fixed to lowest opp, "voltage pulse" is a quick voltage
rising and falling phenomenon which can be observed if 'cpufreq_get' is
invoked.
From top of view, if 'cpufreq_get' is NOT invoked in that condition,
the voltage pulse will no longer occur.
That's why we add this patch for this series.

> > Therefore, we apply the solution in this series.
> 
> I won't call it a solution but a Bug as .get() is supposed to read
> real freq of the hardware.
> 
> > Recently, we found that using 'cpufreq_generic_get' directly in our
> > non-upstream driver can do the same thing without pulse issue.
> 
> That would be an abuse of the cpufreq_generic_get() API. It is ONLY
> allowed to be used while setting .get callback in the driver.
> 

Thank you for sharing the correct information.
Is it possible to get frequency (API) a simple way, like get current
opp frequency?

BRs,
Rex


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
