Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9159AC52D6F
	for <linux-mediatek@archiver.kernel.org>; Wed,  7 Aug 2024 00:15:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ML5YqexcIDHDR8AxLruBTqgMh03HTDjcDrUHV+qHJBU=; b=THoaEiV3LCXjNzXAJQGRt1Rbq+
	qgaCM2wHZTGdri21cklrIL+SmN38zbZ2lgStt0ui2k04JqhK5Pv+NXhtF4IzSwUjcP/PSXAnXtcQ5
	0cKwJNtx0xH/ljdsAOgiRicQLIdFsSEtJEUzCiVdULmkvtiy1odZ5+RYgsDAgtl1tr/tlnFjz3PS2
	2MQzrYRLC67YuW/hB8hvRAcJPd+VQJMdV5yE2k8YvqDimhlDaYLrvShPjuOUZzf2LEaAT5XbLCVCN
	H/gnQr18yKJRL7kuucDXshD/fcqZjBxJmQSM102RNpXERQL/QOwK+AVm9GiA1aNhCug4L8u0AZXxB
	watoFEZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sbULM-00000003PAc-2Apq;
	Wed, 07 Aug 2024 00:15:56 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sbUKo-00000003P6D-1cmL;
	Wed, 07 Aug 2024 00:15:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 471D261069;
	Wed,  7 Aug 2024 00:15:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E05BAC32786;
	Wed,  7 Aug 2024 00:15:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722989721;
	bh=UA624rrIplYm5bYViBQrFeGAf4DqmN14dvZNWYvj+rI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GrNEfVxxAEryDmkW5lWsQzdnOXEy9efwM1g+L+9j2QXp8ZZfTJJW6nXAx0wUyuMrs
	 8y7lHimdx4Hzx2IkAGZRQ5xZ1DfpVmGedOFBDAC5NLcjJTvHVvMCILf4vTTdi8cMWw
	 AiW6A9oN4mDFzQS/BvP2LaEKTwKOqw/WNb4iVWZBAb8hmM6eVFbPc7WONrtjmGvZHi
	 Zb5e1Fm31sYYILnZAtdCk21Pfz1rFIGTLy0Aq4TO28yQGbnFUFhFtam4quauteNF1r
	 XfYOe2egsQbrA0i6X6b+MqjLm2nDqpkrtvg+NEfEWxYbg2bvP8hK9bmmhpo7XtZHDX
	 OmzGAUZ6FTMZw==
Date: Wed, 7 Aug 2024 01:15:14 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: qii.wang@mediatek.com, matthias.bgg@gmail.com, 
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, kernel@collabora.com
Subject: Re: [PATCH] i2c: mt65xx: Avoid double initialization of restart_flag
 in isr
Message-ID: <rmn65agbosovoto3zwr6pqio32ad4uyhekxncvqx46w7eyj4wj@cxhtrvmlj5sv>
References: <20240806094537.90747-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240806094537.90747-1-angelogioacchino.delregno@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240806_171522_515763_D2670C90 
X-CRM114-Status: UNSURE (   9.66  )
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

Hi Angelo,

On Tue, Aug 06, 2024 at 11:45:37AM GMT, AngeloGioacchino Del Regno wrote:
> In the mtk_i2c_irq() handler, variable restart_flag is initialized
> to zero and then reassigned with I2C_RS_TRANSFER if and only if
> auto_restart is enabled.
> 
> Avoid a double initialization of this variable by transferring the
> auto_restart check to the restart_flag declaration.
> 
> This commit brings no functional changes.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

merged to i2c/i2c-host.

Thanks,
Andi

