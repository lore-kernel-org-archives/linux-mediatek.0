Return-Path: <SRS0=YCpt=D3=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E967EC433E7
	for <linux-mediatek@archiver.kernel.org>; Tue, 20 Oct 2020 06:37:05 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4AC302237B
	for <linux-mediatek@archiver.kernel.org>; Tue, 20 Oct 2020 06:37:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="G0qpEbNu";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="UhARNXEK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4AC302237B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=fjhe8RhzjW8YHpjOxxX/o+mH/mEVzuHq6uv8Ug4hf8U=; b=G0qpEbNu3L4cNp2UK35EkGCV8
	/LF0vv7zMpWLgQx/x3ego+U7BzHaMp8bMcxWsIQr3U+5tCm+5LoYL5VMPTNkAM7FNAATdM69zknxl
	sidWZ8AQ03nBTBgCevAXkCkYcsb3irw98PE3MSBrUfI5Dhj61FNnebCN3IGQCq0UdTYVVNv+edVGX
	nHAJOiZM80VveNUhnwCH8uTRRNWL7vJptYd8929vDM7GXWy2yUCxeor84zIJOW6CZh69pBlr6bil+
	MlmrKYfwDlSUWvQbSTt/+hIEiNYOlB4dKBONPx19P0nnMznoa6vO+wvlmdhBm1Q5QdB5rDNRrvvWE
	+4FpBXXyw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kUlGQ-0004pk-8v; Tue, 20 Oct 2020 06:36:54 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kUlGN-0004p7-9e; Tue, 20 Oct 2020 06:36:53 +0000
X-UUID: 058f186341cf4443a3c82ef6fddc4b09-20201019
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=5oMkIsGFoLQ4IdBLm/vtbnr97rCI7oTjafuD1B2qYpM=; 
 b=UhARNXEKXnk9UU42lTNFm6DiylUDMdw51fyJGTpz4PSPDMmzqFPy+9t+iSumF/Ciw0sCFymNrREWWc8OuREu0E5eAxH2kzqSQKMDvUEviBhm88ziTlPlp4ACrLQ2UQ65+yquenhDLCUF5v+b+08Fau5AX8cYdE+F/uK6NcnOJj8=;
X-UUID: 058f186341cf4443a3c82ef6fddc4b09-20201019
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <macpaul.lin@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 2074405046; Mon, 19 Oct 2020 22:36:42 -0800
Received: from MTKMBS01N1.mediatek.inc (172.21.101.68) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 19 Oct 2020 23:36:39 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs01n1.mediatek.inc (172.21.101.68) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 20 Oct 2020 14:36:38 +0800
Received: from [172.21.77.33] (172.21.77.33) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 20 Oct 2020 14:36:39 +0800
Message-ID: <1603175799.19799.6.camel@mtkswgap22>
Subject: Re: [PATCH v2] usb: gadget: configfs: Fix use-after-free issue with
 udc_name
From: Macpaul Lin <macpaul.lin@mediatek.com>
To: Felipe Balbi <balbi@kernel.org>
Date: Tue, 20 Oct 2020 14:36:39 +0800
In-Reply-To: <1595040303-23046-1-git-send-email-macpaul.lin@mediatek.com>
References: <1594881666-8843-1-git-send-email-macpaul.lin@mediatek.com>
 <1595040303-23046-1-git-send-email-macpaul.lin@mediatek.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201020_023652_071431_33704C35 
X-CRM114-Status: GOOD (  20.49  )
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
Cc: Eddie Hung =?UTF-8?Q?=28=E6=B4=AA=E6=AD=A3=E9=91=AB=29?=
 <Eddie.Hung@mediatek.com>, wsd_upstream <wsd_upstream@mediatek.com>,
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

On Sat, 2020-07-18 at 10:45 +0800, Macpaul Lin wrote:
> From: Eddie Hung <eddie.hung@mediatek.com>
> There is a use-after-free issue, if access udc_name
> in function gadget_dev_desc_UDC_store after another context
> free udc_name in function unregister_gadget.
> 
> Context 1:
> gadget_dev_desc_UDC_store()->unregister_gadget()->
> free udc_name->set udc_name to NULL
> 
> Context 2:
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
> Reviewed-by: Peter Chen <peter.chen@nxp.com>
> Cc: stable@vger.kernel.org
> ---
> Changes for v2:
>   - Fix typo %s/contex/context, Thanks Peter.
> 
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

Just want to remind we have a fix here for usb/gadget/configfs.c.
If the patch need to be further revised, please let us know.

Thanks!
Macpaul Lin
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
