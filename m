Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9814AC433F5
	for <linux-mediatek@archiver.kernel.org>; Tue,  1 Mar 2022 08:51:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WiIc0dCiOrAYGMj2NAW25J6YYA9hpiBtZMNxwyf+JWw=; b=e2NoJY8PAifui8
	rjRa5HWlejLe6CvGf8Fzetp2A/eqebTpkFuaQRgcOmSY3fPbW99XuOgtp12J6kg/RYCT7RQC8hYQy
	7nES69CjLoUJ3Lqg3pvpsDQSPSi/vfEFQO6OFVNN0yLR1CQd9Bj4t9XcgFryxMWf2IOcFTaLsiO1J
	psa0SQeXH46kMZ0u4/csnoILvY2W0tdyehEl9WS0DoE46jSi7h8a7R09liRv48ICMaZqZPlFQzJa8
	a32fJJ6WvGEf9AxS54YlDFyE4R9+WaoQa7vcPKxnb2nqNR3bATROhVRik0s7swCArMDUE/v/OWQUj
	EeKbjHkfHZ3QH3YW0oDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nOyDg-00Fh7J-Ga; Tue, 01 Mar 2022 08:50:56 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nOyDI-00FguC-L6; Tue, 01 Mar 2022 08:50:34 +0000
Received: by mail-wr1-x429.google.com with SMTP id r10so19289302wrp.3;
 Tue, 01 Mar 2022 00:50:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=oD6gFetTiTBneW7pHAfdFCO02Wc1Qh+YwGAvSeqNhkA=;
 b=O1Al/ityd/j4DM8wDxgNp7nZUpj9pXSlJwbBGevPpfQyeOON0PTJXEd0k2wmTUlRie
 uZqWfhY0fbVTps0FePeqG1CSjnSD1QOBgLHw90pehhEcmFC4zcfJ9kFegQCCEIwGmeIh
 03+LcSwxUUrjrBo6Mw8je/5/F3DIfrwmRnQ8MiyD4+CW1vEFEiyxZNFJ7VSBQQUDcDY1
 M3XnIvPyuEO7lNZ0jVWxQB8uO+R4l+aW1+Dg5DpIXebNFpQWFhkY1MPy0iKTqSvZ/YXa
 SYWxObUzHMqwUjYVYdHS4E3zduVYBZ1RDR9PFzQ9n8IgNCdawuWTYmjUVT04X69Jlrv+
 Z3Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=oD6gFetTiTBneW7pHAfdFCO02Wc1Qh+YwGAvSeqNhkA=;
 b=wVzW4UCTVvAu9ZDz/udAQWS919K2qQYtWavPNd6BPlQFMr0c0/3Oc/zlWYw9Co9z/M
 zskt5DBovyWvRKanPeL8k0n9ePR8H2bIxB5syAUXgKw7f4tgouUxKHVACLwq+A6pX/se
 wyzK9QRkqlKAlt/NaNEO1mof41YeMz5NFCvbyttAkViVpdPfmcO8Jy0N4gCETgWZXXgi
 Oa+xb3kgqgHJqc+QocFtsAolpTdcUfeAGLML59UVHin4kATtUmJK1CY/376AhoNZLZdV
 L3pgnCiuz3hj2EXtgT033HBirNo0alluyFM/HOuWFEmXyqCZi5QHRsoqTTsAv39UBnWn
 orqQ==
X-Gm-Message-State: AOAM531p8WAks82ORpPAhCDBylvhBYVSxu8yPUDYAimL5G8zTasIAxme
 5DdCrJcdtFSVdvvLvc6IgwA=
X-Google-Smtp-Source: ABdhPJxoDFCuwAc5cGM+VSc2wggf07/VDWjHulbCWtHzrMe1a+pYmYQNLrCmat8HM6MVG8ac5xTI1w==
X-Received: by 2002:adf:e74a:0:b0:1ed:f95e:dc6d with SMTP id
 c10-20020adfe74a000000b001edf95edc6dmr17857402wrn.191.1646124630721; 
 Tue, 01 Mar 2022 00:50:30 -0800 (PST)
Received: from [192.168.2.177] ([207.188.167.132])
 by smtp.gmail.com with ESMTPSA id
 az11-20020a05600c600b00b003820f5c48e9sm787434wmb.38.2022.03.01.00.50.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Mar 2022 00:50:30 -0800 (PST)
Message-ID: <1940523d-4d98-b467-f518-7d5735e043e4@gmail.com>
Date: Tue, 1 Mar 2022 09:50:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 1/2] arm64: dts: mediatek: update mt7986a memory node
Content-Language: en-US
To: Sam Shih <sam.shih@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: John Crispin <john@phrozen.org>, Ryder Lee <ryder.lee@kernel.org>
References: <20220119123537.9968-1-sam.shih@mediatek.com>
 <20220119123537.9968-2-sam.shih@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20220119123537.9968-2-sam.shih@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220301_005032_757537_EEA637F3 
X-CRM114-Status: GOOD (  15.96  )
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



On 19/01/2022 13:35, Sam Shih wrote:
> This patch updates the format of memory node in DT based on
> maintainer comments in the following thread:
> https://lore.kernel.org/all/bc0a9df0-8ba0-76ed-4522-43a3082f42b4@gmail.com/
> 
> Signed-off-by: Sam Shih <sam.shih@mediatek.com>

Applied both with slightly better commit message. Please help the maintainer by 
providing verbose commit message.

Regards,
Matthias

> ---
>   arch/arm64/boot/dts/mediatek/mt7986a-rfb.dts | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt7986a-rfb.dts b/arch/arm64/boot/dts/mediatek/mt7986a-rfb.dts
> index 5cd760abff51..21e420829572 100644
> --- a/arch/arm64/boot/dts/mediatek/mt7986a-rfb.dts
> +++ b/arch/arm64/boot/dts/mediatek/mt7986a-rfb.dts
> @@ -19,7 +19,8 @@ chosen {
>   		stdout-path = "serial0:115200n8";
>   	};
>   
> -	memory {
> +	memory@40000000 {
> +		device_type = "memory";
>   		reg = <0 0x40000000 0 0x40000000>;
>   	};
>   };

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
