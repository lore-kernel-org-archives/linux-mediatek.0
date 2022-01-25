Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D08EC433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 25 Jan 2022 13:20:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UwnU9+ijEelB8MIfdNia6JJeMacDBLriY7oJTUMwcLU=; b=tlmthMQOgfF+Hf
	2jt0Zl+yxM7LCQfCzI4lnAL418l4BSjfSO6Ho+gO4WOq21yL7B076AKTw5TGCBCLQEwXM+MbQ/4V8
	84A5E+LVUTBz+D3Yh3ED9GQMD4zcRSftGUPqsAVd6KWpoIcJn3gMX5T4S2nxpy0bcjwhLNDXNq2pe
	m5FQkHWOO1MFcIStYHpqy81FkCiKtpgJJfGniW5KFripLx8j+BVSR+GqYDk6Vm+mJXrWP8bYj32NJ
	8t68kUyQN0vckkbop0Nf6d+a7+eEX2dssBDX3bz2i10teT/pOgFCX95zoJUDoqsovLCZP7lRPRZB8
	nJyba9/5TKP9ewf7JKTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nCLjs-007tJN-Og; Tue, 25 Jan 2022 13:20:00 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nCLjh-007tGD-3W
 for linux-mediatek@lists.infradead.org; Tue, 25 Jan 2022 13:19:51 +0000
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 3052F3FE09
 for <linux-mediatek@lists.infradead.org>; Tue, 25 Jan 2022 13:19:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1643116780;
 bh=7H+kwmtltVSBKx5eHk33vYDBjpgrbeevYoDgB27H+CI=;
 h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
 In-Reply-To:Content-Type;
 b=lokDWwC6CE9N/xXzBGFrWAkmoqIQt5tP7uAgs8+EQzRKp0ED6fVN7Yef4QIMOp97s
 jg2KVzr9h3dwoISj8WO9mPnp96YT9boiNcoBnXQO950r8/CZpAlUus8yi8n+LGtF3i
 oAwUTJtNhwVj6iBUj+i1rbjs6IRf911/cqtZE5b8ucyfbVsGZXmCBUnMXAWeRCimE2
 a7sci0pgBRa3gkm4s3ruBSCz60GiTcN+4thtK38rH/XyqgDwSTG7U73L72FA1w96Vu
 F43EV44S/rx6aDf5H44SsC1tvZHxFefhyDagpqG1mjO8BZHwwYzKicBzTViBvqQFcL
 oZNxRZzxV7F5w==
Received: by mail-wm1-f72.google.com with SMTP id
 l16-20020a1c7910000000b0034e4206ecb7so1449889wme.7
 for <linux-mediatek@lists.infradead.org>; Tue, 25 Jan 2022 05:19:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=7H+kwmtltVSBKx5eHk33vYDBjpgrbeevYoDgB27H+CI=;
 b=HpKf4uf6HehqUwlvwhD3kID1rzOCDPcoY6WtFe4OIe66Wu7E1N4l4xBsXoca2EwCB8
 6RZ9avXVfG9l1VGX2RkeqpgWVFs5NBsM1UllZNw9cxUUgdHeI8EUqtFDlUkC5cc8ltQT
 8HDTq6mHxIswfYASr8s2cqPwyouUoYbHOIfU/QeXz/5W51etdv3lOUqjh2r575rQC8pZ
 PVZw4JzjF4V7diouI3fCuI8JMqyAytXhRUf3nDUsnQr/FHfew1H4K9FmRgeUaQcnRAVX
 6cowbYBgRmhWyamqQop360cV7Gkw4hAGWAJPXSy8wyxb1GZkdorEJuri6Vg661oDktFp
 yp1Q==
X-Gm-Message-State: AOAM532LAdRsZoi7TchL2ShFmFdr+3Otu7O3B6qb45sD2x5MfUpuAcxG
 aMcA4NThd3bS4k1+hAuTvxjIqxFEdjiEbLVtLPqJBd377tGUXR+UR3I9zWKU4QvpyuWK6P27Mry
 WMma6BxYjhRSznPM+oI0fqobCV4ed7nDKlN/Lhn9lukMCeQ517g==
X-Received: by 2002:a1c:4d0e:: with SMTP id o14mr2930723wmh.1.1643116779834;
 Tue, 25 Jan 2022 05:19:39 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwa5CbjVgAdTzjpJrtsTBt6f96wmnehH2oqiBhJobNl5d/0gRlB/5PGKzta91V9mOV7mtz02w==
X-Received: by 2002:a1c:4d0e:: with SMTP id o14mr2930685wmh.1.1643116779550;
 Tue, 25 Jan 2022 05:19:39 -0800 (PST)
Received: from [192.168.0.57] (xdsl-188-155-168-84.adslplus.ch.
 [188.155.168.84])
 by smtp.gmail.com with ESMTPSA id l20sm552432wms.24.2022.01.25.05.19.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Jan 2022 05:19:38 -0800 (PST)
Message-ID: <9ce18ea8-caed-7d46-8f79-725561429f57@canonical.com>
Date: Tue, 25 Jan 2022 14:19:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 1/2] dt-bindings: mediatek: mt8186: Add binding for MM
 iommu
Content-Language: en-US
To: Yong Wu <yong.wu@mediatek.com>, Joerg Roedel <joro@8bytes.org>,
 Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Will Deacon <will@kernel.org>
Cc: Robin Murphy <robin.murphy@arm.com>, Tomasz Figa <tfiga@chromium.org>,
 linux-mediatek@lists.infradead.org, srv_heupstream@mediatek.com,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, iommu@lists.linux-foundation.org,
 Hsin-Yi Wang <hsinyi@chromium.org>, youlin.pei@mediatek.com,
 anan.sun@mediatek.com, xueqi.zhang@mediatek.com,
 yen-chang.chen@mediatek.com,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 mingyuan.ma@mediatek.com, yf.wang@mediatek.com, libo.kang@mediatek.com,
 chengci.xu@mediatek.com
References: <20220125093244.18230-1-yong.wu@mediatek.com>
 <20220125093244.18230-2-yong.wu@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20220125093244.18230-2-yong.wu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220125_051949_389195_1964B368 
X-CRM114-Status: GOOD (  12.20  )
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

On 25/01/2022 10:32, Yong Wu wrote:
> Add mt8186 iommu binding. "-mm" means the iommu is for Multimedia.
> 
> Signed-off-by: Yong Wu <yong.wu@mediatek.com>
> ---
>  .../bindings/iommu/mediatek,iommu.yaml        |   4 +
>  .../dt-bindings/memory/mt8186-memory-port.h   | 217 ++++++++++++++++++
>  2 files changed, 221 insertions(+)
>  create mode 100644 include/dt-bindings/memory/mt8186-memory-port.h
> 


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>


Best regards,
Krzysztof

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
