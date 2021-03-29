Return-Path: <SRS0=9jr7=I3=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.2 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CBA74C433C1
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 Mar 2021 19:10:30 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7A14F617ED
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 Mar 2021 19:10:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7A14F617ED
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=xqB9LqCwyxGtu8WjV+mR5vcZoKza3PNn6QJfnungJKA=; b=f/Ri6Zn4o3ZPO1v1jDWGJXTap
	pi5A7do+kmTknVziaeCxDBfmGhBkUOJJzKjPTHklBxAyoUtU3kAU/YlmpwKeAJKmzBE3+Qei7KdRq
	q6/fjT2qGZY2+UB47EH9kaCnAaCYNvaRgZ2JD0htuWdtxNnFGXp7IshppKyGRgRMGlIUJxdixvbnI
	+4FX+ulKcKCdjzpyYcF3E4ev7qR2ZS0EnHOtyU3Z74YsqXIfiLZ3wUcjR1VcMNjKkpdRlu3twA1xF
	Da9vZ9Yurx+00/Ry11+5cK3+eRPW72E+UibffEqEW/Jhr57n7cDwmkPETDlDPPQGnIBiWC2neTNIH
	zI6jM0c/Q==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lQxGx-001Bcp-9G; Mon, 29 Mar 2021 19:10:00 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lQq59-000cMc-6Q; Mon, 29 Mar 2021 11:29:20 +0000
Received: by mail-wm1-x32c.google.com with SMTP id
 n11-20020a05600c4f8bb029010e5cf86347so8339557wmq.1; 
 Mon, 29 Mar 2021 04:29:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=B4UbXj840h4a71/q2at4GMy9N6Sb2gByhZKiwU4vJrY=;
 b=vH6Jk2ErhRmQrT8JMSNBb3j8ljVgY0/xJ5pSRb8OkKWdN7V8Fb/uQ6ezV/2eriBi0S
 +XKgxqRkg/XIHcyMOg8OIThPyhC3X72qZ9LcZ2dn6QIthICoN4qMggesQFWxEdxL9EMr
 ZHqLQRdhOFn8+INmmFZ4vYqtYHw4lq2DtiuCSWE6YFEMJI2js8vVYdV2OFX+lRTQX+1z
 bL690l+yTWTOOUuV2xvaLLYbe7a8+KblJqL6/wtzaDkyaK6+sNUe6cOfR0ng9E8GjU2T
 MS/V3CIT9SwlnA/clttGsasiWGgWLwTeua2qNoWcM+EWiMYDgxrCq6vgwIUbGD7L9nJf
 hsdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=B4UbXj840h4a71/q2at4GMy9N6Sb2gByhZKiwU4vJrY=;
 b=jeJQtsI0RUoJgSS6CpzS62OXDa514Dd2AswbcU+vLX1hZ93e5Poq8BejLlBnuMd4cM
 DWr0tzMfDYyYgUElRGa7c+lYlM/fLd2FThH3JK1RKfpiKuQk8+sDumicwY81UGUCDeiV
 Wdf2v2wFGmx9JgwKaHUSbQEqZJjrRmxM+JdGzRYZd/GApqJ+Jw6Kz1tVnKSimDemkCFf
 t9VPWxXaU8b2su+XPPFvGG2T/i6/hrJJFx8eQZLgget2XBfgn4j46NTUPqMjeQZh74vZ
 Mfz9ipUWaa7cHHpaQ9Gvvf+AVqqanyglebNe8VYis3ehRjSVu7KK/mQ/yqVsi3IYDGs5
 z4qw==
X-Gm-Message-State: AOAM530x71iv/6jsO5P8hnX9dwyl30BBI4u/RETicLOInP4TjMpcuMs0
 drGbhlnL2zbD8gdZdBvQk5Wnpw869AUxaA==
X-Google-Smtp-Source: ABdhPJwh1CpNaMjP9xoCHDNi8l5BEedqRd9AdlvpPDnD5cmQsxeJJFyojmhA1GZ5Ktlc90ch/G+1lw==
X-Received: by 2002:a05:600c:2106:: with SMTP id
 u6mr24768425wml.55.1617017358485; 
 Mon, 29 Mar 2021 04:29:18 -0700 (PDT)
Received: from ziggy.stardust (80.174.240.175.dyn.user.ono.com.
 [80.174.240.175])
 by smtp.gmail.com with ESMTPSA id k24sm24211189wmr.48.2021.03.29.04.29.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 Mar 2021 04:29:18 -0700 (PDT)
Subject: Re: [PATCH 1/2] clk: mediatek: remove deprecated CLK_INFRA_CA57SEL
 for MT8173 SoC
To: Seiya Wang <seiya.wang@mediatek.com>,
 "Rafael J . Wysocki" <rjw@rjwysocki.net>,
 Viresh Kumar <viresh.kumar@linaro.org>, Rob Herring <robh+dt@kernel.org>
Cc: linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, srv_heupstream@mediatek.com
References: <20210326031227.2357-1-seiya.wang@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <1c54a2f1-64e8-0fa5-e2e3-55c367332626@gmail.com>
Date: Mon, 29 Mar 2021 13:29:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210326031227.2357-1-seiya.wang@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210329_122919_376162_42517A61 
X-CRM114-Status: GOOD (  15.92  )
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



On 26/03/2021 04:12, Seiya Wang wrote:
> Remove CLK_INFRA_CA57SEL for MT8173 since it's no longer used.
> 
> Signed-off-by: Seiya Wang <seiya.wang@mediatek.com>

Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>

> ---
>  include/dt-bindings/clock/mt8173-clk.h | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/include/dt-bindings/clock/mt8173-clk.h b/include/dt-bindings/clock/mt8173-clk.h
> index 3acebe937bfc..3d00c98b9654 100644
> --- a/include/dt-bindings/clock/mt8173-clk.h
> +++ b/include/dt-bindings/clock/mt8173-clk.h
> @@ -186,7 +186,6 @@
>  #define CLK_INFRA_PMICWRAP		11
>  #define CLK_INFRA_CLK_13M		12
>  #define CLK_INFRA_CA53SEL               13
> -#define CLK_INFRA_CA57SEL               14 /* Deprecated. Don't use it. */
>  #define CLK_INFRA_CA72SEL               14
>  #define CLK_INFRA_NR_CLK                15
>  
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
