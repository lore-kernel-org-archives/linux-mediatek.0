Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C53F606A33A
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Nov 2026 14:50:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=2Xz3eXA9;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=A05tbcK0
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=T2slujxCqhiL/TtLbPV2Q/sOsPxDWPy8sLnJEd7macQ=; b=2Xz3eXA9qXKIr4OoO6bCvFlIkm
	lw8bX5dxdwk/FfrlfjwTiuzzDsq3tT9Wfq91/iFyoIy6/Uyy9ajiiW0B9/eoFK/n+dF+nfiJtH1M3
	+y+2A4IdiHv4D7GNcRrkaL/P6jX53sPKQa4dt5X8t3coR0I/EUU70N4kEx92UwBOTBFZeoiUe7PTv
	B5haX3AIGW2FfN5wKq2ot3R+1+VQ92LI2n2XA9CXXgKk2YOMSEAAxqePnYsom/O2VKmFdqJ/tXYY+
	EhShBOY477ynzl/MOa45AbQsIovzAZqPnL0Vp6wZOKqN2dvbGxTWf1QLjdRSv134p+4wZFrPV1qnJ
	+N6SFx8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQnAq-00000004H2c-0AlZ;
	Tue, 10 Nov 2026 14:50:12 +0000
Received: from mgamail.intel.com ([192.198.163.14])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQnAn-00000004H1o-3EKu;
	Tue, 10 Nov 2026 14:50:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794322210; x=1825858210;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=uVB2hb/dzQMegqJR/q5Ve1qnf38fN2lGeR/LzyMybZ0=;
  b=A05tbcK0dDgvMF6YtwBIhRkIijKgF4LtIemuAVTExsTwFNSOy/icmljF
   G/VrPAGYbUp8Ed4HJL2xmoPYK61WX4n/ziAungFzCdqu6U5AGw1P9TtB5
   +CDVxvnYovXkC+XSvY+BXxABBZOdcZgbqDSSwoaI+kO8FHjobnkPd3yUa
   1yQIvfO/yHhnemNcNGhYwsXKOIbNUiuFt6qvP80Ydd1KC04AbC1vtW89k
   Kj0X5RXqaIUcsuPbyvxHZzvKwyMrD72Kf6Kpa6t+5IEVMFz8yaSTiGDz3
   eeu/hghYxHYwjIfRytOuSkIEd7nQkRqMK8w5SnbLp9FIkTreoK3K154NX
   w==;
X-CSE-ConnectionGUID: RY8U98PjRXmxm8icLZPykA==
X-CSE-MsgGUID: us2EDxVwSAOBmn2IpQ40EQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11961"; a="3102780"
X-IronPort-AV: E=Sophos;i="6.27,206,1787036400"; 
   d="scan'208";a="3102780"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2026 06:50:09 -0800
X-CSE-ConnectionGUID: 6PJl7mS2QpqaIYmHcAXf/A==
X-CSE-MsgGUID: SrOSSITAQHGAwt5w0e5rPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,206,1787036400"; 
   d="scan'208";a="8037500"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa005.jf.intel.com with ESMTP; 10 Nov 2026 06:50:06 -0800
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id A69E499; Tue, 10 Nov 2026 15:50:04 +0100 (CET)
Date: Tue, 10 Nov 2026 15:50:04 +0100
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>
Cc: Mika Westerberg <westeri@kernel.org>,
	Andreas Noever <andreas.noever@gmail.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Sven Peter <sven@kernel.org>,
	Yehezkel Bernat <YehezkelShB@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v2 7/7] thunderbolt: prevent pcie tunnel
 activation/teardown warnings
Message-ID: <20261110145004.GF259790@black.igk.intel.com>
References: <20261110114925.722014-1-chunfeng.yun@mediatek.com>
 <20261110114925.722014-8-chunfeng.yun@mediatek.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261110114925.722014-8-chunfeng.yun@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_065009_854741_B5B2391C 
