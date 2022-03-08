Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88293C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Mar 2022 14:17:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gyvW0QR1xmbTCdbh6Lizu7ar7gRw6uG+uVUupbNL4t8=; b=bx31V4hZO7qKb4sbTdUkCzNlkn
	ZMMs/jVRkVr0lhrDuxqg05L+jlu971lxBtNgzDp4Xlq1Ofd72PpFeg5qoqkEdYVvkxS6NloxrcmFX
	gs5mKt8icKhmT2drnU5wfef391sQg1JbWYdeRd/6MkXalNhuWKnnUn0EIjKOFnOnORR6/V0JOVUIK
	WT9NAzXZ5Pa8g/6Tf6ZU9oJ0kdGjOTWZjBToSVrxhnvq/yt3Zz+60PaTuSwDfPB/5YClNAD35DyUe
	OnP/NHRWD4Msnri1y80ZKhpRSopkJtoMo88le+5p4WEtWpnsGnzdea/L4fs5pRw0op7Pi4peRYIto
	oWAn4u6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nRael-004i64-S2; Tue, 08 Mar 2022 14:17:43 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nRaeV-004hzI-1d; Tue, 08 Mar 2022 14:17:28 +0000
Received: by mail-wr1-x434.google.com with SMTP id h15so4429470wrc.6;
 Tue, 08 Mar 2022 06:17:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=V8TIHc0j5BWltEXkyzmvOawt/D8EVJ6xLmc2G9cv1xY=;
 b=K4mICRpvPbg4yfk1/E03sYIpk212hPRiJBfYlEqJWOqDQD0I1S4dC+Lb9H2kmvCuO2
 y9PR2ugdSdc9C69y5TRmJ23a+wY5+uJInO+y8614FH1gLjK0WYe8sJ5mQiWgkw4EdVFc
 oasQc05uCh50MLN2NaKDTj7KDaIz8yv5BmB/sLv+YyxYGpSVGgIGgAwk/J8umYukIg/c
 d4UJSdEg2FvqE27PF3Jm4nKcZJY9YMcX+wC8oNanxi9PVyCrcmG3HDGAaZQG0++izngK
 91pvCR3JbVz6fLNzVp49gK7qe2f+jgSn14f2EUtlKR6loZY+ftJhoaWiRIq4bVQurVAJ
 2zxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=V8TIHc0j5BWltEXkyzmvOawt/D8EVJ6xLmc2G9cv1xY=;
 b=ebwDHQZSaZ2v1e5e1gLwUirXz1amdDc7Sz1UvM7NPGxqgcp2EsOM9jRfEXWdqLCjnv
 bihasw5m7EL80P5Q18w3/GgZ8buUdHbfUdXXasL3Wqf6smkcaM+xntzzekhe/gkY2HZJ
 4S+QzOQnhP8x0/MB7VkMrhSm9necFx3znMq49V0tQWZRhd329H6bgcjr4Ie4Pbhpgdz5
 aItl0lW5ZEvBdBc2XdU6SXhkjbcFIsuZyTqLD8Kf4x3quODz4IrabcSSOPZtafeqV3mO
 b5MOyVbxbTYFW+IrCObXNAB3txsDZ39NBRO6wGNrld9uGTC6bTuDnWopyR3YKiSSoY2L
 bS/g==
X-Gm-Message-State: AOAM5336ko33xOPA1HSpe8x0/lUfz3ehNlbFBkqYJVVZfoH1HKhwxwx2
 IZI3wv0JQk6swf1dx7CJVHBJj5XERqVMZA==
X-Google-Smtp-Source: ABdhPJxmSrGi9ymzbuPvYZowQx0hfPeyCWJrAyYDfaErh/FqxdYePSY4ti4PFua0HMh9SPgP45MVUA==
X-Received: by 2002:a5d:6251:0:b0:1ea:9412:fc8b with SMTP id
 m17-20020a5d6251000000b001ea9412fc8bmr12140763wrv.657.1646749044470; 
 Tue, 08 Mar 2022 06:17:24 -0800 (PST)
Received: from [192.168.2.177] ([207.188.167.132])
 by smtp.gmail.com with ESMTPSA id
 l13-20020a5d4bcd000000b001f0620ecb3csm12818160wrt.40.2022.03.08.06.17.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Mar 2022 06:17:23 -0800 (PST)
Message-ID: <709dcead-8f00-3bd1-dbfe-0d1f6c228260@gmail.com>
Date: Tue, 8 Mar 2022 15:17:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 2/2] Revert "arm64: dts: mt8183: jacuzzi: Fix bus
 properties in anx's DSI endpoint"
Content-Language: en-US
To: Robert Foss <robert.foss@linaro.org>, airlied@linux.ie, daniel@ffwll.ch,
 robh+dt@kernel.org, laurent.pinchart@ideasonboard.com, xji@analogixsemi.com,
 hsinyi@chromium.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Chen-Yu Tsai <wenst@chromium.org>, arnd@arndb.de,
 =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>
References: <20220308094911.2680291-1-robert.foss@linaro.org>
 <20220308094911.2680291-3-robert.foss@linaro.org>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20220308094911.2680291-3-robert.foss@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220308_061727_159256_E6E6E051 
X-CRM114-Status: GOOD (  12.97  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



On 08/03/2022 10:49, Robert Foss wrote:
> This reverts commit 32568ae37596b529628ac09b875f4874e614f63f.
> 
> Signed-off-by: Robert Foss <robert.foss@linaro.org>
> Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Acked-by: Matthias Brugger <matthias.bgg@gmail.com>

> ---
>   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi.dtsi | 2 --
>   1 file changed, 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi.dtsi b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi.dtsi
> index e8f133dc96b95..8f7bf33f607da 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi.dtsi
> @@ -171,8 +171,6 @@ port@0 {
>   
>   			anx7625_in: endpoint {
>   				remote-endpoint = <&dsi_out>;
> -				bus-type = <5>;
> -				data-lanes = <0 1 2 3>;
>   			};
>   		};
>   

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
