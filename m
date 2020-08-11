Return-Path: <SRS0=N3vC=BV=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5F8EC433E0
	for <linux-mediatek@archiver.kernel.org>; Tue, 11 Aug 2020 01:59:00 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7F0CB20716
	for <linux-mediatek@archiver.kernel.org>; Tue, 11 Aug 2020 01:59:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="yv7eEKiZ";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="D5xe5xHA"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7F0CB20716
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ZXyXVpsTFLT9iRUE8d6ArmKPmqBaHzN9oNbVJSfBX9Y=; b=yv7eEKiZVg0/moBV+zTqzLZmO
	OKMlD2K/lXyTHc7SjHils0/TluxUSJnU9cJfA89NjnzblpYC52WXUifUsEomcdFCyAKIzzfNWcdY2
	NFmFatRE0SfKugorn8B0WrGR8CadfIqSlsOPO1Zd66UiIwk/yP87LSqYFwfhVQt6VVmhiKjRsVD0X
	dNydtJC7BTPEyvKzOh+PLJ58F8dNHwycEl0H1rPnw77A4MPa55vek3HIK/zsoKTMwWNRoh/JrO0w7
	IyGjVclZ8BT8yfPuiU3VSH1LZLOMsmcs2i0cSN1agxJxxeFuRFySxDRbEEF5aEPvf9zYPsi+PKMIB
	mQnjLIWrQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k5JYv-0005YZ-9c; Tue, 11 Aug 2020 01:58:49 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k5JYr-0005Y4-4q; Tue, 11 Aug 2020 01:58:47 +0000
X-UUID: 1bd5ec77df514373accc91cd49b13bd7-20200810
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=wWsrLG80qkuNgSA4gGuAfus81URferVVdJm10Q2FyI0=; 
 b=D5xe5xHA5gYU4RjvI4svlu2vpiIEvWNSbxoNBMxV6fsBFEh7XUnCIzEhcxit2gjbmLb/SoG7QG199yCWvAiQ6iuLaXw/n65SADtIe80VB8oBog3MAKzSvAg1ncAtGNYPi5ZUkRBevl/4QRRai+erZaaYa1TFh1sXUnrG2mKdBK8=;
X-UUID: 1bd5ec77df514373accc91cd49b13bd7-20200810
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <yingjoe.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 607090760; Mon, 10 Aug 2020 17:58:24 -0800
Received: from MTKMBS32N1.mediatek.inc (172.27.4.71) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 10 Aug 2020 18:48:18 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 MTKMBS32N1.mediatek.inc (172.27.4.71) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 11 Aug 2020 09:48:18 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 11 Aug 2020 09:47:23 +0800
Message-ID: <1597110443.22273.5.camel@mtksdaap41>
Subject: Re: [PATCH v17 1/3] dt-bindings: Add bindings for Mediatek matrix
 keypad
From: Yingjoe Chen <yingjoe.chen@mediatek.com>
To: Fengping Yu <fengping.yu@mediatek.com>
Date: Tue, 11 Aug 2020 09:47:23 +0800
In-Reply-To: <20200810064058.6467-2-fengping.yu@mediatek.com>
References: <20200810064058.6467-1-fengping.yu@mediatek.com>
 <20200810064058.6467-2-fengping.yu@mediatek.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: B2CD043487BC2843B3826AD6DB0F9EC3DC55BA7D3B4D9836D2D5FCFBC9953D792000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200810_215845_431860_B626E998 
X-CRM114-Status: GOOD (  19.42  )
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
Cc: devicetree@vger.kernel.org, Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Marco Felsch <m.felsch@pengutronix.de>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 linux-input@vger.kernel.org,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi,


On Mon, 2020-08-10 at 14:40 +0800, Fengping Yu wrote:
> From: "fengping.yu" <fengping.yu@mediatek.com>
> 
> This patch add devicetree bindings for Mediatek matrix keypad driver.
> 
> Signed-off-by: fengping.yu <fengping.yu@mediatek.com>
> ---
>  .../devicetree/bindings/input/mtk-kpd.yaml    | 87 +++++++++++++++++++
>  1 file changed, 87 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/input/mtk-kpd.yaml
> 
> diff --git a/Documentation/devicetree/bindings/input/mtk-kpd.yaml b/Documentation/devicetree/bindings/input/mtk-kpd.yaml
> new file mode 100644
> index 000000000000..d74dd8a6fbde

<...>


> +  keypad,num-columns:
> +    description: Number of column lines connected to the keypad controller,
> +    it is not equal to PCB columns number, instead you should add required value
> +    for each IC. If not specified, the default value is 1.
> +
> +  keypad,num-rows:
> +    description: Number of row lines connected to the keypad controller, it is
> +    not equal to PCB rows number, instead you should add required value for each IC.
> +    If not specified, the default value is 1.

Your source code can't really handle dts without rows/columns
properties. Also, the default value doesn't make any sense. No IC will
have rows or columns set to 1.

Since these are IC specified, not board specified, I think you should
just have the correct numbers in driver.

Joe.C

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
