Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DDB9C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 29 Apr 2022 21:02:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9ZSd0YJgeEjH0SXo6kLCHMDq3hrs7MRwFvhQKZAXydc=; b=Z+7FU4vUyGO0z/
	66Dn5y3jVvVvRjP2yP8ogkYH/pHsSO3AyNS6PFnt2PZe9+0WepWhUs5LL8q2QMWizxwSb5WgxMN6d
	Ul5rWzfLglAD29zCoAoUvsjB2jzkIn9xtrwufsrJbcpNji4uEklKnRwZ6KbaYlMPfDT2vLz6SPkLZ
	bR1Y1qX/4hS43tRtvRnlD5X3h+HkEINLX9jtj2jF/MT9EEgj93gtGfDFSR332d4XEPOVJ3z0bYW7X
	TPvk0zvuYxoODpBpjcciEQhBOnTyqxf0t9sgQzUaWDwZ2CphYTahhaioX4PydzxYvzOG/miptfkaT
	/FT/ZQQJmqBmKA9zxSMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nkXl9-00CguW-M1; Fri, 29 Apr 2022 21:02:39 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nkXjC-00Cfs7-JG
 for linux-mediatek@lists.infradead.org; Fri, 29 Apr 2022 21:00:40 +0000
Received: by mail-ej1-x62f.google.com with SMTP id j6so17568121ejc.13
 for <linux-mediatek@lists.infradead.org>; Fri, 29 Apr 2022 14:00:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=k+FLEaNOSlEZQgu+29CSWk5IjfdF4HGnJSzB2OIKnM8=;
 b=x7oX3LjaOjtefLkFeO1lfDimV4wlwSgqTHvXxjvzfFsgSznI/BNVeHchG5Vp1ycoGn
 6k+Q1ObllNBs2MPJ6e2M5I2HXhi7+XdSznQxo0xTkWwm2IyxxExE3QmAIGm5D8iWvYhl
 qSs+w87c/MjCdApC5C7chhvDTDjQd7Xsi+xrKtGNasicVrgymiuiqjgKAHaX3/qH3xcw
 i4SRReozeEenNuZ0+wfNtXl4BwpW4aZDH8y2YY6paDFXouFiVn7a228C2W8swy0QfVi7
 pxWXrAqcDJvZmTzsJ05GSBLb6sr32+RVq73JDprpkzwMzDdXpJoUzPcLKochMS+ZalvE
 Lihg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=k+FLEaNOSlEZQgu+29CSWk5IjfdF4HGnJSzB2OIKnM8=;
 b=OYOaynNQRat0vg/TpDGdPNuiy8kdsjQPUNQRHO+fzCf7gDmjbw82K/rmaC5NHzhO5X
 NT+YQRH8yt23+LBi09FZ0J4AduyPTUY1yjnqIXYSOO8NKJitc/jRuW8UqSVcyMITKZEl
 U8ItL3LmLnBybfwJDiGx3QIBm2ZygCd6NZIxODsROqWrSxMMl9utPdBOwFIILUqUSMd6
 g5mxQ6PGZqq15NBO7YZSWwIKnyDBYcRr+zovisg7KAEGZlejLO2cs0/vBFvDLqOR7HxM
 mBGMRw7mU/kYmDGZM8DLOFTc+lLmWE4jafZ/ogdbQ3I4FAFWspGZ+J6FhMkypPfRSbmp
 Iu1A==
X-Gm-Message-State: AOAM532O/cCtN21blAHeEytg/K4E3kZ5MHEIW1ST/Hg184JJbNOyXz5I
 fAKGor1cXuMVM+Yw1ksX3SIyqQ==
X-Google-Smtp-Source: ABdhPJw53pKMx9sI0aKBMCgGj/gUj/W0YSBOVUjOj6Oco83loSg4sAKu3bV6ZFbp/vCWQZx1JXQPVw==
X-Received: by 2002:a17:907:1c06:b0:6df:b257:cbb3 with SMTP id
 nc6-20020a1709071c0600b006dfb257cbb3mr1042874ejc.631.1651266037074; 
 Fri, 29 Apr 2022 14:00:37 -0700 (PDT)
Received: from [192.168.0.176] (xdsl-188-155-176-92.adslplus.ch.
 [188.155.176.92]) by smtp.gmail.com with ESMTPSA id
 qz24-20020a170907681800b006f3ef214de0sm973786ejc.70.2022.04.29.14.00.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 Apr 2022 14:00:36 -0700 (PDT)
Message-ID: <32712c76-df62-9a02-fbb0-14f97417feae@linaro.org>
Date: Fri, 29 Apr 2022 23:00:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 1/2] dt-bindings: soc: mediatek: devapc: Add bindings for
 MT8186
Content-Language: en-US
To: Rex-BC Chen <rex-bc.chen@mediatek.com>, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com
Cc: neal.liu@mediatek.com, runyang.chen@mediatek.com,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20220429065429.7957-1-rex-bc.chen@mediatek.com>
 <20220429065429.7957-2-rex-bc.chen@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220429065429.7957-2-rex-bc.chen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220429_140038_753334_7CC16923 
X-CRM114-Status: UNSURE (   6.66  )
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

On 29/04/2022 08:54, Rex-BC Chen wrote:
> Add the dt-binding to support MT8186 devapc.
> 
> Signed-off-by: Rex-BC Chen <rex-bc.chen@mediatek.com>

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
