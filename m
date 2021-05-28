Return-Path: <SRS0=JD7o=KX=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CAA41C4708C
	for <linux-mediatek@archiver.kernel.org>; Fri, 28 May 2021 11:29:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5D6D361378
	for <linux-mediatek@archiver.kernel.org>; Fri, 28 May 2021 11:29:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5D6D361378
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K8jfZMhm28V6Egl583DEgfLOg37z4PLU2/dAlnf1Al0=; b=NshSCMhIi09Mp1BXpdgv1BbZw3
	FDhmYOddnWV/7qx4lR8HMIRR28kFRsDsEux1guzKRIDJF55wQOmxEMxSaPiswnrErs+BJTLxUwl+G
	UJ46gbpfYqIRz9gLO3uuSdO4zZQd6zIXLqo2jRhmfjdKLFoJ6pY0+2RyS0YLclRL2qj9mGZmmh0td
	16SL+lR4yj9/N1Q+ylMxNQbd7jR8eB6ijVXgJxGHbhdcSyvltFTjpZ2UmzY4S1Pj/Gsm3z32z8zVq
	aHcKmTP/wRwZluYhMVojYgTz+HHB8G9OYl4k0YNCZtp34VmcXdYtZjV+aHAcdbTy2d3aPMMRoTYqL
	AXfXqDMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lmagQ-00ErOk-IW; Fri, 28 May 2021 11:29:42 +0000
Received: from lpdvacalvio01.broadcom.com ([192.19.229.182]
 helo=relay.smtp-ext.broadcom.com)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lma0t-00EXA4-OV
 for linux-mediatek@lists.infradead.org; Fri, 28 May 2021 10:46:50 +0000
Received: from bld-lvn-bcawlan-34.lvn.broadcom.net
 (bld-lvn-bcawlan-34.lvn.broadcom.net [10.75.138.137])
 by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id D67D889C8;
 Fri, 28 May 2021 03:46:42 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com D67D889C8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
 s=dkimrelay; t=1622198802;
 bh=Zw0jEQhCQ7WPd1T8DnlcrjRRkKDIDNlohFb+UWsqnn8=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=lVi7YGb6rX6KEWlOB8oNJi7N0+56AgflHACPxOwN5P2KQPCIPIJufb2zMn/5BpUEg
 WeBaQ1VK+Hx9cuQzR7WrL7F4BDae9KcTyssY0IiDFU2b6zaNZXLDrKPkeh1YAKCprV
 CsGsfM+vhNO0+dUVsJNxvgq3LOnosgc02V7rP05k=
Received: from [10.230.41.88] (unknown [10.230.41.88])
 by bld-lvn-bcawlan-34.lvn.broadcom.net (Postfix) with ESMTPSA id E27451874BE; 
 Fri, 28 May 2021 03:46:40 -0700 (PDT)
Subject: Re: [PATCH v2 3/4] mac80211: add rate control support for encap
 offload
To: Ryder Lee <ryder.lee@mediatek.com>, Felix Fietkau <nbd@nbd.name>,
 Johannes Berg <johannes.berg@intel.com>
Cc: Lorenzo Bianconi <lorenzo.bianconi@redhat.com>,
 Shayne Chen <shayne.chen@mediatek.com>,
 Evelyn Tsai <evelyn.tsai@mediatek.com>, Bo Jiao <bo.jiao@mediatek.com>,
 Sujuan Chen <sujuan.chen@mediatek.com>, linux-wireless@vger.kernel.org,
 linux-mediatek@lists.infradead.org
References: <2176023d8f13d82d093452e1c105609396c30622.1622164961.git.ryder.lee@mediatek.com>
 <d447c18f07fe3dc7092f5502de3e35e6b7ae69e1.1622164961.git.ryder.lee@mediatek.com>
From: Arend van Spriel <arend.vanspriel@broadcom.com>
Message-ID: <489e6d51-c3f0-452d-ab63-ba83bba7ec02@broadcom.com>
Date: Fri, 28 May 2021 12:46:38 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <d447c18f07fe3dc7092f5502de3e35e6b7ae69e1.1622164961.git.ryder.lee@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210528_034647_900118_574BD0D1 
X-CRM114-Status: GOOD (  13.49  )
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

On 5/28/2021 8:05 AM, Ryder Lee wrote:
> The software rate control cannot deal with encap offload, so fix it.
> 
> Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
> ---
> change since v2 - none
> ---
>   net/mac80211/ieee80211_i.h |  9 +++++++++
>   net/mac80211/rate.c        |  9 ++-------
>   net/mac80211/tx.c          | 18 ++++++++++++++----
>   3 files changed, 25 insertions(+), 11 deletions(-)

[...]

> diff --git a/net/mac80211/tx.c b/net/mac80211/tx.c
> index d3016c3a3069..0a4bc9e08637 100644
> --- a/net/mac80211/tx.c
> +++ b/net/mac80211/tx.c

[...]

> @@ -729,7 +730,8 @@ ieee80211_tx_h_rate_ctrl(struct ieee80211_tx_data *tx)
>   		 "%s: Dropped data frame as no usable bitrate found while "
>   		 "scanning and associated. Target station: "
>   		 "%pM on %d GHz band\n",
> -		 tx->sdata->name, hdr->addr1,
> +		 tx->sdata->name,
> +		 encap ? ((struct ethhdr *)hdr)->h_dest : hdr->addr1,
>   		 info->band ? 5 : 2))

Not related to this change, but I guess the band can also be 6 these days.

Regards,
Arend

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
