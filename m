Return-Path: <SRS0=BOys=BD=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0753C433E8
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Jul 2020 03:33:07 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 64F7A20714
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Jul 2020 03:33:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="EjA20od3";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="BGacacde";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="NH07/tmK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 64F7A20714
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=P/bVy3arsXhYjs8LDhmnlwDcvbDhep1+vxReCkVodYY=; b=EjA20od3CvNeRi0x2ajWcMon8
	EAp6qZM0x8gCQjltNYwfXgb1knGKWIsqb0SvrjVeunkWyZzARQolynGwblrJyKbR4gcAnRw/7aYef
	RQbh4/HikPxE5IqYVaJ9ebn/+nNLczTPZXw5lfH1eXmIcb2s/zKpXm+6WNVDsdiC9mI0ld9E1fQ7Y
	AbOYySjMkZRRrRgqiN+YxJngMzBJzOspJsUhS902n52zTaSXLDXUOsjCxxgsLULZcBR+J0cHxHc15
	sIbIBDw1twOoFRH5AVVIZTpmpK1lm2SZXqI2gtCB4DaymVmZosbkvTH+aX2qeh90D17oLRsCXBRao
	jbQTWVRVg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jyoS3-0007eB-As; Fri, 24 Jul 2020 03:32:51 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.73.133])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jyoRx-0007cC-UX; Fri, 24 Jul 2020 03:32:47 +0000
Received: from mailhost.synopsys.com (sv1-mailhost1.synopsys.com
 [10.205.2.131])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id BFAEF406A7;
 Fri, 24 Jul 2020 03:32:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1595561561; bh=Jtmxwa5Xd8+ABoYgll8PhawrkjMfjmuEiIG0tEo+F0g=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=BGacacdev1RiqCFruTduwRuTr3jHSKZ6cqPMk0Ud1+tVZN31TNCQi0kgdaAlUw9+8
 C+C2/4RIrF+hbD7UAAkbKvaKVdG0rmLsZGjQZntR9k42wrMs84i6xRavIe8Na41ei3
 Et+pkVUqyx+aiYlZwYtX2Hi6Rnf5x6iZMeCtDTSt4EtEZl5hd9FGA0rQKxLNIR5z4q
 YRkeJdS46VuRz2grLNoc0tWQHahSm+3be1oAyqWnrJ7M7HJCW3xocxdCplVaWmKN0V
 lF+s88izAbw8pVl/rhX6W5rwPXt9P9S3+H3sYCHaM+viUg8k9SGwPicKWy0dEfqZZ6
 xRyb7dNG5TiUQ==
Received: from o365relay-in.synopsys.com (us03-o365relay3.synopsys.com
 [10.4.161.139])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id 81055A005C;
 Fri, 24 Jul 2020 03:32:35 +0000 (UTC)
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11lp2172.outbound.protection.outlook.com [104.47.57.172])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client CN "mail.protection.outlook.com",
 Issuer "GlobalSign Organization Validation CA - SHA256 - G3" (verified OK))
 by o365relay-in.synopsys.com (Postfix) with ESMTPS id 41084801BF;
 Fri, 24 Jul 2020 03:32:34 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com;
 dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
 spf=pass smtp.mailfrom=thinhn@synopsys.com
