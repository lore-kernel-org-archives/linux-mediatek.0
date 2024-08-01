Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBEA6C3DA7F
	for <linux-mediatek@archiver.kernel.org>; Thu,  1 Aug 2024 01:37:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2Q7g3lDIf86xfRkb6CzBo6C7pgFeFdpEWFNwjoBhnCc=; b=vdxF+Rs8i19tO9ewoQLlNG61z0
	r5GiTUqAm5iHiGC1HwcpROdwz7zv2M7daGcDKG9X0guYoUhtnCz4GH1NmlbgZyFW7/NKfY6rczVfy
	zY+TWZhFbKG9pVbJDYFb+JW7h+yaFgOLGcbAjp4HgaTWEIOyNyfTRTUwvNJrbpiUv/v3kfhlqQLtb
	rdH3SLUGHmKLuiesuGetxNI2l0hiZK2sShF6T++WpzyzU01nazM3fQu2GDOVUzArz+lNlZ+Tmkasu
	ChA6RX2u8C+2xxHbuXRb9hg6MqwlCwX7bS0kWT5OMEhjoWfKBn5hsMYl0A6IKlS6r9c9EPz9Hp7yG
	jFGVFsqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZKlM-00000003HFW-3Ued;
	Thu, 01 Aug 2024 01:37:52 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZKks-00000003H72-2j8a;
	Thu, 01 Aug 2024 01:37:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id A5FD9CE172C;
	Thu,  1 Aug 2024 01:37:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 753ABC116B1;
	Thu,  1 Aug 2024 01:37:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722476240;
	bh=CFcLagnhSPLMkv28jhrd6F2i/6gjaTbXT0G9AfzAiX8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=k3aQg0uNsI6wVnZRrP3i5y9symMkz96EVSqcoS3Ri0uAgRy2rFKPXTvoyP0IsIBXP
	 xqAHY6YIJkmGtXZ+MhEZqu/A1KIp52DEQX5d7CDuAH/3kz5fCF1rWV4Vazs/SDH7IO
	 dqfKbNMv9TTdW5W4DWO4veiRMcJdMrMJSdbU/7t4RJXXhWmrld7mXRk7tidq7Uqx5V
	 FaRPbYfQEA+MJ9HWiHSiTaIRsV1tiiED2gJfM7lkK8t7BkckVbJ8BWK8Zb44mPy0VG
	 lHz4f6grd9fzmaLkqnB8BjYqkArT0SHnBgCAuwB7Bviw6Bgtvf7NM7JsQihUMWlGZB
	 78kIW1JFnfvdQ==
Date: Wed, 31 Jul 2024 18:37:18 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Elad Yifee <eladwf@gmail.com>
Cc: Lorenzo Bianconi <lorenzo@kernel.org>, Felix Fietkau <nbd@nbd.name>,
 Sean Wang <sean.wang@mediatek.com>, Mark Lee <Mark-MC.Lee@mediatek.com>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, Daniel Golle <daniel@makrotopia.org>,
 Joe Damato <jdamato@fastly.com>
Subject: Re: [PATCH net-next v2 0/2] net: ethernet: mtk_eth_soc: improve RX
 performance
Message-ID: <20240731183718.1278048e@kernel.org>
In-Reply-To: <CA+SN3soFwyPs2YhvY+x33B6WsHHahu6hbKM-0TpdkquJwzD7Gw@mail.gmail.com>
References: <20240729183038.1959-1-eladwf@gmail.com>
	<ZqfpGVhBe3zt0x-K@lore-desk>
	<CA+SN3soFwyPs2YhvY+x33B6WsHHahu6hbKM-0TpdkquJwzD7Gw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240731_183722_894352_4F54791B 
X-CRM114-Status: UNSURE (   9.25  )
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

On Tue, 30 Jul 2024 08:29:58 +0300 Elad Yifee wrote:
> Since it's probably the reason for the performance hit,
> allocating full pages every time, I think your suggestion would improve the
> performance and probably match it with the napi_alloc_frag path.
> I'll give it a try when I have time.

This is a better direction than disabling PP.
Feel free to repost patch 1 separately.
-- 
pw-bot: cr

