Return-Path: <SRS0=dZqu=JK=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5C9DC433B4
	for <linux-mediatek@archiver.kernel.org>; Tue, 13 Apr 2021 14:06:16 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 13A1E611CE
	for <linux-mediatek@archiver.kernel.org>; Tue, 13 Apr 2021 14:06:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 13A1E611CE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=canonical.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=rpUPIC+Fg+L90RYWAwJx/fS0SmgrT214PtCPRssJePk=; b=Ug52dORboJu2EsMT8oPHxCe/A
	VMhs1LNtiakcJzvdajWAFL5Z6EwgtpDURt8P88PaQ8OgEHlKX63TzQMM/88eIWlGPOviyEV2Ms4bY
	p1xJuGE/B5WHvKpRod8KjkUZt4aWjye9WyayEUS9fsm2qLTcBIFmy0lculqVN+SQ3jP5CAJMpZTHx
	P/5pbprbwX3jr6f5WqslrPQ0jx8kaw9NoxEh1jztmykxibc6UbZLKO8p+IXb/H3rYJJFX1o9RWq4/
	sVED8RTzlLEyZdstKZZun7ikDC/ivKUUh6y71fkGgp4eq1DQ1NsyecOVtlO/1BxMeAcBvuAIXHhJG
	kCGrYHY7Q==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lWJfY-009SP1-49; Tue, 13 Apr 2021 14:05:43 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lWJer-009SLf-En
 for linux-mediatek@desiato.infradead.org; Tue, 13 Apr 2021 14:04:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
 Subject:Sender:Reply-To:Content-ID:Content-Description;
 bh=1zoVtByllhosC8xnCO3YIKw2vthWTwQhfS+DihX0pa4=; b=WcY56SjVkeFog8DR5Z9a4CmzIP
 bq6jUOIlsWIu+R3RWAI1+EyQQ6J0HsySCHWqg9iiWhlN1iKp/1p/ec0a3kxdapxc32qb7j+ZF4S7r
 eof9LdCpph2tdCh1HHSO3MHndNEfX4E8RA1MwtDOEjAdvxGquZ2WkMCP63C1AeXp8V4c5JRfeP/8q
 nvu1e9kOTcqmm2jifBbO9pnnpxakM+YdYam94FBbHJk3hKRcMOwSCmT/wIZT2mOZ/FYMCeHelJJh9
 YeEcHDR4ppRRwtse0CZrloIEKFi+lBl9zy05PaVFiQc+lwfQR0fk/ybE0HcEKiFvZ/VVQaAPZJJF5
 qL1W2E9A==;
Received: from youngberry.canonical.com ([91.189.89.112])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lWJeo-00759C-Qi
 for linux-mediatek@lists.infradead.org; Tue, 13 Apr 2021 14:04:48 +0000
Received: from mail-ej1-f70.google.com ([209.85.218.70])
 by youngberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <krzysztof.kozlowski@canonical.com>)
 id 1lWJel-0001RC-AV
 for linux-mediatek@lists.infradead.org; Tue, 13 Apr 2021 14:04:43 +0000
Received: by mail-ej1-f70.google.com with SMTP id kx22so5096983ejc.17
 for <linux-mediatek@lists.infradead.org>; Tue, 13 Apr 2021 07:04:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=1zoVtByllhosC8xnCO3YIKw2vthWTwQhfS+DihX0pa4=;
 b=EQHcdekt3vniV22D98FMIC87N0epT92U+xEIkEw4ITbiuNMGvOn5qKXQs6LOIBIims
 mAAaOhCTpb0DIC8Dxxde+hJ1AhfVmeyYsSGgqRJVt3+/h0BMvPCvpZXbtd9canHO+AY7
 aOAWXKVRAQyc9X6xSuk8IkPWwCTyOEfCRkBQ1nNl8Ae6O7PYfZMvbterczXBs8M3vDyk
 IrjQxQqhYhEj7CojeT8/TBO6xo4nHFzLk3l6Cd27YUsGOV6TKTW+qHQ7SUcgyclXMiSN
 ioNcjyeJCZsZmhxzpny12YkLqNtyEW/1g4HiusbofQdlKA6uJ53RdgEawWnt93iD+I4n
 XbCA==
X-Gm-Message-State: AOAM533GS/i2VWsa7L+Q8Iu5S2/sXM5DgqIR+UGUVbnhgVSMum5EHeEZ
 VoQxm7zdgQCDqeJth9T4l+MEOyri0Vx2DcZWQwI6NAfqSnJa915nozPotbtVv2vF1x/2CIpskzc
 NwpxyiWL9QSzbsawsrcGcBR5ltyC+WvbsNQls8XtN5pgkISQXaQ==
X-Received: by 2002:a05:6402:142:: with SMTP id
 s2mr34982260edu.2.1618322671988; 
 Tue, 13 Apr 2021 07:04:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJytwQzQE5BkozQ2VOreQSdkoAGEAaqvJ0FgXGTACKHn/MAUy6h5uirgVHlAcudl2n8kdm1F6w==
X-Received: by 2002:a05:6402:142:: with SMTP id
 s2mr34982231edu.2.1618322671878; 
 Tue, 13 Apr 2021 07:04:31 -0700 (PDT)
Received: from [192.168.1.115] (xdsl-188-155-192-147.adslplus.ch.
 [188.155.192.147])
 by smtp.gmail.com with ESMTPSA id n17sm9379838edq.32.2021.04.13.07.04.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Apr 2021 07:04:31 -0700 (PDT)
Subject: Re: [PATCH v5 14/16] memory: mtk-smi: Get rid of mtk_smi_larb_get/put
To: Yong Wu <yong.wu@mediatek.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, Joerg Roedel <joro@8bytes.org>,
 Rob Herring <robh+dt@kernel.org>
Cc: Evan Green <evgreen@chromium.org>, Robin Murphy <robin.murphy@arm.com>,
 Tomasz Figa <tfiga@chromium.org>, Will Deacon <will.deacon@arm.com>,
 linux-mediatek@lists.infradead.org, srv_heupstream@mediatek.com,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, iommu@lists.linux-foundation.org,
 youlin.pei@mediatek.com, Nicolas Boichat <drinkcat@chromium.org>,
 Matthias Kaehlcke <mka@chromium.org>, anan.sun@mediatek.com,
 chao.hao@mediatek.com, ming-fan.chen@mediatek.com, yi.kuo@mediatek.com,
 eizan@chromium.org, acourbot@chromium.org
References: <20210410091128.31823-1-yong.wu@mediatek.com>
 <20210410091128.31823-15-yong.wu@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <b015fd4a-f05b-5dc7-f23e-e517d40aeb21@canonical.com>
Date: Tue, 13 Apr 2021 16:04:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210410091128.31823-15-yong.wu@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210413_070447_019766_3B2C3F07 
X-CRM114-Status: GOOD (  11.39  )
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

On 10/04/2021 11:11, Yong Wu wrote:
> After adding device_link between the iommu consumer and smi-larb,
> the pm_runtime_get(_sync) of smi-larb and smi-common will be called
> automatically. we can get rid of mtk_smi_larb_get/put.
> 
> CC: Matthias Brugger <matthias.bgg@gmail.com>
> Signed-off-by: Yong Wu <yong.wu@mediatek.com>
> Reviewed-by: Evan Green <evgreen@chromium.org>
> ---
>  drivers/memory/mtk-smi.c   | 14 --------------
>  include/soc/mediatek/smi.h | 20 --------------------
>  2 files changed, 34 deletions(-)
> 


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>


Best regards,
Krzysztof

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
