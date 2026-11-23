Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DCD6606A32D
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Nov 2026 11:12:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=uxgdgLwc;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oF04sU9A
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=oj2zs7YpNjut+Fle9NDI2/nVbuq1xcuWOh/20pAlrQ0=; b=uxgdgLwcmTNtdxNTEmb4huVpMW
	5ULGSG2TjnALoGX2ypTHQ89pJJhxnED0BKow2eimLLWzdLhNJ5Yrs0xLZS0EJIADKqlYXlgp59p7L
	X/o646Evt1HzBm7zyW81nL/y10OLejEAy7j+lBWyn7rfihhNcWt+ta1CqBtH3CylL+IdkJnCsYUPA
	YB+WC8elFEYrr3p8uvk+8+HI2qNFlSlJBWLKthVocPOQY5cFzyLgBaZHlt5Dsq7h6+skbLd7WDpG3
	mNnzig4qlFmNy+3/2ARSRsZOvebqNtAc1hnp+0C0w96jwOq6maHu6+0de5RhR5ZJnc4KkXiFGhkkS
	U2zec0mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVRyT-000000035oN-35oT;
	Mon, 23 Nov 2026 11:12:41 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVRyS-000000035nw-3LVA;
	Mon, 23 Nov 2026 11:12:40 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 8D1F1417A4;
	Mon, 23 Nov 2026 11:12:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63DA41F000D0;
	Mon, 23 Nov 2026 11:12:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795432360;
	bh=oj2zs7YpNjut+Fle9NDI2/nVbuq1xcuWOh/20pAlrQ0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=oF04sU9Ae89DHMAwDnkHi10HDUt/amyDLopscy7ajZ8YKVd/9cE5KkBcw3TnCfuwk
	 /j+keZxVpfxwxUl34eu+0mCdbw0bRR+hNwH518pW4i5ceTjS0ScCERTnBgWkk8mZHi
	 PAcwCb0pFp+w0zbWrhuxAvL4xoCrXGFRtASaaMZeESYxQs6Bh1Z6WtVGR2tSGdvyPQ
	 +8lxWKa/8toQBaSJq8upxncaar8BPrAwOmjWhZb+iU3WhtjYBRIcN4TYQ9WsDaqRhY
	 nXUFHMPHueeiEPSIRasbIz3s+AzeaMgxUFI73qgMagwnVlHxZ7eX+EviAttlm+pTf9
	 5BJ36XhlMDj9g==
From: netdev-bot+sinfo@kernel.org
To: Haoran Wang <wanghr2026@mail.zgclab.edu.cn>
Cc: chester.a.unal@arinc9.com, daniel@makrotopia.org, andrew@lunn.ch,
 olteanv@gmail.com, davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org,
 pabeni@redhat.com, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] net: dsa: mt7530: disable the power rails on setup failure
Date: Mon, 23 Nov 2026 11:12:38 +0000
Message-ID: <179543235894.3294.8827397951204336522@kernel.org>
In-Reply-To: <179543215348.11880.18316180385674365789@mail.zgclab.edu.cn>
References: <179543215348.11880.18316180385674365789@mail.zgclab.edu.cn>
Auto-Submitted: auto-generated
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi!

This is an automated message. This series looks like a fix, but its
commit messages seem to be missing some information:

 - How the issue was discovered, e.g. hit in production, hit during
   development, syzbot report, manual code inspection, LLM or static
   analysis tool scan.

 - Whether the issue was actually triggered, or is only theoretical
   (e.g. found by LLM and not proven at runtime). If it was triggered
   please include the symptoms, like the stack trace or kernel messages.

Please do not repost the series just to address the above. Instead,
reply to this email with the missing information, so that reviewers
can take it into account.

*IMPORTANT*: If you do repost (for other reasons) - please include
the relevant info in the cover letter or commit messages.
-- 
The evaluation is done by an LLM so it may be wrong, if you think
that is the case please reply and explain.

