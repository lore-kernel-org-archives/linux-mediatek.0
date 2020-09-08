Return-Path: <SRS0=x1vn=CR=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC527C2D0E0
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Sep 2020 06:13:57 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9E91820732
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Sep 2020 06:13:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Qg1jUyFn";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=gmx.net header.i=@gmx.net header.b="j+jw864N"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9E91820732
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=public-files.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Date:Subject:To:From:
	Message-ID:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=O2u2MmingknHpLS3JWI7qijx+DCfBEjEi1FuLmRLkac=; b=Qg1jUyFniEhqLP+H7/q71+Ocj
	+ygY25wo5qOMHQu+ZYTvZQG/FpRCggCaZvekLvAkr/g+H/UOJULeoJMOVGCnWunB1aFS81/cU5V7S
	ggRmXXNcAJSsnGHfbm32jaiHHx9ilo8C1YHuNeWBIfAgdGtfMvbWijCGhC5Pqpie89qQTcSeOhyB9
	0nTT9invsjQp1syN8eRtNKT799hjm8kn2yRm1r4gM0w8204UgSgqysQ6CGDJjW8iFvOkwi/iKwzNr
	M+umGpUyVzcrSI5qJhloOW3dhcHU6Wk5CsOZpAukXBZC5esLHNdkp98AY67aGwjTNSPifOhBjkWm4
	IZYoORMaw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kFWt0-0000YE-HR; Tue, 08 Sep 2020 06:13:46 +0000
Received: from mout.gmx.net ([212.227.15.19])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kFWsx-0000Xg-Iz; Tue, 08 Sep 2020 06:13:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1599545604;
 bh=FtvlKZBcLfL0ZeBa4yq1cs6S15KNeaEEgYiZUVowl6I=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=j+jw864NiUmoSbdyiy0n/Y/cYEeJYNPiZ1fYd50O8pvUU+cdWu+B3xd1wJTfRz8O5
 52QOkU7N4XxgFVYSLgNbwHBLL8qsOjLe0HZej2aITTpDBGVswKVcmmzctpShpwOYkw
 c5hFh4zKsBOMUe2ehpvXUAmm4XB7ri2V1mnKxZK8=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [185.76.97.104] ([185.76.97.104]) by web-mail.gmx.net
 (3c-app-gmx-bs38.server.lan [172.19.170.90]) (via HTTP); Tue, 8 Sep 2020
 08:13:24 +0200
MIME-Version: 1.0
Message-ID: <trinity-74abdbb2-2ddc-440a-85c8-97e80e9eb2ed-1599545604475@3c-app-gmx-bs38>
From: Frank Wunderlich <frank-w@public-files.de>
To: Chuanjia Liu <Chuanjia.Liu@mediatek.com>
Subject: Aw: Re: [PATCH v4 0/4] Split PCIe node to comply with hardware design
Date: Tue, 8 Sep 2020 08:13:24 +0200
Importance: normal
Sensitivity: Normal
In-Reply-To: <1596440772.7361.35.camel@mhfsdcap03>
References: <20200721074915.14516-1-Chuanjia.Liu@mediatek.com>
 <1596440772.7361.35.camel@mhfsdcap03>
X-UI-Message-Type: mail
X-Priority: 3
X-Provags-ID: V03:K1:i6KFmqNKBH4PPSKlvcjghT5P+X5pFNBaGxFipv86Hh4ReWRpG5btRSd5XiIXZJ19HB0fq
 lgu0117WGrFBfEeINB8o1KuUaaV7TDQ+uJfn2owNCVVBEH787lTai5JXTDzUs5z06ifZ6KkqM068
 CHEfY3tbNEchcofDgcxvyl1DyaeDsar+qW8RT1V4FwRahaaQCfEJSgVT4HuK6aL23QBZCK30Qbk6
 ADW5xYBonXsg7PVN/KC8zKrwMmW2+e+k2ZeFaiOGPrySBzn3oEwhiDFz5sdPNs7RNV7AY7gvORiL
 ls=
X-UI-Out-Filterresults: notjunk:1;V03:K0:UuOHfeuoCbE=:9+dhFkMTeCWaxGimh72pme
 AXCI9Y9xGHGWKFDqsMgQqnWZrJY2YqBq76iSi1YO5tOrNKXrTSX3uqbY8fS/jP1WX2iMC9DYR
 +pX7nJGZ40FTXl+MGsiXRhVx7EviYmeoLucDYKbSX/S39Sn6YJvoegAOFfuXo1QwVFnLRmp/c
 HbxmmPfLit37E7Bqz6XkNszj9lsQId47HEH05CJyWDSb28/ugBq0fUAcyb3m09PslVweJv1rk
 qHaZddgaFRHrenOpq3ypq4qmj9nIenbCmmTL5ghmu2r3TcThugrBUHf7qboUSVQjZCyAuqpED
 auxdiMgcwe5tZ2YpuQT8qmidOi4snmZkPdUhay9XVMrm/2QA1FjHUphWv9swexNLYN8vsJoga
 zpk41DbFHEhCt/jlWLMkGVk0/P5BhfwQg4jLzaHctQfs4dNGsv4IZsG6wLCISutSVE54Ljri6
 aWuaF03BXX/k7NJIQniJIajWZnD1CpRHj77qSLYH58vyIXl6UwgHqNZ45x0fgE8hmkYIw2KHW
 nzldWFN0Z734a4GtfYqmFYrUW5zpU/997Jcj4nUOvbxLIM42TgZ7k5KTc7fqCmMDiPO+Bhy06
 kKlLKUW+gz+xbE3KHJoWQVdvX1PAA/8wnqhPtKeOZdtbYUUvlwWBrpqL4Qp7DWrg2n9wDXPdS
 N6xjzIeB54WE6YbyD7LPBooLeXbpWBqIw3ypLvZNrWWcqtbeof5OMzbKHbash1xbryAE=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200908_021343_955450_9800DB1C 
X-CRM114-Status: UNSURE (   7.49  )
X-CRM114-Notice: Please train this message.
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
Cc: devicetree@vger.kernel.org, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, jianjun.wang@mediatek.com,
 Ryder Lee <ryder.lee@mediatek.com>, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, Bjorn Helgaas <bhelgaas@google.com>,
 yong.wu@mediatek.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi,

i don't see this Patchset in 5.9-rc4

is anything missing?

regards Frank

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
