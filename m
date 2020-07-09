Return-Path: <SRS0=UXZI=AU=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97C07C433E0
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Jul 2020 22:17:55 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 640B320672
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Jul 2020 22:17:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="unlNygzT";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="Dl1JHR1k";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="PgL9es32"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 640B320672
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=PyIMwC4SJw6CrEvHY4agdhJ68Qv9M+tCrSmFrrdByxw=; b=unlNygzTtCTZ3ypHtdFCS43uR
	HO5DMjwtGp+KeiIlYQhVbdiYnsodJcvK/8JgX3BYVsdvmy1ihiuXr5nGu8aDhphEuuPtTveQrSW8P
	uc+XYV0BxnhFyChZQmzDXgb8gjjx7EMDdwdnHefceCR2RSYif4yyTvH6QHh38Fm5BCj2hhdr5zbh6
	Wc7z9MbLYzhyGX9vDX59qfjpUrKcUS1Kc9w5g+yk6/CR+XZsJ9oN221oUsRmWUvRPZ5v0CKrUfeAo
	92bNa7htpdwdrQsLrjfH6K7rTcv0kG8iT4mgaPV8CEqQHL8E6SHKxZWCTL8fwkvP92NANYyuHeBEb
	k6Ikea+5w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jterQ-0007XE-NX; Thu, 09 Jul 2020 22:17:44 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.87.133])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jterM-0007W4-Ij; Thu, 09 Jul 2020 22:17:41 +0000
Received: from mailhost.synopsys.com (badc-mailhost3.synopsys.com
 [10.192.0.81])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 954D3C0085;
 Thu,  9 Jul 2020 22:17:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1594333056; bh=Qt1FJKX7UzVe557qNHMkEaqKfLwQHfejd/BSoFXlF8g=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=Dl1JHR1kFhHDMg68WnvBHexFmHYIao1/Ap4le6r5rhVf867FEd61+EObugQNG4fDR
 GRdPCU89ftmoLbdCXjPWx85T1ygwqjeKd09Q7hcsIeyUJ/MfAbpANtcBfA8tKryQvL
 XKiqloK1dcNEWgb3TpqwkfnWlZ4zI2vnnm/i1lpFvLVcRMZoGlEOAMmLJWw2X3BOZJ
 qPJRlqIpUbeOTq71UkFVszRgKmogSXg06baaNVxsJpeHtr9fkS8xCTp1GMtytNIClt
 DrPEqdGNgT+7Cxl0SHDngOLtEooNcbFcdZf2JS3yM9mPMNzF2Nzqmd6grhjupikeKk
 ss7eHPqZESciw==
Received: from o365relay-in.synopsys.com (us03-o365relay3.synopsys.com
 [10.4.161.139])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id C644CA005A;
 Thu,  9 Jul 2020 22:17:31 +0000 (UTC)
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2100.outbound.protection.outlook.com [104.47.70.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client CN "mail.protection.outlook.com",
 Issuer "GlobalSign Organization Validation CA - SHA256 - G3" (verified OK))
 by o365relay-in.synopsys.com (Postfix) with ESMTPS id 600D6800DE;
 Thu,  9 Jul 2020 22:17:29 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com;
 dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
 spf=pass smtp.mailfrom=thinhn@synopsys.com
