Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94593C77B7F
	for <linux-mediatek@archiver.kernel.org>; Fri, 12 May 2023 08:21:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:
	References:In-Reply-To:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pU8zloocoon3vMkmC1OEC3CMY/G6YBp7WOiZt+1bM14=; b=LYuYIUzu05j3Z/JuectH4U3cvD
	2w0woBvAdULNw9PqC78qQooKTsnA+ijCSo4A7bURGvFFm1sDwuSGqyvhofIip54hTqWvvzmW4IX/n
	Njr1BFrwrfi3gAC7P6Qne27wpAPkMH5/EmYkvDW3FkcmI8o7N5dzwS6UdW1FRnkI5rH67iwG4VeQN
	O5jv9u+4/nSsjWIF9pXsb4QNtYIQ74BkmKDfGn+LV2AQq7ygPHUZtaZxw6hm69M8cZnV3lbasH4fv
	M6d5ahNVCYaqyge/PaHOihcouZAwPXHhF0+F0XgUcwxWUYbI+Bx4HjmeJCvICtUKtHwAbiNLVgo8E
	15QDC9GA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pxO1x-00BJcZ-2C;
	Fri, 12 May 2023 08:21:37 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pxO1v-00BJcA-0Z
	for linux-mediatek@lists.infradead.org;
	Fri, 12 May 2023 08:21:36 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id B2161653C9;
	Fri, 12 May 2023 08:21:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F077C433D2;
	Fri, 12 May 2023 08:21:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1683879694;
	bh=igVf5Y5OrG2fxhQOW6HeE1uxNC/YcsfS2raPVx85M5o=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=drFNY6ExSX0sdVmnVM7h34vLHTwRDhtLMcJo6XS6VZ7CoM68EPKaAwNfKHC2/lSxO
	 zX2ArvjXYvzrJCvjjgaEIoy4YsbWzNchwheVadDg3OV34luHgsea0GpG32/oS1q+eu
	 MkU4VzBck8pgdRjT/JQVS3/26z8WwHOYMy1KTqc8CQPV8QNB+QdQrkEMnmLjx9YoH7
	 P2/I1gtoJMadAU/VOmel+Vdc7QDmpiI/A+5E1xhzpeGTIGI6jpU5kyQMd+im7vX7Ic
	 nc+ejaWdk9bYa3uIO8d2hracgqp/iohUwBoRHTKMRhHikloFUlvsowX5EufTBUxqG7
	 0GLv5c9YBlqvw==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH 1/2] wifi: mt76: mt7996: fix endianness of MT_TXD6_TX_RATE
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To:  <16fa938373e3b145cb07a2c98d2428fea2abadba.1682285873.git.ryder.lee@mediatek.com>
References:  <16fa938373e3b145cb07a2c98d2428fea2abadba.1682285873.git.ryder.lee@mediatek.com>
To: Ryder Lee <ryder.lee@mediatek.com>
Cc: Felix Fietkau <nbd@nbd.name>, <linux-wireless@vger.kernel.org>,
 Lorenzo Bianconi <lorenzo.bianconi@redhat.com>,
 Shayne Chen <shayne.chen@mediatek.com>,
 Evelyn Tsai <evelyn.tsai@mediatek.com>, <linux-mediatek@lists.infradead.org>,
 Ryder Lee <ryder.lee@mediatek.com>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <168387969017.10206.12108697708746087667.kvalo@kernel.org>
Date: Fri, 12 May 2023 08:21:32 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230512_012135_255261_7E82D57C 
X-CRM114-Status: UNSURE (   5.95  )
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

Ryder Lee <ryder.lee@mediatek.com> wrote:

> To avoid sparse warning:
> sparse: warning: invalid assignment: |=
> sparse:    left side has type restricted __le32
> sparse:    right side has type unsigned lon
> 
> Fixes: 15ee62e73705 ("wifi: mt76: mt7996: enable BSS_CHANGED_BASIC_RATES support")
> Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>

2 patches applied to wireless.git, thanks.

cdc26ee89bdd wifi: mt76: mt7996: fix endianness of MT_TXD6_TX_RATE
c7ab7a29ef5c wifi: mt76: connac: fix stats->tx_bytes calculation

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/16fa938373e3b145cb07a2c98d2428fea2abadba.1682285873.git.ryder.lee@mediatek.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


