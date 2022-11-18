Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5BDEC433FE
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Nov 2022 14:43:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pdKgFBSjrP7J6mKQWKcIHbUGqiu8JHE7FpanMMKui3g=; b=WWj9fF7MLHs5agEoryzDOE7M4M
	mIID9xWDxYIdqwJet8SMYXvu57peNA7y5CZgastQqDaiiVzXrv3LuQOhGnlhM72u6clFN8CcFTYxY
	7X6sLHkhKyf3nnifekBz2BR2Uncgw77Z4kTemxkbZu4LtGOoADCNJdJLuhqIRhGz4J72xrqjhlA9M
	I58EIM0K6pqmFp0bX28YTMCMyHXTdWlvRPkmiIUmqO9Ump4nKMCowYPeBupNvFqwARo8ZBupFGsD9
	uy1yipYa7nAa0Vzm43dZzo6mVSwOWAq0FuYA0Vuf9ikpsqUbds7Zs/7EyOGY7Kl525e1YwqJ4x7hW
	wZ3C+Hhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ow2aE-004Z7I-6N; Fri, 18 Nov 2022 14:43:10 +0000
Received: from ewsoutbound.kpnmail.nl ([195.121.94.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ow2aA-004Z4o-9D
	for linux-mediatek@lists.infradead.org; Fri, 18 Nov 2022 14:43:08 +0000
X-KPN-MessageId: 52309e82-674f-11ed-bd66-005056994fde
Received: from smtp.kpnmail.nl (unknown [10.31.155.5])
	by ewsoutbound.so.kpn.org (Halon) with ESMTPS
	id 52309e82-674f-11ed-bd66-005056994fde;
	Fri, 18 Nov 2022 15:43:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xs4all.nl; s=xs4all01;
	h=content-type:from:to:subject:mime-version:date:message-id;
	bh=pdKgFBSjrP7J6mKQWKcIHbUGqiu8JHE7FpanMMKui3g=;
	b=BgVJUG6vwXZgwsVHy52Z9oCXmaMqSN+28IZDHEUPzlrFkGElqCPZMgN6VUdjQ62RZYOHfu4fIBXfu
	 bOhoGzmtirLjc6X3v+HdKmf8O5vv/OLYFKSmfVZI8o8XkoVfI71X6OPlVfXZ1Jvblt9sh7/fyYfBZ6
	 r7XCD6jSWatpceQb4l8N+aPqd4CU1b5GsRxz5j/XAMmIxG6NB0MtJKrJaZsvjpbbxDhormaVm2TU3f
	 o0oZkzzV1TTUG8RpQtuEnSxxMjDaHAtncb5dOoe4FbfBd4W4jce1sIaIWa6QaLRCrZxiBscjjadV8+
	 8ro9aFmub64GuhkyjBz4jMQ4YTZKTIw==
X-KPN-MID: 33|fFbkAkP83JGUv1qU/pkLvLXfT30fA7fHDImREHGq0OWKitaWJxgZHuYLjNX20sd
 8Y4TSjdxnqiTBqkocf6bxo2mf264VvBfGDuMtNnGFIMU=
X-KPN-VerifiedSender: Yes
X-CMASSUN: 33|aHFuH5bFQHDW5BFR+HnL4ys8tdkYBqpjYSJCY+kUj64PdKCi5JWSVX+hIOzqbkh
 R4Gvzo2Hok/cWEKeNGFSRVA==
X-Originating-IP: 173.38.220.59
Received: from [10.47.77.219] (unknown [173.38.220.59])
	by smtp.xs4all.nl (Halon) with ESMTPSA
	id 4e226081-674f-11ed-9b31-00505699b758;
	Fri, 18 Nov 2022 15:43:03 +0100 (CET)
Message-ID: <9c46615d-2dfb-837e-48a8-9d952c04a824@xs4all.nl>
Date: Fri, 18 Nov 2022 15:43:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH] media: platform: mtk-mdp3: add missing call to
 of_node_put()
Content-Language: en-US
To: wangkailong@jari.cn, mchehab@kernel.org, matthias.bgg@gmail.com,
 moudy.ho@mediatek.com, sunke32@huawei.com
Cc: linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
References: <be6c204.133.18470aa3e15.Coremail.wangkailong@jari.cn>
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <be6c204.133.18470aa3e15.Coremail.wangkailong@jari.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221118_064306_531198_7EDC2535 
X-CRM114-Status: GOOD (  17.34  )
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

On 11/13/22 12:05, wangkailong@jari.cn wrote:
> Fix the following coccicheck warning:
> 
> drivers/media/platform/mediatek/mdp3/mtk-mdp3-comp.c:892:1-23: WARNING:
> Function "for_each_child_of_node" should have of_node_put() before
> return around line 914.
> drivers/media/platform/mediatek/mdp3/mtk-mdp3-comp.c:892:1-23: WARNING:
> Function "for_each_child_of_node" should have of_node_put() before
> return around line 920.
> drivers/media/platform/mediatek/mdp3/mtk-mdp3-comp.c:951:1-23: WARNING:
> Function "for_each_child_of_node" should have of_node_put() before
> return around line 993.
> 
> Signed-off-by: KaiLong Wang <wangkailong@jari.cn>
> ---
>  drivers/media/platform/mediatek/mdp3/mtk-mdp3-comp.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-comp.c b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-comp.c
> index d3eaf8884412..4162fc732f38 100644
> --- a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-comp.c
> +++ b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-comp.c
> @@ -908,6 +908,7 @@ static int mdp_comp_sub_create(struct mdp_dev *mdp)
>  		alias_id = mdp_comp_alias_id[type];
>  		id = mdp_comp_get_id(type, alias_id);
>  		if (id < 0) {
> +			of_node_put(node);
>  			dev_err(dev,
>  				"Fail to get sub comp. id: type %d alias %d\n",
>  				type, alias_id);
> @@ -916,8 +917,10 @@ static int mdp_comp_sub_create(struct mdp_dev *mdp)
>  		mdp_comp_alias_id[type]++;
>  
>  		comp = mdp_comp_create(mdp, node, id);
> -		if (IS_ERR(comp))
> +		if (IS_ERR(comp)) {
> +			of_node_put(node);
>  			return PTR_ERR(comp);
> +		}
>  	}
>  
>  	return 0;
> @@ -988,6 +991,7 @@ int mdp_comp_config(struct mdp_dev *mdp)
>  
>  		pdev = of_find_device_by_node(node);
>  		if (!pdev) {
> +			of_node_put(node);
>  			dev_warn(dev, "can't find platform device of node:%s\n",
>  				 node->name);
>  			return -ENODEV;

There is a 'goto err_init_comps;' in this function as well that needs
an of_node_put(node); line.

Can you make a v2?

Regards,

	Hans

