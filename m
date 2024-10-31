Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF66AD767F7
	for <linux-mediatek@archiver.kernel.org>; Thu, 31 Oct 2024 18:28:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:CC:To:From:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ecc7x6z5tBSynVvbhNaEuzIQivszgPRWP9c+1MOAWAs=; b=Hh98+mulGx0GNXwzhR0gZVJGHi
	3WlQzgkNpX5UOrMqEygBXuPSCwMsM2vlNIbrMBk7V+Tost+RAo983/95M7jVYC0rll9bKURawJiIs
	s6jnZoCsKUumwgdCCPc6RkAU+vFbyvLJIuJC7SyGtauG1na7VCHnGApkaoxPJE7miSjhDWw60Mh8S
	k6BFoD6KLQsSww3zegtIPFyOX/G+XIMz2OUxQK0nJhgvwDrGZg+xv7pRUE7kbI42dPY/asCW3pA5i
	5EOtnvJFRBgNVgawFu2WKokhnHBJf+tun78mtPNrv+5lJKlQcTHyXZDJBM5QM9S/Wc08/G/iTDBrM
	PVA20+3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6ZuV-00000004V76-3IZ4;
	Thu, 31 Oct 2024 18:28:43 +0000
Received: from smtp-fw-6001.amazon.com ([52.95.48.154])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6ZuS-00000004V6B-21bg;
	Thu, 31 Oct 2024 18:28:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1730399321; x=1761935321;
  h=from:to:cc:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version:subject;
  bh=ecc7x6z5tBSynVvbhNaEuzIQivszgPRWP9c+1MOAWAs=;
  b=LZEhQejfVNlFmMtdT//BgXQDB1kQTE0GlvpcvQAfClzq0TyzNuszLcz9
   Y0EvlyVa+GuzF8e4MRK2RnBr7I6j3IslJu9hQY0G8I32k7Ys30J69lsJ6
   VEXMP0/kYarbfV+UoJTz0r6hR+BBFViI950VBs1blc4kDP8yLN3ibitCw
   c=;
X-IronPort-AV: E=Sophos;i="6.11,247,1725321600"; 
   d="scan'208";a="436222997"
Subject: RE: [resend PATCH 2/2] dim: pass dim_sample to net_dim() by reference
Thread-Topic: [resend PATCH 2/2] dim: pass dim_sample to net_dim() by reference
Received: from iad12-co-svc-p1-lb1-vlan2.amazon.com (HELO smtpout.prod.us-west-2.prod.farcaster.email.amazon.dev) ([10.43.8.2])
  by smtp-border-fw-6001.iad6.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2024 18:28:34 +0000
Received: from EX19MTAEUC002.ant.amazon.com [10.0.10.100:34386]
 by smtpin.naws.eu-west-1.prod.farcaster.email.amazon.dev [10.0.16.73:2525] with esmtp (Farcaster)
 id 86134643-d973-4b41-85cd-ca98a4e48a9d; Thu, 31 Oct 2024 18:28:32 +0000 (UTC)
X-Farcaster-Flow-ID: 86134643-d973-4b41-85cd-ca98a4e48a9d
Received: from EX19D005EUA004.ant.amazon.com (10.252.50.241) by
 EX19MTAEUC002.ant.amazon.com (10.252.51.181) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1258.34;
 Thu, 31 Oct 2024 18:28:32 +0000
Received: from EX19D022EUA002.ant.amazon.com (10.252.50.201) by
 EX19D005EUA004.ant.amazon.com (10.252.50.241) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1258.35;
 Thu, 31 Oct 2024 18:28:31 +0000
Received: from EX19D022EUA002.ant.amazon.com ([fe80::7f87:7d63:def0:157d]) by
 EX19D022EUA002.ant.amazon.com ([fe80::7f87:7d63:def0:157d%3]) with mapi id
 15.02.1258.034; Thu, 31 Oct 2024 18:28:31 +0000
