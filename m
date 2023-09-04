Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA65DC71153
	for <linux-mediatek@archiver.kernel.org>; Mon,  4 Sep 2023 09:33:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z/YOCswnyiP1Gl+qekEvPaVCMV3p7AL8gyHGWRDmlPo=; b=WBk5oqZaCzm+zB0cWPPpSN3nHr
	G0SQg5NB/vH7k8ia041Xq+pAR7yD6giuWda89mIDC1MZEWgqsIPog6PXGVLTyNxLpUTXYZpyktSBY
	kiCub2SJy4VnVhAxW5fsESJmmuWyR46Bq30/HdaDDj4WJXxvS0ef9qi8pPbdM4z2N/cyQekuvSoTH
	AN9J/Rg3aolk+dQArDmg1XjXA2W6eKlHLmeahr2yEUPBrcvxtoBar4f8ciOOPQoQ4ZZxn9r+/AIcr
	BkAvMjS6guTYhe4Xp0SY0NTYkDWy56+NX55vgiPCtPnERDNrytueRjjjQPqxH1JDnL2lkw87rJCx+
	ekklyN2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qd5xz-003ex5-12;
	Mon, 04 Sep 2023 09:33:55 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qd5xw-003ewK-2m
	for linux-mediatek@lists.infradead.org;
	Mon, 04 Sep 2023 09:33:54 +0000
Received: by mail-ed1-x52c.google.com with SMTP id 4fb4d7f45d1cf-529fb04a234so1582699a12.3
        for <linux-mediatek@lists.infradead.org>; Mon, 04 Sep 2023 02:33:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693820031; x=1694424831; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Z/YOCswnyiP1Gl+qekEvPaVCMV3p7AL8gyHGWRDmlPo=;
        b=d25OKQoq9qhas4B+dG1bEfS6Plc+94UDhbBW7uRwYoSyuj+d44wIHiavCmQSi0L1ZT
         GTMRPLuvbwag32hNvu/HFW48sKcD8iGQKSs4T5cHb5O3YCCMM8+yCcZnmiu9vDSFuzt6
         cWF3QW/G7dd/foJryKfVk1Jrhrka7t/+fcbiJGXcugUT0flI6nDqLK0ESoa7qfoSouom
         1tU3KybC7Fxym8y2wifmyb6dnWm1aV4doIDXUQtvu4O8JI+4GP0Wl5/Gw4jtlFk1m46t
         69WCResFdM4CjlBF4P90yLYOrAB2TjjAM4ln+fW6ezTs/otS3P6Xr1KuXwFMWfPl7mbX
         IPMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693820031; x=1694424831;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Z/YOCswnyiP1Gl+qekEvPaVCMV3p7AL8gyHGWRDmlPo=;
        b=gDyNFTigU/7drRxEj9ONcicVbUMWGAhUvqDY8CJdK3EwqLVa8ZrcXgaFi3IQEDq+Rb
         tJrxUKH+aLjS66mmRpQuebs+/Mc+oGhrtrmwAGJYQm9zzIUkdbDEAI25R8Q/XHgNfuSY
         7rRE6vQbvAJxluD+1aQJe4Cd1+HU6xxpsyw5TrqECez+JAC2ts6r9yuZwQ0/xrSgy4Ok
         5RGh9Xwbq69QHwrx3yO/dmiAldNnEDWq3CaS6g8ORx8a0YvXvcIMtjSJ+w/Jlm55HGFg
         y4WKNfYmvtJc77wmEcX3NhogKvKzpg1h+hqZQuJKnFTkfkny3T0troDh/QVxpOj+n1az
         py2A==
X-Gm-Message-State: AOJu0YwVEPgzlxLTI1YQ9+wWT7vbWcSu6vwq+nMMFNP9ZEZUVfMn7+mK
	zA/uwmUftNVUGB1zw2fjgW5dlw==
X-Google-Smtp-Source: AGHT+IEKhXKJRJUab8WqOQf9PxED1rgp/gPqp0+8r41c2tCEgP0t7/VHw4P5dlfOfipN1wGRh9Fwtw==
X-Received: by 2002:aa7:c690:0:b0:523:3fff:5ce2 with SMTP id n16-20020aa7c690000000b005233fff5ce2mr6718205edq.41.1693820031035;
        Mon, 04 Sep 2023 02:33:51 -0700 (PDT)
Received: from [192.168.0.22] (77-252-46-238.static.ip.netia.com.pl. [77.252.46.238])
        by smtp.gmail.com with ESMTPSA id p11-20020a056402074b00b005231e1780aasm5522696edy.91.2023.09.04.02.33.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Sep 2023 02:33:50 -0700 (PDT)
Message-ID: <e2e35d4d-7853-fccc-28c2-b8ecf309d6ec@linaro.org>
Date: Mon, 4 Sep 2023 11:33:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH 1/2] dt-bindings: arm64: dts: mediatek: Add mt8395-evk
 board
Content-Language: en-US
To: Macpaul Lin <macpaul.lin@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Frank Wunderlich <frank-w@public-files.de>,
 =?UTF-8?Q?Bernhard_Rosenkr=c3=a4nzer?= <bero@baylibre.com>,
 Sean Wang <sean.wang@mediatek.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Cc: Bear Wang <bear.wang@mediatek.com>, Pablo Sun <pablo.sun@mediatek.com>,
 Macpaul Lin <macpaul@gmail.com>, Chunfeng Yun <chunfeng.yun@mediatek.com>
References: <20230904092043.5157-1-macpaul.lin@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230904092043.5157-1-macpaul.lin@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230904_023352_920732_04F48E27 
X-CRM114-Status: UNSURE (   9.68  )
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

On 04/09/2023 11:20, Macpaul Lin wrote:
> Add bindings for the MediaTek mt8395-evk board.
> The mt8359-evk board is also named as "Genio 1200-EVK".
> MT8195 and MT8395 are the same family series SoC could share

How can be the same and have different numbers? You sill need dedicated
compatible.




Best regards,
Krzysztof


