Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40941ECAAD8
	for <linux-mediatek@archiver.kernel.org>; Fri, 23 Sep 2022 07:09:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JLVykaXDOlUyh8cNeSdQSaSgupPXu2DvwcPbFmC76aQ=; b=kx9xwA4rxERc7K+AWDFQ7Ai853
	0bXrz+MOkgXMRqIrZzIY3HOeE/R2k3SMTNr6MgWnm+ON4Ezsv62zkYpju+f1ecnOIPViTdTkeE1i3
	1xA3hgqncScSo0UGTEZaEDgaPl5pNIzExb5AP7lKwTESTC2ogvwUKzGFYkpkeRqTFgQ5TSGEqlvNE
	IVfPkVoAkVHRr1y9/NOUYBCEhTPhAtDywnuXt9dwEiduZgNCbnYMc/C03T1W6aMODnBU1jAlWCCAr
	Gny3UzuBrXjluhfdqZ0MbiX9ggKuD31BSwJieJiiad1JSdTlA8TYZvCEO3L7Ab8INMsxuqJYUG4wO
	jXIdUWgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obcoW-002d4u-CR; Fri, 23 Sep 2022 07:09:32 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obcoS-002d3z-Rh; Fri, 23 Sep 2022 07:09:31 +0000
X-UUID: 0d566d4970f246b48be6c2f2bac44b67-20220923
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=JLVykaXDOlUyh8cNeSdQSaSgupPXu2DvwcPbFmC76aQ=;
	b=IFogwBWmi1RUHYBxEwF4ruH8905H8QRBo59ZL/7lsq9/YAeKLjCplQ0uhKF9J6Hw3oK9vk6Jrx7WTmLxVYhzGYtzJABweYGAM6OpJ6YVf34o75j8PWQ413A1nal8nkgLnVAmrk6smPsSrfKEY2VU2XQBnVnRNJLMFpZ1cr7mciw=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.11,REQID:bd946c31-c6e7-497a-8980-bd620b427bc1,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:39a5ff1,CLOUDID:be35d5a2-dc04-435c-b19b-71e131a5fc35,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 0d566d4970f246b48be6c2f2bac44b67-20220923
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <jia-wei.chang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1501508630; Fri, 23 Sep 2022 00:09:20 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Fri, 23 Sep 2022 14:38:43 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Fri, 23 Sep 2022 14:38:43 +0800
Message-ID: <d9e56d6fb6a31ecbd024cfe81e331817fa492331.camel@mediatek.com>
Subject: Re: [PATCH] cpufreq: mediatek: Fix KP and lockups on proc/sram
 regulators error
From: Jia-Wei Chang <jia-wei.chang@mediatek.com>
To: Viresh Kumar <viresh.kumar@linaro.org>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: <rafael@kernel.org>, <lgirdwood@gmail.com>, <broonie@kernel.org>,
	<matthias.bgg@gmail.com>, <andrew-sh.cheng@mediatek.com>,
	<rex-bc.chen@mediatek.com>, <nfraprado@collabora.com>,
	<linux-pm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>
Date: Fri, 23 Sep 2022 14:38:43 +0800
In-Reply-To: <20220921071913.p7kwsjnnuad2jgvk@vireshk-i7>
References: <20220909093724.40078-1-angelogioacchino.delregno@collabora.com>
	 <20220921071913.p7kwsjnnuad2jgvk@vireshk-i7>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220923_000929_200510_EEB6012D 
X-CRM114-Status: GOOD (  23.47  )
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

On Wed, 2022-09-21 at 12:49 +0530, Viresh Kumar wrote:
> Jia, do you want to reply to this thread as the Fixes patch was added
> by you ?
> 
> On 09-09-22, 11:37, AngeloGioacchino Del Regno wrote:
> > Function regulator_get_optional() returns a negative error number
> > on
> > any kind of regulator_get() failure: failing to check for that in
> > the
> > teardown path will lead to a kernel panic due to a call to function
> > regulator_disable().
> 
> I don't see how this can happen. The code does check if the
> regulators
> are enabled earlier or not.
> 
Hi Angelo,

Could you help provide more details, like the call stack of kernel
panic? and how to reproduce this failure?

> > Besides that, the "proc" regulator does actually provide power to
> > the
> > CPU cluster(s): disabling it will produce a lockup on at least some
> > SoCs, such as MT8173.
> 
> We are just dropping the count that we increased earlier, how will
> that disable the regulator which was already enabled ?
> 
> > That consideration is also valid for the "sram" regulator,
> > providing
> > power to the CPU caches instead, present on some other SoCs, such
> > as
> > MT8183, MT8186 (and others).
> > 
> > Resolve both situations and by simply removing the entire faulty
> > branches responsible for disabling the aforementioned regulators if
> > enabled, keeping in mind that these are enabled (and left enabled)
> > by the bootloader before booting the kernel.
> 
> This looks fishy, we just keep on increasing the ref count of the
> regulator but never take it down.
> 
Angelo,

Do you mean the ref count of the regulator in the kernel will be
affected if that regulator is enabled earlier in the bootloader?

Thanks.


