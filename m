Return-Path: <SRS0=yJvo=FI=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93B96C4361A
	for <linux-mediatek@archiver.kernel.org>; Fri,  4 Dec 2020 02:15:05 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C265822512
	for <linux-mediatek@archiver.kernel.org>; Fri,  4 Dec 2020 02:15:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C265822512
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=WC+1Ck3/CxBCIgh57hxwCEZ1Yvb2BLUVpOWNu4iqEP0=; b=NtWRyau7QTat3dwb9+UbBrWyv
	RRBsBkX9F8a8V+WDLiP6z0tY1/Hgb30eaS1gnOGwDBYj/EGMOt11n9S/UWe5RsfNgdLFhxlqcGau3
	ZFDBlxaVINA1YFHkqqtZ9kxyDRXNo0s/wnXfOH4p5umiZ/H7XKjcoYkLPIDd/emovixfLNqQ3Pcgg
	S8+ytgAv/EpStOd/fpSzE3Wfg1khZymt9vjJr52aJ04YEGeNYpy4M6KwsTXR0m9TL2MQXdVrHH7GD
	BKYFlK8lkJyltBSqQNhkcJbuhTwIWGifm1tya9zuEU4DuJIV9P+XrSWCNYowQecUoDm847OrPPocc
	nmTK+WGxA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kl0ca-0006yq-AJ; Fri, 04 Dec 2020 02:14:56 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kl0cX-0006yM-Q4
 for linux-mediatek@lists.infradead.org; Fri, 04 Dec 2020 02:14:55 +0000
X-UUID: 08f9771b65734a6e823e32e0fa357234-20201203
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=xs9eF5fglSIsmijGZu14F0E5pV9HzptzLHDNcPvVCIs=; 
 b=CXPUXZL4sLCAlfchrwMoUS3XmNCzDl34SrYXGro6+x/pC/46Zwn+p/WdSzeSi1bYV6amD+rcDGQ8cl+3M/GUP2YojgUlXnMS9dghtM1irKuFl580HwrQVrNxkn+m1Y7kqNVS3M0KG+I6ADctDQM4lhkHPIJKmFXcxeo5BxzQwKo=;
X-UUID: 08f9771b65734a6e823e32e0fa357234-20201203
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 857104597; Thu, 03 Dec 2020 18:14:43 -0800
Received: from MTKMBS32DR.mediatek.inc (172.27.6.104) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 3 Dec 2020 18:07:58 -0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS32DR.mediatek.inc
 (172.27.6.104) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Fri, 4 Dec 2020 10:07:56 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 4 Dec 2020 10:07:56 +0800
Message-ID: <1607047676.7284.18.camel@mhfsdcap03>
Subject: Re: [PATCH 2/2] usb: mtu3: mtu3_debug: remove an unused struct member
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 4 Dec 2020 10:07:56 +0800
In-Reply-To: <X8ikv1QA3Do50D+R@mwanda>
References: <X8ikv1QA3Do50D+R@mwanda>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: AC0B05F042C3094CF0C98DC0756865E872A5F19AB13B6FEF8FDFC73BD9F1C23B2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201203_211454_043958_A66F373D 
X-CRM114-Status: GOOD (  14.11  )
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
 kernel-janitors@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, 2020-12-03 at 11:41 +0300, Dan Carpenter wrote:
> The "nregs" member is not used.  The code uses the "regset.nregs"
> struct member instead.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  drivers/usb/mtu3/mtu3_debug.h | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/usb/mtu3/mtu3_debug.h b/drivers/usb/mtu3/mtu3_debug.h
> index 3084c46017c3..9a36134b322d 100644
> --- a/drivers/usb/mtu3/mtu3_debug.h
> +++ b/drivers/usb/mtu3/mtu3_debug.h
> @@ -19,7 +19,6 @@ struct ssusb_mtk;
>  struct mtu3_regset {
>  	char name[MTU3_DEBUGFS_NAME_LEN];
>  	struct debugfs_regset32 regset;
> -	size_t nregs;
>  };
Acked-by: Chunfeng Yun <chunfeng.yun@mediatek.com>

Thanks a lot

>  
>  struct mtu3_file_map {

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
