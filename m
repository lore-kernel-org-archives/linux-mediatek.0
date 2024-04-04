Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E988CD1284
	for <linux-mediatek@archiver.kernel.org>; Thu,  4 Apr 2024 12:00:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uMRUyIYuoFVgmaf165a7HwPMTt2kOKRXLsBK8UGSEjA=; b=1dgoF03Aqbl82uPtatJoQbE65y
	Kg5oIEUVY7J1+jZPsI+dqCfj4ZaLdx9hUUqp1eIaNgxULKOkPsBWisbyBeldtkDHJDoi/68gaF177
	LMWuaRYfNzfk/nI+ljfU83uZBTgkdxxYdXD8P7wdmJiplrVg1j1NBX4YNqRxC8hu4h4mE+7mGpILj
	fqV623GwS2S5LvIrgf/pqdbpasuVY1f4ttPQYYbyt5OSvh+BM2Q+9Hb9duemBXW+LqS22eiTjjwbg
	1r2szV2fR0BnxznmVyHnktwPgSFAVOgSq2olQSo+hw4/5U2NzV6pEEbX7sTr07O+YfCQObAZcsVHJ
	a9wcpgrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsLlJ-00000002UIF-3kPj;
	Thu, 04 Apr 2024 12:00:09 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsLlG-00000002UGN-27NI;
	Thu, 04 Apr 2024 12:00:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 009C161698;
	Thu,  4 Apr 2024 12:00:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B951C433C7;
	Thu,  4 Apr 2024 12:00:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712232005;
	bh=Px5gxMf6tE7367j2YyGFk4bSXXCZIlJ5JXSZauI8+Js=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=Owq9783GbLDLeZP9d19ztQwHpwDD7NCh7fP637lINhBASzGKfF966xh6zQM5+l723
	 TbuddxuuXBidy+OfRIqhWNTOQH/f+jD7zvcLlro83KbfyNQAoONncguuKf/mGCLAg3
	 X2UKVhUKwhrS4z8U97khL6U7WuqfldW2mHQM6PRLlWkj16oQATi8u+qXZzQi3E1Ayn
	 vRo2hwDw9bdkRfjcu43J2gU5TVOMR4OO6YnjGp4FrNd9DacpOs+An6mPQUULa69sYw
	 IBS0yHkcAxm99xUR7FrRLzud6bDEtBAredMLIB8dkUwOD01CmZc9aH5aTgos/4nkzL
	 Sj6j2m4yqvIRw==
From: Kalle Valo <kvalo@kernel.org>
To: Breno Leitao <leitao@debian.org>
Cc: aleksander.lobakin@intel.com,  kuba@kernel.org,  davem@davemloft.net,
  pabeni@redhat.com,  edumazet@google.com,  elder@kernel.org,
  linux-arm-kernel@lists.infradead.org,
  linux-mediatek@lists.infradead.org,  nbd@nbd.name,
  sean.wang@mediatek.com,  Mark-MC.Lee@mediatek.com,  lorenzo@kernel.org,
  taras.chornyi@plvision.eu,  Matthias Brugger <matthias.bgg@gmail.com>,
  AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
  quic_jjohnson@quicinc.com,  leon@kernel.org,
  dennis.dalessandro@cornelisnetworks.com,  linux-kernel@vger.kernel.org,
  netdev@vger.kernel.org,  bpf@vger.kernel.org
Subject: Re: [PATCH net-next v3 0/5] allocate dummy device dynamically
References: <20240404114854.2498663-1-leitao@debian.org>
Date: Thu, 04 Apr 2024 14:59:59 +0300
In-Reply-To: <20240404114854.2498663-1-leitao@debian.org> (Breno Leitao's
	message of "Thu, 4 Apr 2024 04:48:40 -0700")
Message-ID: <87plv549ts.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240404_050006_620800_ACA16CE1 
X-CRM114-Status: GOOD (  12.46  )
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

Breno Leitao <leitao@debian.org> writes:

> struct net_device shouldn't be embedded into any structure, instead,
> the owner should use the private space to embed their state into
> net_device.
>
> But, in some cases the net_device is embedded inside the private
> structure, which blocks the usage of zero-length arrays inside
> net_device.
>
> Create a helper to allocate a dummy device at dynamically runtime, and
> move the Ethernet devices to use it, instead of embedding the dummy
> device inside the private structure.
>
> This fixes all the network cases except for wireless drivers.
>
> PS: Due to lack of hardware, unfortunately all these patches are
> compiled tested only.

BTW if it helps, and if you have an ath10k or ath11k patch already, I
can run a quick test on real hardware.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

