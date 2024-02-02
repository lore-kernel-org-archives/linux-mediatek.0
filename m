Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5E8AC47DB3
	for <linux-mediatek@archiver.kernel.org>; Fri,  2 Feb 2024 10:57:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WB/yjFsFNiE/ioDYOhDgHz8gTUHdB8MHxMJNuow7QYE=; b=dDP9lMVfXJsJAMDa/hTKZwBhTN
	RlaN0HvJkjAEQstUcvJTCELE3Bn/L+0zDuiMnrQmV3JSDc4OOq2KHApfOx08xKL7FED+XE6ho5yMV
	L+NN3wPJnDbZmppadgMK4nFkcRhqbCxeW/H29ELGpikpIbTBR0C1SZBNouRhHsjI+le4ad7x9ARpM
	E4JPGymDk2CrpSwd6m3T2fr5Wb+PZEf//3NKKj5ejiCPVFmsRUzPBXLUdO6lESzPSPFSiMJEr9eYe
	hCAqOjHHGBIL3BW11GTBXjNxKCVczJEaHwklJUryV1H/vTFpmaKgBDYVvEgI8MF0YyaZsBV294XGg
	MFtqEYMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVrEF-0000000BDcb-1V1d;
	Fri, 02 Feb 2024 10:57:03 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVrEB-0000000BDaT-1dPv;
	Fri, 02 Feb 2024 10:57:01 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E2B1EDA7;
	Fri,  2 Feb 2024 02:57:36 -0800 (PST)
Received: from pluto (unknown [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1895D3F738;
	Fri,  2 Feb 2024 02:56:52 -0800 (PST)
Date: Fri, 2 Feb 2024 10:56:50 +0000
From: Cristian Marussi <cristian.marussi@arm.com>
To: Pin-Chuan Liu <flash.liu@mediatek.com>
Cc: Sudeep Holla <sudeep.holla@arm.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	wsd_upstream@mediatek.com, cylen.yao@mediatek.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v2] firmware: arm_scmi: Avoid to call mbox_client_txdone
 on txdone_irq mode
Message-ID: <ZbzKckIhn8HQv5pW@pluto>
References: <20240201095754.25374-1-flash.liu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240201095754.25374-1-flash.liu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240202_025659_500075_83851429 
X-CRM114-Status: GOOD (  14.50  )
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

On Thu, Feb 01, 2024 at 05:57:52PM +0800, Pin-Chuan Liu wrote:
> On txdone_irq mode, tx_tick is done from mbox_chan_txdone.
> Calling to mbox_client_txdone could get error message
> and return directly, add a check to avoid this.
> 
> Signed-off-by: Pin-Chuan Liu <flash.liu@mediatek.com>

Hi Pin-Chuan,

thanks for this, it was indeed sort of on my todo-list too, to allow MHUs
equipped with Tx-Ack IRQ to work with SCMI.

Having said that, this looks good to me in general, my only pain points
are: the fact that we have to peek into the controller structures to know
how it is configured, BUT I wouldn't know how to do it in any other
way in fact as pof now...; and the fact that there is a constant runtime
conditional check for each message sent even though the tx_ack irq presence
can be detected once for all at setup time, BUT even this is not easily
solvable as of now in the SCMI stack.

So, after all of this babbling of mine, I would say that  your patch is fine
as it is, also because it is easy to backport; next week when I am back I'll
give it a go on a couple of platforms and get back to you with a proper
review/test.

Thanks again !
Cristian

