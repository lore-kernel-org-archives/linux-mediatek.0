Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58352EB64DD
	for <linux-mediatek@archiver.kernel.org>; Tue,  1 Aug 2023 09:55:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nC7te9v/ksv0GvdIftjGxnATfhLnT2YwvIHvmZgXCaU=; b=YHQXiS6SP7haBLJYybECkLmgfa
	LSQU9PtQXx9tTiBFtTPmmb3sWwgPyroudWLhVU0y2IRMXV2dVnIFQHf9riTT/V2Gcw/tFJnJG1TWJ
	sEFhqdBeK9XKJ72KlX0tj/f1a3DPbn4ReBAOO349B2rAIQzTIB1RB9lFtXtrNWmQCx9VYxat+/3OH
	Ahsgq2zp84liDpfu4d4xQLnGfKjmqfJoP62ewP9Rw8I50BfKNMkLnvVWpsoZ2zDIzj+NY5PvTCRaV
	tzB47X4W0cwrqNAHsFpf0/vXJXKUkvrL10acoggRV1qDZOw3t59Ojj8SAHaI/XzeExChsqtvWZplH
	HB0AEWZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qQm6N-001gqO-0u;
	Tue, 01 Aug 2023 09:55:39 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qQm6L-001gpb-0n;
	Tue, 01 Aug 2023 09:55:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:MIME-Version:Message-ID:
	In-Reply-To:Date:References:Subject:Cc:To:From:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=nC7te9v/ksv0GvdIftjGxnATfhLnT2YwvIHvmZgXCaU=; b=Pf83KfT9mRmP4ic6oeLTD3iXlf
	+mhNTj0or2u+oLJP6Nfgt/I6A3FL5Y+nOdJnUcvq50LwXbKAvSXpLcKeoeQMTbkKU1r1plGfoYNpO
	83q8UCGnCMEkPxIFWGRLd83vaACyguEvhgaPmamyh86JGse1FdpsdsfmIR/V7FSn6vJE2tCsEFhzU
	5tQ97De4Yj877/Sr5HsldgvR+ZMDibS9gMTnlnL18ZpRRcB5MIYoRHvPbswQiLkttog4SQ7xAnksT
	+0KgaDvp8dyA1HchcdDQ5B+tcInnjK+ZywxYwBpIxfWqIE/3eSDs4/WRbWWPC/H+gc2qTnbwYJnw+
	xmCMa+cA==;
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qQlMG-00Dmig-39;
	Tue, 01 Aug 2023 09:08:03 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 13DF3614E1;
	Tue,  1 Aug 2023 09:07:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D507C433CB;
	Tue,  1 Aug 2023 09:07:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690880875;
	bh=JXpCu7p/CWKp6jZPKSaMbWukxpZFXpkVBsqC2SBekyA=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=mCPPWfmGfXdKrezEfgf+KOFfVTcNZx0K/TebxxhKsXMzcwSfJxxCb2eJvgc9jx2dh
	 dLZqYaBonuGMqrlq+8DChi8+bStP7esX3VEHg1jTRvK4807qAiMV0MLkczC5FAOrIH
	 +RvIexjcALqhHlm/05+s6E2xowislWYJ7QN+iLKCtARlf0B6ntuQWj9X/otVtMIAVB
	 oBdkXvYMcvFEwAVPdKGVm0pERWFzHLni9h45fkrUdXlBs/Wc2psG98zEEEuew0yywf
	 0En+3hmm6ydDGSWBegsOyUE69SQGYz+vE7Yk7Aj5glDuoxbkbWeG1lOR33oNkretGz
	 hXKpAN9fiN3SQ==
From: Kalle Valo <kvalo@kernel.org>
To: Kees Cook <keescook@chromium.org>
Cc: Felix Fietkau <nbd@nbd.name>,  Lorenzo Bianconi <lorenzo@kernel.org>,
  Ryder Lee <ryder.lee@mediatek.com>,  Azeem Shaikh
 <azeemshaikh38@gmail.com>,  linux-hardening@vger.kernel.org,  Shayne Chen
 <shayne.chen@mediatek.com>,  Sean Wang <sean.wang@mediatek.com>,
  linux-wireless@vger.kernel.org,  linux-kernel@vger.kernel.org,  Matthias
 Brugger <matthias.bgg@gmail.com>,  AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>,
  linux-arm-kernel@lists.infradead.org,  linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] wifi: mt76: Replace strlcpy with strscpy
References: <20230703181256.3712079-1-azeemshaikh38@gmail.com>
	<169047317159.2400214.7882697833368890001.b4-ty@chromium.org>
	<87tttpz6ne.fsf@kernel.org> <202307270959.900E3A345E@keescook>
Date: Tue, 01 Aug 2023 12:07:50 +0300
In-Reply-To: <202307270959.900E3A345E@keescook> (Kees Cook's message of "Thu,
	27 Jul 2023 10:01:37 -0700")
Message-ID: <87zg3bxh95.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230801_100801_228653_1BBAD7B9 
X-CRM114-Status: GOOD (  18.56  )
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

Kees Cook <keescook@chromium.org> writes:

> On Thu, Jul 27, 2023 at 07:00:21PM +0300, Kalle Valo wrote:
>> Kees Cook <keescook@chromium.org> writes:
>> 
>> > On Mon, 03 Jul 2023 18:12:56 +0000, Azeem Shaikh wrote:
>> >> strlcpy() reads the entire source buffer first.
>> >> This read may exceed the destination size limit.
>> >> This is both inefficient and can lead to linear read
>> >> overflows if a source string is not NUL-terminated [1].
>> >> In an effort to remove strlcpy() completely [2], replace
>> >> strlcpy() here with strscpy().
>> >> 
>> >> [...]
>> >
>> > Applied, thanks!
>> >
>> > [1/1] wifi: mt76: Replace strlcpy with strscpy
>> >       https://git.kernel.org/kees/c/535c78cbc0c4
>> 
>> Why did you take this? mt76 is in active development so risk of
>> conflicts is high.
>
> There didn't seem to be any further activity for 3 weeks, and it was a
> relatively mechanical change.

That's because the wireless trees were on a summer break:

https://lore.kernel.org/all/87y1kncuh4.fsf@kernel.org/

> I can drop it from my tree.

Yes, please drop this. And in the future don't take any wireless patches
unless acked by Johannes or me, I want to minimize the risk of conflicts
between the trees. If a patch is missed for whatever reason please let
me know, do not take it to your tree.

> What's needed for it to be picked up through wireless?

I don't know why Felix didn't take this patch but now I assigned it to
me on patchwork:

https://patchwork.kernel.org/project/linux-wireless/patch/20230703181256.3712079-1-azeemshaikh38@gmail.com/

It should be in wireless-next this week.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

