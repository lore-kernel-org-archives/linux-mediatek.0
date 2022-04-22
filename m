Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E75E5C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 22 Apr 2022 13:50:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yQCJbLgILQncYBr5xx3pw6+rgh9X1jnqhhJ+KxeClVw=; b=DUV6/1T1ldzba8
	9NWM5Q+Q0o6dZjPwosqwPgXrqr+s6hQJDGR/RHWcwTogKqwrjAutiSVCSJ65DnZyAKFf4D4IO+hMt
	DDfwkHcR3B5uQEzES3TAXjVzDlb8ktPs/+o1/Ibdfz+4PoQ/VyZyJobutAqgsUz2cd8+1bHKfGA6U
	vuQSeLjkvjL2GunirJyI5Ar0llXuErdkzM3NXEZykpfxCR85oH3DT3sfyT9jqPoKk0iGnLK1aQbOG
	oi7MtFKUbTlGU5w2SvdQL49TwI4lHYISemF+iN8PtRqIQC1gwtDiT/xxgUIYCeXGWL2I2Yj+2uf/w
	ZbNF3ZoaAQV36Np6mz0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nhtfe-000gSv-H4; Fri, 22 Apr 2022 13:50:02 +0000
Received: from mail-oi1-x22c.google.com ([2607:f8b0:4864:20::22c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nhtfP-000gNU-RW; Fri, 22 Apr 2022 13:49:51 +0000
Received: by mail-oi1-x22c.google.com with SMTP id z8so9101331oix.3;
 Fri, 22 Apr 2022 06:49:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=2hUCjoSiiYLWYN4sO8hPNgzy9FEp85DUf4TVxMg+qtc=;
 b=j7I7wgEyCK96dFdHlTflQZpkiMaIXyl8LrmU5uN53qjQYC2nuoO9InsQ8rI7UWVim5
 19M/825BdaWJdBPrx6vMWlkxE6elHL9NBUESvA9BMeOogUrCOLqpDvKF71nY8zUuq9KP
 bgkpiTAoytUInIcPPwhiCFaOTrdyDTVSucxjGxYc+qhAz+TJkgcn52/99o4SHsbjIIHR
 JmKlqDLSwEKTZHrATeVlEj4kpjP50B2gFv/Tbk2jXFOBnJVTOM/UEOwOkKoGWq9Q5dLm
 SjcPoQS8sCfXEssRvSwBqho/xDCrvMaBRi75yuLdMBSasVBPV6yrdZL2JWOQo99HE3Ku
 odmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=2hUCjoSiiYLWYN4sO8hPNgzy9FEp85DUf4TVxMg+qtc=;
 b=ktJ86AbtFWW1pQapsnYbjqunaTo/RHNa8+FZcm3uR+fHC9htLOjBdsgGdq5WzYhug0
 ESjMUPUAASkAl2vgPlT6H+J5lraJx5tV79TqBJniAlAVxWH7vwlzEKr63WxvQ233X918
 49hH8szYP9v7+u0deylBrfJBNe3uD02C6gToiRuJoQF9S4/cm/pyPr4M8reLUjxU/m4o
 kybPFKcVBbBffGmP8Ybno9809sNZAXV4J8AvU06ug3zzsuhZbIzOXC+XfZXeySrea7KY
 1NWh99j4nFY+1WWox5vJIbWELROgvJHmkZAJr29yQjWqQYJh8XUWRdWy46ET48lIPEoM
 Bx5Q==
X-Gm-Message-State: AOAM532BUfqzjYuXe7cv3bBvlrFChFSiL6mps+8zsSs9WxtuUuOuIGcS
 zJQXxGPGcBYmCQau94wmQnc=
X-Google-Smtp-Source: ABdhPJxddqTbRoZu2gSCeYOY47XWWQUyiqKP1ieP9KSSEDZyHym8S2cs9G/4D1hqv2wwu6wqQeOVvg==
X-Received: by 2002:a05:6808:1384:b0:322:2bcc:42c0 with SMTP id
 c4-20020a056808138400b003222bcc42c0mr2287933oiw.11.1650635384561; 
 Fri, 22 Apr 2022 06:49:44 -0700 (PDT)
Received: from [192.168.1.145] ([207.188.167.132])
 by smtp.gmail.com with ESMTPSA id
 t3-20020a4a7603000000b0033a53c11f82sm799425ooc.20.2022.04.22.06.49.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 22 Apr 2022 06:49:43 -0700 (PDT)
Message-ID: <18d61fa0-358c-6051-56e6-abce9c2b1403@gmail.com>
Date: Fri, 22 Apr 2022 15:49:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 0/4] Correct power domain for encoder
Content-Language: en-US
To: Allen-KH Cheng <allen-kh.cheng@mediatek.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc: Project_Global_Chrome_Upstream_Group@mediatek.com,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Chen-Yu Tsai <wenst@chromium.org>, Ryder Lee <ryder.lee@kernel.org>,
 Hui Liu <hui.liu@mediatek.com>
References: <20220421035111.7267-1-allen-kh.cheng@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20220421035111.7267-1-allen-kh.cheng@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220422_064947_900194_6A5889F7 
X-CRM114-Status: GOOD (  12.09  )
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



On 21/04/2022 05:51, Allen-KH Cheng wrote:
> Base on current mediatek encoder driver, we don't use larb driver to
> control power. Add power domain to mediatek,vcodec-encoder.yaml.
> Alos we pick missed PATCHs from 20220117070510.17642-14-yong.wu@mediatek.com
> and add power domain to encoder nodes for mt8173 Soc.
> 
> Allen-KH Cheng (1):
>    arm64: dts: mediatek: mt8173: Add power domain to encoder nodes
> 
> Irui Wang (1):
>    dt-bindings: media: mtk-vcodec: Add encoder power domain property
> 
> Yong Wu (2):
>    arm: dts: mediatek: Get rid of mediatek,larb for MM nodes
>    arm64: dts: mediatek: Get rid of mediatek,larb for MM nodes
> 
>   .../media/mediatek,vcodec-encoder.yaml         |  7 +++++++
>   arch/arm/boot/dts/mt2701.dtsi                  |  2 --
>   arch/arm/boot/dts/mt7623n.dtsi                 |  5 -----
>   arch/arm64/boot/dts/mediatek/mt8173.dtsi       | 18 ++----------------
>   arch/arm64/boot/dts/mediatek/mt8183.dtsi       |  6 ------
>   5 files changed, 9 insertions(+), 29 deletions(-)
> 
Patch 1 got pushed to v5.18-next/dts32
Patch 2 and 3 got pushed to v5.18-next/dts64

Thanks!

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
