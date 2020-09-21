Return-Path: <SRS0=GXkz=C6=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06049C43468
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Sep 2020 16:37:01 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B31B42399C
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Sep 2020 16:37:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="JtPoJkl4";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fnaYptNQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B31B42399C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=+9AbCjmblkGPpcmDgGiKZfekKTJR6W59S1BCJ9Vg1dw=; b=JtPoJkl4Fczx+4c2kfddUrYuF
	XZjq/n/eZM8mUN0TMqrb6Zb6xA+Oga9T3JPv9FyULhmrBeOPRwhwouXSlfDqPmgADitgkeKp5Bj8a
	lSfIhT7aNfZDk4hjBpnjcbbOjWl1EBBDzQZjaM3UJYyvv3U+Dx1gVOGcp6Uy6sJxocTAxeog6F679
	r2gefHyUOZmFqNKZ2TeoPHloPE9XDdrx3eDg222/cXHGmTndga3Jl+w0N1K/xzdEus5NW9aPKVDyr
	MIJtU7ZuhDGEwwLwxIJbKgKI7a/8HkG4vwN8OgBJ5G5AzNqEZfO7PE/td09P8zDm0FKYpVKhcMtiC
	iDd/Z4sTw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kKOo7-0001QB-Gh; Mon, 21 Sep 2020 16:36:51 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kKOo4-0001PS-Q3; Mon, 21 Sep 2020 16:36:49 +0000
Received: by mail-wr1-x442.google.com with SMTP id s12so13480032wrw.11;
 Mon, 21 Sep 2020 09:36:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=i047OCSlx026/Yej+lLApd9wks4kMyKz8RfAY/wU+IY=;
 b=fnaYptNQLJYqN12KIQYAO8/g/W6HQUgEF41DUo46RaMSJaY36li9p7HpTRpmi9U7rb
 Sq/1WAR85VQcUe+WA4dnt3WA6SbIz+HKT6LVg+iUaFbuZqwFpSp9Ox7GYa9NLFjCYXDC
 26u7SC9YVkT4804uJ2HL4vDZ3zZfM83cq/fpoVrTIOv3X4KtDf7MXt0a4W189zvn42dw
 Ekp6oNtMVf98ZVKQ6wbJowG9+XRxPu15rSDCwSGtK0pLh1cevPCWXbmOjzEzvj1AwXCO
 y4iEBigx+MybfZ8YKfnIUgpwlhsctTdYu1i2qO/m34CTtPRdM8xbsE3IMm8Hon/fZkOR
 ANjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=i047OCSlx026/Yej+lLApd9wks4kMyKz8RfAY/wU+IY=;
 b=c7A3N5onHdUTSkQRIx81FQmXcTCCTVskAvMfJ43U/viGkyzKg61UO3ahlHHFuAhP0a
 bFpZGNNb2Y7gBSpGHIeZGgA1wrLk7xxr2rioJ/BhbFtIq34B0WlH+IKj1xex8tZpzIq+
 kWuuLNRpfTakUFurqfTngU2RcL71Y+6wkWYg2Z881Ak+ANLTWrr7/lqcINYYvN1IyD4e
 jUOQZf1hyzrT3qAJ6Dnjwi6gVyKNuYNfcgwl9eB7bA8qxUp67lCGib0GzxT987LRwG8+
 kmaljpB778tNUWyWyE1SXyGE/1iBLbK6l6zwzHi/UdL4Rrb/m8XnWb30gSL408iqm73B
 DwVg==
X-Gm-Message-State: AOAM531qMkfZYyPduZ4VEcefrfcNrq29OFgJuc3eL+Whhl1bm6EjWMBt
 peAI1eUQYI+F9fHTZsXyE/E=
