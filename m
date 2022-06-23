Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A9E9C43334
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Jun 2022 12:11:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wxC8TAjOZLBuCo4Md3+d4atAjdbW7vWR7SLF//7abmE=; b=jwVb7WUbUHHhEtgA7t0xd+UW5G
	YLV+ZZgAT2oUlCG6rUpF4aXJsC7BBMwa9Ys9CpPE4Srbpoga6WAYCStEuTMxfJWS2QAuHntfegp9d
	rxjZ0uCVHP02VvXmGDEqHmvxOpt+0jVljUiPIEab2aAjJe4eJYZF2uJ/amYzmpsgCYb/916VxwwPP
	aEAQ8+SZnYPR3XfB6e2HrFY/7351v509v5KhZgk6fAumxS7D70uc4zOt/sOyzwNK+91pQLjrVMv/B
	nR1cYAcGgtAk6k/0vtUGbz4gFzI9JUWeXvhEBuCcIHj6Ckf7jcNRPWgHu/Na/8eHzmuwC5RHsLKnN
	aL4NMntA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4LgE-00Eusx-SU; Thu, 23 Jun 2022 12:11:26 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4LVY-00EpTx-90; Thu, 23 Jun 2022 12:00:25 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id E87B5B82281;
	Thu, 23 Jun 2022 12:00:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96CADC3411B;
	Thu, 23 Jun 2022 12:00:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1655985621;
	bh=ArSOh3sXDik/3uQIsYcRTOicf6ioF0mn94WmvclKRx0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HUtCKhSR5dJOEQabNBIy9YqpVCT7onPc3LN2njCaXiH9Few9vMSNZjfBIhovRw0Co
	 aRwEmj5r4NMKLUgWR0SOBXHI/g99MknjPpbxdKcTLrH+4PmpEolKInBH6Hwbod8nSo
	 ajzYp3c/lwoZgWxRWgUOsfrsCY0JPxkR5DF0+8SlA9O5pipj/Mo/FlmjW9OPZc83xZ
	 3LWhGQoSByuVBUR/UNsVf4KZgcWew7+I9rC1U75vWT82xSNvMvzHwxKnRAuURh+xEI
	 KRgewzZlyduOSMJu3DyXVnEeq4G8iocQ/Tf7EyvE+XxnqCBPPJMxeW0zOWCNzpnTzN
	 aa4eDojZNF7rQ==
Received: from johan by xi.lan with local (Exim 4.94.2)
	(envelope-from <johan@kernel.org>)
	id 1o4LVM-0002S1-KV; Thu, 23 Jun 2022 14:00:13 +0200
Date: Thu, 23 Jun 2022 14:00:12 +0200
From: Johan Hovold <johan@kernel.org>
To: Macpaul Lin <macpaul.lin@mediatek.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Miles Chen <miles.chen@mediatek.com>,
	Bear Wang <bear.wang@mediatek.com>,
	Pablo Sun <pablo.sun@mediatek.com>,
	Mediatek WSD Upstream <wsd_upstream@mediatek.com>,
	Macpaul Lin <macpaul@gmail.com>, stable@vger.kernel.org,
	Ballon Shi <ballon.shi@quectel.com>
Subject: Re: [PATCH v2] USB: serial: option: add Quectel RM500K module support
Message-ID: <YrRVzHktW3oelFaA@hovoldconsulting.com>
References: <20220623035214.20124-1-macpaul.lin@mediatek.com>
 <20220623085644.13105-1-macpaul.lin@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220623085644.13105-1-macpaul.lin@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220623_050024_512101_764D7001 
X-CRM114-Status: GOOD (  14.79  )
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

On Thu, Jun 23, 2022 at 04:56:44PM +0800, Macpaul Lin wrote:
> Add usb product id of the Quectel RM500K module.
> 
> RM500K provides 2 mandatory interfaces to Linux host after enumeration.
>  - /dev/ttyUSB5: this is a serial interface for control path. User needs
>    to write AT commands to this device node to query status, set APN,
>    set PIN code, and enable/disable the data connection to 5G network.
>  - ethX: this is the data path provided as a RNDIS devices. After the
>    data connection has been established, Linux host can access 5G data
>    network via this interface.
> 
> "RNDIS": RNDIS + ADB + AT (/dev/ttyUSB5) + MODEM COMs
> 
> usb-devices output for 0x7001:

> Co-developed-by: Ballon Shi <ballon.shi@quectel.com>
> Signed-off-by: Ballon Shi <ballon.shi@quectel.com>
> Signed-off-by: Macpaul Lin <macpaul.lin@mediatek.com>
> Cc: stable@vger.kernel.org
> ---
> Change for v2:
>  - Update USB interfaces descriptions in the commit message.
>  - Fix typo, format and contributers in the commit message.
>  - Update PID definition in numeric order.

Thanks for the update. Now applied.

Johan