Authentication-Results: o365relay-in.synopsys.com; dkim=pass (1024-bit key;
 unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="PgL9es32";
 dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OUzSMpW9sgTUvjkPf9n2GkkdYaoXCyGnP8fH+eHxGueXK7URQGUpGNaAU1lObukA50rM7ha/3dQgoUqqG8EjO6gMWShlPM7RLhQ8M6ITmmq9qysACJGwYKV3csqMr82ZDRHV7zJ+BZtVYfz7LKyxRSm1BCt9U4ZbGNiWcg8VStXDo0IMrcYR2ajLqVBX/1Yzsiw8u1p5DoIMiejOm8zV2ik7p7FWGnM6sVfFMC/ZVF9WjFarXUayol+hnxaF+8S4bTqDfV4cgPNeoK3ZEShiE73Sh4/gmnrdjKa2M2bDRFEuTbK+hHt08wcZ9ekNvPSckvxmt+hac9R4+7hqwF6q1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qt1FJKX7UzVe557qNHMkEaqKfLwQHfejd/BSoFXlF8g=;
 b=VZyYXqCEDrCbBvY3pTEeN52cV5kGsuBRvsCsh4ZvsfopQFIoOXPJ5qOiHZ8jKg/MATndxsAQUD6pILbpYZDy/bneXGnwfeRcnvfTJFSU3jEtf/ERm0jkhl/30bRD3+kHw73G6lldMAH/Z8o+iL9hUGoIVD8N/k74loj4ZEGHo5bHYa+LDZlegSGIfdZC1te2Ov65qSJTMmIeJYiT4rmoT10EbKOuPmKLcowDVTqX1SnbbOZJaZ2kN0cmOHeYT5LWb1qahe5Yk7XaYO4hXadONJ4Tms5mZeFj5SJ3gwt0yYgXzj55gWAKwDNS1XTFNDlRW9kaCZPJ1Ifwwqcp8Ahg3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qt1FJKX7UzVe557qNHMkEaqKfLwQHfejd/BSoFXlF8g=;
 b=PgL9es32PJTWbG5Bkf6XWLC6dvsTMaKBnEGW2mi5KpIVaoN6gqhCuG4Mh3R2PmHVr318DkSajBQTF7faZlaYJcBfhRa6yN6N8wsa5dErin5QuUZm9FNAHPCLT68N/RepteABGEnYKSM7YD8LKYKkn9XbEmqbThkFcmmlq/oQjlc=
Received: from BYAPR12MB2917.namprd12.prod.outlook.com (2603:10b6:a03:130::14)
 by BY5PR12MB3874.namprd12.prod.outlook.com (2603:10b6:a03:1ad::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3174.21; Thu, 9 Jul
 2020 22:17:27 +0000
Received: from BYAPR12MB2917.namprd12.prod.outlook.com
 ([fe80::3844:ed8:654d:7456]) by BYAPR12MB2917.namprd12.prod.outlook.com
 ([fe80::3844:ed8:654d:7456%5]) with mapi id 15.20.3153.032; Thu, 9 Jul 2020
 22:17:27 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>, Felipe Balbi <balbi@kernel.org>
Subject: Re: [RFC PATCH] usb: dwc3: fix maximum_speed check for usb2.0-only
 core
Thread-Topic: [RFC PATCH] usb: dwc3: fix maximum_speed check for usb2.0-only
 core
Thread-Index: AQHWVciZhhgPOtxvykmm/JX0MmuCQ6j/0eIA
Date: Thu, 9 Jul 2020 22:17:27 +0000
Message-ID: <6dff8574-e649-7a5c-4d80-c3fe6ddd6645@synopsys.com>
References: <1594282250-25544-1-git-send-email-chunfeng.yun@mediatek.com>
In-Reply-To: <1594282250-25544-1-git-send-email-chunfeng.yun@mediatek.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
authentication-results: mediatek.com; dkim=none (message not signed)
 header.d=none;mediatek.com; dmarc=none action=none header.from=synopsys.com;
x-originating-ip: [149.117.7.24]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 277543ec-77c2-414b-9050-08d82455dd01
x-ms-traffictypediagnostic: BY5PR12MB3874:
x-microsoft-antispam-prvs: <BY5PR12MB3874035567D0742A59759E3EAA640@BY5PR12MB3874.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: psaEZOPacPfBl8iuiNVEG60nDDmyfOruGpEkEd/6KMkM8jm3bEjgyX7WtWLAy5+ScdObNl+Et+qpci9HoRnyQgy+2PZ1j7hE3fwE0Pr1TQVmNdZOukW9IzvjyCFoL52uTPiUG7BGmUS0+jjoVCGwGMNsLZT7W7noT+guBIrekDNZxBZgFkgEuqRjp4i8pOzyEN5zJlYi7GzEQqOl48sH+dsN5EYroNDRZzZNYz+2Jl4pvAH8xGYKkanYlO1Pkax0PAjdNWDu79wcoj2z1fwlgxJ0uMC2bA5YxM4+9hlg3vE5acsdR03NjELnyeFsG80c2jTBx4uGIh8nX5D0ZQzDe3fDLGu69R4vTtdKL+NUrwoMOqcpXiTPxlFwfJ9K0cww
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB2917.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(39860400002)(346002)(366004)(376002)(396003)(136003)(66446008)(66476007)(66946007)(66556008)(64756008)(31696002)(31686004)(2616005)(76116006)(71200400001)(478600001)(6512007)(86362001)(36756003)(26005)(6486002)(2906002)(316002)(83380400001)(110136005)(8676002)(186003)(6506007)(4326008)(54906003)(8936002)(5660300002)(43740500002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: vnsgZrkw1wKs26Z+8q26CvDiFxT6dzjkXlQjesKIKGPEA7LwqdOgoxLHStponOl+QwL3KiU42NljE8HbC/a5xtDKY+60zClzKgSe4fNBhURbzPa8howhkihzHYSsgYSF6kOxp9HXJNKplRGJYTe3DZkjJsfxdO9tn5l+StmUIXhPhiudW6HSBQK0RLWL3OynAm7xLM7kSxAwyK9BzkPgOrwS+ovEKsH9p92YY1gMRMH4LHNUNrYoLoreeoDm7swDC1Zs9KLhT2xM4i6jZKz7AwTAcL0th31d9+Rf9u1FF1nLV5yRybUhn4iURTfjsg3kAqlFcEwgevtRztxKSjAPQngGQe3kS0Js+TceQsv+BFbtQgw5fHLN3LpgHqomUdrEQPwQ96eJTkAdB7GvC0Sg4VbDTYQyVoPSWknmmkHBNLL4WJFZSKoJfkyqgH7EIeAbYoe27XpJ2XeVNaTF6EjOxYgHnp/N/826yEagXfwAGbA=
x-ms-exchange-transport-forked: True
Content-ID: <F76D7F612B429F468EBD9E4A1DEAD566@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB2917.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 277543ec-77c2-414b-9050-08d82455dd01
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jul 2020 22:17:27.1002 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6UYbxn9v1EeKVchpSVSOm+OFBDKJKBvbgJGNqU2YiVHLNbsRGYIuQ3vcyPOJ3Hqbp/FzrLMkiarkP0wz3li6pQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB3874
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200709_181740_776370_80C8CB34 
X-CRM114-Status: GOOD (  23.39  )
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

Chunfeng Yun wrote:
> The maximum_speed will be USB_SPEED_SUPER_PLUS, but the
> maximum_speed check for usb2.0-only core doesn't consider it,
> so fix it, and move the ckeck into dwc3_check_params().
>
> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> ---
> Note:
>
> When I look at the code, find that this may be a problem, but no
> platform to test it.
> ---
>   drivers/usb/dwc3/core.c | 14 +++++++-------
>   1 file changed, 7 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
> index 25c686a7..ffd5ab3 100644
> --- a/drivers/usb/dwc3/core.c
> +++ b/drivers/usb/dwc3/core.c
> @@ -930,13 +930,6 @@ static int dwc3_core_init(struct dwc3 *dwc)
>   	 */
>   	dwc3_writel(dwc->regs, DWC3_GUID, LINUX_VERSION_CODE);
>   
> -	/* Handle USB2.0-only core configuration */
> -	if (DWC3_GHWPARAMS3_SSPHY_IFC(dwc->hwparams.hwparams3) ==
> -			DWC3_GHWPARAMS3_SSPHY_IFC_DIS) {
> -		if (dwc->maximum_speed == USB_SPEED_SUPER)
> -			dwc->maximum_speed = USB_SPEED_HIGH;
> -	}
> -
>   	ret = dwc3_phy_setup(dwc);
>   	if (ret)
>   		goto err0;
> @@ -1426,6 +1419,13 @@ static void dwc3_check_params(struct dwc3 *dwc)
>   
>   		break;
>   	}
> +
> +	/* Handle USB2.0-only core configuration */
> +	if (DWC3_GHWPARAMS3_SSPHY_IFC(dwc->hwparams.hwparams3) ==
> +			DWC3_GHWPARAMS3_SSPHY_IFC_DIS) {
> +		if (dwc->maximum_speed > USB_SPEED_HIGH)
> +			dwc->maximum_speed = USB_SPEED_HIGH;
> +	}
>   }
>   
>   static int dwc3_probe(struct platform_device *pdev)

Actually, the dwc->maximum_speed captures the maximum speed device 
property value. It maybe be set based on the phy's capability if there's 
no property specifying it (i.e. maximum_speed is USB_SPEED_UNKNOWN).

So, this code should be removed. The fix should be in the check of 
dwc3_check_params(). If maximum_speed = USB_SPEED_UNKNOWN and the phy's 
capability is only up to highspeed, then set the maximum_speed to 
highspeed only.

Thanks,
Thinh
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
