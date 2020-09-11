Return-Path: <SRS0=cvih=CU=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F91EC433E2
	for <linux-mediatek@archiver.kernel.org>; Fri, 11 Sep 2020 04:58:22 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5654121D81
	for <linux-mediatek@archiver.kernel.org>; Fri, 11 Sep 2020 04:58:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="29irJNWi";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=renesasgroup.onmicrosoft.com header.i=@renesasgroup.onmicrosoft.com header.b="ko4W9NOA"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5654121D81
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=renesas.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=LvNkDVE0wh9zpreoIogPQSWEuiXDXRS5lS/NP3Jw2QM=; b=29irJNWiBe3+/fJA2WlWp2rbL
	a7qSF6ahjxjh4sFMZii+eR6hjjpGRXJzPj0JMa/dZJh5XztxyJlWxe0HCSTxuMDxuoSFZTdy/OK1U
	Z5B3gVwGTZN/UKClJj2T9Fg2cHK+YrxTQfbvZSSZF+i3UXiVBJOlhPIbybEPier4rjyAGRoQcjI3B
	4APAsD4sGHi9dZ7Ts4tGldDxT32st9kxauvPjF7F7xLdqintt/74OdvmEXz0Ei94MfTE3hsxOjdIF
	rG8gMlMFSCsQ3KXMdb2hPvHiYLkx4joOdWlNXeUUsn8RQA0My4QjE0wpOOBKja2Joxo0pa6zCE+qC
	tHEEzlt/A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kGb8V-0005Tb-9F; Fri, 11 Sep 2020 04:58:11 +0000
Received: from mail-eopbgr1410092.outbound.protection.outlook.com
 ([40.107.141.92] helo=JPN01-OS2-obe.outbound.protection.outlook.com)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kGb8Q-0005Sm-1c; Fri, 11 Sep 2020 04:58:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SeTjNov9LyV/9ObV7OqWRShjAwP/aJJjoyLEejMuy43LrFqBHmNg3SpUSz4ZAE71Ftr1zmUkqhfGE/rsobOLLEgkv/GueLUb+rpGMOhjQ5P/fIp2KWbOx2g6UJFkLBeM1Dk5zUY22OgMokQC4eC7ZsaG0T8E1ckxPI6Tysb4cBlk2S0K+gMzrJB/+lucQdALj9WeHFSKqQJdewuXX+t6WBDHQ/ExlhVJ9jCDmc+Es7MAmhqPNDUCfyJWWoV1SVh0yt07nG601x+KjZufXPrzTN4Im7nyDqPaMFviziKpZYu9lcHP7AxdqwTzDRoTexKVEwALYXo4hGWfiFy2VeLdXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AEF6dGwO+207cnJ2FOxUQiGpHsiQF0rItikYz+sirnA=;
 b=Of9oOGN9kxRfgXFHG4TfhJ1dUl2BKSrAvAkVQ0kmKP4+c55DvuCTqxnCbiw6pOBDM+q0P+Am8iidAgdABBiBwvtwXBJKAfvpaIWhnkiUhwjFG8mzYOC0UPTLjP08Knjp1cBExPCpySuqGAJ98MqMeMyoo0TknMQDhUy9D5b3NXpRRiLHNZsm/70+5cb04TdpcEIQpWT9AvzaKFsfYpdOxiJETWhT471bdMe9SGCcb0+xGu13UY5IeA1zngLs5/pCK9AzRNWAwrO/HegFP1z+lBQerk/dYIrZRNG83tpdCnDXejVeJq6PcWxy7oS2OU5UFe60YSnef7cb+PzJoUmCbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AEF6dGwO+207cnJ2FOxUQiGpHsiQF0rItikYz+sirnA=;
 b=ko4W9NOAL0nzAj9pWusRax00cDtRkpBHxFtWBf8OkZXEARBNBPDJp4+bAJnz+Lf6Bt02oeGkv7BOEJrXuH1I8VBA/qXLdfK8PPt3tpR4D99Wbu/usvRTydGaVvePn2RK7k59m2xj11lnQFJNvnVG34h3caJ+U/JGQX3wmPBbrFg=
