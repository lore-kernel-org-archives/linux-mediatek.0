Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB7D1D1119B
	for <linux-mediatek@archiver.kernel.org>; Mon,  4 Nov 2024 02:45:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To
	:From:Date:Subject:Message-ID:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VMJ0qNC7D3RhewOuf4cdyfmebiUIbRwkpgu9S0MsSDk=; b=sNYBeeKtOKIalbb5YqSYS2HEYK
	w/j4Uv22QLZizx/Z06034YmgdnRM5UPwrjBEw9XxVdTUjikQQUC6RFmhuHydzy7FzkN58KVN9yxFI
	/uXFYnMBQSH6ET66dtB9rY40JO/ulUekR+GD/7kbDxZX93f4BGjci3qyWQy++Uobbn2EWmTKBUKZU
	A/SJMW+DpY3tKFDHFmmvEp4+bDMmKAzL50lfkviyqkUOvXeNL9SyNgZP05lnUP1ujidiQI3gFw0OI
	tmkj2jebMUAQx4MG9uaznmWNQyfZELaHpYgYKUoZBGuRDbzliQ41yRts8mMQ8oife9YpfWVGMQNqV
	+ahJS3UA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t7n65-0000000CUXb-1p3t;
	Mon, 04 Nov 2024 02:45:41 +0000
Received: from out30-97.freemail.mail.aliyun.com ([115.124.30.97])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t7n62-0000000CUWi-0gXq;
	Mon, 04 Nov 2024 02:45:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1730688332; h=Message-ID:Subject:Date:From:To;
	bh=VMJ0qNC7D3RhewOuf4cdyfmebiUIbRwkpgu9S0MsSDk=;
	b=cJnY82t/EeX5YTfQOfMM9T4hccLn4IH/8894sRpD1U/9yobFGWTEzOuMCaaVtjwF8Vcm32pcmH6Lssm7VJ53DzYhpyTSE+q7sG+4E3cPHCrun0hXwF34jU0LZKmUJ+fvYeBWNdVF8HKCASMejn6sc+MsXbLATrbVFYXythn5Qbs=
Received: from localhost(mailfrom:xuanzhuo@linux.alibaba.com fp:SMTPD_---0WIZlEgZ_1730688325 cluster:ay36)
          by smtp.aliyun-inc.com;
          Mon, 04 Nov 2024 10:45:25 +0800
Message-ID: <1730688315.6177652-4-xuanzhuo@linux.alibaba.com>
Subject: Re: [resend PATCH 1/2] dim: make dim_calc_stats() inputs const pointers
Date: Mon, 4 Nov 2024 10:45:15 +0800
From: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
To: Caleb Sander Mateos <csander@purestorage.com>
Cc: Caleb Sander Mateos <csander@purestorage.com>,
 intel-wired-lan@lists.osuosl.org,
 linux-arm-kernel@lists.infradead.org,
 linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org,
 linux-rdma@vger.kernel.org,
 netdev@vger.kernel.org,
 oss-drivers@corigine.com,
 virtualization@lists.linux.dev,
 Andrew Lunn <andrew+netdev@lunn.ch>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Arthur Kiyanovski <akiyano@amazon.com>,
 Brett Creeley <brett.creeley@amd.com>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Claudiu Manoil <claudiu.manoil@nxp.com>,
 David Arinzon <darinzon@amazon.com>,
 "David S. Miller" <davem@davemloft.net>,
 Doug Berger <opendmb@gmail.com>,
 Eric Dumazet <edumazet@google.com>,
 =?utf-8?q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>,
 Felix Fietkau <nbd@nbd.name>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Geetha sowjanya <gakula@marvell.com>,
 hariprasad <hkelam@marvell.com>,
 Jakub Kicinski <kuba@kernel.org>,
 Jason Wang <jasowang@redhat.com>,
 Jonathan Corbet <corbet@lwn.net>,
 Leon Romanovsky <leon@kernel.org>,
 Lorenzo Bianconi <lorenzo@kernel.org>,
 Louis Peens <louis.peens@corigine.com>,
 Mark Lee <Mark-MC.Lee@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Michael Chan <michael.chan@broadcom.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Noam Dagan <ndagan@amazon.com>,
 Paolo Abeni <pabeni@redhat.com>,
 Przemek Kitszel <przemyslaw.kitszel@intel.com>,
 Roy Pledge <Roy.Pledge@nxp.com>,
 Saeed Bishara <saeedb@amazon.com>,
 Saeed Mahameed <saeedm@nvidia.com>,
 Sean Wang <sean.wang@mediatek.com>,
 Shannon Nelson <shannon.nelson@amd.com>,
 Shay Agroskin <shayagr@amazon.com>,
 Simon Horman <horms@kernel.org>,
 Subbaraya Sundeep <sbhatta@marvell.com>,
 Sunil Goutham <sgoutham@marvell.com>,
 Tal Gilboa <talgi@nvidia.com>,
 Tariq Toukan <tariqt@nvidia.com>,
 Tony Nguyen <anthony.l.nguyen@intel.com>,
 Vladimir Oltean <vladimir.oltean@nxp.com>
