Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E29D5C624D3
	for <linux-mediatek@archiver.kernel.org>; Fri,  4 Sep 2026 14:20:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bma8uVQSuJCCX2P0uXhskDUiAwspKRgXZlKiZUAmUFw=; b=kPaKCQG4PSrxpN3uw42xAXd95K
	V7L89hE1sgIZelOjux6TXAyfVtmZVxoKfoqTYD+2urlltLjtjyLraRiv2ptmzwPlDMLhJ3TWMBj+R
	I6Td3ngPOTf0AgsDDZyduiq7FCPS4Xoov3nPhyCmugGGpRtmlzC+gDrWZR7nCmERFp38tEsICMMVD
	JRZLWn4998FUiABvY2HcfaBI21i7/YJFyGR6KZGcQNH8j++G2GT76c9w3iBeh5NyY98F0zSJWgG6P
	GEUYEK5+tBRF8Aes+U8cbNjtSYVK+xdOOT3NVq+lFR4OD8MuXtzmNYI703mjh17NsUS+HYhYBFUDb
	l2oqlw/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2Umh-00000002MiO-1pMl;
	Fri, 04 Sep 2026 14:20:51 +0000
Received: from smtp21.cstnet.cn ([159.226.251.21] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2Ume-00000002Mhs-0jkt;
	Fri, 04 Sep 2026 14:20:49 +0000
Received: from [192.168.0.113] (unknown [123.118.210.34])
	by APP-01 (Coremail) with SMTP id qwCowAB3Se1v05pqrLYrBw--.65223S2;
	Fri, 04 Sep 2026 22:19:28 +0800 (CST)
Message-ID: <da1da563-1011-4b0c-a480-9d3d3acb6441@iscas.ac.cn>
Date: Fri, 4 Sep 2026 22:19:27 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 25/33] net: spacemit: k1_emac: Remove comma after
 sentinel-entry in match-table
To: Siddharth Vadapalli <s-vadapalli@ti.com>,
 dario.binacchi@amarulasolutions.com, mkl@pengutronix.de, mailhol@kernel.org,
 msp@baylibre.com, florian.fainelli@broadcom.com, jonas.gorski@gmail.com,
 andrew@lunn.ch, olteanv@gmail.com, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, kurt@linutronix.de, hauke@hauke-m.de,
 chester.a.unal@arinc9.com, daniel@makrotopia.org, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, ansuelsmth@gmail.com,
 linusw@kernel.org, luizluca@gmail.com, alvin.sipraga@analog.com,
 clement.leger@bootlin.com, justin.chen@broadcom.com, dlan@kernel.org,
 rogerq@kernel.org, hkallweit1@gmail.com, linux@armlinux.org.uk,
 rjui@broadcom.com, sbranden@broadcom.com,
 bcm-kernel-feedback-list@broadcom.com, opendmb@gmail.com,
 andrei.botila@oss.nxp.com, amadeus@jmu.edu.cn, kees@kernel.org,
 tmshlvck@gmail.com, c-vankar@ti.com, horms@kernel.org,
 vadim.fedorenko@linux.dev, daniel.zahka@gmail.com,
 nora.schiffer@ew.tq-group.com, v-singh1@ti.com, oss@vassilevski.com,
 haokexin@gmail.com, alex@sverdlin.org, aleksandr.loktionov@intel.com,
 lgs201920130244@gmail.com
Cc: linux-can@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-renesas-soc@vger.kernel.org,
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
 linux-omap@vger.kernel.org
References: <20260904043724.2955444-1-s-vadapalli@ti.com>
 <20260904043724.2955444-26-s-vadapalli@ti.com>
Content-Language: en-US
From: Vivian Wang <wangruikang@iscas.ac.cn>
In-Reply-To: <20260904043724.2955444-26-s-vadapalli@ti.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: qwCowAB3Se1v05pqrLYrBw--.65223S2
X-Coremail-Antispam: 1UD129KBjvdXoWruFW5ur1kJFyxAr18Xr1UZFb_yoWkKrbE9r
	1fXas3Jr4DCryv9a4akF1avrWkKrs8Xr48Was7KrW3ZasrWr1kArWkCF97t34furWrXFZ3
	GrnxKF48Aw17KjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbsAYjsxI4VW3JwAYFVCjjxCrM7AC8VAFwI0_Wr0E3s1l1xkIjI8I
	6I8E6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM2
	8CjxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVWUJVWUCwA2z4x0Y4vE2Ix0
	cI8IcVCY1x0267AKxVWxJVW8Jr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4
	A2jsIEc7CjxVAFwI0_GcCE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IE
	w4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMc
	vjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwACI402YVCY1x02628vn2kIc2xKxwCY
	1x0262kKe7AKxVWrXVW3AwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8Jw
	C20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAF
	wI0_Wrv_Gr1UMIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7
	IYx2IY6xkF7I0E14v26F4j6r4UJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2
	z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnU
	UI43ZEXa7IUnGZX7UUUUU==
X-Originating-IP: [123.118.210.34]
X-CM-SenderInfo: pzdqw2pxlnt03j6l2u1dvotugofq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260904_072048_694741_C9F39B8F 
X-CRM114-Status: GOOD (  12.55  )
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

On 9/4/26 12:36, Siddharth Vadapalli wrote:

> Since sentinel is the last entry and we do not expect further entries
> following it, remove the comma.
>
> Signed-off-by: Siddharth Vadapalli <s-vadapalli@ti.com>
> ---
>  drivers/net/ethernet/spacemit/k1_emac.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/net/ethernet/spacemit/k1_emac.c b/drivers/net/ethernet/spacemit/k1_emac.c
> index f7f16397a2c2..29385d78fc4b 100644
> --- a/drivers/net/ethernet/spacemit/k1_emac.c
> +++ b/drivers/net/ethernet/spacemit/k1_emac.c
> @@ -1161,7 +1161,7 @@ static const struct ethtool_rmon_hist_range emac_rmon_hist_ranges[] = {
>  	{  512, 1023 },
>  	{ 1024, 1518 },
>  	{ 1519, 4096 },
> -	{ /* sentinel */ },
> +	{ /* sentinel */ }
>  };
>  
>  /* Like dev_fetch_dstats(), but we only use tx_drops */
> @@ -2066,7 +2066,7 @@ static const struct dev_pm_ops emac_pm_ops = {
>  
>  static const struct of_device_id emac_of_match[] = {
>  	{ .compatible = "spacemit,k1-emac" },
> -	{ /* sentinel */ },
> +	{ /* sentinel */ }
>  };
>  MODULE_DEVICE_TABLE(of, emac_of_match);
>  

Acked-by: Vivian Wang <wangruikang@iscas.ac.cn>

Regards,
Vivian "dramforever" Wang


