Return-Path: <SRS0=EI02=O3=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B42A2C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 Oct 2021 23:51:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6D7CC61027
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 Oct 2021 23:51:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6D7CC61027
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=candelatech.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gI8efjtu67f9P6pj+63D/zptL73iUJDI1Am/HPcoWUo=; b=AHQMeNqyBDPIbFioKcgwYyq++T
	x9CXBCJUORSEC9FRoICLTYmHzciI9t11OBz5s7FWv5yrheep5aaOYZOMsnWQSyyUxSdRvqMjHzLZV
	TPCXlRrcLOtVlD+WxnQPHKcKBko6sa417+IX8N0Bo1zWO0zMAkZKJ/okNWEEpM0e1sXJvcAaOd42T
	5/MUp0SrSZGVrCdxY2jFvAS2VxI6P5moFw+fubolbOvlego6UV6Of8awKUDNYZ46EWh4JEW1eZtz7
	uc/2SgIcsLR+a/GHwpylyJP0jMdDYRe80deBNZDqgmbZCAt13hSmYiGeuH7acMFhNSXBPRd9lKYAP
	/cCKCWpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mYdA3-0014PG-EB; Thu, 07 Oct 2021 23:50:51 +0000
Received: from dispatch1-us1.ppe-hosted.com ([148.163.129.49])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mYd9x-0014NR-6c
 for linux-mediatek@lists.infradead.org; Thu, 07 Oct 2021 23:50:49 +0000
X-Virus-Scanned: Proofpoint Essentials engine
Received: from mx1-us1.ppe-hosted.com (unknown [10.7.67.131])
 by mx1-us1.ppe-hosted.com (PPE Hosted ESMTP Server) with ESMTPS id 87C8A2005E; 
 Thu,  7 Oct 2021 23:50:43 +0000 (UTC)
Received: from mail3.candelatech.com (mail2.candelatech.com [208.74.158.173])
 by mx1-us1.ppe-hosted.com (PPE Hosted ESMTP Server) with ESMTP id
 1038E980068; Thu,  7 Oct 2021 23:50:42 +0000 (UTC)
Received: from [192.168.100.195] (50-251-239-81-static.hfc.comcastbusiness.net
 [50.251.239.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail3.candelatech.com (Postfix) with ESMTPSA id 47EA913C2B0;
 Thu,  7 Oct 2021 16:50:42 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail3.candelatech.com 47EA913C2B0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=candelatech.com;
 s=default; t=1633650642;
 bh=T6vwDbx+pV/hvMObb7NO5tmpk+mAlu0GxmSe7c+x770=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=iM9hpCjHp60OvIAgXA+5DhDX29oHTVCVya2oVGpoDLbaWs/jaypqjtvU2utVG+lzD
 Y+aO0wz9Sg4JsPf4UbgZdtyH4EsKlczxrsViRovmHZPBzZofI0S48gvc9EpDgXW84P
 HYKVPBoyAGT21G4Lyxdp1RkdWugLj0HkxPr2lWzI=
Subject: Re: [PATCH v5 1/8] mt76: mt7915: introduce
 mt7915_mcu_beacon_check_caps()
To: Shayne Chen <shayne.chen@mediatek.com>, Felix Fietkau <nbd@nbd.name>
Cc: linux-wireless <linux-wireless@vger.kernel.org>,
 Lorenzo Bianconi <lorenzo.bianconi@redhat.com>,
 Ryder Lee <ryder.lee@mediatek.com>, Evelyn Tsai <evelyn.tsai@mediatek.com>,
 linux-mediatek <linux-mediatek@lists.infradead.org>
References: <20211001095355.10598-1-shayne.chen@mediatek.com>
From: Ben Greear <greearb@candelatech.com>
Organization: Candela Technologies
Message-ID: <dbe9af7e-dd5a-827b-aedc-c0fa767faf05@candelatech.com>
Date: Thu, 7 Oct 2021 16:50:41 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20211001095355.10598-1-shayne.chen@mediatek.com>
Content-Language: en-US
X-MDID: 1633650644-XrS8nWtV6ccy
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211007_165045_946375_CFB9BF54 
X-CRM114-Status: GOOD (  14.55  )
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

On 10/1/21 2:53 AM, Shayne Chen wrote:
> From: Ryder Lee <ryder.lee@mediatek.com>
> 
> Beacon elements might be changed by hostapd configuraion, so driver
> should compare both IEs and PHY capabilities to get the least common
> denominator before association.
> 
> Co-developed-by: Evelyn Tsai <evelyn.tsai@mediatek.com>
> Signed-off-by: Evelyn Tsai <evelyn.tsai@mediatek.com>
> Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
> Signed-off-by: Shayne Chen <shayne.chen@mediatek.com>
> ---
> v2: modify condition for mimo_dl_en
> v5: rebase to staging tree

Have you tested this in station mode?  I tried merging this into my tree
and it broke station mode.  Symptom was that it associated, but could not
get DHCP.  It worked if I disabled AX mode and made it associate as 11ac.

I think root cause is probably that the beacon is never set in STA mode,
but the code building the MCU messages are unconditionally looking at
the values derived from the beacon caps when making decisions about bfer/bfee
and ldpc and such.

Thanks,
Ben

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
