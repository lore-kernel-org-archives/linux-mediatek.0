Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86344C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 Apr 2022 10:34:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pkrj66bLnyUTTpnCuiTXkseFm8EEj5tbqlnaceEpnuc=; b=N75tamx7BqlRPH
	cNFsrXI4rp/i1LX3jidatmsBenBrCssyE+a4P0WngDhtw10/uvQ0RQqv2rQ4t9SSjQpIUMvz8xs9E
	In12AhSEFfJJf8dKss1kGZosCExc1CHWluPNnTi8ItmXCqaaHsteNj4TxcQB6Ca2IYaK7GWmWSAVE
	x57YD2SowkM1MkoWW1n6S3IHOEsSXFN6hFL9V3SMrIfFrvkmp+sQxjGnhHIjCl0PJlyzRtb1i3SLv
	e1kWOn03u9V3G6fOFpXWRVLkxwxkFAV7rB0IX7aP4bP1wRUkpTiFKhoSA/KJ21YcIKIubiBkc7KkR
	USjSNWZWXE0V1EU+NwKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1neDqn-00DKMF-8o; Tue, 12 Apr 2022 10:34:21 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1neDqa-00DKGd-46; Tue, 12 Apr 2022 10:34:09 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id E15DFCE1D30;
 Tue, 12 Apr 2022 10:34:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5BF10C385A1;
 Tue, 12 Apr 2022 10:33:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1649759639;
 bh=h/Lw9izRLusTDmD2KCubgYWO5EB0A5SrBYBfsF6EwZk=;
 h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
 b=b61UQ4X4zw6b2oqj7cqsksnVXuQh9qJJdTlX3mzgxfveyIxmCmtf8lGtk7t/KIU4/
 8KWpULW509FC+eUFEQvwEY9UlYa+9ykC2UgVDxngpNkJ+yrIuJWcpryAzpT3tRB3dH
 P2tiezjzuF2emFaeVhIRg1EHSBrhgn/EU+3v5s/IKYlo2y/66AEBvtoApANjBVn5qL
 qVU4HVdRH7pe49LUiABwacPBbDdo83V+4Xu5aW5tq8ZXgXRyGz+f8Ei9zi5mNC4LRl
 I2p9vq5G6dRG5UpuHGe+I2mbNqtIw9WJmAyRBFMrgkbEccPu+TCfoqnqYl38EG7hx4
 X9N3CA/7efcLg==
From: Kalle Valo <kvalo@kernel.org>
To: Thorsten Leemhuis <regressions@leemhuis.info>
Cc: Philippe Schenker <dev@pschenker.ch>, linux-wireless@vger.kernel.org,
 Felix Fietkau <nbd@nbd.name>, "David S. Miller" <davem@davemloft.net>,
 Deren Wu <deren.wu@mediatek.com>, Jakub Kicinski <kuba@kernel.org>,
 Lorenzo Bianconi <lorenzo.bianconi83@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Paolo Abeni <pabeni@redhat.com>,
 Ryder Lee <ryder.lee@mediatek.com>, Sean Wang <sean.wang@mediatek.com>,
 Shayne Chen <shayne.chen@mediatek.com>, YN Chen <YN.Chen@mediatek.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, netdev@vger.kernel.org,
 "regressions\@lists.linux.dev" <regressions@lists.linux.dev>
Subject: Re: [PATCH] Revert "mt76: mt7921: enable aspm by default"
References: <20220412090415.17541-1-dev@pschenker.ch>
 <87y20aod5d.fsf@kernel.org>
 <7aa0bbd0-5498-ba74-ad6d-6dacbade8a3d@leemhuis.info>
Date: Tue, 12 Apr 2022 13:33:52 +0300
In-Reply-To: <7aa0bbd0-5498-ba74-ad6d-6dacbade8a3d@leemhuis.info> (Thorsten
 Leemhuis's message of "Tue, 12 Apr 2022 11:55:13 +0200")
Message-ID: <87sfqioajz.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220412_033408_413602_CBE86988 
X-CRM114-Status: GOOD (  15.59  )
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

Thorsten Leemhuis <regressions@leemhuis.info> writes:

> On 12.04.22 11:37, Kalle Valo wrote:
>> Philippe Schenker <dev@pschenker.ch> writes:
>> 
>>> This reverts commit bf3747ae2e25dda6a9e6c464a717c66118c588c8.
>>>
>>> This commit introduces a regression on some systems where the kernel is
>>> crashing in different locations after a reboot was issued.
>>>
>>> This issue was bisected on a Thinkpad P14s Gen2 (AMD) with latest firmware.
>>>
>>> Link:
>>> https://lore.kernel.org/linux-wireless/5077a953487275837e81bdf1808ded00b9676f9f.camel@pschenker.ch/
>>> Signed-off-by: Philippe Schenker <dev@pschenker.ch>
>> 
>> Can I take this to wireless tree? Felix, ack?
>> 
>> I'll also add:
>> 
>> Fixes: bf3747ae2e25 ("mt76: mt7921: enable aspm by default")
>
> Sorry, stupid questions from the regression tracker: wouldn't this cause
> a regression for users of kernel versions post-bf3747ae2e25, as the
> power consumption is likely to increase for them? Without having dug
> into the backstory much: would disabling ASPM for this particular
> machine using a quirk be the better approach? Or are we assuming a lot
> of machines are affected?

Kernel crashing is far more serious than increased power consumption. If
there's a better fix available in the next day or two of course that can
be considered. But if there's no such fix available, we have to revert
the commit.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