X-CRM114-Status: GOOD (  27.68  )
X-Spam-Score: -4.2 (----)
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Nov 10, 2026 at 07:48:55PM +0800, Chunfeng Yun wrote:
> When usb4 enter sleep mode, echo 1 to authorized of sysfile,
> will wakeup usb4 driver, but fail to create pcie tunnel, cause
> the warning due to a race condition between router disconnect
> during resume and user authorization

This is hard to understand.

Also PCIe, USB4 and so on.

> 
> [  278.831186] usb4_hi NVDA8100:00: 0:1: is unplugged (state: 7), retrying...
> [  278.943031] usb4_hi NVDA8100:00: 0:1: failed to reach state TB_PORT_UP. Ignoring port...
> [  278.951125] usb4_hi NVDA8100:00: 0:1: lost during suspend, disconnecting
> ...
> [  279.013763] usb4_hi NVDA8100:00: 0:7 <-> 1:9 (PCI): activating
> [  279.019587] usb4_hi NVDA8100:00: activating PCIe Down path from 0:7 to 1:9
> [  279.026468] usb4_hi NVDA8100:00: 1:1: Writing hop 1
> [  279.031335] usb4_hi NVDA8100:00: 1:1:  In HopID: 8 => Out port: 9 Out HopID: 8
> [  279.038546] usb4_hi NVDA8100:00: 1:1:   Weight: 1 Priority: 3 Credits: 32 Drop: 0 PM: 0
> [  279.046536] usb4_hi NVDA8100:00: 1:1:    Counter enabled: 0 Counter index: 2047
> [  279.053834] usb4_hi NVDA8100:00: 1:1:   Flow Control (In/Eg): 1/0 Shared Buffer (In/Eg): 0/0
> [  279.062259] usb4_hi NVDA8100:00: 1:1:   Unknown1: 0x0 Unknown2: 0x0 Unknown3: 0x0
> [  279.069730] ------------[ cut here ]------------
> [  279.074335] usb4_hi NVDA8100:00: PCIe Down path activation failed
> [  279.080426] WARNING: CPU: 5 PID: 2433 at drivers/thunderbolt/path.c:587 tb_path_activate+0x1a4/0x5b0
> ...
> [  279.220285] Call trace:
> [  279.222722]  tb_path_activate+0x1a4/0x5b0 (P)
> [  279.227068]  tb_tunnel_activate+0x140/0x498
> [  279.231241]  tb_tunnel_pci+0x180/0x490
> [  279.234980]  tb_domain_approve_switch+0x74/0xb0
> [  279.239500]  authorized_store+0x214/0x270
> [  279.243498]  dev_attr_store+0x20/0x70
> ...
> [  279.288888] ---[ end trace 0000000000000000 ]---
> [  279.293497] usb4_hi NVDA8100:00: 0:7 <-> 1:9 (PCI): activation failed
> 
> When usb4 enter sleep mode, echo 0 to authorized of sysfile,
> will wakeup usb4 driver, but fail to disconnect pcie due to
> the PCIe tunnel had already been torn down and freed if the port
> is fail to resume,

Please put the steps like:

1) Boot the system, nothing connected.
2) Once booted up, connected device.
3) Authorize PCIe tunnel via echo 1 > ..
...

So that we can see what are the steps you reproduce this. The above is
really hard to follow at least to me.

