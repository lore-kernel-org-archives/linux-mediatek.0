Return-Path: <SRS0=jhbW=2B=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_2
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB6C3C43603
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Dec 2019 01:58:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AA8EA205ED
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Dec 2019 01:58:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="NXSnAMJB";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="J/FSAdTO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AA8EA205ED
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5qLfTKr6bp13CHtZhP79vpHr1oQ3ycau4oAKjiXI3FA=; b=NXSnAMJBaidGx/
	RX4AQk08Ep4CFxEPLwgMuXOjlpDH9lJ3F1V3pEW7RfyM0FNBuk1tXMsYM7gxl2kW7uSlbEu/R7BbQ
	Zl8ZekqAVIyJf1dRObit/+nLWUWTfNTK41Oqh9f9hQxHnlQJ+wVrtRSmX7APuSIPZX/1oppmXlHmq
	uHXPc7YV3F1bSu+7WuUuEeUf7i4ElYoP1Auch+LLmLFmev5Op9FDXOiZPZN/+x5da9fIXHzTbeOXc
	zWU4IxumqieVd7rkcVM1PUDYGZoq+6Sa/gwKjcFcCTXBKfWFc3UESOlu79rGy651bY5qHCv1pkukt
	f3jpQORg6goFNuLl1/Qg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ierGw-0006jv-Sy; Wed, 11 Dec 2019 01:58:38 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ierGl-0006Z8-FL; Wed, 11 Dec 2019 01:58:28 +0000
X-UUID: d14fe9ff70be47ef943df9b1bb420cd5-20191210
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=sqQ1DVfAQShEvzPrqHNKDy4tI0jEIAeICULZI5AfwMw=; 
 b=J/FSAdTOdRqXo7TTzVE34BYBc4wdpei3wrEjp4ZrZ4tWUmyLj3hfU2WD5XeFQ3BjnGLV9iU7wqen75AIcpgCTPb1y1En+WaetQ0Wx69XyOzA1PPfkA+TaSRI+Pln38xVpl/ktdKMPQI/+2UMy35SdwQZhEOO56SyMyMvJY9G9fM=;
X-UUID: d14fe9ff70be47ef943df9b1bb420cd5-20191210
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <ck.hu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1956746249; Tue, 10 Dec 2019 17:58:23 -0800
Received: from mtkmbs08n2.mediatek.inc (172.21.101.56) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Tue, 10 Dec 2019 17:48:36 -0800
Received: from mtkcas09.mediatek.inc (172.21.101.178) by
 mtkmbs08n2.mediatek.inc (172.21.101.56) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Wed, 11 Dec 2019 09:47:21 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas09.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Wed, 11 Dec 2019 09:48:14 +0800
Message-ID: <1576028899.19653.5.camel@mtksdaap41>
Subject: Re: [PATCH v2 12/14] soc: mediatek: cmdq: add loop function
From: CK Hu <ck.hu@mediatek.com>
To: Dennis YC Hsieh <dennis-yc.hsieh@mediatek.com>
Date: Wed, 11 Dec 2019 09:48:19 +0800
In-Reply-To: <1574819937-6246-14-git-send-email-dennis-yc.hsieh@mediatek.com>
References: <1574819937-6246-1-git-send-email-dennis-yc.hsieh@mediatek.com>
 <1574819937-6246-14-git-send-email-dennis-yc.hsieh@mediatek.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: A5230DE48B16A267340064E1455F9D274E3E4DE6A9287E6E0E4EC648793AA9F82000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191210_175827_521221_7E2E32EF 
X-CRM114-Status: GOOD (  14.86  )
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
Cc: devicetree@vger.kernel.org, wsd_upstream@mediatek.com,
 Jassi Brar <jassisinghbrar@gmail.com>, linux-kernel@vger.kernel.org,
 Houlong Wei <houlong.wei@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Bibby Hsieh <bibby.hsieh@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi, Dennis:

On Wed, 2019-11-27 at 09:58 +0800, Dennis YC Hsieh wrote:
> Add finalize loop function in cmdq helper functions which loop whole pkt
> in gce hardware thread without cpu operation.
> 
> Signed-off-by: Dennis YC Hsieh <dennis-yc.hsieh@mediatek.com>
> ---
>  drivers/soc/mediatek/mtk-cmdq-helper.c | 22 ++++++++++++++++++++++
>  include/linux/soc/mediatek/mtk-cmdq.h  |  8 ++++++++
>  2 files changed, 30 insertions(+)
> 
> diff --git a/drivers/soc/mediatek/mtk-cmdq-helper.c b/drivers/soc/mediatek/mtk-cmdq-helper.c
> index 38e0c13e1922..10a9b4481e58 100644
> --- a/drivers/soc/mediatek/mtk-cmdq-helper.c
> +++ b/drivers/soc/mediatek/mtk-cmdq-helper.c
> @@ -414,6 +414,28 @@ int cmdq_pkt_finalize(struct cmdq_pkt *pkt)
>  }
>  EXPORT_SYMBOL(cmdq_pkt_finalize);
>  
> +int cmdq_pkt_finalize_loop(struct cmdq_pkt *pkt)
> +{
> +	struct cmdq_client *cl = pkt->cl;
> +	struct cmdq_instruction inst = { {0} };
> +	int err;
> +
> +	/* insert EOC and generate IRQ for each command iteration */
> +	inst.op = CMDQ_CODE_EOC;
> +	err = cmdq_pkt_append_command(pkt, inst);
> +	if (err < 0)
> +		return err;

It looks like you want a pkt execute command repeatedly, but why do you
repeatedly trigger IRQ? This IRQ would do nothing because this pkt would
never finish.

> +
> +	/* JUMP abaolute to begin */
> +	inst.op = CMDQ_CODE_JUMP;
> +	inst.offset = 1;
> +	inst.value = pkt->pa_base >> cmdq_mbox_shift(cl->chan);
> +	err = cmdq_pkt_append_command(pkt, inst);

Why not just export this function as cmdq_pkt_jump()? Let client decide
where to jump would be more flexible.

Regards,
CK

> +
> +	return err;
> +}
> +EXPORT_SYMBOL(cmdq_pkt_finalize_loop);
> +
>  static void cmdq_pkt_flush_async_cb(struct cmdq_cb_data data)
>  {
>  	struct cmdq_pkt *pkt = (struct cmdq_pkt *)data.data;
> diff --git a/include/linux/soc/mediatek/mtk-cmdq.h b/include/linux/soc/mediatek/mtk-cmdq.h
> index 998bc90f9da9..d15d8c941992 100644
> --- a/include/linux/soc/mediatek/mtk-cmdq.h
> +++ b/include/linux/soc/mediatek/mtk-cmdq.h
> @@ -212,6 +212,14 @@ int cmdq_pkt_assign(struct cmdq_pkt *pkt, u16 reg_idx, u32 value);
>   */
>  int cmdq_pkt_finalize(struct cmdq_pkt *pkt);
>  
> +/**
> + * cmdq_pkt_finalize_loop() - Append EOC and jump command to loop pkt.
> + * @pkt:	the CMDQ packet
> + *
> + * Return: 0 for success; else the error code is returned
> + */
> +int cmdq_pkt_finalize_loop(struct cmdq_pkt *pkt);
> +
>  /**
>   * cmdq_pkt_flush_async() - trigger CMDQ to asynchronously execute the CMDQ
>   *                          packet and call back at the end of done packet

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
