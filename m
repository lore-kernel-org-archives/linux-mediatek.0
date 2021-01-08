Return-Path: <SRS0=tvhu=GL=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24E0DC433E0
	for <linux-mediatek@archiver.kernel.org>; Fri,  8 Jan 2021 20:03:23 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7F9CF23AAC
	for <linux-mediatek@archiver.kernel.org>; Fri,  8 Jan 2021 20:03:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7F9CF23AAC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sipsolutions.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=d9txSmUzSneIgTYcIW1FFR1pWl1Ef86UuuJvwXWglJo=; b=XrIIHTg3LqOMyC4MgtJRSdL14
	g5mbACku3GRHXZlEuzjgvCAkWAdwuTRm0We8MdY6ACSj2w5tGKtIrlLR5WsSGDbJcHY2YZ2LJK+QM
	So8D6n5R5r1+vT877roUU4N5d8Pnq9HC3ORzXkqi22JL+klwnceGxAk6Av4EmqyCDheees4iKjS+k
	HDjjaVaYrnqhEK0cium8vVaXKPqtHCupEz4y+/uLOmXaIbHxmbGMo7xNLXhGqmA11u0viXJ4DIVNa
	KZJ+jrxwDaUIKBpfLQaUNTolfaA9gYM+xSfoHF5Ljrv/njlW24TWvCLQ1tvEzUcxF591ZBmNChqCp
	hN6O9Gwyw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kxxyW-0000av-8J; Fri, 08 Jan 2021 20:03:08 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:191:4433::2]
 helo=sipsolutions.net)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kxxyU-0000aX-Aw
 for linux-mediatek@lists.infradead.org; Fri, 08 Jan 2021 20:03:07 +0000
Received: by sipsolutions.net with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
 (Exim 4.94) (envelope-from <johannes@sipsolutions.net>)
 id 1kxxxf-003h79-VK; Fri, 08 Jan 2021 21:02:54 +0100
Message-ID: <0efec65815ff9e26b3da69cb35d503a90086760c.camel@sipsolutions.net>
Subject: Re: [PATCH] mac80211: fix incorrect strlen of .write in debugfs
From: Johannes Berg <johannes@sipsolutions.net>
To: Shayne Chen <shayne.chen@mediatek.com>, linux-wireless
 <linux-wireless@vger.kernel.org>
Date: Fri, 08 Jan 2021 21:02:53 +0100
In-Reply-To: <20210108105643.10834-1-shayne.chen@mediatek.com>
References: <20210108105643.10834-1-shayne.chen@mediatek.com>
User-Agent: Evolution 3.36.5 (3.36.5-2.fc32) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210108_150306_440700_00CBE0E7 
X-CRM114-Status: GOOD (  12.77  )
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
Cc: Toke =?ISO-8859-1?Q?H=F8iland-J=F8rgensen?= <toke@toke.dk>,
 Ryder Lee <ryder.lee@mediatek.com>,
 linux-mediatek <linux-mediatek@lists.infradead.org>,
 Sujuan Chen <sujuan.chen@mediatek.com>,
 Lorenzo Bianconi <lorenzo.bianconi@redhat.com>, Felix Fietkau <nbd@nbd.name>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

This looks wrong to me, am I missing something?

> diff --git a/net/mac80211/debugfs.c b/net/mac80211/debugfs.c
> index 9135b6f..9991a6a 100644
> --- a/net/mac80211/debugfs.c
> +++ b/net/mac80211/debugfs.c
> @@ -120,7 +120,6 @@ static ssize_t aqm_write(struct file *file,
>  {
>  	struct ieee80211_local *local = file->private_data;
>  	char buf[100];
> -	size_t len;
>  
>  	if (count > sizeof(buf))
>  		return -EINVAL;

This ensures that count <= sizeof(buf)

> @@ -128,10 +127,10 @@ static ssize_t aqm_write(struct file *file,
>  	if (copy_from_user(buf, user_buf, count))
>  		return -EFAULT;

We copy, that's fine.
 
> -	buf[sizeof(buf) - 1] = '\0';
> -	len = strlen(buf);
> -	if (len > 0 && buf[len-1] == '\n')
> -		buf[len-1] = 0;
> +	if (count && buf[count - 1] == '\n')
> +		buf[count - 1] = '\0';

This I think really was meant as strlen, because if you write something
like

 10\n\0\0\0\0

before it would have parsed it as 10 still, now it gets confused?

I guess I'm not worried about that though.

> +	buf[count] = '\0';

But if count == sizeof(buf) then this is an out-of-bounds write.

Same for all the other copied instances.

johannes


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
