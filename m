Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68E37C4828F
	for <linux-mediatek@archiver.kernel.org>; Wed,  7 Feb 2024 13:31:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zrLB4DfoJUMIJyEVWJU10TjwVwiLuOhN8KtRdWCdnRo=; b=hYmecM/e+918ZzLo6j5gtovvAp
	/mZ7Gg8XaBtRNoS4Va8zDERVCTnJvtY7mwx4povoI1DEx2zXSt5OPFYfUNJm/5uH1aUcaC8EuHzjW
	aHjT2buGkL9sL2y6XfYkcFyjC8cHk5wjImt1hWKkIOct9P50L7Rq8vFMwXzic4c0NftAleyj8ECzu
	AzHViFYZ+7w4VwvMcUAVEJnNJ/tTc++4gNhZiFUZREO/fR+FjuUh/jp9bFDBli0PIYn4nVpQePxX9
	5A7sucn2MlrDHVc+s14rf4zgOLX1N4Fp86oeASb1lS8M8E5YuzWZNk3yS+NyVmxYK7yy5FuBwEFkn
	XVNnJKjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXi1k-0000000Am5w-3emV;
	Wed, 07 Feb 2024 13:31:48 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXi1h-0000000Am5T-2Szo;
	Wed, 07 Feb 2024 13:31:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 16D2C617C6;
	Wed,  7 Feb 2024 13:31:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59609C433F1;
	Wed,  7 Feb 2024 13:31:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707312704;
	bh=yVT8Ti21+Ydu/gLRV+nkvBy86ZVYjXvrfoQlsX0IikM=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=bvd80gqtnAh9QaQeLtwQi0Gum8Txp2Nm7vBIYqfhptcXJSzpjF39+JWSq3TntZzWl
	 iIGntqDvme3lVamm5KOROKRNUDdFJJC8iz1/+AlslfMQEWWfw2GWzWqF4j8BERymAD
	 Y2kePZ3YIhx14mSA2PKw5Bk1eW/HuqP3DY2pYNOVSPxW92J0UyjhTrs7jHBYLxarhN
	 SCvR/HMfj8KhJli2M4BDXs4R4KK45qUn+QVAvbo7tfSZ8klwA31cI9LzwvcBa17617
	 IHYoNwEI6Ter56yajddED+zMlEuVFg5l08NN8W00WQXaFlOc/TYc6JnH8aX8GRrLGw
	 4AOWvcIUW+MlA==
From: Kalle Valo <kvalo@kernel.org>
To: Colin Ian King <colin.i.king@gmail.com>
Cc: Felix Fietkau <nbd@nbd.name>,  Lorenzo Bianconi <lorenzo@kernel.org>,
  Ryder Lee <ryder.lee@mediatek.com>,  Shayne Chen
 <shayne.chen@mediatek.com>,  Sean Wang <sean.wang@mediatek.com>,  Matthias
 Brugger <matthias.bgg@gmail.com>,  AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>,
  linux-wireless@vger.kernel.org,  linux-mediatek@lists.infradead.org,
  kernel-janitors@vger.kernel.org,  linux-kernel@vger.kernel.org,
  linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH][next] mt76: Remove redundant assignment to variable tidno
References: <20240207131113.2450297-1-colin.i.king@gmail.com>
Date: Wed, 07 Feb 2024 15:31:40 +0200
In-Reply-To: <20240207131113.2450297-1-colin.i.king@gmail.com> (Colin Ian
	King's message of "Wed, 7 Feb 2024 13:11:13 +0000")
Message-ID: <87il30h03n.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240207_053145_685638_1FB31C8C 
X-CRM114-Status: UNSURE (   8.77  )
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

Colin Ian King <colin.i.king@gmail.com> writes:

> The variable tidno is being assigned a value that is not being read
> and is being re-assigned a new value a few statements later.
> The assignment is redundant and can be removed.
>
> Cleans up clang scan warning:
> drivers/net/wireless/mediatek/mt76/agg-rx.c:125:5: warning: Value stored
> to 'tidno' during its initialization is never read [deadcode.DeadStores]
>
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>

"wifi:" missing from title.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