> 
> [  545.887822] usb4_hi NVDA8100:00: 0:1: is unplugged (state: 7), retrying...
> [  545.998689] usb4_hi NVDA8100:00: 0:1: failed to reach state TB_PORT_UP. Ignoring port...
> [  546.006778] usb4_hi NVDA8100:00: 0:1: lost during suspend, disconnecting
> [  546.013474] usb4_hi NVDA8100:00: 0:4 <-> 1:16 (USB3): deactivating
> [  546.020449] usb4_hi NVDA8100:00: deactivating USB3 Down path from 0:4 to 1:16
> [  546.027959] usb4_hi NVDA8100:00: deactivating USB3 Up path from 1:16 to 0:4
> [  546.035649] usb4_hi NVDA8100:00: 0:7 <-> 1:9 (PCI): deactivating
> [  546.042463] usb4_hi NVDA8100:00: deactivating PCIe Down path from 0:7 to 1:9
> [  546.050320] usb4_hi NVDA8100:00: deactivating PCIe Up path from 1:9 to 0:7
> [  546.057790] usb4_hi NVDA8100:00: 0: TMU: mode change off -> bi-directional, HiFi requested
> [  546.067910] usb4_hi NVDA8100:00: 0: TMU: mode set to: bi-directional, HiFi
> [  546.076120] usb4_hi NVDA8100:00: 0:1: total credits changed 66 -> 66
> [  546.082844] usb4_hi NVDA8100:00: 1: link width set to symmetric, dual lanes
> [  546.089815] ------------[ cut here ]------------
> [  546.094420] WARNING: CPU: 7 PID: 2433 at drivers/thunderbolt/tb.c:2245 tb_disconnect_pci+0x108/0x120
> ...
> [  546.238810] Call trace:
> [  546.241246]  tb_disconnect_pci+0x108/0x120 (P)
> [  546.245680]  tb_domain_disapprove_switch+0x24/0x60
> [  546.250464]  disapprove_switch+0xbc/0xe8
> [  546.254378]  authorized_store+0x19c/0x270
> [  546.258378]  dev_attr_store+0x20/0x70
> ...
> [  546.303767] ---[ end trace 0000000000000000 ]---
> 
> The check prevents a redundant lookup and eliminates the warning
> 
> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> ---
> v2: no changes
> ---
>  drivers/thunderbolt/switch.c | 5 +++++
>  drivers/thunderbolt/tb.c     | 7 +++++++
>  2 files changed, 12 insertions(+)
> 
> diff --git a/drivers/thunderbolt/switch.c b/drivers/thunderbolt/switch.c
> index e12546bfb869..6e9f439ebf3f 100644
> --- a/drivers/thunderbolt/switch.c
> +++ b/drivers/thunderbolt/switch.c
> @@ -1850,6 +1850,11 @@ static int tb_switch_set_authorized(struct tb_switch *sw, unsigned int val)
>  	if (!!sw->authorized == !!val)
>  		goto unlock;
>  
> +	if (sw->is_unplugged) {
> +		ret = -ENODEV;
> +		goto unlock;
> +	}
> +
>  	switch (val) {
>  	/* Disapprove switch */
>  	case 0:
> diff --git a/drivers/thunderbolt/tb.c b/drivers/thunderbolt/tb.c
> index 57c11ba13459..69310622d786 100644
> --- a/drivers/thunderbolt/tb.c
> +++ b/drivers/thunderbolt/tb.c
> @@ -2266,6 +2266,10 @@ static int tb_disconnect_pci(struct tb *tb, struct tb_switch *sw)
>  	struct tb_tunnel *tunnel;
>  	struct tb_port *up;
>  
> +	/* If the switch has already been unplugged, tunnels are already freed */

router

everywhere

> +	if (sw->is_unplugged)
> +		return 0;
> +

Actually I'm thinking that we can just get rid of the WARN_ON()s instead.
If the router is gone we cannot find the upstream port nor the tunnel and
that's fine so just return error instead.

>  	up = tb_switch_find_port(sw, TB_TYPE_PCIE_UP);
>  	if (WARN_ON(!up))
>  		return -ENODEV;
> @@ -2288,6 +2292,9 @@ static int tb_tunnel_pci(struct tb *tb, struct tb_switch *sw)
>  	struct tb_cm *tcm = tb_priv(tb);
>  	struct tb_tunnel *tunnel;
>  
> +	if (sw->is_unplugged)
> +		return -ENODEV;
> +
>  	up = tb_switch_find_port(sw, TB_TYPE_PCIE_UP);
>  	if (!up)
>  		return 0;
> -- 
> 2.45.2

