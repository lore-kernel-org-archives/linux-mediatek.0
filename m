Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84F16C46467
	for <linux-mediatek@archiver.kernel.org>; Sat, 14 Jan 2023 13:46:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iSXALToAiod5BgH+L0ZWHa0tWCsv8dThyhIPNT2mUuk=; b=WBFmmM2hzVXVw3A7YA6VMIbYX5
	3zCVfDRWxGRFaQxR6u8ahO1aID2FvBSfWpqjEATS5LtBvbukPGPswNZYzcHdh5WIhsH9OZhthmNf7
	6O+Rrx7+hAArtdgunqieUJqw0Gp1mZVrLdrDv15yk6JdrUzzjcQQs5CXcfpkUByevI2YJatOPVoyM
	UpZ89h96rOpRY/BoPVxxpdWt8orjGq7qcuf2zwH5UiVbunxZMwmLAIl6VKbsYzrvLww9xJTSbBdJE
	MALiIrw0VAdau7PH/nuFSfGD/9b9/6/REDF9vxmrWO39/NwYssm9cgZEGneFcUTCEFa0JiSluBHjL
	OVHhaszw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pGgru-005wt1-Qv; Sat, 14 Jan 2023 13:46:46 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pGgrs-005wrP-Tm
	for linux-mediatek@lists.infradead.org; Sat, 14 Jan 2023 13:46:46 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 57B5CB8075A;
	Sat, 14 Jan 2023 13:46:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6713BC433EF;
	Sat, 14 Jan 2023 13:46:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1673704001;
	bh=uBcrKz57WGqNdhpKMGqIMKlBdqZrPQ0w7Sb911aM5u8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nEQRwL2uXx4hT4CEXENbukF4Bt56TBCyg/j7EBj7vcnpIbZMio/urexP9S4+pYifX
	 uydupyZxIZ7lrm4mfH0OW4eywana3e3MfwG3XyYSC/2ZYMeTSeW4W0C0w0RouYGzy2
	 039SBaIj2qGUkiyHOfr+XNORsfaIuAcHJoklSuQ4=
Date: Sat, 14 Jan 2023 14:46:37 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Nikita Zhandarovich <n.zhandarovich@fintech.ru>
Cc: stable@vger.kernel.org, Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo.bianconi83@gmail.com>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Kalle Valo <kvalo@codeaurora.org>, linux-wireless@vger.kernel.org,
	netdev@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Alexey Khoroshilov <khoroshilov@ispras.ru>,
	lvc-project@linuxtesting.org
Subject: Re: [PATCH 5.10 0/1] mt76: move mt76_init_tx_queue in common code
Message-ID: <Y8KyPYrTlN6Xr094@kroah.com>
References: <Y8AD4jdyOpqrPT9a@kroah.com>
 <20230113150445.39286-1-n.zhandarovich@fintech.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230113150445.39286-1-n.zhandarovich@fintech.ru>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230114_054645_147208_CA20BFCC 
X-CRM114-Status: UNSURE (   7.27  )
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

On Fri, Jan 13, 2023 at 07:04:45AM -0800, Nikita Zhandarovich wrote:
> My apologies, I should've have explained my reasoning better.

Reasoning for what?

Sorry, I have no context here, please properly quote emails so that we
have a hint as to what is going on.  Remember, some of us get 1000+ a
day that we need to process somehow...

thanks,

greg k-h

