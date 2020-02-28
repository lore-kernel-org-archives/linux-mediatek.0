Return-Path: <SRS0=Knfd=4Q=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A22A8C3F2D2
	for <linux-mediatek@archiver.kernel.org>; Fri, 28 Feb 2020 14:50:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 644AD2064A
	for <linux-mediatek@archiver.kernel.org>; Fri, 28 Feb 2020 14:50:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Ki2I558V";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="YLytEba7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 644AD2064A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JZX8lRmPhGW8s2tzprEwtESpNB5gqs28Mp3Agv/OM44=; b=Ki2I558VNpPShA
	6XS+2F1+xM7aWVOjszT92Rm5zQaneF1Z1AVYifvVNjOLGLuL6t+6n2V/Yi8n4XOhpBpt4V0Tyfw1d
	vtpA2jVKovzKJYJlWfikpxcMEiFfu6IqOdK+0KJFP9+yDgx7V4eqvithsU8cJSUD9AHGU2Ntu4i+L
	TSEu4v5qrKD0OqGJS1MpfA5jhPeV4+53qZMQU1VIxn0b234Kyk9b2XMpP9M0O0w60YiqPF/MHb256
	J8QpcQSuxTyEeYnJqS5HuU8XQU84oK2w1dshFsCe8ix2cPokExXZAXwVWWR7RoZZNV8Vq4izPZPEe
	Ra7vaZkQqtI4Pi29SSwQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j7gyK-0005Qy-5z; Fri, 28 Feb 2020 14:50:36 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j7gyH-0005QV-Hr; Fri, 28 Feb 2020 14:50:34 +0000
X-UUID: 6ac6d0c8f0734ca1935086fcc80e184f-20200228
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=3ueQZiL6nqQ1TnauprptHOqb48LlnkrdGjJXo+9vhGU=; 
 b=YLytEba7vqp2f7g44YkAQsuG/ZtdhKmYs7fSyheKOaFMRpSwlBC+APrNds8M/Fxxl1pD+SE/9AZVzARtgINpALS/JuG0vmZUIt5EP21XiY/lMptw4exQkCdc4ZeMYwB9UkYhsG2Z5siIm3j2ubOMpWPjNH6h1n6Gm4/xlgUcZIg=;
X-UUID: 6ac6d0c8f0734ca1935086fcc80e184f-20200228
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <ck.hu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1935001937; Fri, 28 Feb 2020 06:50:28 -0800
Received: from mtkmbs05n1.mediatek.inc (172.21.101.15) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Fri, 28 Feb 2020 06:50:26 -0800
Received: from mtkcas09.mediatek.inc (172.21.101.178) by
 mtkmbs05n1.mediatek.inc (172.21.101.15) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Fri, 28 Feb 2020 22:49:21 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas09.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Fri, 28 Feb 2020 22:50:11 +0800
Message-ID: <1582901419.14824.5.camel@mtksdaap41>
Subject: Re: [PATCH v3 08/13] soc: mediatek: cmdq: add read_s function
From: CK Hu <ck.hu@mediatek.com>
To: Dennis YC Hsieh <dennis-yc.hsieh@mediatek.com>
Date: Fri, 28 Feb 2020 22:50:19 +0800
In-Reply-To: <1582897461-15105-10-git-send-email-dennis-yc.hsieh@mediatek.com>
References: <1582897461-15105-1-git-send-email-dennis-yc.hsieh@mediatek.com>
 <1582897461-15105-10-git-send-email-dennis-yc.hsieh@mediatek.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200228_065033_598226_2300E9D2 
X-CRM114-Status: GOOD (  14.40  )
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
Cc: devicetree@vger.kernel.org, srv_heupstream@mediatek.com,
 wsd_upstream@mediatek.com, Jassi Brar <jassisinghbrar@gmail.com>,
 linux-kernel@vger.kernel.org, Houlong Wei <houlong.wei@mediatek.com>,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 Bibby Hsieh <bibby.hsieh@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Ming-Fan Chen <ming-fan.chen@mediatek.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi, Dennis:

On Fri, 2020-02-28 at 21:44 +0800, Dennis YC Hsieh wrote:
> Add read_s function in cmdq helper functions which support read value from
> register or dma physical address into gce internal register.
> 

Reviewed-by: CK Hu <ck.hu@mediatek.com>

