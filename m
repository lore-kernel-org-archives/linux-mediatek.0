Return-Path: <SRS0=osr7=J7=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90AF0C433B4
	for <linux-mediatek@archiver.kernel.org>; Tue,  4 May 2021 04:19:12 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 06E5E611AC
	for <linux-mediatek@archiver.kernel.org>; Tue,  4 May 2021 04:19:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 06E5E611AC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:CC:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=RmXdLz7VuD2tE3oQyA/KS/3lqSbGJ9NtBZZjGS6SpWU=; b=l7f63XVx3a+povQf65oNKmR0L
	7588X5HwLKPDoYBSicD9UBILpEvbjbxclNGg1clWU1138zeqwk4CYjG2BxvwC4f8Y/hN6X7PL8Xrf
	hPA5V7uTMOTM8y0g33bdz/7vfs7zckDR/aM/aqDO1Mpgm9UhDv6QtLPFJ270pO22CHiv6qyV3uF88
	02U7auwupV9FJz//QVDg+mKtLT3u7+2kHwiXLZyShPa2zxPuX+w8tWNW1FD0rHd9xu5egFft4dzJy
	n9nFi9xNhUFsxwovDNhjV1h/tnSJrGIPu6a7OyjPi58zSbDfO5XGRaOZaRkV6osKj8U0IyOv8EJoF
	n0utCu2Xg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1ldmWO-00FNOU-5c; Tue, 04 May 2021 04:18:56 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ldmWC-00FNMl-Kt; Tue, 04 May 2021 04:18:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
 Message-ID:Sender:Reply-To:Content-ID:Content-Description;
 bh=/cbVo2HXM2EBR6+XgYLdg2qe+Xrids+DQpIfN0W+BU8=; b=gaVkNxl0ZpuE6W4CVYNuodct67
 S+JiZ+4oF6OhIHbOYIOf+U66Wdtl0NslovAu/85L/D0vu6lW3w+iW5bJR9495c3Ihr7g14O7nLT2P
 xJPSUdJ7f/r43fsqIDkT+kUoL8gLXieYe5jG9LsO8CTjFodhMVzDXvqtRHQTkFB8iwofX7itie3OP
 rm6aUiYxUDFXna6oF1wZObVTdjgoJjc5MnsfooU4jJBxSmFefip8QsVi9oSUoi3om7KWaEZ1ET8/d
 OG418In9KxPwJkQNf71LVA9JTJ7NV5J/dMZZrExriwLURcOyWwZUVQTWuxkE8ZsAiZ2b3XrKqEraO
 v3qCR/jQ==;
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ldmW8-003fcO-Bn; Tue, 04 May 2021 04:18:43 +0000
X-UUID: dcb534471cf0496a86880b51301b5a38-20210503
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=/cbVo2HXM2EBR6+XgYLdg2qe+Xrids+DQpIfN0W+BU8=; 
 b=nW5JXRJR4HBHHZUE7Cd/pIt2oHMIw8AMNsx/SU2FuutBl6KpISLn3GkCfaxZCtDNBczMeTcsw4Pz77JEo0LAy5K72plc2ilItC8HZYo8ATxc7cYlULk5RpSB1qi3EYO/YvkbDO1PtDBT4Zy6G9/tH5rz4bGxJ+CEmhftMqQBjgw=;
X-UUID: dcb534471cf0496a86880b51301b5a38-20210503
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <ck.hu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 2030330281; Mon, 03 May 2021 21:18:34 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 3 May 2021 21:11:01 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by mtkcas07.mediatek.inc
 (172.21.101.84) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Tue, 4 May 2021 12:10:59 +0800
Received: from [172.21.77.4] (172.21.77.4) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 4 May 2021 12:10:59 +0800
Message-ID: <1620101459.15918.4.camel@mtksdaap41>
Subject: Re: [PATCH v2 2/2] dt-bindings: mediatek: Add optional mediatek,
 gce-events property
From: CK Hu <ck.hu@mediatek.com>
To: Hsin-Yi Wang <hsinyi@chromium.org>
CC: Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring
 <robh+dt@kernel.org>, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 <devicetree@vger.kernel.org>, Enric Balletbo i Serra
 <enric.balletbo@collabora.com>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Date: Tue, 4 May 2021 12:10:59 +0800
In-Reply-To: <20210503050523.2571758-2-hsinyi@chromium.org>
References: <20210503050523.2571758-1-hsinyi@chromium.org>
 <20210503050523.2571758-2-hsinyi@chromium.org>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210503_211840_580522_88AFCDF6 
X-CRM114-Status: GOOD (  16.87  )
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

Hi, Hsin-yi:

On Mon, 2021-05-03 at 13:05 +0800, Hsin-Yi Wang wrote:
> mediatek,gce-events property is used by gce clients.
> 
> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> ---
>  .../devicetree/bindings/display/mediatek/mediatek,disp.txt  | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,disp.txt b/Documentation/devicetree/bindings/display/mediatek/mediatek,disp.txt
> index fbb59c9ddda6..939b2da3bdc5 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,disp.txt
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,disp.txt
> @@ -75,6 +75,10 @@ Optional properties (RDMA function blocks):
>    mediatek,rdma-fifo-size of mt8183-rdma0 is 5K
>    mediatek,rdma-fifo-size of mt8183-rdma1 is 2K
>  
> +Optional properties for display mutex:
> +- mediatek,gce-events: GCE events used by clients. The event numbers are
> +  defined in 'dt-bindings/gce/<chip>-gce.h'.

I think mediatek,gce-events should be first defined in [1], and here
refer to [1].

In addition, mtk-mutex driver is moved into soc folder, so I would like
to move mtk-mutex binding out of display binding. It's up to you.

[1] Documentation/devicetree/bindings/mailbox/mtk-gce.txt

Regards,
CK

> +
>  Examples:
>  
>  mmsys: clock-controller@14000000 {
> @@ -209,6 +213,8 @@ mutex: mutex@14020000 {
>  	interrupts = <GIC_SPI 169 IRQ_TYPE_LEVEL_LOW>;
>  	power-domains = <&scpsys MT8173_POWER_DOMAIN_MM>;
>  	clocks = <&mmsys CLK_MM_MUTEX_32K>;
> +	mediatek,gce-events = <CMDQ_EVENT_MUTEX0_STREAM_EOF>,
> +			      <CMDQ_EVENT_MUTEX1_STREAM_EOF>;
>  };
>  
>  od@14023000 {

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
