Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F584C43458
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Jul 2026 01:24:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Mime-Version:Subject:References:In-Reply-To:Message-ID:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l7eHw/raYhzCKyoQvZO5b5gtYbr1anwl7xluE4HEstQ=; b=mCYo+Nu3PGEt8RYWfGMymku1Pr
	rOazxLidlRGwzS42GHkDGVNM/oftPJMo083FbesYBzObq08etIN8xxy2ifGT2z3MEe/zsJULeV51q
	wfx7gNxn4IqcbiAriBRRxobLxKxrPJc7KEJZbLUGppJDzbcJ6PEHn/HK7q/qDfdR8hALaCBBP4uRc
	DL2t3EzB5aWXA/kTtLmPat8EOaci1ZBVgwMonB4++dQycUCGMCTAu/zTV0jPWx7zefE36jgUlvcBI
	G5l9kQ8Gr5Xc01KruiTDd99aN7qpqQ65jg+0kx6HeUkQXcVnF67GPg4rPRPw2ObsDizActpL12syr
	LZarAifA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whdVK-00000000kSD-2UQK;
	Thu, 09 Jul 2026 01:24:42 +0000
Received: from mail-yw1-x112a.google.com ([2607:f8b0:4864:20::112a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whdVH-00000000kR4-0CMW
	for linux-mediatek@lists.infradead.org;
	Thu, 09 Jul 2026 01:24:40 +0000
Received: by mail-yw1-x112a.google.com with SMTP id 00721157ae682-81dfdbd86d1so12401437b3.1
        for <linux-mediatek@lists.infradead.org>; Wed, 08 Jul 2026 18:24:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783560277; x=1784165077; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:subject
         :references:in-reply-to:message-id:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=l7eHw/raYhzCKyoQvZO5b5gtYbr1anwl7xluE4HEstQ=;
        b=nzLGAHa1KLDPhOQDJVH+ZXJdz9FXDnwVfVRsIWWvxuwatizRxqPB9ukal2efniRSya
         dI7tdEZ6xKhwiwlBOK83PgdWAITY8PmzuDhE0F7r4VIEy0PDziZ087cjIuOWsQxVqp1O
         7FQEKZpTheFiolPfgiF0ZM4l0FXT+9NHbRvdW5e6E+Ou+43FsZeQy/4e0KVyFfmfV6Hh
         LowrQdu0GpNmu9j9bQFmx1hpDUo6R/ikf9RgYAjbaslO+fLE7JpfmIcrL+8Hq9JGpjiz
         A9PLlhQrOcMRNBV1NEAG7YUboSJYILFMrKNppdvItEDpYK15mF0s+xD96A7BwFT28jEC
         uKtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783560277; x=1784165077;
        h=content-transfer-encoding:content-type:mime-version:subject
         :references:in-reply-to:message-id:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=l7eHw/raYhzCKyoQvZO5b5gtYbr1anwl7xluE4HEstQ=;
        b=e5ANIRuC2VToGQZIQyw5SX6ZLw4sDW7lqqZ88v/CpwXS05IBO2Uow2yV8Bj+gbCdrz
         Q60PMzRyTSSsyNMb4lwtX15Nwm2+XfB7e8r42smJHHNA8OX7yObw5P/1s8mF2v+QohW5
         i8v6z0WXKCwuWCgNh+FwCrAFuAZ1dRWI83q9ZyGncMSusWbFgmqE+I+ByyfuI+jFBCeN
         x1v4m8oWjYiCyIx0TDqRaPvTyi8XjE0H92zREKkEUo/P0u0IXxkQRyx061dXyCQH9W2y
         1Hr9ctD4dNF2KnNaw/qCEFbecbBeN6gYFr7gcVHR0W7BpDtKiFvD1zqieQ06+XDp4dK8
         cmlA==
X-Forwarded-Encrypted: i=1; AHgh+RqKYdnwNhlE13qsHc6vJGjBrOi5RYekEIyEuAeh5LKNdM2Tt4AXZc4zDGR5PRWtgUpC1hGRkxrLz5hZoQ3bQA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwrRxuDP4m4zJ+igTXIiKEbDYe67+q0AJeQiXT2MWyPNh/oa1cO
	aXHpf8PjHgDvrw26Nh7CAAiNy+H6FbCpAu+W3RZynksiQYIDnCc6b0fA
X-Gm-Gg: AfdE7cl/zAWPXnvT82qvwb4CvfCKuKi8dMNPL7Y4bxW4ccreU86EQ+yYI/thayUIPiJ
	AtGMvfqpF1ffGGR6e75o19h7gxwqupTi8/WqmpNyTyD/9Mis18H81D20/Bdns8Ir11u8gTA4Shl
	F3z5YVXWpYt5RHBZ/CXM5spN3GJ26nxtQRv1rcFhttBYvzCyZGWnqvwlXGQm/w9WWDdGXadeXfi
	iOYhvE35b7Ttv/NvUKA+RXVLc/RwCNk+kQ1NzDteSn1HPnCMc5l6tLJ6QoifoOM+0VhBuETbm2b
	1JVjnJUyINUEl0FxRaZigznAsWjTGcUTg7fPFCFhc9VswH6SUoq44cZ5bsU1acYT6hAXU7z4kCz
	sZLBKosI7nwriT/SVl7ZA9hiYFH6LEVDboNERtoy5M3oXPiqai0yNJowRBdkWaA1SETD6XHumHK
	0D19UX/Rt/hioq9LkADlNEIY21XRj+gj/DEm0RDiUTIlb9yXeF0dN6ibSFQN6nLm5ixg==
X-Received: by 2002:a05:690c:12:b0:81d:4f4b:94be with SMTP id 00721157ae682-81dbd41c1a7mr37863157b3.32.1783560276655;
        Wed, 08 Jul 2026 18:24:36 -0700 (PDT)
Received: from gmail.com (172.235.85.34.bc.googleusercontent.com. [34.85.235.172])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-81e6be99124sm6315537b3.4.2026.07.08.18.24.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 18:24:36 -0700 (PDT)
Date: Wed, 08 Jul 2026 21:24:35 -0400
From: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
To: =?UTF-8?B?U2hpbWluZyBDaGVuZyAo5oiQ6K+X5piOKQ==?= <Shiming.Cheng@mediatek.com>, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
 "dsahern@kernel.org" <dsahern@kernel.org>, 
 "imv4bel@gmail.com" <imv4bel@gmail.com>, 
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>, 
 "alice@isovalent.com" <alice@isovalent.com>, 
 "daniel.zahka@gmail.com" <daniel.zahka@gmail.com>, 
 "eilaimemedsnaimel@gmail.com" <eilaimemedsnaimel@gmail.com>, 
 "nbd@nbd.name" <nbd@nbd.name>, 
 "horms@kernel.org" <horms@kernel.org>, 
 "kuba@kernel.org" <kuba@kernel.org>, 
 "pabeni@redhat.com" <pabeni@redhat.com>, 
 "edumazet@google.com" <edumazet@google.com>, 
 "willemdebruijn.kernel@gmail.com" <willemdebruijn.kernel@gmail.com>, 
 "willemb@google.com" <willemb@google.com>, 
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>, 
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>, 
 "davem@davemloft.net" <davem@davemloft.net>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 "sd@queasysnail.net" <sd@queasysnail.net>
Cc: "steffen.klassert@secunet.com" <steffen.klassert@secunet.com>, 
 "stable@vger.kernel.org" <stable@vger.kernel.org>, 
 =?UTF-8?B?TGVuYSBXYW5nICjnjovlqJwp?= <Lena.Wang@mediatek.com>
Message-ID: <willemdebruijn.kernel.31a5346f5d77e@gmail.com>
In-Reply-To: <2d71af40897d73dbd9e243ce5e25bbd3f99acc5d.camel@mediatek.com>
References: <20260707021425.483-1-shiming.cheng@mediatek.com>
 <willemdebruijn.kernel.39a3b0237ed2@gmail.com>
 <2d71af40897d73dbd9e243ce5e25bbd3f99acc5d.camel@mediatek.com>
Subject: Re: [PATCH v6] net: gro: fix double aggregation of flush-marked skbs
Mime-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260708_182439_093627_396C6D7B 
X-CRM114-Status: GOOD (  15.17  )
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

Shiming Cheng (=E6=88=90=E8=AF=97=E6=98=8E) wrote:
> On Tue, 2026-07-07 at 11:16 -0400, Willem de Bruijn wrote:
> > External email : Please do not click links or open attachments until
> > you have verified the sender or the content.
> > =

> > =

> > Shiming Cheng wrote:
> > > The skb_gro_receive_list() function is missing a critical safety
> > > check
> > > that exists in the skb_gro_receive() implementation. Specifically,
> > > it
> > > does not validate NAPI_GRO_CB(skb)->flush before allowing packet
> > > aggregation, as of commit 0ab03f353d36 ("net-gro: Fix GRO flush
> > > when receiving a GSO packet.").
> > =

> > It does not check .. as of commit .. ?
> > =

> > No, skb_gro_receive checkos NAP_GRO_CB(skb)->flush as of that commit.=

> > =

> =

> Is this wording okay?
> =

> Commit 0ab03f353d36 ("net-gro: Fix GRO flush when receiving a GSO
> packet.") added a flush check to skb_gro_receive(), but
> skb_gro_receive_list() lacks the same validation.
> =

> As a result, packets marked with NAPI_GRO_CB(skb)->flush may still be
> re-aggregated.

That sounds good to me, thanks. =


