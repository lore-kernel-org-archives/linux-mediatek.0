Return-Path: <SRS0=zLKe=I5=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.2 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 813CEC433DB
	for <linux-mediatek@archiver.kernel.org>; Wed, 31 Mar 2021 10:48:30 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CC10B6198A
	for <linux-mediatek@archiver.kernel.org>; Wed, 31 Mar 2021 10:48:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CC10B6198A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:Subject:
	From:References:To:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=BxM70P3xN6+HvP74enWfSomjsL9x7xn9txsFW84STkc=; b=i4o0nsx5Xz3QHUhj3ev8MnhVC
	HpWQ2ArHImPdhjPLJEjnGVu05Zfzmwtx9tFjSUHx920uJF/EH/kUwJga1LVQ3Zf8ErMNFXN87xlho
	jVYc2Zjhy2LJ37mcn6fPXt4Q/cTn1GPVWZYMBCOzz4qlwCesNDNSGfFkI6p0BZfQyY0BS+TQsWYSI
	GHTwLYTkqhLVrXebafUGr36q8sXbsAh3b3z7d1rT0qJpILQpF/3kRJcENzzJrmtZDIpUPbeyQC4EP
	yXR71MxUnqZmI0/wLrdV6csbEMiUxF0dH9qG23bpeyKvq+CXZhrixg6jSpTgWA3ytiIsoiAwas+/w
	NIPjFr3zw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lRYOY-006IUf-5f; Wed, 31 Mar 2021 10:48:18 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lRYOI-006IRT-HZ; Wed, 31 Mar 2021 10:48:05 +0000
Received: by mail-wr1-x435.google.com with SMTP id b9so19149634wrt.8;
 Wed, 31 Mar 2021 03:48:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=to:references:from:subject:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=an95RGWWeD1g/A49F28kwsJEkG2XvzpxDDx3Znsl2aE=;
 b=SRBZKkxCaBMgFirGX6d2mCBBeSrA34vHaLPU1AsyBHAnQSH//EaMYbmaubanC7OvH0
 8jLsnwNPKFxJJVE/qYleBch9PPknrwfA1r58hDm5ObUY/NBN1fDihzJZ09gO/mENkaRy
 l4003gLGcLaI+YR0xREZdnJa7oINV9MsVexxSdxSs4PRo4+TyFKbO8pQdnlwbFghd4vF
 zwIwvV42UMDNZyQO3OYESmSbVaGazr7J7o+tR4/Vp6wNTzK96B6igL7OVV/XDFVxNS8d
 HxpP7MB6wUTn77OT20uU6O0Y0mzjbcXr0jhFJNQh6r4WXXZJrAibCz4XhDaV1jYAy+ch
 jB5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:references:from:subject:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=an95RGWWeD1g/A49F28kwsJEkG2XvzpxDDx3Znsl2aE=;
 b=Zjcf4wbFPD+KLMtKERu7qHV58EDwTADfd6qDE9XO0+YiLsqZb8UzsjKzeu7c15LWDe
 +P1MibiADx0NRm7qj/QwGmks9jiMFwnGtxnyVqJi7BzFJQXqCuTN4EBYeFVPUknRbNvg
 t4IZkSfOlkL21CNcdEbJWbyZyj+sqBbTbbDpTWqmSs3K/PlrbPspmdhB7JWsw/XUA0aE
 GYdp98+1KhBZK/QzUcLO4hie5n01aAmp+Yj77DeYWs+mq6p/d6TRxXmcehtk7OmXQY8u
 vrfDCQ9ztZPgdti/gFgO8IXUWonEaneRZIwKp8yknGALiTCYIJ4AuK2iAIHBziPS9Q5/
 xvjA==
X-Gm-Message-State: AOAM531NJ0RS/8IVehWiXAQyE0CGPJqbeUQIpMesgpMK/5CRDyIYF4pj
 7zozfNiT10YgHO/C3hxzw3I=
X-Google-Smtp-Source: ABdhPJx530xnik+wLz0S1QarfQsK7fbyvmGzMAZS7c5MRia3h/O5oa90KaQACZU4p+ozmQRQAv8/aQ==
X-Received: by 2002:a5d:6b84:: with SMTP id n4mr2941778wrx.258.1617187681977; 
 Wed, 31 Mar 2021 03:48:01 -0700 (PDT)
Received: from ziggy.stardust ([213.195.126.134])
 by smtp.gmail.com with ESMTPSA id 91sm4098632wrl.20.2021.03.31.03.48.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 31 Mar 2021 03:48:01 -0700 (PDT)
To: Bilal Wasim <bilalwasim676@gmail.com>,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, enric.balletbo@collabora.com,
 hsinyi@chromium.org, weiyi.lu@mediatek.com
References: <20210201121416.1488439-1-Bilal.Wasim@imgtec.com>
 <20210201121416.1488439-3-Bilal.Wasim@imgtec.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
Subject: Re: [PATCH v2 2/3] soc: mediatek: pm-domains: Add domain_supply cap
 for mfg_async PD
Message-ID: <cbad9d05-6acb-eb11-a46e-4a2ccc634128@gmail.com>
Date: Wed, 31 Mar 2021 12:48:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210201121416.1488439-3-Bilal.Wasim@imgtec.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210331_114803_802679_74303A09 
X-CRM114-Status: GOOD (  17.55  )
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



On 01/02/2021 13:14, Bilal Wasim wrote:
> The mfg_async power domain in mt8173 is used to power up imgtec
> gpu. This domain requires the da9211 regulator to be enabled before
> the power domain can be enabled successfully.
> 
> Signed-off-by: Bilal Wasim <Bilal.Wasim@imgtec.com>
> Reviewed-by: Hsin-Yi Wang <hsinyi@chromium.org>
> ---
>  drivers/soc/mediatek/mt8173-pm-domains.h | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/soc/mediatek/mt8173-pm-domains.h b/drivers/soc/mediatek/mt8173-pm-domains.h
> index 3e8ee5dabb43..065b8195e7d6 100644
> --- a/drivers/soc/mediatek/mt8173-pm-domains.h
> +++ b/drivers/soc/mediatek/mt8173-pm-domains.h
> @@ -63,6 +63,7 @@ static const struct scpsys_domain_data scpsys_domain_data_mt8173[] = {
>  		.ctl_offs = SPM_MFG_ASYNC_PWR_CON,
>  		.sram_pdn_bits = GENMASK(11, 8),
>  		.sram_pdn_ack_bits = 0,
> +		.caps = MTK_SCPD_DOMAIN_SUPPLY,

Hm, I think the problem here is, that we don't find the regulator
"domain-supply" in the DTS. And that provokes that we error out on all power
domains. Not sure if we should fix that somehow, so that a missing regulator
will only affect one power domain (and it's childs).

Regards,
Matthias

>  	},
>  	[MT8173_POWER_DOMAIN_MFG_2D] = {
>  		.sta_mask = PWR_STATUS_MFG_2D,
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
