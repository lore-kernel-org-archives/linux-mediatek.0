Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DA0BC433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 28 Feb 2022 09:55:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NUmpYD+dMwC7Ckxu7XfL3Pyoa4BIgYxBfNTaRo/yUOc=; b=BrZPZRJyvRyv73
	gdP1djTUh6VocNobx84lLlAW9jIihlTX9/iHl2T7zIB2qksWYKdxcGSjbKI/3oSvWB8nadgyeR5ie
	H+R73jgPBHL6/J6+aVyMkXeEzo3JKn5vxdf4zslMmiwxp/FK/Vzs/L7jAO/OrKLHF14VDiT3dyS5z
	BiVcoOPpA4la+jq/gbrb8O4IYchSmrWsSLFBd5xp20sJhdFG0TuSSsIPyX8Jj7SjwGp0NQWfdRVg6
	nK3Pd4SD7hI1vsqMNid8poaQoqCJwRBelRDY72mMwjbIpfaCAhItxmsfENkKWdL6+vrxG3JKVUuNb
	lN8P/DbMxbSDbMFI2YDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nOckk-00BMfD-1I; Mon, 28 Feb 2022 09:55:38 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nOcjX-00BMAM-O8; Mon, 28 Feb 2022 09:54:29 +0000
Received: by mail-wm1-x332.google.com with SMTP id
 l1-20020a7bcf01000000b0037f881182a8so5383377wmg.2; 
 Mon, 28 Feb 2022 01:54:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=U0+Au0d4zAZVX8zuHvuBcFAkWKb2I4OxQR4LPXo/i04=;
 b=lBmsKprRvQDoqaPn9bYlg31prPOjW/Yb3ltQctqmzTvtjNFxY/HTucaUpL/gguyBcQ
 h3jPqfWwKcNVgUlz8SzdEbOIeauJXC/EswUoGMXK19kIZyJRF+HDvB8D9mtwxBRoUQiB
 NrjGYCg81D1I5XotB+WKPsaI9IatCCLrWkDEoXG5pAvTFYWBqBViZy/61vXDrseYAClT
 CAQnCoTv6iTATd8xs0PGIxJfDFopwl0ijS2pFQWltmOItoAlwJPoVDUCAe2ngtOD7N52
 ogNAwFlSjiU3ZJzb6GkYEpY3GFGcKulKDqvUW+3Zek78s/X+z/AbUenEa2xDtsFTk4KH
 7bcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=U0+Au0d4zAZVX8zuHvuBcFAkWKb2I4OxQR4LPXo/i04=;
 b=UFCWIR8aPO6SrhUwGDxg3LV6lvl/FAqhIAE8IPpmGH8+jHMG35ZiE1d0lf6hz+E7hE
 vPpJ8Hwc3QZ5r0K7RbgO21vquH5JxdhpNtOf5yempOjOekkKDxl57npRNxAe6S3j5vDk
 lX1XwglA2acc1MNDv3gMysJ3EdT0y3W0VH+9ZWQ/PqzuOisIUfnM3WWMb71taNmj2dyJ
 upzJJcOJPu8FePzcEKBEBP9c0pHxf+EJhNdQkoY1RTK/QsUaG7m/4m5eIJCkD28S8x/D
 9jPFXHspl2N54rJ9qBFttxOXmNOZIfagALPblwewaIysPUGx04Ay//N9XgAo7+dw6yPE
 /5Qg==
X-Gm-Message-State: AOAM533DrNI/0BaHdQhrdOWIQaJtf3zTrFGNumAHEAToJYys70RJSkTK
 MXMuqqplIjv6JkjGfyEWLNo48Ai3/OHRpg==
X-Google-Smtp-Source: ABdhPJynDyT2YmvMVI1b9GAPVRUaqoNLjRwFrVI46TNy1tFuIgSt6Ei0JnwCeteZP+gsMvr1dfXmLg==
X-Received: by 2002:a1c:2b41:0:b0:380:e379:b8b0 with SMTP id
 r62-20020a1c2b41000000b00380e379b8b0mr12638344wmr.87.1646042061055; 
 Mon, 28 Feb 2022 01:54:21 -0800 (PST)
Received: from [192.168.0.14] (static-63-182-85-188.ipcom.comunitel.net.
 [188.85.182.63]) by smtp.gmail.com with ESMTPSA id
 z6-20020a1cf406000000b0037c4e2d3baesm13854560wma.19.2022.02.28.01.54.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Feb 2022 01:54:20 -0800 (PST)
Message-ID: <b189dee6-a697-6db5-e834-6a5fe6f75f8f@gmail.com>
Date: Mon, 28 Feb 2022 10:45:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] arm64: dts: mt8192: Add watchdog node
Content-Language: en-US
To: Allen-KH Cheng <allen-kh.cheng@mediatek.com>,
 Rob Herring <robh+dt@kernel.org>, nfraprado@collabora.com
Cc: Project_Global_Chrome_Upstream_Group@mediatek.com,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 srv_heupstream@mediatek.com, Chen-Yu Tsai <wenst@chromium.org>,
 Ryder Lee <ryder.lee@kernel.org>
References: <20220207094024.22674-1-allen-kh.cheng@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20220207094024.22674-1-allen-kh.cheng@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220228_015423_879081_4D9E3434 
X-CRM114-Status: GOOD (  14.52  )
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



On 07/02/2022 10:40, Allen-KH Cheng wrote:
> From: Allen-KH Cheng <Allen-KH.Cheng@mediatek.com>
> 
> Add watchdog device node to MT8192 SoC.
> 
> Signed-off-by: Allen-KH Cheng <Allen-KH.Cheng@mediatek.com>

Applied thanks!

Matthias

> ---
>   arch/arm64/boot/dts/mediatek/mt8192.dtsi | 6 ++++++
>   1 file changed, 6 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8192.dtsi b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> index cc3953df0153..c1d4030e7e4b 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> @@ -301,6 +301,12 @@
>   			#interrupt-cells = <2>;
>   		};
>   
> +		watchdog: watchdog@10007000 {
> +			compatible = "mediatek,mt8192-wdt";
> +			reg = <0 0x10007000 0 0x100>;
> +			#reset-cells = <1>;
> +		};
> +
>   		apmixedsys: syscon@1000c000 {
>   			compatible = "mediatek,mt8192-apmixedsys", "syscon";
>   			reg = <0 0x1000c000 0 0x1000>;

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
