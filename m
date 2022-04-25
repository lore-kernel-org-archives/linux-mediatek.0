Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D58F1C433FE
	for <linux-mediatek@archiver.kernel.org>; Mon, 25 Apr 2022 08:41:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=b8tb0Ptk3XtUFPsn8GpLqBu6HqjwcmwXjhY1yRyybGg=; b=zSTAdkiSbySWJf
	TXgL6bHqPpXrW+6zh7kLJpA6qobcBQWqFGFxTBq8bBsr43+PUHtIzM3/0QT+7RrDzOSi+QpNWrU1F
	YpD+tiJhfO2gWjbCV7rnA8QzqVpO+wuOsiJF4KLehgk2Um5Hhg/RiU1tIaPsKaJazqJTmhPJmhvJT
	+B9P0tKaQUkfJvVg0DaHN/q4vX6wBqVjgtx4uc0ecwdkqU0/iBI6hvGKsZ5UDulG5jYRiGWXnRpaD
	Y7LxG8ZNnMVv1iznLXCsN1mCNKJRpPbkyeS/msIitz1ivozGlI5Kg87Xab8sj9kIK2B4yhMSJwH0u
	jF4dsf5tH8O9UaYkHkrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1niuHu-008mWk-Ft; Mon, 25 Apr 2022 08:41:42 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1niuHq-008mUX-SB
 for linux-mediatek@lists.infradead.org; Mon, 25 Apr 2022 08:41:40 +0000
Received: by mail-ej1-x632.google.com with SMTP id i27so28171218ejd.9
 for <linux-mediatek@lists.infradead.org>; Mon, 25 Apr 2022 01:41:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=+pzRVC0gT9zFiZtrDMedaHXZTcAEp3gFNZ9jUtyJUSY=;
 b=gcfVAfz/SAa5L6EAzl0d7kO/pyYnSWLEY6OCjuijoNMVR99RSWK9cVFketV78ewi1H
 Ew0QpplSg3Y4hSY4ba2DbNsv6o5V+71OlPeDcLKm2YIMA5XS42Ip/OZzBNJ+jbyUIDOT
 snK3oFi0DQz4OfeKc0usAxbgN8t+KohsIfgiZnkAAXCQA6HRVBIVOaC/Xm2zM/2Ebdhh
 vcTiT0uaEYLi8y7pL3L1SLnqMPCjU9o0GVqoSatDU3ljfwmxf0Gd9w+Fe0Qcg6XOZzJJ
 Se1aoaTJ0DeTwQA9oaDBdfM1XMGOrIAySC8azw4lJtpiQ94CU1UcxeDntWJ0IPZ99BnA
 SUUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=+pzRVC0gT9zFiZtrDMedaHXZTcAEp3gFNZ9jUtyJUSY=;
 b=v8JDQRSgvyEc/oiRdo9An/VJe1D5k11D8EoXfCYZZn0QFH11X30LYlOeRywm+W1ZtH
 Awp8lMUQU6U0Q3WkuonzjtBdygKkeKWEV8A/6lFYJwGllIdSSf3ac23ifLPWO4wTKbWA
 zfNorOfTGSUWr5S5+5mBncrItId/aAlO1pbpiSdJb0HnkTV17yicQu2vtuS5tMv/vZx5
 FuohPpG+HGv/S1wd8y86sxfdyMIz4QkHMO4wfMHnIoZY91cqxnHPz/DHRSfHWVOKzvBn
 lIw05a8SFoata3jvjhroxNAvFTJI8dEVcULCBv7bZGa7W3HtCy3x953Hsp9gN6z+WnN+
 djhQ==
X-Gm-Message-State: AOAM533I0E1u//o6tXON4KdKDlsvNUzb6S5DOLJiIzdcqJhVN4rbq62F
 OWk3nI6ey1yRMrRDzXh+XSaCww==
X-Google-Smtp-Source: ABdhPJzUz/psaa+nbuSchDlMQ1Kx2x7dlomMaZKQcYPZHDJjZTlyyQ5QQ+jEZR6VnuzLVIoagHwRiw==
X-Received: by 2002:a17:907:3d94:b0:6f3:8b47:cd95 with SMTP id
 he20-20020a1709073d9400b006f38b47cd95mr5577978ejc.134.1650876097639; 
 Mon, 25 Apr 2022 01:41:37 -0700 (PDT)
Received: from [192.168.0.240] (xdsl-188-155-176-92.adslplus.ch.
 [188.155.176.92]) by smtp.gmail.com with ESMTPSA id
 bq23-20020a056402215700b0041d8fcac53asm4302602edb.23.2022.04.25.01.41.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Apr 2022 01:41:37 -0700 (PDT)
Message-ID: <9f5fafe8-c032-2aac-185b-8ecb5c52f363@linaro.org>
Date: Mon, 25 Apr 2022 10:41:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v2 3/3] dt-bindings: arm: mediatek: infracfg: Convert to
 DT schema
Content-Language: en-US
To: Yassine Oudjana <yassine.oudjana@gmail.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: Sam Shih <sam.shih@mediatek.com>, Ryder Lee <ryder.lee@kernel.org>,
 devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Yassine Oudjana <y.oudjana@protonmail.com>
References: <20220424084647.76577-1-y.oudjana@protonmail.com>
 <20220424084647.76577-4-y.oudjana@protonmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220424084647.76577-4-y.oudjana@protonmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220425_014138_977738_BBC14068 
X-CRM114-Status: GOOD (  11.88  )
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

On 24/04/2022 10:46, Yassine Oudjana wrote:
> From: Yassine Oudjana <y.oudjana@protonmail.com>
> 
> Convert infracfg bindings to DT schema format. Not all drivers
> currently implement resets, so #reset-cells is made a required
> property only for those that do. Using power-controller in the
> example node name makes #power-domain-cells required causing
> a dt_binding_check error. To solve this, the node is renamed to
> syscon@10001000.
> 
> Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>
> ---
>  .../arm/mediatek/mediatek,infracfg.txt        | 42 ----------
>  .../arm/mediatek/mediatek,infracfg.yaml       | 81 +++++++++++++++++++
>  2 files changed, 81 insertions(+), 42 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,infracfg.txt
>  create mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,infracfg.yaml
> 
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
