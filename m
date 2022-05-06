Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4598C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri,  6 May 2022 06:43:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Kuu1j0B/ejuZV9FbUaOYv83JgaROfFRkrQgoMql21kY=; b=zrdg/xDH43XSuq
	CVeo06xRMCArOHHomhDfpMQ0sGQIhYWcMsa49eHEQLSUE7Z96bj/A3H6xHcsqKq4YKQMOcBbOtwSl
	SDsP3e1D+h5MCSm/MZ8Rc1sNDAbpxecpvJcRe4RIHKpo5DpdVUXAO6sK5RXY9foie6NWyyAjPHHqV
	UAn/hup/6Mvh3+JonX2v8rNza/lCLa5CfR1VIeaXEPbmKh0ZlsTBmN5ddEWl8+15QdtdneOV5L7pq
	gfly0yx2hFunL5WQqzjdE+pHevQgI/+Zifw0fQvqCs27WH7tWD6auhQYGWW6ta7lwUw8LlQ2Yi2r6
	hXouGHodt82alIgdjOwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nmrgR-001g9z-Jv; Fri, 06 May 2022 06:43:23 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nmrg2-001g2f-Fw; Fri, 06 May 2022 06:43:03 +0000
X-UUID: 53df7270405846eca516fc1b24e867e8-20220505
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.4, REQID:404a766b-17c4-48f1-a89c-400fdc186dec, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
 ON:release,TS:0
X-CID-META: VersionHash:faefae9, CLOUDID:30f26b16-2e53-443e-b81a-655c13977218,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,File:nil,QS:0,BEC:nil
X-UUID: 53df7270405846eca516fc1b24e867e8-20220505
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <rex-bc.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 2117847916; Thu, 05 May 2022 23:42:48 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 5 May 2022 23:32:46 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Fri, 6 May 2022 14:32:44 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 6 May 2022 14:32:44 +0800
Message-ID: <86851bd03128cc61082d516ebff929d3637063cb.camel@mediatek.com>
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
Date: Fri, 6 May 2022 14:32:44 +0800
In-Reply-To: <20220506042004.hqzpb66shak4y7rz@vireshk-i7>
References: <20220505115226.20130-1-rex-bc.chen@mediatek.com>
 <20220506042004.hqzpb66shak4y7rz@vireshk-i7>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220505_234258_614030_479FCEB7 
X-CRM114-Status: GOOD (  14.32  )
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

On Fri, 2022-05-06 at 09:50 +0530, Viresh Kumar wrote:
> On 05-05-22, 19:52, Rex-BC Chen wrote:
> > Cpufreq is a DVFS driver used for power saving to scale the clock
> > frequency
> > and supply the voltage for CPUs. This series do some cleanup for
> > MediaTek
> > cpufreq drivers and add support for MediaTek SVS[2] and MediaTek
> > CCI
> > devfreq[3] which are supported in MT8183 and MT8186.
> 
> Applied 2-5, rest of them depend on the binding and dts patches to be
> Acked.
> 

Hello Viresh,

Thanks for accepting our patches.

As for rest patch:
The cci series [1] is still under reviewing and it depends on chanwoo's
series [2].
Therefore, I think it won't be so quick to be acked for these patches
in my series.

[1]: cci: 
https://lore.kernel.org/all/20220425125546.4129-1-johnson.wang@mediatek.com/

[2]: chanwoo's passive governor support for devfreq: 
https://git.kernel.org/pub/scm/linux/kernel/git/chanwoo/linux.git/log/?h=devfreq-testing

BRs,
Rex


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
