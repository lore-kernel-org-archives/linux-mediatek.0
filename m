Return-Path: <SRS0=sOPI=HH=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_ALL,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B893C433E0
	for <linux-mediatek@archiver.kernel.org>; Fri,  5 Feb 2021 13:30:01 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C375564FBC
	for <linux-mediatek@archiver.kernel.org>; Fri,  5 Feb 2021 13:29:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C375564FBC
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=toke.dk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References:In-Reply-To:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=BwYcIqJrkrRstydVP+WBZsY+ekGkShKqxeQCeyHTWl0=; b=29vHG4D+LnxCeYUWozzAJTz2y
	QPOClvlJ8zY0MLRBCz16CJdrZxjY0vJFVoB91CEhrpbcZ1LT9faqhSBZFuYlHJU0/1btMmkAZaCJr
	PYsg/MovUGLjw5STA8bl/YSwPCHrhDGQ4icy8uxc1nIvBqp8ltbY2HxCclF64D0LYR+Dl8Fze4D/l
	p32drY66Gws1eQIyqhMq6COjipm5XYSJARGDIXu2EwRRxwlgkR0PcipGwX6oEh6QtISklDKjZbqBq
	KGsq66GS9FOuh4fSSQD/cfoMjL7RBzIV27xXUU3qG5F0mBvChyG7kIHQAsSLEcg4uUSTdXdSeZpiI
	dIRFHc4dQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l81BG-0008QZ-S4; Fri, 05 Feb 2021 13:29:50 +0000
Received: from mail.toke.dk ([45.145.95.4])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l81BD-0008PL-KI
 for linux-mediatek@lists.infradead.org; Fri, 05 Feb 2021 13:29:49 +0000
From: Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=toke.dk; s=20161023;
 t=1612531761; bh=dmsbQlJ0XheT/EofpoyzXPiARJ/fSUNhNxNGar8huVs=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=Oaiu280JaBF6yYQgA0lDT/mkVsk7l59DQGSfIV2yss0+9ccBduhvodiSKWTEI764f
 h2hyss/+dpbNwM9scbmxpAq+HrHEcvQMszRynTXCONz7JUx57eOMGTB7hRe6fVFJND
 WKB8dT51ZlcyP1HXCx7S3WqxZRx/6tiGtDUX9dEIXSuvM3E+43418KJQ4S6SGEe2in
 G6UTxKTfIj6LszNqmikdE31QXNzWf7pb2cFrAsao7iRMQU8xZ783RVErRCU8s8QlF7
 +t4hx0LNu+7/CLlivdmLe65U/wjc/6dXUODpDFpG/c+WSkeqbvLx0kEp99X3+TnWIP
 CDhgAHjRbQ5rQ==
To: Ryder Lee <ryder.lee@mediatek.com>
Subject: Re: [PATCH] mac80211: only schedule TXQ when reasonable airtime
 reporting
In-Reply-To: <c48c3555ab2261d6b6674ac7de8203359b80b127.1612529311.git.ryder.lee@mediatek.com>
References: <c48c3555ab2261d6b6674ac7de8203359b80b127.1612529311.git.ryder.lee@mediatek.com>
Date: Fri, 05 Feb 2021 14:29:19 +0100
X-Clacks-Overhead: GNU Terry Pratchett
Message-ID: <878s82ve1c.fsf@toke.dk>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210205_082948_693606_502FA0E4 
X-CRM114-Status: GOOD (  13.78  )
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
Cc: Ryder Lee <ryder.lee@mediatek.com>, linux-wireless@vger.kernel.org,
 linux-mediatek@lists.infradead.org,
 Lorenzo Bianconi <lorenzo.bianconi@redhat.com>, Felix Fietkau <nbd@nbd.name>,
 Shayne Chen <shayne.chen@mediatek.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Ryder Lee <ryder.lee@mediatek.com> writes:

> For some drivers and hardware may report faulty airtime, which ends up
> with excessive hold time (~0.9s on mt7915 multiclent tests) impacting
> system performance.
>
> Although issue has been fixed in driver, but it make sense to select txqi
> depends on a reasonable airtime reporting to prevent such a case from
> happening again.

I think I see what you're trying to do with the patch, but this commit
message makes no sense. What, exactly, was the error you were seeing
that this is supposed to fix?

> Tested-by: Jiao Bo <jiao.bao@mediatek.com>
> Tested-by: Sujuan Chen <sujuan.chen@mediatek.com>
> Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
> ---
>  net/mac80211/tx.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/net/mac80211/tx.c b/net/mac80211/tx.c
> index 6422da6690f7..0b8a8c3600f4 100644
> --- a/net/mac80211/tx.c
> +++ b/net/mac80211/tx.c
> @@ -3770,6 +3770,10 @@ struct ieee80211_txq *ieee80211_next_txq(struct ieee80211_hw *hw, u8 ac)
>  				sta->airtime_weight;
>  
>  		if (deficit < 0 || !aql_check) {
> +			if (txqi->schedule_round == local->schedule_round[ac])
> +				goto out;
> +
> +			txqi->schedule_round = local->schedule_round[ac];

I think this change may be worth making anyway, but for a different
reason: Without it, a station that fails aql_check will keep getting
recycled through the list, advancing its deficit. Which could actually
be the reason AQL breaks airtime fairness; did you observe any
difference in fairness with this change?

-Toke

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
