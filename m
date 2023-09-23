Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72CD4CE7A88
	for <linux-mediatek@archiver.kernel.org>; Sat, 23 Sep 2023 18:02:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mkku8F0DMrFfXF0YIjXe4KyjDZIaTDOE7BzWPGxhwkY=; b=KhebHS5Q/caEX2vXdgcIcxZH4H
	3jr0dnI4Aa+V9HKK0vxEKRgdn2Cxx/A3qX1G1CUb64IANWkPwfIC6ddoDl5Fawu7xdrMR817V8ESj
	ydZC5etBs1tq93nk5PidhyBRv2JrJM9Xtx56AJoLEDLMRbof380nBrfC42MCkKORnLPKK2OaDFirZ
	Sqi8Q4EVJIfHiUREkOU0KaiE8rN+ER4WwLFcwATJztBotqxSZoEZ0IfFlFGOPPn0fvENYQrIrOPWj
	vFz0tmr924/BSL0AXXH1A6MUA+U5nYA5FX1Z07bP3N21JINwSlNWsAncuU8typo5RQe3uYRExXz4J
	ZeYXrBZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qk6xE-00BIAH-0u;
	Sat, 23 Sep 2023 18:02:08 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qk6xC-00BI8I-0P
	for linux-mediatek@lists.infradead.org;
	Sat, 23 Sep 2023 18:02:07 +0000
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-9b275afb6abso44274866b.1
        for <linux-mediatek@lists.infradead.org>; Sat, 23 Sep 2023 11:01:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695492110; x=1696096910; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mkku8F0DMrFfXF0YIjXe4KyjDZIaTDOE7BzWPGxhwkY=;
        b=kqUreD8pE8p/oI7RH5xWMOQKruHKnVUo2bXS/gUprj3asr+CfAm/w0ql7cE+kYA1CI
         f4vVlfwk/oQRdN+ii0chLuyPc6GkAMxe26GYHZHaJmhNE2WMp9nqevCyevgw0ghzuEGT
         Sdodg2WGW7pUYJwsYdSXxW3aiVE6GD+V00ThtsJKusNty/8LedlJdTEZLjqcRgzFjaSu
         7m4M67ENjVmmZxKVc7uvI1NkqaHuVuskVrlI91gLHPehj48CIvm4z4rHRNLP9/ln4+SK
         89GgsMVDwULI+4IPw1siiA2oJJvL3HS+SGnZTYnriB0oL2RMTwjpv9q0CDdSb2KKcEs2
         /HQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695492110; x=1696096910;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mkku8F0DMrFfXF0YIjXe4KyjDZIaTDOE7BzWPGxhwkY=;
        b=dAdpxnA0ytQDWuJgV0FNOxKho7CaSCnwDfTNAdYB1MfaX5h6oHQkb8Ru5rCfhEQeyc
         W1vBc56a8XRZlEUKqvT7w3gxcmliW8sOBTszCM1W7fwtFq/bIBD9P7LC+snSRF7fSVcM
         z1vCtuUne8kFiaUEEFuhfzeAFWzdLW6QufkPTTcyqEX2rE8xaFcFGwRiEUpXXgnwrBrn
         2yy4oNRMW3ARByfiPeJRKGNf9ks08IfTkPZyUnN8T5QEzaadze/ZC5LPgR2CZIR2qeoP
         +O/QcmaUsjMIZUoaB+yzgMYSclip/hyEV/1cM3ViXIHRnkEbD/ExvC0aJ2oobY2O1eta
         ztew==
X-Gm-Message-State: AOJu0YzBIp+ZWsvqxVpUdw9555OwRLIb5jwxM4NG3PVhjWwdezOBTGL8
	SP3VJ3Gw1fAeaTiyB8g7s7bogA==
X-Google-Smtp-Source: AGHT+IELmFBn2dpbejDFb/Fe2tZEBl+utRg6aNguT/ibSdIbYeXZPhhAouR4ibqW7DIdCESfHjVItQ==
X-Received: by 2002:a17:906:768f:b0:9ae:4a8b:fe2f with SMTP id o15-20020a170906768f00b009ae4a8bfe2fmr4486659ejm.11.1695492110260;
        Sat, 23 Sep 2023 11:01:50 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.100])
        by smtp.gmail.com with ESMTPSA id t21-20020a170906179500b00988e953a586sm4192183eje.61.2023.09.23.11.01.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 23 Sep 2023 11:01:49 -0700 (PDT)
Message-ID: <20372e40-e4fc-467a-d91a-fcf8e26728bc@linaro.org>
Date: Sat, 23 Sep 2023 20:01:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH 02/15] dt-bindings: gce: mt8195: Add
 CMDQ_SYNC_TOKEN_SECURE_THR_EOF event id
Content-Language: en-US
To: "Jason-JH.Lin" <jason-jh.lin@mediatek.com>,
 Jassi Brar <jassisinghbrar@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Conor Dooley <conor+dt@kernel.org>,
 Jason-ch Chen <jason-ch.chen@mediatek.com>,
 Johnson Wang <johnson.wang@mediatek.com>,
 Elvis Wang <Elvis.Wang@mediatek.com>, Singo Chang
 <singo.chang@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>,
 Shawn Sung <shawn.sung@mediatek.com>, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20230918192204.32263-1-jason-jh.lin@mediatek.com>
 <20230918192204.32263-3-jason-jh.lin@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230918192204.32263-3-jason-jh.lin@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230923_110206_160827_45AD0FAA 
X-CRM114-Status: UNSURE (   7.84  )
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

On 18/09/2023 21:21, Jason-JH.Lin wrote:
> CMDQ_SYNC_TOKEN_SECURE_THR_EOF is used as secure irq to notify CMDQ
> driver in the normal world that GCE secure thread has completed a task
> in thee secure world.

How can #define be added after its usage? Does it even make any sense of
being separate patch?

Do you folks in Mediatek have any internal review before posting?

Best regards,
Krzysztof


