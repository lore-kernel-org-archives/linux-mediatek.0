Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C52DEB64D9
	for <linux-mediatek@archiver.kernel.org>; Tue,  4 Jul 2023 10:31:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hOMRbZ6yDwxQAJFFFz623eGeVCek8/odUsT8EUUH24M=; b=2tPRhwAOcdbVSW4ooQHz9QN01A
	oH7L+k9OjZ1HV8c7YJ5EOz4rHkXo44nsvkyLT0yPvxvYdiRL4hEOIWfSCUFDq1kGajnOhDJ2OIxv1
	VlO45WCFd/+MRbs1uop1j5pII/NDNRf9NgQHZKalHvlwkvSOy4LBoF4FQC+BlYmBZUgwAkooc94Mt
	YkoUnFcUJ9S46sCwB/0WM1GU5wW12t+ww2ZTmKbCjfcfs/psSB91qCxvbh1Gmce9WCGgX8nNdVrk4
	/ApDr2/s7HovrkYmGs0ICgd39NVXIvb4LolizBwO5O+axgENprb2IIM4FARaFbbz1xKVld/+dmXMr
	T5cALi0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qGdJj-00CtBP-0E;
	Tue, 04 Jul 2023 10:31:31 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qGdJg-00Ct9n-1H;
	Tue, 04 Jul 2023 10:31:29 +0000
Received: from [IPV6:2001:b07:2ed:14ed:c5f8:7372:f042:90a2] (unknown [IPv6:2001:b07:2ed:14ed:c5f8:7372:f042:90a2])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 406596606FA2;
	Tue,  4 Jul 2023 11:31:26 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1688466686;
	bh=Mai929iZ41GcGRysmlxemjrjq50/MXj16H+6IYgJcRw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=hcWpx0XM5qWmyjcj+qQe1zQiXqiwfJUzWdAkNHKVqwLQeJT0NdMqlPHiMPDg4G1UK
	 K/oFTC5LsPZpp2P5wS/22k0VlAr+2RgDAcVNERXPj+s79uxehRB5tLKbkP3CbDJuuC
	 S5UodAbBffIY0ajXMSD1XOyq17E0qZa4fKQGAcA0mMUV/3T2MPEJXWWqtBb8YHZTEz
	 tmICOF2axJuCgrq0kodW2m/VM9YgToa7TDK9515vvucIF68dW1rr4FkC1s78ffHmy8
	 NQkxOBKCZ4iX8enKEInOykgd6PEc3fbuBdPau22u3e34lRk7UiLy2V0GshpHwaEalg
	 COgAwMxE+R/AA==
Message-ID: <85ce05db-5392-79e0-1183-b40db641f3ae@collabora.com>
Date: Tue, 4 Jul 2023 12:31:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v6 8/8] soc: mediatek: pm-domains: Add support for MT8365
Content-Language: en-US
To: Markus Schneider-Pargmann <msp@baylibre.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: Chun-Jie Chen <chun-jie.chen@mediatek.com>,
 Tinghan Shen <tinghan.shen@mediatek.com>, Fabien Parent
 <parent.f@gmail.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, Fabien Parent <fparent@baylibre.com>
References: <20230627131040.3418538-1-msp@baylibre.com>
 <20230627131040.3418538-9-msp@baylibre.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230627131040.3418538-9-msp@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230704_033128_587058_06B6246E 
X-CRM114-Status: GOOD (  12.82  )
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

Il 27/06/23 15:10, Markus Schneider-Pargmann ha scritto:
> From: Fabien Parent <fparent@baylibre.com>
> 
> Add the needed board data to support MT8365 SoC.
> 
> Signed-off-by: Fabien Parent <fparent@baylibre.com>
> Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>



..snip..


> diff --git a/include/linux/soc/mediatek/infracfg.h b/include/linux/soc/mediatek/infracfg.h
> index 07f67b3d8e97..f853397697b5 100644
> --- a/include/linux/soc/mediatek/infracfg.h
> +++ b/include/linux/soc/mediatek/infracfg.h
> @@ -2,6 +2,47 @@
>   #ifndef __SOC_MEDIATEK_INFRACFG_H
>   #define __SOC_MEDIATEK_INFRACFG_H
>   
> +#define MT8365_INFRA_TOPAXI_PROTECTEN_STA1				0x228
> +#define MT8365_INFRA_TOPAXI_PROTECTEN_SET				0x2a0
> +#define MT8365_INFRA_TOPAXI_PROTECTEN_CLR				0x2a4
> +# define MT8365_INFRA_TOPAXI_PROTECTEN_MM_M0				BIT(1)

Personally, I like this kind of indentation, but more like

#define REGADDRESS
  #define REGMASK

instead of

#define REGADDRESS
# define REGMASK

...but this doesn't count, because this header doesn't follow *either* formats,
not my preferred, nor yours: this means that, for consistency, you have to follow
what's in there already, so you have to change that to

#define REGADDRESS
#define REGMASK

...so please change that to retain consistency across the infracfg.h header,
after which:

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

P.S.: I'm sorry for not noticing this in v5.

Cheers,
Angelo



