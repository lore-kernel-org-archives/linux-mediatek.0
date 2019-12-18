Return-Path: <SRS0=QBl7=2I=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 793DFC43603
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 Dec 2019 15:40:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 456FB206CB
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 Dec 2019 15:40:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="AbiUsxpd";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ti.com header.i=@ti.com header.b="jqWjyfLG"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 456FB206CB
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8yj3c45to7YuNQZz2rPSzrq8oQ8WwGH/vhCWFRR3Ghs=; b=AbiUsxpd1JD3R1
	xNMjdlbFcU2kwzf3jd4wgu0qKuu5dODJma2zZUcK5l0hzdnaumuy2R19DBZfxsQbdxSE1vRnGCx0r
	pZEcoExt52j7Qe3hqYtZyp8pMK5fTURUbaS4C308DpSDcVlLnrxzcUzAxfWPIQCiMfY0/SKqKjIsa
	boOwSGjB/TDJ2OtayYVt2P2ZzuJ3cNmL0bHbPJai39eg2kPe9HJ4rlwOmgmYYs6BRH1xBUdJh6xIW
	fjIbOIXQLPVZ8EGdhppz2s6oIgt13zT/pBRedSLNOJ18/f2rq2vk5twJ+JV5UDpEq6g1lvbtSERYJ
	Lf+feGCdoKVt3ohbVLhw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ihbQe-0004DM-W6; Wed, 18 Dec 2019 15:40:00 +0000
Received: from fllv0015.ext.ti.com ([198.47.19.141])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ihbQc-0004Cp-2v; Wed, 18 Dec 2019 15:39:59 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id xBIFdlqg019044;
 Wed, 18 Dec 2019 09:39:47 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1576683588;
 bh=isrbKoX0G9x5SGR0XS8wE9i8c+JE3gadbxb2pKknm08=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=jqWjyfLGeRvQwwgyrIyyIvTziBUpN2dqqj6Bi1/V1jtOCGUovSziMNs1rjtKnYANl
 6tp84BGjaIAUgO4cdONFX9lAJPIOErBgldm5agnsqfH4gED+dWDnaVXO+VvYBQGFd/
 W1AAVeyJHO2FbWB09mgavO/6WOHXq+9d/kUL9aUM=
Received: from DFLE101.ent.ti.com (dfle101.ent.ti.com [10.64.6.22])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xBIFdldB099895
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 18 Dec 2019 09:39:47 -0600
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Wed, 18
 Dec 2019 09:39:47 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Wed, 18 Dec 2019 09:39:47 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id xBIFdl01079424;
 Wed, 18 Dec 2019 09:39:47 -0600
Date: Wed, 18 Dec 2019 09:39:05 -0600
From: Bin Liu <b-liu@ti.com>
To: <min.guo@mediatek.com>
Subject: Re: [PATCH v9 2/6] arm: dts: mt2701: Add usb2 device nodes
Message-ID: <20191218153905.GN16429@iaqt7>
Mail-Followup-To: Bin Liu <b-liu@ti.com>, min.guo@mediatek.com,
 Rob Herring <robh+dt@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Alan Stern <stern@rowland.harvard.edu>, chunfeng.yun@mediatek.com,
 linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, tony@atomide.com,
 hdegoede@redhat.com
References: <20191211015446.11477-1-min.guo@mediatek.com>
 <20191211015446.11477-3-min.guo@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191211015446.11477-3-min.guo@mediatek.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191218_073958_207847_8E28B204 
X-CRM114-Status: GOOD (  12.04  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 hdegoede@redhat.com, tony@atomide.com,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, Matthias Brugger <matthias.bgg@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Alan Stern <stern@rowland.harvard.edu>,
 chunfeng.yun@mediatek.com, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Matthias,

On Wed, Dec 11, 2019 at 09:54:42AM +0800, min.guo@mediatek.com wrote:
> From: Min Guo <min.guo@mediatek.com>
> 
> Add musb nodes and usb2 phy nodes for MT2701
> 
> Signed-off-by: Min Guo <min.guo@mediatek.com>
> ---
> changes in v9:
> 1. Add usb-role-switch
> 2. Remove label of usb connector child node
> 3. Change usb connector child node compatible as "gpio-usb-b-connector", "usb-b-connector";
> 
> changes in v8:
> 1. no changes
> 
> changes in v7:
> 1. Change usb connector child node compatible as "gpio-usb-b-connector" 
> 
> changes in v6:
> 1. Modify usb connector child node
> 
> changes in v5:
> 1. Add usb connector child node
> 
> changes in v4:
> 1. no changes
> 
> changes in v3:
> 1. no changes
> 
> changes in v2:
> 1. Remove phy-names
> ---
>  arch/arm/boot/dts/mt2701-evb.dts | 21 ++++++++++++++++++++
>  arch/arm/boot/dts/mt2701.dtsi    | 33 ++++++++++++++++++++++++++++++++
>  2 files changed, 54 insertions(+)

Can I have your ACK so I can queue this? or please let me know if you
want to take it in your tree. Thanks.

-Bin.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
