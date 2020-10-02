Return-Path: <SRS0=DbAw=DJ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CF47C4363D
	for <linux-mediatek@archiver.kernel.org>; Fri,  2 Oct 2020 09:29:14 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CC969206FA
	for <linux-mediatek@archiver.kernel.org>; Fri,  2 Oct 2020 09:29:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="AUsBiPaf";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KmcthEJB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CC969206FA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=f7BYx03mU34YEYRKmmj2rfUqgDPRjcTbTnPEogh+tVY=; b=AUsBiPafxHhIDEfGfiJwKb3N7
	NRBZIp8XkFGYbClxdKGDXI9b0TQOeMBRG3mGXET1OfGEi/p7QJG+HezCw//3B5IincwiEJk9q/JN3
	u+B0ADpEupXFiZRPrdntmCBcS2arkEDo1RLtxW18aByYi8lYtPweiadSGAzCQ3nmKSXwMMpohkdc6
	YKl0HhrI9qLPH/q1zVReHpnh4e2yf0+9qp1nVzRJhAcB/fFaS80ePE/zBzSM0OY2PlE1EUpJ7ZBMh
	ds59z9U2nFbzeFsH1psoIiRjk8UdC1/GV4u3VrP5bYhZtknJ096R76uWPEAYbN2aAq15RcWgskeS9
	dShWjZfVA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kOHNC-00068B-PF; Fri, 02 Oct 2020 09:29:06 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kOHN9-00067I-GD; Fri, 02 Oct 2020 09:29:04 +0000
Received: by mail-wr1-x441.google.com with SMTP id z4so1014489wrr.4;
 Fri, 02 Oct 2020 02:29:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=gpPgURKkl9sngE8SAL1dImw4cT3GW8XwoppRxwXgCVE=;
 b=KmcthEJB3lQIF1fDM11/PN/eREoSJLIByB9r4WHtV00tw3hdxGknC5gCf+Ma4luzmH
 fq28mRe7UkOTSL10R27tHVWnIq1ImF2jIW2BhTT0r1csFqkKh9hohEJnhVzqFt/z/d6X
 PbtxKiMRYnkwUbSqKLNucZSgqrIAMHY+UgZT/bvtGuoZy7u+Q5pbAE6KTiz4jSO3kwSV
 8pTRe42xPz6EUKvYwO3rlry7i5uXkj9dUz4uiuDIlamcHN3HlRAh4QFHuaGwftnk3Lu8
 RRVWFyY5aeGkzZKY4aucDBQULQald04LlnZ+lOgoWESLinpoa5DmZDYA9Xvmf5Ref+kA
 +Cuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=gpPgURKkl9sngE8SAL1dImw4cT3GW8XwoppRxwXgCVE=;
 b=Ala8avICOQCizSCpwAPukUM3OPEBNeWMa512siTpSW8wg+D86EzhOamPnc46CD4QE9
 OcI7G7pQm3uoE9ubXXEvuD5nZjtZIv+Xr2cZcPRGeegHvCl4WYUWi6B4MUf7qsZbI9DK
 ILzwDOqHmRgQoTccHArft+/FjSQ09CHk62ZHC9fZuoTj7IuTrUEnBr/5oRkK5Kj5CbwL
 B9ShyY8f5sjimSbvh35CcM7dpUpz4cAjbzZjy/eRpHrcJXCAwfLfGiSnuJrUBNJOq9tz
 VmSGk5ZHFHHyVFMaKcsI3lHMBBeNllZGpkpbP7dXeGQYqHOkhZirznfIBizdZxbwDy6g
 rJGg==
X-Gm-Message-State: AOAM532SVNpwRbEzauHfZbVbSi6CfKjYmyPdPkqLjHCPYLvMlk/5kPdI
 s7wmb3NVx5pny2Epc9Qnajw=
X-Google-Smtp-Source: ABdhPJygSCj+b9VSkRoorJhr1x1Mej4KEtMu4CCzpBb34Hasfx7Y1vL/rB63lJ+MhWIYgIxe2+wfKA==
X-Received: by 2002:adf:ee01:: with SMTP id y1mr2050516wrn.2.1601630941865;
 Fri, 02 Oct 2020 02:29:01 -0700 (PDT)
Received: from ziggy.stardust ([213.195.119.110])
 by smtp.gmail.com with ESMTPSA id b8sm1149218wmb.4.2020.10.02.02.28.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 02 Oct 2020 02:29:00 -0700 (PDT)
Subject: Re: [v5,2/4] dt-binding: mediatek: mt8192: update mtk-wdt document
To: Crystal Guo <crystal.guo@mediatek.com>, linux@roeck-us.net,
 robh+dt@kernel.org
References: <20200929032005.15169-1-crystal.guo@mediatek.com>
 <20200929032005.15169-3-crystal.guo@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <2199f623-ebfc-3585-2248-6698aef57d7b@gmail.com>
Date: Fri, 2 Oct 2020 11:28:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200929032005.15169-3-crystal.guo@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201002_052903_546505_EDB9E58B 
X-CRM114-Status: GOOD (  18.32  )
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
Cc: linux-watchdog@vger.kernel.org, srv_heupstream@mediatek.com,
 seiya.wang@mediatek.com, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



On 29/09/2020 05:20, Crystal Guo wrote:
> update mtk-wdt document for MT8192 platform
> 
> Signed-off-by: Crystal Guo <crystal.guo@mediatek.com>
> Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>
> Reviewed-by: Guenter Roeck <linux@roeck-us.net>

You added Guenters Reviewed-by in v4 of this series, but I don't see that on 
Guenter provided this tag. In the future please make sure that you don't add 
tags to your patches that were not provided. This creates great confusion.

Regards,
Matthias

> ---
>   Documentation/devicetree/bindings/watchdog/mtk-wdt.txt | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/watchdog/mtk-wdt.txt b/Documentation/devicetree/bindings/watchdog/mtk-wdt.txt
> index 45eedc2c3141..e36ba60de829 100644
> --- a/Documentation/devicetree/bindings/watchdog/mtk-wdt.txt
> +++ b/Documentation/devicetree/bindings/watchdog/mtk-wdt.txt
> @@ -12,6 +12,7 @@ Required properties:
>   	"mediatek,mt7629-wdt", "mediatek,mt6589-wdt": for MT7629
>   	"mediatek,mt8183-wdt": for MT8183
>   	"mediatek,mt8516-wdt", "mediatek,mt6589-wdt": for MT8516
> +	"mediatek,mt8192-wdt": for MT8192
>   
>   - reg : Specifies base physical address and size of the registers.
>   
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
