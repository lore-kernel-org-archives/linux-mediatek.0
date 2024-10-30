Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60606D5CC91
	for <linux-mediatek@archiver.kernel.org>; Thu, 31 Oct 2024 00:13:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1gQ9k41W3wMLr1E72MP7qlXIkEHrg2DS7W0/qcJ6WFE=; b=CERUI75lOg/9nW7Ah65XbrRGDo
	JYUks+w1G48w+LeW4+4M9LPjN1DyCatRWFk6W5VFJTv+HLFK37cbsJQPBCktEvCcsUSDZft14GUqR
	vH7p2jS1XDreHwws9pjECGAmL36NEjamGQmqGJD6Q/zT8AZV6v8qswjvgGDKt4U1wloXwoyIIKPfl
	bjL4LoNtY8QwW0BZI7sZbYpW9uJE+HSQoG22AVXNNVhYa1DXcfv69fh+nvKVZxy5zGUNtXUm1lvoB
	eWr3p5IKjCt1Mh7wYplyVlBhwsBoLlYzjq6T3vDkS/Vgq8EgGKQhhbQNU9hki4JEVAv1ICfPXpvPZ
	bUcwwf7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6Io7-000000027kn-2TD7;
	Thu, 31 Oct 2024 00:12:59 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6Io4-000000027k8-0io6;
	Thu, 31 Oct 2024 00:12:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 9B36F5C6FFA;
	Thu, 31 Oct 2024 00:12:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AEA34C4CEF0;
	Wed, 30 Oct 2024 23:48:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730332089;
	bh=Q0wXyQGBlYip/F0j6/woGSioAXOUzqyfPJJC3tkOLK8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=ju76EdaxYrc2VgAjivV0KVt2GMgCCgQhkFEfaJJ6/pgDxTefM1lg4Tf1OWyD6kJF1
	 KPs45HSaTf/dlBDXadIlmKLrd/PTXlvHaEPFN+6htEnDe9la3DhVDjvzJ08pFbHCu1
	 Mi9Dcrl+rhMsrI94lHkbmm+ltjVTd56lvqQYX2iMsa9T1VhTsDaczRIlDIIrjNFfwV
	 BJFkhdoI7ChFFbj0fL95fN0enUv6F2jgu70AtVwj6XP/DlYWjcgdm+p8m6To/KCBGH
	 7u3hKM5vMU2n1gcpbXdQJ1gi5+guUy9KsxG9mMUy4fX4yx/ByjRBAgjJViZhPyf2di
	 YfF8DVjTLFaVg==
Date: Wed, 30 Oct 2024 16:48:05 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Caleb Sander Mateos <csander@purestorage.com>
Cc: Tal Gilboa <talgi@nvidia.com>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Simon
 Horman <horms@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Shay Agroskin
 <shayagr@amazon.com>, Arthur Kiyanovski <akiyano@amazon.com>, David Arinzon
 <darinzon@amazon.com>, Noam Dagan <ndagan@amazon.com>, Saeed Bishara
 <saeedb@amazon.com>, Andrew Lunn <andrew+netdev@lunn.ch>, Florian Fainelli
 <florian.fainelli@broadcom.com>, Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Michael Chan
 <michael.chan@broadcom.com>, Doug Berger <opendmb@gmail.com>, Claudiu
 Manoil <claudiu.manoil@nxp.com>, Vladimir Oltean <vladimir.oltean@nxp.com>,
 Jian Shen <shenjian15@huawei.com>, Salil Mehta <salil.mehta@huawei.com>,
 Jijie Shao <shaojijie@huawei.com>, Tony Nguyen
 <anthony.l.nguyen@intel.com>, Przemek Kitszel
 <przemyslaw.kitszel@intel.com>, Sunil Goutham <sgoutham@marvell.com>,
 Geetha sowjanya <gakula@marvell.com>, Subbaraya Sundeep
 <sbhatta@marvell.com>, hariprasad <hkelam@marvell.com>, Felix Fietkau
 <nbd@nbd.name>, Sean Wang <sean.wang@mediatek.com>, Mark Lee
 <Mark-MC.Lee@mediatek.com>, Lorenzo Bianconi <lorenzo@kernel.org>, Matthias
 Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Saeed Mahameed
 <saeedm@nvidia.com>, Tariq Toukan <tariqt@nvidia.com>, Leon Romanovsky
 <leon@kernel.org>, Louis Peens <louis.peens@corigine.com>, Shannon Nelson
 <shannon.nelson@amd.com>, Brett Creeley <brett.creeley@amd.com>, "Michael
 S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>, Xuan Zhuo
 <xuanzhuo@linux.alibaba.com>, Eugenio =?UTF-8?B?UMOpcmV6?=
 <eperezma@redhat.com>, Roy Pledge <Roy.Pledge@nxp.com>, Christophe Leroy
 <christophe.leroy@csgroup.eu>, netdev@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 intel-wired-lan@lists.osuosl.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-rdma@vger.kernel.org,
 oss-drivers@corigine.com, virtualization@lists.linux.dev,
 linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH 2/2] dim: pass dim_sample to net_dim() by reference
Message-ID: <20241030164805.40408945@kernel.org>
In-Reply-To: <20241030194914.3268865-2-csander@purestorage.com>
References: <20241030194914.3268865-1-csander@purestorage.com>
	<20241030194914.3268865-2-csander@purestorage.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241030_171256_337033_36CB71B2 
X-CRM114-Status: UNSURE (   9.24  )
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

On Wed, 30 Oct 2024 13:49:08 -0600 Caleb Sander Mateos wrote:
> net_dim() is currently passed a struct dim_sample argument by value.
> struct dim_sample is 24 bytes. Since this is greater 16 bytes, x86-64
> passes it on the stack. All callers have already initialized dim_sample
> on the stack, so passing it by value requires pushing a duplicated copy
> to the stack. Either witing to the stack and immediately reading it, or
> perhaps dereferencing addresses relative to the stack pointer in a chain
> of push instructions, seems to perform quite poorly.

Looks like patch 1 didn't get CCed to netdev. Please repost?
-- 
pw-bot: cr

