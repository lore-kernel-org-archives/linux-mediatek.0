Return-Path: <SRS0=yNvG=CT=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37460C43461
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Sep 2020 12:56:48 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CA77E206D4
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Sep 2020 12:56:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="1pnNfMix";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=renesasgroup.onmicrosoft.com header.i=@renesasgroup.onmicrosoft.com header.b="fuWtlize"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CA77E206D4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=renesas.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=6lFzwy6HY4IcfTesal4npGo+aGoz73YrHdVtgBGWA3Q=; b=1pnNfMixyhWLVYV17PgPqD6+n
	e96pWPaWns59R5aKZUl1HEhwxtrM0QPk2fYX83wLg3cjIxGVtH9MB5w8dbEwAsddSV37lAYM4sYYK
	xZQ0z39ve8YbWqcmUOyLqmKnLX+fB8w1mkboBaWXJdX5xzlxFg9EE1D9Doq4asYNevUnMXIIpizA5
	Gs6tb0YsYYJBHGL/cBZzk9W4x3uJYjloqi1BUaAz5YlyBp+w3nxyiLaVLkknXK0PclFn9qTy4Xr79
	/cGcJq53E9WYKnStTZ4qUxB7hBZiJvm4oK1DQWo8CYHdz4J5Q/LDWWrZglZKNdYQfCgepls6mKgz1
	DukUFnPUw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kGM7y-00089G-C8; Thu, 10 Sep 2020 12:56:38 +0000
Received: from mail-eopbgr1410101.outbound.protection.outlook.com
 ([40.107.141.101] helo=JPN01-OS2-obe.outbound.protection.outlook.com)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kGM7t-00087Q-Cj; Thu, 10 Sep 2020 12:56:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NiJzO79xoMcP2uhSfDzleit9hMHLcrmEbj/2kZhpR92Ou+blL5mV/1RjmQ6HFloZ0XNr4xP5EhFIjseE5VhyXZockdNHk5+061nvXK0rUeb1dUtH4TxOvs3sFC6a/gCDjTMfhPAm1K6SuDi7exorHbVia7K04hEtma/Bg/69JLuVC/kPAfCAT5uPHJoHGZ08SH1m47Uwls9oRmhQV0dtszw5Py/mSUU2Vq1N+cSNp+wJMnIRnt5eyutjpJClmQ06abiNSEeUtccqJk9PJVvjaKNX1hTVAq2v0+X8uTtvN9FiR2VSWm16U/0p98uuZFUD7Vj1KkNhDIePKV+4vA4AFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HJZ3Srsu94pbCuY9WWrkaLbtXPLvw4G/ciPj90FSSs4=;
 b=TGpe9Hg63WsujvUbgXnT52ucW4ORrmkdZKdPSSODNSJmgxjbMVT0xccQuOU4KoRubTn6K5SzOnnz2lj2aZiThCRFq+yjxsouXcKkbF4xltrgK5nOrQFuxGNWISYTk8u9oFyH6+G2pErx+Oxr7o7KeBd3S+MgJvtzAMVHohyqgdFZKCX5jpd2xKZvHIh2Y6vnZ8aVTIR1oVWBJ3tE1Nw14JVM/UdvWRwnGXTMmvNJ/dLLQSyqBBBebXNJ5c1BchtppoSlpMMATuU9pK2UCUw9w559id5tbW2nE+1mH3P0BUKObUZY/fv0+Ao8NfTEIF/Y22F0D0BCqkUq3Yf+/CvtDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HJZ3Srsu94pbCuY9WWrkaLbtXPLvw4G/ciPj90FSSs4=;
 b=fuWtlizePv+qhE2bDzOlg9WgEKYOwJlWA+Xg/arRVRWv00SwDtZTRLRPurUib066dx30kbO1L4I4BsdbLEO//pDWirTs3tN3lo/LVSq9VQ3VMpIT6ARKs8uHjmBXfEhqqzKssL/nuMufgX8LrpeeLVqeD02lzrF/cxRHLahnxwM=
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com (2603:1096:404:d5::22)
 by TYAPR01MB1902.jpnprd01.prod.outlook.com (2603:1096:404:7::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3348.17; Thu, 10 Sep
 2020 12:56:24 +0000
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::9055:525d:2d64:b625]) by TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::9055:525d:2d64:b625%5]) with mapi id 15.20.3348.019; Thu, 10 Sep 2020
 12:56:24 +0000
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>
Subject: RE: [PATCH RESEND v3 04/11] usb: xhci-rcar: convert to
 readl_poll_timeout_atomic()
