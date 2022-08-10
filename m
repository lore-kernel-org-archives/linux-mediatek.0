Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF570C00140
	for <linux-mediatek@archiver.kernel.org>; Wed, 10 Aug 2022 16:49:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9OvaNNBpYBwgLNPnv7oZmElWAX/FthLtpvHqRRqBtkU=; b=BxXZyyJugxkk2roqdlevVQtYQ5
	4F45g9P/7ssNWYNW5+BOPw09U0SxbJqyVC9a5U02lE4hPaxkMuUuL5ZbT64JJeBdsRvPzbsl7sVy3
	PZdlUuIt6osBOtSnAUODqCzFuTnSMlDII+yAPacLi9HQAid3yXvluTzL7767F54rISGrW+rmaSMHq
	Nn5vpDaktlX74jQ/BPpHugT20Wh2JIafBe3gB5G97QxN6u6Malc/ibJzaQaxYL9Rat/wNYHcRubX3
	q/jjN2RI+ImBSBz5RiF32ELuZWPrbkYWCbp8Ryay+EGUC0HXQZZaACRYXlDYTLHiFPCySjx9Disl2
	Bsw2AwSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oLotV-00D2oX-NW; Wed, 10 Aug 2022 16:49:21 +0000
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oLotQ-00D2i8-Uf
	for linux-mediatek@lists.infradead.org; Wed, 10 Aug 2022 16:49:18 +0000
Received: by mail-lf1-x131.google.com with SMTP id a9so21996792lfm.12
        for <linux-mediatek@lists.infradead.org>; Wed, 10 Aug 2022 09:49:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=9OvaNNBpYBwgLNPnv7oZmElWAX/FthLtpvHqRRqBtkU=;
        b=CFqmbTlVjqivEoe67/oqyI+2x+udBtDwihaeRDF2Cppaa1zBJPtTVpGj370B8XwYWH
         fJiclMc72Ced+0tnOKQtmt4lisZ4xOasPgXe8LPaMcVi39LywC1vJ0VWKc0Ie+W+FDlZ
         0z6zbvmKajLZB+nCfxrXiMGIHv1axn3xqNK+VGPaARJ7o3C4JjPxkQNqJyyfqNPx0mfJ
         i1218/dzKTT+HTeoPFpSvv/9taQv2HgZeQ8Ao3aZT8vpxgaQtpb2cxfyf1wgJjGAG/IN
         Q0WMlJMfZ+n3vu0MeWtajmQQJRMMzVHIkQiczjriI0ijoJ4ZTkG5ROhbdmx5nvUfwNcI
         7Cpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=9OvaNNBpYBwgLNPnv7oZmElWAX/FthLtpvHqRRqBtkU=;
        b=hxxcNub99tKxbTN4MJ+USBP4lD8+/6SbjvzMhsnPZGxoRtdmynfDF+ukoTOlS4bKr1
         gQ7uYEXO2mP1shvnf7GpiIMKc033PDRFL1juVNJZtyjjTe6ZxkEW2cqaJ8REPnj2iDHe
         Hr6yezTPB0Xz8P5sn2uWyzQHBEI3stRfB5wz19KW402yNAB+eTE9JZqVNJN8/Guiy9pJ
         j/ye7Kndhf/5zcR8IHVXmsIUJ9rkYMwkGcD9NlwyaEJ5uGubeGfoCAgBFjH+FHXrQHNT
         OGbm0TKCuJcPthnGJTU/o4ExlyoGaIZiwUzG/o55zY6IEx4EXW1V8tL/a5JnWcdFWfHP
         2vGw==
X-Gm-Message-State: ACgBeo2KcQnA4Q4XBN+XJU97nck/hE9h974S+JlGDMvIYz3qqvnRqSJM
	m/WTGmqCXXuq+yrY5A9clBTzSA==
X-Google-Smtp-Source: AA6agR4qPivxoDIsQnpqC+kG7cTrUaCsJ130eoJUjZyWkGIVYS+6ixZZ4ohyh/pZ4zaN2svHMlgsJA==
X-Received: by 2002:a05:6512:c0c:b0:48d:1e9d:aa14 with SMTP id z12-20020a0565120c0c00b0048d1e9daa14mr1780455lfu.322.1660150154276;
        Wed, 10 Aug 2022 09:49:14 -0700 (PDT)
Received: from [192.168.1.39] ([83.146.140.105])
        by smtp.gmail.com with ESMTPSA id l14-20020a19494e000000b0047f647414efsm395286lfj.190.2022.08.10.09.49.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Aug 2022 09:49:13 -0700 (PDT)
Message-ID: <5a6545cc-97a2-7aa8-7b67-6488154e9db3@linaro.org>
Date: Wed, 10 Aug 2022 19:49:12 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v4 1/4] dt-bindings: mediatek: watchdog: Fix compatible
 fallbacks and example
Content-Language: en-US
To: Allen-KH Cheng <allen-kh.cheng@mediatek.com>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck
 <linux@roeck-us.net>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 nfraprado@collabora.com
Cc: angelogioacchino.delregno@collabora.com,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
References: <20220721014845.19044-1-allen-kh.cheng@mediatek.com>
 <20220721014845.19044-2-allen-kh.cheng@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220721014845.19044-2-allen-kh.cheng@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220810_094917_104678_38C41875 
X-CRM114-Status: UNSURE (   8.43  )
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

On 21/07/2022 04:48, Allen-KH Cheng wrote:
> The watchdog timer of mt8186. mt8195 and mt7986 have their DT data.
> We should not use 'mediatek,mt6589-wdt' as fallback.
> 
> For mediatek,wdt example of mt8183, We remove mediatek,mt6589-wdt fallback.
> 
> Fixes:a45b408a020b("dt-bindings: watchdog: Add compatible for MediaTek MT8186")
> Fixes:b326f2c85f3d("dt-bindings: watchdog: Add compatible for Mediatek MT8195")
> Fixes:41e73feb1024("dt-bindings: watchdog: Add compatible for Mediatek MT7986")
> Fixes:f43f97a0fc0e("dt-bindings: mediatek: mt8183: Add #reset-cells")

Missing spaces around SHA.

Best regards,
Krzysztof

