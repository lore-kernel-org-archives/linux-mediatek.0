Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CBA4C4332F
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Nov 2022 10:52:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pmR2gwQyBIIv5dH4/maIZAZXpAasRwezdpF3Bi70/gY=; b=uHvJ2CiVzgGOXDJkIWsRFDR9Z6
	vCarmBl1ONGhTSNkL+jc2xash248vdA6zEdBxS03qcEk4qu1Z+j6xwz8Ttd+cBz3IOG5WNPzuY1WW
	/dBNufuEnjaq/U4l5jRIBY6lNNIL//Zy43yEj/dZRkyEPzvIKHvQukXGR4z2THygWQ/+y4HBKhxEO
	WxvxQhdVtmaFJpAG3xGG3VvvS5KIb+LFCqS6Uq1d2Q8qRDrH4i4lpNXfXTW/ICSbEZ9te43rDiGje
	zj+bz76EsIdnAsFiw9gLkyOV46nWavTuaSM70nlZjhfO5eYPqrzbIiBdEtAuEsdFLFV+TTmCLLbpw
	tX3rMSLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1osMDG-004gUB-2A; Tue, 08 Nov 2022 10:52:14 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1osMCz-004gKL-Gq; Tue, 08 Nov 2022 10:51:58 +0000
Received: by mail-wr1-x436.google.com with SMTP id a14so20337652wru.5;
        Tue, 08 Nov 2022 02:51:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pmR2gwQyBIIv5dH4/maIZAZXpAasRwezdpF3Bi70/gY=;
        b=ndsRlJ9mvDTTRtj69GkF4zUMWLofBaLY8RXsaa8eWq3e14obMsvlS1yFUES4/dPh9h
         p9fe0YbhiQecSuVe0nXHjVc4fE3/YcPJ1rUAUVEJnUwwbX8ZdyYyCDIhvIxK5QnnsuQ/
         2z2G9FrtCw8Wz4CYbzlhvuC/cqikWzZ5kr62L3t0yvLO+qY6cODOd1yPcICRJq4/98F0
         xNbUru5snUvoqKzxcXyCmDG0qGM1V1zSCaX44FP9xUTNWNQhr5+GYt3CWL+JutJ9zRqa
         OKIsGLsSwQ6c6gljETGPL2i0IJukKCF0Kd2MQ3O4k9Rbux44GdD088Q82fUMEa6FTNde
         2QFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pmR2gwQyBIIv5dH4/maIZAZXpAasRwezdpF3Bi70/gY=;
        b=n2z1n387pISXVUJQRla83/QDefDvq//iMMDyI7i3OrT8zQGP3wDYlB26iWLpONSidn
         fPdHp1QKpyU75kkeEWQvIvKQHqIHbnEV+UT1zX7Qf79/07oXx6xsnmBBuoiOTtQQx9yq
         YIXDhGKflixN/9BfoSOIEutTUQivo/puQcomIcwzNguDF9WzqliMyx+P4KIRqGjn2YlN
         tLcHNJ6MDOplUE66Osh2L+GoyLNlbg1+Rn/8tgPGLbj9/S4X9cElVqPNUiTv/GNG8GWU
         FBDlRGfU0pljitpwhp1FO5GpeG9lQXsV+38wZBoFibTUljZtQv76cJre/t0tDm8u9WR+
         Gc1A==
X-Gm-Message-State: ACrzQf3RymnbUNA6Fd5Wm62dyBl81bg6HEq4+Ytka+tvD5PDJJKl513z
	4WcLpgGpvG+xnG7RhwLNCFw=
X-Google-Smtp-Source: AMsMyM5XHhQmnbJXNKYRgdyg4VzWQzjipRFA07QQ/LYAHmHuE9SY0flHtWh4hsSakLlFmrSpDXes0Q==
X-Received: by 2002:adf:dc51:0:b0:235:4db8:2d3b with SMTP id m17-20020adfdc51000000b002354db82d3bmr33772138wrj.589.1667904712653;
        Tue, 08 Nov 2022 02:51:52 -0800 (PST)
Received: from [192.168.1.131] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id q12-20020a05600c46cc00b003b4ac05a8a4sm18084882wmo.27.2022.11.08.02.51.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Nov 2022 02:51:51 -0800 (PST)
Message-ID: <5c909107-f529-5029-f7e9-d7299f45fdf5@gmail.com>
Date: Tue, 8 Nov 2022 11:51:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH v5 7/7] dt-bindings: watchdog: mediatek,mtk-wdt: Add
 compatible for MT8173
Content-Language: en-US
To: Allen-KH Cheng <allen-kh.cheng@mediatek.com>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck
 <linux@roeck-us.net>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Rob Herring <robh+dt@kernel.org>
Cc: nfraprado@collabora.com, angelogioacchino.delregno@collabora.com,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 devicetree@vger.kernel.org, linux-watchdog@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org
References: <20221108033209.22751-1-allen-kh.cheng@mediatek.com>
 <20221108033209.22751-8-allen-kh.cheng@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20221108033209.22751-8-allen-kh.cheng@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221108_025157_600525_7E289434 
X-CRM114-Status: GOOD (  12.85  )
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



On 08/11/2022 04:32, Allen-KH Cheng wrote:
> Add the mediatek,mt8173-wdt compatible using mediatek,mt6589-wdt as
> fallback.
> 
> Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Acked-by: Rob Herring <robh@kernel.org>
> Reviewed-by: Guenter Roeck <linux@roeck-us.net>
> Reviewed-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>

Acked-by: Matthias Brugger <matthias.bgg@gmail.com>

> ---
>   Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml b/Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml
> index d9d4aa7e27e3..58055a1aed92 100644
> --- a/Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml
> +++ b/Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml
> @@ -37,6 +37,7 @@ properties:
>                 - mediatek,mt7622-wdt
>                 - mediatek,mt7623-wdt
>                 - mediatek,mt7629-wdt
> +              - mediatek,mt8173-wdt
>                 - mediatek,mt8516-wdt
>             - const: mediatek,mt6589-wdt
>   

