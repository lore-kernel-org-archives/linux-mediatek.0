Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18D1FC83F12
	for <linux-mediatek@archiver.kernel.org>; Tue, 29 Aug 2023 06:38:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YvZ8Ynf/YBXPJNGNF6sCa0d7x8aGWkFz6ISsFmluTZ0=; b=hatZl/BgM+a5vy7SBlx6BXHRZQ
	P7/Fp9A8zEwYypczK5+n5j2DfTfl5VtV75X4ZkoyCXE+XzIfnKjh3LNIsXGU3hgybbbOLmR4pMnl4
	X7Riq0UPVJ0017lvya+TQVYfp/2zDMwpxbqT+zO7wTaPikFWn9tHcP7oy0qHkhjG7o1WoKX4CYJ8r
	or/NMgTf4CZ7O+R0xmqSTtBUqGA3JOS1hNPKd9x5o3ORWvIfenV7dTmvpfx8jgItrdKDyyxUjXiwn
	53gtaCxTUQFcq+Qrh+g+XOuHx2zljzSqlLKo3R7EQPcOwg2R0kJxRLeOwX+NQDPrN9Sl7PRH/QHOn
	iNhoYvWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qasN7-00AsX7-2h;
	Tue, 29 Aug 2023 06:38:41 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qasN5-00AsWW-0s
	for linux-mediatek@lists.infradead.org;
	Tue, 29 Aug 2023 06:38:40 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id B3FB363085;
	Tue, 29 Aug 2023 06:38:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8BEFFC433C7;
	Tue, 29 Aug 2023 06:38:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1693291118;
	bh=x/iqnYEMiERFgFB3t6SZXqvZT0osBSR/qTcOQ2PyUNw=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=joke98uu+nHTaahbAOQutcUSq8mvmquk3EWQ+dGYEd4vqQSzjMUAV4pV2bNR9GFcL
	 +nTcXWGJzMWmelJ57VU3gQAixT4hcHibD9SWYep+BkNdndhL37Cl8Z0qGl7GtBIhlf
	 aPMcoh5rHfl4EilfVFVjey4Yky67j4xV4xi2gOS72C/nF/N3Vf0bkzavIicQnLPmyZ
	 HACIRihQSMWzZuurRoeOS2I8SgNr/hD016uDYnedPwu8IVMBbXrQ4iHOKlOz7vYlOl
	 iN1ENqJnzD/GKge+IqMxImWvJCaGIFRMxELT+bqgU+ZIcdJGi5tg4viEKB51Y0ktli
	 anHuYKTf7l06g==
From: Kalle Valo <kvalo@kernel.org>
To: Ryder Lee <ryder.lee@mediatek.com>
Cc: Felix Fietkau <nbd@nbd.name>,  <linux-wireless@vger.kernel.org>,
  Lorenzo Bianconi <lorenzo.bianconi@redhat.com>,  Shayne Chen
 <shayne.chen@mediatek.com>,  Evelyn Tsai <evelyn.tsai@mediatek.com>,
  <linux-mediatek@lists.infradead.org>,  "Alexey D . Filimonov"
 <alexey@filimonic.net>
Subject: Re: [PATCH] wifi: mt76: add ability to explicitly forbid LED
 registration with DT
References: <b08ef4d7c91c54e273c61784272e5c6f70c3c137.1692896654.git.ryder.lee@mediatek.com>
Date: Tue, 29 Aug 2023 09:39:47 +0300
In-Reply-To: <b08ef4d7c91c54e273c61784272e5c6f70c3c137.1692896654.git.ryder.lee@mediatek.com>
	(Ryder Lee's message of "Fri, 25 Aug 2023 01:08:37 +0800")
Message-ID: <87edjmtkr0.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230828_233839_639262_0EFF9567 
X-CRM114-Status: UNSURE (   7.40  )
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

Ryder Lee <ryder.lee@mediatek.com> writes:

> Add ability to explicitly forbid LED registration using DT led\status = "disabled".
>
> Tested-by: Alexey D. Filimonov <alexey@filimonic.net>
> Signed-off-by: Alexey D. Filimonov <alexey@filimonic.net>
> Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>

Is this a generic Device Tree feature and already documented in DT
bindings?

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

