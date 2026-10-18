Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81339CCF2C7
	for <linux-mediatek@archiver.kernel.org>; Sun, 18 Oct 2026 02:38:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uuVxX/jLPtohDOq387cSqeqHjD2U6i5S+xDw1QtsGiQ=; b=CnVOJiyP9btySiZ6dwtVAX77R/
	cVniqK7/qVcxmzxmFavf81+/nogzfQHTNlVqbJzjqH0nBrSA8sk62tLZ2tIVlucvohPbanqeigKEG
	v96mG0QNJa7EQ/U+/T6qq7MIjRW0DH04zA0ef8xJaC98MTHL6dY/T3NsRSaMZuxBwHN7YO3su4Z46
	AWL05+f3pWVBQMBr6AIaV0UvfX0wwHFNKtgQPyLJcwYE4rwOM5nSzpNZYOg1EZx1lXhB2UohgYKJP
	sYSfG918sKG228ssx9JpNP2+Pz1O36znYvNuRosB10mUgxtxyxCS1p6EPwT078UHLwHAS5K2CUlML
	pAUoLw8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIGmy-00000005SVH-1NZK;
	Sun, 18 Oct 2026 02:38:20 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIGmv-00000005STl-1vvM
	for linux-mediatek@lists.infradead.org;
	Sun, 18 Oct 2026 02:38:18 +0000
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-6b1cc392d8bso1134787a12.1
        for <linux-mediatek@lists.infradead.org>; Sat, 17 Oct 2026 19:38:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1792291094; x=1792895894; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uuVxX/jLPtohDOq387cSqeqHjD2U6i5S+xDw1QtsGiQ=;
        b=yd4el5cCeHaqT5ZMYS7j4sjS7UxwEh/Mc2ZQSfvTLmrdPurtRpIXoB0+EDGWd/tI4k
         z5z3PfP04Tb48xgDTV4u6IqLxSJjuP+xzGKMWwZNKYu7XqRkAiRZjdkW2N1haWzvnsSu
         A0jOf11yr55pEuok1Ig/GbOaBjbu5kKn/9gIj4AxH6xRgeqxGpWas2bKrbgxXW6gtlyE
         RvtDtQPMRAb6TKBAEIIJLIqddQBLKZ+wcZojTDTugrS0dcpv+qFs+iUKdLisgbG5Rxkn
         x/uc7Dn4SqoAqM9xFkOVIwib8QWCJWzEt4qGL5+SyFDmjw5ZeDWFikOYpW/ioXPqXTDL
         m5Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792291094; x=1792895894;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uuVxX/jLPtohDOq387cSqeqHjD2U6i5S+xDw1QtsGiQ=;
        b=EoGU51+r+XORhO5W4tE49WxBgck7yrB/Fi8gX1t6StV5MxBPa1tIWrpwU7usI93RSu
         4n0d5QHQwEIbEvW7AC/soOGknDj1hdcZ23V/8HqSUjxtcxrKPtr5s32/BMFU0qGYB6zT
         d8iO/VrAH3o14wyqHn6It62SmE+z2mrteO+B5gUI9P7F5+O64VyWtnyK2e8o7vW31kI+
         cS3CuaS1Lq8Uodtx+arVU1DqHReCHf/ljYXO60oa1yU7+OpkQAvfd1USaIeGoG+Eh5dN
         j8g06DuiAKa41uWOXuGT9epumX5k/DHCZxB/RTlJx3bJRW8rsAfWZXH0dRPThUj6ulDl
         MaFQ==
X-Forwarded-Encrypted: i=1; AKwUvBw2YBEOe6lvlyisXsIHJZ7KWGM2AnAWCOuo4rubW8F7LEmJTx7pg+Gd7RdjwOwD8Xqwak6BWHgcXT2uB2wS+g==@lists.infradead.org
X-Gm-Message-State: AFq9FYJ9q6sIpGQFo+PNWyyqLtEEdargz0bGkk3DMM9kODBrMG/q6qb2
	SM5Y68H/7f/yg+310bsxFipYY/MxKzdfohEWL//cOQewy7tXaWxPD07RTa48vhWf2Q==
