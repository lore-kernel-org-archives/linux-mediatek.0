Return-Path: <SRS0=cHEQ=4V=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_2
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5517C3F2CE
	for <linux-mediatek@archiver.kernel.org>; Wed,  4 Mar 2020 03:10:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B90A420866
	for <linux-mediatek@archiver.kernel.org>; Wed,  4 Mar 2020 03:10:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="MeczOfIC";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="R1m1Kaji"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B90A420866
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=h9FhZPeThIkFLHUoGBut+XmczzQT8Ly44/JpFlqsaEU=; b=MeczOfICOrDwbu
	Hayo48a/p/v3btjxTfsgMUgLkhFE66hOnoSwBTygISfy+UH5Q4hE4uM+UQyMTjGIqU7t2e7qY3KRx
	XbHcrkA1AEzEGwwXcKVEv5mY8pr3283z4v9aOHT2Nu+0opa8yVvySr8ilMKo/R+KK7ZfqwE7Tus8r
	7W5AfhqhIIhhJFDLpP1WwV5ZgDTSJutNvjZn/ElKOtmCSUnnQpSSl/zt/q0pjG08V4TXw40IJAiGB
	EnTW+g/ptLxLWCLFCt4bpulWgF3aDfof+/NSOYOQhszRxIrnw7deHr55mdfdONMuCNwgKhLRAfkaJ
	NovxdaXQJO2Ys0WRM8Gg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j9KQC-0001XC-2o; Wed, 04 Mar 2020 03:10:08 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j9KPo-0000eF-MD; Wed, 04 Mar 2020 03:09:46 +0000
X-UUID: 8f499e24a3934a1184a2606b8a481a0f-20200303
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=uV6XAfR45kceIz/xzf1Y2H5SW6enf8ExjM5OoLYTjuM=; 
 b=R1m1Kaji0qro6LvyKkTo0iX3Zu3IK6TbdIOdIEPuHlaiIycUB8H4h9lhhkXJxTo6DEkrKGtLdyBp7YOC9DmRu8LDdi8vDSM944v7r9p/fm89cYFSTPTcinz9ug+tjiMmTHTLHb75gMgNjGTbGNbYiOAKdWxs0LQdIuR9pMWIV8s=;
X-UUID: 8f499e24a3934a1184a2606b8a481a0f-20200303
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <ck.hu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1755466338; Tue, 03 Mar 2020 19:09:40 -0800
Received: from mtkmbs05n2.mediatek.inc (172.21.101.140) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Tue, 3 Mar 2020 19:05:27 -0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs05n2.mediatek.inc (172.21.101.140) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Wed, 4 Mar 2020 11:04:25 +0800
Received: from [172.21.77.4] (172.21.77.4) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Wed, 4 Mar 2020 11:02:54 +0800
Message-ID: <1583291126.1062.7.camel@mtksdaap41>
Subject: Re: [PATCH v4 12/13] soc: mediatek: cmdq: add clear option in
 cmdq_pkt_wfe api
From: CK Hu <ck.hu@mediatek.com>
To: Dennis YC Hsieh <dennis-yc.hsieh@mediatek.com>
Date: Wed, 4 Mar 2020 11:05:26 +0800
In-Reply-To: <1583233125-7827-13-git-send-email-dennis-yc.hsieh@mediatek.com>
References: <1583233125-7827-1-git-send-email-dennis-yc.hsieh@mediatek.com>
 <1583233125-7827-13-git-send-email-dennis-yc.hsieh@mediatek.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200303_190944_760005_AB98F96B 
X-CRM114-Status: GOOD (  17.77  )
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
 Daniel Vetter <daniel@ffwll.ch>, wsd_upstream@mediatek.com, David
 Airlie <airlied@linux.ie>, Jassi Brar <jassisinghbrar@gmail.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 HS Liao <hs.liao@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Houlong Wei <houlong.wei@mediatek.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Bibby Hsieh <bibby.hsieh@mediatek.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi, Dennis:

On Tue, 2020-03-03 at 18:58 +0800, Dennis YC Hsieh wrote:
> Add clear parameter to let client decide if
> event should be clear to 0 after GCE receive it.
> 
> Signed-off-by: Dennis YC Hsieh <dennis-yc.hsieh@mediatek.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_drm_crtc.c  | 2 +-
>  drivers/soc/mediatek/mtk-cmdq-helper.c   | 5 +++--
>  include/linux/mailbox/mtk-cmdq-mailbox.h | 3 +--
>  include/linux/soc/mediatek/mtk-cmdq.h    | 5 +++--
>  4 files changed, 8 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> index 7daaabc26eb1..4916a7f75d23 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> @@ -488,7 +488,7 @@ static void mtk_drm_crtc_hw_config(struct mtk_drm_crtc *mtk_crtc)
>  	if (mtk_crtc->cmdq_client) {
>  		cmdq_handle = cmdq_pkt_create(mtk_crtc->cmdq_client, PAGE_SIZE);
>  		cmdq_pkt_clear_event(cmdq_handle, mtk_crtc->cmdq_event);
> -		cmdq_pkt_wfe(cmdq_handle, mtk_crtc->cmdq_event);
> +		cmdq_pkt_wfe(cmdq_handle, mtk_crtc->cmdq_event, true);

There is always clear event before wait event, so there is no need to
clear event after event is waited. So this should be

cmdq_pkt_wfe(cmdq_handle, mtk_crtc->cmdq_event, false);

Regards,
CK

>  		mtk_crtc_ddp_config(crtc, cmdq_handle);
>  		cmdq_pkt_finalize(cmdq_handle);
>  		cmdq_pkt_flush_async(cmdq_handle, ddp_cmdq_cb, cmdq_handle);
> diff --git a/drivers/soc/mediatek/mtk-cmdq-helper.c b/drivers/soc/mediatek/mtk-cmdq-helper.c
> index f27c67034880..4f767198d0fc 100644
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
>  
>  /**
>   * cmdq_pkt_clear_event() - append clear event command to the CMDQ packet

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
