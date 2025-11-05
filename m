Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F07FCCF9E3
	for <linux-mediatek@archiver.kernel.org>; Wed,  5 Nov 2025 02:32:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N66lmHQ41ZDXetSBgvIvh3usb9oXxS7iym9uIs0RMFM=; b=3L0INPnJS8LnWGt1EdocVfZQd2
	KNGGR74u2nAVmWrIM0yfbv//7ZVOwbtG3Qrikq5JQtZnFd+bO7OZuCtzxF2704JhcYr0IocLD0lGv
	IVIusYLjQ142vRN1upi6K+zc7Q/wvAMP0xiLw4WKWLJdJ/FqnHMa1BkOF1aY+VurbOnmLk+AuFg3U
	uymdn22F6F/HcZv6hdESFHUoBtVWk5hmnbJuI+ooDGoiU0Yh+EzIrjPOzBagZiOhi0pQJcwrg7j17
	TYmdOo2s4dmSSSSQ2I/UEtzMKotQfmo0tJM0KjCoMwDP8QTwk8vyo/2AN8SZvs9xazGRNgfNt+ofT
	aUZ2enmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGTJc-0000000CuSY-1nIB;
	Wed, 05 Nov 2025 02:32:04 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGTJZ-0000000CuRs-36A8;
	Wed, 05 Nov 2025 02:32:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 67AD743403;
	Wed,  5 Nov 2025 02:32:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7009C4CEF7;
	Wed,  5 Nov 2025 02:32:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762309921;
	bh=N66lmHQ41ZDXetSBgvIvh3usb9oXxS7iym9uIs0RMFM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=f52iJApXniSnJG23KU5Oz+PgjvuiRtr+krHr/tt3GTouhQj548TRkgfRflFebtszu
	 LhNWS9yekrzDAqRuxdjntOyeR560iDOI/X5MAMpjNO38HOiB+dXiDlWelGWfWIHRkd
	 5ObftU5iDrmvL1Z/i6zUGpEJbigiNjVMUZaxTvQlXHmZ/rXIg/MC+oJpqN34AVgG+A
	 p8pOtPmfsGzFHOhSrB4pAADf5Qmc2ZSBvph1JnaWxj+eDQEP+EpJRG04ZezurbfCpA
	 k8oiKnnpqT6/19f/KpfKt35hnV1J/JQwk3UNisk/lkaVXxCdTdUhYA/XPagWtYOkLG
	 rj7T4yKvb//QQ==
Date: Tue, 4 Nov 2025 18:32:00 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Paolo Abeni
 <pabeni@redhat.com>, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, netdev@vger.kernel.org
Subject: Re: [PATCH net-next 2/2] net: airoha: Reorganize airoha_queue
 struct
Message-ID: <20251104183200.41b4b853@kernel.org>
In-Reply-To: <20251103-airoha-tx-linked-list-v1-2-baa07982cc30@kernel.org>
References: <20251103-airoha-tx-linked-list-v1-0-baa07982cc30@kernel.org>
	<20251103-airoha-tx-linked-list-v1-2-baa07982cc30@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251104_183201_798774_D9660FFE 
X-CRM114-Status: UNSURE (   6.39  )
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

On Mon, 03 Nov 2025 11:27:56 +0100 Lorenzo Bianconi wrote:
> Do not allocate memory for rx-only fields for hw tx queues and for tx-only
> fields for hw rx queues.

Could you share more details (pahole)
Given that napi_struct is in the same struct, 20B is probably not going
to make much difference?