X-Gm-Gg: AYBFou08QYSRawpb6yiJe5pQQtrJgyohU72+eRIheKwVQbZ3GkDNrsTmC3QTpKhfck6
	V5Wg9KF8RuQkbhFvfEoiiQhdVwGVm/V8rqB4nHJN7cKw07DEYmAL5zJgzZwBNNVswPztb6Uy1Iw
	aMbFfeuZ5o0gKmTCFHwIIy9tFJnomMpQ5WSaHb9vCwQWuDlQGNtdsDU0Z1JBPVIUmjCLLp10DKA
	AET7Z1O96FuKpZ9HCBZG58vPPwuM1kcC+lV4xvl1B9Iw312bkUGM28+dIbFErC8fRcXwO7bzNtp
	yWcdbW24avlKCucpO5L8GDhZIUdw3zrbAP7PuBgY1rv8QWwfmf5sRcmIOMmDzUo2Al836dCewAT
	ueMxL657KohN/u0IcTR/1Lel10Na73Oj87jOnkAwvImnW6NBmjzsa9M/wYACII1y34yGIXgg3Jn
	Y6H5aUf1Y6IONXvewB75h1lHlso6u8Ws6+KnuCU4GoGfrjNm5Arg4ezuCxQt0IPf6rgBdjDBTnz
	zuRG7pYK12GlSpLF59Z0j6Vn9BVf03V/AyQ2Ns1/wmr53uzPOXURzzxwha5G4BuouXnOiEqY2K4
	CgOYfY6Uuw22nissytAEAOHJIPqPo2UFy8eVgnUJF7C1pQ218+SQ2JzMbK3HyH5VMANyD4GgFsk
	tdJPCB4+lH6JsR48K4QmrAn6TKGUizByqbik74VQiS4zES3yOz9ROH4w+SE2kCFhLQzOZpTA5tS
	AEopXsqRKy40vFzBBd9es=
X-Received: by 2002:a05:6402:2489:b0:6a9:850d:bb38 with SMTP id 4fb4d7f45d1cf-6b3a81766camr2392870a12.10.1792291094015;
        Sat, 17 Oct 2026 19:38:14 -0700 (PDT)
Received: from Desktop.fritz.box ([185.181.130.213])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b38a1c80desm2356771a12.20.2026.10.17.19.38.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 19:38:12 -0700 (PDT)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: pablo@netfilter.org
Cc: fw@strlen.de,
	phil@nwl.cc,
	netfilter-devel@vger.kernel.org,
	coreteam@netfilter.org,
	netdev@vger.kernel.org,
	lorenzo@kernel.org,
	nbd@nbd.name,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	corbet@lwn.net,
	rdunlap@infradead.org,
	skhan@linuxfoundation.org,
	linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	saeedm@nvidia.com,
	leon@kernel.org,
	tariqt@nvidia.com,
	mbloch@nvidia.com,
	linux-rdma@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH nf-next v3 0/3] netfilter: flowtable: carry a priority into the offload
Date: Sun, 18 Oct 2026 04:38:04 +0200
Message-ID: <20261018023804.562323-1-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <atQk1d8Tv03iPN7d@chamomile>
References: <atQk1d8Tv03iPN7d@chamomile>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261017_193817_714764_E6251816 
X-CRM114-Status: UNSURE (   7.37  )
X-CRM114-Notice: Please train this message.
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

On Sun, Oct 18, 2026 at 03:45:57AM +0200, Pablo Neira Ayuso wrote:
> I don't understand the "one flowtable per class".

If the priority is a flowtable attribute, every flow in that flowtable
gets the same one. To give sip 1:3 and https 1:5, you need two
flowtables with the same devices. nf_tables rejects a device in two
flowtables of one table (nft_register_flowtable_net_hooks() returns
-EEXIST), so you also need two tables.

With the per-flow priority it is one flowtable and the rules that set
the priority today:

  udp dport 5060 meta priority set 1:3 flow add @ft
  tcp dport 443 meta priority set 1:5 flow add @ft

v4 waits until the fdb series is done.

Julius

