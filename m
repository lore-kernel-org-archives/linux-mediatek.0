Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85483FCC062
	for <linux-mediatek@archiver.kernel.org>; Fri,  6 Mar 2026 19:28:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0n42meaqGDUGzjj9bzqWNF89weGMYcF1c/cak04I5XA=; b=2cCZtygBjqPdGNKI0j7nFvgBpW
	NsI/skbYH70eQOq9y+OvZgYwc5y2K3mfx6u7cBBY/w14sZafD7vKMOTBe8qngZroBg7fntHhpsZhw
	8x1d5M/l154Fd429ZXV1VvoGbEUrzBx3R53FFy6Ny391c9HF/QbYepftLNg6F5F+Yu7i37sYxN9LS
	/AwcFYqnJe1SUW8AAwQ3jpgVQ0KrwhTF5ErI12pMfz9oRnonGo9LIE2sdFqbIAifl3O6o/1BWShVb
	m0y0tl2nc5os6JH3c2ZT8nMyT8NmDfg2sDePIXIgwesXU7XVl48GvC3SOjBXOHz9Y82f5RovMHotF
	id9/VL1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyaqm-00000004P0g-29fw;
	Fri, 06 Mar 2026 19:28:40 +0000
Received: from omta036.useast.a.cloudfilter.net ([44.202.169.35])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyaqj-00000004Ozv-3RH4
	for linux-mediatek@lists.infradead.org;
	Fri, 06 Mar 2026 19:28:38 +0000
Received: from eig-obgw-6004b.ext.cloudfilter.net ([10.0.30.210])
	by cmsmtp with ESMTPS
	id yWBvvBQ3vKXDJyajJvpIC0; Fri, 06 Mar 2026 19:20:57 +0000
Received: from gator4166.hostgator.com ([108.167.133.22])
	by cmsmtp with ESMTPS
	id yajIvhU0tK8vzyajJvm5tu; Fri, 06 Mar 2026 19:20:57 +0000
X-Authority-Analysis: v=2.4 cv=cJDgskeN c=1 sm=1 tr=0 ts=69ab2919
 a=1YbLdUo/zbTtOZ3uB5T3HA==:117 a=k5Y5iPg+dmTXVWgYE/XtfQ==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=7T7KSl7uo7wA:10 a=pGLkceISAAAA:8
 a=EcUihO1BCf_UJVK-1IMA:9 a=QEXdDO2ut3YA:10 a=2aFnImwKRvkU0tJ3nQRT:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=embeddedor.com; s=default; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=0n42meaqGDUGzjj9bzqWNF89weGMYcF1c/cak04I5XA=; b=O9y9+73+ouMsaM0xhKXiJLvW2a
	Ywu4XqNxZDNA1lNVURcPwpGMvAnMU7PlOFI9ARxlq1vzbhxgwjvRjBAFzEGF7BIbj/G0ADu2tgwij
	9OWq5wtMF2uaEedEWgX0RivJ03Fw3lUwSIE6/s9jLLPIYYduNkyeHHCPnGH883u2sxfkPAqLV4g4T
	jZp0qeP4m8iTd+1/5kRv3QoZXgu6+Q/fifr1woOnsqC2jPjGJlRmKZiRvjhi+jVZO5ZDI6NXIif5K
	5qWQJVoEN5uB5MOb5wyZ65bg0DqTe0q6rhCA6aTIhk6PBhNhw9ajWpW+owBAT0rQ+YWIMkbMwZimX
	no7nUOPw==;
Received: from [177.238.16.13] (port=34680 helo=[192.168.0.21])
	by gator4166.hostgator.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.99.1)
	(envelope-from <gustavo@embeddedor.com>)
	id 1vyajI-00000001Gcm-09F6;
	Fri, 06 Mar 2026 13:20:56 -0600
Message-ID: <9dbf5b85-66ec-4d3f-99d6-17cc74a8f912@embeddedor.com>
Date: Fri, 6 Mar 2026 13:20:27 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] soc: mediatek: mtk-dvfsrc: use flex array
To: Rosen Penev <rosenp@gmail.com>, linux-mediatek@lists.infradead.org
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 "open list:ARM/Mediatek SoC support" <linux-kernel@vger.kernel.org>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>,
 open "list:KERNEL" HARDENING "(not" covered by other
 "areas):Keyword:b__counted_by(_le|_be)?b" <linux-hardening@vger.kernel.org>
