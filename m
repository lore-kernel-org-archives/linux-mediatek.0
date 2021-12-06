Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93A86C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon,  6 Dec 2021 16:43:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lHlhNXsyEYO2u6qB37DFw01MdN/GLWjO1BjXZCZKGDo=; b=HSRO01zxuan9WqTcMUa4NO4RUP
	7ayi/A7YToczBE1SvqOfCvt2M/qqT3hFHwJItDouT70kkPTLDBrGekjJG+o7L6joBhhgccdn4hTfW
	+EWoIWokPOt7AiTk5EszKPrc5pSGYqNVDQpQDJpV4c280cEITr3pVX/BauIi+3d7a3cGkzZj0oisp
	OhCOOJwObHklhoVLSlLTi77NHxy04TJ9NgZ5mrecfsQ7v2QZTQoVsUe5XmOnb804YkdjHAZnrqCxC
	5V9PyL5IQZXrAEbLiB21135jTOqHGMkczk16Ap30nx+EU75VIHrlZnKVTXZKHEwB/8PdbXg20TAsb
	PIpGvjMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1muH5h-004pfx-BK; Mon, 06 Dec 2021 16:43:49 +0000
Received: from dispatch1-us1.ppe-hosted.com ([67.231.154.183])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1muH5e-004ped-DV
 for linux-mediatek@lists.infradead.org; Mon, 06 Dec 2021 16:43:48 +0000
X-Virus-Scanned: Proofpoint Essentials engine
Received: from mx1-us1.ppe-hosted.com (unknown [10.110.51.173])
 by mx1-us1.ppe-hosted.com (PPE Hosted ESMTP Server) with ESMTPS id 9136C1A0065;
 Mon,  6 Dec 2021 16:43:44 +0000 (UTC)
Received: from mail3.candelatech.com (mail2.candelatech.com [208.74.158.173])
 by mx1-us1.ppe-hosted.com (PPE Hosted ESMTP Server) with ESMTP id
 ACCFE20007F; Mon,  6 Dec 2021 16:43:43 +0000 (UTC)
Received: from [192.168.1.115] (unknown [98.97.71.183])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail3.candelatech.com (Postfix) with ESMTPSA id 8345013C2B0;
 Mon,  6 Dec 2021 08:43:42 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail3.candelatech.com 8345013C2B0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=candelatech.com;
 s=default; t=1638809023;
 bh=np4Kl8GmuBDzrnUel5OsncrVAHrzKSAOfRMvGQ5jMGo=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=aN2suCBu+kriULJRA2QHq0rE7QxtsS9xR4Was4e7iI3MNDItSZXPsuNLaw1cHpHzb
 heq/HMGxA6bzqDxf8RjX8/JyilganIe7DE6M6gHXUDwof/RDGK8n4AqY24faKBLU29
 R9HLiLGP7gG2605uxVf2nUM65OMVBxA0+ueVcQ6s=
Subject: Re: [PATCH] mt76: mt7915: add mu-mimo and ofdma debugfs knobs
To: MeiChia Chiu <MeiChia.Chiu@mediatek.com>, Felix Fietkau <nbd@nbd.name>
Cc: Lorenzo Bianconi <lorenzo.bianconi@redhat.com>,
 Shayne Chen <shayne.chen@mediatek.com>,
 Evelyn Tsai <evelyn.tsai@mediatek.com>, Ryder Lee <ryder.lee@mediatek.com>,
 Money Wang <Money.Wang@mediatek.com>, linux-wireless@vger.kernel.org,
 linux-mediatek@lists.infradead.org
References: <20211206141006.29632-1-MeiChia.Chiu@mediatek.com>
From: Ben Greear <greearb@candelatech.com>
Organization: Candela Technologies
Message-ID: <7158a937-57f3-2bd8-591e-124a18d2d8e8@candelatech.com>
Date: Mon, 6 Dec 2021 08:43:36 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20211206141006.29632-1-MeiChia.Chiu@mediatek.com>
Content-Language: en-MW
X-MDID: 1638809025-cW1BdMLclNrt
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211206_084346_558757_6C4E5AF2 
X-CRM114-Status: GOOD (  14.73  )
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

On 12/6/21 6:10 AM, MeiChia Chiu wrote:
> From: MeiChia Chiu <meichia.chiu@mediatek.com>
> 
> Add mu-mimo and ofdma packet counters statistics.

Hello,

Are these stats clear-on-read in the firmware?  If so, then we need to accumulate
them in the driver.

Is there any significant downside to enabling the stats?  For instance, a performance
degradation in the firmware/hardware?

Thanks,
Ben

> 
> Reviewed-by: Money Wang <money.wang@mediatek.com>
> Reviewed-by: Ryder Lee <ryder.lee@mediatek.com>
> Signed-off-by: MeiChia Chiu <meichia.chiu@mediatek.com>
> ---
>   .../net/wireless/mediatek/mt76/mt7915/debugfs.c | 242 ++++++++++++++++++++++++++++++++++++++++++++++-
>   .../net/wireless/mediatek/mt76/mt7915/mcu.c     |  41 ++++++++
>   .../net/wireless/mediatek/mt76/mt7915/mcu.h     |  45 +++++++++
>   .../net/wireless/mediatek/mt76/mt7915/mt7915.h  |   3 +
>   4 files changed, 330 insertions(+), 1 deletion(-)
> 


-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
