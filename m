Return-Path: <SRS0=MDpP=IQ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B170C433E0
	for <linux-mediatek@archiver.kernel.org>; Thu, 18 Mar 2021 02:32:21 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8223564DCC
	for <linux-mediatek@archiver.kernel.org>; Thu, 18 Mar 2021 02:32:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8223564DCC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:CC:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=e0h5KkrHvFj9jc9C37/ZSa4X9NHyYj2Qh1c3Wh5Z4O0=; b=fCSCcQEnrxqU5/uB1W7YBe7cE
	yIKM3avJOr0DQIQG3mJtRwLGnyUhk32xoL01eIoMoaps8dRt7yA557Q3kF6hJvZKpXfcOzmb3BgkQ
	56YOr65f/indmfq/YQe6yRl12JAoqQi0SqyUtvvfV6HBQ0jrROwwdWlKI3MGMD5B+TWKQDbykuSZp
	koh3x7ZEbmHs5WGZ89brbuVd/bNCYpMcYXYbnQqwdOmwqkZXLxzrOS7EdVu/WQhwlbu+K3wcnBv+T
	odIR9z2s8trvVP+z/bb1Z2QfhLLe5oOiDScpLrGUS0Sz1d+bHKALSGVgjlBisqbLILgQWi/A5kOR7
	YrL4GfjNg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lMiSG-004IVR-Cq; Thu, 18 Mar 2021 02:32:08 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lMiSB-004IV3-Nr; Thu, 18 Mar 2021 02:32:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID:Sender
 :Reply-To:Content-ID:Content-Description;
 bh=fvS14rbiT2d22DFwCGoxXDf2m5IbaDkfUXz9j0R/ZyY=; b=d2WHG5PpR8Xo5mgvkc1MbpbC2V
 vfeNQwQGEYkjwyFHD8BiQjUB7c4qjd+MzEj38xXyd9Q1ZNVemfY6hbOAfGA3Qr2zR9cmCotK7jTAg
 NPPkSX15XVJdgsu8DjqiSjEAr/h0UxeNHT0bpHvTJdf/0kKvABTcHIVDrQqUkRcMloeLOpWy0W1SQ
 ned/qLBJ9A6WdJKt4wJHW1eQi6WBb0pQUZUY9XiLYIi0qtF2ljQJhuEmzDdPVDMqsIwWkuql7prDD
 eRwEFy2b7pIsd48u/4fkVS3rf5xUVEx0Tnw4mxo9T+Dd9+nFuL3iKBNx1MyiTfoE6aygN+ew4GKtx
 RhHJ0deQ==;
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by casper.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lMiRX-002QMo-0q; Thu, 18 Mar 2021 02:31:55 +0000
X-UUID: 40fb9dd5173642ff9d02b11265bb202d-20210317
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=fvS14rbiT2d22DFwCGoxXDf2m5IbaDkfUXz9j0R/ZyY=; 
 b=QWgHqg90jRDb20tdg0Uy6jyhDOp4qvyCiZSGZ4gzoxs6D70AF6S5qep6s78XbTj6Nx+iogmEtRXsw1AFygHla0V0d6vdLnIJT1m6ybfUgVrbwgih94Mt24O9aRFolq49tj0DVbDyj4tSiKx/KRFnI0VxTKzGG7PdS+LIUrj4T2o=;
X-UUID: 40fb9dd5173642ff9d02b11265bb202d-20210317
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1830449062; Wed, 17 Mar 2021 18:29:13 -0800
Received: from MTKMBS31N1.mediatek.inc (172.27.4.69) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 17 Mar 2021 19:19:10 -0700
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by MTKMBS31N1.mediatek.inc
 (172.27.4.69) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Thu, 18 Mar 2021 10:19:07 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS32.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 18 Mar 2021 10:19:05 +0800
Message-ID: <1616033945.25733.7.camel@mhfsdcap03>
Subject: Re: [PATCH 08/10] dt-bindings: phy: Add compatible for Mediatek MT8195
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Seiya Wang <seiya.wang@mediatek.com>
CC: Rob Herring <robh+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Jonathan Cameron <jic23@kernel.org>, "Lars-Peter
 Clausen" <lars@metafoo.de>, Peter Meerwald-Stadler <pmeerw@pmeerw.net>, "Ulf
 Hansson" <ulf.hansson@linaro.org>, Kishon Vijay Abraham I <kishon@ti.com>,
 Vinod Koul <vkoul@kernel.org>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Mark Brown <broonie@kernel.org>, "Daniel
 Lezcano" <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck
 <linux@roeck-us.net>, Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Hsin-Yi Wang <hsinyi@chromium.org>, Fabien Parent <fparent@baylibre.com>,
 Sean Wang <sean.wang@mediatek.com>, Zhiyong Tao <zhiyong.tao@mediatek.com>,
 Chaotian Jing <chaotian.jing@mediatek.com>, Wenbin Mei
 <wenbin.mei@mediatek.com>, Stanley Chu <stanley.chu@mediatek.com>, Bayi Cheng
 <bayi.cheng@mediatek.com>, Chuanhong Guo <gch981213@gmail.com>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-iio@vger.kernel.org>, <linux-mmc@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <linux-serial@vger.kernel.org>, <linux-spi@vger.kernel.org>,
 <linux-watchdog@vger.kernel.org>, <srv_heupstream@mediatek.com>
Date: Thu, 18 Mar 2021 10:19:05 +0800
In-Reply-To: <20210316111443.3332-9-seiya.wang@mediatek.com>
References: <20210316111443.3332-1-seiya.wang@mediatek.com>
 <20210316111443.3332-9-seiya.wang@mediatek.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: B58A0C7D8BC9BE44BF3BB2CCC0B6C0A769AC13E5E1AA726D14F7FBB3F75F4B022000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210318_023128_403022_76B51D97 
X-CRM114-Status: GOOD (  15.90  )
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

On Tue, 2021-03-16 at 19:14 +0800, Seiya Wang wrote:
> This commit adds dt-binding documentation of UFS M-Phy for Mediatek MT8195 SoC
> Platform.
> 
> Signed-off-by: Seiya Wang <seiya.wang@mediatek.com>
> ---
>  Documentation/devicetree/bindings/phy/mediatek,ufs-phy.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/phy/mediatek,ufs-phy.yaml b/Documentation/devicetree/bindings/phy/mediatek,ufs-phy.yaml
> index 3a9be82e7f13..5235b1a0d188 100644
> --- a/Documentation/devicetree/bindings/phy/mediatek,ufs-phy.yaml
> +++ b/Documentation/devicetree/bindings/phy/mediatek,ufs-phy.yaml
> @@ -22,6 +22,7 @@ properties:
>      pattern: "^ufs-phy@[0-9a-f]+$"
>  
>    compatible:
> +    enum: mediatek,mt8195-ufsphy
>      const: mediatek,mt8183-ufsphy
>  
There is warning when I make dt_binding_check, if mt8195 is compatible
with mt8183, will add it as following:

    oneOf:
      - items:
          - enum:
              - mediatek,mt8195-ufsphy
          - const: mediatek,mt8183-ufsphy
      - const: mediatek,mt8183-ufsphy

Due to Vinod already apply this patch, I'll send out a fix patch later

Thanks

>    reg:

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
