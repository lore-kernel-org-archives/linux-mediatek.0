Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9858D10375
	for <linux-mediatek@archiver.kernel.org>; Thu, 27 Nov 2025 06:51:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KJB5bHuAo0V2i3Tn47zuebL6o/cGCmIFZCCZXXdSLeY=; b=GgDV0XtAqzUyzMkd9CDp/OqXUL
	f7q9tdbKmSgY8ejQ7AbQN3G5NHH84ADijglBUJ4+1cOBUe3aVjHOofQBgk+Jhb0R+x0dQlC8Lz1e7
	p2Y0aP5b65fnWqBykvILbPhI+e9jdjidMvICwUcjztl3WWLR0vXeBJ7aamEnIuMeVRqILTGLjbJMz
	nMNDhMIaSm5kgpSIDM0FRHGor/GrkC8eUM7ndG9AHrYI/gq5AOVC9a7LBVi67nVDLxj/hDMlB1GvA
	ExuXl471cjbAd5uBmTE6DxpfBDRL4/AisM2jqG4Qeh94bY58LTo6oNePttXlPxpB9j/GsZRXjDlJR
	fKcL0r8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOVqW-0000000G48B-19CC;
	Thu, 27 Nov 2025 06:51:16 +0000
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOVqT-0000000G47W-3y5g
	for linux-mediatek@lists.infradead.org;
	Thu, 27 Nov 2025 06:51:15 +0000
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-59584301f0cso594989e87.0
        for <linux-mediatek@lists.infradead.org>; Wed, 26 Nov 2025 22:51:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764226271; x=1764831071; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KJB5bHuAo0V2i3Tn47zuebL6o/cGCmIFZCCZXXdSLeY=;
        b=kVIEqmaYog99+IGAua0BPW4RZFfTu9Mqufi3Dm3pHSrqM4pKDaQJmqWdf75l/roUru
         YFDfrDU3bmCs55NGCSoMhR5u1/4VS+uLeMEORnjOQ8EPdPqWkNzcni8bhhn21XpwezWP
         BaJRyeJlm6rwA3ErUIPfTlsf0ZwqLz6texTGpr+vlBJTo+F+q5MPCRY1VaXR7rk9T9I6
         5++TL0kZU+pxW3MEHB17hxWwFeZJMMR7+GLlLDBZekS5JFwjxNlsTbx4fddnZA5tsaLM
         SVHb214n9fbkGkiRZCr3UBa0qGps0WLkoT0HvbBzTkV0qQCcCUA0r9aSWY6HVtjcCE5i
         eLPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764226271; x=1764831071;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KJB5bHuAo0V2i3Tn47zuebL6o/cGCmIFZCCZXXdSLeY=;
        b=CKON0DIExcDp1r17n+9ci2UJksL5XL/ylJh+BzU9WBr+mvOmEHilQZVFJr00u1lb0a
         j9sbP+tXgs0IN2esSVc4I1/zYhpt4Gisq3+LNJUxWTLYpaKL2vLKg0UzdOlJ0jUeFtKj
         N2JGDZ9osO/0o2JFeUTndIdCqNWQtk3ADyhitWzY/rRx61JryuYqsWU4PxJj07Dngi66
         3WISZhfG/zrRk65F8kh0VyINQl45nNecMurYpuD5f7EnD38IfPkgU98sXprpWS2IVFqA
         47nGeEVlnkc0hmm0tVtJp+i1WfX+mz30IlRcAPa0A4KkyFjTkIzEq6DuGiho4EnZe64c
         g+fA==
X-Forwarded-Encrypted: i=1; AJvYcCVKLytzow5K+fbaSbeSEaEC+KvA7ToDXFpVZIPyPRnX4vDXGFEPaIFerX4XBy03TOQRCo3ZpKsumWsxn47oSQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YygSMfbzdT25Y5nstyMGmNjslcK05RWBnC+zPD60tJmE+HxDZ24
	sHtBpcd89DcVPK5FfGGxhJz5hegRjYM0lqfEgSPD4SlMNTVXm92fpkoA
