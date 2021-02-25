Return-Path: <SRS0=YoM+=H3=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C67AC433DB
	for <linux-mediatek@archiver.kernel.org>; Thu, 25 Feb 2021 17:58:54 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DE99F64F36
	for <linux-mediatek@archiver.kernel.org>; Thu, 25 Feb 2021 17:58:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DE99F64F36
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=SAGfEH88FoLlPxlKB+riZR7VIct+8Vo8TCS4xEL6NgA=; b=c0O9lUKoA4Tw99hBd0HaH45Ll
	Z88jefJ0VpTSINOWGYEJWu2ZK2cLvXx/d9XNd1VJVUtoKzuccYbZLYZrY/+j+Ry1YEKTZ9QfT1tWv
	S20MNobeLIKqSnXk6F4p//mmll507XMtZQd+Kv818BgCFJdQWoI2VEr2ILuci48AfWkBMcpYAcpUd
	f7htDL1+qfqIIYmLJ0W6vI3yKwubLBHS3XjjZgvGczOZnFUcw1thKgNjaATNIk/eL7zOwl5B5pnSY
	+7X8M5TEapoiVWNZAIlHfmX1PER3JrpWJHg6oAv9rpotJb8RPRtubS4tBTEIur4mQSzHUU95Lkb0+
	1GPJZ+nzA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lFKuQ-0007V2-VV; Thu, 25 Feb 2021 17:58:43 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lFKuN-0007UL-Th; Thu, 25 Feb 2021 17:58:40 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9F73964DE8;
 Thu, 25 Feb 2021 17:58:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1614275918;
 bh=kkEUBtk21fzvQ+eByMWisdjrqhC+DKiVgrkLgH0ss/M=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ev8I77FFegc2EdWHko9oWR26IKdMF6+y2de4p0n8wL3eoj2h3N3kPlco84vQb4Ua2
 I/ND8Raybh6OjAgIDKQwYtn4/Rub1R8ufc/dK8Yhrhii8kQVKhbB+YzPyhAYxCALSR
 EKpalFu3yn6QUgcNqEa/yQAZ4LJQt/nzdNd/6GOnq0xGbP/r06vVf56CG1LtWR8I/n
 cx3rE5IpLMAQOe+tYk/kI+BcNjTfj50Wolh+y2bxxyIaM+ZQ/tXDyJQfR/yc25JENz
 +//LzlT/UmhktjLycSIn5K0hWtTI6pq4vw2kQL39hWP/iBJjT4qCw1jmRXDKnK24eR
 PyUCV6l4hRGzw==
Date: Thu, 25 Feb 2021 10:58:36 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Arnd Bergmann <arnd@kernel.org>
Subject: Re: [PATCH 1/2] mt76: mt7915: fix unused 'mode' variable
Message-ID: <20210225175836.GA23011@24bbad8f3778>
References: <20210225145953.404859-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210225145953.404859-1-arnd@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210225_125840_058331_96FCE3DF 
X-CRM114-Status: GOOD (  19.11  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Ryder Lee <ryder.lee@mediatek.com>, Arnd Bergmann <arnd@arndb.de>,
 clang-built-linux@googlegroups.com, linux-wireless@vger.kernel.org,
 Sean Wang <sean.wang@mediatek.com>, Nick Desaulniers <ndesaulniers@google.com>,
 linux-kernel@vger.kernel.org, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 netdev@vger.kernel.org, Lorenzo Bianconi <lorenzo.bianconi83@gmail.com>,
 Jakub Kicinski <kuba@kernel.org>, Shayne Chen <shayne.chen@mediatek.com>,
 "David S. Miller" <davem@davemloft.net>, Kalle Valo <kvalo@codeaurora.org>,
 Felix Fietkau <nbd@nbd.name>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, Feb 25, 2021 at 03:59:14PM +0100, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> clang points out a possible corner case in the mt7915_tm_set_tx_cont()
> function if called with invalid arguments:
> 
> drivers/net/wireless/mediatek/mt76/mt7915/testmode.c:593:2: warning: variable 'mode' is used uninitialized whenever switch default is taken [-Wsometimes-uninitialized]
>         default:
>         ^~~~~~~
> drivers/net/wireless/mediatek/mt76/mt7915/testmode.c:597:13: note: uninitialized use occurs here
>         rateval =  mode << 6 | rate_idx;
>                    ^~~~
> drivers/net/wireless/mediatek/mt76/mt7915/testmode.c:506:37: note: initialize the variable 'mode' to silence this warning
>         u8 rate_idx = td->tx_rate_idx, mode;
>                                            ^
> 
> Change it to return an error instead of continuing with invalid data
> here.
> 
> Fixes: 3f0caa3cbf94 ("mt76: mt7915: add support for continuous tx in testmode")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  drivers/net/wireless/mediatek/mt76/mt7915/testmode.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/testmode.c b/drivers/net/wireless/mediatek/mt76/mt7915/testmode.c
> index 7fb2170a9561..aa629e1fb420 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7915/testmode.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt7915/testmode.c
> @@ -543,6 +543,7 @@ mt7915_tm_set_tx_cont(struct mt7915_phy *phy, bool en)
>  		tx_cont->bw = CMD_CBW_20MHZ;
>  		break;
>  	default:
> +		return -EINVAL;

Remove the break if we are adding a return?

>  		break;
>  	}
>  
> @@ -591,6 +592,7 @@ mt7915_tm_set_tx_cont(struct mt7915_phy *phy, bool en)
>  		mode = MT_PHY_TYPE_HE_MU;
>  		break;
>  	default:
> +		return -EINVAL;
>  		break;
>  	}
>  
> -- 
> 2.29.2
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
