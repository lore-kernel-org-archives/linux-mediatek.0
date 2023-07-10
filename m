Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32FA1EB64D9
	for <linux-mediatek@archiver.kernel.org>; Mon, 10 Jul 2023 15:53:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tdKrsajVjo/xr86zMfcWuNX46q5dSrbFvouEd5MKVhM=; b=rgtXjmGkS3chp9zUyxHgkoHkDp
	TIxeW4S6vAKxH+9huZcB+pTXVTm9j140KfLl9u1W5ldxe8H7Wu5yx1yOLkwKmeJigbzx1m8Akp5BK
	41AVohYseXdWsi75obM1JQcspzPvnOq6AE52O0QiZ7Oq2QCJKH9FzmqrieUY+YCmqkISwlPCQQCaC
	qmd5mpFofRU/GLWBcmeDGa0v9THIUgItkvXBR0JYyU0wxIn2rsLxI5ZLgluVqYQQ4rL9xgtTjeXNg
	qFSbEJFQgIpOhXFV1Fwopvl4Rv4Wu6Y+yGF9FxWOs6F+Tt5OPy3yMjwAKQG3kVCkNfr03fSKf786w
	9qzn5ssw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qItCO-00C6f3-0R;
	Mon, 10 Jul 2023 15:53:16 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qItCK-00C6bl-2l
	for linux-mediatek@lists.infradead.org;
	Mon, 10 Jul 2023 15:53:14 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-3141fa31c2bso4720136f8f.2
        for <linux-mediatek@lists.infradead.org>; Mon, 10 Jul 2023 08:53:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1689004386; x=1691596386;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tdKrsajVjo/xr86zMfcWuNX46q5dSrbFvouEd5MKVhM=;
        b=TLZ//gR7t6mLNcmnE7ROIxsTiKnkjbFRvBVbhJTximPrdpJ0BSh2Ea6ZvOT6Uy8D+e
         DIVVcH5Xh4hGYNnp0vZir4NWamp1NTqHb+S1YFHH0AQPz20nDnj5dX/Jd2iq8TUuGXEN
         +pdnHr+DhstmSgWNBWzuDhSVzIL6P91lRD5myVEPNcGOBnwWlE6w6BwJUwUUB3zvS7nt
         2loEsLdfkz7pQcA+gR2vz5cI47r4cxaDNldsj6Ot8PoVBlod/2fSc9+vEyrwF9ge0ZsK
         9OYZFVz0kDTP9TjocKrLcaZTRH4POqm4H2aCflof2GinpmhN9S0T2dHoXU+hI85ePl8S
         hGUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689004386; x=1691596386;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tdKrsajVjo/xr86zMfcWuNX46q5dSrbFvouEd5MKVhM=;
        b=Ka0tYIHH31W07/5jVcyWz1YuhUnmZy1o/UVl52dfnH4P0x10dbbt4V3Hb4Mlaqyr4Z
         bf+Oc0W9dJpyfmiqLCo/9m6ddZkSv7zK9Ve2MeDvWOvs2R80lwLq2ElrIDN8d2Kg2mRj
         +SEpFZJTle2HixsLQtwsyXwmZ426pGdw2y1LdmgJB18S9/MT8MGY8Xlsmzng60V2Zn4G
         Jbrn64FoumX3sFMfUTobUDnQi/yNMGkJmxuNQK2FtETpf8r6oGtB19WyieS6jfmrOzZ0
         oBgzA1JLd3hrCrDCHiHVjEOOCVWmchHOBlF2xanrf0H+QZOLI+uCEQRznTUbXdIByUQV
         QGDw==
X-Gm-Message-State: ABy/qLa/TcMxTA5RdvglMRYE4oQ/9JIidw6D6B/wwOXyOp24p7GWbsOt
	AhuKp2/oRg2Kes3GD/N3aWUToA==
X-Google-Smtp-Source: APBJJlFKC+MrjlBKB0FNvPot8NUcDH+VTlvf4Fkur8znn+3cOPWDO++w16oLgmvffnjrZtmeMAaE8g==
X-Received: by 2002:a5d:4c8f:0:b0:315:89c5:9d2f with SMTP id z15-20020a5d4c8f000000b0031589c59d2fmr9552701wrs.53.1689004385926;
        Mon, 10 Jul 2023 08:53:05 -0700 (PDT)
Received: from [192.168.1.172] ([93.5.22.158])
        by smtp.gmail.com with ESMTPSA id e16-20020a5d4e90000000b0031424f4ef1dsm12044766wru.19.2023.07.10.08.53.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Jul 2023 08:53:05 -0700 (PDT)
Message-ID: <7dd9399c-3806-b202-53b2-863690b14ab9@baylibre.com>
Date: Mon, 10 Jul 2023 17:53:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v6 2/8] soc: mediatek: pm-domains: Move bools to a flags
 field
To: Markus Schneider-Pargmann <msp@baylibre.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: Chun-Jie Chen <chun-jie.chen@mediatek.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Tinghan Shen <tinghan.shen@mediatek.com>, Fabien Parent
 <parent.f@gmail.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20230627131040.3418538-1-msp@baylibre.com>
 <20230627131040.3418538-3-msp@baylibre.com>
Content-Language: en-US
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <20230627131040.3418538-3-msp@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230710_085312_893539_1E59474E 
X-CRM114-Status: UNSURE (   7.54  )
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

Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>
Tested-by: Alexandre Mergnat <amergnat@baylibre.com>


On 27/06/2023 15:10, Markus Schneider-Pargmann wrote:
> To simplify the macros, use a flags field for simple bools. This is in
> preparation for more flags.

-- 
Regards,
Alexandre

