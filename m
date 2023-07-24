Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DBF8C0015E
	for <linux-mediatek@archiver.kernel.org>; Mon, 24 Jul 2023 13:37:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:
	References:In-Reply-To:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AFC/guxvI3SWIo2ds7Il0mmC4JfFSvaDdJM1H2ANZ4k=; b=q2ncp0eBXerqfMteAJwrzqBsnm
	JOtP4oTuFwlzMjL0vFr5MbgSwx56oHBWvk9kEwDjKHYUYg++D/yUG0nua+DMUCaXKqiB1CW4G5aeV
	gQi5ikzV2iTFj/MN4cbI6Zy9SENXgDu5cehdPiHc8MeBuiOpsqnMDwpi8SkRCTc/h2ndfocsUeJrD
	1iKtYiBWdEUgci0FoBtkgNdKsYCiBFdiy69qs9WZunyOVWx44pKwwCwpRWa1xvZo/JFsA/kyCJoio
	lO+GyCvHkNxvbYxd9HNF2XPldVGcdT38EQU/QoCFlXOVm1lnVtVXjQsE199UVkYa9VYOfFCqPDIqQ
	CwiAnNHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qNvl3-004ULm-0X;
	Mon, 24 Jul 2023 13:37:53 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qNvkz-004UKS-0U;
	Mon, 24 Jul 2023 13:37:50 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 11E4A611DC;
	Mon, 24 Jul 2023 13:37:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D375C433C9;
	Mon, 24 Jul 2023 13:37:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690205867;
	bh=XPnxWK5iXuMFmrHKJKeJo0Yq9Glo/4xviAz4D9r3qYg=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=AQrFT9qK5bvxE2SdPkvTqntbfl+zjptc4bWvBPnEiJ3KaahyBRVbd41316B9r//dq
	 nCM04qi0ERmUmkw/YFiIStxapFGdGZPXLQCXtgl0X87rKs/3mcLNzTQThj3UWivHKK
	 EH/SgWV3nuqSqhJotS3jyfTAYXm4Am7y/XufRsUhV6OagLOoKpg3tWzXpgrw5jpc2U
	 mp2tNryq2n5j4wf38MHg17i5d4vbbmIwQ6SMkhDMlh0fpLIrckG91ODSzXxjPlEaOy
	 MLsBr1Pa1my88iz+3/Q3CXT6oKq6auRsgjLGrLSsUB0U61bmIk9ablLW9Rdx697Zqk
	 7sUO80MkTLE8w==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: wifi: mt76: mt7615: do not advertise 5 GHz on first phy of
 MT7615D (DBDC)
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20230605073408.8699-1-fercerpav@gmail.com>
References: <20230605073408.8699-1-fercerpav@gmail.com>
To: Paul Fertser <fercerpav@gmail.com>
Cc: linux-wireless@vger.kernel.org, Felix Fietkau <nbd@nbd.name>,
 Lorenzo Bianconi <lorenzo@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>,
 Shayne Chen <shayne.chen@mediatek.com>, Sean Wang <sean.wang@mediatek.com>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
        <angelogioacchino.delregno@collabora.com>,
 Paul Fertser <fercerpav@gmail.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, Rani Hod <rani.hod@gmail.com>,
 stable@vger.kernel.org
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.11.2
Message-ID: <169020586134.3064516.1730669435879829563.kvalo@kernel.org>
Date: Mon, 24 Jul 2023 13:37:43 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230724_063749_252112_6AD1E2B7 
X-CRM114-Status: UNSURE (   8.70  )
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

Paul Fertser <fercerpav@gmail.com> wrote:

> On DBDC devices the first (internal) phy is only capable of using
> 2.4 GHz band, and the 5 GHz band is exposed via a separate phy object,
> so avoid the false advertising.
> 
> Reported-by: Rani Hod <rani.hod@gmail.com>
> Closes: https://github.com/openwrt/openwrt/pull/12361
> Fixes: 7660a1bd0c22 ("mt76: mt7615: register ext_phy if DBDC is detected")
> Cc: stable@vger.kernel.org
> Signed-off-by: Paul Fertser <fercerpav@gmail.com>
> Reviewed-by: Simon Horman <simon.horman@corigine.com>
> Acked-by: Felix Fietkau <nbd@nbd.name>

Patch applied to wireless.git, thanks.

421033deb915 wifi: mt76: mt7615: do not advertise 5 GHz on first phy of MT7615D (DBDC)

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20230605073408.8699-1-fercerpav@gmail.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


