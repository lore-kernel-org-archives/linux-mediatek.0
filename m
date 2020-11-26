Return-Path: <SRS0=o4uA=FA=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C00FC6379D
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 Nov 2020 01:21:19 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 083DF20B1F
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 Nov 2020 01:21:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="vMdvMfML"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 083DF20B1F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=oVCl8vV1I9bIQeooVrzz9ig5iYZ6xrwETO5ysacAngY=; b=vMdvMfML6nNkkId9Vf1kAeDNt
	BOPKMQ+meiaov5fKM6pRhEHj9hCAm45QeAagogz2bE5iMLXB7DOgtjBWpv53R+ttoUJ+rUid5RprA
	43WWU1A2hqtvEl5kmYZpS/zqJpvpJ8Do4oVmUZ0YVPiwftSIdfr3yPBUYGjeI4n9Sd7dclrTv7lNr
	q2BLFdjhEyLurwkyG/nniAcbXeFCxyTstMB7QDk/kHWqP7CDs3hfwq7laM0scjRLTHEZzar7C4uuq
	xAVkuFTuIZD8GEVtXaEC5w0qfaBVRc7/BXsCccPsMCbX/i52fljkxYC6JdNckttYZVd7onkxNHaaI
	HnzQ56VjA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ki5yA-0007od-Ky; Thu, 26 Nov 2020 01:21:10 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ki5y7-0007nb-4u
 for linux-mediatek@lists.infradead.org; Thu, 26 Nov 2020 01:21:09 +0000
Received: from DGGEMM405-HUB.china.huawei.com (unknown [172.30.72.53])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4ChKgm1q4gzVggF;
 Thu, 26 Nov 2020 09:20:20 +0800 (CST)
Received: from dggema706-chm.china.huawei.com (10.3.20.70) by
 DGGEMM405-HUB.china.huawei.com (10.3.20.213) with Microsoft SMTP Server (TLS)
 id 14.3.487.0; Thu, 26 Nov 2020 09:20:57 +0800
Received: from dggema755-chm.china.huawei.com (10.1.198.197) by
 dggema706-chm.china.huawei.com (10.3.20.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1913.5; Thu, 26 Nov 2020 09:20:56 +0800
Received: from dggema755-chm.china.huawei.com ([10.1.198.197]) by
 dggema755-chm.china.huawei.com ([10.1.198.197]) with mapi id 15.01.1913.007;
 Thu, 26 Nov 2020 09:20:56 +0800
From: zhangqilong <zhangqilong3@huawei.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Subject: =?utf-8?B?562U5aSNOiBbUEFUQ0hdIG1lbW9yeTogbXRrLXNtaTogRml4IFBNIHVzYWdl?=
 =?utf-8?Q?_counter_unbalance_in_mtk=5Fsmi_ops?=
Thread-Topic: [PATCH] memory: mtk-smi: Fix PM usage counter unbalance in
 mtk_smi ops
Thread-Index: AQHWw1lJThcz50wwAEyjR6dGjVa97qnZnIGw
Date: Thu, 26 Nov 2020 01:20:56 +0000
Message-ID: <478866e6e41b449192d0ff0ce69319b2@huawei.com>
References: <20201123102118.3866195-1-zhangqilong3@huawei.com>
 <20201125183210.GA3665@kozik-lap>
In-Reply-To: <20201125183210.GA3665@kozik-lap>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.174.179.28]
MIME-Version: 1.0
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201125_202108_516519_87FB60F9 
X-CRM114-Status: GOOD (  19.73  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

> 
> On Mon, Nov 23, 2020 at 06:21:18PM +0800, Zhang Qilong wrote:
> > pm_runtime_get_sync will increment pm usage counter even it failed.
> > Forgetting to putting operation will result in reference leak here. We
> > fix it by replacing it with pm_runtime_resume_and_get to keep usage
> > counter balanced.
> >
> > Fixes: 4f0a1a1ae3519 ("memory: mtk-smi: Invoke pm runtime_callback to
> > enable clocks")
> > Signed-off-by: Zhang Qilong <zhangqilong3@huawei.com>
> > ---
> >  drivers/memory/mtk-smi.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/memory/mtk-smi.c b/drivers/memory/mtk-smi.c index
> > ac350f8d1e20..82d09b88240e 100644
> > --- a/drivers/memory/mtk-smi.c
> > +++ b/drivers/memory/mtk-smi.c
> > @@ -130,7 +130,7 @@ static void mtk_smi_clk_disable(const struct
> > mtk_smi *smi)
> >
> >  int mtk_smi_larb_get(struct device *larbdev)  {
> > -	int ret = pm_runtime_get_sync(larbdev);
> > +	int ret = pm_runtime_resume_and_get(larbdev);
> 
> Thanks for the patch, but it cannot be applied.
> 
> There is no pm_runtime_resume_and_get() in v5.10-rc1. I see you authored it
> around middle of November, so don't expect that it gets magically to all other
> trees. In such case - when you know that your patch cannot be applied or you
> suspect any dependencies, you should describe requirements for the patch.

OK, I get it. 

Best regards,
Zhang

> 
> Best regards,
> Krzysztof
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
