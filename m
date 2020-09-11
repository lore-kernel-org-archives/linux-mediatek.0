Return-Path: <SRS0=cvih=CU=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B352FC433E2
	for <linux-mediatek@archiver.kernel.org>; Fri, 11 Sep 2020 03:14:16 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 05A7D208E4
	for <linux-mediatek@archiver.kernel.org>; Fri, 11 Sep 2020 03:14:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="i/3U1Y3v";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=renesasgroup.onmicrosoft.com header.i=@renesasgroup.onmicrosoft.com header.b="ePU1Stb7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 05A7D208E4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=renesas.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=i4l9vxbd0q17sHjX/kPcV716VlIYgb54pNLLRUMxuuU=; b=i/3U1Y3vGkexRy+CfWw3P7MyA
	lY6XG4EH3XRqFxAHyhAH4ra49LDp2OBwJ47Afv/bfz2fFEdFhsfTxXACwK4shqFOeyYv2/IVxOZNn
	LZNqGt1Gf8fROXqvgrBlDlThjrvLUi3AyezYvhrTekvArQLMoFegchzBhSFJkRbGhpwGOpsZo1p2c
	Vsu5tWyUK/NIXf3+AsDp3k1Dy4SeBxPFpgoUGOeG7Szy3oHLRAgsoiudO5vbPggdpN6Ek/2gfBTQ2
	flL53jKIGHb9GHKzIQbharD1CpSkYbHuNAuywcbMfa1hgNjHxnaapNxKIjrFGGfL1SnRk5luvKidY
	DTaRu1TIg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kGZVl-0002ZJ-F9; Fri, 11 Sep 2020 03:14:05 +0000
Received: from mail-eopbgr1410139.outbound.protection.outlook.com
 ([40.107.141.139] helo=JPN01-OS2-obe.outbound.protection.outlook.com)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kGZVh-0002YR-AS; Fri, 11 Sep 2020 03:14:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kG6qI43TioB9Tbu+ozM/X8qGQkHC79zfvnDCQGBAQeA9D/uX4QOjOaORA3lbnzE3+Iqqd+V0bJizVRj2Wuh439YejPwWIXh0Z8+wJfFG5RM93NXDaKb/Cs9lTiqX6noBe1QHCOti/gm3IpRx1S9JA30YXwVBhtENERcQobv+j9UjNwHy+aupya8P2T/1r1/MgjRDdWwFZQdTEHH3pdKh40x2mIuqob7VVreWu+0nq7tXunS1071olPJmGXmqYWaccONedwW1utxGabV3O05yHO62VaZFMdQX68JacO2//WqC0S4rU18enmuZZhBsIFpBmL4jQJD/yTmfo0/mGZtigg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pB7BHy/1mgzliqHgPP5zdDFZyAxEvfnPkk+1iMJYVD0=;
 b=W6RPcsnyCc/MJOEM5gtNtqnUp+QD731tSyCw4/qX/KveqU7OZHDwAzN+VMQE+DJNKotWtoYtnKMkyRUm9jYaGMWWyYSDCyITEkJij27tQkv91Db7szHxZsTlv4bzANMJCBeren2nQOQpWP+p+G2escc9eD3W8xpn1lIyDYRWCcJV3S8f8m7VM4TWWTu9Y4Kn/OKn1wWC4waTC9DnU3FT/+65aP9xZ3xTFH0gbTCEnep/+aW56CAXkkX71Tq1Tb1ch+glOKUszJOMGUS+eLcu85A51BD7WxHewhMTPnKactLR5vqVkZiHhqaIfoQwMSRpkaJ10z1dMpEZqFDuPBPwnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pB7BHy/1mgzliqHgPP5zdDFZyAxEvfnPkk+1iMJYVD0=;
 b=ePU1Stb7CoT6mNp8pXrC1EyvLpVtyaX7iA+MnR75ZOT5Aj1A0j5Npr2FFgDOt6TIYvc4to8pWwDasVMV/jJ/HShYtw9BctwQxMe6kQGLreB77tlqJlQUITchFi46lK//VKzVde9bIQONGaHJHhvKv8TDQYsWjjwNPqUXwMMiRqM=
