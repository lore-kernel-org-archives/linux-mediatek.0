Return-Path: <SRS0=lxeM=EJ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0866C388F2
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Nov 2020 03:03:13 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8F4AC222EC
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Nov 2020 03:03:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="dQGtV91L";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="ZjjHKAJm"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8F4AC222EC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=nJvHMQB9Pg58QSYmuu3Ui15fTn5yX9lZ6hhbtpNMQW0=; b=dQGtV91LxaNIh0j5mPLrHOKkB
	KRH21auod0nrGv138Xa04eI4/jayeTvvGpMBq4gyMpTSgHpF7RDzX4GUTaclF2U54OaNh8jbGMyEK
	+VSdx69hfcThmeB1RCDoSvDH2JPCucpxs1OpgCs5fGn8SL2m0/lhaK5mt38giTD0dc4YLX+PSmgrx
	v0aICAYhnp7Tz9BkHfIsMjQZvo4T9WUyhjrJo9Qz7WuWzT+DkfSbwncb6ep23hCDZyxwYwgfma/ms
	n1VUS65ezJFi/D3UOcvlDebdavhgymi0sIkxqkV2hklUzVO8DnKuVlFrDJSlEi3RVCfjHio6w4YM4
	ZvXuQmXRQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kZmbC-0005yR-DQ; Tue, 03 Nov 2020 03:03:06 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kZmb7-0005wj-3B; Tue, 03 Nov 2020 03:03:02 +0000
X-UUID: 15c97d25732a4352b5c9fc98f18a7504-20201102
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=kA10xqguhONUPZrUmipFwStozwcyihpqFitOURXTXYs=; 
 b=ZjjHKAJmsjSRD31djYgnwRx8Z2/8qJ2wJk5n4HnOk/ViUD4bw4ZzyObjQ5pnpUuOWdAatvfCN8gSJdi2MM9cBKyVSChqUjYH+u/66/vAcYjYP56BCSOwxThKV6L+2HrNXNKNxiXTM/bypTR1zQpDfC4BH0X7dNplX+XJ/A2MNv8=;
X-UUID: 15c97d25732a4352b5c9fc98f18a7504-20201102
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 818722848; Mon, 02 Nov 2020 19:02:54 -0800
Received: from mtkmbs08n1.mediatek.inc (172.21.101.55) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 2 Nov 2020 19:01:15 -0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by mtkmbs08n1.mediatek.inc
 (172.21.101.55) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Tue, 3 Nov 2020 11:01:14 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 3 Nov 2020 11:01:11 +0800
Message-ID: <1604372472.31607.18.camel@mhfsdcap03>
Subject: Re: [PATCH 1/2] dt-bindings: usb: mediatek,mtk-xhci: add keep-clock-on
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Macpaul Lin <macpaul.lin@mediatek.com>
Date: Tue, 3 Nov 2020 11:01:12 +0800
In-Reply-To: <1604301530-31546-1-git-send-email-macpaul.lin@mediatek.com>
References: <1604301530-31546-1-git-send-email-macpaul.lin@mediatek.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201102_220301_328124_02A62945 
X-CRM114-Status: GOOD (  16.32  )
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
Cc: devicetree@vger.kernel.org, Eddie Hung <eddie.hung@mediatek.com>,
 Mediatek WSD Upstream <wsd_upstream@mediatek.com>, Mathias
 Nyman <mathias.nyman@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Ainge
 Hsu <ainge.hsu@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org, Macpaul Lin <macpaul@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Macpaul,

On Mon, 2020-11-02 at 15:18 +0800, Macpaul Lin wrote:
> Option "mediatek,keep-clock-on" means to keep clock on during system
> suspend and resume. Some platform will flush register settings if clock has
> been disabled when system is suspended. Set this option to avoid clock off.
> 
> Signed-off-by: Macpaul Lin <macpaul.lin@mediatek.com>
> ---
>  .../devicetree/bindings/usb/mediatek,mtk-xhci.yaml |    7 +++++++

This depends on reviewing patch:
https://patchwork.kernel.org/project/linux-mediatek/patch/20201014014434.62239-6-chunfeng.yun@mediatek.com/
[v2,6/8] dt-bindings: usb: convert mediatek, mtk-xhci.txt to YAML schema

Please add it after "---", thanks


>  1 file changed, 7 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml b/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml
> index ea696c8..a956dde 100644
> --- a/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml
> +++ b/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml
> @@ -104,6 +104,12 @@ properties:
>      description: enable USB remote wakeup, see power/wakeup-source.txt
>      type: boolean
>  
> +  mediatek,keep-clock-on:
> +    description: |
> +      Keep clock on during system suspend and resume. Some platform will flush
> +      register settings if clock has been disabled when system is suspended.
> +    type: boolean
> +
>    mediatek,syscon-wakeup:
>      $ref: /schemas/types.yaml#/definitions/phandle-array
>      maxItems: 1
> @@ -175,6 +181,7 @@ examples:
>          imod-interval-ns = <10000>;
>          mediatek,syscon-wakeup = <&pericfg 0x400 1>;
>          wakeup-source;
> +        mediatek,keep-clock-on;
>          usb3-lpm-capable;
>      };
>  ...

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
