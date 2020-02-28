Return-Path: <SRS0=Knfd=4Q=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 126A5C3F2CD
	for <linux-mediatek@archiver.kernel.org>; Fri, 28 Feb 2020 14:33:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D8F5B246A8
	for <linux-mediatek@archiver.kernel.org>; Fri, 28 Feb 2020 14:33:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="q5Y07D55";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="VAVCai80"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D8F5B246A8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=l4DMGYVnQBcg0JwAiMT9m9cso5cW0P5Jkfa8Zr3Ay4c=; b=q5Y07D551fJddf
	HikxwQzJuFieaJYBsW6J7VD68KhDosmMcC0ImQKTVlApS2K4YGxRpgx6TD2abBdKgLNneROf7MLb8
	o/Ofwf2PUqc9hH/yeT8yZYOs5IIYZsN4qcD3xEX6rypuQF4TdA5DMKl/Udc/F1eMxbVwvYK5ukM2f
	kSpohVdy9d6LorZ8RwmxDbDZu3YVHhyhB+eMFMukDmK3X4QJQdtikfzMUZRIcq8D+FyQOrMcrwjaz
	tKHFEgtnFJ3Jk7YS9uFZOYYfVpGH8APMluB2DXULSYVHQADE8Uh1d8dzMMLr7nhBN8E/J5MkeN3t8
	+avtH348DeKf4cNz/MUA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j7ghI-0005Fq-Nq; Fri, 28 Feb 2020 14:33:00 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j7ghF-0005En-Cx; Fri, 28 Feb 2020 14:32:59 +0000
X-UUID: 736679a150794c12bca9f8957ce39144-20200228
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=tCcBPOv9JtXBkELXSRqCsT2eYGkv19cNJithXm3gQmI=; 
 b=VAVCai80NrxD4K5Eh66W9grjReFnDdjqjOzFLep5/tAnFcXaxG5CryHUhoACoKvZXaOAMCoMlMrQsvdw7DgtcDuV1/YnqNJLad58kO7SJKFPbhqPN0ta50054OseLr/g5gwdj3jwV7dHbwm1zzAV8vmNuSm+I+nygd+gyl0DOGU=;
X-UUID: 736679a150794c12bca9f8957ce39144-20200228
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <ck.hu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 467291780; Fri, 28 Feb 2020 06:32:52 -0800
Received: from mtkmbs05n2.mediatek.inc (172.21.101.140) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Fri, 28 Feb 2020 06:32:50 -0800
Received: from mtkcas09.mediatek.inc (172.21.101.178) by
 mtkmbs05n2.mediatek.inc (172.21.101.140) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Fri, 28 Feb 2020 22:31:51 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas09.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Fri, 28 Feb 2020 22:32:41 +0800
Message-ID: <1582900369.14824.2.camel@mtksdaap41>
Subject: Re: [PATCH v3 12/13] soc: mediatek: cmdq: add clear option in
 cmdq_pkt_wfe api
From: CK Hu <ck.hu@mediatek.com>
To: Dennis YC Hsieh <dennis-yc.hsieh@mediatek.com>
Date: Fri, 28 Feb 2020 22:32:49 +0800
In-Reply-To: <1582897461-15105-14-git-send-email-dennis-yc.hsieh@mediatek.com>
References: <1582897461-15105-1-git-send-email-dennis-yc.hsieh@mediatek.com>
 <1582897461-15105-14-git-send-email-dennis-yc.hsieh@mediatek.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200228_063258_373706_638F951B 
