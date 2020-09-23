Return-Path: <SRS0=E7TL=DA=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53153C2D0A8
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Sep 2020 08:47:44 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E042D206BE
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Sep 2020 08:47:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="dZC+NaYH";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=renesasgroup.onmicrosoft.com header.i=@renesasgroup.onmicrosoft.com header.b="btaS3d69"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E042D206BE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=renesas.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=NQLZB3Fj/5HtjErDcihFVEwQolqBKbIwGIBBx06OKLg=; b=dZC+NaYHeXbChRwUq4k+eQsJc
	3zX2DevLiQY4Hk8gr2OgWMCsaQNvQkd3rEraAXKbpklHnuDmgNAQgXL0mYieKjQBOabbosJ8jvkJ7
	GJ887A2p/e6bnYeVGXpjRsFU5MyjzWvLxvx9nufZAts9nBSJZ8CaJuosx8NMdPueRi4dI5Ovq13vb
	5G77/L2QdgR75p614ys2m2wnRXTl5rKFqhvEUBX+rC6lSATkd1KgUWn4Lhwa/5DfkC5fvvsrgJdHK
	83R6/06ZmQokfhuTKuCmL4Pxlo6T+b5Z6sF6FLE3uoxfu42mcdlmhsEFcfLrW/SDURMfMqt+Z3t1v
	FbgVTyNjw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kL0R5-00009x-VH; Wed, 23 Sep 2020 08:47:36 +0000
Received: from mail-eopbgr1320133.outbound.protection.outlook.com
 ([40.107.132.133] helo=APC01-PU1-obe.outbound.protection.outlook.com)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kL0Qz-000070-GX; Wed, 23 Sep 2020 08:47:30 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZsvDdBdmwj3a7nB0AZM29q1FxauDIrWZ1a8Te9eWaJeDBiG00pAPtfnLteDYJeZ5r0pv50inSIi+eYXVChllSSl2H//e2PXr3Hk8hGZx7wbMTZnVhgJV+IXH/pF305eXqxdr93Yitc0pVEeuLn//TNQe7vicZSQwsKwMwkF2enC5MZ2wW59GDaPXl+PH1/hJR6khChXBkkoa8t1gr/pkqhNkzNfA003+oUi4LE/7P0JdWyZgQf+lhzLPhS60f+6pn+dTLow5R0gVw0ZoSMRyTkKI7QDBHv4Ba27LdvMoCuXQhpP3ZzJGqo59W0Rd1yuvJnJbwKVFBCr8ww1MLcSTGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8E/4XumCEPkVdnJ2/9Wkdgq+sUFXX/dONAeJdCPrTyM=;
 b=j1gTS75dV6SYKJELyb4nehsyZv+nQSVy4ADPIpkcLJxZOb2turucNd0Cds88WvsT5EFez3cYzAK7BFqSi5tap9cyI3Nbfzc53Gb1WbSchZOyv2dMdjtXVqjnmch1a0nvrI9H2B7/i6TdKYgQbm52cULBWvR8ka/graukpH/r+RJSlI/x9AyrNuMCv62343aQSaQPtmdl6kknuF0GertEjH7YJmHOcF/rRQB1szmduK+StxUKZXnn++uX6sePnFb8bT792rTCsMvz1fAA98NzoJbAOJsZDii3m1z4nf7Edxb6Chi5yNeFFvb+CLziKt2IyXOMLFKayoqCWC5Vu0X/gg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8E/4XumCEPkVdnJ2/9Wkdgq+sUFXX/dONAeJdCPrTyM=;
 b=btaS3d69Ma+UF6ZJfBba8CEOdh/jsHiYPSq2SCYsbz0FLUWxPMwRdKsurj19umoc79PuYFwtO0bI8lYDhCokU9TT0ZbqhwV4JIhMlBNITgiB9sTzGyQ0rDIpiRh6eeEk0Zijk5Uq4et5u4qZWXxJsQq4XO8uBKEzB2vgLQR/WNE=
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com (2603:1096:404:d5::22)
 by TY2PR01MB4506.jpnprd01.prod.outlook.com (2603:1096:404:119::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.11; Wed, 23 Sep
 2020 08:47:14 +0000
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::9055:525d:2d64:b625]) by TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::9055:525d:2d64:b625%5]) with mapi id 15.20.3391.027; Wed, 23 Sep 2020
 08:47:14 +0000
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>
Subject: RE: [PATCH v4 04/11] usb: xhci-rcar: convert to
 readl_poll_timeout_atomic()
