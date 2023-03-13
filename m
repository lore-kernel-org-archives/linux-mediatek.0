Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFB35C61DA4
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Mar 2023 23:09:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gL3c+nIzz+2dg94HcxfMd8gjHRKKwhDskVMQz416N44=; b=N5eJlPvYI1MIGTGossyIrWUxJk
	cjMES6MLT+aXFiZGwY0sKUglDHXyXMZ5qdLER11Uer6CCREaB+GcYlmoRdgjIedVkhi5ydD5ls+nO
	j/wbCYNkyhgXnKi64MjWPGwaC8gziXISfdD2nH3UDzpJOzolzN6lXg7fQ40Sm9VVg8o5lF3L4kPqm
	5EKvQCliXuzLGcle58fBgcIsDkM7bYIMBi+pr6VYkHWgUVdcCUfm3DudTw0P/z0Vg6tKzdvdX4raH
	nAY4sQ3r4Pd9X2U9QS/g9+jaYyuFbdRODM6ntQskOacDxH4KsHqnis0ZVqU5rQ5zd1CZhhPXAWOKM
	XB5iem3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbrHr-008Hsg-1C; Mon, 13 Mar 2023 23:09:03 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbrHU-008Hm1-IM; Mon, 13 Mar 2023 23:08:43 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id C1EAE6154C;
	Mon, 13 Mar 2023 23:08:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D29FC433D2;
	Mon, 13 Mar 2023 23:08:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678748919;
	bh=sX1ACa8gZtf3/q/1WhrJLcKXpRal2/Mfj8Av3ufc8ns=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Xq2keRQghnMwbefmaBZ6xsMXuSwSa74vY/KqoUPNTulknCK+0G3emZRmqK08+JfQz
	 Wmq5qkpWG3uCeLD9ZJhv0nSjFHXhxM7u7UN4+rPq15yDjUIPdX7y7GjfxAySEV6PzG
	 fU4e/ytmllN6e7nNlxktChKsNno30AqCsbjfYYkkVYtuvLeto49+T9mdv0CjYR6brK
	 hfOY06by5ZFfohpilacFLnv0vrfNxghjWd4mde3IPriMs4PzCKf8OMJRqCk1vb4aJx
	 njMVGgCahhwrPovtJ+/7vMwuXq8nSc3uJtWGB+JeVZqXNHeOp89I70C7XTJxTs3Hq4
	 jwRcs1litggVw==
Date: Mon, 13 Mar 2023 16:08:37 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: <haozhe.chang@mediatek.com>
Cc: M Chetan Kumar <m.chetan.kumar@intel.com>, Intel Corporation
 <linuxwwan@intel.com>, Loic Poulain <loic.poulain@linaro.org>, Sergey
 Ryazanov <ryazanov.s.a@gmail.com>, Johannes Berg
 <johannes@sipsolutions.net>, "David S. Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Stephan
 Gerhold <stephan@gerhold.net>, Chandrashekar Devegowda
 <chandrashekar.devegowda@intel.com>, Chiranjeevi Rapolu
 <chiranjeevi.rapolu@linux.intel.com>, Liu Haijun <haijun.liu@mediatek.com>,
 Ricardo Martinez <ricardo.martinez@linux.intel.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Oliver Neukum <oneukum@suse.com>, Shang XiaoJing
 <shangxiaojing@huawei.com>, "open list:INTEL WWAN IOSM DRIVER"
 <netdev@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, "open
 list:REMOTE PROCESSOR MESSAGING (RPMSG) WWAN CONTROL..."
 <linux-remoteproc@vger.kernel.org>, "open list:USB SUBSYSTEM"
 <linux-usb@vger.kernel.org>, "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>, "moderated list:ARM/Mediatek SoC
 support" <linux-mediatek@lists.infradead.org>, <lambert.wang@mediatek.com>,
 <xiayu.zhang@mediatek.com>, <hua.yang@mediatek.com>
Subject: Re: [PATCH RESEND net-next v7] wwan: core: Support slicing in port
 TX flow of WWAN subsystem
Message-ID: <20230313160837.77f4ced0@kernel.org>
In-Reply-To: <20230308081939.5512-1-haozhe.chang@mediatek.com>
References: <20230308081939.5512-1-haozhe.chang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230313_160840_918287_D536C2BE 
X-CRM114-Status: GOOD (  15.05  )
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

On Wed, 8 Mar 2023 16:19:35 +0800 haozhe.chang@mediatek.com wrote:
>  /**
>   * wwan_create_port - Add a new WWAN port
>   * @parent: Device to use as parent and shared by all WWAN ports
>   * @type: WWAN port type
>   * @ops: WWAN port operations
> + * @frag_len: WWAN port TX fragments length, if WWAN_NO_FRAGMENT is set,
> + *            the WWAN core don't fragment control packages.
> + * @headroom_len: WWAN port TX fragments reserved headroom length, if WWAN_NO_HEADROOM
> + *                is set, the WWAN core don't reserve headroom in control packages.
>   * @drvdata: Pointer to caller driver data
>   *
>   * Allocate and register a new WWAN port. The port will be automatically exposed
> @@ -86,6 +100,8 @@ struct wwan_port_ops {
>  struct wwan_port *wwan_create_port(struct device *parent,
>  				   enum wwan_port_type type,
>  				   const struct wwan_port_ops *ops,
> +				   size_t frag_len,
> +				   unsigned int headroom_len,
>  				   void *drvdata);
>  

Too many arguments, and poor extensibility.
Please wrap the new params into a capability struct:

struct wwan_port_caps {
	unsigned int frag_len;
	unsigned int headroom_len;
};

pass a pointer to this kind of structure in.

Next time someone needs to add a quirk they can just add a field and
won't need to change all the drivers.

