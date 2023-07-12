Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4221CEB64DC
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 Jul 2023 03:21:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/NuFIWfEtVjk5MvroN0JIwWzQv+7JB4TBDHgC9DyCxM=; b=JJQ9IiQhIjg81RacN6mfkTaEC2
	nWuSZrpZ5bFgeW0ywNPJ6D6HR0aVTvlZpnJKQK8Rck0BO1T83YUhmiHL/aqPVzloUr1OmyuW6Haw/
	XFOSA6RyHxpw+rNOTPTF8AqM8La5+/V+NUvLPEPCxIbJ/tah+cKff3CYgUuebxPpDPwn7itEQsQuB
	E3jqcsOff9/6khAeYPVUWFHAnGW55hQe5WkfkfZFx8ODabxSQn8bhs8sgE8KCSatM2MuK+UKOo0Ap
	DaTQkeyx98P2+5YdFYnquT4g0eerZ+ZRx5ez9My9naECgva4GeZ4YA249YWBnZm9FV98iv31CEA7m
	tgFhSdbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJQPo-00GNjB-3B;
	Wed, 12 Jul 2023 03:21:20 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJQPl-00GNiR-0W;
	Wed, 12 Jul 2023 03:21:18 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 649DA616A3;
	Wed, 12 Jul 2023 03:21:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01898C433C7;
	Wed, 12 Jul 2023 03:21:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689132075;
	bh=/NuFIWfEtVjk5MvroN0JIwWzQv+7JB4TBDHgC9DyCxM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=nsHuyOFlOfGP8W5cNrlZS+JZtz4WNfbJ3xNhO/Diz6kJf1YahQVGjiWGISpV7KKkO
	 SirSzT6+Iey/kn0zRhDR5DEKmJRQRDUDYaIOJXh+ahNGgXUyRs/qMWi9Glh+7rhHx3
	 XTcq9L/IpBB/hq6c+CgQ4A+aTeOrE3SGjsDTzhzPuJDCEBVcOEdkrR0xBM0ns9TtBs
	 tQKqpy6SrlL5py4Ykit+ZGJ/2RIwTeaZHeIPEyg3vqiug1bzHGvpQ8LvFiTbXieuwv
	 xAnG92vdQu8FVifLfMdDuJjN3sBdbWU0WzPk+1Wi0aVV4FFcLtH7kVGdpvpv+0dXFJ
	 lQF0uJuPrGRSA==
Date: Tue, 11 Jul 2023 20:21:14 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Giuseppe Cavallaro <peppe.cavallaro@st.com>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Jose Abreu <joabreu@synopsys.com>, "David S
 . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Paolo
 Abeni <pabeni@redhat.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Vinod Koul <vkoul@kernel.org>, Bhupesh Sharma <bhupesh.sharma@linaro.org>,
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Thierry Reding
 <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Richard
 Cochran <richardcochran@gmail.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org,
 linux-mediatek@lists.infradead.org, Bartosz Golaszewski
 <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH net-next v3 00/12] net: stmmac: replace boolean fields
 in plat_stmmacenet_data with flags
Message-ID: <20230711202114.5e4f1dcd@kernel.org>
In-Reply-To: <20230710090001.303225-1-brgl@bgdev.pl>
References: <20230710090001.303225-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230711_202117_264162_8B8B51D7 
X-CRM114-Status: UNSURE (   7.59  )
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

On Mon, 10 Jul 2023 10:59:49 +0200 Bartosz Golaszewski wrote:
> As suggested by Jose Abreu: let's drop all 12 boolean fields in
> plat_stmmacenet_data and replace them with a common bitfield.

Peppe, please take a look.

