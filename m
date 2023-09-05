Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39E63C83F2C
	for <linux-mediatek@archiver.kernel.org>; Tue,  5 Sep 2023 11:15:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F6DB4fzWeAf3j9SnwYlYnbiO5N6Wp5DCb+iYWkGlIAc=; b=tVoIfmYuSoI6WYSBn+76dtFri/
	7gjFbBkFfLzfGrGYcCv8GQXnAzKi/CNVAGkFEqKssJ9Cbk9DsskEZw1mupK4Kx9FE1LXzo6LtBAKm
	/U+4MeFvc90Ec4bAVHbyM2GAXf+GYgGkMEAvz89rxPL8UJNrggR1Nr7ReZfIUwE87Wol0oPFtNzwn
	GPzkcaRkKHRrc9D7v4CtokZEXjJmOV07rg3/SmVgw4u5P/LpzCv2Rayttvg8hO2PZ8DRt+q4jQHyN
	1rsW+lvzNzchf4rSbgjC7ZlnqaTE1EzhFlLZ7WyW8+mWzoakgbKOCCHPWIRJa2mp3XoZ0XHTR81JM
	maf5nRHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qdU21-005tGV-30;
	Tue, 05 Sep 2023 11:15:41 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qdU1y-005tFj-2m;
	Tue, 05 Sep 2023 11:15:40 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 4B41A60684;
	Tue,  5 Sep 2023 11:15:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E67EC433C8;
	Tue,  5 Sep 2023 11:15:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1693912536;
	bh=tYMC5mFOHoZooyYp0v59p//CvAfTaT1mvVu1GIr5Tt8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=C/0oL7N6efQB3vgWR+OpkIVMYP7vH48x2YluuFC+9bJxeeJe7RxMoH6Rcf+TyvaLd
	 zEIrjlSr58Ppjmz20zNCNM7v8Le9fMWLfcDFar0n50gZEt4JzuIE7VqF815sJUVNbX
	 xbcpDBpL9lY1UO2nz5MMTyAe/FCHToKxefq6+pmacmq/aU4uVV67vvQ0UdmzTvFkQR
	 1XD973O7hdwp/178CgCV/9gHFVLA3UPC/qrRrcW1uphdMbBFJV80dAuW1BmWR7Fuuo
	 OIPxeXW+mqL+KlhqiaRUFDNlDQWUSuKPHM04NWBW+4kGjH8s3KT7sOS9FF5jXngUt/
	 qPDpl+kdYWkVg==
Date: Tue, 5 Sep 2023 13:15:26 +0200
From: Simon Horman <horms@kernel.org>
To: Shubh <shubhisroking@gmail.com>
Cc: =?utf-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Landen Chao <Landen.Chao@mediatek.com>,
	DENG Qingfang <dqfext@gmail.com>,
	Sean Wang <sean.wang@mediatek.com>, Andrew Lunn <andrew@lunn.ch>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] net: dsa: mt7530: refactor deprecated strncpy
Message-ID: <20230905111526.GE2146@kernel.org>
References: <20230905041614.14272-1-shubhisroking@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230905041614.14272-1-shubhisroking@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230905_041538_967181_6FC00EF6 
X-CRM114-Status: GOOD (  18.85  )
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

On Tue, Sep 05, 2023 at 09:46:14AM +0530, Shubh wrote:
> Prefer `strscpy_pad` to `strncpy`.

I think this needs some justification.
Why is strscpy_pad() preferred in this case?

Also, assuming this is not a bug-fix for 'net', then it is an enhancement,
and should be targeted at net-next.

   Subject: [PATCH net-next] ...

As it stands, net-next is closed:

## Form letter - net-next-closed

The merge window for v6.6 has begun and therefore net-next is closed
for new drivers, features, code refactoring and optimizations.
We are currently accepting bug fixes only.

Please repost when net-next reopens after Sept 11th.

RFC patches sent for review only are obviously welcome at any time.

See: https://www.kernel.org/doc/html/next/process/maintainer-netdev.html#development-cycle

> 
> Signed-off-by: Shubh <shubhisroking@gmail.com>
> ---
>  drivers/net/dsa/mt7530.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
> index 035a34b50..ee19475ec 100644
> --- a/drivers/net/dsa/mt7530.c
> +++ b/drivers/net/dsa/mt7530.c
> @@ -836,7 +836,7 @@ mt7530_get_strings(struct dsa_switch *ds, int port, u32 stringset,
>  		return;
>  
>  	for (i = 0; i < ARRAY_SIZE(mt7530_mib); i++)
> -		strncpy(data + i * ETH_GSTRING_LEN, mt7530_mib[i].name,
> +		strscpy_pad(data + i * ETH_GSTRING_LEN, mt7530_mib[i].name,
>  			ETH_GSTRING_LEN);

The line above is no longer indented correctly.

>  }

--
pw-bot: defer

