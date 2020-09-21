Return-Path: <SRS0=GXkz=C6=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9AEA9C43466
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Sep 2020 16:20:05 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0089620708
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Sep 2020 16:20:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="CZ97KnC5";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ryoM2PMy"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0089620708
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=MZfNsySrHGj/91t+7REiWCMKvTsRu/n5xU01Zl9jGr8=; b=CZ97KnC5y1NxBUMpWIz45dWY3
	FzXf6WxYfABmtuWnXVSJwr0TifN+M4sh7zYExvNmOc5WZy8nOhccoZPFyckaGYmu/n03vT5hoTM7V
	dANj1AFSp+QmMe4g+HsfFEMrGpso1wSMX+pMn7AXMHCSixGm3pxDS3+MlkuTgl38VTZvO8EGPoEK/
	O3UTecxwg7/Dgagu8ORK0GrA4LCzpQXRaUj7xE/mHxyzb25nzFlkDtLaf5iDJFJ99DgSrc0vn6tkl
	xoESc/WZDU0wKROp18y42X3BSKt812u5g1A1IzhGcXGrkqmpjEUSWUPw7YXJ5dd2xJmi2N5JIvm6S
	q79dv0Ayw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kKOXd-0003qu-8A; Mon, 21 Sep 2020 16:19:49 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kKOXV-0003l5-AM; Mon, 21 Sep 2020 16:19:42 +0000
Received: by mail-wm1-x343.google.com with SMTP id k18so77323wmj.5;
 Mon, 21 Sep 2020 09:19:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=2Um6c81r/1MBT+fI9iGjg9/o4XDqZdY7rKMNqEREgyE=;
 b=ryoM2PMyrWMXEMclmgyN0lykLS3VG6GXyKh4BC5ZVuURKw5hMiI7c0HZAetAVJ9uHu
 WHPCmKob3GZAwHB0bI+A+2bGumaPKa/LcayBImqxBLqSTWGPWgRIMaJNnzvsltdIClFm
 RkamjI+3JgSIgX4e1nBRWo7MQ7hnY7fBVUTSj05a22ySRbVJdIZNenzaMknU984WS4Ff
 oJXiT3JErczZ+ll+Fj95go1Z4vbo6Ay394q5fOCK4bcUb0WH0Lj7f+j3SmVyZSGTA862
 vTxr3cmVPwuCj3G6rHPq98xrSw5GP3ZVb+Ds8kVgwUWtg000Tnlu5BKL9ISmU0qFih12
 YEIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=2Um6c81r/1MBT+fI9iGjg9/o4XDqZdY7rKMNqEREgyE=;
 b=cAGLv60ZRh8IggNaca91D69Lft+xvAsweinBLI0H2iCUw7gJYoNtcuLJc9TiVo9ugn
 8i4mCgsCDMt3wAVXE3kGwSYnyofZuiEZTXiCsB+URxmoB7weDSDicUuGTtlZbpgUA5lK
 LvhzjzfBxzveyOA5/nuRmeCv7NA6BCJi1SD4+rMD3M9Ql+3MxBGGfWiM8SbRsdazstge
 iuq8HXnoGplsmWubkISh+E+Ok8SuIizhhp8FV37x5U4Ejytb++ZSf62U+mbYSC7wsKVl
 DfjzQ1du5kOLHQG78Q+pkaEWDg51Y1txQfXj4GbwoF1IVsnu5tTdhGu03d1xMP7KaM32
 fKlg==
X-Gm-Message-State: AOAM5311Oifj2Tqno3piGG5lKoSJ1ISbaQp0DqirlLzMJTxZTRHiKOup
 5iOEZBrUBbWC+WwWPvjXl0Y=
X-Google-Smtp-Source: ABdhPJxs7Ibc11EIGRwgCKphObeQv/hmih2hCL7dWsWP43DVc7B0GpSzQHeXgsihEEbfpQhdROSDTQ==
X-Received: by 2002:a1c:2cc2:: with SMTP id s185mr145783wms.77.1600705179633; 
 Mon, 21 Sep 2020 09:19:39 -0700 (PDT)
Received: from ziggy.stardust ([213.195.113.201])
 by smtp.gmail.com with ESMTPSA id a83sm67121wmh.48.2020.09.21.09.19.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Sep 2020 09:19:39 -0700 (PDT)
Subject: Re: [PATCH v3 8/9] soc: mediatek: cmdq: add clear option in
 cmdq_pkt_wfe api
To: Dennis YC Hsieh <dennis-yc.hsieh@mediatek.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, CK Hu <ck.hu@mediatek.com>,
 Bibby Hsieh <bibby.hsieh@mediatek.com>,
 Houlong Wei <houlong.wei@mediatek.com>
References: <1594136714-11650-1-git-send-email-dennis-yc.hsieh@mediatek.com>
 <1594136714-11650-9-git-send-email-dennis-yc.hsieh@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <728ace99-e5e6-f8bf-1687-e9b51dfae8d7@gmail.com>
Date: Mon, 21 Sep 2020 18:19:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <1594136714-11650-9-git-send-email-dennis-yc.hsieh@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200921_121941_470431_FFA2659E 
X-CRM114-Status: GOOD (  25.36  )
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
Cc: wsd_upstream@mediatek.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, HS Liao <hs.liao@mediatek.com>,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



