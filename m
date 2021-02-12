Return-Path: <SRS0=6w7/=HO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A243C433E0
	for <linux-mediatek@archiver.kernel.org>; Fri, 12 Feb 2021 05:37:07 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7F0A764E57
	for <linux-mediatek@archiver.kernel.org>; Fri, 12 Feb 2021 05:37:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7F0A764E57
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=nbd.name
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=3gE4G8MpgkEzEZyUW8j/NuQSwiwRycJ92We8MyGCiIE=; b=oJ8lviomsEDMYESbKvEM6dFyu
	0SYZ0cW54wsUOCjSAOSY1OTV5IH7TQk2xHGMM7l7dkSP5/dR8S9rg4+Wkv+jgYA4rtUY149HKd7bZ
	9Sc2VQqobcTBm2bQcl3Yv1i3BDQJkUCD2PQX16LButShn9Psq3pR6PEV9+ZyiMpwctMNA4LVbrWz9
	HSrez8bS19Vjgf4q7nXwn34z4nm2cAaR6jYVPeZz+lkf/EVxPbW/Gm+6D81ARoK4FWRtrdm7ZVLI2
	tIdsqYZomTMSL/UEULOtP51JGjWhNsgRu+/OF4DUppgwYdoIhyKWhfGEqyafg+Cn+PnNUczQqIozP
	bYFDasJdA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lAR8T-0006PH-19; Fri, 12 Feb 2021 05:36:57 +0000
Received: from nbd.name ([2a01:4f8:221:3d45::2])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lAR8R-0006Oq-4L; Fri, 12 Feb 2021 05:36:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
 s=20160729; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=IrIGGg1sQ0NzZ4N2HMEewDUIFN5I3hxmFeu/bsPG8go=; b=hRoL8HWatqx5zH5SPjceLEYXES
 J6w7esRc5f2yF/oZQdxX7QVK+3IgqtYpRUWhd9DHQTk0mSMklrWLNXPoDtzY8RVE5U8bk6IYRLz5i
 hnx+WQteK7BK9N5aTYOHiMA1WqqIxt+6OZElBFNwTJ0mB+h8KqAq2sqQZpyHOPEPgmMI=;
Received: from p4ff13c8d.dip0.t-ipconnect.de ([79.241.60.141] helo=nf.local)
 by ds12 with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.89) (envelope-from <nbd@nbd.name>)
 id 1lAR8N-0003rX-I8; Fri, 12 Feb 2021 06:36:51 +0100
Subject: Re: [PATCH] mt76: hold RCU lock when calling
 ieee80211_find_sta_by_ifaddr()
To: Shuah Khan <skhan@linuxfoundation.org>, lorenzo.bianconi83@gmail.com,
 ryder.lee@mediatek.com, kvalo@codeaurora.org, davem@davemloft.net,
 kuba@kernel.org, matthias.bgg@gmail.com
References: <cover.1613090339.git.skhan@linuxfoundation.org>
 <1cfa036227cfa9fdd04316c01e1d754f13a70d9e.1613090339.git.skhan@linuxfoundation.org>
 <20210212021312.40486-1-skhan@linuxfoundation.org>
From: Felix Fietkau <nbd@nbd.name>
Message-ID: <3949e1fc-c050-73e0-d02f-63a25c4821ef@nbd.name>
Date: Fri, 12 Feb 2021 06:36:26 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:78.0)
 Gecko/20100101 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210212021312.40486-1-skhan@linuxfoundation.org>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210212_003655_639027_7C3BEDA9 
X-CRM114-Status: GOOD (  13.57  )
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
Cc: netdev@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


On 2021-02-12 03:13, Shuah Khan wrote:
> ieee80211_find_sta_by_ifaddr() must be called under the RCU lock and
> the resulting pointer is only valid under RCU lock as well.
> 
> Fix mt76_check_sta() to hold RCU read lock before it calls
> ieee80211_find_sta_by_ifaddr() and release it when the resulting
> pointer is no longer needed.
> 
> This problem was found while reviewing code to debug RCU warn from
> ath10k_wmi_tlv_parse_peer_stats_info() and a subsequent manual audit
> of other callers of ieee80211_find_sta_by_ifaddr() that don't hold
> RCU read lock.
> 
> Signed-off-by: Shuah Khan <skhan@linuxfoundation.org>
If I'm not mistaken, this patch is unnecessary. mt76_check_sta is only
called from mt76_rx_poll_complete, which itself is only called under RCU
lock.

- Felix

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
