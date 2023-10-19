Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65602CDB465
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Oct 2023 12:46:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CTgl6xngO65iKhymXT7HIetO51+xtsYJiS6ML4a8e/8=; b=qHlBEztnyr2iCdbY4PHFKlzKeB
	HDT1bVD/tNwkj4iRh+JSFKDraF1BUlY2cwbHkXoSMVuTWEDYtgiV8AtPGLIr3x7jvwonHUsRs2HGS
	4NhsoRevfKYG555tT1yk0UWxPg2XW0pSCOGUITtMTfZTkOFgPM3hQNmpLx76IKekZTxrq38sfMST5
	lbR7K/kxNCUVqf/3Zx3C9qRYbvOMqr1XErvBzJo6xBe77nkbD71CuuR1mrl0ENSPTcQ9WQD2TNTol
	s+ZWb/Fx7jICVStYxF5TjfWIOreoqulZEAwSSstrcj+Ce+nGvgo6ioJaAUPc3M6W7yXXKlB7k3Wqc
	4hEG3miA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qtSQM-00HMQt-0y;
	Thu, 19 Oct 2023 12:46:50 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qtSQJ-00HMOp-0O
	for linux-mediatek@lists.infradead.org;
	Thu, 19 Oct 2023 12:46:48 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-4083ac51d8aso16301665e9.2
        for <linux-mediatek@lists.infradead.org>; Thu, 19 Oct 2023 05:46:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1697719603; x=1698324403; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CTgl6xngO65iKhymXT7HIetO51+xtsYJiS6ML4a8e/8=;
        b=UO9iWbXtw6c6EiqF/RNOrAuAzjXB/QAq6HXM9Uvzk1D1DXUq63pGXVW8JVV5zsCZCP
         th668GzQucVvISmTdNw0jcYAbzi15cWvfGKlVA08Yteqt1U++ntTpRH2QTf/COLZi2hZ
         4V+CS+eO3XG37U/1Ydw46buRTPzbo8ZKCKUPbPyk+UCYW0d9cK44NO3ZondSArB/qvRJ
         0eUDxGj1M7TETfKdHgmE8pbiSY0Vabh5skT4VbFxa5hlrQL7RZQBorgojRW7ZWdnBhAT
         kyYheJj0/PhblDn9bHFkvXvvQm1Fn9zSSXhclwmsaxGvPOP3deVBFPXjRXrdG3EjVG1c
         0UUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697719603; x=1698324403;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CTgl6xngO65iKhymXT7HIetO51+xtsYJiS6ML4a8e/8=;
        b=h0kpt721Dd2F95wLj02U0H7VlMlaTkJVT3WAXOyfB5YTcaTDwVucwB7kQeTCSZKQSf
         Xqnl0B4rXQB+JRk+prZ0lrumlWMqTGiJr5w1vI7O0NaODZuHPCqkA5imV/I25U6NnsLT
         sWHhWWL876m+529mpvoEceVYuHBKKh+OO/3EKoX7FV4sXO3lp8Br4ttYYeiTsMXrxArO
         tYf8IOa+LTHigNBgriS3t4VIJtzLlYGECKssjB+yjb6R9B1y4K9R9i+nkkGTURIKYzFo
         yDEymznQFfo6c8UbgAmaMgPcDURPTg0IHyYd5yPtzuWmxAxRDXDR+ni+6OwFk+FsJP2B
         sypQ==
X-Gm-Message-State: AOJu0YzB9yJq5G58rbmA0+KaISpwiyt5wAezbX0UxF+hIEP1mD31KCvi
	87R+5nAXcczwR3tfPbx+ifHZ8Q==
X-Google-Smtp-Source: AGHT+IG7h8a4Xd5yDZnL4mNiude1M2sXIEnG8lQMAVhxRSv7BWqLsyYopBV+Dkbb9yKTdr/dF5LqOw==
X-Received: by 2002:a05:600c:46d2:b0:408:4120:bab7 with SMTP id q18-20020a05600c46d200b004084120bab7mr1794262wmo.15.1697719603324;
        Thu, 19 Oct 2023 05:46:43 -0700 (PDT)
Received: from [10.1.5.76] (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id r4-20020a05600c35c400b0040531f5c51asm4476866wmq.5.2023.10.19.05.46.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Oct 2023 05:46:43 -0700 (PDT)
Message-ID: <5b4e2ed9-c312-4df8-8d5f-65fb4a619b2f@baylibre.com>
Date: Thu, 19 Oct 2023 14:46:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/3] dt-bindings: vendor-prefixes: Add prefix for
 OLogic, Inc.
Content-Language: en-US
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-mediatek@lists.infradead.org
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Paul Elder <paul.elder@ideasonboard.com>,
 Fabien Parent <fabien.parent@linaro.org>,
 Julien Stephan <jstephan@baylibre.com>,
 Suhrid Subramaniam <suhrid.subramaniam@mediatek.com>,
 Ted Larson <ted@ologicinc.com>
References: <20231016215123.30343-1-laurent.pinchart@ideasonboard.com>
 <20231016215123.30343-2-laurent.pinchart@ideasonboard.com>
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <20231016215123.30343-2-laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231019_054647_159116_43948854 
X-CRM114-Status: GOOD (  12.70  )
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

On 16/10/2023 23:51, Laurent Pinchart wrote:
> Add a DT vendor prefix for OLogic, Inc. OLogic is a hardware and system
> design company that manufactures, among other things, development boards
> with MediaTek SoCs.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>   Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> index 573578db9509..247b724bc01f 100644
> --- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
> +++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> @@ -981,6 +981,8 @@ patternProperties:
>       description: Oki Electric Industry Co., Ltd.
>     "^olimex,.*":
>       description: OLIMEX Ltd.
> +  "^ologic,.*":
> +    description: OLogic, Inc.
>     "^olpc,.*":
>       description: One Laptop Per Child
>     "^oneplus,.*":

-- 
Regards,
Alexandre

