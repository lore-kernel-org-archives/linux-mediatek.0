Return-Path: <SRS0=cvih=CU=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DAFACC43461
	for <linux-mediatek@archiver.kernel.org>; Fri, 11 Sep 2020 09:58:59 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 78A0B2078B
	for <linux-mediatek@archiver.kernel.org>; Fri, 11 Sep 2020 09:58:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="B2NU//fh";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=renesasgroup.onmicrosoft.com header.i=@renesasgroup.onmicrosoft.com header.b="IKXXq1Ot"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 78A0B2078B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=renesas.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=oxSY0cQS5BLqSZL6KsAjCUHDdmhCnCv+rDmP4K8ql5I=; b=B2NU//fhUQsTBkrz3eFG0Jp4L
	CpAD6GzJppTlGw7qzsfzmQoE2zSbhnx8eRIdjuL6PLfSzuhWx8GCnBs/iQoXAjMxLqflYRM3Q5WqR
	CmF5NeOfbotKl1iDfPgOVtDIfJ1EvqwAwJThZcSkKqsDMvt+C2JYSItGovBoX8+4dXaDIvYFYKtkS
	yg3YCCnHKE0vN2TrCjBbSiug1z3TVyjQqw0tqUWDYVfIl+HOKCdZbPRnQGKpLUWIVwVFqoq8PENll
	f3lSQzLfb8h3ZMP674ejHPqQ6RgXlG6gk0b+jJc9tqLQS6h00/eO3CZiPJGLgKzv4MxvsGA3DzjIG
	Rw6L0TLYA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kGfpP-0000MK-71; Fri, 11 Sep 2020 09:58:47 +0000
Received: from mail-eopbgr1400091.outbound.protection.outlook.com
 ([40.107.140.91] helo=JPN01-TY1-obe.outbound.protection.outlook.com)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kGfpM-0000LX-42; Fri, 11 Sep 2020 09:58:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dio21IkHbh9BvcypJcTRato4iP/bOrs6JiBO6BrnoqNBM6VSAxGqoJbgoTzokueHSikQCxZUi9ZO5VmUd+ulkF0Ni+tY6PrtnJpkRzy7Wztg4WG38W0+N3Z/SusjynMPo1NvIGirdljimcctSFpI8zx/vDWQRYSGCTa7YNnXDFlm7bqIuxB/l4T+azW0FlvuJy3jvF6mrDOxbvZlbGwfJGyPz58ozGLmAPaXDfiD4YqFY752RXHBgVZU9jTrwtZYSv6kgQG+Gthv4lsZvImGoGQfXofrNO70A8xWklhBOemmgY+6ziKM7aDaDkZGmjD35OkF/iFP6FASbUd7Sm7p3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dMPGtq+HXBluf1cz/cUfs13JZB+FdmZtg++iX7nVrmg=;
 b=B/ePlAXY17NG41pnj8rCowwQJIE4GrywTGv+IvbO4JPiZJ7BwqktGyaD+OGuTB2Mh5gh9bi991IkOiVEwJue4psaur9legJkRQ/KwbebS3FqP/trc8Kb9jENB4i7rvhk8dktsFaxm5v7r28ID0Sun64gJKR9vJe+qUZlptqY/lqMcsXkUFM4g6M+O8TPUStanz85xZZa3qvtJ5GfOQr5gHPlhHoJANfUBbYSLF0sfWKSTZy2eRfKtMLlJkM2HDCr+OG+u5FMuBx8o4F0HuydZAvrM33MEfwJBjRuuKm3ZjRp5Sm93KRsH4Qj5V3SBSyrxkoHo/J4XTcf9XrtavRiLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dMPGtq+HXBluf1cz/cUfs13JZB+FdmZtg++iX7nVrmg=;
 b=IKXXq1OtHfYbJKejpVk+Jcw6DNJPh+idJEva9osSZrFl2ljXd1B2hFYHa60sBxWU7gUBkogpricHQW7KTfkKMUCrCvQ1jQKamhDOoSOk1CLVGj3lM9jVR7cASg3zjh0ODzH9igQHJOc8X3fc5j8GnmhoWg30WTSuqaLbAmEkEBs=
