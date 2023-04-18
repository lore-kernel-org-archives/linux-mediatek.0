Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8928DC77B75
	for <linux-mediatek@archiver.kernel.org>; Tue, 18 Apr 2023 11:50:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Git9K4mQ01En13AQEsk/0K0+3aZmG7o6BvUPIAX5pZs=; b=G3V07ZMKawnWwxq0ryr7Wwcs4T
	CbCdyoyMTre3xwFFMA4zaERAzAbs0GVSG4VJ0axSPhq/zcUzMrirHA5bEe1UJF809Bv7Lvhv1cDsa
	xcLhnxR+807sAU476ETBWkcVJawyBvSfShDtOS1PykQm7Rymwx4vG9+RUUfeo1ShgTwekEQoHlaOO
	AcMt1s/qFa+YZFsCSLg9p3Zw9hnko+JFTBN42Dd8CJuHw9kfnzLTQELS4ZFU2/5gfltgxCFvw1lmQ
	VmmG1J1xMSsWnB952EAtfU9LDSOMscT17yK/rkVUSTXDAC61m72XnsbwK8rbrop1EAskFuLe4kvcn
	+tsjD3Kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pojqs-0021A8-1E;
	Tue, 18 Apr 2023 11:50:26 +0000
Received: from [202.114.0.240] (helo=hust.edu.cn)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pojqf-002153-0k;
	Tue, 18 Apr 2023 11:50:24 +0000
Received: from [IPV6:2001:250:4000:5113:815:8033:3f03:627a] ([172.16.0.254])
	(user=dzm91@hust.edu.cn mech=PLAIN bits=0)
	by mx1.hust.edu.cn  with ESMTP id 33IBnCtS027308-33IBnCtT027308
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NO);
	Tue, 18 Apr 2023 19:49:13 +0800
Message-ID: <b3a4c253-a9a8-9a6b-b5f1-cf4dd0615b5e@hust.edu.cn>
Date: Tue, 18 Apr 2023 19:49:12 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.0
Subject: Re: [PATCH] soc: mdediatek: devapc: use
 devm_platform_ioremap_resource() instead of of_iomap()
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        zhengkang huang <zkhuang@hust.edu.cn>,
        Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org
References: <20230414092113.64514-1-zkhuang@hust.edu.cn>
 <9bfd1641-3f58-ca6e-1e80-13acea834ea5@collabora.com>
From: Dongliang Mu <dzm91@hust.edu.cn>
In-Reply-To: <9bfd1641-3f58-ca6e-1e80-13acea834ea5@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-FEAS-AUTH-USER: dzm91@hust.edu.cn
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230418_045013_640407_77A202F6 
X-CRM114-Status: UNSURE (   9.43  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


On 2023/4/18 18:09, AngeloGioacchino Del Regno wrote:
> Il 14/04/23 11:21, zhengkang huang ha scritto:
>> In mtk_devapc_probe(), if of_iomap succeeds and any following error 
>> occurs,
>> it needs to deallocate the resource.
>>
>> Fix this by repalcing of_iomap with devm_platform_ioremap_resource, 
>> which
>> automatically self-manages the resource. This can avoid modifying error
>> handling code.
>>
>> Signed-off-by: zhengkang huang <zkhuang@hust.edu.cn>
>> Reviewed-by: Dongliang Mu <dzm91@hust.edu.cn>
>
> You haven't tested this patch on any MediaTek SoC, have you?

Yes, this issue is found by static analysis and remains untested.

Sorry for the functionablity issue.

Dongliang Mu

>
> This will break devapc.
>
> Regards,
> Angelo
>

