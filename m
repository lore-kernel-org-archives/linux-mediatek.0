Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5438CCF2C7
	for <linux-mediatek@archiver.kernel.org>; Sun, 18 Oct 2026 02:25:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cOWgL4Y5aOSoL3opS9VqD9bwE2Ik8UunaS8+RLwbmv0=; b=ibKinrEYX2brDPBAylapRWPrtP
	HPI3akjx7TUVYCGHtb0T40Kvi4hjsv+jRVhpVcCCeYkg0DJK6KNUOpyNxmwQ/Dv5JFSqDpchJwl2j
	9jxEnl4dtNZOz7/GKRSfBixXW9NR8ejTj3xh+24SCWJfVJID79tEdEPvD2FekkBP8J40rKiPm4+jh
	LQgdV74ISJJ6bUcfCsbBKOmagOpACNNmUBF5jBU7u1DI7bHmJIECqLyO1sxh398WNrQWaNryv7w8X
	PXbLvcUW4uceh9m3KhuCX0bAFHSWcc/ll9Y5SbeSk7ek63PqqHNxI9c2FJU5oReQ8XNLofGUHkl8g
	0NaXaXhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIGae-00000005RkW-0EU1;
	Sun, 18 Oct 2026 02:25:36 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIGac-00000005Rjm-0X9S
	for linux-mediatek@lists.infradead.org;
	Sun, 18 Oct 2026 02:25:35 +0000
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-c4301e334ceso12878666b.1
        for <linux-mediatek@lists.infradead.org>; Sat, 17 Oct 2026 19:25:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1792290332; x=1792895132; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cOWgL4Y5aOSoL3opS9VqD9bwE2Ik8UunaS8+RLwbmv0=;
        b=wf6L5k31BbVnEuaYDaSFFEMfrW6576wxwHi9Q/MR9OGu2PfkdXruCU9wMqDkd5dpdY
         wcYpkMWGHFK6CytTPOWcMu0toVLpbVf1vtZo6+a7I7JVzB0sYz7jSHhZUZaXADgonnJd
         BdtmaE8riClMi8J5iphDZcmEHGmtN/vKZa2/Y3YkT1gTzdoiZzo1VLRPTXjG/JIfxH1c
         5OaQVKUFEVaZkKr7HkSF7Tiv2R4/DNLAso8z+qOgUO8bBwckyFzB8c/0VfxC8/eBp3GT
         FrOodl1YPJhym/y2ENujGSGMyEr+wbUifGHC/hrB2oQZd5pSiTTcVoSgPAFL/T12X1GT
         /V9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792290332; x=1792895132;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cOWgL4Y5aOSoL3opS9VqD9bwE2Ik8UunaS8+RLwbmv0=;
        b=K/IC3pPj2YgnSlcBzjj7G80xIT2RfefbFNpL/ZvxT0otPUcCqucLcRj9nSQK4QTZmT
         PqFRA8gHXwpYUj7lL2bY20I8ypOQpgo87o3FeOUoVUR95kU8aYqdMZ8b199wymb8wv6m
         Lomp13QACSeDDBikW0dHDUN0WALoW9EZ+fNt9EbxzzbEHXYRs0bf7v8bHvjGnXbkbdf3
         F7GxCOxTcll5S55Kn2vYPwtMmPREl9q8ukqHqCQenwNZbmcMcC8/TcxoSkViqZJeN1QL
         f6+9G058l2sZsypKk1MsC6s2Oh1vU7gx70adfo3deWgyiue7gWcvwx8a50oAjR9YIqka
         YIIw==
X-Forwarded-Encrypted: i=1; AKwUvBw1UHLt0ZDtYJWcS66fSbnvajOTlB8t4vdAcCmMYG9iL85u/v4JW+aDM9qLb1LRHBdPJ4WQG46umpoqZoCbJQ==@lists.infradead.org
X-Gm-Message-State: AFq9FYKcNETrBUs1B7mncBpBPWt6L3ZWK0SE/lgI1e0y8WM7YLVnkOcc
	Ow+EenmHlrxDMGDvuJG5GmPXgizNT36FeZ2s6a4HqEJFgdwIkkAFnyKGsuDnPhOOyQ==
