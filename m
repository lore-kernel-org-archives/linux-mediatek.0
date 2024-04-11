Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F87FCD1284
	for <linux-mediatek@archiver.kernel.org>; Thu, 11 Apr 2024 13:09:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g6t7vwwrFAugndW6Qr6DQN2Zq9h7Npo2yJYJ8GjU0Kg=; b=T5MNAHQHgFUyRe9aO9ZLG0sLjB
	nQ1LBhkwPOiDARq8DdlWVIeH34HDeZNFatEIVfCF4CrltSeCdou9lAzXIPG+jauXRWw6aHtUnbmYA
	dXFc74uRujZNKgXHUZDtwLvmNhpWqjmRo3pb7BkgXATVr5A1yC8fZHyLdZN4sk6UbNmxKSdZ3aoYq
	wyftKzaIoVlL7ijfgJjLfYH+BtbkIw9OgPKwmCWDD0Z9eOUhF97K9zxBm830DBkRZ82/UKbOSOkJN
	sqbG0SqmbeqIzipnz1wbOPHqSmrHyjkGsLQUa5bFjE+4HnvI3UVKLTAfCo18n0kfq9p6skPogidAP
	cKLqGuug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruuBP-0000000C5my-42w1;
	Thu, 11 Apr 2024 13:09:39 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruuBK-0000000C5l0-10SH;
	Thu, 11 Apr 2024 13:09:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id E1DB4CE126D;
	Thu, 11 Apr 2024 13:09:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15BE1C433F1;
	Thu, 11 Apr 2024 13:09:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712840969;
	bh=8jloMJYR3hI592a7bjdaurZGTF8DZUtzFZslxyASiCw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=bTAamx34aXT0c7Dh0yldr3GLqQzV9IzdoRpbQHFtNRfItKvSV300oarDb7loQj0Db
	 nRfkoxxjnz9tSITwwxA3S3R++Th5BRDwHiy/ceBrv1hqDHDqRJhGCW1VuDm77tbvXj
	 sYF0lmSkNDM4sLi9I7SYA9CxCWtr8xgDLIJ8pvoFZns2rW3Hlm+PbN79aR13Zve2Jc
	 yKCiaqvumONCNAg1kYgPV+4UsdpCK8RYPlqHwgbszTVNkDUDxSiiLeHovaY2EzHZxI
	 tUFT3DR9oTRec7cO/yCDK54isJiPslGyjV/kl8GNT5n7CVWLJpcB+11xU7fbNibyU2
	 NojDEfZDJvLqg==
Date: Thu, 11 Apr 2024 06:09:26 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Breno Leitao <leitao@debian.org>
Cc: aleksander.lobakin@intel.com, davem@davemloft.net, pabeni@redhat.com,
 edumazet@google.com, elder@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 nbd@nbd.name, sean.wang@mediatek.com, Mark-MC.Lee@mediatek.com,
 lorenzo@kernel.org, taras.chornyi@plvision.eu, ath11k@lists.infradead.org,
 ath10k@lists.infradead.org, linux-wireless@vger.kernel.org,
 geomatsi@gmail.com, kvalo@kernel.org, Matthias Brugger
 <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, quic_jjohnson@quicinc.com,
 leon@kernel.org, dennis.dalessandro@cornelisnetworks.com,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org, bpf@vger.kernel.org,
 idosch@idosch.org
Subject: Re: [PATCH net-next v5 00/10] allocate dummy device dynamically
Message-ID: <20240411060926.308788bf@kernel.org>
In-Reply-To: <20240410131407.3897251-1-leitao@debian.org>
References: <20240410131407.3897251-1-leitao@debian.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240411_060934_494133_63638865 
X-CRM114-Status: UNSURE (   5.89  )
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

On Wed, 10 Apr 2024 06:13:41 -0700 Breno Leitao wrote:
>   wifi: ath11k: allocate dummy net_device dynamically

Sorry Breno, I didn't notice earlier, patch 10 didn't make it
to the list. The series wasn't ingested by CI and tested because 
of this. Could you repost?
-- 
pw-bot: cr