Received: from OSAPR01MB3683.jpnprd01.prod.outlook.com (2603:1096:604:33::12)
 by OSYPR01MB5429.jpnprd01.prod.outlook.com (2603:1096:604:80::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3370.17; Fri, 11 Sep
 2020 04:57:53 +0000
Received: from OSAPR01MB3683.jpnprd01.prod.outlook.com
 ([fe80::1d16:3e99:8fb2:84e1]) by OSAPR01MB3683.jpnprd01.prod.outlook.com
 ([fe80::1d16:3e99:8fb2:84e1%7]) with mapi id 15.20.3370.016; Fri, 11 Sep 2020
 04:57:53 +0000
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>
Subject: RE: [PATCH RESEND v3 04/11] usb: xhci-rcar: convert to
 readl_poll_timeout_atomic()
Thread-Topic: [PATCH RESEND v3 04/11] usb: xhci-rcar: convert to
 readl_poll_timeout_atomic()
Thread-Index: AQHWh0vD+aj1y+DFoU+XUmXRM8L6jalh2WYAgADf1oCAAAetsIAAFCEAgAAJHUA=
Date: Fri, 11 Sep 2020 04:57:52 +0000
Message-ID: <OSAPR01MB3683A8CE38F900DC0CA5D472D8240@OSAPR01MB3683.jpnprd01.prod.outlook.com>
References: <1599726112-4439-1-git-send-email-chunfeng.yun@mediatek.com>
 <1599726112-4439-4-git-send-email-chunfeng.yun@mediatek.com>
 <20200910131212.wm7zskxvcesl652c@holly.lan>
 <1599791601.24609.5.camel@mhfsdcap03>
 <OSAPR01MB3683CA015AB25BC00D8459EBD8240@OSAPR01MB3683.jpnprd01.prod.outlook.com>
 <1599797572.24609.8.camel@mhfsdcap03>
In-Reply-To: <1599797572.24609.8.camel@mhfsdcap03>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mediatek.com; dkim=none (message not signed)
 header.d=none;mediatek.com; dmarc=none action=none header.from=renesas.com;
x-originating-ip: [240f:60:5f3e:1:64a2:c8a4:9548:6c30]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 5eab771e-80fc-463c-79c4-08d8560f3d9b
x-ms-traffictypediagnostic: OSYPR01MB5429:
x-microsoft-antispam-prvs: <OSYPR01MB54293D438397CA2A0E87FC9BD8240@OSYPR01MB5429.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Tj1B7A4ahgoU7n+otrqAIaP1XGmyVAwj3cd/1YbPGc2xwXQmx7CqIK8KU2kVTBHMrJ8AKfre8lSJvqyaoED0TBAx8ENgn8Nr0NZ5UQnyfA9QQt2d2yS/mboUH2Jq+xhvsjMQ1rh4fRgJsl2FX1iVHm1gzaKQaWjzCLbPUGjnMb7c87KK4SsK03wDgRv15D2toX6dJZTS3MzxuEV046RxpVQllOkMZZXfk7iR3AjX8ZqOqPut+qPRZZvYdYcxYnBxecDYI+W6nL7KGEJDJ+1vOqBNNcS4nHf0rJYi4P3IC5AOZXzASTn7VwCk745TVs1g
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OSAPR01MB3683.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(136003)(39860400002)(366004)(346002)(396003)(7696005)(6506007)(86362001)(4326008)(316002)(8676002)(186003)(7416002)(8936002)(478600001)(9686003)(2906002)(54906003)(6916009)(55016002)(76116006)(5660300002)(66556008)(64756008)(66446008)(66476007)(66946007)(52536014)(71200400001)(83380400001)(33656002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: /xxCQp41MnvIsDQ9gXWBpG8gBLT449vlQLYRypWoUJHhoID4hPuUTuMoUNlcX+GGypk1Qvg0xOhUxAn+BXl6MLK7ALBgAvGu7Tg5ZMfhZhp/JpA8w8NAoIec4hOsVv9aaEbsBPPjEsCsEce+uph7rkI5ssIySp5yiandzqarnR4vgQHslXpnf7J/9gPFjf66vTRKR6OOZ0ZP8RzD02t4gOwEv7UWrjvHPQk0tqIM14IqP1jkR0B3d2GvKR8ADAwH+jDPOez2AaQsxxKSW3XfaHNVouwWhlRlBmxOK6PRTXjSr2y8xUeUmuu67x2bA9PWCYNHlvqpi8FADZxGBAbIJ3J6ZveMqjT1K2y3hMpXxot2czMNlqIvWyUqSDLPOC3klY6Ixt47q8uX9Zm1I1FpILj6H7AuQF0xj5BdDzJfYRUi+J1JAgctTu0CIuwLbpMECMctrQMAyFlqEwBU7AtS7HgAjZiyjMz3IbwQhuCjzRpxHt6Tjgwel+0IeOORTpFguAI06qCyvPGfapX8EkPErGYvc8Khv4MXbVgHuvT0R/plYprjscVyY+/7uChGbUYbNO7xqpHjl+nZNaSi/Q7bTZ792OaxyDVAqTesL4fDA2MnV8UsEuCd+DJwKqNoqfnyRSy+uxjPXtNNJpRPHNb643nxMJswPhsKeH8YohMOK7hcN7PZDWT7OTISrbQDoXlTZNyQBdmbW59amb0hjX3qAg==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OSAPR01MB3683.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5eab771e-80fc-463c-79c4-08d8560f3d9b
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Sep 2020 04:57:52.7774 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: paIBQnmnPcjhnj9MJQO17Ysp2/ICaIWnnhVlx47WhInNEpeKrXf8FJJ1ZUNk4W+N6xUFFXVDFAmSR8utjJAT96OEPznMOLvn/Cg0Dls9MXH1HYd/DZ/cinorUXLbDcB5
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSYPR01MB5429
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200911_005806_199526_6FBE354B 
X-CRM114-Status: GOOD (  34.46  )
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
Cc: "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, Felipe Balbi <balbi@kernel.org>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
 Mathias Nyman <mathias.nyman@linux.intel.com>, Arnd Bergmann <arnd@arndb.de>,
 Mathias Nyman <mathias.nyman@intel.com>, Sumit Garg <sumit.garg@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jann Horn <jannh@google.com>,
 Chuhong Yuan <hslester96@gmail.com>, Douglas Anderson <dianders@chromium.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Saurav Girepunje <saurav.girepunje@gmail.com>, Jason Yan <yanaijie@huawei.com>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "Eric W. Biederman" <ebiederm@xmission.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Lee Jones <lee.jones@linaro.org>,
 Ben Dooks <ben.dooks@codethink.co.uk>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Chunfeng,

> From: Chunfeng Yun, Sent: Friday, September 11, 2020 1:13 PM
> 
> On Fri, 2020-09-11 at 03:13 +0000, Yoshihiro Shimoda wrote:
> > Hi Daniel, Chunfeng,
> >
> > > From: Chunfeng Yun, Sent: Friday, September 11, 2020 11:33 AM
> > >
> > > On Thu, 2020-09-10 at 14:12 +0100, Daniel Thompson wrote:
> > > > On Thu, Sep 10, 2020 at 04:21:45PM +0800, Chunfeng Yun wrote:
> > > > > Use readl_poll_timeout_atomic() to simplify code
> > > > >
> > > > > Cc: Mathias Nyman <mathias.nyman@linux.intel.com>
> > > > > Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> > > > > Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> > > > > ---
> > > > > v2~v3: no changes
> > > > > ---
> > > > >  drivers/usb/host/xhci-rcar.c | 43 ++++++++++++-------------------------------
> > > > >  1 file changed, 12 insertions(+), 31 deletions(-)
> > > > >
> > > > > diff --git a/drivers/usb/host/xhci-rcar.c b/drivers/usb/host/xhci-rcar.c
> > > > > index c1025d3..74f836f 100644
> > > > > --- a/drivers/usb/host/xhci-rcar.c
> > > > > +++ b/drivers/usb/host/xhci-rcar.c
> > > > > @@ -6,6 +6,7 @@
> > > > >   */
> > > > >
> > > > >  #include <linux/firmware.h>
> > > > > +#include <linux/iopoll.h>
> > > > >  #include <linux/module.h>
> > > > >  #include <linux/platform_device.h>
> > > > >  #include <linux/of.h>
> > > > > @@ -127,8 +128,7 @@ static int xhci_rcar_download_firmware(struct usb_hcd *hcd)
> > > > >  	void __iomem *regs = hcd->regs;
> > > > >  	struct xhci_plat_priv *priv = hcd_to_xhci_priv(hcd);
> > > > >  	const struct firmware *fw;
> > > > > -	int retval, index, j, time;
> > > > > -	int timeout = 10000;
> > > > > +	int retval, index, j;
> > > > >  	u32 data, val, temp;
> > > > >  	u32 quirks = 0;
> > > > >  	const struct soc_device_attribute *attr;
> > > > > @@ -166,32 +166,19 @@ static int xhci_rcar_download_firmware(struct usb_hcd *hcd)
> > > > >  		temp |= RCAR_USB3_DL_CTRL_FW_SET_DATA0;
> > > > >  		writel(temp, regs + RCAR_USB3_DL_CTRL);
> > > > >
> > > > > -		for (time = 0; time < timeout; time++) {
> > > > > -			val = readl(regs + RCAR_USB3_DL_CTRL);
> > > > > -			if ((val & RCAR_USB3_DL_CTRL_FW_SET_DATA0) == 0)
> > > > > -				break;
> > > > > -			udelay(1);
> > > > > -		}
> > > > > -		if (time == timeout) {
> > > > > -			retval = -ETIMEDOUT;
> > > > > +		retval = readl_poll_timeout_atomic(regs + RCAR_USB3_DL_CTRL,
> > > > > +				val, !(val & RCAR_USB3_DL_CTRL_FW_SET_DATA0),
> > > > > +				1, 10000);
> > > > > +		if (retval < 0)
> How about free firmware and return error number here ? instead of break

I think clearing CTRL_ENABLE code below is needed.
And, I think this patch should not change a lot of things...

> > > > >  			break;
> > > > > -		}
> > > > >  	}
> > > > >
> > > > >  	temp = readl(regs + RCAR_USB3_DL_CTRL);
> > > > >  	temp &= ~RCAR_USB3_DL_CTRL_ENABLE;
> > > > >  	writel(temp, regs + RCAR_USB3_DL_CTRL);
> > > > >
> > > > > -	for (time = 0; time < timeout; time++) {
> > > > > -		val = readl(regs + RCAR_USB3_DL_CTRL);
> > > > > -		if (val & RCAR_USB3_DL_CTRL_FW_SUCCESS) {
> > > > > -			retval = 0;
> > > > > -			break;
> > > > > -		}
> > > > > -		udelay(1);
> > > > > -	}
> > > > > -	if (time == timeout)
> > > > > -		retval = -ETIMEDOUT;
> > > > > +	retval = readl_poll_timeout_atomic((regs + RCAR_USB3_DL_CTRL),
> > > > > +			val, (val & RCAR_USB3_DL_CTRL_FW_SUCCESS), 1, 10000);
> > > >
> > > > Directly assigning to retval at this point will clobber a previous
> > > > -ETIMEDOUT error.
> > > >
> > > > In other words if there is a timeout waiting for FW_SET_DATA0, but not for
> > > > DW_SUCCESS, then we will return the wrong return value.
> >
> > Thank you for your comment! I didn't realized this.
> >
> > > Yes, agree with you, but seems I keep its original logic unchanged.
> > > Hi Yoshihiro,
> > >
> > >   What do think about Daniel's suggestion? should I fix it up?
> >
> > I think you should fix it up like below:
> >
> > if (readl_poll_timeout_atomic(regs + RCAR_USB3_DL_CTRL,
> > 		val, val & RCAR_USB3_DL_CTRL_FW_SUCCESS, 1, 10000) < 0)
> > 	retval = -ETIMEOUT;	/* Overwrite retval if timeout occurred */
> 
> readl_poll_timeout_atomic() only return -ETIMEOUT error number, so this
> likes what I did, doesn't fix it.

readl_poll_timeout_atomic() returns 0 if timeout doesn't happen.
So, when my suggestion code runs, the retval is not overwritten if
the readl_poll_timeout_atomic(regs + RCAR_USB3_DL_CTRL...) returns 0.

Best regards,
Yoshihiro Shimoda

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
