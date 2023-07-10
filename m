Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59A1DEB64DC
	for <linux-mediatek@archiver.kernel.org>; Mon, 10 Jul 2023 15:54:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2wfIkRCUrMKdf07sqvIIvDJRNz8tUinPQv3be3vrXHU=; b=rrFZp7RBX4nOi5ijaKe6nyRmI9
	vmKZe9xAwuxbvyPxu6uCko6aep+bOa/vsIx50U3sbdnDHG4KFCPFIUq73dKFNGQOn5xR8m7GdGZC5
	V0Bk15b/AiZNNarb5YDnP/qNZphuE7BqqPiOLIfgH3ZrdYNoE0uyczIe/6rCdpd17Z7SBcpAZhiRQ
	cfE7ANllKYkMeTHlRerR+07wREsXj7qF5T7ZIY2OvOiw+8KrXqvYTubhDsNSP3dJrPFM0a/OX2KWO
	vdruo2PTQeAjmHgG9Ai96ceTpp3gsj5ddHBO0I4fpiF6VNlN8FP+tq9dNQQMsskmUdxFl3+i/SwRj
	gjC9BAyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qItDg-00C7C8-0U;
	Mon, 10 Jul 2023 15:54:36 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qItDe-00C7AI-0S
	for linux-mediatek@lists.infradead.org;
	Mon, 10 Jul 2023 15:54:35 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-3143798f542so5102333f8f.2
        for <linux-mediatek@lists.infradead.org>; Mon, 10 Jul 2023 08:54:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1689004473; x=1691596473;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2wfIkRCUrMKdf07sqvIIvDJRNz8tUinPQv3be3vrXHU=;
        b=ebGQtlRaVJQV2foAwyNUdohAeeUOZLm9EdlJMwuqey5BAYZgIrLM+d8eGE84ZOKPLl
         ozeDEgBtlRgcnH6QlT67S8qGrnmG4yYTzxuzkDL1qmyGNJP0k4A3hdStwMpmNeesEe7I
         B4O3nIgRTdtGnxp7sipzlhwM11x+8xwIMIqNe3c01o/ar3dZzUnTUIPOITqNjMgkDLkW
         XHxDraRYIjYudVmeMXTWZSt+8OEoN8GxWwt/Jc3QA+YQVane91gDqIZoZWqm/lv1/3C3
         ELZNJz9B1pI99Q8g77wYciQSoyPaF3BV5Jwcv2IAHGuCdxNlkhK8RNt+FTkkM1Lew5Xt
         y9qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689004473; x=1691596473;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2wfIkRCUrMKdf07sqvIIvDJRNz8tUinPQv3be3vrXHU=;
        b=IW3LEq1ZfvUKVOzYIdkcFZLQpon4/iTywHkGC/vN6eob28C5MIR5CGoWrSrN9Auhqr
         Mc07yDMhP7MNitifPqA4HIhS4BUR2eIbG7zDGnBTA0UXcrXjG0VoNizwx/DN3T2ieNxg
         tCxVRV/CaiHn4jhlnsVBpY3N8xrswLudTWW0UjsOCYeWlkw+YYSkf5KuQ00a1T5caiXy
         9j44mWpGDemX74PxS3ETWb344lb22K8QjELDpnCFez0+PJQu5rjdhnVuHQ0CvS3BOkID
         gZiJcK2lKNTNUl2p/lNi/UMrbZNQi8rcXCZIKVihUiunrlyOYVu3C/N7mJxzevcPIG68
         jx8w==
X-Gm-Message-State: ABy/qLbwFlhWK5Cy69nA2kl47UcBjHE4iZAD2yW800Hqe0g0OJhVSEV6
	xmLD3c1qiOPpgRRQ0UlOvly+cA==
X-Google-Smtp-Source: APBJJlHBZxxgHi7w9AMsNsW/SXZZBvbSaE3V+7jxZPXV+5ePCOXeIZwHtEHIRg47IkRL2mdfvzZqNw==
X-Received: by 2002:a5d:6148:0:b0:314:3ca0:c8c2 with SMTP id y8-20020a5d6148000000b003143ca0c8c2mr12396031wrt.11.1689004472875;
        Mon, 10 Jul 2023 08:54:32 -0700 (PDT)
Received: from [192.168.1.172] ([93.5.22.158])
        by smtp.gmail.com with ESMTPSA id r18-20020a5d4e52000000b0031417b0d338sm12065650wrt.87.2023.07.10.08.54.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Jul 2023 08:54:32 -0700 (PDT)
Message-ID: <a0cfb1d7-2bf8-02c0-054c-181114ebcfbc@baylibre.com>
Date: Mon, 10 Jul 2023 17:54:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v6 6/8] soc: mediatek: Add support for WAY_EN operations
Content-Language: en-US
To: Markus Schneider-Pargmann <msp@baylibre.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: Chun-Jie Chen <chun-jie.chen@mediatek.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Tinghan Shen <tinghan.shen@mediatek.com>, Fabien Parent
 <parent.f@gmail.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, Alexandre Bailon <abailon@baylibre.com>,
 Fabien Parent <fparent@baylibre.com>
References: <20230627131040.3418538-1-msp@baylibre.com>
 <20230627131040.3418538-7-msp@baylibre.com>
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <20230627131040.3418538-7-msp@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230710_085434_178722_683B4827 
X-CRM114-Status: GOOD (  12.18  )
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

Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>
Tested-by: Alexandre Mergnat <amergnat@baylibre.com>


On 27/06/2023 15:10, Markus Schneider-Pargmann wrote:
> This updates the power domain to support WAY_EN operations. WAY_EN
> operations on mt8365 are using a different component to check for the
> acknowledgment, namely the infracfg-nao component. Also to enable a way
> it the bit needs to be cleared while disabling a way needs a bit to be
> set. To support these two operations two flags are added,
> BUS_PROT_INVERTED and BUS_PROT_STA_COMPONENT_INFRA_NAO. Additionally
> another regmap is created if the INFRA_NAO capability is set.
> 
> This operation is required by the mt8365 for the MM power domain.

-- 
Regards,
Alexandre

