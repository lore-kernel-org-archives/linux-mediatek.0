Return-Path: <SRS0=uKpE=IH=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13852C433E0
	for <linux-mediatek@archiver.kernel.org>; Tue,  9 Mar 2021 09:30:25 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 79651650DF
	for <linux-mediatek@archiver.kernel.org>; Tue,  9 Mar 2021 09:30:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 79651650DF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.microsoft.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=j3a4UM4bYZ3BFPowah2eZVvuguG8PsaKOHLBxbSzGLg=; b=oCL33EFYuHbswNmnSjJoz3L7b
	zNIEa23/TqbuNI1EVzDXVXbyi3MKAGef/0Foo2Vf5Kw24XuZmbOb95wzAaNpcEWdh0ImXwTiOqff7
	SPWMroqxIYgk44jGFoVKWQ/NntVtsOKwuu0h6/Ys+Z55ZPjMkd9HHknj1A9l6gHljGMLI9uBpYDvv
	Rzo6NpmKNzhki1XO+ob4PWParhn3eg0PY4OJ1TrjAgWdlnn87g3ugBIpGOgGRxF2gj5n8abtFI0NE
	EGXEl1wsjwj7BARuENMv3rK2GJtD2OnbXxhgoJkqsn1XqhM04tErX0AMiwcN/oZgOPWbhppsjKawd
	JkJvlL2kA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lJYgv-0048kV-2N; Tue, 09 Mar 2021 09:30:13 +0000
Received: from linux.microsoft.com ([13.77.154.182])
 by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
 id 1lJYgo-0048jm-Ky; Tue, 09 Mar 2021 09:30:10 +0000
Received: from [192.168.0.114] (unknown [49.207.210.77])
 by linux.microsoft.com (Postfix) with ESMTPSA id 0CE1B20B26C5;
 Tue,  9 Mar 2021 01:29:53 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 0CE1B20B26C5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
 s=default; t=1615282202;
 bh=CDYqG2GIuZVR5z0oqm1GZmaheRjDizkca+UJHZd+0GI=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=NVeEjgcK9BRcMfN+1DWoFPF7F0iWQG11DSKd1RS7RpOgd96fzaUGJsKVno8QnpaQh
 A/m2/byHvmbLabts1yxTAYtkMEDvIRO8cGdyLneaxrB82B6YrMMlcZwAuAVn2++s2j
 aD8AJWIqe1JXOP7k7Vxz9IhcBEcfAUYNFaPJZwbs=
Subject: Re: [PATCH v5 01/19] crypto: amcc: convert tasklets to use new
 tasklet_setup() API
To: Herbert Xu <herbert@gondor.apana.org.au>, Allen Pais <allen.lkml@gmail.com>
Cc: davem@davemloft.net, nicolas.ferre@microchip.com,
 alexandre.belloni@bootlin.com, ludovic.desroches@microchip.com,
 jesper.nilsson@axis.com, lars.persson@axis.com, horia.geanta@nxp.com,
 aymen.sghaier@nxp.com, gcherian@marvell.com, thomas.lendacky@amd.com,
 john.allen@amd.com, gilad@benyossef.com, bbrezillon@kernel.org,
 arno@natisbad.org, schalla@marvell.com, matthias.bgg@gmail.com,
 jamie@jamieiles.com, giovanni.cabiddu@intel.com, heiko@sntech.de,
 krzk@kernel.org, vz@mleia.com, k.konieczny@samsung.com,
 linux-crypto@vger.kernel.org, linux-mediatek@lists.infradead.org,
 qat-linux@intel.com, linux-rockchip@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, Romain Perier <romain.perier@gmail.com>
References: <20210208094238.571015-1-allen.lkml@gmail.com>
 <20210208094238.571015-2-allen.lkml@gmail.com>
 <20210304062644.GA5107@gondor.apana.org.au>
From: Allen Pais <apais@linux.microsoft.com>
Message-ID: <2e2604a3-b0b1-92f2-aa7b-f413fae4cb51@linux.microsoft.com>
Date: Tue, 9 Mar 2021 14:59:51 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210304062644.GA5107@gondor.apana.org.au>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210309_093008_895328_C9C479F3 
X-CRM114-Status: GOOD (  11.48  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


>>
>> In preparation for unconditionally passing the
>> struct tasklet_struct pointer to all tasklet
>> callbacks, switch to using the new tasklet_setup()
>> and from_tasklet() to pass the tasklet pointer explicitly.
>>
>> Signed-off-by: Romain Perier <romain.perier@gmail.com>
>> Signed-off-by: Allen Pais <apais@linux.microsoft.com>
>> ---
>>   drivers/crypto/amcc/crypto4xx_core.c | 10 +++++-----
>>   1 file changed, 5 insertions(+), 5 deletions(-)
> 
> This introduces a compiler warning with C=1 W=1.

Okay. I will check and send out a fix.

Thanks.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
