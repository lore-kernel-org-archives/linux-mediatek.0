Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E323CD767F1
	for <linux-mediatek@archiver.kernel.org>; Thu, 31 Oct 2024 17:25:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SKkFDkzIEBItD3yNbuSEm7Az14lr6rR23lccwnGeVnE=; b=ErGzidkZt1KNdS6Zf2bXIgoh9U
	znUzKZgAmGBbbdvTU/rvQqP9Mi/HFCorv0/QsxifIvuS1Aryz0fWxA04P4nPIP43Dj/AJk3DHWe+x
	c8I4qVXFIzb5I3SdxmwkM0qMr8b0jNSvpeUbrR3oDS+0oJXbKyr4ctUTm/y3Ga9lKxqgvfII1oAG1
	hqF/UUGhgdzB3Cg+zKptrEdztnw4IHOIMCE/QzAlNEK6JhVc14/Cvn7KkAZ/8kHbQ8I/g0wqWwqqu
	dhzGui35K44UnycTfO+LVZicF1QEKOCrt53MVFPU1/da3bR5WoxWdChz/5qy+P1eTsdu7MLYE76Mt
	rMi+1+rA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6Yv1-00000004KzY-3Bf7;
	Thu, 31 Oct 2024 17:25:11 +0000
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6Yq7-00000004KR8-3Nqe
	for linux-mediatek@lists.infradead.org;
	Thu, 31 Oct 2024 17:20:09 +0000
Received: by mail-pj1-x1033.google.com with SMTP id 98e67ed59e1d1-2e2b4110341so132591a91.1
        for <linux-mediatek@lists.infradead.org>; Thu, 31 Oct 2024 10:20:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1730395206; x=1731000006; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SKkFDkzIEBItD3yNbuSEm7Az14lr6rR23lccwnGeVnE=;
        b=LbfVWJdIgSh92i+R8ZTDOkqYagkaqMR2nBTST4QqTXlzruMD3aB9jS+pd5LWUnjjrm
         54HIyThi5mbl/roV774ERIvdBD3tUbx7poWZJr/2G5ygnWCv2nEF9AYh3nVTZ4LqQKsp
         rze9bUqavS/58sEcpMuYNBpEfLuFwqCyWTI6yo/dNGj6r3973ae30xIB1hMtuvBKdZIq
         UiePypfFs2MeTkyCPYr66mQ/M9OMMbZe/MWpnf4aFQ4JwnZ/mTur3JuE8NlEnvYaliDu
         9OQRyO2MozAkT6TMxzSE+WuieInispMK3HtiCk+oIgPfggZbqFfvWh1RIgmww6qPCtWs
         +8tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730395206; x=1731000006;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SKkFDkzIEBItD3yNbuSEm7Az14lr6rR23lccwnGeVnE=;
        b=YiuQBtygsJ7HE0eikWpvhtGWyD5U+gr/aZL0Pl4nVYsAqOskQvoLN8JDTvtbW8aoz5
         p86SLNo7ZxVAWhfOyVOtV/MspHYvTOedT/TFPhCfXRdfeGFmSs7FB1NdNBTCA+3qcBgm
         WWO8gvqEK3ZOo3X5r6nErPYGYMYdpi3awzJyCoh2uagA/thYFf+Oi07bd9MjPhZKf1oB
         cs0iRzCMgzKnfeTu9+1Z0/oNGkioTOnDGkoJZG8WQsCsEsow/ahFBb7E093/cUNxmMkx
         zHfiWUztU13wVoQXLhrglMf60s9Ou2Mkicl/l6keCkmPnbIkIUa+suOWEMSWAKcTeboq
         Z0vw==
X-Forwarded-Encrypted: i=1; AJvYcCUnEUOicco3PJVWBc8ncTQlekYJTcHr063VPn+EkkqKii8HloBkg8D9Xawdc2xAH/Q/dxdbnAFD/q8ptRE0UA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwK3ND+ghBKKrbhwFtwOLCzS68QF2g+ZsF0HkawKvHcHE7JFSvC
	fei9sKSJiezLpUU35AhR4JOF8gAlnaC5mNkqbpBxOAkIFxjzciTOrMZm5DIaYDoWUBUJQs7X0q0
	cDQkDab0Ys908VWOZrn4UcTBKoeCTDbDW1cL2nQ==
