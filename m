Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 071D6606AC18
	for <linux-mediatek@archiver.kernel.org>; Sat,  7 Nov 2026 16:13:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=l6IH2J1I;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Z99EQxYr
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:
	In-Reply-To:Cc:To:From:Subject:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=pdG9+w0MOc8yUlaCyokbXaD1pAnFmRfTrOZLZCjfP/4=; b=l6IH2J1Ib1fPB9
	BSZaFViOUDV388lC88dy5AcwK1gkrNMf9+RnOCFiRhorUjyDhvWXQAgrmy9I4hD49QNIRWiUmlF9s
	gFnm7heotYfqoyvE9P66VrB6gU21AqYzGjFH6fYD/qzLc+WNtAosWpgoLGP04Q/EGPt7qAxgigdqw
	0J24uZ7w3IPl3FGuHVTgy378ZMZrziEuwHnj62j3KM7RPGpy/oNW7Fb6piclvFhL4+s2OwkSCZnXP
	PH41Gc2l5M2leZdead7CvzQIMNqByqf4ESq38BsY9SnQsOu/zbmmld4akKnlBPUymG3EONgJGl8IX
	FVSOHz+bMooq/c7/Dotw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPj2S-0000000EyZt-30d3;
	Sat, 07 Nov 2026 16:13:08 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPj2R-0000000EyZe-1iSQ;
	Sat, 07 Nov 2026 16:13:07 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 6927560DF3;
	Sat,  7 Nov 2026 16:13:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F09C61F008A7;
	Sat,  7 Nov 2026 16:13:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794067986;
	bh=pdG9+w0MOc8yUlaCyokbXaD1pAnFmRfTrOZLZCjfP/4=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=Z99EQxYrycUoPCuM1IsQe9tJkCN2D5CV8ni6KhKiNkKyGTRPfFYcNKznv7N0TlEWL
	 GSuVFNbhNdL0Y05iuMow4uLxLp/Olm2e2k9eryOrIcdLU0wiUCusINA+gfHxCZqS9q
	 DlOXSECwm5rKLqzgFY5ieamxnKl6jRfl/hM4IE6eiVY/JIjXRqIJ8zC3pdSMMzTyUV
	 28mn1PfCKRyTLbNyL91eu86THlo5J+nOApyk2qCgUIBhcwX0Zq/MYBUVFad7gYj4Qz
	 Z6MDZM02NVXomr+/fBRrcEj1Pu4WODWIT5PBcoUCx2vhVxF8DETYeUGXcIrXoAmiyF
	 jg3MvxfyvT15Q==
Received: from traversing.sirena.org.uk (localhost [IPv6:::1])
	by traversing.sirena.org.uk (Postfix) with ESMTP id 9FD002B73E61;
	Sat, 07 Nov 2026 16:13:03 +0000 (GMT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH 0/3] ASoC: mediatek: fix AFE IRQ registration and
 removal ordering
From: Mark Brown <broonie@kernel.org>
To: Myeonghun Pak <mhun512@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Ijae Kim <ae878000@gmail.com>
In-Reply-To: <20261011222234.2098904-1-mhun512@gmail.com>
References: <20261011222234.2098904-1-mhun512@gmail.com>
Date: Sat, 07 Nov 2026 16:13:01 +0000
Message-Id: <179406798190.3424803.7064068903462702662.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=396; i=broonie@kernel.org;
 h=from:subject:message-id; bh=8Nn3Pa/63F6/6Qms1FObd9lhdC+Vb1g3xLoE+sQ899M=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLLe+/FPimdvYtzxdq5VB8/KLR3TZ//snvHwzGbXJ5mh5
 TKpKy6t7yhlYRDjYpAVU2SJy+J+WV/yeg3fwYVtMHNYmUCGMHBxCsBEzr9k+F9gk+z/S894h3RH
 aubn8hXCU/pDSrlbTnxQ33BmUtHhZZIM/533uueyzLFau+Sc8aRNV3lXzdtXnJD8hsdQu+SfTEH
 POSYA
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
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
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

> The AFE IRQ handlers access regmap and PCM state. Register each handler
> after its inputs exist and release it before the final remove callback
> or managed component teardown releases those inputs. The mt8186 patch
> also balances IRQ wake settings on probe failure and removal.

This doesn't apply against current code, please check and resend.

-- 
Mark Brown <broonie@kernel.org>