X-Gm-Gg: AYBFou3wQ4xjRle2ZOzzG87FhTG6BEWlN0r+t5httTiCIR9CJ2ElTxVipKdNBtv8wHV
	SaNAOoz5tizFi0K+qGmeOzS2XIf9DYzyB96g/kkKpdLh8WlRdh4ruDClqrDsZvFWcGPwazcLKrJ
	ngihGsEDfXvu7zOT6BeuccYeeqP9bqmO+DX2HEoYWLw01SQ6+PgxziH3SL3mroFlNBtaLBjSZds
	iT5/LOGTe/gqLjn501IICmTLONuyRJlSelC8RyYZWo44CgtvMb3JUv5533vxfv4EuQTpAk6J4fS
	9g1dF97pvwoK5ZPdRuoZhOiyjuBvmPC3Jf0dwLTc5gOlX+BVSmgeILIoKNhUF7FIaG3KJ9snOuf
	fw5oh9meUW6O/5ZySgVemUG7rph/KB2u6oSqUjqZeziOoLfFGftpvyCRE7mMQZ+44vXIwtIzd9c
	MV2fvOLXuvq4koY+UHg1kRlTzyo/5LGjjIV4f9SwxBeDWVSF0vsf7+6e5JrP/zPNJX08FPzb+zi
	jaHWBUhUacC426pnK6kbRZGgLy6wyJuDJbNrkvW+DJqv0ZjZxyf4IWYtupeN9exYb9UG1Kk5rdS
	F/u/QBaQEVlpZNsFHj5c/gwMPkLCbdXNnb3EkWvaWE386QGE5WdwZXrNsUxFCxTkLF5PpR+oTng
	xtkYOXaOwPrvGy7EhTXCxSedKIGlUryglzUyqSL0VFCT0bHccRJ/O6fJQa/j9+Op1VDzPvt+6k0
	hDeg8DyeJfgBU6IH+nJsAWQW2nmolFTMnlbA+7WjdA+TfFxGTHNrsqQnEeG/qSjg==
X-Received: by 2002:a17:907:e849:b0:c40:4320:de2c with SMTP id a640c23a62f3a-c419e73e2a1mr277700866b.15.1792290331870;
        Sat, 17 Oct 2026 19:25:31 -0700 (PDT)
Received: from Desktop.fritz.box (p200300f247429d100000000000000a27.dip0.t-ipconnect.de. [2003:f2:4742:9d10::a27])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c40913c4c5dsm222994366b.39.2026.10.17.19.25.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 19:25:30 -0700 (PDT)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: jianbol@nvidia.com
Cc: pablo@netfilter.org,
	fw@strlen.de,
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
Subject: Re: [PATCH nf-next v3 1/3] net/mlx5e: Ignore FLOW_ACTION_PRIORITY on flowtable offload
Date: Sun, 18 Oct 2026 04:25:27 +0200
Message-ID: <20261018022527.4065122-1-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <CAC1t37K0tEMzxmRhLeHnH-TPx61pZmCHt0xxTJ5Wq2Wxvzv8Jw@mail.gmail.com>
References: <CAC1t37K0tEMzxmRhLeHnH-TPx61pZmCHt0xxTJ5Wq2Wxvzv8Jw@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261017_192534_218271_4E6806AC 
X-CRM114-Status: UNSURE (   5.03  )
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

Hi Jianbo,

v4 is ready with your Reviewed-by on 1/3, the rename to
skbedit_prio.c and the consequence line. Pablo asked to handle one
series at a time, so I will post it once the fdb roaming series is
merged.

Thanks,
Julius

