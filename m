Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EF41C4332F
	for <linux-mediatek@archiver.kernel.org>; Fri, 11 Nov 2022 15:04:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wq2dMBBbpfoxu7oUSOm2/HGCzD75nIwqagIqeipGfCQ=; b=sF3AykQ1w05EARGOzhxTOfDCro
	DllqJI6ZinkpaO6Gh7uDWJL38VBHPiLtYkDpNJtBNsDWTaOf/gVDSPXSCxUgc+s09IALPgv82t1yf
	00J1XknfJE4BSuAkHl2jXs8BqGhg8jv1CniIW+6e0Kgr8uDzUYbmuNh2LswGjcRUJMkoplIujgR0E
	RoK7kSmAkdIS+1jAwZm7YqDChStyUnXT05Tx27qBh8TeJnLj6r0S++pbKf07UxlOEgCz2x2XA/hn4
	R5kV89oXgW5NIhLBBSqfefE/ahrAMAWt2jCOE8BPJs+Y7Jau6q8hX1Ao21mX4Q9sJdsqTEgV37DNl
	OcAO8sPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1otVZf-00GQWI-3R; Fri, 11 Nov 2022 15:04:07 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1otVXl-00GPVS-Vq; Fri, 11 Nov 2022 15:02:11 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 3CE6161FE6;
	Fri, 11 Nov 2022 15:02:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 285ECC433C1;
	Fri, 11 Nov 2022 15:02:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1668178928;
	bh=RHFd6lZBWi3UidtHgAb7H5B7CyFXKaoJYUnzOJpdDKI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=wZKtfKCvtkAHcRqegBZ5rvf2fSNNT5Jp9nsa7tHBLJ1FunZbXoHExBErfTh3zuzNX
	 r4hkvCOmTK0QrFH0l20rbMnWE8AU+P8nmZyOgzviFZBoh2abXcFzInYkCbLbS13H++
	 MWXzls89wSjwmcEEze0qkRehIsJUzk/MHeWbOui4=
Date: Fri, 11 Nov 2022 16:02:05 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: haozhe.chang@mediatek.com
Cc: M Chetan Kumar <m.chetan.kumar@intel.com>,
	Intel Corporation <linuxwwan@intel.com>,
	Loic Poulain <loic.poulain@linaro.org>,
	Sergey Ryazanov <ryazanov.s.a@gmail.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Stephan Gerhold <stephan@gerhold.net>,
	Chandrashekar Devegowda <chandrashekar.devegowda@intel.com>,
	Chiranjeevi Rapolu <chiranjeevi.rapolu@linux.intel.com>,
	Liu Haijun <haijun.liu@mediatek.com>,
	Ricardo Martinez <ricardo.martinez@linux.intel.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Oliver Neukum <oneukum@suse.com>,
	Shang XiaoJing <shangxiaojing@huawei.com>,
	"open list:INTEL WWAN IOSM DRIVER" <netdev@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>,
	"open list:REMOTE PROCESSOR MESSAGING (RPMSG) WWAN CONTROL..." <linux-remoteproc@vger.kernel.org>,
	"open list:USB SUBSYSTEM" <linux-usb@vger.kernel.org>,
	"moderated list:ARM/Mediatek SoC support" <linux-arm-kernel@lists.infradead.org>,
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
	lambert.wang@mediatek.com, xiayu.zhang@mediatek.com,
	hua.yang@mediatek.com
Subject: Re: [PATCH v3] wwan: core: Support slicing in port TX flow of WWAN
 subsystem
Message-ID: <Y25j7fTdvCRqr26k@kroah.com>
References: <20221111100840.105305-1-haozhe.chang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221111100840.105305-1-haozhe.chang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221111_070210_135118_BF595BB2 
X-CRM114-Status: GOOD (  24.27  )
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

On Fri, Nov 11, 2022 at 06:08:36PM +0800, haozhe.chang@mediatek.com wrote:
> From: haozhe chang <haozhe.chang@mediatek.com>
> 
> wwan_port_fops_write inputs the SKB parameter to the TX callback of
> the WWAN device driver. However, the WWAN device (e.g., t7xx) may
> have an MTU less than the size of SKB, causing the TX buffer to be
> sliced and copied once more in the WWAN device driver.
> 
> This patch implements the slicing in the WWAN subsystem and gives
> the WWAN devices driver the option to slice(by frag_len) or not. By
> doing so, the additional memory copy is reduced.
> 
> Meanwhile, this patch gives WWAN devices driver the option to reserve
> headroom in fragments for the device-specific metadata.
> 
> Signed-off-by: haozhe chang <haozhe.chang@mediatek.com>
> 
> ---
> Changes in v2
>   -send fragments to device driver by skb frag_list.
> 
> Changes in v3
>   -move frag_len and headroom_len setting to wwan_create_port.
> ---
>  drivers/net/wwan/iosm/iosm_ipc_port.c  |  3 +-
>  drivers/net/wwan/mhi_wwan_ctrl.c       |  2 +-
>  drivers/net/wwan/rpmsg_wwan_ctrl.c     |  2 +-
>  drivers/net/wwan/t7xx/t7xx_port_wwan.c | 34 +++++++--------
>  drivers/net/wwan/wwan_core.c           | 59 ++++++++++++++++++++------
>  drivers/net/wwan/wwan_hwsim.c          |  2 +-
>  drivers/usb/class/cdc-wdm.c            |  2 +-
>  include/linux/wwan.h                   |  6 ++-
>  8 files changed, 73 insertions(+), 37 deletions(-)
> 
> diff --git a/drivers/net/wwan/iosm/iosm_ipc_port.c b/drivers/net/wwan/iosm/iosm_ipc_port.c
> index b6d81c627277..dc43b8f0d1af 100644
> --- a/drivers/net/wwan/iosm/iosm_ipc_port.c
> +++ b/drivers/net/wwan/iosm/iosm_ipc_port.c
> @@ -63,7 +63,8 @@ struct iosm_cdev *ipc_port_init(struct iosm_imem *ipc_imem,
>  	ipc_port->ipc_imem = ipc_imem;
>  
>  	ipc_port->iosm_port = wwan_create_port(ipc_port->dev, port_type,
> -					       &ipc_wwan_ctrl_ops, ipc_port);
> +					       &ipc_wwan_ctrl_ops, 0, 0,
> +					       ipc_port);

How is 0, 0 a valid option here?

and if it is a valid option, shouldn't you just have 2 different
functions, one that needs these values and one that does not?  That
would make it more descriptive as to what those options are, and ensure
that you get them right.

> @@ -112,7 +117,6 @@ void wwan_port_rx(struct wwan_port *port, struct sk_buff *skb);
>   */
>  void wwan_port_txoff(struct wwan_port *port);
>  
> -
>  /**

Unneeded change.

thanks,

greg k-h