Thread-Topic: [PATCH v4 04/11] usb: xhci-rcar: convert to
 readl_poll_timeout_atomic()
Thread-Index: AQHWj97WeuTEVdT9kUKqeRXYZHMso6l16stw
Date: Wed, 23 Sep 2020 08:47:14 +0000
Message-ID: <TY2PR01MB3692184CBB3C12EE8A02BA48D8380@TY2PR01MB3692.jpnprd01.prod.outlook.com>
References: <1600668815-12135-1-git-send-email-chunfeng.yun@mediatek.com>
 <1600668815-12135-4-git-send-email-chunfeng.yun@mediatek.com>
In-Reply-To: <1600668815-12135-4-git-send-email-chunfeng.yun@mediatek.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mediatek.com; dkim=none (message not signed)
 header.d=none;mediatek.com; dmarc=none action=none header.from=renesas.com;
x-originating-ip: [124.210.22.195]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 18b3fa72-7c64-4f94-2254-08d85f9d44f8
x-ms-traffictypediagnostic: TY2PR01MB4506:
x-microsoft-antispam-prvs: <TY2PR01MB45066FFE4117BA5D3D747F4FD8380@TY2PR01MB4506.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: wWpdmCbU7vfEl4OwptWsXKwncwUD0XVZ8JPDhwXEvuKofquo0sIT6NvZfb3LsFqwUv9KshOUxs66jJvxZyaj2H8xaeMosMXJmRo0AziziGDctEJwAV0XKx13rDROw+EwJ/MSuNQTwrHFxzRT/EpQXtxmfZ/mndYs1aAJ7jj+un/xZRhpfqKyfxyFo0/3G85HB98JxnKhtLNo1WFnjfnO/Wx1SezKjD0mu6b75b9VUreddoiVMPk+p9qzMv0+z8FLgzecEIrPJGgjKSXnozYurL6ylsJoLQqCx+gQvDe/UvSiuUYcEWYuQSc4zzJABbVYQXQExPV97hkMOtTHdwJzId/QNRbvBIkoDyJz6JHMJI1i+jBaphfCcamUIAMoW2qt
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TY2PR01MB3692.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(366004)(346002)(376002)(396003)(39860400002)(26005)(52536014)(86362001)(2906002)(6506007)(186003)(7696005)(8936002)(5660300002)(6916009)(8676002)(55236004)(55016002)(9686003)(33656002)(71200400001)(478600001)(54906003)(316002)(7416002)(66556008)(66446008)(4326008)(64756008)(66946007)(76116006)(83380400001)(66476007);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: vhCdG7K9t0Jz8grsOxqpQwdcxmZqZ6gTk4qYmKJY2k55L9DoBRfsru6S1DGvKudCGTGkKN/OSp7DaPw4XGgH79/wzOt+Q0yXvULn5CJVNH2paSnErvakn4RyLsTZTeiBqLQxFheZUOfDY6/dsLFHlRsli2mfozWoxuDKXcAlq5sPb4i3ijlUjXRNtzg70kIDsKH1GPYFK4vtyAQN2mCGBmc/hLsfMoP3clX0BnrPn8ez92A8WnqeqkhRHnbSNv4DF934Pm4urM1EQsKZ4lflgtawlBUm/5/kOXN4xVZ1i5F2M6tc0yDTrFTXoouV9q6OEcu9ELP2zKAQrILaIZPUkNHRwTAHzEQNb6UdVjvqwTjllQ+9Oe3AOEC2Ibv0GWAC9NXTbKr7mLuHYlENuNKpSxlyrC8xeOtdtFX634Fu3PV//ERF1/qLAcDJz6pqCebUzqj1dKyuueHRFi2upszjtg0X2mWTEGHqES1MCfJRnkV292JBTOjF2MoEOsbkTFOBEeSIbcgfujguoxSYKVsMxMv0dLEdeQDcbIsjSVzGs6k77K8Hd/V+gEmel7wnO/6ddCviJY2axw6tv+/a6QO7BTsc6ZC7QFyqGsLxe3w78NY9D9iqfO8kfVezEOXUl1bavovn5n9nGPz7sjZFqYdB1w==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY2PR01MB3692.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 18b3fa72-7c64-4f94-2254-08d85f9d44f8
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Sep 2020 08:47:14.2213 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: n49f2EA9kreUV3Qeb9pOFWVNnsSEgZNg4tncohVzEaW1fn3FHMzyfR/hbzgnsRBNt6FGu1l1xDZ70caTVi/IJ9NPFqY7aQfAF6nyum/KQfYaQSW1U/ublyEbal1TLm0h
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2PR01MB4506
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200923_044729_569167_E8252176 
X-CRM114-Status: GOOD (  20.28  )
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
Cc: Sumit Garg <sumit.garg@linaro.org>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
 Mathias Nyman <mathias.nyman@linux.intel.com>, Arnd Bergmann <arnd@arndb.de>,
 Mathias Nyman <mathias.nyman@intel.com>, Jann Horn <jannh@google.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jason Yan <yanaijie@huawei.com>, Chuhong Yuan <hslester96@gmail.com>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Saurav Girepunje <saurav.girepunje@gmail.com>,
 "Ben Dooks \(Codethink\)" <ben.dooks@codethink.co.uk>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "Eric W. Biederman" <ebiederm@xmission.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Lee Jones <lee.jones@linaro.org>,
 Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 Felipe Balbi <balbi@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Chungeng,

