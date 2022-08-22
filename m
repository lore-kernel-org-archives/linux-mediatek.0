Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A211C28D13
	for <linux-mediatek@archiver.kernel.org>; Mon, 22 Aug 2022 17:31:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UIBQLdznziJppE7OJpXEV1+Wn96b8SDqR1x+484CyS0=; b=Oe1YbgBrsI5baLM9CFa1x3wQ1m
	oU7/SjbKtBdJ8CB8wyC9JnmbCuyWxuAXsv6Ygmwqjxt/VGYGkRd/zhsSB549/OG8se0lFzgqMLSoQ
	IUFzc9CLhbGcnbQleXJdRzpGqOtotVLdqbOazY9k6P5M2HtKFo0lbfPHmXZrK1DbvcHHj0rf6C9wu
	r3L1+rP4NKAGCiuYjN2dUFzFl304+6wbsJwQLgo67D/xlfgS8FjhhFwUl/gbWxYUExYm2FsaK32Od
	cEIRIVXQOhxESiPSc9lsS8jcdkamr9O3iUdhGdQlDh2jcxMp2DthoaQsL4IiKo6NvIqGA7nV/NLFL
	9ACcuVgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQBGs-00D5lY-IW; Mon, 22 Aug 2022 17:31:30 +0000
Received: from mail-lj1-x230.google.com ([2a00:1450:4864:20::230])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQBGf-00D5gQ-DO
	for linux-mediatek@lists.infradead.org; Mon, 22 Aug 2022 17:31:18 +0000
Received: by mail-lj1-x230.google.com with SMTP id w23so6146429ljj.7
        for <linux-mediatek@lists.infradead.org>; Mon, 22 Aug 2022 10:31:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=UIBQLdznziJppE7OJpXEV1+Wn96b8SDqR1x+484CyS0=;
        b=UslXPosZJEVEMBCrm+Bq270dy0ernwsV/tH5hBf9F+jDyKMTpzjX3vU/ntechaMWyC
         f2V3lmnsowQFtbJYqlZmhLSahLY7uz2a0pPFVDC2HmynRQ2B7G+ATb+r4N3n88ZP7G2R
         EeHBM+SvXIFsu1/YOUyWD5KpYo4Rlcpj4PAZ4d5x2eM4zfJL7NglVUKbHZCJFzwcRNMc
         F3O6sb/JJlHq1MPi3jxXDKS76D9EeT1dg3mp6StAa4jljGjpf03dN2k3bA1CmpOa+ZXl
         U9FhuBipFIKX/9HTcg491Edkwuujswxqn6C6ZREzh8u5+4ISq8Np0HuqW7p635Z6ptw/
         Lceg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=UIBQLdznziJppE7OJpXEV1+Wn96b8SDqR1x+484CyS0=;
        b=mNmG9DOGAkl9oMnjeaINeSadRSNDPDlGMF6zZkQ5cMgu3Azd0ExEiMHBHgVSJ6boqD
         HimZARsjSGUnHGdG1gpZ5BioYUwGuXpTm2Es7qEtBDHeLQsg33j/UJ0oK0+AVJdtOF4l
         bZxqigVhImTNr9I8zdsNu6l06ZiIC3Jk7KgZ2GHEAlb1eS5aSzl3HQpByhErL5Wwkzbc
         /iJyNvWqITA1me/jnp//wwcmfD1t7/t79QR7GOWLAYbhvZ7pznBQoT/5h5hJjlPTfGIP
         wjnYxr3AzeaADbbkv8JcnOBsrXLuZ8qEzsmAi7Ycm7yT7evK9Co2RSQErd7CcaOhU/oR
         Mqkw==
X-Gm-Message-State: ACgBeo2a0hUEVgZP5mYohDDyoCiJcuMXI/A9SysPKY0jNjM7S87GfC9d
	onObEi8PxlE5714k/H3UqaM3ZQ==
X-Google-Smtp-Source: AA6agR6VFNpgt+MgZFrbKH8HTyfO7Yf/rgWPBwBmR3CL0NGx4uLKRhwHLYhAMoTx3/06p4INGZihLw==
X-Received: by 2002:a2e:9604:0:b0:25e:4ed7:ef45 with SMTP id v4-20020a2e9604000000b0025e4ed7ef45mr5835729ljh.389.1661189473507;
        Mon, 22 Aug 2022 10:31:13 -0700 (PDT)
Received: from [192.168.0.11] (89-27-92-210.bb.dnainternet.fi. [89.27.92.210])
        by smtp.gmail.com with ESMTPSA id t10-20020a056512208a00b0048aeff37812sm2010642lfr.308.2022.08.22.10.31.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Aug 2022 10:31:12 -0700 (PDT)
Message-ID: <3815ce73-b021-4643-6bbb-ad0d35178b94@linaro.org>
Date: Mon, 22 Aug 2022 20:31:12 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v4 1/4] dt-bindings: clock: mediatek: add bindings for
 MT8365 SoC
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Markus Schneider-Pargmann <msp@baylibre.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Fabien Parent
 <parent.f@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, Fabien Parent <fparent@baylibre.com>
References: <20220822152652.3499972-1-msp@baylibre.com>
 <20220822152652.3499972-2-msp@baylibre.com>
 <0de7f878-1471-4916-9384-9d966e840d74@linaro.org>
In-Reply-To: <0de7f878-1471-4916-9384-9d966e840d74@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220822_103117_504519_0838CD49 
X-CRM114-Status: UNSURE (   9.05  )
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

On 22/08/2022 20:29, Krzysztof Kozlowski wrote:
> On 22/08/2022 18:26, Markus Schneider-Pargmann wrote:
>> From: Fabien Parent <fparent@baylibre.com>
>>
>> Add the clock bindings for the MediaTek MT8365 SoC.
>>
>> Signed-off-by: Fabien Parent <fparent@baylibre.com>
>> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> Hm, when did I review it?

Ah, I reviewed v2 and still had comments in v3.

I see these fixed, so everything looks fine!

Best regards,
Krzysztof

