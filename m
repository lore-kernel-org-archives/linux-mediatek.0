Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54E0E606A337
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Nov 2026 08:17:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=hDQmkDDk;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=j00jD+2u
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=oj2zs7YpNjut+Fle9NDI2/nVbuq1xcuWOh/20pAlrQ0=; b=hDQmkDDkWEtCrZqQCqNW0w7dsH
	+h8Igv+OVCNfhPVato9+fGNAqDYxCfkDcUo1kk6Qh2BQYO4ZWD5j6U7vHaYhMRv594qnxVfwRabXT
	N9cMQH6uNbZXn5las2/JePPJTuYfRAygt5dZIVWKPKZs9fI8ScTpDSSgKrtdyjolafmMBhFdOkUM3
	EVzT2wjVVPFG9VTww/bLekv6sm85Qi2ZidboL7tIpvMHSHJ34Brc1pFSBx72mHqpGl9eQV20xFsn8
	AaBxAj4LZ0SQoTYgYhbGoAynAeh4f1G4tB19ph6tXnsqsnRTMWSqO/ApRXTzDM2QuFHxyteXNt8DX
	FQ4r/XgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTxLA-0000000BA8i-41Ix;
	Thu, 19 Nov 2026 08:17:56 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTxL9-0000000BA8R-2Kl6;
	Thu, 19 Nov 2026 08:17:55 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id CC42C625BB;
	Thu, 19 Nov 2026 08:17:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6A581F000C4;
	Thu, 19 Nov 2026 08:17:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795076274;
	bh=oj2zs7YpNjut+Fle9NDI2/nVbuq1xcuWOh/20pAlrQ0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=j00jD+2uZz+Wt76MZU20Q3rjoviZclCrpbVH1pctpf5IxsZy9ofVHqQfWyxufNcQY
	 2W8L/o3t4GAHpdPCzi9tUJfTSElUteh85tChcZjmWz9YFGIFIqn+0nrmnfCxmN3h6E
	 kyAsf3qhH0NMM1Sf0da8mhup0Dc5OD+Ktvf3gz/xjKMTxHCH/aO4RUBiJJTKOboY7V
	 o8DMYGiJK8gErhadlk4057/LhjlYZfEK1qTJpS+SndvKHAVrkMuJhd36p7ufu7viwk
	 TcaaKBYjUA1RBvA5ZAwYToogOKNpFWfoqleR48xo/fFjIFS1Ml1TREDjOX1094gmDe
	 Y/wUO1ktRL+Gw==
From: netdev-bot+sinfo@kernel.org
To: Wang Haoran <wanghr2026@mail.zgclab.edu.cn>
Cc: chester.a.unal@arinc9.com, daniel@makrotopia.org, andrew@lunn.ch,
 olteanv@gmail.com, davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org,
 pabeni@redhat.com, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] net: dsa: mt7530: disable the power rails on setup failure
Date: Thu, 19 Nov 2026 08:17:53 +0000
Message-ID: <179507627334.3291.8585396594383940483@kernel.org>
In-Reply-To: <1795076103951-10-8fa23d94@mail.zgclab.edu.cn>
References: <1795076103951-10-8fa23d94@mail.zgclab.edu.cn>
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

