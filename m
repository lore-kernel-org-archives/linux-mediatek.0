Return-Path: <SRS0=6w7/=HO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 493CCC433DB
	for <linux-mediatek@archiver.kernel.org>; Fri, 12 Feb 2021 17:20:45 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EBE1064DE9
	for <linux-mediatek@archiver.kernel.org>; Fri, 12 Feb 2021 17:20:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EBE1064DE9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=qf3Ics02BexBEflIqVmTWjTgqg502QXiDnA86Cx8/34=; b=iiFO72rQ0RR9IsMWtcnGOCTMU
	43OE4OxNA7oQAbTnsSSNoAPcxRNVuFNTWRuVdSDh9w4bPVD4vSHB/Xusow9RkUhtz+k0TpDfkoiar
	ixriq0YdbsXrk1IfGPE+Rx3lgHP+k8gu4lH1gYDOoyXzFKGZF6psrROO4bnwOX15YMEx+iBxSc/kJ
	NeWrmO+UB1dFuJFdCM1LczSl5IcCJbvLzw3PDJkLj8xVrQesmPIg5SDTknMXmQBDAZOxHpAIM7rPS
	vm//lD5OPeVuFikoPhIYOpGpTf22e2XREfhq4jtDk5MCoJtqowz2uqTJMkkTQE3pckJBSFwmI4WV8
	ADbwiObBg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lAc7P-0007Of-8K; Fri, 12 Feb 2021 17:20:35 +0000
Received: from mail-il1-x135.google.com ([2607:f8b0:4864:20::135])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lAc7L-0007NA-Ej
 for linux-mediatek@lists.infradead.org; Fri, 12 Feb 2021 17:20:32 +0000
Received: by mail-il1-x135.google.com with SMTP id e1so8859258ilu.0
 for <linux-mediatek@lists.infradead.org>; Fri, 12 Feb 2021 09:20:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linuxfoundation.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=n9DaPQNZ9ApDhbjk3lpcweLqgl0plvUaf017MPEDmY4=;
 b=bH7T+IP0hxSM4qnABSsyIGH8bQIX8SeAq5MeI+UJbArLYzuYwzj4s+w0R6hYaioIv3
 5l8j7hmD5TJxLVvpuP9gkfBDhs+RBXF6Esk6LyXnY2p0jkIUh3NI6cZMM2GEBxLC7yHF
 wWvueSO5T3GxMWuJGZN82vxNXh9J8KLIu3LUc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=n9DaPQNZ9ApDhbjk3lpcweLqgl0plvUaf017MPEDmY4=;
 b=NvGmdDYMxLxQpG7XiUMQtZvz5hK1CNTRC3O7xb7yuObFW760pwkpiWCJTWqGwgyX4d
 RnpCDZ6nWh02TdycTDLf0X3zyRxVOwrPjqsYNNxhzosO8PXBdX9TRloZd2cmScCfvFw3
 3ZUUNrDAzDzdp0bmHQTrQ+XXYlW4Vg2bApjrl/v6Kw7xS7vnJiOXaJoXQBGsgKDjdtaG
 5J2pSybCGVS8/NjiC0GELQdNgP4esf0usgHG8AQyX+r37JZJivuTTBqBdjDYIC3w6rJs
 /yPPnfMXEz15bBR9TTRxhtVQAuCKhrMSfTKgFH5jbBQP5m96U+Tqu6mHme4fbZZFVXJW
 uazQ==
X-Gm-Message-State: AOAM530zRlwL1i6ZHX5s6l0/gkK0O9WU0PXMndAOsEKp0Phs2tbaTIfC
 T97wRfUGmYat5y+0W1wG9O8J/A==
X-Google-Smtp-Source: ABdhPJy5u1pyxefeNefBUn+dDMHhvH9gQ1EoCBGDLyeSaQPbgvcoJetHzEOChfwu19Om76iN6cmLzQ==
X-Received: by 2002:a92:b749:: with SMTP id c9mr2906435ilm.199.1613150429332; 
 Fri, 12 Feb 2021 09:20:29 -0800 (PST)
Received: from [192.168.1.112] (c-24-9-64-241.hsd1.co.comcast.net.
 [24.9.64.241])
 by smtp.gmail.com with ESMTPSA id o131sm4632861ila.5.2021.02.12.09.20.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 12 Feb 2021 09:20:28 -0800 (PST)
Subject: Re: [PATCH] mt76: hold RCU lock when calling
 ieee80211_find_sta_by_ifaddr()
To: Felix Fietkau <nbd@nbd.name>, lorenzo.bianconi83@gmail.com,
 ryder.lee@mediatek.com, kvalo@codeaurora.org, davem@davemloft.net,
 kuba@kernel.org, matthias.bgg@gmail.com
References: <cover.1613090339.git.skhan@linuxfoundation.org>
 <1cfa036227cfa9fdd04316c01e1d754f13a70d9e.1613090339.git.skhan@linuxfoundation.org>
 <20210212021312.40486-1-skhan@linuxfoundation.org>
 <3949e1fc-c050-73e0-d02f-63a25c4821ef@nbd.name>
From: Shuah Khan <skhan@linuxfoundation.org>
Message-ID: <61994394-0d95-39eb-2a11-487ca7c6c37b@linuxfoundation.org>
Date: Fri, 12 Feb 2021 10:20:27 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <3949e1fc-c050-73e0-d02f-63a25c4821ef@nbd.name>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210212_122031_572741_B5BC281F 
X-CRM114-Status: GOOD (  12.04  )
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
Cc: netdev@vger.kernel.org, linux-wireless@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Shuah Khan <skhan@linuxfoundation.org>, linux-arm-kernel@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 2/11/21 10:36 PM, Felix Fietkau wrote:
> 
> On 2021-02-12 03:13, Shuah Khan wrote:
>> ieee80211_find_sta_by_ifaddr() must be called under the RCU lock and
>> the resulting pointer is only valid under RCU lock as well.
>>
>> Fix mt76_check_sta() to hold RCU read lock before it calls
>> ieee80211_find_sta_by_ifaddr() and release it when the resulting
>> pointer is no longer needed.
>>
>> This problem was found while reviewing code to debug RCU warn from
>> ath10k_wmi_tlv_parse_peer_stats_info() and a subsequent manual audit
>> of other callers of ieee80211_find_sta_by_ifaddr() that don't hold
>> RCU read lock.
>>
>> Signed-off-by: Shuah Khan <skhan@linuxfoundation.org>
> If I'm not mistaken, this patch is unnecessary. mt76_check_sta is only
> called from mt76_rx_poll_complete, which itself is only called under RCU
> lock.
> 

Yes. You are right. I checked the caller of this routine and didn't
go further up. :)

thanks,
-- Shuah


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
