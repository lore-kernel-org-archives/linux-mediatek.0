Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A926DC43334
	for <linux-mediatek@archiver.kernel.org>; Tue, 26 Jul 2022 09:25:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lsAOxbutmAhPHiXKdzM1CNYF68IKrHfpAd9ExEqqgCo=; b=1omsbMasaV+7MGbFB0PVkLcQt9
	uku8eNpANSDaiCKnCs+6aQM8FgVgkLg+O8RPBnqFyqaY1f76m0L0D7mxu2bOu5234O2dcyKGO3a0Q
	C/zoUaQqYZUoi7RaMdXSkcb38CT3WXQRMjjLaeCdLyj4BGSWQDfKdYOmrXahbjiaeEQSCPVMm8AFS
	ZMrvQA+nIpu+dVNlLB8QYEQoQY4A6XSLIiWNmVuS22olWJG2g47f8GW6M5ZBCkwlHq24dCgINKuc1
	i3dgP/q5tAd6SG0fq3UklFISzafxIZcIgZb+j4nbwzfiHoOfxp0Jg7f0vAJi3Dmbx9LjEp6PaVJ9t
	RhsbJNgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGGoq-00BLHK-AC; Tue, 26 Jul 2022 09:25:36 +0000
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGGol-00BLAk-To
	for linux-mediatek@lists.infradead.org; Tue, 26 Jul 2022 09:25:34 +0000
Received: by mail-lf1-x134.google.com with SMTP id m12so20698344lfj.4
        for <linux-mediatek@lists.infradead.org>; Tue, 26 Jul 2022 02:25:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=lsAOxbutmAhPHiXKdzM1CNYF68IKrHfpAd9ExEqqgCo=;
        b=p9vOCPEi6dcCsQvXa6MCvfq6btQ+7B4b4HHhVW1kQ+ugX7L4ao8tb8V+nkF+6+LH40
         yFhqdwteUvLa04L305mxV+PdByvojCgPne4sTXmMnF5WceoMt8XoM4LLL41+v+qE+VYc
         3RqVlVQ3tLKTXqSODhioD43P6CIRCHvuspCSprBqJmIULUae7IfHT6RpGqS74CUbo7NZ
         /6ZqpkgVonuahqVvnhDz7AasAKh6zvhcnBC6RYwvjsd2p1bHADECoTLjdeXPm+F3GvTx
         8FgxqeB7DYXUadvT4fVXLxblVSX3VQFnr20d2ng+6QVIFMt1IQbIqFRmCQZ19miLLV7V
         LrNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=lsAOxbutmAhPHiXKdzM1CNYF68IKrHfpAd9ExEqqgCo=;
        b=15iDgPPaPvN3zK+Nqb0w+DyLXdv0sbzxbWbszkFeD3qNvX/Neasfd8pOcgBW4w6tjV
         bJsH/9bbQUk6cDBQHnZTWP5o8/b1c/syF/PNJuG77B+pixzDqSJD7jXuYlumM3SXUsaz
         AYD5e/D14udOszxAB/MlD9NNWlGC4kA071T2WjptEv4sbrpoD0Ie7LpSqjpRYkwuEmA0
         ItkPl3oFYBtzQhBCYFR+s9MV3zF++fqztV/6YYa3xMaPrSrFM83ag/xAdWbss44DLZT+
         g1UBS5SWsAH0JjAFIbmLrCszXPgQxuZ0nKT4Ovm6YBGBRA41NYaJQrJxoJZ/xQntOY+2
         jubQ==
X-Gm-Message-State: AJIora85dpLIKiOEwct5RQzB4b4ikpZxovIWWUzmNf7O6CD1YERhng48
	+YE74W1f0tPpFE07Dn6yLsgK/w==
X-Google-Smtp-Source: AGRyM1sh7SZksbfUM+uxlEwzz1xX/ugHveTOv2X2r/T4amVH3cqbjVSPSsPFF+AIhv7why1/kuMhvA==
X-Received: by 2002:a05:6512:3e29:b0:48a:7596:b4b5 with SMTP id i41-20020a0565123e2900b0048a7596b4b5mr6113371lfv.486.1658827527657;
        Tue, 26 Jul 2022 02:25:27 -0700 (PDT)
Received: from [192.168.3.197] (78-26-46-173.network.trollfjord.no. [78.26.46.173])
        by smtp.gmail.com with ESMTPSA id t4-20020a192d44000000b0048a751c966dsm2634978lft.224.2022.07.26.02.25.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 Jul 2022 02:25:27 -0700 (PDT)
Message-ID: <445060b9-a94f-396a-991b-48c64ad7a53b@linaro.org>
Date: Tue, 26 Jul 2022 11:25:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 1/3] dt-bindings: soc: update MT7623A power dt-bindings
Content-Language: en-US
To: Chukun Pan <amadeus@jmu.edu.cn>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20220726030621.7555-1-amadeus@jmu.edu.cn>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220726030621.7555-1-amadeus@jmu.edu.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220726_022533_129706_C298A95B 
X-CRM114-Status: UNSURE (   9.11  )
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

On 26/07/2022 05:06, Chukun Pan wrote:
> Add new power domains(VDEC/DISP/ISP/BDP)
> for MT7623A from MT7623 side.
> 
> Signed-off-by: Chukun Pan <amadeus@jmu.edu.cn>
> ---
>  include/dt-bindings/power/mt7623a-power.h | 4 ++++
>  1 file changed, 4 insertions(+)


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof

