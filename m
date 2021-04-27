Return-Path: <SRS0=NJpa=JY=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CEBAFC433B4
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 Apr 2021 08:11:27 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1DE35613BD
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 Apr 2021 08:11:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1DE35613BD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=nbd.name
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=wX3syPisMNkcEsNfQvWJyYa1YmFNDK/Z/SAfPSGtUhA=; b=XmaNM5Yx8J96xHDXyVYe1fmRy
	R8FG2KiyrUnZVYLCnLTG5zSzQEd/OG/TbzgCmJ8xeLt8WKJ4iRsZTbQJq2b8o5+8M9eGez+UfjleY
	75zvHttBxffj0gGPNXRqw4oEvsebyW6BgYdCVkAN2KCORzPOajsotFjW5wH5whAzv2adF8B4dK/v1
	2OPc8tG8/4yyl51bdbJU2Csm3GhlOHtikC9WjBiwGJbx1hwmcSyUWlZ++WrKTdftsVqVA+MeuGff9
	qDiEHsvQnlccZwcbiC0ameIwgTW1V9wBWXFUTsu4JoQA7P9W0pg4Go/fUsLbdLwsorFv59rB/5xeC
	0KCsBQ+Fg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lbIoL-0014yF-J3; Tue, 27 Apr 2021 08:11:14 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lbIoH-0014xu-L2
 for linux-mediatek@desiato.infradead.org; Tue, 27 Apr 2021 08:11:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
 Subject:Sender:Reply-To:Content-ID:Content-Description;
 bh=07RKmapJWTopIz2gVmzJzG36kGAwBXId0uiyJDLJlZA=; b=RAq6GyXLSDdNCm8eYu186ScOox
 VoHvrUQIoXhIvZxqlnblS+zoyIIMGnqSTWqFTYNvOWauR4Gwp9YsVTHfn/Cbu699PqnvS6ppo1zMT
 BZVkbDTWAZWh2RZVOCA9EJVyu9nZF97Lor5Fk/HOV+Q51pIhQ5EOboFb61a4GV3jVGJEW0PATBcH7
 PpsQjoZ4abIM8qE0so1WIItQdY5327YxWIQfIayG4f5Iaqyub65OzFdYaA1rKnYNMy16q5Lk4w4Z9
 Xl/LLo+wDTattiFQVSs07uvNvmFMl4BLsfKiBZUA6leqF+4PxSOoIQZOgaNwUw7tmOBB/jD6fjwa7
 yOThoZXA==;
Received: from nbd.name ([2a01:4f8:221:3d45::2])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lbIoE-00GWz9-Tr
 for linux-mediatek@lists.infradead.org; Tue, 27 Apr 2021 08:11:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
 s=20160729; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=07RKmapJWTopIz2gVmzJzG36kGAwBXId0uiyJDLJlZA=; b=QKE+33mVv6Ype/XoL1Jfx2uShW
 a9pMlZl9eLxgXzOwVuCNBwGkznYSA5xN7xmlMd5uS7w5qcUyFvPmbacYwWc5znKHp9DvduMz9qHUk
 a2KOwH+x39ms+yA9LMxPTiNoh8T4fqgYQe732OM/6R1cMYsXPRSQIawxsJi0fBRm5mSg=;
Received: from p4ff13bc6.dip0.t-ipconnect.de ([79.241.59.198] helo=nf.local)
 by ds12 with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.89) (envelope-from <nbd@nbd.name>)
 id 1lbIo7-00077p-VZ; Tue, 27 Apr 2021 10:11:00 +0200
Subject: Re: [PATCH] mac80211: minstrel_ht: fix minstrel_aggr_check for encap
 offload
To: Ryder Lee <ryder.lee@mediatek.com>
Cc: Johannes Berg <johannes.berg@intel.com>,
 Lorenzo Bianconi <lorenzo.bianconi@redhat.com>,
 Shayne Chen <shayne.chen@mediatek.com>, linux-wireless@vger.kernel.org,
 linux-mediatek@lists.infradead.org
References: <d5303cd9935a9a2f44b76070d191e753895da516.1619489753.git.ryder.lee@mediatek.com>
From: Felix Fietkau <nbd@nbd.name>
Message-ID: <6d94a83a-c807-13a5-a2aa-d5adb780ba80@nbd.name>
Date: Tue, 27 Apr 2021 10:10:58 +0200
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <d5303cd9935a9a2f44b76070d191e753895da516.1619489753.git.ryder.lee@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210427_011107_195094_BEFF57B6 
X-CRM114-Status: GOOD (  13.14  )
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


On 2021-04-27 04:20, Ryder Lee wrote:
> Avoid checking ieee80211_hdr to support encap offload.
> 
> Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
> ---
>  net/mac80211/rc80211_minstrel_ht.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/net/mac80211/rc80211_minstrel_ht.c b/net/mac80211/rc80211_minstrel_ht.c
> index ecad9b10984f..02a6648aba54 100644
> --- a/net/mac80211/rc80211_minstrel_ht.c
> +++ b/net/mac80211/rc80211_minstrel_ht.c
> @@ -1180,20 +1180,19 @@ minstrel_downgrade_rate(struct minstrel_ht_sta *mi, u16 *idx, bool primary)
>  static void
>  minstrel_aggr_check(struct ieee80211_sta *pubsta, struct sk_buff *skb)
>  {
> -	struct ieee80211_hdr *hdr = (struct ieee80211_hdr *) skb->data;
>  	struct sta_info *sta = container_of(pubsta, struct sta_info, sta);
>  	u16 tid;
>  
>  	if (skb_get_queue_mapping(skb) == IEEE80211_AC_VO)
>  		return;
>  
> -	if (unlikely(!ieee80211_is_data_qos(hdr->frame_control)))
> +	if (unlikely(!pubsta->wme))
The ieee80211_is_data_qos check should still be performed for
non-offloaded packets to avoid triggering on management frames.

- Felix

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