Thread-Topic: [PATCH RESEND v3 04/11] usb: xhci-rcar: convert to
 readl_poll_timeout_atomic()
Thread-Index: AQHWh0vD+aj1y+DFoU+XUmXRM8L6jalh0rag
Date: Thu, 10 Sep 2020 12:56:23 +0000
Message-ID: <TY2PR01MB369214103C701DC5E78D56F9D8270@TY2PR01MB3692.jpnprd01.prod.outlook.com>
References: <1599726112-4439-1-git-send-email-chunfeng.yun@mediatek.com>
 <1599726112-4439-4-git-send-email-chunfeng.yun@mediatek.com>
In-Reply-To: <1599726112-4439-4-git-send-email-chunfeng.yun@mediatek.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mediatek.com; dkim=none (message not signed)
 header.d=none;mediatek.com; dmarc=none action=none header.from=renesas.com;
x-originating-ip: [240f:60:5f3e:1:29e4:1562:227f:bbc3]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 97121736-22b4-4c6b-4841-08d85588ec56
x-ms-traffictypediagnostic: TYAPR01MB1902:
x-microsoft-antispam-prvs: <TYAPR01MB1902D95347D2B525BD8F2F2BD8270@TYAPR01MB1902.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: nomcnc0c2r0sVRlCOQpQW5zIl5NNFwfxCQotKKfzLk0fbyitIj3Vy3To5zQ6eo522QuV8ewWbyXkBMPuw1tfNmsfJweYoFAdvinE0NDtrBVQmRg95JONbZrWGvhqEf/6P/MOVs5Jn2tAHh7YjcB4WWDLvpi4sB5FpkkBQKicJQI7VCoG6HhMu1rM4j9H4XBrU1Yx8KR17Xu+BEqRYv8r3o3+Fj8o4tYfI6CYt6Umy2OFjmJxXWKwa/Iu5UI+qM6+tItaNVT1f38csDMAhvs5XnIq8crCexR8ItAgzwiBKbrStSEkhKjFabu78XYyvSIlyHVO5U5D7Zlu5BXLm9YDTRZ2ml6XfjPS3Pt+KNH027EyOui8zwNZ65G3Z/D3yvPV
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TY2PR01MB3692.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(66446008)(5660300002)(83380400001)(33656002)(66946007)(66476007)(64756008)(7696005)(76116006)(55016002)(52536014)(2906002)(66556008)(9686003)(186003)(110136005)(498600001)(8676002)(86362001)(8936002)(4326008)(54906003)(6506007)(7416002)(71200400001)(309714004);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: WldI93QEqaTIN2pBENPyuG2f6YBAgADnTkydEYMosGh67anr2x1r60aNnQk55ncKs+ZA74HJyt2m9hmuVlOs9tvxQIoM5O9uQKe9ETDaYE/IpkFX+PnOyRIr1iFuFj83YeXcfLcsb+rfO+oA/n94gNRgU4czow3F6Gx4CQsaajgTXWPSUFYxj4yNhOIL8maH0YjkR32ZtDo8ZcD9N36JaI+5Bk7Bp3+Zgm438Vx5nHk0YtbFDrFvhyl9Og/ZLZgLvoADkBflgYTik+S7bjP32F7meHFi+o6r9WzI5edTDcMfO1RbXgqqqdsxlI/1xbhZm1ha+ieAUiN/r15UFmtRw1rpKxtuTYVv5mFsxpxLo9hFYw1A/Ws+Sz3egQVOxLrL34dkkkk/0H/AYfRdn+423s/T0j1MO9i4u5MJu9DnlhIoUzJ/mpGFOQ+I8Wx0tbwOgnqiyBQQo6mIhYtAR6BvVZYX4OW9yv6xalfTe+5Y45yq8wG0xOo0GedcgNTgUJBjDKRefTLPKDYmbIgiWtC3KKJUxKG+9tEr+Pf6SgLP+62x07oTx++5zwHX0qL0C2B6IX6756csCXYofojSo7wTL2rgNOOrbKMv8W9fkrLCUyhXFiN2ZH2Jru5X7SiCmiyQMg+R5eCuatKMmb1uVr5lVEI/nc/ASs4TcZDbXnooEp/EzkiYhLV7kUcbhD09dLeZnpVoAkS7DtiJXkLyD8U+NQ==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY2PR01MB3692.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 97121736-22b4-4c6b-4841-08d85588ec56
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Sep 2020 12:56:23.9837 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3DkmQ8FZzvna8lDokA2U5YlBawPGnov6Y2DitNPz+NOVFB6B0H1UQNl6c+yOjNyKMpoXTPzhBlpvlhqQ0DTIJKnFIj6O3IfKynhTg9ScXJP6KQx1LCFMiJ8IO1QsqMJK
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB1902
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200910_085633_538810_7B976F77 
X-CRM114-Status: GOOD (  20.47  )
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
Cc: Felipe Balbi <balbi@kernel.org>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
 Mathias Nyman <mathias.nyman@linux.intel.com>, Arnd Bergmann <arnd@arndb.de>,
 Mathias Nyman <mathias.nyman@intel.com>, Sumit Garg <sumit.garg@linaro.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Jann Horn <jannh@google.com>, Chuhong Yuan <hslester96@gmail.com>,
 Douglas Anderson <dianders@chromium.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Saurav Girepunje <saurav.girepunje@gmail.com>, Jason Yan <yanaijie@huawei.com>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "Eric W. Biederman" <ebiederm@xmission.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Lee Jones <lee.jones@linaro.org>,
 Ben Dooks <ben.dooks@codethink.co.uk>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Chunfeng,

