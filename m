Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3579ED1118C
	for <linux-mediatek@archiver.kernel.org>; Sun,  3 Nov 2024 20:21:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8Ukc+M8CZYwlrpkjWIRwsZhzje/hVh2caYXefeqy6UU=; b=ranIz8dgPicOsN82HQ/gFcfHpr
	vP76YAeDVrAPAiXN8wkl5IidQtfGfMKGpTbP03H5z8d9TcPFmLUO0z3OJOc0MjJE/SDbT+pjMxoy+
	jFaIaragUJGSHZx4W60Z7oh5OT/lp6g1QPqnl6RSJfKPAV4u8yj4GHEscJqjFKeYQZtsX+BcKh9qi
	EiV40nOU8r+fG3F70gcpZ8kOBmzrEwbeA1CHiolldOwFc11hCWfeevLkYPCCsMGsbZRtLhl5Vd7+U
	6r2ge2fgO5X7RjZcgs3Koh4c22xL4TJR1Byykla5yN4aUxPvXTyNupZw7MBDlVKiLr03z0vx9Ke2r
	fkl9iAPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t7h6Y-0000000BzBG-3LeB;
	Sun, 03 Nov 2024 20:21:46 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t7h6V-0000000BzAe-2fIj;
	Sun, 03 Nov 2024 20:21:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id D59F8A41CBB;
	Sun,  3 Nov 2024 20:19:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD122C4CECD;
	Sun,  3 Nov 2024 20:21:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730665301;
	bh=8Ukc+M8CZYwlrpkjWIRwsZhzje/hVh2caYXefeqy6UU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=hbPRZL054fJi30LppOH0pHtwRISF1ZSCdVrUtYIu0ppNa8ioEdfJ/dm3YYfLz3NtM
	 FDDzikzL4fj4/2tA7J1E2L9mrUIuRitDbxRchOPRHLYcpY+eVOIJJUF/2sw3Nv+KC/
	 MkKYL5CoKKRrOmeBncDVf/hgEJBxRSJtwv+KWf1H5OACVRVjFtm4ZhiLiklw82+0AM
	 m+Qj20+jgyR1zDpVDBdBJVbyxI0vaXCMLviA7xAjCakdiPWw7LkGP1wzsNIVt0xcPl
	 p/Kmu0WgZ75pRzFzZgf6IDZpKyq49AkrdXRhOn5GT7MpWMd7DiNlI4obZ4xpQ3JFue
	 qRzwHjaAGgKpw==
Date: Sun, 3 Nov 2024 12:21:38 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Caleb Sander Mateos <csander@purestorage.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Arthur Kiyanovski
 <akiyano@amazon.com>, Brett Creeley <brett.creeley@amd.com>, Broadcom
 internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>, Claudiu Manoil
 <claudiu.manoil@nxp.com>, David Arinzon <darinzon@amazon.com>, "David S.
 Miller" <davem@davemloft.net>, Doug Berger <opendmb@gmail.com>, Eric
 Dumazet <edumazet@google.com>, Eugenio =?UTF-8?B?UMOpcmV6?=
 <eperezma@redhat.com>, Felix Fietkau <nbd@nbd.name>, Florian Fainelli
 <florian.fainelli@broadcom.com>, Geetha sowjanya <gakula@marvell.com>,
 hariprasad <hkelam@marvell.com>, Jason Wang <jasowang@redhat.com>, Jonathan
 Corbet <corbet@lwn.net>, Leon Romanovsky <leon@kernel.org>, Lorenzo
 Bianconi <lorenzo@kernel.org>, Louis Peens <louis.peens@corigine.com>, Mark
 Lee <Mark-MC.Lee@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 Michael Chan <michael.chan@broadcom.com>, "Michael S. Tsirkin"
 <mst@redhat.com>, Noam Dagan <ndagan@amazon.com>, Paolo Abeni
 <pabeni@redhat.com>, Przemek Kitszel <przemyslaw.kitszel@intel.com>, Roy
 Pledge <Roy.Pledge@nxp.com>, Saeed Bishara <saeedb@amazon.com>, Saeed
 Mahameed <saeedm@nvidia.com>, Sean Wang <sean.wang@mediatek.com>, Shannon
 Nelson <shannon.nelson@amd.com>, Shay Agroskin <shayagr@amazon.com>, Simon
 Horman <horms@kernel.org>, Subbaraya Sundeep <sbhatta@marvell.com>, Sunil
 Goutham <sgoutham@marvell.com>, Tal Gilboa <talgi@nvidia.com>, Tariq Toukan
 <tariqt@nvidia.com>, Tony Nguyen <anthony.l.nguyen@intel.com>, Vladimir
 Oltean <vladimir.oltean@nxp.com>, Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
 intel-wired-lan@lists.osuosl.org, linux-arm-kernel@lists.infradead.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 linux-rdma@vger.kernel.org, netdev@vger.kernel.org,
 oss-drivers@corigine.com, virtualization@lists.linux.dev
Subject: Re: [resend PATCH 2/2] dim: pass dim_sample to net_dim() by
 reference
Message-ID: <20241103122138.6d0d62f6@kernel.org>
In-Reply-To: <20241031002326.3426181-2-csander@purestorage.com>
References: <20241031002326.3426181-1-csander@purestorage.com>
	<20241031002326.3426181-2-csander@purestorage.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241103_122143_771682_29A875DC 
X-CRM114-Status: UNSURE (   7.92  )
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

On Wed, 30 Oct 2024 18:23:26 -0600 Caleb Sander Mateos wrote:
> In a heavy TCP workload, mlx5e_handle_rx_dim() consumes 3% of CPU time,
> 94% of which is attributed to the first push instruction to copy
> dim_sample on the stack for the call to net_dim():

Change itself looks fine, so we can apply, but this seems surprising.
Are you sure this is not just some measurement problem?
Do you see 3% higher PPS with this change applied?