References: <20241031002326.3426181-1-csander@purestorage.com>
In-Reply-To: <20241031002326.3426181-1-csander@purestorage.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241103_184538_901741_A23E3F38 
X-CRM114-Status: GOOD (  14.11  )
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

On Wed, 30 Oct 2024 18:23:25 -0600, Caleb Sander Mateos <csander@purestorage.com> wrote:
> Make the start and end arguments to dim_calc_stats() const pointers
> to clarify that the function does not modify their values.
>
> Signed-off-by: Caleb Sander Mateos <csander@purestorage.com>


Reviewed-by: Xuan Zhuo <xuanzhuo@linux.alibaba.com>

> ---
>  include/linux/dim.h | 3 ++-
>  lib/dim/dim.c       | 3 ++-
>  2 files changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/include/linux/dim.h b/include/linux/dim.h
> index 1b581ff25a15..84579a50ae7f 100644
> --- a/include/linux/dim.h
> +++ b/include/linux/dim.h
> @@ -349,11 +349,12 @@ void dim_park_tired(struct dim *dim);
>   *
>   * Calculate the delta between two samples (in data rates).
>   * Takes into consideration counter wrap-around.
>   * Returned boolean indicates whether curr_stats are reliable.
>   */
> -bool dim_calc_stats(struct dim_sample *start, struct dim_sample *end,
> +bool dim_calc_stats(const struct dim_sample *start,
> +		    const struct dim_sample *end,
>  		    struct dim_stats *curr_stats);
>
>  /**
>   *	dim_update_sample - set a sample's fields with given values
>   *	@event_ctr: number of events to set
> diff --git a/lib/dim/dim.c b/lib/dim/dim.c
> index 83b65ac74d73..97c3d084ebf0 100644
> --- a/lib/dim/dim.c
> +++ b/lib/dim/dim.c
> @@ -52,11 +52,12 @@ void dim_park_tired(struct dim *dim)
>  	dim->steps_left   = 0;
>  	dim->tune_state   = DIM_PARKING_TIRED;
>  }
>  EXPORT_SYMBOL(dim_park_tired);
>
> -bool dim_calc_stats(struct dim_sample *start, struct dim_sample *end,
> +bool dim_calc_stats(const struct dim_sample *start,
> +		    const struct dim_sample *end,
>  		    struct dim_stats *curr_stats)
>  {
>  	/* u32 holds up to 71 minutes, should be enough */
>  	u32 delta_us = ktime_us_delta(end->time, start->time);
>  	u32 npkts = BIT_GAP(BITS_PER_TYPE(u32), end->pkt_ctr, start->pkt_ctr);
> --
> 2.45.2
>