Received: from OSAPR01MB3683.jpnprd01.prod.outlook.com (2603:1096:604:33::12)
 by OSBPR01MB3909.jpnprd01.prod.outlook.com (2603:1096:604:43::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3370.16; Fri, 11 Sep
 2020 03:13:46 +0000
Received: from OSAPR01MB3683.jpnprd01.prod.outlook.com
 ([fe80::1d16:3e99:8fb2:84e1]) by OSAPR01MB3683.jpnprd01.prod.outlook.com
 ([fe80::1d16:3e99:8fb2:84e1%7]) with mapi id 15.20.3370.016; Fri, 11 Sep 2020
 03:13:46 +0000
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>, Daniel Thompson
 <daniel.thompson@linaro.org>
Subject: RE: [PATCH RESEND v3 04/11] usb: xhci-rcar: convert to
 readl_poll_timeout_atomic()
Thread-Topic: [PATCH RESEND v3 04/11] usb: xhci-rcar: convert to
 readl_poll_timeout_atomic()
Thread-Index: AQHWh0vD+aj1y+DFoU+XUmXRM8L6jalh2WYAgADf1oCAAAetsA==
Date: Fri, 11 Sep 2020 03:13:45 +0000
Message-ID: <OSAPR01MB3683CA015AB25BC00D8459EBD8240@OSAPR01MB3683.jpnprd01.prod.outlook.com>
References: <1599726112-4439-1-git-send-email-chunfeng.yun@mediatek.com>
 <1599726112-4439-4-git-send-email-chunfeng.yun@mediatek.com>
 <20200910131212.wm7zskxvcesl652c@holly.lan>
 <1599791601.24609.5.camel@mhfsdcap03>
In-Reply-To: <1599791601.24609.5.camel@mhfsdcap03>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mediatek.com; dkim=none (message not signed)
 header.d=none;mediatek.com; dmarc=none action=none header.from=renesas.com;
x-originating-ip: [240f:60:5f3e:1:64a2:c8a4:9548:6c30]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: b5c3bec9-d82f-4e06-ee6e-08d85600b213
x-ms-traffictypediagnostic: OSBPR01MB3909:
x-microsoft-antispam-prvs: <OSBPR01MB3909BDAA0AF263E1C257D523D8240@OSBPR01MB3909.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: iQmtPB4MpgdIuPTj644/T5Aa8n9RqGWthUO+egrWMDqFyPEYdjDIzXJ5CmnFzIXnqDIehSVmcwHwnZ/UJnOOUaYhcsC1Zoh3OYwl7BZxvljLi2azABqZFIR+wf471ix7QwluDEa2yw7AvzhHCdF8ZJrhmlem2fUwr2l7Ng4IAfTaoVcMDFsO6E2Xtk5A/gZLLO+qM7WAAEWSHlPfFDU4ce0nNA7n422/8ZmTW6Xh9qLKvSUfu5IWF1IyRZM/4hbbUJ7I3+UmDBiVre5I3bvHo+eXMa/urtE+PhVW+FaSYG27Vnlujjje7dlzxhWeMR8A
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OSAPR01MB3683.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(396003)(376002)(39860400002)(366004)(136003)(83380400001)(33656002)(55016002)(7416002)(66476007)(66946007)(66556008)(9686003)(66446008)(76116006)(2906002)(52536014)(110136005)(5660300002)(64756008)(186003)(8936002)(478600001)(7696005)(54906003)(71200400001)(316002)(6506007)(86362001)(8676002)(4326008);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: pqO1nR90lakh8RPa4QNTRUt9e4uMdRw1dAxBhc3ETQSadNGPrpRUA9sJwgjqaBWXQOUYUpgdDFxwlGaCH4pLPSc1DRgI33TGAY0Ep6hCUqzzfG/IZkiHWNmMabIeIxWPYree8NK9mI/CmNHV8awCGmkLdue5MBLh2OImeqbMLAqOxnmi+6PnkvMpfAo84iXEgyzENTzHKISAya7j7MvJ/sv1qlHnAr1V1iPrJuzq++lnOR/2cgGleCBwVplP0OJs/tawE/8Ihj1scQ1vkbKA3ZWb9AoRt6JpxynspnhjHfzoVKOzk6MeShVhSw53rmmXNceKB7XLGxC6imBFb8vdTL4o571/4A8N3DwhPXGcx3zgpzszNxnEVwH52O2u8HG2vNZi/UO4L8PeToY2KCxmlYFM/RJky3fV1hDs/THBHBoflE4yxUh0Ro/tLDKI55J2O8yKpCnxCUTAA2Fmnyye66j1GuKrYdWqDooNwqpyUsn+HcwC7HlRRvDgMnHxX+7Ur3uZwIpQ8jfQe41TAOZCRM+/Pm0y2iq1aPr+hkq5hC2tp0e3I++d3mj26uzrRL4+ve4Ibms/ZDGVhiEfxrf6AEV9wYmMYtKgMV5D6Bg8ur6bgILxsLox8lny4g70M8/klPCOF5GJ4mBCBhg7O3dL03U0fhjShu9QhvqrqKBFgnIPeiaqn6hKXDE/1d11JqyLw9BONnv9ztDzd11GiczCUA==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OSAPR01MB3683.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b5c3bec9-d82f-4e06-ee6e-08d85600b213
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Sep 2020 03:13:45.8765 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kE6QozU8ALAbpJc0k13TgQ90iqcDyssW8SKmuRtCcYhbAs3c0VqAni3BY0I+Osz96WceEho26kKlZ54ZUnvrGSsl7n813aZA3GAnYgGHJO580dAU37HFm/xmrt+z4Hec
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSBPR01MB3909
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200910_231401_375105_DFFD3BC0 
X-CRM114-Status: GOOD (  29.26  )
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
 "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
 Mathias Nyman <mathias.nyman@linux.intel.com>, Arnd Bergmann <arnd@arndb.de>,
 Mathias Nyman <mathias.nyman@intel.com>, Sumit Garg <sumit.garg@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jann Horn <jannh@google.com>,
 Chuhong Yuan <hslester96@gmail.com>, Douglas Anderson <dianders@chromium.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Saurav Girepunje <saurav.girepunje@gmail.com>, Jason Yan <yanaijie@huawei.com>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "Eric W.
 Biederman" <ebiederm@xmission.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 Lee Jones <lee.jones@linaro.org>, Ben Dooks <ben.dooks@codethink.co.uk>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Daniel, Chunfeng,

> From: Chunfeng Yun, Sent: Friday, September 11, 2020 11:33 AM
> 
> On Thu, 2020-09-10 at 14:12 +0100, Daniel Thompson wrote:
> > On Thu, Sep 10, 2020 at 04:21:45PM +0800, Chunfeng Yun wrote:
> > > Use readl_poll_timeout_atomic() to simplify code
> > >
> > > Cc: Mathias Nyman <mathias.nyman@linux.intel.com>
> > > Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> > > Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> > > ---
> > > v2~v3: no changes
> > > ---
> > >  drivers/usb/host/xhci-rcar.c | 43 ++++++++++++-------------------------------
> > >  1 file changed, 12 insertions(+), 31 deletions(-)
> > >
> > > diff --git a/drivers/usb/host/xhci-rcar.c b/drivers/usb/host/xhci-rcar.c
> > > index c1025d3..74f836f 100644
> > > --- a/drivers/usb/host/xhci-rcar.c
> > > +++ b/drivers/usb/host/xhci-rcar.c
> > > @@ -6,6 +6,7 @@
> > >   */
> > >
> > >  #include <linux/firmware.h>
> > > +#include <linux/iopoll.h>
> > >  #include <linux/module.h>
> > >  #include <linux/platform_device.h>
> > >  #include <linux/of.h>
> > > @@ -127,8 +128,7 @@ static int xhci_rcar_download_firmware(struct usb_hcd *hcd)
> > >  	void __iomem *regs = hcd->regs;
> > >  	struct xhci_plat_priv *priv = hcd_to_xhci_priv(hcd);
> > >  	const struct firmware *fw;
> > > -	int retval, index, j, time;
> > > -	int timeout = 10000;
> > > +	int retval, index, j;
> > >  	u32 data, val, temp;
> > >  	u32 quirks = 0;
> > >  	const struct soc_device_attribute *attr;
> > > @@ -166,32 +166,19 @@ static int xhci_rcar_download_firmware(struct usb_hcd *hcd)
> > >  		temp |= RCAR_USB3_DL_CTRL_FW_SET_DATA0;
> > >  		writel(temp, regs + RCAR_USB3_DL_CTRL);
> > >
> > > -		for (time = 0; time < timeout; time++) {
> > > -			val = readl(regs + RCAR_USB3_DL_CTRL);
> > > -			if ((val & RCAR_USB3_DL_CTRL_FW_SET_DATA0) == 0)
> > > -				break;
> > > -			udelay(1);
> > > -		}
> > > -		if (time == timeout) {
> > > -			retval = -ETIMEDOUT;
> > > +		retval = readl_poll_timeout_atomic(regs + RCAR_USB3_DL_CTRL,
> > > +				val, !(val & RCAR_USB3_DL_CTRL_FW_SET_DATA0),
> > > +				1, 10000);
> > > +		if (retval < 0)
> > >  			break;
> > > -		}
> > >  	}
> > >
> > >  	temp = readl(regs + RCAR_USB3_DL_CTRL);
> > >  	temp &= ~RCAR_USB3_DL_CTRL_ENABLE;
> > >  	writel(temp, regs + RCAR_USB3_DL_CTRL);
> > >
> > > -	for (time = 0; time < timeout; time++) {
> > > -		val = readl(regs + RCAR_USB3_DL_CTRL);
> > > -		if (val & RCAR_USB3_DL_CTRL_FW_SUCCESS) {
> > > -			retval = 0;
> > > -			break;
> > > -		}
> > > -		udelay(1);
> > > -	}
> > > -	if (time == timeout)
> > > -		retval = -ETIMEDOUT;
> > > +	retval = readl_poll_timeout_atomic((regs + RCAR_USB3_DL_CTRL),
> > > +			val, (val & RCAR_USB3_DL_CTRL_FW_SUCCESS), 1, 10000);
> >
> > Directly assigning to retval at this point will clobber a previous
> > -ETIMEDOUT error.
> >
> > In other words if there is a timeout waiting for FW_SET_DATA0, but not for
> > DW_SUCCESS, then we will return the wrong return value.

Thank you for your comment! I didn't realized this.

> Yes, agree with you, but seems I keep its original logic unchanged.
> Hi Yoshihiro,
> 
>   What do think about Daniel's suggestion? should I fix it up?

I think you should fix it up like below:

if (readl_poll_timeout_atomic(regs + RCAR_USB3_DL_CTRL,
		val, val & RCAR_USB3_DL_CTRL_FW_SUCCESS, 1, 10000) < 0)
	retval = -ETIMEOUT;	/* Overwrite retval if timeout occurred */

Otherwise, the xhci_rcar_download_firmware() cannot return -ETIMEDOUT if
timeout happened on the previous poll [1].

[1]
+		retval = readl_poll_timeout_atomic(regs + RCAR_USB3_DL_CTRL,
+				val, !(val & RCAR_USB3_DL_CTRL_FW_SET_DATA0),
+				1, 10000);

Best regards,
Yoshihiro Shimoda

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