References: <20260304232014.164408-1-rosenp@gmail.com>
Content-Language: en-US
From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
In-Reply-To: <20260304232014.164408-1-rosenp@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - gator4166.hostgator.com
X-AntiAbuse: Original Domain - lists.infradead.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - embeddedor.com
X-BWhitelist: no
X-Source-IP: 177.238.16.13
X-Source-L: No
X-Exim-ID: 1vyajI-00000001Gcm-09F6
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: ([192.168.0.21]) [177.238.16.13]:34680
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 31
X-Org: HG=hgshared;ORG=hostgator;
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfOFWtXql3HcbM4A5F6K4CElHjIbzaE4aAHSaNm6u9cmhyR/aO1UzdCXfVPdOkmDat4lL4QXJN+TcW1tI20DP7egvI6vq4zRBdMMwFNwvpfAroHq7ASyx
 saBMWFyLN18+UL7BD5UHGVaWRv0rH7t7o7lPcM3KySeZrdoTSMoUjIoylt8QYwBjmZ13BEsAru6AAzLEZGy+nIga+rYTLUOCKdFQBTyelk66vA+P+1gQ6Dia
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260306_112837_942643_5E8D8844 
X-CRM114-Status: GOOD (  11.48  )
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



On 3/5/26 08:20, Rosen Penev wrote:
> Simplifies allocation from kzalloc + kcaloc to one allocation.
> 
> Allows extra runtime analysis with __counted_by.
> 
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---
>   drivers/soc/mediatek/mtk-dvfsrc.c | 18 ++++++------------
>   1 file changed, 6 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/soc/mediatek/mtk-dvfsrc.c b/drivers/soc/mediatek/mtk-dvfsrc.c
> index 548a28f50242..48b1fcf3e101 100644
> --- a/drivers/soc/mediatek/mtk-dvfsrc.c
> +++ b/drivers/soc/mediatek/mtk-dvfsrc.c
> @@ -71,8 +71,8 @@ struct dvfsrc_opp {
>   };
>   
>   struct dvfsrc_opp_desc {
> -	const struct dvfsrc_opp *opps;
>   	u32 num_opp;
> +	struct dvfsrc_opp opps[] __counted_by(num_opp);
>   };
>   
>   struct dvfsrc_soc_data;
> @@ -489,7 +489,6 @@ static u32 dvfsrc_get_opp_gear(struct mtk_dvfsrc *dvfsrc, u8 level)
>   
>   static int dvfsrc_get_hw_opps_v4(struct mtk_dvfsrc *dvfsrc)
>   {
> -	struct dvfsrc_opp *dvfsrc_opps;
>   	struct dvfsrc_opp_desc *desc;
>   	u32 num_opps, gear_info;
>   	u8 num_vcore, num_dram;
> @@ -520,24 +519,19 @@ static int dvfsrc_get_hw_opps_v4(struct mtk_dvfsrc *dvfsrc)
>   		 num_opps, num_vcore, num_dram, num_emi);
>   
>   	/* Allocate everything now as anything else after that cannot fail */
> -	desc = devm_kzalloc(dvfsrc->dev, sizeof(*desc), GFP_KERNEL);
> +	desc = devm_kzalloc(dvfsrc->dev, struct_size(desc, opps, num_ops + 1), GFP_KERNEL);

Mmhh... You should really consider building your code before submitting any patches.

-Gustavo

>   	if (!desc)
>   		return -ENOMEM;
>   
> -	dvfsrc_opps = devm_kcalloc(dvfsrc->dev, num_opps + 1,
> -				   sizeof(*dvfsrc_opps), GFP_KERNEL);
> -	if (!dvfsrc_opps)
> -		return -ENOMEM;
> +	desc->num_opp = num_opps + 1;
>   
>   	/* Read the OPP table gear indices */
>   	for (i = 0; i <= num_opps; i++) {
>   		gear_info = dvfsrc_get_opp_gear(dvfsrc, num_opps - i);
> -		dvfsrc_opps[i].vcore_opp = FIELD_GET(DVFSRC_V4_GEAR_INFO_VCORE, gear_info);
> -		dvfsrc_opps[i].dram_opp = FIELD_GET(DVFSRC_V4_GEAR_INFO_DRAM, gear_info);
> -		dvfsrc_opps[i].emi_opp = FIELD_GET(DVFSRC_V4_GEAR_INFO_EMI, gear_info);
> +		desc->opps[i].vcore_opp = FIELD_GET(DVFSRC_V4_GEAR_INFO_VCORE, gear_info);
> +		desc->opps[i].dram_opp = FIELD_GET(DVFSRC_V4_GEAR_INFO_DRAM, gear_info);
> +		desc->opps[i].emi_opp = FIELD_GET(DVFSRC_V4_GEAR_INFO_EMI, gear_info);
>   	};
> -	desc->num_opp = num_opps + 1;
> -	desc->opps = dvfsrc_opps;
>   
>   	/* Assign to main structure now that everything is done! */
>   	dvfsrc->curr_opps = desc;


