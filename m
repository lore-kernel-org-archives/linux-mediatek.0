Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C40ABCCD1A5
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Oct 2025 01:28:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XvbdbV2AgHVvCAc1GklIFSf+MOqvAqvFHUbbz+ZjMko=; b=wE4gE3OY2Spou1MCh7k0dTHdKn
	rlop6vsZV13VBOXIke8BBkVcphU/0BDIVmSEVrxhuENUR+SGN/V4JIb12Q1wfuFrDlBJEWLwA4giK
	/3UjS46kA26hR3C2vH73MQ11Z67J1OVgdFumJflS6rya0IJqRFw+lXZ62xWQL0sCgmYtA9DdOxchZ
	AOmSmcozKOzq5sg1+KvmoO8ci4bSx7D4dextpMYxf2eJViAsmpUkp7w5Tl2spREW76bjXdKvqjJRk
	gb4yUhfUqdqQjwQN4+3rx6hs2iA24iMQqZBItZXGGjKXDaSVgWtc69UeeyXcwdtpJyusY91wSIM5g
	gZlFzRZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBNe0-000000018qr-2Ivx;
	Wed, 22 Oct 2025 01:28:04 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBNdz-000000018qQ-1B71;
	Wed, 22 Oct 2025 01:28:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 3ED39623C1;
	Wed, 22 Oct 2025 01:28:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 495BFC4CEF1;
	Wed, 22 Oct 2025 01:28:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761096481;
	bh=JkJxzunFFLK1PDhtMOu5+1FjV6q7aUqZM+HmmciG9aM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=NcGbjYMetmbJQiq34aqtxvWSN2rGx+aX7rrvqRZqOw+Xvay1TCp7detb7iC6hR2+g
	 xmOY3+Od7PxuNI+6bP5EJ9I5fR9yuytG3CElSyoStLURi5nYBdiSYLsmCwe5dl4yvL
	 8oUcydhLyJOF4om8Z2ggO+cQ1U2XecW9o4MBJYBrKz93io/r1QTckG0EsLUpDWUeSy
	 KpPUIGOtshKxQHq+9wXldNHO97/E2EkgNoeQA6RQgKF8h+gzY/H3vR5O0wShZycci6
	 9Pj9kBTvAwZ8dOTHUWdSTeufq6zIlV/ogTCMkMF1zf2Bar+kxSUsEBN9tjUEP2YXfE
	 AhxLMDarMdmFw==
Date: Tue, 21 Oct 2025 18:28:00 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Paolo Abeni
 <pabeni@redhat.com>, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, netdev@vger.kernel.org
Subject: Re: [PATCH net-next] net: airoha: Remove code duplication in
 airoha_regs.h
Message-ID: <20251021182800.2c736d21@kernel.org>
In-Reply-To: <20251018-airoha-regs-cosmetics-v1-1-bbf6295c45fd@kernel.org>
References: <20251018-airoha-regs-cosmetics-v1-1-bbf6295c45fd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Sat, 18 Oct 2025 11:21:47 +0200 Lorenzo Bianconi wrote:
> This patch does not introduce any logical change, it just removes
> duplicated code in airoha_regs.h.
> Fix naming conventions in airoha_regs.h.

Appears not to apply
-- 
pw-bot: cr

