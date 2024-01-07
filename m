Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3510DC47073
	for <linux-mediatek@archiver.kernel.org>; Sun,  7 Jan 2024 21:57:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bLoq6sRizyRcu59pZvOPlzI1kGMqU5IkWECCp6ikVIE=; b=JYxnuw/v4/eNir4s3ESQ5xJCoM
	dVQZc8jElON9W0PqscSzTnIjpfAPaW5Z16wo1TOjbqlLCNMbXLpjX04DomOE6yZll3fl8SewHRZtQ
	ylELm3W82l4dLsDi1uWz3FrKuQBZibTHyzM/24BGMYpaFSAdcy2u833OIkixQ4CPTytp+3triavzc
	N21+JJvZklG5s8qyPJKgWZok3ra/HokpNHGyj0gqJM9jpXjJN59fz27zHkdpuqS3lQKQWOlph+LEN
	5ON+bBaDWoYwV90//0WMU2zzLDwOVD0R1fXYFcjtbnCpYdxUu9okmGvC+LxVTdrRF5SmeC+/AFL9e
	qtF1KknA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rMb8u-003ddW-0g;
	Sun, 07 Jan 2024 21:57:16 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rMb8r-003dc6-1U;
	Sun, 07 Jan 2024 21:57:14 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-40d60c49ee7so15190405e9.0;
        Sun, 07 Jan 2024 13:57:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704664631; x=1705269431; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bLoq6sRizyRcu59pZvOPlzI1kGMqU5IkWECCp6ikVIE=;
        b=SGZyCbAY4PVl+SjNkDYPCZSfiSeVxOuBHwxtO55v7fYomsISrur+Jzvu2y4jn6rm3c
         F4CsfAhRdG/FhK39lAWZIAOAODOImtRrxJSc02WVXoC7rKrvYL5JJMxo7tRvFJNj7BF9
         jgMnPwJ93WeGrg7IgSAAXpdyvORqZD5QV5et2SIgA+TwDtUhtLEBvcNOajcPXzb1vAd1
         YAL7wM6MyIpnY0xLC4mCoZHqBl6/2Rx1+cCnnlVSELSbRsHMQh2CktIe555yaz9aPxia
         bgZkRmYFxWpNWR879ZQxN5Ssv5PqLkxdyb0/mNeqWfqJ37K+Mz/olpg2ugPHMczKLNWg
         zALw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704664631; x=1705269431;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bLoq6sRizyRcu59pZvOPlzI1kGMqU5IkWECCp6ikVIE=;
        b=reWYXhkgX/JscUyQvy7qU6Bq1FdcTZ/qg6G6h0Pca1S8K7KyjkiCFaGplJH15PCAiE
         6jy9GKchXMDym7kPEKXn6jRxpLQEm3Ui9bkVmlWtx6O1KfGRol7dJZ0xlgcvB1iEXuhg
         Tt/1ocn8QkVUgXOgi1m8DvyWlkTqtz4mZbzuCJcydYzaSY+h/ljb/pb4+lsxGUbmUll0
         EgIeeeQbjPdvjYn9nd9NBVHlUXEoKV2Pu8ierfrxsXcU/lvG0CNIItSVR6+mk4nBKw++
         f7ET0SyigVBCAdmWAqp2YelPZ2kdWK9bOdJtrI8uPlOg7nFjwpuTGAhBNRDjs42XDaM7
         pwEw==
X-Gm-Message-State: AOJu0YxsUG2C2/FeRNOBEx+jLQVwVrtA7WTmMRGqNb0x746Y3czauCYm
	4jUpvZ04gZHeQ/n4AKvbH/o=
X-Google-Smtp-Source: AGHT+IEd0lL/Mt0NfyWGqJx54tynb9F8fZq+SWpqy1QGZIeI1Gw7htPTuqOT6F3XFFxGCTT/RNBHDg==
X-Received: by 2002:a05:600c:13c3:b0:40d:5b11:50cd with SMTP id e3-20020a05600c13c300b0040d5b1150cdmr1385720wmg.160.1704664630744;
        Sun, 07 Jan 2024 13:57:10 -0800 (PST)
Received: from [192.168.0.3] ([69.6.8.124])
        by smtp.gmail.com with ESMTPSA id i11-20020a5d558b000000b003367bb8898dsm6137213wrv.66.2024.01.07.13.57.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 07 Jan 2024 13:57:10 -0800 (PST)
Message-ID: <86755f4d-3cae-41c4-8090-09ae83ea7af9@gmail.com>
Date: Sun, 7 Jan 2024 23:57:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [net-next PATCH RFC v3 1/8] dt-bindings: net: document ethernet
 PHY package nodes
Content-Language: en-US
To: Andrew Lunn <andrew@lunn.ch>, Christian Marangi <ansuelsmth@gmail.com>
Cc: Robert Marko <robert.marko@sartura.hr>,
 Vladimir Oltean <olteanv@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Luo Jie <quic_luoj@quicinc.com>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Heiner Kallweit <hkallweit1@gmail.com>, Russell King
 <linux@armlinux.org.uk>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20231126015346.25208-1-ansuelsmth@gmail.com>
 <20231126015346.25208-2-ansuelsmth@gmail.com>
 <0926ea46-1ce4-4118-a04c-b6badc0b9e15@gmail.com>
 <659aedb1.df0a0220.35691.1853@mx.google.com>
 <a6a155ab-0852-4f08-b49b-952ac74124a8@lunn.ch>
From: Sergey Ryazanov <ryazanov.s.a@gmail.com>
In-Reply-To: <a6a155ab-0852-4f08-b49b-952ac74124a8@lunn.ch>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240107_135713_524622_58773DD9 
X-CRM114-Status: GOOD (  10.17  )
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

Hi Andrew,

On 07.01.2024 20:44, Andrew Lunn wrote:
>> Honestly I would postpone untile we have a clear idea of what is
>> actually part of the PHY and what can be handled externally... Example
>> setting the clock in gcc, writing a specific driver...
> 
> That is really core of the problem here. We have no reliable
> description of the hardware. The datasheet often starts with a block
> diagram of the PHY package. Sometimes there is a product brief with
> the same diagram. We need that published. I'm not asking for the full
> data sheet, just the introductory text which gives a high level
> overview of what the hardware actually is. Then we can sketch out a
> high level Linux architecture for the PHY package.

True. I am with you on this. Can we put these words over a mailing list 
entrance door? It will save tons of time for both maintainers and 
submitters.

--
Sergey

