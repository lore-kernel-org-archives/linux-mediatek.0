Return-Path: <SRS0=Fikf=MV=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A56D7C4320A
	for <linux-mediatek@archiver.kernel.org>; Thu, 29 Jul 2021 16:04:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6EFA560F4A
	for <linux-mediatek@archiver.kernel.org>; Thu, 29 Jul 2021 16:04:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6EFA560F4A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dNDT9rhH4fAn3qIW9+ZgkvhJoI3CKxCfTeJdf+PEqkE=; b=wiKapraVQqrM71
	8pzM6n8PTTE4m9JRbeieqFdL9/+7uAtlGSNLneU57GXz0Yj7lxWA7St47fWDLfkYcjWoNLurednEj
	TvGDsbS6/Aies+sy58XGGRTJf0/E8dPFStg2LvlY5f/I6UWzqDfm8EmLLdRMwkuyuYHJanS6zPTnB
	C6Gg/iwA9LbovfIuDOo7GqXCRGdl2N0Ty7fNHEaAyBVXTLp/zNg1Lxf5awwcUP3sc5effrdGuR1cN
	vDf55XVeTSovLJsGvvBCQMoXbjHf5m4Zxm0ING/2aavxTIQQZMKRGwlr3cG71MKucUPkBM65ot7Y7
	0CGtxtZsdqCz3gqEbECg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m98WI-004vv9-7s; Thu, 29 Jul 2021 16:04:26 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m98RQ-004seQ-S3; Thu, 29 Jul 2021 15:59:26 +0000
X-UUID: f5698c0d1ad844afa98908b8fadf58df-20210729
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=FmMPo1YNUA+2iUSxBL6ChqAQr9+S6f3vHwPsCvfChoo=; 
 b=IPdNOmnVtffvAZPsvYRXBno+LDszfNichAqebQd6xhHt5wjPUQeF7ofMuRkkaJLmL3mmaa23XlV4u8D44MO9A/sZjaWPecFBCEVHnWnUIu0yHLmW2n8J37wBQRGTU36zpNqkLGW/uUKVUrJMfnyMKJ1ebuAYzE23HM9sUutPN14=;
X-UUID: f5698c0d1ad844afa98908b8fadf58df-20210729
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <rocco.yue@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1335201524; Thu, 29 Jul 2021 08:59:20 -0700
Received: from MTKMBS32N2.mediatek.inc (172.27.4.72) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 29 Jul 2021 08:59:19 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 MTKMBS32N2.mediatek.inc (172.27.4.72) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 29 Jul 2021 23:59:16 +0800
Received: from localhost.localdomain (10.15.20.246) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 29 Jul 2021 23:59:15 +0800
From: Rocco Yue <rocco.yue@mediatek.com>
To: David Ahern <dsahern@gmail.com>
CC: "David S . Miller" <davem@davemloft.net>, Hideaki YOSHIFUJI
 <yoshfuji@linux-ipv6.org>, David Ahern <dsahern@kernel.org>, Jakub Kicinski
 <kuba@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 <netdev@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <rocco.yue@gmail.com>, Rocco Yue <rocco.yue@mediatek.com>
Subject: Re: [PATCH net-next] net: ipv6: add IFLA_RA_MTU to expose mtu value
 in the RA message
Date: Thu, 29 Jul 2021 23:42:51 +0800
Message-ID: <20210729154251.1380-1-rocco.yue@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <c4099beb-1c22-ac71-ae05-e3f9a8ab69e2@gmail.com>
References: <c4099beb-1c22-ac71-ae05-e3f9a8ab69e2@gmail.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: 84ED98E54976BBFA2B0C83D314996E8EF6CAE2511184AF380DDEB250A244991C2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210729_085924_978701_4F9959FE 
X-CRM114-Status: GOOD (  14.81  )
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

On Thu, 2021-07-29 at 08:41 -0600, David Ahern wrote:
> On 7/29/21 3:02 AM, Rocco Yue wrote:
>> diff --git a/include/uapi/linux/if_link.h b/include/uapi/linux/if_link.h
>> index 4882e81514b6..ea6c872c5f2c 100644
>> --- a/include/uapi/linux/if_link.h
>> +++ b/include/uapi/linux/if_link.h
>> @@ -347,7 +347,7 @@ enum {
>>  	 */
>>  	IFLA_PARENT_DEV_NAME,
>>  	IFLA_PARENT_DEV_BUS_NAME,
>> -
>> +	IFLA_RA_MTU,
>>  	__IFLA_MAX
>>  };
>>  
>> diff --git a/include/uapi/linux/ipv6.h b/include/uapi/linux/ipv6.h
>> index 70603775fe91..3dbcf212b766 100644
>> --- a/include/uapi/linux/ipv6.h
>> +++ b/include/uapi/linux/ipv6.h
>> @@ -190,6 +190,7 @@ enum {
>>  	DEVCONF_NDISC_TCLASS,
>>  	DEVCONF_RPL_SEG_ENABLED,
>>  	DEVCONF_RA_DEFRTR_METRIC,
>> +	DEVCONF_RA_MTU,
>>  	DEVCONF_MAX
>>  };
>>  
> 
> you do not need both IFLA and DEVCONF. Drop the DEVCONF completely. IFLA
> attribute can be used for both inspection and notification on change.

Hi David,

Thanks for your review.

Because the purpose of this patch is for userspace to correctly read the
ra_mtu value of different network device, if the DEVCONF is completely dropped,
does that mean I can add the "ra_mtu" member in the "struct net_device" .

> Also do not add mailing lists that cause bounces. Specifically, you tend
> to add wsd_upstream@mediatek.com as a cc and every response to you
> generates a bounce message for this address.

Thanks for pointing out the problem, I will remove it from the mailing list.

Best Regards,
Rocco
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