Authentication-Results: o365relay-in.synopsys.com; dkim=pass (1024-bit key;
 unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="NH07/tmK";
 dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UaDks9OsQ+bf+5OetADzV/ovGhB/qOt/FurJ0FNDGnNV9UtWYKlWPPwp/DYcJlZSRixssd7OanI9msObOGc3+shRVCIYnX+NoNs6bowBogwrhJfpBAAbOpDmuBad2uPTX7uIUfV/deNmnwJDHJMlbKHqu1mQuDIebDvHjig3rzuOYDM4BYCKkZ3/xa8aziake9XbYMhU11xQXIHReY77TdJsNdfelu6ztk2EXNhgAXzCveAl1SJ673JlCplSkJfp657QQKSNX8wA8ZUWNQSiuXGhq7WU9+vADKHYrsneL8eB3Yd/e00KSefHFeMcQavchGq7gXe3+3DQeQRe33cNaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Jtmxwa5Xd8+ABoYgll8PhawrkjMfjmuEiIG0tEo+F0g=;
 b=XUZ9nx3AugSRxycYxOmdHzRfGJFck+nshRI0yhSc6gNSK2PannI2BE+GDJFCg9xTjMPk4HlcGNi/bb5+shj98kseUiHsCzvNe+HtPcB9pXDSa1/7vfUz46m9VwthaOK9e2FDsRjIj2h7Hw6NGhPXYivW8pD8YFYrV4eb8cQjwtnlfXML1RtuBr4vcPvIt7+2KxhkuMnG0utC4Ms/yKaT1dlcoFYAjLTULFrUCFvMP46wBsQUQ4mH63PR5BOotqMWcALdy372CWN2GiIKTomhARVPdAkwEVwTKoAkVfLZHWXhQCK85vyh1l+1mlsfpvNcgtdsagnHPqFahm8/rVL9dQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Jtmxwa5Xd8+ABoYgll8PhawrkjMfjmuEiIG0tEo+F0g=;
 b=NH07/tmK9PqVvpTiGc4BPMu8mwC/OSuJOHO5KqCyHVnpjRhS0g9RSVh/XXaaDB9hFM7+FfUp6ztyeHjySjggFrF4DkNFJnmggHvALLbRFVJv+E5Km6wLhTMda6A1kZkrL8NCwKR+s2m5VeTlB2gaM9H+tIfA1o8cM2CrmGItlsw=
Received: from BYAPR12MB2917.namprd12.prod.outlook.com (2603:10b6:a03:130::14)
 by BY5PR12MB4049.namprd12.prod.outlook.com (2603:10b6:a03:201::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3195.17; Fri, 24 Jul
 2020 03:32:32 +0000
Received: from BYAPR12MB2917.namprd12.prod.outlook.com
 ([fe80::3844:ed8:654d:7456]) by BYAPR12MB2917.namprd12.prod.outlook.com
 ([fe80::3844:ed8:654d:7456%5]) with mapi id 15.20.3216.025; Fri, 24 Jul 2020
 03:32:32 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>, Felipe Balbi <balbi@kernel.org>
Subject: Re: [RFC PATCH] usb: dwc3: fix maximum_speed check for usb2.0-only
 core
Thread-Topic: [RFC PATCH] usb: dwc3: fix maximum_speed check for usb2.0-only
 core
Thread-Index: AQHWVciZhhgPOtxvykmm/JX0MmuCQ6j/0eIAgBZYqwA=
Date: Fri, 24 Jul 2020 03:32:31 +0000
Message-ID: <e94e9d0c-b0d5-b2e1-e3de-0a4e85bc95b4@synopsys.com>
References: <1594282250-25544-1-git-send-email-chunfeng.yun@mediatek.com>
 <6dff8574-e649-7a5c-4d80-c3fe6ddd6645@synopsys.com>
In-Reply-To: <6dff8574-e649-7a5c-4d80-c3fe6ddd6645@synopsys.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
authentication-results: synopsys.com; dkim=none (message not signed)
 header.d=none;synopsys.com; dmarc=none action=none header.from=synopsys.com;
x-originating-ip: [149.117.7.23]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0bd2be35-7e90-47d2-a785-08d82f823321
x-ms-traffictypediagnostic: BY5PR12MB4049:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BY5PR12MB404948F3463EEBC39CDFFAB0AA770@BY5PR12MB4049.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: dL17mQUEM+HG+NcA2rNkhs6fEJuK79RCeENt3lrRTv2A01A8pkmmZX7Iy3t2XeeEApXzWQ+6390p0bOh+Wjox4bV8t+3Wb2gxIbfYtvzPZHTNfB3azJJ8lwxRKqCkd/stPCWuZvrBEj7YCS5xw7A/p2w+Q1TNFz7sZQ9czSOCRKFMYC36KizSIq8rqnEw0AXpIgVuGCXZigjHJAsJ0u2KVYYJnooEdlzn5wDiLh/WiFTbE17A/g36xQYtHYkEqwlDpryaS02BzQLfaZU1eTgakKteS6476BI3NqbYMBueUsccw+hhX5v0/F+LqWRdRQdPm9HYiFZbJfpzmaW7mS5M+XSXAjfRjjX12qIHptiHlQLMCgX4TCFptXtd7bP5sl3
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB2917.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(376002)(346002)(396003)(39860400002)(136003)(366004)(186003)(478600001)(26005)(4326008)(31696002)(66476007)(64756008)(36756003)(6506007)(83380400001)(66556008)(66946007)(76116006)(5660300002)(66446008)(2906002)(6486002)(71200400001)(316002)(86362001)(2616005)(6512007)(8676002)(31686004)(110136005)(8936002)(54906003)(43740500002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: 5mP5FVM/7bllaQ4lsi7Hcf7knY1WoCXliRXvMe8dcfEJMAanzPhMZkS2x1GNSuK/9yTAbKHAaWuJOQFQiCtNQVoB4e73ojExF5udVkCUjxXECJ7hjzAIap/mbvZqEFeODqZ+mJuCtTKsxeCuYnywoF9IbubgjS9zwuZlX8z9M0uYBqYuXy/OtxAb1M+2/aak0RdZ+lgHV+P1M+YJZLky57nh7BdJj7oTWeHlEiAh+aP9/ICFwhPIHcvNPsi4m1k4cwHZp3RxrpxF2/8ZEpYHvsYV0T+uCDfCvimLGRQlqI3M77HkD4sLt7LvmtUY7Jwz1Neq20UE/XADwXZ+VdBMON0TujNA0EMT0xNbKSIjhEqtRt11Ob7Uzxw9zX29rzS2IOrjii8QIfpscsLvbZ4zFlexjI55KrvQS6AhPBYfN0n2X0S8ODHZOVsIcwv72Cr4chVxDHwTHpxWSIZwlAL7e48gzRWNKwn9br9aqwTwyMo=
Content-ID: <0F3C220DDF65CD4F83434F569E6FB423@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB2917.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0bd2be35-7e90-47d2-a785-08d82f823321
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jul 2020 03:32:31.5447 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: x9Kr6kDeu+lFae/muM41kBJlljSuNNFMqfcW1R0uL7Ar9JTQyoocGIw9KyKPogEW/ZMaES/XztT7TW8jL47M9Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4049
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200723_233246_131039_919F9507 
X-CRM114-Status: GOOD (  23.13  )
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
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi,

Thinh Nguyen wrote:
> Hi,
>
> Chunfeng Yun wrote:
>> The maximum_speed will be USB_SPEED_SUPER_PLUS, but the
>> maximum_speed check for usb2.0-only core doesn't consider it,
>> so fix it, and move the ckeck into dwc3_check_params().
>>
>> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
>> ---
>> Note:
>>
>> When I look at the code, find that this may be a problem, but no
>> platform to test it.
>> ---
>>    drivers/usb/dwc3/core.c | 14 +++++++-------
>>    1 file changed, 7 insertions(+), 7 deletions(-)
>>
>> diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
>> index 25c686a7..ffd5ab3 100644
>> --- a/drivers/usb/dwc3/core.c
>> +++ b/drivers/usb/dwc3/core.c
>> @@ -930,13 +930,6 @@ static int dwc3_core_init(struct dwc3 *dwc)
>>    	 */
>>    	dwc3_writel(dwc->regs, DWC3_GUID, LINUX_VERSION_CODE);
>>    
>> -	/* Handle USB2.0-only core configuration */
>> -	if (DWC3_GHWPARAMS3_SSPHY_IFC(dwc->hwparams.hwparams3) ==
>> -			DWC3_GHWPARAMS3_SSPHY_IFC_DIS) {
>> -		if (dwc->maximum_speed == USB_SPEED_SUPER)
>> -			dwc->maximum_speed = USB_SPEED_HIGH;
>> -	}
>> -
>>    	ret = dwc3_phy_setup(dwc);
>>    	if (ret)
>>    		goto err0;
>> @@ -1426,6 +1419,13 @@ static void dwc3_check_params(struct dwc3 *dwc)
>>    
>>    		break;
>>    	}
>> +
>> +	/* Handle USB2.0-only core configuration */
>> +	if (DWC3_GHWPARAMS3_SSPHY_IFC(dwc->hwparams.hwparams3) ==
>> +			DWC3_GHWPARAMS3_SSPHY_IFC_DIS) {
>> +		if (dwc->maximum_speed > USB_SPEED_HIGH)
>> +			dwc->maximum_speed = USB_SPEED_HIGH;
>> +	}
>>    }
>>    
>>    static int dwc3_probe(struct platform_device *pdev)
> Actually, the dwc->maximum_speed captures the maximum speed device
> property value. It maybe be set based on the phy's capability if there's
> no property specifying it (i.e. maximum_speed is USB_SPEED_UNKNOWN).
>
> So, this code should be removed. The fix should be in the check of
> dwc3_check_params(). If maximum_speed = USB_SPEED_UNKNOWN and the phy's
> capability is only up to highspeed, then set the maximum_speed to
> highspeed only.
>

Are you going into update and resend this patch? If not I can create one 
and add your "Reported-by"

BR,
Thinh
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
