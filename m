Return-Path: <SRS0=Odcq=HK=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44ED2C433DB
	for <linux-mediatek@archiver.kernel.org>; Mon,  8 Feb 2021 11:42:04 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C1AD664E40
	for <linux-mediatek@archiver.kernel.org>; Mon,  8 Feb 2021 11:42:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C1AD664E40
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Qc0iuH30RwqvhMoDsAuuDQf9ThZ3Q6QSiK5L8jyN7kU=; b=Obo4rTvSp2oakwOBxatm6Ir1i
	v2rmGbHEDDwWjmrcOOkq1RXFyYElOKYk3WZDssUciApUdGyoKCeQuMKCUjk58flSJT61d2YH4vcQg
	2oTGJAlF5sFOE4GKTw4UGcMRmUZOfkvW3lY1YR8+9IT+U5uubOl/Nu6Amm053nXDgohi65p4E6OWE
	vKvk+5Df6DSGZvqZ0fIc1WBc9elcxyN1D/DAV4C7i9WIWpdBnV8OYfCCw0pvOsDBg7OwNuqs8ssNt
	BDltQ95+B0ZYf8XhuIEse3AEh/b+wHl5Ef4BiLyLEZSn74ea9L+AVfQv/m2v31Ip6erWmj7g2fcXo
	FR0MIC3zg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l94vQ-0001ye-T2; Mon, 08 Feb 2021 11:41:52 +0000
Received: from mga18.intel.com ([134.134.136.126])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l94vM-0001xT-UH; Mon, 08 Feb 2021 11:41:50 +0000
IronPort-SDR: BLE7NGbv7odPYE/tPSc6qgCAWslQgGhfhxG44QRPORRDcysHGPPqNQEP17XFF2pFiBxNfuQ3rY
 qri/sWZ74sYQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9888"; a="169380626"
X-IronPort-AV: E=Sophos;i="5.81,161,1610438400"; d="scan'208";a="169380626"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2021 03:41:43 -0800
IronPort-SDR: hm2VhsVrfb6wUBli739/bQvu86h2o8qp+XumRxBax8AuuH9k0dVSKC5/bI/9799JLrzMDHBAHx
 68YTYmlSsf/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,161,1610438400"; d="scan'208";a="487380374"
Received: from mattu-haswell.fi.intel.com (HELO [10.237.72.170])
 ([10.237.72.170])
 by fmsmga001.fm.intel.com with ESMTP; 08 Feb 2021 03:41:40 -0800
Subject: Re: [RFC PATCH v2 2/3] usb: xhci-mtk: modify the SOF/ITP interval for
 mt8195
To: Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Mathias Nyman <mathias.nyman@intel.com>
References: <20210203102642.7353-1-chunfeng.yun@mediatek.com>
 <20210203102642.7353-2-chunfeng.yun@mediatek.com>
 <1612664833.5147.30.camel@mhfsdcap03>
From: Mathias Nyman <mathias.nyman@linux.intel.com>
Autocrypt: addr=mathias.nyman@linux.intel.com; prefer-encrypt=mutual; keydata=
 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 fiD/
Message-ID: <c0a65a3b-aec9-e27e-9110-9713596b9ecd@linux.intel.com>
Date: Mon, 8 Feb 2021 13:43:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1612664833.5147.30.camel@mhfsdcap03>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210208_064149_241336_F3336A38 
X-CRM114-Status: GOOD (  22.95  )
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
Cc: devicetree@vger.kernel.org, Nicolas Boichat <drinkcat@chromium.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 Ikjoon Jang <ikjn@chromium.org>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 7.2.2021 4.27, Chunfeng Yun wrote:
> Hi Mathias,
> 
> On Wed, 2021-02-03 at 18:26 +0800, Chunfeng Yun wrote:
>> There are 4 USB controllers on MT8195, the controllers (IP1~IP3,
>> exclude IP0) have a wrong default SOF/ITP interval which is
>> calculated from the frame counter clock 24Mhz by default, but
>> in fact, the frame counter clock is 48Mhz, so we should set
>> the accurate interval according to 48Mhz for those controllers.
>> Note: the first controller no need set it.
>>
>> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
>> ---
>> v2: fix typo of comaptible
>> ---
>>  drivers/usb/host/xhci-mtk.c | 63 +++++++++++++++++++++++++++++++++++++
>>  1 file changed, 63 insertions(+)
>>
>> diff --git a/drivers/usb/host/xhci-mtk.c b/drivers/usb/host/xhci-mtk.c
>> index 8f321f39ab96..0a68c4ac8b48 100644
>> --- a/drivers/usb/host/xhci-mtk.c
>> +++ b/drivers/usb/host/xhci-mtk.c
>> @@ -68,11 +68,71 @@
>>  #define SSC_IP_SLEEP_EN	BIT(4)
>>  #define SSC_SPM_INT_EN		BIT(1)
>>  
> Can I Read/Write the following xHCI controller's registers  in
> xhci-mtk.c?
> 
> Ideally, xhci-mtk.c should not access them, because xhci-mtk is only a
> glue driver used to initialize clocks/power and IPPC registers which
> don't belong to xHCI controller.
> 

