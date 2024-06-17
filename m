Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8635EC27C79
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Jun 2024 14:59:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZYgKTewbWFFfcvsQ1ekl5wQ9ScldGcNbBX9Tznn6ya4=; b=C7Ewro1SY2S4u1vqHG6utnB4EC
	vUkPvuY7/1ssaNZbWX3jO+MyxO0xNJsIFhnChrAVFzgD1Xwc8h61uHkqcGd06EqmRT3rwvdNWNpWm
	7vNr+TlcZg/byedcQT49HwwBxlDf4EEUkZpQKOLZLXZgm29tJ5YOy48hAVgCFs21+kWybXq9BljsU
	zB9JGG1JjGGajWIhRJ2lv1h12lBy3LAAVCDArYWQAT51fkLNVFYvRZAvFu0w4WfVErnqkNBjHmmcE
	9mBN+u93HO5uqGJ6x5G3kgZovIFOA5l8RJM/GiDTa4k+BzEEXIQY5j7DbF2DwMbqcqXZjsFP7inT2
	Yv4rOTJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJDoy-0000000BJYB-1Pny;
	Mon, 17 Jun 2024 14:59:00 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJDov-0000000BJWZ-23cz;
	Mon, 17 Jun 2024 14:58:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 044E060ED4;
	Mon, 17 Jun 2024 14:58:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2737CC2BD10;
	Mon, 17 Jun 2024 14:58:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718636335;
	bh=ZYgKTewbWFFfcvsQ1ekl5wQ9ScldGcNbBX9Tznn6ya4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=tICN7TiSxitxX2V6zbRUy739dgKwfqFNgNeI/8+s+oPFM1mLNHQ9tus6f/x7n1mvb
	 6RaDQ9J7laaviwbzrCphuXO66XSBJo8LWCx4anlsV8RBh8i/rSl/tsnlIefoDgxXdr
	 CiHWBPIHnoXpVKtl9pRxfEuv2+jcLVCxNv8533wBBxYqgu2ZPcwXhoLVRfw0ZctJzF
	 6p1BED1Ijk6lIfR7BQa6MA+YbeBthMnWMUuiRyqp8ZIf50oh+1Ad4AMAjA5ux2vqYI
	 JD1SzHksUa0KRLHGmsWituAuDtJ4n6JAJ4i2pzn6Zuxu1A5pk7Nko89jviO0/3f46t
	 k3vdkADue+Puw==
Date: Mon, 17 Jun 2024 07:58:54 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Elad Yifee <eladwf@gmail.com>
Cc: patchwork-bot+netdevbpf@kernel.org, daniel@makrotopia.org, nbd@nbd.name,
 sean.wang@mediatek.com, Mark-MC.Lee@mediatek.com, lorenzo@kernel.org,
 davem@davemloft.net, edumazet@google.com, pabeni@redhat.com,
 matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
 linux@armlinux.org.uk, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Subject: Re: [PATCH net-next v6] net: ethernet: mtk_eth_soc: ppe: add
 support for multiple PPEs
Message-ID: <20240617075854.29892c69@kernel.org>
In-Reply-To: <CA+SN3sogd29XG7Sgz1EOqBqtxxcVzFkB_mFq10TW+eYGKtdDTQ@mail.gmail.com>
References: <20240607082155.20021-1-eladwf@gmail.com>
	<171824043128.29237.10490597706474690291.git-patchwork-notify@kernel.org>
	<CA+SN3sogd29XG7Sgz1EOqBqtxxcVzFkB_mFq10TW+eYGKtdDTQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240617_075857_667755_E487BE09 
X-CRM114-Status: UNSURE (   6.97  )
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

On Sun, 16 Jun 2024 20:34:44 +0300 Elad Yifee wrote:
> It appears that the current sanity check is insufficient. Should WED
> be utilized, it will be necessary to find the appropriate PPE index
> through an alternative method. Kindly revert the recent commit
> temporarily until I come up with a solution

Please send the revert as a patch, with the explanation in the commit
message. That's our usual process.

