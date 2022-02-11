Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6D0DC433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 11 Feb 2022 10:17:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GomZZAr30pX4MT5FNVaS1KMu9kUzrJXcIv6Qs9Cpa7M=; b=afWdGdNdQhcZa3
	AhQTTsUVZ7X5YWJ2qgvVJoDNcOkgqeoh5U8qIqu9oAaj22h35FSljW1j71s8CKk7lFcG9tmPZndBp
	2XoQlqwFTADcsp3+JxqlS7EE7bm07aN/KRdMr7UefW1gpz3jmoTlf9ZiT5rtlU+O9E6P8YsGYxQfW
	76faAjNjMh8gxfmoHuLBg/nUtZGW841KZOL1ryaLoTF9vm0S0NuMooGEdTDdSmN0R8Fajm9VvqTtW
	ZurWi4+6q1s1AfqCTx5ZEMO040MS8iIRnQ2KHhTuoEeIlTMjyD8jGw+uq1DIqvW8Mle+ZUjKjGsf3
	U4DGNZ4iGJBz4k2JFOYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nISza-006XGH-00; Fri, 11 Feb 2022 10:17:30 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nISzO-006XDl-1L; Fri, 11 Feb 2022 10:17:19 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 8675261F8E;
 Fri, 11 Feb 2022 10:17:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C861C340E9;
 Fri, 11 Feb 2022 10:17:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1644574637;
 bh=b/ngfDkWDiw92226G+pIpM2EYFAMFZ6kYeblSJjHKcw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=X1oYqHjxxMeI0aCEVvuYhGZFdUSQqWrbJrLweRZKnNQIRTIY32yx3KISfiv+s3rnb
 otFF/DNL2yUw74LDPqu1bXcPLIgVBrvV/p4otbzTGWZUj5etdykV2LbHf/If67tZ92
 T2/ijeW26wnEOJzyGmb7ULn0BW2TCm2kblySPlN0=
Date: Fri, 11 Feb 2022 11:17:14 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
 Rob Herring <robh+dt@kernel.org>,
 Mathias Nyman <mathias.nyman@intel.com>, linux-usb@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Tianping Fang <tianping.fang@mediatek.com>,
 Eddie Hung <eddie.hung@mediatek.com>
Subject: Re: [PATCH v2 3/4] arm64: dts: mediatek: mt8195: add efuse node and
 cells
Message-ID: <YgY3qvAy5lW1tEdG@kroah.com>
References: <20220128062902.26273-1-chunfeng.yun@mediatek.com>
 <20220128062902.26273-3-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220128062902.26273-3-chunfeng.yun@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220211_021718_152421_71ED5FD5 
X-CRM114-Status: GOOD (  13.86  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, Jan 28, 2022 at 02:29:01PM +0800, Chunfeng Yun wrote:
> Add efuse node and cells used by t-phy to fix the bit shift issue
> 
> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> ---
> v2: use hw auto load for u2phy which has no this issue
> 
> Note:
> 
>  depend on the reviewing patch:
> 
> [v9,3/3] arm64: dts: Add mediatek SoC mt8195 and evaluation board
> https://patchwork.kernel.org/patch/12711296

As I don't have that in my tree, I can only take the first 2 patches
here now, thanks.

greg k-h

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
