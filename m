Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 891C3C77B72
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Apr 2023 14:36:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gY4fsrxqILFWQLsDkiSerjm5DFs+2RxD+u+vD/hOMDM=; b=DswSPdSWTZPKNC9gNtc/SlL2yB
	79oACPVbxPK7Mpe0KOfqDKCoz3Ee3WuRf5iNhz3qM4dv/Qcq8lQCVCsEe7xHdS/oqv5jEnlBxeNbn
	XdWMQlX71Yt3TsF6EQP91K4+LQ59B4nShFHSY4mvBRApwCivRzXUA/BEVSDSjr8e5L13g4nHR/Zop
	pXNX2iQlgFNDEtNKRWEnRvVNUUC/PmExPsmSJTStvoRW3QcgRm3bzUP0wEa5uYjAuXsj30WUPH9bH
	DxZ6mmhxwVK/7NY1oFnl7MJkFLav2uT5YygNOt7auvC5GXHTpnncOO/vVqT4U4RFDEchgTM1BwJUz
	zpglz7iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ppVO6-008K4h-0c;
	Thu, 20 Apr 2023 14:35:54 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ppVO2-008K3N-0V;
	Thu, 20 Apr 2023 14:35:51 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 916FA64A0A;
	Thu, 20 Apr 2023 14:35:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 675D8C433D2;
	Thu, 20 Apr 2023 14:35:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1682001349;
	bh=gY4fsrxqILFWQLsDkiSerjm5DFs+2RxD+u+vD/hOMDM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=dOxG0MyNNl/0/Fron+tkqVcotSd8rWpX/zZc/8CDGVzd0kmsdGvegveGoDAmJiRSo
	 ZT7dxMox0G4j0SfH6B+VHJBL1y3II8ZET0H8FFpkzGiiUZPwRLHihGvmWcgUapL9vx
	 0Uppg1Sv3bmJtvinoXDYsE6NKv3/9BwHdW2o5AosZClSVmUrAd1O+dPwu/WkU/4S+U
	 ZqCNJgSqXnGSHDPQTw9VNL4PZOlbP2XRdiElyAS5O5fOdqWpis/IBfNUxsoKZxVvaE
	 3yAT50PaZ6CZ1h9uN/ao70P+7GSpYiAeJfdB/OjrKIe0nd9tIhjDeezmADoaOFCgDM
	 bPR3T/nXQ1fbA==
Date: Thu, 20 Apr 2023 07:35:47 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Wang Jikai <wangjikai@hust.edu.cn>
Cc: Kalle Valo <kvalo@kernel.org>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>,
 hust-os-kernel-patches@googlegroups.com, Jakub Kicinski <kubakici@wp.pl>,
 linux-wireless@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 2/2] wifi: mt7601u: remove debugfs directory on
 disconnect
Message-ID: <20230420073547.43e273e8@kernel.org>
In-Reply-To: <20230420130924.8702-1-wangjikai@hust.edu.cn>
References: <20230420130924.8702-1-wangjikai@hust.edu.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230420_073550_238291_A9FA6909 
X-CRM114-Status: UNSURE (   9.30  )
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

On Thu, 20 Apr 2023 13:09:24 +0000 Wang Jikai wrote:
> Debugfs is created during device init but not removed.
> Add a function mt7601u_remove_debugfs to remove debugfs
> when the device disconnects.

No, the entire wiphy dir gets recursively removed.