Received: from OSAPR01MB3683.jpnprd01.prod.outlook.com (2603:1096:604:33::12)
 by OSYPR01MB5496.jpnprd01.prod.outlook.com (2603:1096:604:85::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3370.16; Fri, 11 Sep
 2020 09:58:41 +0000
Received: from OSAPR01MB3683.jpnprd01.prod.outlook.com
 ([fe80::1d16:3e99:8fb2:84e1]) by OSAPR01MB3683.jpnprd01.prod.outlook.com
 ([fe80::1d16:3e99:8fb2:84e1%7]) with mapi id 15.20.3370.016; Fri, 11 Sep 2020
 09:58:40 +0000
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: Daniel Thompson <daniel.thompson@linaro.org>, Chunfeng Yun
 <chunfeng.yun@mediatek.com>
Subject: RE: [PATCH RESEND v3 04/11] usb: xhci-rcar: convert to
 readl_poll_timeout_atomic()
Thread-Topic: [PATCH RESEND v3 04/11] usb: xhci-rcar: convert to
 readl_poll_timeout_atomic()
Thread-Index: AQHWh0vD+aj1y+DFoU+XUmXRM8L6jalh2WYAgADf1oCAAGTdgIAADtAAgAAGCoCAAAIyUA==
Date: Fri, 11 Sep 2020 09:58:40 +0000
Message-ID: <OSAPR01MB368397F8766F38E84015E538D8240@OSAPR01MB3683.jpnprd01.prod.outlook.com>
References: <1599726112-4439-1-git-send-email-chunfeng.yun@mediatek.com>
 <1599726112-4439-4-git-send-email-chunfeng.yun@mediatek.com>
 <20200910131212.wm7zskxvcesl652c@holly.lan>
 <1599791601.24609.5.camel@mhfsdcap03>
 <20200911083421.g5cidlnwfiksggvk@holly.lan>
 <1599816442.29909.10.camel@mhfsdcap03>
 <20200911094859.tk2jlcjbolsrkeeh@holly.lan>
In-Reply-To: <20200911094859.tk2jlcjbolsrkeeh@holly.lan>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=renesas.com;
x-originating-ip: [240f:60:5f3e:1:64a2:c8a4:9548:6c30]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: ebd9a060-57e8-4105-bd3e-08d8563942f5
x-ms-traffictypediagnostic: OSYPR01MB5496:
x-microsoft-antispam-prvs: <OSYPR01MB5496DC23F37F911E18A7ED8CD8240@OSYPR01MB5496.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3276;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 0fwWIaUh9CMrpinbgRqRffEnc6H0HgkgqGR251c0aeB6EzCeJ0Pn+VZSQn1FMNcI5uhMF625wV+XRSezs5y+aggNjH3mg7uudfe1rmfG9nT1RMBipUqCgxnspM6z+uJDqWIMEQH7KqbX9W9lwYPW46VJODez2k6dcyhWnh1joY0gu8qaG7SBnlNsnAujEIoibqbGHHmuazCkAjllc1mL2g316E+T4STjVrNCGdMWD9Kv6wblZdiiAEdjgAtQ0ZCNflf+Z/No7wIfPFV4HQ2F6ANSp3hM/GODuQCxFzBCe1At9u/plIURAMfJ9RiFW8rS
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OSAPR01MB3683.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(39860400002)(136003)(346002)(396003)(366004)(6506007)(8936002)(9686003)(5660300002)(478600001)(52536014)(33656002)(55016002)(7696005)(186003)(76116006)(4326008)(66946007)(316002)(66446008)(110136005)(66476007)(66556008)(64756008)(54906003)(2906002)(7416002)(71200400001)(86362001)(83380400001)(8676002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: u9SPFKcpbeorZMC4agSO9y5yDKuZ+ExdO0PY36J+0XExUxOQcwsiSxvnfzueuPJ9rKrjsu63sKlzxo6OXeqHgdB8l5D+jdZ2zEKopWMRnJrYJWWde4MD/6gfvjdi8LRNP63JZQPghQyQ1cPtpz4cTnrDvUspOkdXVo0J8k7wrMXwPwSLgeQOh9zYSa5WiNRqQnr3jelD2KqeF/zu9UFbzAp9hNTaUQ0zWWi2WqIBIWxlgrTtumeSwVKCIeensJ3U8nvmU9jql2WyHgfTi+eNeB6eu9g4JXhalN5NZmFKMO6bcQbDBpy6rrdLo4nVkz53juFaYYhhrTpXPShEmRHmf76Z5KGZXxmEAEa92vgx232XQWUyWzlRJ6I+iETs/tnNfedmZ95EVVfKX0Dh2PTSlYW+g1xqE+EqyBgfcUSANE783FWb6g1m34XhFPP+HGr4sFw+bY42vOp8tDGYQW+3nx7g6O81GjAXJwMETh7q9LYpTIqlZoWMSxmpSmcBnMvSrAAJU4b5Lpx4kPStdS1/WtJkcNcLFSK8vbraCY+n2/4TfTVNJr2qy4T6EPgGHrQ+HeX2CA9qu13Xt7yh17BTcztNaPgw/lWtseCM+fHRW6Z3KIsfa/ktMgbEYQKnLE+Fi5NSnl7iqtq614c4oOZhK3vEmLqB2aqgm2jegfEhQRp20ziy5ViDFSYvzPbdQ3fI+gEvViDOaC8FvLtuMk5jUA==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OSAPR01MB3683.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ebd9a060-57e8-4105-bd3e-08d8563942f5
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Sep 2020 09:58:40.7551 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: C8El41Ovg2pxlKetsojHkU5QBAHA4j3n0y13WWREjcanDR2mg1PcbFyTbspesVSjWLp9iB+OMT+Fa5dIEXhUAF/aN/SHtk/zsi1Su8mFfFxqIg1V46tQbNplg6DDUvnB
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSYPR01MB5496
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200911_055844_166071_A3A80A27 
X-CRM114-Status: GOOD (  24.73  )
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

Hi Chunfeng,

> From: Daniel Thompson, Sent: Friday, September 11, 2020 6:49 PM
> 
> On Fri, Sep 11, 2020 at 05:27:22PM +0800, Chunfeng Yun wrote:
> > On Fri, 2020-09-11 at 09:34 +0100, Daniel Thompson wrote:
> > > On Fri, Sep 11, 2020 at 10:33:21AM +0800, Chunfeng Yun wrote:
> > > > On Thu, 2020-09-10 at 14:12 +0100, Daniel Thompson wrote:
> > > > > On Thu, Sep 10, 2020 at 04:21:45PM +0800, Chunfeng Yun wrote:
> > > > > > Use readl_poll_timeout_atomic() to simplify code
> > > > > >
> > > > > > Cc: Mathias Nyman <mathias.nyman@linux.intel.com>
> > > > > > Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> > > > > > Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> > > > > > ---
> > > > > > v2~v3: no changes
> > > > > > ---
> > > > > >  drivers/usb/host/xhci-rcar.c | 43 ++++++++++++-------------------------------
> > > > > >  1 file changed, 12 insertions(+), 31 deletions(-)
> > > > > >
> > > > > > diff --git a/drivers/usb/host/xhci-rcar.c b/drivers/usb/host/xhci-rcar.c
> > > > > > index c1025d3..74f836f 100644
> > > > > > --- a/drivers/usb/host/xhci-rcar.c
> > > > > > +++ b/drivers/usb/host/xhci-rcar.c
> > > > > > @@ -6,6 +6,7 @@
> > > > > >   */
> > > > > >
> > > > > >  #include <linux/firmware.h>
> > > > > > +#include <linux/iopoll.h>
> > > > > >  #include <linux/module.h>
> > > > > >  #include <linux/platform_device.h>
> > > > > >  #include <linux/of.h>
> > > > > > @@ -127,8 +128,7 @@ static int xhci_rcar_download_firmware(struct usb_hcd *hcd)
> > > > > >  	void __iomem *regs = hcd->regs;
> > > > > >  	struct xhci_plat_priv *priv = hcd_to_xhci_priv(hcd);
> > > > > >  	const struct firmware *fw;
> > > > > > -	int retval, index, j, time;
> > > > > > -	int timeout = 10000;
> > > > > > +	int retval, index, j;
> > > > > >  	u32 data, val, temp;
> > > > > >  	u32 quirks = 0;
> > > > > >  	const struct soc_device_attribute *attr;
> > > > > > @@ -166,32 +166,19 @@ static int xhci_rcar_download_firmware(struct usb_hcd *hcd)
> > > > > >  		temp |= RCAR_USB3_DL_CTRL_FW_SET_DATA0;
> > > > > >  		writel(temp, regs + RCAR_USB3_DL_CTRL);
> > > > > >
> > > > > > -		for (time = 0; time < timeout; time++) {
> > > > > > -			val = readl(regs + RCAR_USB3_DL_CTRL);
> > > > > > -			if ((val & RCAR_USB3_DL_CTRL_FW_SET_DATA0) == 0)
> > > > > > -				break;
> > > > > > -			udelay(1);
> > > > > > -		}
> > > > > > -		if (time == timeout) {
> > > > > > -			retval = -ETIMEDOUT;
> > > > > > +		retval = readl_poll_timeout_atomic(regs + RCAR_USB3_DL_CTRL,
> > > > > > +				val, !(val & RCAR_USB3_DL_CTRL_FW_SET_DATA0),
> > > > > > +				1, 10000);
> > > > > > +		if (retval < 0)
> > > > > >  			break;
> > > > > > -		}
> > > > > >  	}
> > > > > >
> > > > > >  	temp = readl(regs + RCAR_USB3_DL_CTRL);
> > > > > >  	temp &= ~RCAR_USB3_DL_CTRL_ENABLE;
> > > > > >  	writel(temp, regs + RCAR_USB3_DL_CTRL);
> > > > > >
> > > > > > -	for (time = 0; time < timeout; time++) {
> > > > > > -		val = readl(regs + RCAR_USB3_DL_CTRL);
> > > > > > -		if (val & RCAR_USB3_DL_CTRL_FW_SUCCESS) {
> > > > > > -			retval = 0;
> > Here will set it 0 too
> 
> Doh...
> 
> Thanks.

Ah, now I also understood your patch was logically unchanged.
Thanks!

Best regards,
Yoshihiro Shimoda


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
