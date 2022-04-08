Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E88D3C433FE
	for <linux-mediatek@archiver.kernel.org>; Fri,  8 Apr 2022 05:00:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=INk3PGZBhl+RO2a6fOhr4UqRB7HMCcHPsbhn5B8JxjA=; b=Z5bHwLvS3x3XGz
	56SxufNI1Qe32JOLqUZss3vwuNcij2zcU4ysAfvYW57weO13QY21Re3BGU07K3m59MPhhQ/zdgvLN
	IhvRUTggtrj9Yprthj9VITqHRa+CELfYhVUh4PIGaQu2gc261RGvTaQDkVVAI2x0BtzOXuoOSGkdf
	zLiGQqk1ppo4T4WP3GPKRgtg8Te96PeF0/8c8D8pC/81pCAJMk9J9LvZ/U3f5+pSsogvwpb83QYfe
	q4QIXOVH2yAx2dba8kPgmpknVXslFtX66vwa0owvwJ9LivpyQMP8AiMEQj7+aG5+dpyB5jfyRE3Md
	XIv6ynDdsngUgTDzNwWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ncgjl-00EzbR-1f; Fri, 08 Apr 2022 05:00:45 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ncfiP-00Ep8b-Cj; Fri, 08 Apr 2022 03:55:20 +0000
X-UUID: 3085aeabceda4f10b99bbb12026639ff-20220407
X-UUID: 3085aeabceda4f10b99bbb12026639ff-20220407
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <rex-bc.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 972988879; Thu, 07 Apr 2022 20:55:12 -0700
Received: from mtkexhb01.mediatek.inc (172.21.101.102) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 7 Apr 2022 20:55:11 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by mtkexhb01.mediatek.inc
 (172.21.101.102) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Fri, 8 Apr 2022 11:55:03 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 8 Apr 2022 11:55:03 +0800
Message-ID: <a48c74e447c233799a497702fe90cfa126eb952a.camel@mediatek.com>
Subject: Re: [PATCH 0/4] cpufreq: mediatek: introduce mtk cpufreq
From: Rex-BC Chen <rex-bc.chen@mediatek.com>
To: Viresh Kumar <viresh.kumar@linaro.org>, Tim Chang
 <jia-wei.chang@mediatek.com>
CC: "Rafael J . Wysocki" <rafael@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown
 <broonie@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 <linux-pm@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <fan.chen@mediatek.com>,
 <louis.yu@mediatek.com>, <roger.lu@mediatek.com>,
 <Allen-yy.Lin@mediatek.com>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, <hsinyi@google.com>
Date: Fri, 8 Apr 2022 11:55:03 +0800
In-Reply-To: <20220308043615.uamxqylo3mvw4rhs@vireshk-i7>
References: <20220307122151.11666-1-jia-wei.chang@mediatek.com>
 <20220308043615.uamxqylo3mvw4rhs@vireshk-i7>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220407_205517_484991_BF420FF7 
X-CRM114-Status: GOOD (  14.59  )
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

On Tue, 2022-03-08 at 10:06 +0530, Viresh Kumar wrote:
> On 07-03-22, 20:21, Tim Chang wrote:
> > CPUFREQ is DVFS driver used for power saving by scaling clock
> > frequency
> > and supply voltage of CPUs. This module cooperates with CCI DEVFREQ
> > for
> > certain Mediatek SoCs.
> 
> Both subject and this log talks as if you are adding a new cpufreq
> driver, while what you are doing is just cleanup mostly. This isn't
> how it should be done.
> 
> You need to be very explicit with what you are doing and make that
> change in a separate patch. The cover letter should tell what you are
> doing and why.
> 

Hello Viresh,

Thanks for your suggestion.
Indeed, the subject is not proper for this series.
I will help to upstream next version and fix the issue because of
resource issues.

Thanks.

BRs,
Rex


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
