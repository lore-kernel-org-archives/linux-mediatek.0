Return-Path: <SRS0=zq7C=LL=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93A7DC2B9F4
	for <linux-mediatek@archiver.kernel.org>; Thu, 17 Jun 2021 19:08:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1A047613E1
	for <linux-mediatek@archiver.kernel.org>; Thu, 17 Jun 2021 19:08:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1A047613E1
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=nbd.name
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=ti0odq/c2H3/7g7WHIoIptqAULFo1eV824Jwa7BSSPo=; b=eNLK/UyjfreKT0GRzjw/uAgqYI
	2KC7ARSurZPLOROESTRPqhK/sV2akKwHGFlIR4qWHTD8IgX70ZsIvj/YGHrx76Tva5UCFI3ViR62F
	4zFm331qCVWH5ZHnqRL+lKgcOlh6KU6wC1Fu2Zl6nGjdkMZ/P8mnpEY0AAfz3Jc0TdFrXqz3inZIM
	p+jTZPnJaiPHPyAU2LX6iLela8ZioffL+xWXWd6JJozBT/lsXJQPB3PlCKLxh//dlMYN8534yHLcx
	t+lyZQlSd43yHkuDiDui/rFlUCkvaKbKop17Fe0ejQw7hegfuXeePYnJI4qBJhfWjjgBkJDRCpKeX
	HIg5Rjww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ltxNZ-00BTmy-P0; Thu, 17 Jun 2021 19:08:41 +0000
Received: from nbd.name ([2a01:4f8:221:3d45::2])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ltxNV-00BTm9-Gq
 for linux-mediatek@lists.infradead.org; Thu, 17 Jun 2021 19:08:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
 s=20160729; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=BzMbr1VGLhl2EWCSEqSY1+QNCfXNTbceWdDzZ9hAMEI=; b=G+wRYn8igscVmTsNdzVTTTjvC4
 ZOa20uLsxJB30mzuQ7UEnwbSpjsIQqHO7uatW7ly63gW/mk9qMvwaWdM/oa0ebGCI+02c7Vg6zy+v
 RTajdiMBrueQj6Qg1xGSn2M1Fn0INW/D8gio+QPP2UokWQhqh+5ShRFn1WF0IYL/jIUg=;
Received: from p54ae9ff2.dip0.t-ipconnect.de ([84.174.159.242] helo=nf.local)
 by ds12 with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.89) (envelope-from <nbd@nbd.name>)
 id 1ltxNR-0004Az-VW; Thu, 17 Jun 2021 21:08:34 +0200
Subject: Re: [PATCH 1/4] mac80211: check per vif offload_flags in Tx path
To: Ryder Lee <ryder.lee@mediatek.com>
Cc: Lorenzo Bianconi <lorenzo.bianconi@redhat.com>,
 Shayne Chen <shayne.chen@mediatek.com>,
 Evelyn Tsai <evelyn.tsai@mediatek.com>, linux-wireless@vger.kernel.org,
 linux-mediatek@lists.infradead.org
References: <4718d8041f908cb3249ec68c59a6854919f00752.1623955182.git.ryder.lee@mediatek.com>
From: Felix Fietkau <nbd@nbd.name>
Message-ID: <18027bdb-19d7-f342-af35-ed304f730678@nbd.name>
Date: Thu, 17 Jun 2021 21:08:33 +0200
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <4718d8041f908cb3249ec68c59a6854919f00752.1623955182.git.ryder.lee@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210617_120837_780523_8FB9FD9C 
X-CRM114-Status: GOOD (  14.82  )
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


On 2021-06-17 20:53, Ryder Lee wrote:
> offload_flags has been introduced to indicate encap status of each interface.
> An interface can encap offload at runtime, or if it has some extra limitations
> it can simply override the flags, so it's more flexible to check offload_flags
> in Tx path.
> 
> Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
> ---
>  net/mac80211/tx.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/net/mac80211/tx.c b/net/mac80211/tx.c
> index 0a4bc9e08637..8cb1289c704a 100644
> --- a/net/mac80211/tx.c
> +++ b/net/mac80211/tx.c
> @@ -3695,7 +3698,8 @@ struct sk_buff *ieee80211_tx_dequeue(struct ieee80211_hw *hw,
>  	}
>  
>  	if (skb_has_frag_list(skb) &&
> -	    !ieee80211_hw_check(&local->hw, TX_FRAG_LIST)) {
> +	    (!ieee80211_hw_check(&local->hw, TX_FRAG_LIST) ||
> +	     vif->offload_flags & IEEE80211_OFFLOAD_ENCAP_ENABLED)) {
>  		if (skb_linearize(skb)) {
>  			ieee80211_free_txskb(&local->hw, skb);
>  			goto begin;
I think this chunk should be dropped.

- Felix

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
