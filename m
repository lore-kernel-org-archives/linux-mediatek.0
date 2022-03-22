Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19D72C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Mar 2022 18:08:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZuzI165bisf1bkoGAsry7V7qE+uk3j9pq1tsofNf4nU=; b=Sn2XEikwDyexxL
	zaASPXQfwTUmjC8bGfFtc9ypAwOi1ZSb0CH2OAwGa87sGhhyZuoQHU/rUb2bBnU2LmyCA5PZKZf2Y
	cXZCya8SMOYEg6oK2bMqWhMIHVaPAZ7WgAjDxWTTR/ImdQAuYbH5HnQ4/r8ciGZRG6kFNets+Mzq/
	T8Dx0cv+wrNnwOjj/ZX1IgCYxLsEEKWY24cLlmdMbsItQn6IiEkYp5etnJMXeSVyBLlnFFYa+yj+5
	STS5c7lti6Vbw8DQLgOmOhKloKtfOZI7wt/9Btd4gpY2bUVQCe4TKvDRkT2zieaG/0+laKejEZtCU
	/+Ldjy9ER2NRJ/nh9SoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nWivl-00BpiT-FG; Tue, 22 Mar 2022 18:08:29 +0000
Received: from mail-ej1-f50.google.com ([209.85.218.50])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nWivY-00BpdC-PI; Tue, 22 Mar 2022 18:08:17 +0000
Received: by mail-ej1-f50.google.com with SMTP id yy13so38011350ejb.2;
 Tue, 22 Mar 2022 11:08:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:from
 :subject:content-language:to:cc:references:in-reply-to
 :content-transfer-encoding;
 bh=xklhjzZKzADY2xRK99pbIfVzHLVmN5wMRTs9ZPfdbng=;
 b=34LPG8epjF3bjcGl6G/j0cbwUpIqkUpZ7tidqCDTXt5g4Ij6uspeakJo/5J0FBCGQk
 MeztKarclIci+Da7ohonlik5voBlr96w68jWz0uf9hnddr8Fh7iJPn1nXedm1JRFhKSg
 lNzRt5HZVvdVCYMZLtmA+yfgTGwsqEqjsE8brXczKBvVSM3VngnH5ALuNsXcQpXkrLJ4
 JyAg8ijVlWc+1BZ5+4v2QHJg28Je1w7n9IPeg3o81+S+pmkPIMGfHWYaaD4leIEKIn7t
 669Gup/MhI1Y3a1F/uS1+j6f+9odSMxvhfkpNTWeoE4qF174JlRQPVhxhWN7uYWpByzm
 6tkw==
X-Gm-Message-State: AOAM533FD/mO8PRdi8ppcLaNLnmC+QuYCS+/lCW01gpVySwTKV24KjcV
 urIaiLkFUgR3Ki3qh8+RO8I=
X-Google-Smtp-Source: ABdhPJxUAx4IdVJWahehxkglRm1NqufvIFeuOA2YpXQp/NK47AD8PHQ9rSGI79bpqQ4VfewQip7ZhA==
X-Received: by 2002:a17:906:58cd:b0:6df:f5f8:3037 with SMTP id
 e13-20020a17090658cd00b006dff5f83037mr13658660ejs.531.1647972494886; 
 Tue, 22 Mar 2022 11:08:14 -0700 (PDT)
Received: from [192.168.0.17] (78-11-189-27.static.ip.netia.com.pl.
 [78.11.189.27]) by smtp.googlemail.com with ESMTPSA id
 l20-20020a1709062a9400b006ce71a88bf5sm8516663eje.183.2022.03.22.11.08.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Mar 2022 11:08:14 -0700 (PDT)
Message-ID: <a8eb005e-3fa4-ef60-c94c-5a6decb7a5df@kernel.org>
Date: Tue, 22 Mar 2022 19:08:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v3 1/2] dt-bindings: phy: mediatek: Add YAML schema for
 PCIe PHY
Content-Language: en-US
To: Jianjun Wang <jianjun.wang@mediatek.com>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Kishon Vijay Abraham I <kishon@ti.com>, Vinod Koul <vkoul@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Chen-Yu Tsai <wenst@chromium.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Wei-Shun Chang <weishunc@google.com>,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, rex-bc.chen@mediatek.com,
 randy.wu@mediatek.com, jieyy.yang@mediatek.com, chuanjia.liu@mediatek.com,
 qizhong.cheng@mediatek.com, jian.yang@mediatek.com
References: <20220322024705.9665-1-jianjun.wang@mediatek.com>
 <20220322024705.9665-2-jianjun.wang@mediatek.com>
In-Reply-To: <20220322024705.9665-2-jianjun.wang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220322_110816_858437_61E65A7C 
X-CRM114-Status: UNSURE (   9.62  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 22/03/2022 03:47, Jianjun Wang wrote:
> Add YAML schema documentation for PCIe PHY on MediaTek chipsets.
> 
> Signed-off-by: Jianjun Wang <jianjun.wang@mediatek.com>
> ---
>  .../bindings/phy/mediatek,pcie-phy.yaml       | 75 +++++++++++++++++++
>  1 file changed, 75 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/phy/mediatek,pcie-phy.yaml
> 


Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>


Best regards,
Krzysztof

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
