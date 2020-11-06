Return-Path: <SRS0=NSCp=EM=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8DB3C2D0A3
	for <linux-mediatek@archiver.kernel.org>; Fri,  6 Nov 2020 10:08:23 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 39E17206CB
	for <linux-mediatek@archiver.kernel.org>; Fri,  6 Nov 2020 10:08:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="whs+6tFs";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="Xhv4exQT"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 39E17206CB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=HV4Fs0pWMyqVkOwIapoy2hbOHK+BSGRisZjhnZtB7ik=; b=whs+6tFsOpFsBHaM1NwFMp+Ua
	3JtvKKguYAqSZ6h2lDQ5yjXIOpcDyMI8Oi0TyfExmf7f7VQZEz16Cp23zGSaPPTNbmzc9gC2P3pHL
	6xEHH/TN9lf+J7Z+shHQ4RBBXpjHGtwe8IKEppTOfCapPJ9ZsXMyLygVvMoQIDYO0NLwT/4WMCETF
	QFwHhDcrShwp04cYtyUoeAjB0myDLICfhOvm69xKDdxDJBP8g7iDAlUF59ZKVWJLUibZQsNk/sJEr
	6Us1pUThd5kKm/S21jkzYPs17+qTipfy0PTQ2EFmsGZ8o81kqd/7jScQk0Z+zWo760+5zZm+YNCN4
	Ny5P6fHqA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kayfF-0005v1-1y; Fri, 06 Nov 2020 10:08:13 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kayfC-0005tp-UR; Fri, 06 Nov 2020 10:08:12 +0000
X-UUID: fde303518110470f95e9250b6166b1aa-20201106
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=4s+L7wob1CsZbTthU7rAq7FTbLUsWXrb2OgOu2nJ7fo=; 
 b=Xhv4exQTc072g7xvumv6iM3CkiGRtqP3DtFSdSyTzkp95eZ1K88XGAswkFEAFjeBQbA4s/gDzvGTuQtC+jMqVt7kMviqx2dWJccfBAxrSunu9Jt1+HnTWFh8D290HYSgnX+FWSEcxTFeg7Ejzg9bK00oCe47cnpR6xDtscqH+xE=;
X-UUID: fde303518110470f95e9250b6166b1aa-20201106
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <macpaul.lin@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 184461677; Fri, 06 Nov 2020 02:08:05 -0800
Received: from MTKMBS01N1.mediatek.inc (172.21.101.68) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 6 Nov 2020 01:58:41 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs01n1.mediatek.inc (172.21.101.68) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 6 Nov 2020 17:58:39 +0800
Received: from [172.21.77.33] (172.21.77.33) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 6 Nov 2020 17:58:39 +0800
Message-ID: <1604656720.24301.24.camel@mtkswgap22>
Subject: Re: [PATCH v2 1/2] dt-bindings: usb: mediatek,mtk-xhci: add
 str-clock-on
From: Macpaul Lin <macpaul.lin@mediatek.com>
To: Rob Herring <robh@kernel.org>
Date: Fri, 6 Nov 2020 17:58:40 +0800
In-Reply-To: <1604655965-22418-1-git-send-email-macpaul.lin@mediatek.com>
References: <1604301530-31546-1-git-send-email-macpaul.lin@mediatek.com>
 <1604655965-22418-1-git-send-email-macpaul.lin@mediatek.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201106_050811_190915_E8945F24 
X-CRM114-Status: GOOD (  18.10  )
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
Cc: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
 wsd_upstream <wsd_upstream@mediatek.com>,
 Mathias Nyman <mathias.nyman@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Eddie Hung =?UTF-8?Q?=28=E6=B4=AA=E6=AD=A3=E9=91=AB=29?=
 <Eddie.Hung@mediatek.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Chunfeng
 Yun =?UTF-8?Q?=28=E4=BA=91=E6=98=A5=E5=B3=B0=29?= <Chunfeng.Yun@mediatek.com>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 Ainge Hsu =?UTF-8?Q?=28=E5=BE=90=E5=B7=A7=E5=AE=9C=29?=
 <ainge.hsu@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 Macpaul Lin <macpaul@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, 2020-11-06 at 17:46 +0800, Macpaul Lin wrote:
> Option "mediatek,str-clock-on" means to keep clock on during system
> suspend and resume. Some platform will flush register settings if clock has
> been disabled when system is suspended. Set this option to avoid clock off.
> 
> Change-Id: Id841f58e9d7fb3656511072b3eb14d0d355e2dd5

Sorry I've found a Change-ID tag here,
I'll send patch v3.

> Signed-off-by: Macpaul Lin <macpaul.lin@mediatek.com>
> ---
> Changes for v2:
>   - Rename "mediatek,keep-clock-on" to "mediatek,str-clock-on" which implies
>     this option related to STR functions.
>   - After discussion with Chunfeng, resend dt-bindings descritption based on
>     mediatek,mtk-xhci.txt instead of yaml format.
> 
>  .../devicetree/bindings/usb/mediatek,mtk-xhci.txt  |    3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.txt b/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.txt
> index 42d8814..fc93bcf 100644
> --- a/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.txt
> +++ b/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.txt
> @@ -37,6 +37,9 @@ Required properties:
>  
>  Optional properties:
>   - wakeup-source : enable USB remote wakeup;
> + - mediatek,str-clock-on: Keep clock on during system suspend and resume.
> +	Some platform will flush register settings if clock has been disabled
> +	when system is suspended.
>   - mediatek,syscon-wakeup : phandle to syscon used to access the register
>  	of the USB wakeup glue layer between xHCI and SPM; it depends on
>  	"wakeup-source", and has two arguments:

Thanks
Macpaul Lin
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