X-Gm-Gg: ASbGncuG+bcMLi7WZqZdxq+HaZ7agt7dQPdFqHxc8C7CG0eCiDTpegjbEcdbtY2jtN3
	fGco8G42UQ9YyiyN2Q5OdCs+Co9UdylFKjmxq3LyrtrU3HN+Ch+nK2pmThLbNIxDQ7WVdPgY22J
	x2L4dfxb1uK1fv91HYZO9hB4bMwSepRQlKau7khkJ1VYiChuxFybvA6HebpHx26ASHXzjcxiorD
	1sds/FH15XntmL9RiallKwxm8m66uqJ3H7VTt7xR2Vaqf+kxftXtL62y39c+/SgIxUMgF/Xff+r
	BKFNtcs8f3nVul2Yp9noxc2YCU9wQW0PwVdsdm0V68tcO+wdBDnW7WONyBB1+Uhona3udqsWYcz
	bo0WsUyP/ziB7iY9atHY0Df8SltEIOwx2Zgq/QPHsnhXhplk9ClPlvUhHqFBMVY7nnAGz6C5FPA
	dgqHJ3l+1BY7S0mYbajz2xd1XJ75/DecvMwMg1cnc/4ihnZitIfEsJ7RuQ1109WhXJuSnk
X-Google-Smtp-Source: AGHT+IFTmDfrXh0KvI1Xxo4ZUUZvVPNdz6X1okMoprwygPwEBEGqBxEtkR2sAlEnAGDtHntZer72Qw==
X-Received: by 2002:a05:6512:159c:b0:595:9152:b932 with SMTP id 2adb3069b0e04-596b526c87bmr3380986e87.47.1764226271085;
        Wed, 26 Nov 2025 22:51:11 -0800 (PST)
Received: from ?IPV6:2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703? ([2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-596bfa440d8sm152329e87.46.2025.11.26.22.51.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Nov 2025 22:51:09 -0800 (PST)
Message-ID: <f4d4169d-796b-49fd-b4d3-b74186e59b82@gmail.com>
Date: Thu, 27 Nov 2025 08:51:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/8] regulator: Use container_of_const() when all types
 are const
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Bartosz Golaszewski <brgl@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Samuel Kayode <samkay014@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, imx@lists.linux.dev
References: <20251126-container-of-const-regulator-v2-0-7ad3408d6f29@oss.qualcomm.com>
Content-Language: en-US, en-AU, en-GB, en-BW
From: Matti Vaittinen <mazziesaccount@gmail.com>
In-Reply-To: <20251126-container-of-const-regulator-v2-0-7ad3408d6f29@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251126_225114_024552_E7F79468 
X-CRM114-Status: GOOD (  10.89  )
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

Thanks again Krzysztof! :)

On 26/11/2025 19:40, Krzysztof Kozlowski wrote:
> Changes in v2:
> - Rebase on regulator/for-next, which does not have pf1550-regulator.c
>    so drop this part.
> - Link to v1: https://patch.msgid.link/20251126-container-of-const-regulator-v1-0-eeec378144d4@oss.qualcomm.com
> 
> Use container_of_const(), which is preferred over container_of(), when
> the argument 'ptr' and returned pointer are already const, for better
> code safety and readability.
> 
> Some drivers already have const everywhere, so container_of_const can be
> directly used. In few other drivers, the final pointer can be constified
> that way.
> 
> Best regards,
> Krzysztof
> 
> ---
> Krzysztof Kozlowski (8):

>        regulator: bd71815: Constify pointers to 'regulator_desc' wrap struct
>        regulator: bd71828: Constify pointers to 'regulator_desc' wrap struct
>        regulator: bd718x7: Constify pointers to 'regulator_desc' wrap struct
>        regulator: bd96801: Constify pointers to 'regulator_desc' wrap struct

For the above:
Reviewed-by: Matti Vaittinen <mazziesaccount@gmail.com>

Yours,
	-- Matti