> Signed-off-by: Dennis YC Hsieh <dennis-yc.hsieh@mediatek.com>
> ---
>  drivers/soc/mediatek/mtk-cmdq-helper.c   | 15 +++++++++++++++
>  include/linux/mailbox/mtk-cmdq-mailbox.h |  1 +
>  include/linux/soc/mediatek/mtk-cmdq.h    | 13 +++++++++++++
>  3 files changed, 29 insertions(+)
> 
> diff --git a/drivers/soc/mediatek/mtk-cmdq-helper.c b/drivers/soc/mediatek/mtk-cmdq-helper.c
> index 68b42c935fe6..428f99288ca6 100644
> --- a/drivers/soc/mediatek/mtk-cmdq-helper.c
> +++ b/drivers/soc/mediatek/mtk-cmdq-helper.c
> @@ -226,6 +226,21 @@ int cmdq_pkt_write_mask(struct cmdq_pkt *pkt, u8 subsys,
>  }
>  EXPORT_SYMBOL(cmdq_pkt_write_mask);
>  
> +int cmdq_pkt_read_s(struct cmdq_pkt *pkt, u16 high_addr_reg_idx, u16 addr_low,
> +		    u16 reg_idx)
> +{
> +	struct cmdq_instruction inst = { {0} };
> +
> +	inst.op = CMDQ_CODE_READ_S;
> +	inst.dst_t = CMDQ_REG_TYPE;
> +	inst.sop = high_addr_reg_idx;
> +	inst.reg_dst = reg_idx;
> +	inst.src_reg = addr_low;
> +
> +	return cmdq_pkt_append_command(pkt, inst);
> +}
> +EXPORT_SYMBOL(cmdq_pkt_read_s);
> +
>  int cmdq_pkt_write_s(struct cmdq_pkt *pkt, u16 high_addr_reg_idx,
>  		     u16 addr_low, u16 src_reg_idx, u32 mask)
>  {
> diff --git a/include/linux/mailbox/mtk-cmdq-mailbox.h b/include/linux/mailbox/mtk-cmdq-mailbox.h
> index 8ef87e1bd03b..3f6bc0dfd5da 100644
> --- a/include/linux/mailbox/mtk-cmdq-mailbox.h
> +++ b/include/linux/mailbox/mtk-cmdq-mailbox.h
> @@ -59,6 +59,7 @@ enum cmdq_code {
>  	CMDQ_CODE_JUMP = 0x10,
>  	CMDQ_CODE_WFE = 0x20,
>  	CMDQ_CODE_EOC = 0x40,
> +	CMDQ_CODE_READ_S = 0x80,
>  	CMDQ_CODE_WRITE_S = 0x90,
>  	CMDQ_CODE_WRITE_S_MASK = 0x91,
>  	CMDQ_CODE_LOGIC = 0xa0,
> diff --git a/include/linux/soc/mediatek/mtk-cmdq.h b/include/linux/soc/mediatek/mtk-cmdq.h
> index c72d826d8934..01b4184af310 100644
> --- a/include/linux/soc/mediatek/mtk-cmdq.h
> +++ b/include/linux/soc/mediatek/mtk-cmdq.h
> @@ -104,6 +104,19 @@ int cmdq_pkt_write(struct cmdq_pkt *pkt, u8 subsys, u16 offset, u32 value);
>  int cmdq_pkt_write_mask(struct cmdq_pkt *pkt, u8 subsys,
>  			u16 offset, u32 value, u32 mask);
>  
> +/*
> + * cmdq_pkt_read_s() - append read_s command to the CMDQ packet
> + * @pkt:	the CMDQ packet
> + * @high_addr_reg_idx:	internal regisger ID which contains high address of pa
> + * @addr_low:	low address of pa
> + * @addr:	the physical address of register or dma to read
> + * @reg_idx:	the CMDQ internal register ID to cache read data
> + *
> + * Return: 0 for success; else the error code is returned
> + */
> +int cmdq_pkt_read_s(struct cmdq_pkt *pkt, u16 high_addr_reg_idx, u16 addr_low,
> +		    u16 reg_idx);
> +
>  /**
>   * cmdq_pkt_write_s() - append write_s command to the CMDQ packet
>   * @pkt:	the CMDQ packet

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
