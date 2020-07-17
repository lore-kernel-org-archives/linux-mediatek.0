Return-Path: <SRS0=RXgq=A4=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF297C433DF
	for <linux-mediatek@archiver.kernel.org>; Fri, 17 Jul 2020 04:14:27 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8968522BED
	for <linux-mediatek@archiver.kernel.org>; Fri, 17 Jul 2020 04:14:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="I1no3mGH";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="r78Omc04"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8968522BED
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=nxp.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=7B62tIYmBvc7Y4Gceq1OrKsl0L83jr8M3K5gBEwugTY=; b=I1no3mGHWi0Q3/c2aDAj+Z9Gq
	BQYaBOchaGAfRX+VNf1vW3Qh3fhZbGnuCyEwe59NLwtcSMar1sAjDcoocferOYASEXjizTGErWObT
	ylbxsrznlZZmeGiLluBT2WkgIX2Rt1S2BfJo1BLiNhv09g58JL49qNl63Fhn+4ypC5OM4f/debT4U
	3lyWYi8kBwRGYkD0VTw9/ONjeOBxHwEXsRr0y1grdsFqy6GGqSwRJuPYbjUJLKqQxkPZ22xRw9Ctw
	jHCEF2kCAT04omO4HI2zX8W7qMrQ5CIj/u8guz7kQjlx+73ZrVCnWiNxdti++iLMh8Ypdt0gPjKG0
	9mKSc+RqQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jwHlJ-00069P-5t; Fri, 17 Jul 2020 04:14:17 +0000
Received: from mail-eopbgr80052.outbound.protection.outlook.com ([40.107.8.52]
 helo=EUR04-VI1-obe.outbound.protection.outlook.com)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jwHlE-000686-UN; Fri, 17 Jul 2020 04:14:14 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nUCt4T2mAOJqq2nfGGNwbxcTbsrT6ysf7LbpavEwbM764ZPgc0EE+52pLTwP7eyTLAtpnu3jUhB/sQOtN6QYI3oWIDtABBORg2+eIEvIkGXvCqnPbldtcq6jPruZmMDjBHZ7kWKRX2Z4NzqLuqszy1Lqg8GOmGhNYmNmCZSlXmAu6iGfTXr6o78Ke6yzmffwvXGSJ98cUr9OcvcFu89+wdDL1y4GyTacumUQYGyDNM5Qe0VQpDZdzq9zG1BKYnFYHLqQZlBoRrBORfYYNXxeBwbVUGJYiCNAlBNWjE5E+uTKPqtkF75UWWrzyeyKAnT8SKJIIny8/y8etwfVbd9Aag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NxpFHtKNxGl+Ban9K+4fwV1n0rAVWCY6OTdfvh8zQ3M=;
 b=bJ9N0KuAHcKJM3qpKCz78PH1wlW/bYDq341PbBRtcJH3As2BiNs/LEWIJngYIf3S0TQblF0uNkiA6dF05iHkjCY6FenI4JBZdCzCUvUSX1wwY2rueDEttIghW8uhbwy0j0VgV4PRu4RercvttQeNs6yHQmMSg575AJjth30iqesdNSWdzwKwftPvTUaqmj+aJMZP5/z+AtISz+P+rIBxSciZCLejSat97oP5gvFaEEZzeoiIBQYgCDNXTuhc7aIRWijB7/lIQOvS1JkrijDR24pdD4l6JDGUmbq/7+3KaNcIvk0qRs81CblzJXQJnGh60kHdJF3gibX85H1Rtaohkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NxpFHtKNxGl+Ban9K+4fwV1n0rAVWCY6OTdfvh8zQ3M=;
 b=r78Omc047T91+GjHMk0I6KqQKHRRJgjY0gjiQ6AdKuSYdc76IGknYR335dJPkmWdPHa5HIRvbGHh1rS0XI3Pj8t4l+uqHXB786dzuLufcZmDy9N0OltWf/ZZSe0T0RnzAVdWtQXp3PE0B96YPq5mZicYC8UJ5a4YYit7P5tqeVo=
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com (2603:10a6:20b:118::20)
 by AM6PR04MB4632.eurprd04.prod.outlook.com (2603:10a6:20b:1a::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3174.20; Fri, 17 Jul
 2020 04:14:08 +0000
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::1101:adaa:ee89:af2a]) by AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::1101:adaa:ee89:af2a%3]) with mapi id 15.20.3174.026; Fri, 17 Jul 2020
 04:14:08 +0000
