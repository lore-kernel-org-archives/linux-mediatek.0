Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D72EC87FC9
	for <linux-mediatek@archiver.kernel.org>; Thu, 31 Jul 2025 01:16:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nRCnL/y/dZdS+24yFJaPNjeEfInYvWmAnjIJQHIsN4Y=; b=Zo7B+tNQUtXn4qsXFS9b2BPiqC
	I6diqWuNAsa4VcvvhMtEqGG0WIFm+qldr8Gjv4WOqUw7mB+jEPCtLJwHZ1XRC8cy5IL4fd63iqJYY
	H7heOE1OCxpzhsMZFrN0TxF8pjQATyAtnHS19ugJ8RLSiiwTJaGWtAuiwm58ro2lM1zkq7xsrEYqc
	NFnDmHnPudxZq2jRz8fkxMAbhVkqSILPwU+RZDNEzpwz9YjqDBXXb7GIW8+cFH3Od6Ba1HmbvKpNl
	NZ2S4qIUfzpHtgaR4eu+o/YGbVCRE7sJn9zfsJP0SDAJPeHgRlsUTSjHGFZz9JpMb9jc7erlfMK5x
	sHgUK9ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhHts-00000002i7M-3p2L;
	Thu, 31 Jul 2025 01:16:04 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhHqm-00000002hxc-21TO;
	Thu, 31 Jul 2025 01:12:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 2D69246119;
	Thu, 31 Jul 2025 01:12:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA910C4CEEB;
	Thu, 31 Jul 2025 01:12:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753924370;
	bh=9ociyqJyFcfldmKy6upAQyl7szxtyAo8GBQWBDsaj/A=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Gn4w2GOD+ymA63b3IU68rZvEl4enPLO/sq59qejPyPszeh80upsM3XABbWkxnKpVk
	 /TFYh3BhQ/enam5jHGr5dfwfBG8wpQLtUa5DeB+0iUizEUSChqh+2Uq28ke5YQp57K
	 vwOXnLb9FOvXTVW2ZUZswrkZrI2EIjVL5rs2umAL9mrxxzCrj103Ya+XzMIrvyGgkM
	 AW9MFVCk8WCncxJFvvUWJGgYVvTDj0t6Wbnnyx2ASkfcy3GcKQDZ/wL3G362Z9R6Tf
	 uNP84BROAie6guePSVhDtoml9wVW4liHEQsqSohyHGKgIx4cH7p2XL1EVaYYL3RGKm
	 EruCJrJ0GmCrw==
Date: Wed, 30 Jul 2025 18:12:49 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Paolo Abeni
 <pabeni@redhat.com>, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, netdev@vger.kernel.org
Subject: Re: [PATCH net] net: airoha: Fix PPE table access in
 airoha_ppe_debugfs_foe_show()
Message-ID: <20250730181249.78dbe4f2@kernel.org>
In-Reply-To: <20250728-airoha_ppe_foe_get_entry_locked-v1-1-8630ec73f3d1@kernel.org>
References: <20250728-airoha_ppe_foe_get_entry_locked-v1-1-8630ec73f3d1@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250730_181252_545222_D83F5F67 
X-CRM114-Status: UNSURE (   8.72  )
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

On Mon, 28 Jul 2025 13:58:08 +0200 Lorenzo Bianconi wrote:
> +struct airoha_foe_entry *
> +airoha_ppe_foe_get_entry_locked(struct airoha_ppe *ppe, u32 hash)

Hm, could be just me, but the way we/I used _locked in the core was 
the opposite. _locked means the caller's already taken the lock.
Here you seem to be saying that the "callee is locked"..
Can we stick to core's interpretation?

> +	struct airoha_foe_entry *hwe;
> +
> +	spin_lock_bh(&ppe_lock);
> +	hwe = airoha_ppe_foe_get_entry(ppe, hash);
> +	spin_unlock_bh(&ppe_lock);
> +
> +	return hwe;

Is the lifetime of the hwe object somehow guaranteed in the debugfs
code? Looks questionable..
-- 
pw-bot: cr

