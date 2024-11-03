Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4B3AD11186
	for <linux-mediatek@archiver.kernel.org>; Mon,  4 Nov 2024 00:16:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vbZ+uzGqdW4hX03Xi3d7fgtT2grFuBySNiXCV4fiIF8=; b=G57DOA4FR7FneltKBTJqSJe/sN
	wAZbiu6ffpH6OHgwkAY5tSplOU+ZYrZZCXcL46jjOax/jKHHCO7E52QxDFD4XX/eK3cwkAG/ceglo
	FXJ76gUmJ2fxt1GkbgBfd80J86yaZNMQSr206nGIE6asUwaKP2q+0FzWWbrFKq2R2roZ75+QyPWtg
	MCxX5BmFugDDdAqqxF4UbjvvCf5anrbxGE+Ns/Edb6gcWfQ8sUTBLtZVhnXnbY3oAGjbFRQn0UyFz
	mnhxtMUJoG82lYxBR9zoyd53JcbGWWiiltAVNFECleR/KQfFhxEv/9tpIjjsZrFpaJtKhhdmor6yW
	sMO4SB3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t7klI-0000000CIKh-0J6T;
	Mon, 04 Nov 2024 00:16:04 +0000
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t7jQz-0000000CCVy-2ULx
	for linux-mediatek@lists.infradead.org;
	Sun, 03 Nov 2024 22:51:06 +0000
Received: by mail-pj1-x1033.google.com with SMTP id 98e67ed59e1d1-2e2b71fd16fso353240a91.3
        for <linux-mediatek@lists.infradead.org>; Sun, 03 Nov 2024 14:51:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1730674259; x=1731279059; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vbZ+uzGqdW4hX03Xi3d7fgtT2grFuBySNiXCV4fiIF8=;
        b=dBBjIAUsMyC6EvwgLCWETeU25TiM1ylSbqZo74I2tAB+Di1H5KZB944yDey2bvZRgj
         3JBX8HCCwdQs+a8cMxUG9E4W3MFNQhDAxXym79N/dkiLKQs6dE1S0Sn344lgKf9k1qhn
         OClAH2k2HaGUo7AjZkmtLQlNHvNtUg4ttUCPqUJ2KRwBn+E24ob0Gf3EDzPTJomKyXXY
         Si2kOiw3hrm20vxkhSLfAncWasidwZ6ZMfwTHDUKGES8IG94os2aiBXsZkLmJYjCMA3P
         f5OmKMZFq4OgqFZINBo5GpHU970j7g3JiHq65umIZdVY1zQFNTHorQ5S2ahFGryqq/uX
         m9aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730674259; x=1731279059;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vbZ+uzGqdW4hX03Xi3d7fgtT2grFuBySNiXCV4fiIF8=;
        b=VAts3BX5SV2fGbRaiTW7UJUUhyJT+XvfG1Sof4kXwk17C/9b2kCvuXW4No6GETRk7e
         uvXPY1UaulpchFky/D1y98vzhGNdxclXgKAIYDsdecvelvlGPOxXP9IOFjImlrY7JZHM
         K/O088nPaGuT4cqgNx0LrQtXKwPeJbdgdBF1jzRuw1vdHoeNTy3Z+fn4Jb6Cf/ePgsRg
         0LNIoiGBeoK8U2gRZN0lxBeSNENVr5A8QRMEGyJkLfKKBlSx9yP40EsgKeyVc7aZmtx3
         PJkXS8xCBYzIO4iEldvgg891Sw1gnm15kOC7VLrahvxLrEnJGFiBoB6qVzoPWgQh/T92
         Q1wQ==
X-Forwarded-Encrypted: i=1; AJvYcCX33b2o4qktAL75AVw+TrYqTwsloJbnJXKHKDDmCZrnpEGFZhevgX9ogxtNoJU8/MPMHrGBezn/aNQS/QLfbQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzqJkZvIbdF/NmpGEf8+y7kvv6wqSHJEoaAiAg1mYZXyIY32Nw5
	5lvUKjLwVH5754qesKFxSPI0gLnVJUBJ0ujzeu6lrAzzj8iCGcAKcTXT0GtwUzMiHz8sWHj9BeQ
	fgX8hk+i+AeevN0rDbBvKxo+DcUkE87z4y+eP+w==
X-Google-Smtp-Source: AGHT+IFUl1GCcoqWHoZYbz+qEG71KEMvn1Im+9ZYr+neR/oxPoOmgzFQQqZYN0kcHlFEkQf/7jeXNqXwpJVr9GMXuU8=
X-Received: by 2002:a17:90a:e511:b0:2e2:e139:447d with SMTP id
 98e67ed59e1d1-2e8f0d62425mr14589494a91.0.1730674259424; Sun, 03 Nov 2024
 14:50:59 -0800 (PST)
MIME-Version: 1.0
References: <20241031002326.3426181-1-csander@purestorage.com>
 <20241031002326.3426181-2-csander@purestorage.com> <20241103122138.6d0d62f6@kernel.org>
In-Reply-To: <20241103122138.6d0d62f6@kernel.org>
From: Caleb Sander <csander@purestorage.com>
Date: Sun, 3 Nov 2024 14:50:48 -0800
Message-ID: <CADUfDZpBfwGJwhUHCZk8AgZDY0QP3j2dEUHZfC1VkR+75jj2WA@mail.gmail.com>
Subject: Re: [resend PATCH 2/2] dim: pass dim_sample to net_dim() by reference
To: Jakub Kicinski <kuba@kernel.org>
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
	Jason Wang <jasowang@redhat.com>, Jonathan Corbet <corbet@lwn.net>, Leon Romanovsky <leon@kernel.org>, 
	Lorenzo Bianconi <lorenzo@kernel.org>, Louis Peens <louis.peens@corigine.com>, 
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
X-CRM114-CacheID: sfid-20241103_145101_820624_E9C163B4 
X-CRM114-Status: GOOD (  12.78  )
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

On Sun, Nov 3, 2024 at 12:21=E2=80=AFPM Jakub Kicinski <kuba@kernel.org> wr=
ote:
>
> On Wed, 30 Oct 2024 18:23:26 -0600 Caleb Sander Mateos wrote:
> > In a heavy TCP workload, mlx5e_handle_rx_dim() consumes 3% of CPU time,
> > 94% of which is attributed to the first push instruction to copy
> > dim_sample on the stack for the call to net_dim():
>
> Change itself looks fine, so we can apply, but this seems surprising.
> Are you sure this is not just some measurement problem?
> Do you see 3% higher PPS with this change applied?

Agreed, this bottleneck surprised me too. But the CPU profiles clearly
point to this push instruction in mlx5e_handle_rx_dim() being very
hot. My best explanation is that the 2- and 4-byte stores followed
immediately by 8-byte loads from the same addresses cannot be
pipelined effectively. The loads must wait for the stores to complete
before reading back the values they wrote. Ideally the compiler would
recognize that the struct dim_sample local variable is only used to
pass to net_dim() and avoid duplicating it. I guess passing large
structs by value in C is not very common, so there probably isn't as
much effort put into optimizing it.
With the patches applied, the CPU time spent in mlx5e_handle_rx_dim()
(excluding children) drops from 3.14% to 0.08%. Unfortunately, there
are other bottlenecks in the system and 1% variation in the throughput
is typical, so the patches don't translate into a clear 3% increase in
throughput.

Best,
Caleb