X-Google-Smtp-Source: ABdhPJyE6UTU+NOoQbGA0PsvLxZuHcEl/orKyvrLnH2D9aPBBwzeT9orNU7S0BsGCCw3FJwRz3Lzlw==
X-Received: by 2002:a5d:444e:: with SMTP id x14mr578878wrr.235.1600706207846; 
 Mon, 21 Sep 2020 09:36:47 -0700 (PDT)
Received: from ziggy.stardust ([213.195.113.201])
 by smtp.gmail.com with ESMTPSA id s12sm201994wmd.20.2020.09.21.09.36.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Sep 2020 09:36:47 -0700 (PDT)
Subject: Re: [PATCH v3 9/9] drm/mediatek: reduce clear event
To: Bibby Hsieh <bibby.hsieh@mediatek.com>,
 Dennis YC Hsieh <dennis-yc.hsieh@mediatek.com>
References: <1594136714-11650-1-git-send-email-dennis-yc.hsieh@mediatek.com>
 <1594136714-11650-10-git-send-email-dennis-yc.hsieh@mediatek.com>
 <1594262378.21095.3.camel@mtksdaap41>
From: Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <826a79e6-7d4d-90e5-d9a7-4724753dc2d7@gmail.com>
Date: Mon, 21 Sep 2020 18:36:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <1594262378.21095.3.camel@mtksdaap41>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200921_123648_860696_203A9223 
X-CRM114-Status: GOOD (  23.57  )
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
Cc: Philipp Zabel <p.zabel@pengutronix.de>, wsd_upstream@mediatek.com,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, HS Liao <hs.liao@mediatek.com>,
 linux-mediatek@lists.infradead.org, Houlong Wei <houlong.wei@mediatek.com>,
 Daniel Vetter <daniel@ffwll.ch>, CK Hu <ck.hu@mediatek.com>,
 linux-arm-kernel@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



On 09/07/2020 04:39, Bibby Hsieh wrote:
> Hi, Dennis,
> 
> Thanks for this patch.
> 
> It's better to send another tree for this patch.
> Because this tree is only for soc/mediatek.
> 
> Please do not forget to add the dependency information.

Normally you are right. This time I took this patch as well into my tree. I 
verified with the merge tag from CKs DRM tree that we don't have any conflicts, 
so we should be Ok.

Regards,
Matthias

> 
> Bibby
> 
> On Tue, 2020-07-07 at 23:45 +0800, Dennis YC Hsieh wrote:
>> No need to clear event again since event always clear before wait.
>> This fix depend on patch:
>>    "soc: mediatek: cmdq: add clear option in cmdq_pkt_wfe api"
>>
>> Fixes: 2f965be7f9008 ("drm/mediatek: apply CMDQ control flow")
>> Signed-off-by: Dennis YC Hsieh <dennis-yc.hsieh@mediatek.com>
> 
> Reviewed-by: Bibby Hsieh <bibby.hsieh@mediatek.com>
> 
>> ---
>>   drivers/gpu/drm/mediatek/mtk_drm_crtc.c |    2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
>> index c84e7a14d4a8..ba6cf956b239 100644
>> --- a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
>> +++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
>> @@ -490,7 +490,7 @@ static void mtk_drm_crtc_hw_config(struct mtk_drm_crtc *mtk_crtc)
>>   		mbox_flush(mtk_crtc->cmdq_client->chan, 2000);
>>   		cmdq_handle = cmdq_pkt_create(mtk_crtc->cmdq_client, PAGE_SIZE);
>>   		cmdq_pkt_clear_event(cmdq_handle, mtk_crtc->cmdq_event);
>> -		cmdq_pkt_wfe(cmdq_handle, mtk_crtc->cmdq_event, true);
>> +		cmdq_pkt_wfe(cmdq_handle, mtk_crtc->cmdq_event, false);
>>   		mtk_crtc_ddp_config(crtc, cmdq_handle);
>>   		cmdq_pkt_finalize(cmdq_handle);
>>   		cmdq_pkt_flush_async(cmdq_handle, ddp_cmdq_cb, cmdq_handle);
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