Thank you for the patch!

> From: Chunfeng Yun, Sent: Monday, September 21, 2020 3:13 PM
> 
> Use readl_poll_timeout_atomic() to simplify code
> 
> Cc: Mathias Nyman <mathias.nyman@linux.intel.com>
> Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> ---
> v4: changes
>     1. remove unnecessary parentheses suggested by Yoshihiro
>     2. fix the wrong return value suggested by Yoshihiro & Daniel
> 
> v2~v3: no changes
> ---
>  drivers/usb/host/xhci-rcar.c | 43 ++++++++++++-------------------------------
>  1 file changed, 12 insertions(+), 31 deletions(-)
> 
> diff --git a/drivers/usb/host/xhci-rcar.c b/drivers/usb/host/xhci-rcar.c
> index c1025d3..1bc4fe7 100644
> --- a/drivers/usb/host/xhci-rcar.c
> +++ b/drivers/usb/host/xhci-rcar.c
> @@ -6,6 +6,7 @@
>   */
> 
>  #include <linux/firmware.h>
> +#include <linux/iopoll.h>
>  #include <linux/module.h>
>  #include <linux/platform_device.h>
>  #include <linux/of.h>
> @@ -127,8 +128,7 @@ static int xhci_rcar_download_firmware(struct usb_hcd *hcd)
>  	void __iomem *regs = hcd->regs;
>  	struct xhci_plat_priv *priv = hcd_to_xhci_priv(hcd);
>  	const struct firmware *fw;
> -	int retval, index, j, time;
> -	int timeout = 10000;
> +	int retval, index, j;
>  	u32 data, val, temp;
>  	u32 quirks = 0;
>  	const struct soc_device_attribute *attr;
> @@ -166,32 +166,19 @@ static int xhci_rcar_download_firmware(struct usb_hcd *hcd)
>  		temp |= RCAR_USB3_DL_CTRL_FW_SET_DATA0;
>  		writel(temp, regs + RCAR_USB3_DL_CTRL);
> 
> -		for (time = 0; time < timeout; time++) {
> -			val = readl(regs + RCAR_USB3_DL_CTRL);
> -			if ((val & RCAR_USB3_DL_CTRL_FW_SET_DATA0) == 0)
> -				break;
> -			udelay(1);
> -		}
> -		if (time == timeout) {
> -			retval = -ETIMEDOUT;
> +		retval = readl_poll_timeout_atomic(regs + RCAR_USB3_DL_CTRL,
> +				val, !(val & RCAR_USB3_DL_CTRL_FW_SET_DATA0),
> +				1, 10000);
> +		if (retval < 0)
>  			break;
> -		}
>  	}
> 
>  	temp = readl(regs + RCAR_USB3_DL_CTRL);
>  	temp &= ~RCAR_USB3_DL_CTRL_ENABLE;
>  	writel(temp, regs + RCAR_USB3_DL_CTRL);
> 
> -	for (time = 0; time < timeout; time++) {
> -		val = readl(regs + RCAR_USB3_DL_CTRL);
> -		if (val & RCAR_USB3_DL_CTRL_FW_SUCCESS) {
> -			retval = 0;
> -			break;
> -		}
> -		udelay(1);
> -	}
> -	if (time == timeout)
> -		retval = -ETIMEDOUT;
> +	retval = readl_poll_timeout_atomic((regs + RCAR_USB3_DL_CTRL),

We can also remove these unnecessary parentheses like below.

+	retval = readl_poll_timeout_atomic(regs + RCAR_USB3_DL_CTRL,

After fixed this:

Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Best regards,
Yoshihiro Shimoda


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
