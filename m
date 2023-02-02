Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F079C05027
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 Feb 2023 08:49:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XO/313PKa/quHlf1vA620KOMVC2M76VWbgj7duhxhyE=; b=ak2BBEEIHD6dpD05leB/Sd7mN8
	duoZILA/lx7Nq4UM0AA75j0gJcfQB21KbJCmAv/etnNLPPpvmqA4fRoAdGCyfDapynzLAbbANIVNt
	lR0dIOTehSlKQofrPKNVWTAHGYzk2AgAQ2QMp9/avtJVtDKW6GRU1CNU5nZcwwyW0zX7Kz1raoiy8
	oK4RFR+LXH9RW4mb7C0D+s896mhP6MlcXrjBE30w75SQV4DgjWMabcxPhhy2t4frbIrdYUq6zThy1
	Ng7TCUtm/ypFiNVqRdmBSBkjzSdw40pRjbDr8/R8f2nWf410ofdzuPpCNnWlnf4imdWlp6BiPWGsb
	ZKv2K/dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNVHz-00F1rJ-02; Thu, 02 Feb 2023 08:49:51 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNVHw-00F1q0-3H
	for linux-mediatek@lists.infradead.org; Thu, 02 Feb 2023 08:49:49 +0000
Received: by mail-wr1-x435.google.com with SMTP id a2so711966wrd.6
        for <linux-mediatek@lists.infradead.org>; Thu, 02 Feb 2023 00:49:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XO/313PKa/quHlf1vA620KOMVC2M76VWbgj7duhxhyE=;
        b=Rbsl3oe4l4bVGMdUTuZGoX5JU97gNvdHWPI34C33xa7xz+LVLH67BGnrgqEXSew9DE
         No7MLwYQBriaRfx20PLce8VtOcuHMgcEiP0guUAgkykJpS0ajOm9ipZDqIOPlC4wCc7o
         gYju68XMMYyacjPB6L7f8OwFzFIAYPmhGIEWm04FQH9noAUYm7FtOGed9dwNEUBrmL/p
         vVk/S6PELt2+1T0+mg8fnKUW6bTYtEa9JwwGbQaDHrziIi162MQqvlICPF9fYkpUZtk4
         0EINzUsHMi2Wa2HWhcP2UFuTccAa8EilbZbXoIPpIB7iVUZU3i5ZxrSsgPSgL7P+dnQ6
         aPBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XO/313PKa/quHlf1vA620KOMVC2M76VWbgj7duhxhyE=;
        b=Mtvy4tub55TiZ0tUmkgUdvtVfCJ3zdXSq5y5bffL8yYKkjKy3KlZRnMPNh5VOJjI3c
         ykyQJyWb+KGQbGtUOA8jYNXht7e4wjxZf5idAnqqo55cqPSk4xJ0sEoAARtbznQYN3bv
         jHwEjYN2tCxQ3o0dqROitI92G0aqlYfpPIQ4dusqvP/wLcmTWocwG5EDqvGKW8vJ8V2a
         vqOGWjxSMogtuE/JitQaoeJ7SGJBIv1yF3x7i/E1TkU7CH/DnjGY89KEK/7mO1TC9J2p
         qVwoCehl3ddiuzJimKDz0Z+jh7t4C4+f8DS+mJvbVHFEd3PBpOugu4OFu2sDXuwXeLUU
         jO3w==
X-Gm-Message-State: AO0yUKWraUMtIXF/5+gy+mQcKGUUPnf8MlHXQBpFMnxx/1aNstsc86yk
	gBbx5ipj2QHEiJ9STEYaqgkIqA==
X-Google-Smtp-Source: AK7set8C6EplC+GLPgeYrYpBCPc+kd3wgqHD+GEr9Z5HZ1vIjOAfGzXiYGB2G5h8OVwcGMkXRZHmlg==
X-Received: by 2002:a5d:5c09:0:b0:2be:5c4a:de6b with SMTP id cc9-20020a5d5c09000000b002be5c4ade6bmr5451330wrb.3.1675327784237;
        Thu, 02 Feb 2023 00:49:44 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id v14-20020adfe4ce000000b002bfafadb22asm19949727wrm.87.2023.02.02.00.49.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Feb 2023 00:49:43 -0800 (PST)
Message-ID: <4047db6e-80a5-b5f8-a736-d481f8a5127b@linaro.org>
Date: Thu, 2 Feb 2023 09:49:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH] dt-bindings: pwm: mediatek: add mediatek,mt7986
 compatible
Content-Language: en-US
To: Daniel Golle <daniel@makrotopia.org>, devicetree@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>,
 =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
References: <70fe0b606d988958b87f89828b8728e2f68eaace.1675278958.git.daniel@makrotopia.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <70fe0b606d988958b87f89828b8728e2f68eaace.1675278958.git.daniel@makrotopia.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230202_004948_167437_84A6DA73 
X-CRM114-Status: UNSURE (   9.74  )
X-CRM114-Notice: Please train this message.
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

On 01/02/2023 20:25, Daniel Golle wrote:
> Since commit 241eab76657f ("pwm: mediatek: Add support for MT7986")
> support for the 2 PWM channels implemented in MediaTek MT7986 SoCs has
> been added. Also add the compatible string to dt-bindings now that
> they have been converted to YAML.
> 
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