Thank you for the patch!

> From: Chunfeng Yun, Sent: Thursday, September 10, 2020 5:22 PM
> 
> Use readl_poll_timeout_atomic() to simplify code
> 
> Cc: Mathias Nyman <mathias.nyman@linux.intel.com>
> Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> ---
> v2~v3: no changes
> ---
>  drivers/usb/host/xhci-rcar.c | 43 ++++++++++++-------------------------------
>  1 file changed, 12 insertions(+), 31 deletions(-)
> 
> diff --git a/drivers/usb/host/xhci-rcar.c b/drivers/usb/host/xhci-rcar.c
> index c1025d3..74f836f 100644
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
> +			val, (val & RCAR_USB3_DL_CTRL_FW_SUCCESS), 1, 10000);

Some parentheses are not needed like below:

	retval = readl_poll_timeout_atomic(regs + RCAR_USB3_DL_CTRL,
			val, val & RCAR_USB3_DL_CTRL_FW_SUCCESS, 1, 10000);


>  	release_firmware(fw);
> 
> @@ -200,18 +187,12 @@ static int xhci_rcar_download_firmware(struct usb_hcd *hcd)
> 
>  static bool xhci_rcar_wait_for_pll_active(struct usb_hcd *hcd)
>  {
> -	int timeout = 1000;
> +	int retval;
>  	u32 val, mask = RCAR_USB3_AXH_STA_PLL_ACTIVE_MASK;
> 
> -	while (timeout > 0) {
> -		val = readl(hcd->regs + RCAR_USB3_AXH_STA);
> -		if ((val & mask) == mask)
> -			return true;
> -		udelay(1);
> -		timeout--;
> -	}
> -
> -	return false;
> +	retval = readl_poll_timeout_atomic(hcd->regs + RCAR_USB3_AXH_STA,
> +			val, ((val & mask) == mask), 1, 1000);

Likewise above:
	retval = readl_poll_timeout_atomic(hcd->regs + RCAR_USB3_AXH_STA,
			val, (val & mask) == mask, 1, 1000);

> +	return !!retval;

This breaks the code. If I changed this to "return retval < 0 ? false : true;",
it works again.

Best regards,
Yoshihiro Shimoda


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