These *_EOF registers look like they are Mediatek vendor specific registers
and not part of public xHCI register-level spec. 
So I think accessing them from xhci-mtk.c makes sense.

If those register offsets are hardcoded like this in the Mediatek spec then
this is fine, but if those offsets are found from a vendor specific xHCI
extended capability entry (see xhci spec section 7) then we should dig them out
from there. 
>> +/* xHCI csr */
>> +#define LS_EOF			0x930
>> +#define LS_EOF_OFFSET		0x89
>> +
>> +#define FS_EOF			0x934
>> +#define FS_EOF_OFFSET		0x2e
>> +
>> +#define SS_GEN1_EOF		0x93c
>> +#define SS_GEN1_EOF_OFFSET	0x78
>> +
>> +#define HFCNTR_CFG		0x944
>> +#define ITP_DELTA_CLK		(0xa << 1)
>> +#define ITP_DELTA_CLK_MASK	GENMASK(5, 1)
>> +#define FRMCNT_LEV1_RANG	(0x12b << 8)
>> +#define FRMCNT_LEV1_RANG_MASK	GENMASK(19, 8)
>> +
>> +#define SS_GEN2_EOF		0x990
>> +#define SS_GEN2_EOF_OFFSET	0x3c
>> +#define EOF_OFFSET_MASK		GENMASK(11, 0)
>> +
>>  enum ssusb_uwk_vers {
>>  	SSUSB_UWK_V1 = 1,
>>  	SSUSB_UWK_V2,
>>  };
>>  
>> +/*
>> + * MT8195 has 4 controllers, the controller1~3's default SOF/ITP interval
>> + * is calculated from the frame counter clock 24M, but in fact, the clock
>> + * is 48M, so need change the interval.
>> + */
>> +static void xhci_mtk_set_frame_interval(struct xhci_hcd_mtk *mtk)
>> +{
>> +	struct device *dev = mtk->dev;
>> +	struct usb_hcd *hcd = mtk->hcd;
>> +	u32 value;
>> +
>> +	if (!of_device_is_compatible(dev->of_node, "mediatek,mt8195-xhci"))
>> +		return;
>> +
>> +	value = readl(hcd->regs + HFCNTR_CFG);
>> +	value &= ~(ITP_DELTA_CLK_MASK | FRMCNT_LEV1_RANG_MASK);
>> +	value |= (ITP_DELTA_CLK | FRMCNT_LEV1_RANG);
>> +	writel(value, hcd->regs + HFCNTR_CFG);
>> +
>> +	value = readl(hcd->regs + LS_EOF);
>> +	value &= ~EOF_OFFSET_MASK;
>> +	value |= LS_EOF_OFFSET;
>> +	writel(value, hcd->regs + LS_EOF);
>> +
>> +	value = readl(hcd->regs + FS_EOF);
>> +	value &= ~EOF_OFFSET_MASK;
>> +	value |= FS_EOF_OFFSET;
>> +	writel(value, hcd->regs + FS_EOF);
>> +
>> +	value = readl(hcd->regs + SS_GEN1_EOF);
>> +	value &= ~EOF_OFFSET_MASK;
>> +	value |= SS_GEN1_EOF_OFFSET;
>> +	writel(value, hcd->regs + SS_GEN1_EOF);
>> +
>> +	value = readl(hcd->regs + SS_GEN2_EOF);
>> +	value &= ~EOF_OFFSET_MASK;
>> +	value |= SS_GEN2_EOF_OFFSET;
>> +	writel(value, hcd->regs + SS_GEN2_EOF);

Minor nit about names,
Register offsets from MMIO start are named *_EOF while clock multipliers? are named *_EOF_OFFSET.
This was a bit confusing

Thanks
-Mathias

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