X-CRM114-Status: GOOD (  15.02  )
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
> Add clear parameter to let client decide if
> event should be clear to 0 after GCE receive it.
> 
> Signed-off-by: Dennis YC Hsieh <dennis-yc.hsieh@mediatek.com>
> ---
>  drivers/soc/mediatek/mtk-cmdq-helper.c   | 5 +++--
>  include/linux/mailbox/mtk-cmdq-mailbox.h | 3 +--
>  include/linux/soc/mediatek/mtk-cmdq.h    | 5 +++--
>  3 files changed, 7 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/soc/mediatek/mtk-cmdq-helper.c b/drivers/soc/mediatek/mtk-cmdq-helper.c
> index bbc68a7c81e9..406e1d34d234 100644
> --- a/drivers/soc/mediatek/mtk-cmdq-helper.c
> +++ b/drivers/soc/mediatek/mtk-cmdq-helper.c
> @@ -295,15 +295,16 @@ int cmdq_pkt_write_s_value(struct cmdq_pkt *pkt, u16 high_addr_reg_idx,
>  }
>  EXPORT_SYMBOL(cmdq_pkt_write_s_value);
>  
> -int cmdq_pkt_wfe(struct cmdq_pkt *pkt, u16 event)
> +int cmdq_pkt_wfe(struct cmdq_pkt *pkt, u16 event, bool clear)
>  {
>  	struct cmdq_instruction inst = { {0} };
> +	u32 clear_option = clear ? CMDQ_WFE_UPDATE : 0;
>  
>  	if (event >= CMDQ_MAX_EVENT)
>  		return -EINVAL;
>  
>  	inst.op = CMDQ_CODE_WFE;
> -	inst.value = CMDQ_WFE_OPTION;
> +	inst.value = CMDQ_WFE_OPTION | clear_option;
>  	inst.event = event;
>  
>  	return cmdq_pkt_append_command(pkt, inst);
> diff --git a/include/linux/mailbox/mtk-cmdq-mailbox.h b/include/linux/mailbox/mtk-cmdq-mailbox.h
> index 3f6bc0dfd5da..42d2a30e6a70 100644
> --- a/include/linux/mailbox/mtk-cmdq-mailbox.h
> +++ b/include/linux/mailbox/mtk-cmdq-mailbox.h
> @@ -27,8 +27,7 @@
>   * bit 16-27: update value
>   * bit 31: 1 - update, 0 - no update
>   */
> -#define CMDQ_WFE_OPTION			(CMDQ_WFE_UPDATE | CMDQ_WFE_WAIT | \
> -					CMDQ_WFE_WAIT_VALUE)
> +#define CMDQ_WFE_OPTION			(CMDQ_WFE_WAIT | CMDQ_WFE_WAIT_VALUE)
>  
>  /** cmdq event maximum */
>  #define CMDQ_MAX_EVENT			0x3ff
> diff --git a/include/linux/soc/mediatek/mtk-cmdq.h b/include/linux/soc/mediatek/mtk-cmdq.h
> index 1a6c56f3bec1..d63749440697 100644
> --- a/include/linux/soc/mediatek/mtk-cmdq.h
> +++ b/include/linux/soc/mediatek/mtk-cmdq.h
> @@ -152,11 +152,12 @@ int cmdq_pkt_write_s_value(struct cmdq_pkt *pkt, u16 high_addr_reg_idx,
>  /**
>   * cmdq_pkt_wfe() - append wait for event command to the CMDQ packet
>   * @pkt:	the CMDQ packet
> - * @event:	the desired event type to "wait and CLEAR"
> + * @event:	the desired event type to wait
> + * @clear:	clear event or not after event arrive
>   *
>   * Return: 0 for success; else the error code is returned
>   */
> -int cmdq_pkt_wfe(struct cmdq_pkt *pkt, u16 event);
> +int cmdq_pkt_wfe(struct cmdq_pkt *pkt, u16 event, bool clear);

I think you should modify client driver [1] as well in this patch.
Change it to

cmdq_pkt_wfe(cmdq_handle, mtk_crtc->cmdq_event, false);

[1]
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/gpu/drm/mediatek/mtk_drm_crtc.c?h=v5.6-rc3#n491

Regards,
CK

>  
>  /**
>   * cmdq_pkt_clear_event() - append clear event command to the CMDQ packet

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