From: Peter Chen <peter.chen@nxp.com>
To: Macpaul Lin <macpaul.lin@mediatek.com>
Subject: Re: [PATCH] usb: gadget: configfs: Fix use-after-free issue with
 udc_name
Thread-Topic: [PATCH] usb: gadget: configfs: Fix use-after-free issue with
 udc_name
Thread-Index: AQHWWzwrDCeJbXR+QUOUa8VdThQTA6kLKvMA
Date: Fri, 17 Jul 2020 04:14:08 +0000
Message-ID: <20200717041406.GC17070@b29397-desktop>
References: <1594881666-8843-1-git-send-email-macpaul.lin@mediatek.com>
In-Reply-To: <1594881666-8843-1-git-send-email-macpaul.lin@mediatek.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mediatek.com; dkim=none (message not signed)
 header.d=none;mediatek.com; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [119.31.174.67]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 56b7e20d-a623-476a-fff8-08d82a07da5f
x-ms-traffictypediagnostic: AM6PR04MB4632:
x-microsoft-antispam-prvs: <AM6PR04MB46321E525F2ED130F5A40D3D8B7C0@AM6PR04MB4632.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:411;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: T4b3+In0q3SxzoKxmnvtGDqRzsyDNapfZ8xY7NyZKh+ofjgB1AiDZmn94McV/k0mWb/5/Y3md6jZmEtPVpc2UGg9z5kVVRzR48ZjLhlS7tpprfTSF2jQ/4yjqxxzyCWN3kJxsoYMt6XVcWCfzwx98GqoowIf/QNdY4focTLwpeP6XXOetg0vVCU0zdHsKshMd6bDQmQn0TduQr8QHQdnuiRpzoTsBZJmThX16xXFy0NhJzASTNjV8MdJz10b/NO1aKINnWFIIv4fOTkDsN54DbqIUIh1DiA4Dr0Of6Id45uGGkrg/AS7ZooMbFTQ0qQvhJY1hMHGYEr63Gq1SEbVsg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7157.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(7916004)(136003)(396003)(366004)(346002)(376002)(39860400002)(6512007)(9686003)(8676002)(54906003)(5660300002)(478600001)(4326008)(44832011)(2906002)(6506007)(53546011)(26005)(186003)(66946007)(76116006)(1076003)(33656002)(6486002)(316002)(83380400001)(71200400001)(66476007)(8936002)(64756008)(91956017)(66446008)(33716001)(66556008)(86362001)(7416002)(6916009);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: ZBYrE0DjpM76uSm/mNc9ASz02BcknLvn9y2ZOhxrwkphpSxYWe/hyODG0kUWTpB9D8EsZQMdZC0jneM1IZSpcz0hTNXT2cDoPzfRIFhWnNqePwiZZh3PNerY1qdiVmGaqIybjdzmNQfq8M3wvSb0pjRWCFpI7zIchDvxR+UL2M4RmqudgY5Jww9k7Lr01KkTALfyOlSOHgALTihCXlIlZoyKdUi/EmXvXgmNa7dJcVRncQemPggJmc95dISMaRkPqC3Kcq3RmlC6bbMfPcff/Sp92WwQSiM/5e4LD+d/yCWlkFDFn/s78lFgGF6g2PhsyCH1Xf0450L1B+RMEA0m5395Xi5stMFZRVbUjhg/V0Bu5MI5DeHRM0y+LCCwh4AxZCTTCfqzkcGe7lLTlvq0qch83+xKK7REdvi2/Qe+8bZzSbcfPru0UZOUJCS1xxbCjwXEMZk6/ip+/GjvWjROLLkCrQxUeHWThXBMEEuhw0w=
x-ms-exchange-transport-forked: True
Content-ID: <D34A2AF1CF166648B0A3C3B04631F398@eurprd04.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7157.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 56b7e20d-a623-476a-fff8-08d82a07da5f
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jul 2020 04:14:08.8373 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /z53Y/NZnovCg2sec/u8C2zD/Op7ZRqBMlklTVMsPoDKMoyY7q/fjOqxqA7QASlWYvRLHPDVgwk7r0gg+D9JfQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB4632
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200717_001413_001388_EDBD1F1E 
X-CRM114-Status: GOOD (  16.01  )
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
Cc: Felipe Balbi <balbi@kernel.org>, Eddie Hung <eddie.hung@mediatek.com>,
 Mediatek WSD Upstream <wsd_upstream@mediatek.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "stable@vger.kernel.org" <stable@vger.kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Macpaul Lin <macpaul.lin@gmail.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 20-07-16 14:41:06, Macpaul Lin wrote:
> There is a use-after-free issue, if access udc_name
> in function gadget_dev_desc_UDC_store after another context
> free udc_name in function unregister_gadget.
> 
> Contex 1:

%s/contex/context

> gadget_dev_desc_UDC_store()->unregister_gadget()->
> free udc_name->set udc_name to NULL
> 
> Contex 2:

The same, otherwise:

Reviewed-by: Peter Chen <peter.chen@nxp.com>

Peter

> gadget_dev_desc_UDC_show()-> access udc_name
> 
> Call trace:
> dump_backtrace+0x0/0x340
> show_stack+0x14/0x1c
> dump_stack+0xe4/0x134
> print_address_description+0x78/0x478
> __kasan_report+0x270/0x2ec
> kasan_report+0x10/0x18
> __asan_report_load1_noabort+0x18/0x20
> string+0xf4/0x138
> vsnprintf+0x428/0x14d0
> sprintf+0xe4/0x12c
> gadget_dev_desc_UDC_show+0x54/0x64
> configfs_read_file+0x210/0x3a0
> __vfs_read+0xf0/0x49c
> vfs_read+0x130/0x2b4
> SyS_read+0x114/0x208
> el0_svc_naked+0x34/0x38
> 
> Add mutex_lock to protect this kind of scenario.

> 
> Signed-off-by: Eddie Hung <eddie.hung@mediatek.com>
> Signed-off-by: Macpaul Lin <macpaul.lin@mediatek.com>
> Cc: stable@vger.kernel.org
> ---
>  drivers/usb/gadget/configfs.c | 11 +++++++++--
>  1 file changed, 9 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/usb/gadget/configfs.c b/drivers/usb/gadget/configfs.c
> index 9dc06a4e1b30..21110b2865b9 100644
> --- a/drivers/usb/gadget/configfs.c
> +++ b/drivers/usb/gadget/configfs.c
> @@ -221,9 +221,16 @@ static ssize_t gadget_dev_desc_bcdUSB_store(struct config_item *item,
>  
>  static ssize_t gadget_dev_desc_UDC_show(struct config_item *item, char *page)
>  {
> -	char *udc_name = to_gadget_info(item)->composite.gadget_driver.udc_name;
> +	struct gadget_info *gi = to_gadget_info(item);
> +	char *udc_name;
> +	int ret;
> +
> +	mutex_lock(&gi->lock);
> +	udc_name = gi->composite.gadget_driver.udc_name;
> +	ret = sprintf(page, "%s\n", udc_name ?: "");
> +	mutex_unlock(&gi->lock);
>  
> -	return sprintf(page, "%s\n", udc_name ?: "");
> +	return ret;
>  }
>  
>  static int unregister_gadget(struct gadget_info *gi)
> -- 
> 2.18.0

-- 

Thanks,
Peter Chen
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
