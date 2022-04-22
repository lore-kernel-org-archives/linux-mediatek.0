Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA334C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 22 Apr 2022 14:19:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UYafXC4ojMI1Ldbi4JTRvkBbVvCdmILRmijfnQ2N5jA=; b=1Ifr5ma2EyCm2N
	2IpOhkvYRQkZrHUeI/5Ia+4b9mt1DJvfay+CnBuo09rvTfXQ3lMZCzSETKegvK7TkrUKlZinfu3Ad
	f59LP2F1/O3aIdOQ5KtAiqZ61TPFbPzJfH4/hPg/wm0Ht8H5Ztf1jX4O9Qn5y0znql01mXQ4rvqIS
	K4wp/DF8h+IX7EMTCmCOMTpkHzx/bKpvRz8JWy8N9ZwGCVy3QEguQroWWGzFj2oIkE4Vml9w+P4iO
	uaKnfPevH0o65JKwim1zbKjqnQ2z20f7jTcXkS+90CfeRC+/6xzWoY/8oEJb+fTkp1nlUJVV9slqJ
	oQAsV+aMSoKz6BzlDRYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nhu8P-000mm5-Gr; Fri, 22 Apr 2022 14:19:45 +0000
Received: from mail-oa1-x2b.google.com ([2001:4860:4864:20::2b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nhu8M-000mkT-P2; Fri, 22 Apr 2022 14:19:44 +0000
Received: by mail-oa1-x2b.google.com with SMTP id
 586e51a60fabf-e9027efe6aso1448662fac.10; 
 Fri, 22 Apr 2022 07:19:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=X7u3kglhM0VkTW03FStsvrOnIn+Xj3SEcCEn4rSVb2M=;
 b=doxXGTkzNgr961Vtac0I8Zhl1wa8l2EJNGL/EiZdctp1nfqY1r9tiLc66rTrOW3sEi
 RM00KIuonmmVfjOozzjwUSfYjHAUfJ7amPN0xWq/HHhvULB5GFvMHxpxNEbuhAlEYCL0
 6Nf8JzIoaCqKa+yuJ6fWuhCX5BK68o+amMSrl/s+9arho0DStmzkxahga3IuG+Ocn4BR
 PoOR2jNDY8NCUcyc/VPL7BFtTkGadWnHZhkOTxupp2+jsz2C+D+htRUAK66VY8lCl0TZ
 BYTnBGEsVFMl4EEb4TVVqEkULyAgxKx3JIT2srrQxoXOaRNhusHjeY9oh7fKTUj8Qw0Q
 gPYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=X7u3kglhM0VkTW03FStsvrOnIn+Xj3SEcCEn4rSVb2M=;
 b=cpFWKVmSWUYVzzJxStCRnvWntR8TkqkrPV04m9r44cp4j0r0YE4hCTMo0b/c8GJQsq
 9aagWpj+j8CSZl1uFsuwft9EJxYeMNB7ttdnxhAGvnD2N+P/6E2kSyEAkIcTrvBN3zMX
 0w4g9iuWi6dui9Bei4l50J3C62OI0Fiwrl2EqEy3fksCfWpb9zR045uc0XV68IB+nrfr
 ihyHaTDzyxPebE5tg0iO6WEbXFbEPFQ00qzR3IqWSiAyrjhWC7i+mhTSCH1UOdhyS8RB
 mKt1dN5hbIS4AHXxI3TqtXiIhChIe0Ouwr+QERIopRVIgotLe8SAU6uAR1KGnV3VvCa2
 BqLw==
X-Gm-Message-State: AOAM532ts/3pJ4A6lNyizF7qqf699hoF9Z5fi64o8O+lvdizTVI+7Sq7
 IyjOdJ26OnTQX1PVjEzki1E=
X-Google-Smtp-Source: ABdhPJyRUn+Uq4kLyzdsgMmHE5kkqjywZFQ2SL5fSRXPWW5Su/ofYv0nnbjSTPRCJnLsPK5NNqvn4A==
X-Received: by 2002:a05:6870:589d:b0:d6:dc7f:6b10 with SMTP id
 be29-20020a056870589d00b000d6dc7f6b10mr1955692oab.175.1650637181912; 
 Fri, 22 Apr 2022 07:19:41 -0700 (PDT)
Received: from [192.168.1.145] ([207.188.167.132])
 by smtp.gmail.com with ESMTPSA id
 c14-20020a4ad20e000000b0033a371fa815sm806446oos.37.2022.04.22.07.19.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 22 Apr 2022 07:19:41 -0700 (PDT)
Message-ID: <4373b922-bd07-c02d-e43f-0426690cf47d@gmail.com>
Date: Fri, 22 Apr 2022 16:19:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH V2 2/3] arm64: dts: mt8183: Update disp_aal node compatible
Content-Language: en-US
To: Rex-BC Chen <rex-bc.chen@mediatek.com>, chunkuang.hu@kernel.org,
 robh+dt@kernel.org, krzk+dt@kernel.org
Cc: p.zabel@pengutronix.de, airlied@linux.ie, yongqiang.niu@mediatek.com,
 jason-jh.lin@mediatek.com, nancy.lin@mediatek.com,
 allen-kh.cheng@mediatek.com, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20220411035843.19847-1-rex-bc.chen@mediatek.com>
 <20220411035843.19847-3-rex-bc.chen@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20220411035843.19847-3-rex-bc.chen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220422_071942_863040_46517D0D 
X-CRM114-Status: GOOD (  15.92  )
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



On 11/04/2022 05:58, Rex-BC Chen wrote:
> The driver data of MT8183 and MT8173 are different.
> The value of has_gamma for MT8173 is true while the value of MT8183 is
> false. Therefore, the compatible of disp_aal for MT8183 is not suitable
> for the compatible for MT8173.
> 
> Signed-off-by: Rex-BC Chen <rex-bc.chen@mediatek.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Applied thanks!

> ---
>   arch/arm64/boot/dts/mediatek/mt8183.dtsi | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8183.dtsi b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> index 4b08691ed39e..a3616005d65c 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> @@ -1466,8 +1466,7 @@
>   		};
>   
>   		aal0: aal@14010000 {
> -			compatible = "mediatek,mt8183-disp-aal",
> -				     "mediatek,mt8173-disp-aal";
> +			compatible = "mediatek,mt8183-disp-aal";
>   			reg = <0 0x14010000 0 0x1000>;
>   			interrupts = <GIC_SPI 233 IRQ_TYPE_LEVEL_LOW>;
>   			power-domains = <&spm MT8183_POWER_DOMAIN_DISP>;

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
