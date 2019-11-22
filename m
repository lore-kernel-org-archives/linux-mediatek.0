Return-Path: <SRS0=vzOr=ZO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C261FC432C0
	for <linux-mediatek@archiver.kernel.org>; Fri, 22 Nov 2019 08:16:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8B04620672
	for <linux-mediatek@archiver.kernel.org>; Fri, 22 Nov 2019 08:16:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ZVV5LzGV";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="lpZUXKuD"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8B04620672
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=h7y3QNmQ1ibtVk+k1SbSpBGIghFBfXB9F3stHrdZKB4=; b=ZVV5LzGV5lQj8Q
	wNTRHEcUOTzsj740Y5zS4Ii5lyFr6iknKrja/wcjzxd9JeB2K+04aqfAXtkfI4UxBzGhsDEJtA+Gk
	yeV2n2a7Fz2j/s6dMxy0vSwXfa3rfdkdUjEbLfJyuKZeNTCJbVdYOpQnHOILvsAn2RU1N8U9MjfXO
	V6MohNDuX5Xb33eXhUYtaPPrOsvv8DPDtOhBGEgXqAWmPQEDuMFDXhtajUqz68BDq4YCgjWkElbAm
	aj5tXD+jnkQs3PtAc5apxDNBSI4bG2i/Zs3W6zypvD+lk1cx6jHUaLu52ubowSqfT+/n5rV8qfkf7
	47yp4N0aMi2nhzm4ZQmQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iY46w-0000KA-Pz; Fri, 22 Nov 2019 08:16:14 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iY46l-0000Av-Vn; Fri, 22 Nov 2019 08:16:05 +0000
X-UUID: 9b2bc4a688d046fca68a704e1b7cce0f-20191122
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=K2QceGAFr4kSuhEVcqRkxVbwPBJiY5InoLtmLU20XiU=; 
 b=lpZUXKuDJAQewYko3iuJb+KSPvHi3BagShZhozXm62IM7qCD1TC0FVAyl6PJ0pdAw41ivgQky4F0iZIMByWd7SLXwXby6vm/FzDR5iQerHG/a4+4/Y8bjT70KX3cW8wamaUvCvVt2tONm1krCvbI/41Ozv4PlvwropZTuqsAf70=;
X-UUID: 9b2bc4a688d046fca68a704e1b7cce0f-20191122
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <ck.hu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 725854769; Fri, 22 Nov 2019 00:15:58 -0800
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Fri, 22 Nov 2019 00:06:21 -0800
Received: from mtkcas09.mediatek.inc (172.21.101.178) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Fri, 22 Nov 2019 16:05:51 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas09.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Fri, 22 Nov 2019 16:06:21 +0800
Message-ID: <1574409958.19450.1.camel@mtksdaap41>
Subject: Re: [PATCH v17 1/6] soc: mediatek: cmdq: fixup wrong input order of
 write api
From: CK Hu <ck.hu@mediatek.com>
To: Bibby Hsieh <bibby.hsieh@mediatek.com>
Date: Fri, 22 Nov 2019 16:05:58 +0800
In-Reply-To: <20191121015410.18852-2-bibby.hsieh@mediatek.com>
References: <20191121015410.18852-1-bibby.hsieh@mediatek.com>
 <20191121015410.18852-2-bibby.hsieh@mediatek.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191122_001604_030324_C8DF1BB3 
X-CRM114-Status: GOOD (  10.52  )
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
Cc: devicetree@vger.kernel.org, Nicolas
 Boichat <drinkcat@chromium.org>, srv_heupstream@mediatek.com,
 linux-kernel@vger.kernel.org, Dennis-YC Hsieh <dennis-yc.hsieh@mediatek.com>,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi, Bibby:

On Thu, 2019-11-21 at 09:54 +0800, Bibby Hsieh wrote:
> Fixup a issue was caused by the previous fixup patch.
> 

Reviewed-by: CK Hu <ck.hu@mediatek.com>

> Fixes: 1a92f989126e ("soc: mediatek: cmdq: reorder the parameter")
> 
> Signed-off-by: Bibby Hsieh <bibby.hsieh@mediatek.com>
> ---
>  drivers/soc/mediatek/mtk-cmdq-helper.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/soc/mediatek/mtk-cmdq-helper.c b/drivers/soc/mediatek/mtk-cmdq-helper.c
> index 7aa0517ff2f3..3c82de5f9417 100644
> --- a/drivers/soc/mediatek/mtk-cmdq-helper.c
> +++ b/drivers/soc/mediatek/mtk-cmdq-helper.c
> @@ -155,7 +155,7 @@ int cmdq_pkt_write_mask(struct cmdq_pkt *pkt, u8 subsys,
>  		err = cmdq_pkt_append_command(pkt, CMDQ_CODE_MASK, 0, ~mask);
>  		offset_mask |= CMDQ_WRITE_ENABLE_MASK;
>  	}
> -	err |= cmdq_pkt_write(pkt, value, subsys, offset_mask);
> +	err |= cmdq_pkt_write(pkt, subsys, offset_mask, value);
>  
>  	return err;
>  }

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
