Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC4E6C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 Apr 2022 09:56:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Subject:From:References:Cc:
	To:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NY1mY2EENt+6W0uYuohWJLWbY88jrdhH5JXHF37iWYc=; b=xwDwAASzHdcsLq
	reNw7joCZH8c9XYY2+2e2EPv0oktSLOs2osiTks4nzCPVyrxWzhUdDxD/Ln/j537TSdwRSssZVNKc
	BqGqG8dGSUV4jds9Ba21YumHgBh5UR//wpw24UB2E9yfgDPdONWlh50LCITJj9ncz//hpuBeb663a
	Umz9x5Y0uRfue/kULqhlJ4Q3UAAiM3oB0Y2d5mtDkCfnxuF378chb0AfvF2VmBrkfd5CUvgiuH1hg
	lXh8XVC2SfdrzzavKZ6Z6Y+isvoMqyeN6Co1RfZVzShANsWyrvkBZaXeHMsPqdP+AK7+NBfSvfYXI
	mXRAaKO+gYLlRBX4yWqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1neDFr-00D5jm-FI; Tue, 12 Apr 2022 09:56:11 +0000
Received: from wp530.webpack.hosteurope.de ([2a01:488:42:1000:50ed:8234::])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1neDFB-00D5TL-MO; Tue, 12 Apr 2022 09:55:31 +0000
Received: from ip4d144895.dynamic.kabel-deutschland.de ([77.20.72.149]
 helo=[192.168.66.200]); authenticated
 by wp530.webpack.hosteurope.de running ExIM with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 id 1neDEx-0005Ez-CY; Tue, 12 Apr 2022 11:55:15 +0200
Message-ID: <7aa0bbd0-5498-ba74-ad6d-6dacbade8a3d@leemhuis.info>
Date: Tue, 12 Apr 2022 11:55:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-US
To: Kalle Valo <kvalo@kernel.org>, Philippe Schenker <dev@pschenker.ch>
Cc: linux-wireless@vger.kernel.org, Felix Fietkau <nbd@nbd.name>,
 "David S. Miller" <davem@davemloft.net>, Deren Wu <deren.wu@mediatek.com>,
 Jakub Kicinski <kuba@kernel.org>,
 Lorenzo Bianconi <lorenzo.bianconi83@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Paolo Abeni <pabeni@redhat.com>,
 Ryder Lee <ryder.lee@mediatek.com>, Sean Wang <sean.wang@mediatek.com>,
 Shayne Chen <shayne.chen@mediatek.com>, YN Chen <YN.Chen@mediatek.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, netdev@vger.kernel.org,
 "regressions@lists.linux.dev" <regressions@lists.linux.dev>
References: <20220412090415.17541-1-dev@pschenker.ch>
 <87y20aod5d.fsf@kernel.org>
From: Thorsten Leemhuis <regressions@leemhuis.info>
Subject: Re: [PATCH] Revert "mt76: mt7921: enable aspm by default"
In-Reply-To: <87y20aod5d.fsf@kernel.org>
X-bounce-key: webpack.hosteurope.de; regressions@leemhuis.info; 1649757329;
 02b6a16c; 
X-HE-SMSGID: 1neDEx-0005Ez-CY
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220412_025529_936505_01012834 
X-CRM114-Status: GOOD (  13.13  )
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

On 12.04.22 11:37, Kalle Valo wrote:
> Philippe Schenker <dev@pschenker.ch> writes:
> 
>> This reverts commit bf3747ae2e25dda6a9e6c464a717c66118c588c8.
>>
>> This commit introduces a regression on some systems where the kernel is
>> crashing in different locations after a reboot was issued.
>>
>> This issue was bisected on a Thinkpad P14s Gen2 (AMD) with latest firmware.
>>
>> Link: https://lore.kernel.org/linux-wireless/5077a953487275837e81bdf1808ded00b9676f9f.camel@pschenker.ch/
>> Signed-off-by: Philippe Schenker <dev@pschenker.ch>
> 
> Can I take this to wireless tree? Felix, ack?
> 
> I'll also add:
> 
> Fixes: bf3747ae2e25 ("mt76: mt7921: enable aspm by default")

Sorry, stupid questions from the regression tracker: wouldn't this cause
a regression for users of kernel versions post-bf3747ae2e25, as the
power consumption is likely to increase for them? Without having dug
into the backstory much: would disabling ASPM for this particular
machine using a quirk be the better approach? Or are we assuming a lot
of machines are affected?

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)

P.S.: As the Linux kernel's regression tracker I'm getting a lot of
reports on my table. I can only look briefly into most of them and lack
knowledge about most of the areas they concern. I thus unfortunately
will sometimes get things wrong or miss something important. I hope
that's not the case here; if you think it is, don't hesitate to tell me
in a public reply, it's in everyone's interest to set the public record
straight.


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
