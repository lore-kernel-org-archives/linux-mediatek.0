Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A4AEC79FA7
	for <linux-mediatek@archiver.kernel.org>; Mon,  7 Sep 2026 16:30:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MYM5k0cT2N2UhpzxiCFOEacW12X9/VsuAy9xIeYsId4=; b=4vwngktucJtIvSiFs9pvOT8CVD
	6aoSkXzLOv9+xAoqGaVrlasr9E1SVgNZAkHlo3oM8Q8RF1URw8fkBv7/xkXrYXGiFc8tcYssBLmtx
	e92K6hlYTteB4K/fZtRZGYXuDRI1MY2Wg0Ens6kR5kPrs0yoDbXlBZ+VRPGD2bko1J5ao1+rAbDeg
	iD9nezFp6p8BwXo0ARLiiTiFDvfhuRO5eWVgBrx6naMGmTLlvDf2412jttW9ebxK5aEEhrDC781KU
	D7ZxxZ0r1IOncVmVaC8ghVVU4DenXKxYssBisUB5+HKuoV1EHLLMXyUYZ8GpFBvGIX1da26vMaoeH
	sd9g0C0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3cEx-00000007Id0-3HbR;
	Mon, 07 Sep 2026 16:30:39 +0000
Received: from dispatch1-us1.ppe-hosted.com ([148.163.129.48])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3cEu-00000007IbI-2aXZ
	for linux-mediatek@lists.infradead.org;
	Mon, 07 Sep 2026 16:30:38 +0000
X-Virus-Scanned: Proofpoint Essentials engine
Received: from mail3.candelatech.com (mail.candelatech.com [208.74.158.173])
	by mx1-us1.ppe-hosted.com (PPE Hosted ESMTP Server) with ESMTP id 2B1851C0077;
	Mon,  7 Sep 2026 16:30:33 +0000 (UTC)
Received: from [192.168.3.187] (unknown [98.97.32.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail3.candelatech.com (Postfix) with ESMTPSA id 5ED3513C2B0;
	Mon,  7 Sep 2026 09:30:32 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail3.candelatech.com 5ED3513C2B0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=candelatech.com;
	s=default; t=1788798632;
	bh=0jap3ZDKcYB9NpovB34NodaYGLRQNOA87oMfzixSoDc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=b+M1y5rE1xdBy4i+oy/zYD3L+1rBaAApiScuYqt3tHSlzIEfZlgXml5O9c3e7gkcA
	 3oakjFv806GSgyFouKq4nKfhvvthUnqFUmvsJ93Fuxp5Fiv95VNKDvu6cERfy1MtsN
	 efVNc7bmb3Fj80bC/OmvinGynRJv2Zebkj7688Gk=
Message-ID: <eb405366-6574-4e4c-a89d-363751ed848b@candelatech.com>
Date: Mon, 7 Sep 2026 09:30:31 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [bug] Triple whammy of mt7996e bugs on 7.2+
To: Ilya K <me@0upti.me>
Cc: linux-wireless@vger.kernel.org, netdev@vger.kernel.org,
 linux-mediatek@lists.infradead.org
References: <1767631788532094@64c4e675-cd08-4a74-816f-886742f9bfcd>
 <529a79bc-dab7-aa41-00bd-c47ecbefaa00@candelatech.com>
 <471221788538289@323ca970-5bd2-4c6b-b52d-2b863a718615>
 <3acf531c-bcc7-412b-b3bb-665069260e46@candelatech.com>
 <2028561788553569@f088f4ec-f441-47a1-b7e4-75a1052aa4df>
 <2418461788691106@84aa39c5-f501-4e64-8418-6a8b6eb88e21>
Content-Language: en-MW
From: Ben Greear <greearb@candelatech.com>
Organization: Candela Technologies
In-Reply-To: <2418461788691106@84aa39c5-f501-4e64-8418-6a8b6eb88e21>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MDID: 1788798634-Qedb_RYpJlvj
X-PPE-STACK: {"stack":"us5"}
X-MDID-O: us5;ut7;1788798634;Qedb_RYpJlvj;<greearb@candelatech.com>;6f76c88c2c731de9ad886e575864f8cc
X-PPE-TRUSTED: V=1;DIR=OUT;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260907_093036_682661_22715981 
X-CRM114-Status: GOOD (  12.80  )
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

On 9/6/26 3:38 AM, Ilya K wrote:
>> This abomination is now booted on my hardware and I'll get back to you if it explodes again, which I'd expect to happen at some point
> during the weekend at worst (and if it survives longer, that's already an improvement).
> 
> OK so it's been over a day with no explosions which is already better than its previous best. The question now I guess is: which one of the patches actually fixes it? And do the teardown paths still need fixing?
> 

I don't know why your kernel wasn't working to begin with, so not sure exactly what in our tree would
fix it.  We do have some mt7996 tx-hang work arounds, but that bug was reproduced in STA mode in a fairly weird
test case with lots of virtual STA vdevs, so not sure it applies to your case.

Possibly too it is something we pulled in from Felix's tree that will likely be in 7.3
kernel.

As a note, we found a regression in our current 7.2 tree, MLMR has regressed with scan failure being the
symptom, hopefully we'll get that fixed this week.

Thanks,
Ben

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com