From: "Kiyanovski, Arthur" <akiyano@amazon.com>
To: Caleb Sander Mateos <csander@purestorage.com>, Andrew Lunn
	<andrew+netdev@lunn.ch>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Brett Creeley
	<brett.creeley@amd.com>, Broadcom internal kernel review list
	<bcm-kernel-feedback-list@broadcom.com>, Christophe Leroy
	<christophe.leroy@csgroup.eu>, Claudiu Manoil <claudiu.manoil@nxp.com>,
	"Arinzon, David" <darinzon@amazon.com>, "David S. Miller"
	<davem@davemloft.net>, Doug Berger <opendmb@gmail.com>, Eric Dumazet
	<edumazet@google.com>, =?iso-8859-1?Q?Eugenio_P=E9rez?=
	<eperezma@redhat.com>, Felix Fietkau <nbd@nbd.name>, Florian Fainelli
	<florian.fainelli@broadcom.com>, Geetha sowjanya <gakula@marvell.com>,
	hariprasad <hkelam@marvell.com>, Jakub Kicinski <kuba@kernel.org>, Jason Wang
	<jasowang@redhat.com>, Jonathan Corbet <corbet@lwn.net>, Leon Romanovsky
	<leon@kernel.org>, Lorenzo Bianconi <lorenzo@kernel.org>, Louis Peens
	<louis.peens@corigine.com>, Mark Lee <Mark-MC.Lee@mediatek.com>, "Matthias
 Brugger" <matthias.bgg@gmail.com>, Michael Chan <michael.chan@broadcom.com>,
	"Michael S. Tsirkin" <mst@redhat.com>, "Dagan, Noam" <ndagan@amazon.com>,
	Paolo Abeni <pabeni@redhat.com>, Przemek Kitszel
	<przemyslaw.kitszel@intel.com>, Roy Pledge <Roy.Pledge@nxp.com>, "Bshara,
 Saeed" <saeedb@amazon.com>, Saeed Mahameed <saeedm@nvidia.com>, Sean Wang
	<sean.wang@mediatek.com>, Shannon Nelson <shannon.nelson@amd.com>, "Agroskin,
 Shay" <shayagr@amazon.com>, Simon Horman <horms@kernel.org>, "Subbaraya
 Sundeep" <sbhatta@marvell.com>, Sunil Goutham <sgoutham@marvell.com>, "Tal
 Gilboa" <talgi@nvidia.com>, Tariq Toukan <tariqt@nvidia.com>, Tony Nguyen
	<anthony.l.nguyen@intel.com>, Vladimir Oltean <vladimir.oltean@nxp.com>, Xuan
 Zhuo <xuanzhuo@linux.alibaba.com>
CC: "intel-wired-lan@lists.osuosl.org" <intel-wired-lan@lists.osuosl.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-doc@vger.kernel.org"
	<linux-doc@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-mediatek@lists.infradead.org"
	<linux-mediatek@lists.infradead.org>, "linuxppc-dev@lists.ozlabs.org"
	<linuxppc-dev@lists.ozlabs.org>, "linux-rdma@vger.kernel.org"
	<linux-rdma@vger.kernel.org>, "netdev@vger.kernel.org"
	<netdev@vger.kernel.org>, "oss-drivers@corigine.com"
	<oss-drivers@corigine.com>, "virtualization@lists.linux.dev"
	<virtualization@lists.linux.dev>
Thread-Index: AQHbKytOj0WWkTVG4E2tmTmQTyqqDrKhLiag
Date: Thu, 31 Oct 2024 18:28:19 +0000
Deferred-Delivery: Thu, 31 Oct 2024 18:27:59 +0000
Message-ID: <7f494c4ae5a041fbafa4059e85431857@amazon.com>
References: <20241031002326.3426181-1-csander@purestorage.com>
 <20241031002326.3426181-2-csander@purestorage.com>
In-Reply-To: <20241031002326.3426181-2-csander@purestorage.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.106.101.5]
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241031_112840_688456_BE162ACE 
X-CRM114-Status: GOOD (  13.53  )
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

> -----Original Message-----
> From: Caleb Sander Mateos <csander@purestorage.com>
> Sent: Wednesday, October 30, 2024 5:23 PM
>=20
> net_dim() is currently passed a struct dim_sample argument by value.
> struct dim_sample is 24 bytes. Since this is greater 16 bytes, x86-64 pas=
ses it
> on the stack. All callers have already initialized dim_sample on the stac=
k, so
> passing it by value requires pushing a duplicated copy to the stack. Eith=
er
> witing to the stack and immediately reading it, or perhaps dereferencing
> addresses relative to the stack pointer in a chain of push instructions, =
seems
> to perform quite poorly.
>=20
> In a heavy TCP workload, mlx5e_handle_rx_dim() consumes 3% of CPU time,
> 94% of which is attributed to the first push instruction to copy dim_samp=
le on
> the stack for the call to net_dim():
> // Call ktime_get()
>   0.26 |4ead2:   call   4ead7 <mlx5e_handle_rx_dim+0x47>
> // Pass the address of struct dim in %rdi
>        |4ead7:   lea    0x3d0(%rbx),%rdi
> // Set dim_sample.pkt_ctr
>        |4eade:   mov    %r13d,0x8(%rsp)
> // Set dim_sample.byte_ctr
>        |4eae3:   mov    %r12d,0xc(%rsp)
> // Set dim_sample.event_ctr
>   0.15 |4eae8:   mov    %bp,0x10(%rsp)
> // Duplicate dim_sample on the stack
>  94.16 |4eaed:   push   0x10(%rsp)
>   2.79 |4eaf1:   push   0x10(%rsp)
>   0.07 |4eaf5:   push   %rax
> // Call net_dim()
>   0.21 |4eaf6:   call   4eafb <mlx5e_handle_rx_dim+0x6b>
>=20
> To allow the caller to reuse the struct dim_sample already on the stack, =
pass
> the struct dim_sample by reference to net_dim().
>=20
> Signed-off-by: Caleb Sander Mateos <csander@purestorage.com>
> ---

Thank you for this patch.

For the ENA part:

Reviewed-by: Arthur Kiyanovski <akiyano@amazon.com>

Thanks,
Arthur