On 07/07/2020 17:45, Dennis YC Hsieh wrote:
> Add clear parameter to let client decide if
> event should be clear to 0 after GCE receive it.
> 
> Change since v2:
> - Keep behavior in drm crtc driver and
>    separate bug fix code into another patch.

This, should go...

> 
> Signed-off-by: Dennis YC Hsieh <dennis-yc.hsieh@mediatek.com>
> ---

...here :)

I fixed to commit message and pushed the patch to v5.9-next/soc

Thanks!

>   drivers/gpu/drm/mediatek/mtk_drm_crtc.c  |    2 +-
>   drivers/soc/mediatek/mtk-cmdq-helper.c   |    5 +++--
>   include/linux/mailbox/mtk-cmdq-mailbox.h |    3 +--
>   include/linux/soc/mediatek/mtk-cmdq.h    |    5 +++--
>   4 files changed, 8 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> index ec6c9ffbf35e..c84e7a14d4a8 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> @@ -490,7 +490,7 @@ static void mtk_drm_crtc_hw_config(struct mtk_drm_crtc *mtk_crtc)
>   		mbox_flush(mtk_crtc->cmdq_client->chan, 2000);
>   		cmdq_handle = cmdq_pkt_create(mtk_crtc->cmdq_client, PAGE_SIZE);
>   		cmdq_pkt_clear_event(cmdq_handle, mtk_crtc->cmdq_event);
> -		cmdq_pkt_wfe(cmdq_handle, mtk_crtc->cmdq_event);
> +		cmdq_pkt_wfe(cmdq_handle, mtk_crtc->cmdq_event, true);
>   		mtk_crtc_ddp_config(crtc, cmdq_handle);
>   		cmdq_pkt_finalize(cmdq_handle);
>   		cmdq_pkt_flush_async(cmdq_handle, ddp_cmdq_cb, cmdq_handle);
> diff --git a/drivers/soc/mediatek/mtk-cmdq-helper.c b/drivers/soc/mediatek/mtk-cmdq-helper.c
> index d55dc3296105..505651b0d715 100644
> --- a/drivers/soc/mediatek/mtk-cmdq-helper.c
> +++ b/drivers/soc/mediatek/mtk-cmdq-helper.c
> @@ -316,15 +316,16 @@ int cmdq_pkt_write_s_mask_value(struct cmdq_pkt *pkt, u8 high_addr_reg_idx,
>   }
>   EXPORT_SYMBOL(cmdq_pkt_write_s_mask_value);
>   
> -int cmdq_pkt_wfe(struct cmdq_pkt *pkt, u16 event)
> +int cmdq_pkt_wfe(struct cmdq_pkt *pkt, u16 event, bool clear)
>   {
>   	struct cmdq_instruction inst = { {0} };
> +	u32 clear_option = clear ? CMDQ_WFE_UPDATE : 0;
>   
>   	if (event >= CMDQ_MAX_EVENT)
>   		return -EINVAL;
>   
>   	inst.op = CMDQ_CODE_WFE;
> -	inst.value = CMDQ_WFE_OPTION;
> +	inst.value = CMDQ_WFE_OPTION | clear_option;
>   	inst.event = event;
>   
>   	return cmdq_pkt_append_command(pkt, inst);
> diff --git a/include/linux/mailbox/mtk-cmdq-mailbox.h b/include/linux/mailbox/mtk-cmdq-mailbox.h
> index efbd8a9eb2d1..d5a983d65f05 100644
> --- a/include/linux/mailbox/mtk-cmdq-mailbox.h
> +++ b/include/linux/mailbox/mtk-cmdq-mailbox.h
> @@ -28,8 +28,7 @@
>    * bit 16-27: update value
>    * bit 31: 1 - update, 0 - no update
>    */
> -#define CMDQ_WFE_OPTION			(CMDQ_WFE_UPDATE | CMDQ_WFE_WAIT | \
> -					CMDQ_WFE_WAIT_VALUE)
> +#define CMDQ_WFE_OPTION			(CMDQ_WFE_WAIT | CMDQ_WFE_WAIT_VALUE)
>   
>   /** cmdq event maximum */
>   #define CMDQ_MAX_EVENT			0x3ff
> diff --git a/include/linux/soc/mediatek/mtk-cmdq.h b/include/linux/soc/mediatek/mtk-cmdq.h
> index 34354e952f60..960704d75994 100644
> --- a/include/linux/soc/mediatek/mtk-cmdq.h
> +++ b/include/linux/soc/mediatek/mtk-cmdq.h
> @@ -182,11 +182,12 @@ int cmdq_pkt_write_s_mask_value(struct cmdq_pkt *pkt, u8 high_addr_reg_idx,
>   /**
>    * cmdq_pkt_wfe() - append wait for event command to the CMDQ packet
>    * @pkt:	the CMDQ packet
> - * @event:	the desired event type to "wait and CLEAR"
> + * @event:	the desired event type to wait
> + * @clear:	clear event or not after event arrive
>    *
>    * Return: 0 for success; else the error code is returned
>    */
> -int cmdq_pkt_wfe(struct cmdq_pkt *pkt, u16 event);
> +int cmdq_pkt_wfe(struct cmdq_pkt *pkt, u16 event, bool clear);
>   
>   /**
>    * cmdq_pkt_clear_event() - append clear event command to the CMDQ packet
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
