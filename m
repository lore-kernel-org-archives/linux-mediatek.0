Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31A23C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 Apr 2022 07:33:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GFKnpVx0C05UUJ/xZfQwJQlXp4OohjfUggtl5bifOiA=; b=PVuLU01qfOxjIe
	iL8+4cODCt0HWAdxy/k1Z/pTp27cWEpys63Ab7Q6lwFYjQfGZoCxF++KpWJW252vZoJU1t2JXP7Un
	LEz8OD6pEy9jUjScu2GwbjYSHRT4UgmqfWZUbARO22sHPiyT6QGwwsnqoUW9UsvhnNLFzuge0GeMs
	cFiMoq+mnPvWnZq+Xb5beJ7PDzY+J9Ra4YY8g6PN3mZl/1yaia4IGRHnwJzjkdujyYB21NXd/NHoq
	kRK6kNLBWrBOBLsvBXSJ7sAIdQSRZipobYs25c8q6QGl1a5Ew4u/qeggWegDJ0EJTHjpmM/S4ZJAa
	2OHMfNqerAsQQ+qgoSkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1njcAU-000IjV-8Y; Wed, 27 Apr 2022 07:32:58 +0000
Received: from wp530.webpack.hosteurope.de ([2a01:488:42:1000:50ed:8234::])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1njc9s-000INN-Px; Wed, 27 Apr 2022 07:32:22 +0000
Received: from [2a02:8108:963f:de38:6624:6d8d:f790:d5c]; authenticated
 by wp530.webpack.hosteurope.de running ExIM with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 id 1njc9f-0005I9-AK; Wed, 27 Apr 2022 09:32:07 +0200
Message-ID: <60d2a5b8-7e25-3020-6092-64afe7abc186@leemhuis.info>
Date: Wed, 27 Apr 2022 09:32:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH] Revert "mt76: mt7921: enable aspm by default"
Content-Language: en-US
To: Kalle Valo <kvalo@kernel.org>
Cc: Philippe Schenker <dev@pschenker.ch>, linux-wireless@vger.kernel.org,
 Felix Fietkau <nbd@nbd.name>, "David S. Miller" <davem@davemloft.net>,
 Deren Wu <deren.wu@mediatek.com>, Jakub Kicinski <kuba@kernel.org>,
 Lorenzo Bianconi <lorenzo.bianconi83@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Paolo Abeni <pabeni@redhat.com>,
 Ryder Lee <ryder.lee@mediatek.com>, Sean Wang <sean.wang@mediatek.com>,
 Shayne Chen <shayne.chen@mediatek.com>, YN Chen <YN.Chen@mediatek.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, netdev@vger.kernel.org,
 "regressions@lists.linux.dev" <regressions@lists.linux.dev>
References: <20220412090415.17541-1-dev@pschenker.ch>
 <87y20aod5d.fsf@kernel.org>
 <7aa0bbd0-5498-ba74-ad6d-6dacbade8a3d@leemhuis.info>
 <87o816oaez.fsf@kernel.org>
From: Thorsten Leemhuis <regressions@leemhuis.info>
In-Reply-To: <87o816oaez.fsf@kernel.org>
X-bounce-key: webpack.hosteurope.de; regressions@leemhuis.info; 1651044740;
 e223c62a; 
X-HE-SMSGID: 1njc9f-0005I9-AK
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220427_003221_024507_B66A8E40 
X-CRM114-Status: GOOD (  11.31  )
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

On 12.04.22 12:36, Kalle Valo wrote:
>> Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
>> [...]
>> P.S.: As the Linux kernel's regression tracker I'm getting a lot of
>> reports on my table. I can only look briefly into most of them and lack
>> knowledge about most of the areas they concern. I thus unfortunately
>> will sometimes get things wrong or miss something important. I hope
>> that's not the case here; if you think it is, don't hesitate to tell me
>> in a public reply, it's in everyone's interest to set the public record
>> straight.
> BTW, maybe you could add that boilerplace text after P.S. into the
> signature (ie. under "-- " line)? That way your mails would more
> readable and make it more clear that you didn't write the boilerplate
> text specifically for this mail.

Late reply:

FYI, I thought back and forth about the boilerplace text and how to
handle that when I started using it. I deliberately decided against
putting it under a "-- " line, as that wouldn't work well for some of
the mails I write -- for example those where I deliberately use
top-posting (which I hate and kinda feels wrong, but nevertheless right
at the same time) to make this as easy to grasp as possible.

After your comment I have thought about it again for a while but in the
end for now decided to mostly stick to the approach I used, but your
comment made me shorten the text a bit.

Ciao, Thorsten


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
