Return-Path: <SRS0=SQT7=KJ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62FDEC433B4
	for <linux-mediatek@archiver.kernel.org>; Fri, 14 May 2021 09:14:48 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 05522613FB
	for <linux-mediatek@archiver.kernel.org>; Fri, 14 May 2021 09:14:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 05522613FB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=YqPEULxoi7CLVkbIfkCL9Y5VtJzYDtPUrnGJ7HXN8Nw=; b=ZKevrhVj3ZhCAqal4kLf+8Viq
	cKITt2WtgBiBkcXX+rVj415OOY98jERgzUBfzwTQnKwVKQYyJxWPqckOErEye1/3CnC9zfU14yyYM
	3dicX+aMD6D/vaEnwAZOyIdogAaaScug59IxTozGQ0Kpxf2wZUDhbeL/ooscz7dt/nJd3R9ba9BlD
	DGLXFl0VmqoiqGTGCi1eiGVLSMObNw3Zb8apf0ff1jrEbCZ7pH7YUGLG/m8eoL2Ml9MFPuaFofaGa
	q6GJgA7G9lHIBo2NzIQKOdYvnXnDpkQGyRBiXflPiOxg+WLrV+THfXuigA3CJaG6NQ6TSmhmmjuh3
	1r5NBydfg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lhTty-007bIi-SR; Fri, 14 May 2021 09:14:34 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lhTtm-007bHt-7b; Fri, 14 May 2021 09:14:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
 Subject:Sender:Reply-To:Content-ID:Content-Description;
 bh=WCiuqFmLHB8HKFHCs3lOPpMsh0NLmA8rOftDKVMjq3o=; b=KzneSohL9Me0A03rSMRC0wtTUe
 yH8WJyqqRdV7u95C6Cct4Cr0XDjqlcNhAYmJyWsXUrKNUpTbZQOJ8aM06GZ0+sDfXZaO/zSEeAXJy
 dxOQyo7F7I+BTHeGWseWxSVrzXevHlkgHRGWPS69Efp7usL4cqnc+7KR+4yI4SVcjuWrv1r2entmL
 +DKc87KrpwBf22Q4r9y/rxEQvn2FAw98UMHOloMqIJGC6V0jtQwm8y5SETgJ7C08WM0xYSDU+bgX2
 OZBBuJ7XFomy0MTP6betdT6fqoIwNAzR+O7c1iaOnROXEkk5mb5X8DOWCGRevtQA62xMzxPgYhJ5T
 zdFiyKtg==;
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lhTtj-00Bqk4-9E; Fri, 14 May 2021 09:14:20 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: eballetbo) with ESMTPSA id 843B41F43112
Subject: Re: [PATCH v2] arm64: dts: mt8183: Add power-domains properity to
 mfgcfg
To: Ikjoon Jang <ikjn@chromium.org>, linux-mediatek@lists.infradead.org
Cc: Chun-Jie Chen <chun-jie.chen@mediatek.com>,
 Weiyi Lu <weiyi.lu@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20210414073108.3899082-1-ikjn@chromium.org>
From: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Message-ID: <d10d1edc-f79e-7fa4-93ca-e896d3ea6cba@collabora.com>
Date: Fri, 14 May 2021 11:14:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210414073108.3899082-1-ikjn@chromium.org>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210514_021419_488740_CE222DD6 
X-CRM114-Status: GOOD (  15.14  )
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

Hi Ikjoon,

Thank you for your patch.

On 14/4/21 9:31, Ikjoon Jang wrote:
> mfgcfg clock is under MFG_ASYNC power domain
> 
> Signed-off-by: Weiyi Lu <weiyi.lu@mediatek.com>
> Signed-off-by: Ikjoon Jang <ikjn@chromium.org>

Reviewed-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>

> ---
> 
> Changes in v2:
> Fix a wrong power domain reference (scpsys to spm).
> 
> Link(v1): https://patchwork.kernel.org/project/linux-mediatek/patch/20210224091742.1060508-1-ikjn@chromium.org/#23997681
> 
> ---
>  arch/arm64/boot/dts/mediatek/mt8183.dtsi | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8183.dtsi b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> index 0ff7b67a6806..64813634c3df 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> @@ -1116,6 +1116,7 @@ mfgcfg: syscon@13000000 {
>  			compatible = "mediatek,mt8183-mfgcfg", "syscon";
>  			reg = <0 0x13000000 0 0x1000>;
>  			#clock-cells = <1>;
> +			power-domains = <&spm MT8183_POWER_DOMAIN_MFG_ASYNC>;
>  		};
>  
>  		mmsys: syscon@14000000 {
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
