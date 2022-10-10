Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB973C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 10 Oct 2022 13:05:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6lm2S6p7VPlLo+Kc/ZQ+8NqMDhlla7JGgp2wlIKkBks=; b=og+88oMvrQ0SE58wrL4GOXevhu
	oS34c8/51Vt0wfuD2sHqKDtf0a9X5kYBtp32kIQALaipwjRoRaxc/vPdhxXNwqZadasek0/JtaP++
	Jbsmgb3r4hNRktsbEaD8+3ryxf94sgdbg7dP5ZapLO0YULOcfHma26OD05qm+ZHGnDk6R8oX2T2DT
	x9oN7MefSRrDVFE519joz33OgfizwhsxGC/s4udFU1Xe3DVaUTd0O1GAQM7eHRRPLH7/WXlY7qXD9
	M7qS69RSc9eQySzQOf679ojkmJv+yCyLGGu18izz5w3iM3C/cmlKCWwzgj/E1HDtaSy7Bp7wGM/ET
	HntiP5Gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ohsSm-000x75-TX; Mon, 10 Oct 2022 13:04:56 +0000
Received: from mail-oi1-f181.google.com ([209.85.167.181])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ohsSk-000x5O-87; Mon, 10 Oct 2022 13:04:55 +0000
Received: by mail-oi1-f181.google.com with SMTP id g10so5361306oif.10;
        Mon, 10 Oct 2022 06:04:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6lm2S6p7VPlLo+Kc/ZQ+8NqMDhlla7JGgp2wlIKkBks=;
        b=AgWO2xSDPVJYoyBqSnXnNzwU24+NSPn5MK/uXkIXXPxGs2e/cZM09jM4GwBeCwsjG9
         0c9ygQEhFsyY4axHJJWgtq+XriijVr4wBi9+xcQqZTpsuNr55qEIst6HAvqfu+AVkUFm
         Kw5uBZd2a6IiJqmNi90Y6PwkeA+6sr27a5soZWlPldepYE0hcHX6HZUsDV9quzo3JaoV
         EX5+n9nP41dgkC6zkS7Mo0F6TxAdFSQDotiZbi3E6FcCwQnyUHq/TynGxtrEccZG6SwQ
         ruwjGrGDZA2KGDVr3k2lDpOYtmj0qxnuJK4zs5eR47N3w9rP3g6LurRuF2qzWyzOClwd
         bO9Q==
X-Gm-Message-State: ACrzQf34cbPifEv6G1CVCGWNS9Y5+oyUxuDRanATo2c056elzVmNmhBy
	RU6FNpqCi3D5h4BjRsKkPw==
X-Google-Smtp-Source: AMsMyM5J/JuIjQl3C0ten6ocXj1sk6nbEOlYNykegpDE87fe//pDYjb5k9JFQmxrNWu/mJy0Q73TfQ==
X-Received: by 2002:a05:6808:1648:b0:347:b631:cc80 with SMTP id az8-20020a056808164800b00347b631cc80mr9059217oib.238.1665407092143;
        Mon, 10 Oct 2022 06:04:52 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id r10-20020a056870e98a00b001327e6f230bsm4922004oao.27.2022.10.10.06.04.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Oct 2022 06:04:49 -0700 (PDT)
Received: (nullmailer pid 488759 invoked by uid 1000);
	Mon, 10 Oct 2022 13:04:49 -0000
Date: Mon, 10 Oct 2022 08:04:49 -0500
From: Rob Herring <robh@kernel.org>
To: Frank Wunderlich <linux@fw-web.de>
Subject: Re: [PATCH 1/2] dt-bindings: i2c: update bindings for mt7986 soc
Message-ID: <166540708908.488703.4873523437218276438.robh@kernel.org>
References: <20221009101631.82380-1-linux@fw-web.de>
 <20221009101631.82380-2-linux@fw-web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221009101631.82380-2-linux@fw-web.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221010_060454_310251_E0C2513D 
X-CRM114-Status: GOOD (  10.26  )
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
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org, linux-i2c@vger.kernel.org, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, Qii Wang <qii.wang@mediatek.com>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Sun, 09 Oct 2022 12:16:30 +0200, Frank Wunderlich wrote:
> From: Frank Wunderlich <frank-w@public-files.de>
> 
> Add i2c compatible for MT7986 SOC.
> 
> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
> ---
>  Documentation/devicetree/bindings/i2c/i2c-mt65xx.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>

