Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DA65C04AA5
	for <linux-mediatek@archiver.kernel.org>; Thu, 25 Aug 2022 11:59:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UPgQT59ss7Oiex8/3VqhVZuGL7jKI3aCyhFsdu63L70=; b=yVdXXxO6W+1QNLn9MhihERLhoI
	TKMic2vRzdStLLtJi04cDZW+AC1wXgVXJJccrwPqp/mFWK60h3TCE9rmxrf6p8V/sR2BcpFIdp0aQ
	PXHH5/o8Dn8jjGBHdVv6nclZuY//oHA+DcRmQdPve+NF2LGep8xHCdXoqefENWWD1nlUoFi2CVSsA
	R2ZuQl4/OtI1f4VMYXxA6FCSi8Vytgw5deucUg7R0rYvF+8e2ctlCVPE98pN8YplSlFnUtnqJ2L6U
	Qvava5+gnK3DPouGqpuTdlSycEF+rqiNDeUmpdEjGnBSDvz1IYRBIHHFZicQHvYAl+nSLKX8zqiGJ
	rtMZcC0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oRBVw-00DA25-59; Thu, 25 Aug 2022 11:59:12 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oRBVt-00D9ve-Kc
	for linux-mediatek@lists.infradead.org; Thu, 25 Aug 2022 11:59:11 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 2897661B11;
	Thu, 25 Aug 2022 11:59:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3782EC433D7;
	Thu, 25 Aug 2022 11:59:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1661428748;
	bh=GLfsjUlNp9WLL2wELbBVeoTLtJbmnVEiPK7O3n+1NV0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mghw3e3sHIr/tw03YSnhgwGtdVUsIfgD4OMxiU0g3yfZzBx6Gt4jvslnRHd3iJebx
	 YY6j1jIqlllKpY3SSU5bnBrasc7WpFTXDKpAFxKLj/psqV/RWOGvcE5smvPCSCrh9h
	 ZgdU8wZLOwJOXSgp94Ad2OxfmDiN6+Na3E6A6uYs=
Date: Thu, 25 Aug 2022 13:59:05 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: sean.wang@mediatek.com
Cc: stable@vger.kernel.org, linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
	Deren Wu <deren.wu@mediatek.com>, Felix Fietkau <nbd@nbd.name>
Subject: Re: [PATCH 5.19] mt76: mt7921: fix command timeout in AP stop period
Message-ID: <YwdkCRXdOZCTdPQl@kroah.com>
References: <94065c608ee60d8a96a3d91913cb1e28d0a302e1.1661397440.git.objelf@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <94065c608ee60d8a96a3d91913cb1e28d0a302e1.1661397440.git.objelf@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220825_045909_744313_FA421A96 
X-CRM114-Status: GOOD (  12.91  )
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

On Thu, Aug 25, 2022 at 11:27:22AM +0800, sean.wang@mediatek.com wrote:
> From: Deren Wu <deren.wu@mediatek.com>
> 
> commit 9d958b60ebc2434f2b7eae83d77849e22d1059eb upstream.
> 
> Due to AP stop improperly, mt7921 driver would face random command timeout
> by chip fw problem. Migrate AP start/stop process to .start_ap/.stop_ap and
> congiure BSS network settings in both hooks.
> 
> The new flow is shown below.
> * AP start
>     .start_ap()
>       configure BSS network resource
>       set BSS to connected state
>     .bss_info_changed()
>       enable fw beacon offload
> 
> * AP stop
>     .bss_info_changed()
>       disable fw beacon offload (skip this command)
>     .stop_ap()
>       set BSS to disconnected state (beacon offload disabled automatically)
>       destroy BSS network resource
> 
> Fixes: 116c69603b01 ("mt76: mt7921: Add AP mode support")
> Signed-off-by: Sean Wang <sean.wang@mediatek.com>
> Signed-off-by: Deren Wu <deren.wu@mediatek.com>
> Signed-off-by: Felix Fietkau <nbd@nbd.name>
> ---
>  .../wireless/mediatek/mt76/mt76_connac_mcu.c  |  2 +
>  .../net/wireless/mediatek/mt76/mt7921/main.c  | 47 +++++++++++++++----
>  .../net/wireless/mediatek/mt76/mt7921/mcu.c   |  5 +-
>  .../wireless/mediatek/mt76/mt7921/mt7921.h    |  2 +
>  4 files changed, 43 insertions(+), 13 deletions(-)

Now queued up, thanks,

greg k-h

