Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C43BEC77B73
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Apr 2023 09:00:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:Subject:From:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JIsSAmiV5TJkUza0CVEmHN5C5H/Mdl4TB5Cj9DJqLC0=; b=gvgWo+aQm9EjMNSyRdeOFNrzew
	MDVA8m5glt0ch5pdqNAnqxDY+XKb8qSF4Si7vQ/Yn5Xu5jN2IGiVvkD8YSDHglrJzewDz7fN1shjR
	62Tir0z8G+sngGCwdzV7blSnE2nORd7F0keZF6jBI+KGd6y89ooTLG/o43h6Q4YNmNw57GfWibUmb
	+inv9akeScnmoCYUXzrTVZheUTs2cLVtPCUC1GBEhAxiy92GUkHs3RYOEg2ShciGXrFIVYyn6sjcD
	sxTPikeOzU/HUuLS+ODHhumuPpfn0PsoG/KYnM0whK/+Yt0fV1fBcBStbHdo0rJMq1Yb3hlWd48MY
	91xuoI2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ppQ9m-007TLD-2e;
	Thu, 20 Apr 2023 09:00:46 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ppQ9l-007TKe-1P;
	Thu, 20 Apr 2023 09:00:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:References:Cc:To:Subject:From:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=JIsSAmiV5TJkUza0CVEmHN5C5H/Mdl4TB5Cj9DJqLC0=; b=MAJvSlxww+ydeY1GJgYCgXYgz5
	z/ZQ37dkgnmIuhwt8bYMNY1teWFVkytQU+RoOdI3g75Bo6XyO7z0dsJgJEm5hpw9H+tt1IIRB+ZMV
	075O3RVM2hbtwO+6ZutprUpP7eqD8phTJXq/NmWbwDFRrtuEwyGpiQ6fyOul20ZGIF/WZpq2mww+S
	ksPHyrEII+ajbzSOrNHH3OTcj7mlxmK07PWaesREIduAZg7R4f24epGhVVBnEyLuAUy0cg1mF3yGG
	gZfm4xDXC37Ud2NRlXRkDZZ92ySQgWhEvEgriFJpX+/G4AQi4fx1GGxWRB94NPx1ciMDV93WdBiZH
	SWeaj7Ig==;
Received: from mailgw.kylinos.cn ([124.126.103.232])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ppQ9b-003jWZ-1R;
	Thu, 20 Apr 2023 09:00:41 +0000
X-UUID: 3bc7c0257ccf46a69a1e28c32f8c59b3-20230420
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.22,REQID:bca1b735-45ee-4a54-8e61-ae6b0acbe2dc,IP:-32
	768,URL:-32768,TC:-32768,Content:-32768,EDM:-32768,RT:-32768,SF:-32768,FIL
	E:-32768,BULK:-32768,RULE:Release_Ham,ACTION:release,TS:0
X-CID-INFO: VERSION:1.1.22,REQID:bca1b735-45ee-4a54-8e61-ae6b0acbe2dc,IP:-3276
	8,URL:-32768,TC:-32768,Content:-32768,EDM:-32768,RT:-32768,SF:-32768,FILE:
	-32768,BULK:-32768,RULE:Release_Ham,ACTION:release,TS:0
X-CID-META: VersionHash:120426c,CLOUDID:nil,BulkID:nil,BulkQuantity:0,Recheck:
	0,SF:nil,TC:nil,Content:nil,EDM:nil,IP:nil,URL:nil,File:nil,Bulk:nil,QS:ni
	l,BEC:nil,COL:0,OSI:0,OSA:0,AV:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-UUID: 3bc7c0257ccf46a69a1e28c32f8c59b3-20230420
X-User: gehao@kylinos.cn
Received: from [172.20.12.78] [(116.128.244.169)] by mailgw
	(envelope-from <gehao@kylinos.cn>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES128-GCM-SHA256 128/128)
	with ESMTP id 150126191; Thu, 20 Apr 2023 16:54:06 +0800
Message-ID: <7b162010-4fa3-4572-c834-7264eb937e4a@kylinos.cn>
Date: Thu, 20 Apr 2023 16:53:08 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
From: Hao Ge <gehao@kylinos.cn>
Subject: Re: [PATCH] mediatek/clk-mt8173-apmixedsys: convert to
 devm_platform_ioremap_resource
To: Stephen Boyd <sboyd@kernel.org>, matthias.bgg@gmail.com,
 mturquette@baylibre.com
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20230413090128.60119-1-gehao@kylinos.cn>
 <f09425fde83f4b21ee301ef8810c4c29.sboyd@kernel.org>
In-Reply-To: <f09425fde83f4b21ee301ef8810c4c29.sboyd@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230420_100036_564490_F489ECD6 
X-CRM114-Status: UNSURE (   9.93  )
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

On 4/14/23 02:40, Stephen Boyd wrote:
> Quoting Hao Ge (2023-04-13 02:01:28)
>> diff --git a/drivers/clk/mediatek/clk-mt8173-apmixedsys.c b/drivers/clk/mediatek/clk-mt8173-apmixedsys.c
>> index a56c5845d07a..fe386bf8225d 100644
>> --- a/drivers/clk/mediatek/clk-mt8173-apmixedsys.c
>> +++ b/drivers/clk/mediatek/clk-mt8173-apmixedsys.c
>> @@ -90,7 +90,7 @@ static int clk_mt8173_apmixed_probe(struct platform_device *pdev)
>>          struct clk_hw *hw;
>>          int r;
>>   
>> -       base = of_iomap(node, 0);
>> +       base = devm_platform_ioremap_resource(pdev, 0);
>>          if (!base)
> 
> This needs to be updated.
> 
>>                  return PTR_ERR(base);
> 
> And PTR_ERR(NULL) is 0, which is wrong.
Thank you for pointing out this point and Sorry for the late reply.
I will update the v2 for it.

Best regards.
Hao

