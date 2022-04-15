Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5830C433FE
	for <linux-mediatek@archiver.kernel.org>; Fri, 15 Apr 2022 13:01:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vmUnfKxHnCsnCJCdUDRco+YKEOWjXKX0HgdImP/l+QQ=; b=hUZWSaSRnVzuILwQ2dJioRit+y
	7glffH24VFB9XlyHMlLHyH5WLTVdx2N1XSb0njfDY532HEGGxSMeHW2OC8sj6ZS8mwP8shkt6UK0T
	Lj6JAAS2AwjGd99JivBL1NpqLYEZdpa5aXkUieIX63Xcqe4pSc9zRWxytE6OQLik8Vd+6fBQ7Y790
	2SwfqXdAAnzwII/OnwEyMWSP+jiFXEslRy0gWxTSh7COlmkWRrZstZZFj1nrj7xLl06PnOYsOZKBD
	6MGD4VUNYqw1BXXz9j0Fm0//84nqmnm7HTNBxCQX6/rM+79KblopTe/Nyua5aNUZAKjid8KejDpvm
	rKsvm9bQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nfLZm-00ABNd-Pj; Fri, 15 Apr 2022 13:01:26 +0000
Received: from dispatch1-us1.ppe-hosted.com ([67.231.154.164])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nfLZi-00ABMj-V8
 for linux-mediatek@lists.infradead.org; Fri, 15 Apr 2022 13:01:25 +0000
X-Virus-Scanned: Proofpoint Essentials engine
Received: from mx1-us1.ppe-hosted.com (unknown [10.110.51.173])
 by mx1-us1.ppe-hosted.com (PPE Hosted ESMTP Server) with ESMTPS id 24E0F2A007C;
 Fri, 15 Apr 2022 13:01:19 +0000 (UTC)
Received: from mail3.candelatech.com (mail2.candelatech.com [208.74.158.173])
 by mx1-us1.ppe-hosted.com (PPE Hosted ESMTP Server) with ESMTP id
 356B5200091; Fri, 15 Apr 2022 13:01:18 +0000 (UTC)
Received: from [192.168.1.115] (unknown [98.97.67.209])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail3.candelatech.com (Postfix) with ESMTPSA id F371F13C2B0;
 Fri, 15 Apr 2022 06:01:16 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail3.candelatech.com F371F13C2B0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=candelatech.com;
 s=default; t=1650027677;
 bh=97Pwh5Wb0Tmj32eBIlqicePDh2T1qVGNCP+b9k8pu8o=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=i9XqPgPykla7e07qmPJH4NqMkvTPRO1s1N1B/zT+oUYbKdic7E/2Vraaf+K26Sx16
 clgls7796m4+grwyFNIQiwdS1ZZgJyOyFWSlkhc0OamIe3tTP99uw+h1MUygmX8sH3
 HJUJNs4W8oePYLqGLwnG0aq+OyJcdujQEHjBPAlM=
Subject: Re: [PATCH v2] mt76: mt7915: add debugfs knob for RF registers
 read/write
To: Shayne Chen <shayne.chen@mediatek.com>, Felix Fietkau <nbd@nbd.name>
Cc: linux-wireless <linux-wireless@vger.kernel.org>,
 Lorenzo Bianconi <lorenzo@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>,
 Evelyn Tsai <evelyn.tsai@mediatek.com>, Bo Jiao <Bo.Jiao@mediatek.com>,
 linux-mediatek <linux-mediatek@lists.infradead.org>,
 Peter Chiu <chui-hao.chiu@mediatek.com>
References: <20220415061444.30720-1-shayne.chen@mediatek.com>
 <c8662170-bf59-06df-a78c-8fb24303f274@nbd.name>
 <9188cd3d7463cb8fc65c741bd07de817d0e60f6f.camel@mediatek.com>
From: Ben Greear <greearb@candelatech.com>
Organization: Candela Technologies
Message-ID: <1cb3d71f-5537-a4ab-8711-62ecd4b84c43@candelatech.com>
Date: Fri, 15 Apr 2022 06:01:16 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <9188cd3d7463cb8fc65c741bd07de817d0e60f6f.camel@mediatek.com>
Content-Language: en-MW
X-MDID: 1650027679-N_yYVltTBvWx
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220415_060123_272040_46BD7643 
X-CRM114-Status: GOOD (  15.13  )
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

On 4/15/22 4:15 AM, Shayne Chen wrote:
> On Fri, 2022-04-15 at 10:26 +0200, Felix Fietkau wrote:
>> On 15.04.22 08:14, Shayne Chen wrote:
>>> Add RF registers read/write support for debugging RF issues, which
>>> should be processed by mcu commands.
>>>
>>> Reviewed-by: Ryder Lee <ryder.lee@mediatek.com>
>>> Signed-off-by: Peter Chiu <chui-hao.chiu@mediatek.com>
>>> Signed-off-by: Shayne Chen <shayne.chen@mediatek.com>
>>
>> What's the required width of rf_sel and rf_ofs? Would both fit
>> together
>> in a single u32? If so, you could just use the generic regidx
>> debugfs
>> file for both and simply add a rf_regval debugfs file.
>>
>> - Felix
> 
> Hi Felix,
> 
> FW use the WF sel (antenna 0-3) and offset to locate rf registers.
> I'll send an update patch to merge them in the generic regidx with
> wf sel [31:28] and offset [27:0].
> 
> Thanks,
> Shayne

Hello,

Can you document the registers, or is this only for internal mediatek use?

Thanks,
Ben

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
