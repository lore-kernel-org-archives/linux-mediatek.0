Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E3B1C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 Apr 2022 11:39:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5cqyeFX8KCs4h2KCoOU0SBgArZlpsPrc6syEyAOT4dM=; b=mEpYBWU/9cOoAG
	9dUf+AtS04sO1CLsQx23wG35CXigdzpnWt0ECO2sB3R2n7YNq1LTFC3jocKZ+PwimXqJ25P1d9YsC
	Ys48pRidN98elhoK5uxSM1wHjV/kaw+sPCOl0LJPrXj8JAm67VWpcY441ShvsP1pA3jCJj+hshywJ
	PGi74pr+3yQmFqLJuMqGYcx8ff2MxI0jG8aLDO2L1wWtEkV7l04v1vsS1SV0UG4gez6zmcSp/5w6s
	UQvizKqSQ9CWwERRIkTTEHbdqx+sV19P475u/kJNq6JbgPDbwE63qw3fSYuSi5Yg7n2IrgyhVKY6c
	VZ6F2b9UA4n7r0CSym7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1neErY-00DlXX-VV; Tue, 12 Apr 2022 11:39:12 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1neEd0-00DeoW-MR; Tue, 12 Apr 2022 11:24:12 +0000
X-UUID: 1478fffd59984b2d91b06ddc8f41ece4-20220412
X-UUID: 1478fffd59984b2d91b06ddc8f41ece4-20220412
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <rex-bc.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 797822419; Tue, 12 Apr 2022 04:24:05 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 12 Apr 2022 04:24:03 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Tue, 12 Apr 2022 19:24:02 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 12 Apr 2022 19:24:02 +0800
Message-ID: <cc41bd1fba599acf937e73762ae196432f8c72bf.camel@mediatek.com>
Subject: Re: [PATCH V2 12/15] cpufreq: mediatek: Use maximum voltage in init
 stage
From: Rex-BC Chen <rex-bc.chen@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 <rafael@kernel.org>, <viresh.kumar@linaro.org>, <robh+dt@kernel.org>,
 <krzk+dt@kernel.org>
CC: <matthias.bgg@gmail.com>, <jia-wei.chang@mediatek.com>,
 <roger.lu@mediatek.com>, <hsinyi@google.com>, <linux-pm@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Date: Tue, 12 Apr 2022 19:24:02 +0800
In-Reply-To: <5f788a8f-7092-19ca-8499-d3626c4a386d@collabora.com>
References: <20220408045908.21671-1-rex-bc.chen@mediatek.com>
 <20220408045908.21671-13-rex-bc.chen@mediatek.com>
 <5f788a8f-7092-19ca-8499-d3626c4a386d@collabora.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220412_042410_795305_40BC5BA7 
X-CRM114-Status: GOOD (  15.21  )
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

On Fri, 2022-04-08 at 15:37 +0200, AngeloGioacchino Del Regno wrote:
> Il 08/04/22 06:59, Rex-BC Chen ha scritto:
> > From: Jia-Wei Chang <jia-wei.chang@mediatek.com>
> > 
> > Two or more clients may use the same regulator, and it could cause
> > the
> > issue of high-freqeuncy-low-voltage.
> > To prevent this, we use maximum voltage in
> > mtk_cpu_dvfs_info_init().
> > 
> > Signed-off-by: Jia-Wei Chang <jia-wei.chang@mediatek.com>
> 
> Is this happening for proc-supply (proc_reg)?
> ...because it looks like it is, so you should send this commit
> separately
> and with an appropriate Fixes: tag.

Hello Angelo,

The commit message is not clear.
The clients are cpufreq and mediatek cci.
I think there is no any error before introducing mediatek cci into
cpufreq.

The order of this patch should be after "cpufreq: mediatek: Link CCI
device to CPU".

If so, I will also correct the commit message in next version.

BRs,
Rex


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
