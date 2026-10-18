Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C1E7CCF2C7
	for <linux-mediatek@archiver.kernel.org>; Sun, 18 Oct 2026 02:11:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=quR7zaG5HvFKkoAcyflM6P6NFsJA2yI0PSyMysQvzs4=; b=iDfYPsFD2//kV4YDZa77cMZvPv
	YdO6Z2011p0S8FicPdkKunef4hXd+iHo1sbjSHExJiutdchlcnvHxPJeOeW9mmVGyL0Ohpv04fVIa
	RpNY1SfkVhqLwY/mV2CV7Z9so9LkUjkj+Nsf83YzM1c2S3JaffkGUGDLQu8IHqIuUJjVge5NEcsWT
	Stl8qLyRzhynkz6iYU1GumbfsLYosNxog8j7V4EpPHwfJIDhmY0R9kc1M4q6+plLoB3PRKTySK+yg
	2wDEGDnsFD63fUGwanPDhuB51cnibTUzk3mHkra5ri91qst2mx2gG8bmSuAgUGsThd5UrHv/YJ9dA
	IkmUgkzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIGNP-00000005RFu-08CJ;
	Sun, 18 Oct 2026 02:11:55 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIGNM-00000005REx-0KTL
	for linux-mediatek@lists.infradead.org;
	Sun, 18 Oct 2026 02:11:53 +0000
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-6acb57c2b88so1204678a12.2
        for <linux-mediatek@lists.infradead.org>; Sat, 17 Oct 2026 19:11:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1792289510; x=1792894310; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=quR7zaG5HvFKkoAcyflM6P6NFsJA2yI0PSyMysQvzs4=;
        b=cTQ3kdCI8ts/g5K2fg2b5lkMvE1ImecnwWm4lHnf/MQZdoUVbNWA5jY4b0prf1MHc3
         vPWcA8T2C1C2wzu9YDOG2qnrG0R2gyyxlGGVA6Gpm6mQkjXm7AerpHJgPMW+yGgDGYIV
         U4Livw9/Wl9zl6R/hk5dsIMD5zG6tXPUAGVyEU8MI1GIAUrv1QjNqeziWiwhC69xGOXx
         36irSAMyVT6FFpfr4BWRYRIxdPH6gqoT6hQpVS+hzi00rl8EHZv0rKXztSk/l3h5Z1cJ
         4kFuDjBU8fqfnqdAUOFHpsuFlzGpb9m9Te+qEQOUjssgPBCXMN63FN2KNp0WTl6PwTO6
         VA8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792289510; x=1792894310;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=quR7zaG5HvFKkoAcyflM6P6NFsJA2yI0PSyMysQvzs4=;
        b=0EISvKthEjIGhMGctP13YUPh2stGDR9JbopSsef1eMxRnVOMrg/HuYACTy3hfk3Dse
         vPwmzEwpIlgQqmbpcosfpE23oiuHkjnIlVm7tqoPmjhYk/Z7e1WnWROCH28mWdSs0MVo
         E3X5+Xp5EGVhlNAGkQcL7ZwItOFWidtHoh4smCoSxhtm4CaEb2XoehuZ1tw0A1qiOAYW
         K1KaXVUyJNY/IHwHYU5DmpaIrmBogP7fOPbneRy2r9l4SKWaseMUu9KOVwQYVm+Fotx6
         fToQE4t3FgOpXxAHAu5g6q5mtaF2n+IbUy8/zJNvwLWeDe+RU0NKv1hu+Ow0MdB5+O8j
         Xdfw==
X-Forwarded-Encrypted: i=1; AKwUvBzvR6Op7DphnmIQDmw4gEVuJ0Yfc8RK0Vgv7ppeKd35E9mBdGcwPposAiM0EDhNBdCSeJpE9ImOwVVmAwNlxQ==@lists.infradead.org
X-Gm-Message-State: AFq9FYJ0Ko01NHPzpWIVZ0pzt/FrTH8ZPuvf11mY+8ySb7dOD8IZOhvo
	5P06x9AzcXo1NKlnrP7An6Xx/nInm9qAG5cg6xzz5+JXD6DqeWJfvXpGoTiM368VWQ==
X-Gm-Gg: AYBFou2EPRxOG6hR8b37y3r7VG1TL7TllIlNwOIiMwWddz0CtPNn2UuLWVpNlEdHmzT
	AhVQTy8tgeo5YYCCc7tRypeW9EJrIhXPhQoPsufXeESRfSkgFWDGxDMbCwj9ZlPBbecGICQb0nL
	RFD7O2C1oeeT+4Y0xfl5QhparbmVo5nQx8k8uXZcefHo1xlkaMWF0j81MLsTbzVfqB8W5y6wXvw
	/4Zrdu5Q96FLyeK2xfbA8KO5pxXkVPIeNK2fzh5SkIIULB1HqKvh57X1vmoNmG4Dn43ApZFXP0R
	dfZ8PM4lm+iKF+V/iQIhyrqkcngDPdErSRvH2wwvzL9s3uzJbxynWUfW7w3rfH0HGf66GGntUnX
	414CSyGMWMYskL0yxjzBFswu78Zn58/JKWUCFI3BhU53AyB3u7g8MPUSbKkFA+RFnHjoXGX9DEJ
	2WU6RECF9+8eKgsrJWnx05l1SbB324y9MsItEglz8P4qL8QD/aS4+i3jS1jdphPRus+o/g1lXKO
	ifDypIwk+KHmcl0a61ocz2beut7WTqXFEYv1pspRiA4oJeo1phGu0SLkeK7o2YoeLdGBSw5w4R5
	70XUNaHyBZ91afW9OF9xKrhpxiO7oYaAXZUq30r78NEDcco/U866sUG5eHtTN8UPZhjTlugeKXj
	7i8WBd872d4E4cyYKTrKAqPjX2S30f+nDMQM0xg+EkuT/utQkOP3wF1qTS4geg2uJTM3BR5OVVW
	ANnKSJluOdkv/RoM6O8eZuIQHf/hb2oKyD3l2zA6WnR3PuWZ8ImE5ZaUCXLD0SZPnTZ+ennxGfl
	YVTCOYU
X-Received: by 2002:a17:907:c48b:b0:c35:d50a:1356 with SMTP id a640c23a62f3a-c41a08dc5fcmr283934966b.42.1792289509761;
        Sat, 17 Oct 2026 19:11:49 -0700 (PDT)
Received: from Desktop.fritz.box (p200300f247424f103187cc9af620d661.dip0.t-ipconnect.de. [2003:f2:4742:4f10:3187:cc9a:f620:d661])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4091eb1835sm224698366b.79.2026.10.17.19.11.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 19:11:48 -0700 (PDT)
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
Subject: Re: [PATCH nf-next v3 2/3] netfilter: flowtable: carry a priority into the offload
Date: Sun, 18 Oct 2026 04:11:45 +0200
Message-ID: <20261018021145.3769432-1-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <atQkUoH3aa-J5-vf@chamomile>
References: <atQkUoH3aa-J5-vf@chamomile>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261017_191152_128836_46A25DEA 
X-CRM114-Status: UNSURE (   7.10  )
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

On Sun, Oct 18, 2026 at 03:43:46AM +0200, Pablo Neira Ayuso wrote:
> I think we already mentioned this only works for hardware, this is a
> no-go.

It works in software too. nf_flow_offload_forward() and
nf_flow_offload_ipv6_forward() set skb->priority from the flow, see the
nf_flow_table_ip.c hunks. The selftest checks it on veth, without
hardware offload.

Julius