X-Google-Smtp-Source: AGHT+IH6t05mbCPluyw/Zm7bZ8Y86vIuSvJgupQimK2c7oAZcHqEQQGqxSncMtgAi8PvmdylJnQUlmy+Sc53Mt/5SYg=
X-Received: by 2002:a17:90b:3003:b0:2e2:b45d:bbb9 with SMTP id
 98e67ed59e1d1-2e8f11bfd7bmr9879885a91.6.1730395206352; Thu, 31 Oct 2024
 10:20:06 -0700 (PDT)
MIME-Version: 1.0
References: <20241031002326.3426181-1-csander@purestorage.com>
 <20241031002326.3426181-2-csander@purestorage.com> <ZyN8xpq5C36Tg9rz@LouisNoVo>
In-Reply-To: <ZyN8xpq5C36Tg9rz@LouisNoVo>
From: Caleb Sander <csander@purestorage.com>
Date: Thu, 31 Oct 2024 10:19:55 -0700
Message-ID: <CADUfDZoba9hNOBU7TT+0K6BYiYzVkZ_awt751g6HBm+-cCZf8w@mail.gmail.com>
Subject: Re: [resend PATCH 2/2] dim: pass dim_sample to net_dim() by reference
To: Louis Peens <louis.peens@corigine.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Arthur Kiyanovski <akiyano@amazon.com>, Brett Creeley <brett.creeley@amd.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Claudiu Manoil <claudiu.manoil@nxp.com>, 
	David Arinzon <darinzon@amazon.com>, "David S. Miller" <davem@davemloft.net>, 
	Doug Berger <opendmb@gmail.com>, Eric Dumazet <edumazet@google.com>, 
	=?UTF-8?Q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>, 
	Felix Fietkau <nbd@nbd.name>, Florian Fainelli <florian.fainelli@broadcom.com>, 
	Geetha sowjanya <gakula@marvell.com>, hariprasad <hkelam@marvell.com>, 
	Jakub Kicinski <kuba@kernel.org>, Jason Wang <jasowang@redhat.com>, Jonathan Corbet <corbet@lwn.net>, 
	Leon Romanovsky <leon@kernel.org>, Lorenzo Bianconi <lorenzo@kernel.org>, 
	Mark Lee <Mark-MC.Lee@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	Michael Chan <michael.chan@broadcom.com>, "Michael S. Tsirkin" <mst@redhat.com>, 
	Noam Dagan <ndagan@amazon.com>, Paolo Abeni <pabeni@redhat.com>, 
	Przemek Kitszel <przemyslaw.kitszel@intel.com>, Roy Pledge <Roy.Pledge@nxp.com>, 
	Saeed Bishara <saeedb@amazon.com>, Saeed Mahameed <saeedm@nvidia.com>, 
	Sean Wang <sean.wang@mediatek.com>, Shannon Nelson <shannon.nelson@amd.com>, 
	Shay Agroskin <shayagr@amazon.com>, Simon Horman <horms@kernel.org>, 
	Subbaraya Sundeep <sbhatta@marvell.com>, Sunil Goutham <sgoutham@marvell.com>, 
	Tal Gilboa <talgi@nvidia.com>, Tariq Toukan <tariqt@nvidia.com>, 
	Tony Nguyen <anthony.l.nguyen@intel.com>, Vladimir Oltean <vladimir.oltean@nxp.com>, 
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>, intel-wired-lan@lists.osuosl.org, 
	linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linuxppc-dev@lists.ozlabs.org, linux-rdma@vger.kernel.org, 
	netdev@vger.kernel.org, oss-drivers@corigine.com, 
	virtualization@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241031_102007_929482_5962633D 
X-CRM114-Status: GOOD (  24.09  )
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

