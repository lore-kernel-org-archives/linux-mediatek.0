Return-Path: <SRS0=gQ79=JX=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6EE7BC433B4
	for <linux-mediatek@archiver.kernel.org>; Mon, 26 Apr 2021 18:42:23 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 12A59613C9
	for <linux-mediatek@archiver.kernel.org>; Mon, 26 Apr 2021 18:42:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 12A59613C9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=candelatech.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=S/dApa7ijyG+zmOQM8SuCeCN1ledaz9T/+xRU0P/MRU=; b=ZUmGwpvu8jnUZG+PVbO3xnMYo
	mnhlD4eJnv83hVLb8MESsWAwgKSBWO5wMy79mwTTKbLonM0m/FhKM/f8jS4UXWReIRJORduDRzuDB
	N3CrL6ecYTOR7ifbnNfMguUzkmRqo3L7Qn7FPGWOvkBYKk/12lMsbY+G4XvsFo0QAl6aTsL/3YCm9
	1ZEN72jGHrF6r5H3bEOfHf5/u7nhYO3ZVUag/S9W3BjbPjMmNZOQ57TlkN4O/q/wm2fKvH7ohtmvS
	siu51Fze7XmzuZyanYcLcv9/KLEK5syxZ64eVdY0HIBvgvvB/P0l1qvRqdnYkzV/aeOmaA/5s4Due
	nfmojbPXQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lb6BJ-008Jpz-OB; Mon, 26 Apr 2021 18:42:05 +0000
Received: from dispatch1-us1.ppe-hosted.com ([67.231.154.184])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lb6BC-008Jnb-8L
 for linux-mediatek@lists.infradead.org; Mon, 26 Apr 2021 18:42:02 +0000
X-Virus-Scanned: Proofpoint Essentials engine
Received: from mx1-us1.ppe-hosted.com (unknown [10.110.51.26])
 by mx1-us1.ppe-hosted.com (PPE Hosted ESMTP Server) with ESMTPS id 6355820064; 
 Mon, 26 Apr 2021 18:41:45 +0000 (UTC)
Received: from mail3.candelatech.com (mail2.candelatech.com [208.74.158.173])
 by mx1-us1.ppe-hosted.com (PPE Hosted ESMTP Server) with ESMTP id
 B88E694007E; Mon, 26 Apr 2021 18:41:44 +0000 (UTC)
Received: from [192.168.223.32]
 (75-149-161-6-Washington.hfc.comcastbusiness.net [75.149.161.6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail3.candelatech.com (Postfix) with ESMTPSA id B034513C2B3;
 Mon, 26 Apr 2021 11:41:35 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail3.candelatech.com B034513C2B3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=candelatech.com;
 s=default; t=1619462496;
 bh=yzDerBNFZC8MxvrfMVvZ8ayoxqDt0c427d/6l0xHWmE=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=LLf2+Ugq97v90q9WKP8YCPVkqwwUZRDfvAbXR6gOdbhaMOA0YlZYQY+eRkveZz7HC
 5C+QEKnjwqUay+3Yq85tIWeSPjnYo1n830YFDLmlHosK/5gVTLWWLPhw2ervyZ2bpJ
 j7Ua2JNHU8rK0vCAbO4rEWPgddVGSkLzE/uMaWbE=
Subject: Re: [PATCH 2/2] mt76: mt7915: add .set_bitrate_mask() callback
To: Ryder Lee <ryder.lee@mediatek.com>, Felix Fietkau <nbd@nbd.name>,
 Lorenzo Bianconi <lorenzo.bianconi@redhat.com>
Cc: Shayne Chen <shayne.chen@mediatek.com>, linux-wireless@vger.kernel.org,
 linux-mediatek@lists.infradead.org
References: <22e4a169831b6b54661b6eb4ef4f3a4a18dceb19.1619453772.git.ryder.lee@mediatek.com>
 <d422f0c844c5da1ee027250820b67f615a8b50e5.1619453772.git.ryder.lee@mediatek.com>
From: Ben Greear <greearb@candelatech.com>
Organization: Candela Technologies
Message-ID: <7776c0d1-0578-5922-1003-f8498cc0357a@candelatech.com>
Date: Mon, 26 Apr 2021 11:41:35 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <d422f0c844c5da1ee027250820b67f615a8b50e5.1619453772.git.ryder.lee@mediatek.com>
Content-Language: en-MW
X-MDID: 1619462505-CLonuDwr1f-K
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210426_194159_773327_13F80B57 
X-CRM114-Status: UNSURE (   9.60  )
X-CRM114-Notice: Please train this message.
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

On 4/26/21 9:29 AM, Ryder Lee wrote:
> Add runtime configuration for bitrate mask. Note that GI cannot be setup.
> 
> Example:
> iw dev wlan0 set bitrates vht-mcs-5 1:9 he-mcs-5 2:7
> iw dev wlan0 set bitrates legacy-5 6 he-mcs-5 2:0-11

Is this only for data frames?  In other words, is it OK to
set exactly one HE/VHT MCS rate and let mgt, bcast, mcast, still
work OK at legacy rates?

Thanks,
Ben

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
