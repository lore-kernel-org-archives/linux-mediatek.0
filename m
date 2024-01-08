Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF184C47073
	for <linux-mediatek@archiver.kernel.org>; Mon,  8 Jan 2024 21:06:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F/M8tmHuxkuM4JsV9uqBtQOfmEd0s5R+EW9Dh5T0tVI=; b=NgN4ZzxdkWK0GBcQ3PlORd2IiL
	qEU7RfdX6cSMo5vjlUt0yrQmV7OY3XM6cXSeULtOT8uWq+9DAOajEcZoxr8lBNXIJukWfmgr60z47
	aiDRH9yI9YEprIPlQEvYxFgJqgd1ii/2yWbv0OazcVh+wUSvitL8Ch8NDgpyLUMOoacc+buogDVqd
	f0298/iARnHz2cJWJoMzRsR0X4dLx4h12qihgfwrmNpdUUhPxyiAGPBiPDPdcjpOpupBEg1BK2O5c
	vXXysIEVJofQETMFjTe/lwy7JXKUs9VjHZrEg4jjL2HaB4pdXVT7e6DQKlIf8u91FmhJHDqJyJTqn
	lysFZYbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rMwpA-006F4W-1n;
	Mon, 08 Jan 2024 21:06:20 +0000
Received: from pidgin.makrotopia.org ([185.142.180.65])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rMwp7-006F3N-1W
	for linux-mediatek@lists.infradead.org;
	Mon, 08 Jan 2024 21:06:18 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.96.2)
	(envelope-from <daniel@makrotopia.org>)
	id 1rMwoy-00079t-03;
	Mon, 08 Jan 2024 21:06:09 +0000
Date: Mon, 8 Jan 2024 21:06:01 +0000
From: Daniel Golle <daniel@makrotopia.org>
To: Sky Huang <SkyLake.Huang@mediatek.com>
Cc: John Boyer <jwboyer@kernel.org>,
	linux-firmware <linux-firmware@kernel.org>,
	linux-mediatek <linux-mediatek@lists.infradead.org>,
	Steven Liu <Steven.Liu@mediatek.com>,
	John Crispin <john@phrozen.org>
Subject: Re: [PATCH] linux-firmware: add firmware for mt7988 internal 2.5G
 ethernet phy
Message-ID: <ZZxjuf32ks-L9DdC@makrotopia.org>
References: <20231113075818.23391-1-SkyLake.Huang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231113075818.23391-1-SkyLake.Huang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240108_130617_513251_89087178 
X-CRM114-Status: GOOD (  10.81  )
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

Hi SkyLake,

On Mon, Nov 13, 2023 at 03:58:18PM +0800, Sky Huang wrote:
> From: "SkyLake.Huang" <skylake.huang@mediatek.com>
> 
> This patch adds firmware file of version 2023/07/28 for mt7988 internal 2.5G
> ethernet phy.
> 
> Signed-off-by: SkyLake.Huang <skylake.huang@mediatek.com>
> ---
>  WHENCE                             |   9 +++++++++
>  mediatek/mt7988/i2p5ge-phy-pmb.bin | Bin 0 -> 131072 bytes

Will you also submit 2p5ge-phy-dmb.bin ?
The hardware seems to require both files (*pbm.bin and *dmb.bin).

Cheers

Daniel

