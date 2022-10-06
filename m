Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13792C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu,  6 Oct 2022 18:14:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d8ABriGxdAdRRDvUHYr/gAwn7wVwHz43N2tvfb4QIis=; b=bhwXnIsdFmZN8bQURuACmeLVCt
	zuqtZrBi9MBK5/jPPlLdQE+ZsRUZU7xevghFRZGkd6nVDJ9Q22OdteY7ZVA6SFt4w6oq3lDMFqT8i
	CzH8TIDS7A1FLhSc/DN453670JFLxceTjSoTycWHwhezvWVbYr5EtCWrI98ERWHnOPZxrg3Zj4uPQ
	hWQL4/i/bmubaHZaOeRHbkW4BKtQAdOKUkPBlFPBhgfdtGU9QuBrjII6QXhZeiYURDZZ9flL6vNEr
	corNf7hf/7UjxnbZ1VZO1yrkcKUVdY/CIXWrpH8c1xKaUiTotuGXlf8abTQHws7/1fLcWLsKuYZBK
	DjyT0n5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ogVNb-004Ouu-Vj; Thu, 06 Oct 2022 18:13:55 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ogVNR-004Oox-1h; Thu, 06 Oct 2022 18:13:46 +0000
Received: by mail-pj1-x1032.google.com with SMTP id q10-20020a17090a304a00b0020b1d5f6975so1470300pjl.0;
        Thu, 06 Oct 2022 11:13:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d8ABriGxdAdRRDvUHYr/gAwn7wVwHz43N2tvfb4QIis=;
        b=Wx4/CFUAKrc8nHs5KnFu4GnNl9xH2kc27XPJn9I/lWQ/+gU8q7uHdXD7fa7i+t9shv
         AnZHDlETi/dMvWNmlA9ffgYk0/aQKv55ybhPsdiGepJXSx0t1UxmIeR4ijmsypryZoIc
         eFD65yo/Mcx+x3ZQGGRNjf3gUsKSK74T/UV8KQ1y7JB4xI6gOwDH0F2RxXdRYUSxoFDw
         zsbYJWhlgIGenQV5Zp1A8QyHzvcGYGkTlsAk/s3V6aiP0dtke2D0iORbPbYGGT2Km6ov
         rnbqLH2VMFlTNFGsJQUak4k8oIQhi8JzYZlcjbbyBLq+W5p8frbzwcNxVn9zqya+oVmJ
         BTZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d8ABriGxdAdRRDvUHYr/gAwn7wVwHz43N2tvfb4QIis=;
        b=wyK48e9Pu6lOIeR10aAA8uHPNB4imQ1AE6qDMURotu9VfBwZyRt8QEwmRkFyfmKqVE
         GAricPNJ2nCIClDQREpacenQAW4+zJuXCPIWvADf0Sr/J5alIr8kf7FVRD4uaEn6v3pJ
         sW2MFg71u1Hd1xLidSyMJhHUe/JWXvylW+abEgtFbaBEgUUnjX6c3WIjtMaUQ3224HSu
         4q8CW+F5dlhY/mTNhPHlXNOfLpSU1n4ULb0n1cKdhPBan7tcqjSqdVJ5EkhxoheLAIxT
         7Luo+NbO1ZAyh0Z951pms0B/EJa3j5VNwECo+xjb3GviJhxD18h4GVVPbeWbWyd8jRu+
         bXiw==
X-Gm-Message-State: ACrzQf2xlO81zsHOtflB+HmyhocfmkFDgfGsYwcZ+zNNWSAKaNGT7MRD
	QwEgfrs0XUZFjc2KMRoH3x4=
X-Google-Smtp-Source: AMsMyM70i40gYKPUyK8N43ZxIcPOvPBUJSAW2HPlvZAJoGJ+VknU5vkMhTW+zN8TAsr0TKOi4x4CBQ==
X-Received: by 2002:a17:903:186:b0:178:2ca7:fae5 with SMTP id z6-20020a170903018600b001782ca7fae5mr654697plg.173.1665080022166;
        Thu, 06 Oct 2022 11:13:42 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id r18-20020aa79632000000b00561c3ec5346sm5411180pfg.129.2022.10.06.11.13.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Oct 2022 11:13:41 -0700 (PDT)
Date: Thu, 6 Oct 2022 11:13:40 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Rob Herring <robh+dt@kernel.org>, nfraprado@collabora.com,
	angelogioacchino.delregno@collabora.com,
	Project_Global_Chrome_Upstream_Group@mediatek.com,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 6/8] dt-bindings: watchdog: mediatek,mtk-wdt: Add
 compatible for MT6795
Message-ID: <20221006181340.GB761987@roeck-us.net>
References: <20221006120715.24815-1-allen-kh.cheng@mediatek.com>
 <20221006120715.24815-7-allen-kh.cheng@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221006120715.24815-7-allen-kh.cheng@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221006_111345_104210_9AA8D323 
X-CRM114-Status: GOOD (  13.95  )
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

On Thu, Oct 06, 2022 at 08:07:13PM +0800, Allen-KH Cheng wrote:
> From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> 
> Add the mediatek,mt6795-wdt compatible.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Co-developed-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
> Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
> Acked-by: Rob Herring <robh@kernel.org>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml b/Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml
> index 34c634d3eb67..3daf754fc99c 100644
> --- a/Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml
> +++ b/Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml
> @@ -23,6 +23,7 @@ properties:
>            - enum:
>                - mediatek,mt2712-wdt
>                - mediatek,mt6589-wdt
> +              - mediatek,mt6795-wdt
>                - mediatek,mt7986-wdt
>                - mediatek,mt8183-wdt
>                - mediatek,mt8186-wdt
> -- 
> 2.18.0
> 

