Return-Path: <SRS0=Ndyv=OF=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A689EC433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 15 Sep 2021 03:36:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6E40361216
	for <linux-mediatek@archiver.kernel.org>; Wed, 15 Sep 2021 03:36:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6E40361216
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:CC:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=LveiY/pFHlhg4qE8FNQLUSaaJ34Pbawm53IwiK7gzP4=; b=NfUWVlqhQ59jqB98H0AO84ed3O
	w2Yktx53qW4oai+cQjtZPQv+WEWZ+Cg61HGKzJ6bbtH522ECm3+oLnOISZMjdXR1guG/0PbFgjM/5
	z2v/u0N5JOsWQWdhHBpY9svl6LfOSbF/1GnZEYpONW7mgQQCtpN+sJ8TvE9+JEnvTuH/TfMncUoSt
	DpRIzlFFPNZPWKT8BCnNdJ1FhPj4+GGyWUNWgMPzvIvyiJHwb97ZD/+gBB7E15zI2TQwThOTbmlyV
	hFyC0cX47/M3af9GyftbTfiUAvfuveszRhTUK9P1FfLEhcyS2oey3jaQG+BLsLPjilIOySTgzPa++
	0Y5RNycA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mQLiZ-007yhs-R4; Wed, 15 Sep 2021 03:36:15 +0000
Received: from szxga03-in.huawei.com ([45.249.212.189])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mQLiM-007yfu-HQ; Wed, 15 Sep 2021 03:36:04 +0000
Received: from dggemv704-chm.china.huawei.com (unknown [172.30.72.54])
 by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4H8QpC1yLYz8t39;
 Wed, 15 Sep 2021 11:35:15 +0800 (CST)
Received: from dggpemm500004.china.huawei.com (7.185.36.219) by
 dggemv704-chm.china.huawei.com (10.3.19.47) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.8; Wed, 15 Sep 2021 11:35:52 +0800
Received: from [10.174.177.91] (10.174.177.91) by
 dggpemm500004.china.huawei.com (7.185.36.219) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.8; Wed, 15 Sep 2021 11:35:51 +0800
Subject: Re: [PATCH -next] ASoC: mediatek: mt8195: Add missing of_node_put()
To: Trevor Wu <trevor.wu@mediatek.com>, <linux-mediatek@lists.infradead.org>, 
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
CC: <lgirdwood@gmail.com>, <broonie@kernel.org>, <perex@perex.cz>,
 <tiwai@suse.com>, <matthias.bgg@gmail.com>, <alsa-devel@alsa-project.org>
References: <20210911081246.33867-1-cuibixuan@huawei.com>
 <7a1af556bf3b7dda9f1be848d2631448a1155ec6.camel@mediatek.com>
From: Bixuan Cui <cuibixuan@huawei.com>
Message-ID: <2b8a26ef-945a-e142-3f4d-039599198d9a@huawei.com>
Date: Wed, 15 Sep 2021 11:35:50 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <7a1af556bf3b7dda9f1be848d2631448a1155ec6.camel@mediatek.com>
Content-Language: en-US
X-Originating-IP: [10.174.177.91]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 dggpemm500004.china.huawei.com (7.185.36.219)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210914_203602_842440_6051029D 
X-CRM114-Status: UNSURE (   9.70  )
X-CRM114-Notice: Please train this message.
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



On 2021/9/15 11:07, Trevor Wu wrote:
> Thanks for catching that.
> I found there are other usages of of_parse_phandle() in the file.
> Will you handle them together?
> If not, I will prepare a patch to fix them after this patch is merged.
Hi,
You can send a v2 patch with your fixes base on my patch. The sign-off-by plus the two of us.

Thanks,
Bixuan Cui

> 
> Thanks,
> Trevor

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
