Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5BF2C2BBCA
	for <linux-mediatek@archiver.kernel.org>; Tue, 25 Jun 2024 23:42:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SCCMFYSQNgZ18UkQoCOBhpHK8o3bt6yWeNViChXa6sA=; b=hmnZpmsz9JX/bY4CEnGvoPJ3C2
	VMDBzmhJ2hCP8ZKM7g/I2HMAmOAuHcYsWYSCgv2z7PMnUgoBKfuwRsflgHeicq+BjarllN5HIbZBG
	xlwXBu+lp1EvTBmFtWKnHDxEESUBnimbcDUIaX8/vbx02a4FAZmRZz5kddjUs9HNahBFUbo7T6zqB
	aERoN5mgOxpnwAHDf/lErU9U/E5p/anuqIOJWnALb/NZgJXMJnXu7D1utwnlCx+Lj73pbH2nD23Hw
	e+cGd5TkDvf84a5NDgzqarle/O4LyOjNnA2qcmiQByPpbAwhqxtTeFY/ADEeHK5FsniZkGP9peuD0
	dhWGJOeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMFng-00000004olQ-1Xt4;
	Tue, 25 Jun 2024 23:42:12 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMFnY-00000004ok6-0vzH;
	Tue, 25 Jun 2024 23:42:05 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-421cd1e5f93so45728055e9.0;
        Tue, 25 Jun 2024 16:42:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719358922; x=1719963722; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SCCMFYSQNgZ18UkQoCOBhpHK8o3bt6yWeNViChXa6sA=;
        b=IYtnQ9hBM9kXEsHXjNY1AFHJP8a2hgK9Pnk1/ZlDxRn797hGKDUX5besGlyhS5Zuj4
         6hAI9UMy+BWpDTg2df71Mp+t1KyjqdM5BScqLcsB8xhg4ybX+Lyn1JEgtyyEy+272bjb
         ur+DGBf0lZnmnSRmj8JIYTqingBc197S0fmJBPn0UbfwsZx/FwZHXmUL/BemphLorez9
         miiS/jzVTnzrojf++RAEKxigEnDcg67i1bPM5zIN8TpSgE4THMjN5zrBGuLHTsf4Hs3n
         6N9RF5/6nERagGP4tnZdAiN54v7X/8I4e3hNzALah3nF8pF5BYaPjvW863Khjbf00abX
         KnZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719358922; x=1719963722;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SCCMFYSQNgZ18UkQoCOBhpHK8o3bt6yWeNViChXa6sA=;
        b=OUmp5xO9e2mTRzaVP9gQpKz7T67ngsxfP8Ua+mHl15vUdOM+YDyA3n8izpgscLl9ry
         6Z/E3TZNoFHBsTrVH417pqK4wF15q6Amzn0Ebs/uNvC4knSFAYm8/ra+Rc+J5+e4BZ5J
         b0YK2U0YAdqrrW5egN3Us2lyqfgSQ6y9eHo3iz3q9dGmCdO86cjquez8YiV73ld1ZfyT
         rNYUZ81JWp3ZShVl/4l7xucwliE4wEyYCj6BtNgjYxdeEtz3NymkfAckGPBhnpcDUI9m
         TEUgC7wpuBXftz9H2QD8xXNDHtz+yclfffIVhV0WtgTmdm53CSvmvdRFaSmaBLwBKkKC
         UvFA==
X-Forwarded-Encrypted: i=1; AJvYcCU3cKZ7t9ofQ43bNHs0gemT8G/rk6HmsyBVu2C5nSFD00H/apSo3ok0rS8RdkeWB3YTn3Y6tyaXDqgDS2aVQZZPTX0aUPhzjRqF3wx9ktoq+40WDU45ZBAPoSD1cSi+1rcUG/oZwESkRSjxFQg+rhVFYqu/yqIbdiU=
X-Gm-Message-State: AOJu0Yz98f/kIG8k0Okp6nLQlZl9p1+ixK58xYZDBXZGxqo0+6/iIfDv
	IQndOjssONEowK+zIZfKFi4T/xH1013AuZGGEK7FnSilykp5odtIdLJhhjmtlpoK92Yt6ipm4dJ
	lY1w3o7UyI57TF2Iq8Uw6EqYix2I=
X-Google-Smtp-Source: AGHT+IE3EMkRjWDPahiQUVEnMfPYjKfFupBJJz3JwYcaapJhrwS/kUVg5K7p2y66TrHsyQsVkFKiplf6CPeEYEuSSCk=
X-Received: by 2002:adf:f003:0:b0:360:9bf5:1eab with SMTP id
 ffacd0b85a97d-366e94cbbf9mr6065181f8f.36.1719358921815; Tue, 25 Jun 2024
 16:42:01 -0700 (PDT)
MIME-Version: 1.0
References: <20240625135216.47007-1-linyunsheng@huawei.com> <20240625162700.56587db3@kernel.org>
In-Reply-To: <20240625162700.56587db3@kernel.org>
From: Alexander Duyck <alexander.duyck@gmail.com>
Date: Tue, 25 Jun 2024 16:41:25 -0700
Message-ID: <CAKgT0Ud1g+KF4JA51n-wnxFNLW5nNkAx4s=Wm+kd+2og7Nx4MA@mail.gmail.com>
Subject: Re: [PATCH net-next v9 00/13] First try to replace page_frag with page_frag_cache
To: Jakub Kicinski <kuba@kernel.org>
Cc: Yunsheng Lin <linyunsheng@huawei.com>, davem@davemloft.net, pabeni@redhat.com, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Jesper Dangaard Brouer <hawk@kernel.org>, John Fastabend <john.fastabend@gmail.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, bpf@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240625_164204_363985_8E5CC847 
X-CRM114-Status: GOOD (  13.03  )
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

On Tue, Jun 25, 2024 at 4:27=E2=80=AFPM Jakub Kicinski <kuba@kernel.org> wr=
ote:
>
> On Tue, 25 Jun 2024 21:52:03 +0800 Yunsheng Lin wrote:
> > V9:
> >    1. Add check for test_alloc_len and change perm of module_param()
> >       to 0 as Wang Wei' comment.
> >    2. Rebased on latest net-next.
>
> Please do not post a new version until you get feedback from Alex
> on the previous one. This series consumes all our CI resources,
> we can't get important patches tested :|

Sorry, I didn't realize this patch set was waiting on feedback from
me. I will try to get to it as time permits. Maybe a day or two as I
have been swamped this week with various fbnic related items.

Thanks,

- Alex

