Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08E61CA5FF0
	for <linux-mediatek@archiver.kernel.org>; Mon,  5 Oct 2026 21:20:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6rc7IAhff66GVhjOkCyBspogq0Dd5n6sEZ9HS+Dhw3U=; b=rHyh3qNI5ytgQufnrWW305X9Nj
	WQCpZAc9Lx2MPVxFZxRnBBAc0m69kXHT9O4ssn3TtrLS57uuVNtTX3jEWDjc7XE4PeiOJboGw4iBH
	+tE5X4vUfZygY4EpmSDjiGXdMWNbnSq6H2+/JzzkxvMWs7h8Zs5ioQxLqfS9sQeV3Wn4LlR8kP7pb
	bPbTK07qok/H6iUFZ8e9cvQgHHY3J4C0U/wXtrzRIFkWJufyhLBCp4Sw5/DkhRblsxXTs1c+rLH8R
	cF5Q4+hdlkrF/fxzW664PboMqmZDZZU+ei/WU5iNbaN4HVS4D93syOXDbN6z5u2fHD6mHxguEV2+T
	FMuMsizg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDq6m-0000000HBue-2hig;
	Mon, 05 Oct 2026 21:20:28 +0000
Received: from mail-wm2-x10.google.com ([2a00:1450:4864:31::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDq6g-0000000HBu5-39An
	for linux-mediatek@lists.infradead.org;
	Mon, 05 Oct 2026 21:20:27 +0000
Received: by mail-wm2-x10.google.com with SMTP id 5b1f17b1804b1-49b912d8239so18811025e9.0
        for <linux-mediatek@lists.infradead.org>; Mon, 05 Oct 2026 14:20:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1791235219; x=1791840019; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6rc7IAhff66GVhjOkCyBspogq0Dd5n6sEZ9HS+Dhw3U=;
        b=PYwLR9YN2Xh0He04hAQvcMo8dEZLj3Hr1hTyPGIcnmeEnyIOMlbXgnyVk56J9/gWxt
         GOvEaQGL67SsBmbRAZF4S49fBlN4uQkYaIzyJPFIDNxkiU2y1EfDOnRKii8+YelJcqL+
         3jjaqUbfNkJNj0HpVS7I4/+QUe+gvZqfxjKWfAFup8PE7BkDBLbmWZ74r4q4/Ov4Ee64
         QVNwWqVtnewHz9/5RrE/xG9ZbBB3wLBz7xp2B9YZoEYDNGrtv0XOJbS9DKutB/3V3LzZ
         p8wmdgc5fVQzhg+vnFpc0SHQrGjx3E6uJakTOAlgY8L0RTvt5aYmOOe3p89YD6Gj0pT3
         julg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791235219; x=1791840019;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6rc7IAhff66GVhjOkCyBspogq0Dd5n6sEZ9HS+Dhw3U=;
        b=kzhiazPQVXVBq3nZCwOcn+P89xkbe8eEE083yxt/oMfUS2nc7N+lA/5Zh2uhJOgQCC
         du+TCfH/gqLtr1nZe/6WeSet6mmcZhji3VQxXJqWBY21AhluBLZ6njtyZAZMHYzTggBD
         jPpzGIufOa0FJOnRL0InBPfDU1Fqg56G3f8T5ClJdOAigiBhc5Mr58dBwchVMSU5u8cZ
         dSSEcn4Vw4e62uRLLQlfuCejUoWrwqM6SsysvM0onAaIbGAkCUo4MHJUC/vRENMRAupb
         iC9R9/teJTa0KTJuweXQe8ibhN2DANdyMf80BanlIJMnFQweDQXoQtWvqh25o+vETaTt
         T5Rw==
X-Forwarded-Encrypted: i=1; AKwUvBzeUIbaPd4g2xnPIVJDkBfDN17FDLQ8sva/6FeMsoPIR45AK7itrH4lEomjqg9KYG1MgTVj2sE8ysnLOfGrkQ==@lists.infradead.org
X-Gm-Message-State: AFuF++krzet4wnkrWTc+cup63KIJGMJsrh48vvCdLdWsmf7/xBqBtbKv
	kseTwKUbEZlWWoZ1RhR2RXBBpjSph7bCkIvg/o2DU935ZJATOj2IRRrokDFu25Xq/amkcWRxLC2
	hJphB5g==
X-Gm-Gg: AYBFou3cTwuL2qftg3cpdySVM0RFvhewCSnm4nwjxA770REks5N28AFJYqwzLud4Noq
	Iyx0n3mElf8QJIJ5kUra4/AqQntYggA+5rKIsH3ZFbm0m4uRobnp72my1s2DTZEMaI2ElGXYzCw
	8gSJc3QB2pGteKH6+3SilSUXM4qHAJ9BLUDvFbddPHZq3NPjaArylhV2fjcvm1bXDr1uoHS2c1A
	iFfucwye2UqpNpTNYV4H1Wg+8Eq6pXJMdgeRkJHEZtTmP1p/CsWFkHjNGHbHZXXkarSNn6kpkA0
	BVDxmzWkQFO6tJ1dosv+5Vgv1++PzQxhGwrrJ/VQNVI+m8rWAT8EwwBB6vqRhbzOeDzRe2knchW
	ZM0VxB68+tErRXAjEi22sM9e/e+lReuJmnB9ickBKPShadQvVTku2+cDXmKpWLd5C2NbsoQ7XZv
	S0e1RS5VpRBV9dWcRgmA6oLBUMaCQq4AMWxwjiCWNHdlhX531COYVHs2x64VeZN3p7KTS5E0pxW
	oZfr4ytmf3NRf23zL9wBjR9726cugNDsXji2RKRn3gkJoMghY/JieXnUxQFvUFQU3aYxuSvsXnG
	n6QevyTOgAovTDLFC6u4FKKH3BFfUV4EairZyG6rLGHh72alk8tgbvUEmxjkebxjT4TNoytKGAx
	58vlH+yg94iJUB6OvlmCBc6tfpsdC0xTPuIaUrn1FiuRfKtUaKdocTYM+lgxvpMomrEQ=
X-Received: by 2002:a05:600c:3510:b0:4a0:c4:a1e0 with SMTP id 5b1f17b1804b1-4a02756729dmr208314965e9.9.1791235219172;
        Mon, 05 Oct 2026 14:20:19 -0700 (PDT)
Received: from Desktop ([187.40.54.22])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a178cafaa5sm21526585e9.5.2026.10.05.14.20.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 14:20:18 -0700 (PDT)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: sashiko-reviews@lists.linux.dev
Cc: netfilter-devel@vger.kernel.org,
	netdev@vger.kernel.org,
	pablo@netfilter.org,
	fw@strlen.de,
	lorenzo@kernel.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH nf-next v3 2/3] netfilter: flowtable: carry a priority into the offload
Date: Mon,  5 Oct 2026 23:19:54 +0200
Message-ID: <20261005211955.2971-1-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261005171647.CCCB51F0089B@smtp.kernel.org>
References: <20261005171647.CCCB51F0089B@smtp.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261005_142022_999100_56B4EE50 
X-CRM114-Status: UNSURE (   5.27  )
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

> Does this silently ignore explicit QoS queuing requests from TC flower?

Yes, and the commit message says so. mtk gets tc flower rules and
flowtable flows through the same block callback, so
mtk_flow_offload_replace() cannot reject one and accept the other.

Rejecting the action would stop offload for every IPv4 flow with a
non-zero TOS, because ip_forward() sets the priority from the TOS by
default:

    net/ipv4/ip_forward.c, ip_forward():
        if (READ_ONCE(net->ipv4.sysctl_ip_fwd_update_priority))
                skb->priority = rt_tos2priority(iph->tos);

A flow forwarded by the mtk PPE does not go through the egress qdisc, so
the priority has nothing to select there. mtk already accepts and
ignores FLOW_ACTION_CSUM in the same way.

No change planned for this one.