On Thu, Oct 31, 2024 at 5:49=E2=80=AFAM Louis Peens <louis.peens@corigine.c=
om> wrote:
>
> On Wed, Oct 30, 2024 at 06:23:26PM -0600, Caleb Sander Mateos wrote:
> > net_dim() is currently passed a struct dim_sample argument by value.
> > struct dim_sample is 24 bytes. Since this is greater 16 bytes, x86-64
> > passes it on the stack. All callers have already initialized dim_sample
> > on the stack, so passing it by value requires pushing a duplicated copy
> > to the stack. Either witing to the stack and immediately reading it, or
> > perhaps dereferencing addresses relative to the stack pointer in a chai=
n
> > of push instructions, seems to perform quite poorly.
> >
> > In a heavy TCP workload, mlx5e_handle_rx_dim() consumes 3% of CPU time,
> > 94% of which is attributed to the first push instruction to copy
> > dim_sample on the stack for the call to net_dim():
> > // Call ktime_get()
> >   0.26 |4ead2:   call   4ead7 <mlx5e_handle_rx_dim+0x47>
> > // Pass the address of struct dim in %rdi
> >        |4ead7:   lea    0x3d0(%rbx),%rdi
> > // Set dim_sample.pkt_ctr
> >        |4eade:   mov    %r13d,0x8(%rsp)
> > // Set dim_sample.byte_ctr
> >        |4eae3:   mov    %r12d,0xc(%rsp)
> > // Set dim_sample.event_ctr
> >   0.15 |4eae8:   mov    %bp,0x10(%rsp)
> > // Duplicate dim_sample on the stack
> >  94.16 |4eaed:   push   0x10(%rsp)
> >   2.79 |4eaf1:   push   0x10(%rsp)
> >   0.07 |4eaf5:   push   %rax
> > // Call net_dim()
> >   0.21 |4eaf6:   call   4eafb <mlx5e_handle_rx_dim+0x6b>
> >
> > To allow the caller to reuse the struct dim_sample already on the stack=
,
> > pass the struct dim_sample by reference to net_dim().
> >
> > Signed-off-by: Caleb Sander Mateos <csander@purestorage.com>
> > ---
> >  Documentation/networking/net_dim.rst                   |  2 +-
> >  drivers/net/ethernet/amazon/ena/ena_netdev.c           |  2 +-
> >  drivers/net/ethernet/broadcom/bcmsysport.c             |  2 +-
> >  drivers/net/ethernet/broadcom/bnxt/bnxt.c              |  4 ++--
> >  drivers/net/ethernet/broadcom/genet/bcmgenet.c         |  2 +-
> >  drivers/net/ethernet/freescale/enetc/enetc.c           |  2 +-
> >  drivers/net/ethernet/hisilicon/hns3/hns3_enet.c        |  4 ++--
> >  drivers/net/ethernet/intel/ice/ice_txrx.c              |  4 ++--
> >  drivers/net/ethernet/intel/idpf/idpf_txrx.c            |  4 ++--
> >  drivers/net/ethernet/marvell/octeontx2/nic/otx2_txrx.c |  2 +-
> >  drivers/net/ethernet/mediatek/mtk_eth_soc.c            |  4 ++--
> >  drivers/net/ethernet/mellanox/mlx5/core/en_txrx.c      |  4 ++--
> >  drivers/net/ethernet/netronome/nfp/nfd3/dp.c           |  4 ++--
> >  drivers/net/ethernet/netronome/nfp/nfdk/dp.c           |  4 ++--
> >  drivers/net/ethernet/pensando/ionic/ionic_txrx.c       |  2 +-
> >  drivers/net/virtio_net.c                               |  2 +-
> >  drivers/soc/fsl/dpio/dpio-service.c                    |  2 +-
> >  include/linux/dim.h                                    |  2 +-
> >  lib/dim/net_dim.c                                      | 10 +++++-----
> >  19 files changed, 31 insertions(+), 31 deletions(-)
> >
> --- snip --
>
> > diff --git a/drivers/net/ethernet/netronome/nfp/nfd3/dp.c b/drivers/net=
/ethernet/netronome/nfp/nfd3/dp.c
> > index d215efc6cad0..f1c6c47564b1 100644
> > --- a/drivers/net/ethernet/netronome/nfp/nfd3/dp.c
> > +++ b/drivers/net/ethernet/netronome/nfp/nfd3/dp.c
> > @@ -1177,11 +1177,11 @@ int nfp_nfd3_poll(struct napi_struct *napi, int=
 budget)
