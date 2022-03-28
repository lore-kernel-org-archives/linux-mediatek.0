Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D144DC433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 28 Mar 2022 10:58:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zmIgG5LTXQLPGzUJgMQWG3jx2upgEWzEbM4Kz5HA5wk=; b=XP+MW7/1ymKyVr
	4vJypWfb8bZi9eOTZ2iC9WAdxp3V1uq3GEfr4XAQ02TaNq4BkNLe+SyaBN77K4awJESd0hPJSosBt
	e4TNL9UslIgwwBLHcTbWABNMnz09PXEyXC35YwrYgpRC2yyi0nrWPkXTQ7/WN8e1vCOL0jE6f1Rue
	0VP7Q7UvCtHHKZT4ViXLIwCj8cjAhF49F8K2adi8ToH03cu1EfLtYY3JVdn26zZ2pIp33jnav5pfG
	auga+o1Agq4RHU5y6YDroNkTPRmLYgdecG4u7pi4Fa038KBlm4AnlCrMRT6E/4+2bssPw3+6Mbxov
	QYk7BSy/GsqnyOrWQW0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nYn4R-008HHu-Te; Mon, 28 Mar 2022 10:57:59 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nYn4C-008HDb-UY; Mon, 28 Mar 2022 10:57:46 +0000
Received: by mail-wr1-x42a.google.com with SMTP id w4so19743040wrg.12;
 Mon, 28 Mar 2022 03:57:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=GGvSFlPXU872KWgGig8qcLQpk/W2IByUtUFzj9tQrwE=;
 b=AA55u6uE5y4cKgL4pCCZV88DledptqdMiXNeg8qobCmiht5JRGekM6Ndl/JKoKZo90
 YXdYQai7+hqxjNkVcyqQLQC/T3Q17krM4q6gJGOTi3X8WLGum74tp8hoTM0lKa5E0Ldk
 83Uk3MOK4vo72r0btFuWz5nBX7+QmJCSb5NT34lLPl5JSHpwn5FhH0Ds0cdZUO+aXpc/
 +FoWBf/BJJS6pyEgAp35Mw5gLRdGx+b/pBH4Y7oh5L+SAJxEilAjSmUREZAYdyysLE5r
 FeTbq1CeU8+yan26uhIGV4ko5g0xveeDXIYRWhVvZKuMtZWiSRM/1C19GNzeBO8mDY8l
 A6hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=GGvSFlPXU872KWgGig8qcLQpk/W2IByUtUFzj9tQrwE=;
 b=kHuH/LJhngolYQ6txxNk1DyDTNFHvrRMkHKDIL72j+J2L30eXYxkIoCQWbduaNcDDt
 VCMjbty8uNoXqKF1C3VVOivpv3q6CYCbPodwNulMbSR+q1/b9bBIsA3HviLGGOFD4L1S
 cUhPSOg2f/f/aynOSEYXmVF/uF65QmnvvZ/SVnmUhoRRy2KuZzfhU+ASV63BiM+BlOFT
 nvC8f8cLJ5WpqF8AFn8tjpUTa87MyCDfv2y4AKC786kYSzJvPGgbOQzUQwlJ1df49pw5
 KF4L1oFR177G2hIvpaUUFfSswbmZh2cR9UUmfEybcH5+p4TtGnuWtDFIvDxg8KXsNOQa
 XATw==
X-Gm-Message-State: AOAM5310vqfVbtJYmRncFVjKldhd0U1BKpP5XTeXOk5nE0quKEEjPw/i
 FEdVQxZLu94iAiAOEp80JWA=
X-Google-Smtp-Source: ABdhPJxH6AnH4UIVT8ZaKUAIGV7UzNt4wvXzbencOS83G8zgcWCHLqOF/SpFWk2ojiP9ntq09Pg/NQ==
X-Received: by 2002:adf:ebc7:0:b0:1ee:945a:ffb4 with SMTP id
 v7-20020adfebc7000000b001ee945affb4mr23153658wrn.641.1648465063551; 
 Mon, 28 Mar 2022 03:57:43 -0700 (PDT)
Received: from [192.168.0.32] ([137.101.87.65])
 by smtp.gmail.com with ESMTPSA id
 y11-20020a056000168b00b002041af9a73fsm13920567wrd.84.2022.03.28.03.57.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Mar 2022 03:57:42 -0700 (PDT)
Message-ID: <b6f3be8a-6582-0cb5-5563-58f87e265bd6@gmail.com>
Date: Mon, 28 Mar 2022 12:57:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v4 19/22] arm64: dts: mt8192: Add the mmsys reset bit to
 reset the dsi0
Content-Language: en-US
To: Allen-KH Cheng <allen-kh.cheng@mediatek.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc: Project_Global_Chrome_Upstream_Group@mediatek.com,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Chen-Yu Tsai <wenst@chromium.org>, Ryder Lee <ryder.lee@kernel.org>,
 Hui Liu <hui.liu@mediatek.com>
References: <20220318144534.17996-1-allen-kh.cheng@mediatek.com>
 <20220318144534.17996-20-allen-kh.cheng@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20220318144534.17996-20-allen-kh.cheng@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220328_035745_019003_D8619E46 
X-CRM114-Status: GOOD (  15.72  )
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



On 18/03/2022 15:45, Allen-KH Cheng wrote:
> Reset the DSI hardware is needed to prevent different settings between
> the bootloader and the kernel.
> 
> Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>

Applied thanks

> ---
>   include/dt-bindings/reset/mt8192-resets.h | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/include/dt-bindings/reset/mt8192-resets.h b/include/dt-bindings/reset/mt8192-resets.h
> index be9a7ca245b9..764ca9910fa9 100644
> --- a/include/dt-bindings/reset/mt8192-resets.h
> +++ b/include/dt-bindings/reset/mt8192-resets.h
> @@ -27,4 +27,7 @@
>   
>   #define MT8192_TOPRGU_SW_RST_NUM				23
>   
> +/* MMSYS resets */
> +#define MT8192_MMSYS_SW0_RST_B_DISP_DSI0			15
> +
>   #endif  /* _DT_BINDINGS_RESET_CONTROLLER_MT8192 */

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
