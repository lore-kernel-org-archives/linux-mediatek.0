Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E582C5475B
	for <linux-mediatek@archiver.kernel.org>; Fri,  1 Mar 2024 08:52:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tbz1IBvzdGXtnE0b9kwcxvlJqqwyHIFlAOoiq8cJmJI=; b=xMUeMWLrRAp88Y95c2DwxSga+k
	7myKkROetSDMRoh3KuwagF0I9U1RFcIj13IAoq42F3mNLd4j/jodFgTd95f1EJPbeVCqxvLFH9m/I
	V4s37NAw4CUIKbfSMioYmKLxmct8J3CMFuc6iScl3Loljsi1Quk2VqpRgpgI3TMKLfBlbRxT0ElGn
	lYlX7TNAlPCRxqcCfUcpZ4jhTk78IEPNaI/Yo9SpkscbsobSzxLh2Y46a48KTrSg0LWiQkBhawnJu
	FvEHNd9INmq+JA1VNunCtzHWEfB0Vdy43CCwFVetD4vZ50Re0lx5+K84jwE2u89vxgcyhFMHCSsua
	nbpvCidw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfycb-0000000H01y-3K1k;
	Fri, 01 Mar 2024 08:52:01 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfycY-0000000Gzxu-0W0R;
	Fri, 01 Mar 2024 08:51:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1709283116;
	bh=sA8TqOeeNAJ4uP3DUjKIY2dPzNdzR82tgob5RgeK4f8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=oBLkycnDM6dnmGifrnnyJu/SaFFDWHpI+SvGrZM+Szcm4Ji9fqd1xFL1TtarN/m+U
	 BldGhnDZNOZea8UpG27gECWjhKY2LHHYzCa0fsS+dbaDnCeLGixrdDJ18XFxpHklgB
	 KZfOxYIxkqL5KJ+T819U/GffuHyw1BYZsSInhTMHW4MoELuBUfWYLjp7ci0tJyJ+Ca
	 pB14aEHMgPX2i8VB1XwaneJPlkQBvd307zLbC6iIrYF/wA7l3iYrSyjK6a9XyEEpFQ
	 mRiFUn5jiJO6j1lDf71A4Dq4OpLpiefZLepiYtSfzJfJ/4Zglu36HXD3Wlj3M+tzKr
	 7dAHbetqLW4Wg==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 9DC273782017;
	Fri,  1 Mar 2024 08:51:55 +0000 (UTC)
Message-ID: <8142145e-c31a-43f9-a656-1389525f251f@collabora.com>
Date: Fri, 1 Mar 2024 09:51:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] soc: mediatek: cmdq: Don't log an error when
 gce-client-reg is not found
Content-Language: en-US
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: kernel@collabora.com, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20240229-gce-client-reg-log-dbg-v2-1-4975077173d0@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20240229-gce-client-reg-log-dbg-v2-1-4975077173d0@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240301_005158_315121_FF3E54A7 
X-CRM114-Status: GOOD (  18.54  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 29/02/24 20:51, Nícolas F. R. A. Prado ha scritto:
> Most of the callers to this function do not require CMDQ support, it is
> optional, so the missing property shouldn't cause an error message.
> However, it could result on degraded performance, so the fact that it's
> missing should still be alerted. Furthermore, the callers that do
> require CMDQ support already log at the error level when an error is
> returned.
> 
> Change the log message in this helper to be printed at the warning level
> instead.
> 
> Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>

Ok, this is good now.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

> ---
> Changes in v2:
> - Changed from debug to warning level
> - Tweaked commit message to mention performance penalty of not having
>    GCE
> - Link to v1: https://lore.kernel.org/r/20240226-gce-client-reg-log-dbg-v1-1-f0fff97c30c7@collabora.com
> ---
>   drivers/soc/mediatek/mtk-cmdq-helper.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/soc/mediatek/mtk-cmdq-helper.c b/drivers/soc/mediatek/mtk-cmdq-helper.c
> index b0cd071c4719..943e9055dd1f 100644
> --- a/drivers/soc/mediatek/mtk-cmdq-helper.c
> +++ b/drivers/soc/mediatek/mtk-cmdq-helper.c
> @@ -55,7 +55,7 @@ int cmdq_dev_get_client_reg(struct device *dev,
>   					       "mediatek,gce-client-reg",
>   					       3, idx, &spec);
>   	if (err < 0) {
> -		dev_err(dev,
> +		dev_warn(dev,
>   			"error %d can't parse gce-client-reg property (%d)",
>   			err, idx);
>   
> 
> ---
> base-commit: 41913bcddc83b131649ee8ff0d9ff29e01731398
> change-id: 20240226-gce-client-reg-log-dbg-5ae9637a08ed
> 
> Best regards,