> >                       pkts =3D r_vec->rx_pkts;
> >                       bytes =3D r_vec->rx_bytes;
> >               } while (u64_stats_fetch_retry(&r_vec->rx_sync, start));
> >
> >               dim_update_sample(r_vec->event_ctr, pkts, bytes, &dim_sam=
ple);
> > -             net_dim(&r_vec->rx_dim, dim_sample);
> > +             net_dim(&r_vec->rx_dim, &dim_sample);
> >       }
> >
> >       if (r_vec->nfp_net->tx_coalesce_adapt_on && r_vec->tx_ring) {
> >               struct dim_sample dim_sample =3D {};
> >               unsigned int start;
> > @@ -1192,11 +1192,11 @@ int nfp_nfd3_poll(struct napi_struct *napi, int=
 budget)
> >                       pkts =3D r_vec->tx_pkts;
> >                       bytes =3D r_vec->tx_bytes;
> >               } while (u64_stats_fetch_retry(&r_vec->tx_sync, start));
> >
> >               dim_update_sample(r_vec->event_ctr, pkts, bytes, &dim_sam=
ple);
> > -             net_dim(&r_vec->tx_dim, dim_sample);
> > +             net_dim(&r_vec->tx_dim, &dim_sample);
> >       }
> >
> >       return pkts_polled;
> >  }
> >
> > diff --git a/drivers/net/ethernet/netronome/nfp/nfdk/dp.c b/drivers/net=
/ethernet/netronome/nfp/nfdk/dp.c
> > index dae5af7d1845..ebeb6ab4465c 100644
> > --- a/drivers/net/ethernet/netronome/nfp/nfdk/dp.c
> > +++ b/drivers/net/ethernet/netronome/nfp/nfdk/dp.c
> > @@ -1287,11 +1287,11 @@ int nfp_nfdk_poll(struct napi_struct *napi, int=
 budget)
> >                       pkts =3D r_vec->rx_pkts;
> >                       bytes =3D r_vec->rx_bytes;
> >               } while (u64_stats_fetch_retry(&r_vec->rx_sync, start));
> >
> >               dim_update_sample(r_vec->event_ctr, pkts, bytes, &dim_sam=
ple);
> > -             net_dim(&r_vec->rx_dim, dim_sample);
> > +             net_dim(&r_vec->rx_dim, &dim_sample);
> >       }
> >
> >       if (r_vec->nfp_net->tx_coalesce_adapt_on && r_vec->tx_ring) {
> >               struct dim_sample dim_sample =3D {};
> >               unsigned int start;
> > @@ -1302,11 +1302,11 @@ int nfp_nfdk_poll(struct napi_struct *napi, int=
 budget)
> >                       pkts =3D r_vec->tx_pkts;
> >                       bytes =3D r_vec->tx_bytes;
> >               } while (u64_stats_fetch_retry(&r_vec->tx_sync, start));
> >
> >               dim_update_sample(r_vec->event_ctr, pkts, bytes, &dim_sam=
ple);
> > -             net_dim(&r_vec->tx_dim, dim_sample);
> > +             net_dim(&r_vec->tx_dim, &dim_sample);
> >       }
> >
> >       return pkts_polled;
> >  }
> --- snip ---
>
> Hi Caleb. Looks like a fair enough update to me in general, but I am not =
an
> expert on 'dim'. For the corresponding nfp driver changes feel free to ad=
d:
>
> Signed-off-by: Louis Peens <louis.peens@corigine.com>

Hi Louis,
Thanks for the review. Did you mean "Reviewed-by"? If there was a
change you were suggesting, I missed it.

Best,
Caleb

