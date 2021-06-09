Return-Path: <SRS0=WlSZ=LD=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7E61C48BCD
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Jun 2021 10:35:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7A01E608FE
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Jun 2021 10:35:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7A01E608FE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=toIHK00/csNj7g23tGD3m9Wf4psr99OGQbpoFlzh2w4=; b=nGDNg1GcyQSZp0v/kM/MaYD1TI
	G/tpbxWvKerplp8rEbYyfIKxnn9xAplIpi8h8dQFfi4zF5WQTkIPBUez9P8QgNlIQbjZ6FyaNBBrY
	2sP7U+rZ4GptUgmPi5zmlkwxeQerDPBituZiO36SGnwhDCbW/JficcLvgNj66+Qm/C3kF5qUnfCzI
	5nwZpV+1Pscq8vaBx98yTWv2Nm/MPZ16AYAvp0MFW8MS+h7RrpXkPLlVnvPRh9ykjuZQOqkxBwBxM
	VwbJTa9yh+T8Be9GVl/hPFRVNoAs/oXitfKIgZvGBul0HhYT+RKysiGijw0Tl/EJFEcxTilWffsux
	8C21zFjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lqvY5-00D2Jx-62; Wed, 09 Jun 2021 10:35:01 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lqvVs-00D1Js-0v; Wed, 09 Jun 2021 10:32:45 +0000
Received: by mail-wm1-x32a.google.com with SMTP id d184so3727415wmd.0;
 Wed, 09 Jun 2021 03:32:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=P4cgH8oFymIFjZTH3CHg2wo7SV8NvJbv1pufBgRVFXk=;
 b=fJrCJoyOKHZjU+dTpb3gNSifhKoIxDOiat0mP189Biw6SHXXSHnkSbHA0/aafJSl59
 9w5U0oafwcr+uR9MeWt7CiPuNdVYiH0I85nNmjWKlUiu64KDZ6PSfOEACtBR5r7XQoBN
 nBmZH3sP6AbX8wMgehYY9ouM433woTDi/X3mdV4AaEHtB2fbg1h6KUDJbbd79Z4uw4oS
 bu8h2khsp1Efg3G8nBk8OBv7+EnSyD16CgsQnzqENZDLFv/dY9ZcbxRi/ptpPWktuSu4
 sVrISSUR4qtLtMXiNT1QqTrOqz+Iy29Kf/h7FNPToi/GUDxOP9B5Pn3ZDko6TeNr2WXT
 ZYhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=P4cgH8oFymIFjZTH3CHg2wo7SV8NvJbv1pufBgRVFXk=;
 b=TK1VjzsMbAuG95satL3o8UFjA3+d0R3Z8N2VTs/9R5HWPjLFVqE4KHL75Tqb6WKQvC
 bXJ+2xnIVbsyKXrWQbYlbAgNO9iyKlzShoaM96989jn9mbOikn+J0qofQfNIoY8eowmy
 V9QtoULI3XrXPSm01EwItVCKFOeyJQh4fV+RZ2tZNtD+s+xJjR9YK4wBdIgr82mvlGE+
 ysTgroQH0DRdkiG0MxZNRNfniQcEPXipO5TU5HSvQuxWXuXFJF53ovmdsWoeyRd6vW5C
 TKg+RE/RERx7bNBUqQLAoj6BEc+vzWknPnaM3syZ16Lz5k3vIL5wvfPwUoVJHm/sjJj9
 aofQ==
X-Gm-Message-State: AOAM532tRzyUQVXU8Gt6owmbvivBYA1H+/vKllIkY47SyP0jglfmJXje
 TSd79VNaFV8QtKv3Ir3U1+k=
X-Google-Smtp-Source: ABdhPJzOGsdifqwK0g5kUKqGwEkkGQ19ZrnAjS9qtb3yoDxuCUA0eZInD75LQ43k8MwVMcPRw/d9Zw==
X-Received: by 2002:a1c:9a84:: with SMTP id
 c126mr26723738wme.160.1623234761358; 
 Wed, 09 Jun 2021 03:32:41 -0700 (PDT)
Received: from ziggy.stardust (81.172.61.185.dyn.user.ono.com. [81.172.61.185])
 by smtp.gmail.com with ESMTPSA id e17sm26176307wre.79.2021.06.09.03.32.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Jun 2021 03:32:40 -0700 (PDT)
Subject: Re: [PATCH v4 1/3] thermal: mediatek: Relocate driver to mediatek
 folder
To: Ben Tseng <ben.tseng@mediatek.com>, Fan Chen <fan.chen@mediatek.com>,
 Zhang Rui <rui.zhang@intel.com>, Daniel Lezcano <daniel.lezcano@linaro.org>,
 linux-pm@vger.kernel.org, srv_heupstream@mediatek.com
Cc: Eduardo Valentin <edubezval@gmail.com>, Rob Herring <robh+dt@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>, hsinyi@chromium.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Michael Kao <michael.kao@mediatek.com>
References: <20210603081806.21154-1-ben.tseng@mediatek.com>
 <20210603081806.21154-2-ben.tseng@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <1157f945-f0c8-5ac6-1512-71adc72b514d@gmail.com>
Date: Wed, 9 Jun 2021 12:32:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <20210603081806.21154-2-ben.tseng@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210609_033244_127560_6A1528BA 
X-CRM114-Status: GOOD (  14.22  )
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



On 03/06/2021 10:18, Ben Tseng wrote:
> From: Michael Kao <michael.kao@mediatek.com>
> 
> Add Mediatek proprietary folder to upstream more thermal zone and cooler
> drivers. Relocate the original thermal controller driver to it and rename
> as soc_temp.c to show its purpose more clearly.
> 
> Signed-off-by: Ben Tseng <ben.tseng@mediatek.com>
> Signed-off-by: Michael Kao <michael.kao@mediatek.com>
> ---
>  drivers/thermal/Kconfig             |   14 +-
>  drivers/thermal/Makefile            |    2 +-
>  drivers/thermal/mediatek/Kconfig    |   23 +
>  drivers/thermal/mediatek/Makefile   |    1 +
>  drivers/thermal/mediatek/soc_temp.c | 1127 +++++++++++++++++++++++++++++++++++
>  drivers/thermal/mtk_thermal.c       | 1127 -----------------------------------

I suppose that there is no functional change. Then better put that in the commit
message or use "git mv" to get a better readable diff.

Regards,
Matthias

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
