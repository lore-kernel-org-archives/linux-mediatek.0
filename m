Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2D06C47DDB
	for <linux-mediatek@archiver.kernel.org>; Tue, 23 Jan 2024 11:14:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LzFdW1mPBHlsjn7nJEle0eif/YOakZ2YmhtbQP5rgFY=; b=BuHJLKrrPpbArRNLbH4LR9h1ZE
	YS0YTDJLTliJAKE3pAHn0MIZQSt4KdOq4CNwluyqxO/6iwIuWZs5+d5eqNhPJfDDR+qkVvCmPT3sF
	yJIDPC41KfMHK340ZsKfvJG495uwttcSoyVvBK/ykY4bhpykX8qIllqP7UTXc7pk67ITXYMHMqw+u
	6/9cRQm/S4OPYx8yGX97PCbl+gzawjF9kQLFciJWcjOy8RtjeWBVZVMTIIWbClWLy5e8XpocmlpWE
	IDIs525bOzpMgapVK81MBeWAzXEl0vXNLIBoBjDO0Ts8dG8WYtUfG8HFo6FD3Xy6Wl9Dw4BBYqxKt
	rKh2A1gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rSEjE-00G6F0-07;
	Tue, 23 Jan 2024 11:14:04 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rSEjB-00G6ED-0m
	for linux-mediatek@lists.infradead.org;
	Tue, 23 Jan 2024 11:14:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 12B54CE2EB4;
	Tue, 23 Jan 2024 11:13:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92054C433C7;
	Tue, 23 Jan 2024 11:13:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706008437;
	bh=1XJThjrtaCvmoFbHnTwpeqliwRYvGoxjsvJkfuZKUv0=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=pKyqhV7FjPHZjvR6o7xvv51nSUCFzmCQ8+274rmLt3t/TZsX34PHtF9LDHqwuI6Kj
	 nR6WvCsZTnA/vZ1m7OMOLiDU9zsyxdUBid7I6UxSDWQbDRvtKSf+SB8Ip+3NZy0ZVT
	 GUmk/ny+l8j7fdU2sKtaSapLDqLCN0WsqRhSvDImV2O4RuxndW7ijqxj6qYS4e1IyR
	 QUp+rEFFEzh3EbmobPODsYF9kX62UkDA9BpQu4h85pmkXQJPca5B/7rdayXySsW8lP
	 BV5cWEwiaitVwf/q2pCPOYm8y0BkBRVan/P/Og47wNp3U83gOP1aS07d9+NQuqX5Je
	 E8wfwf9EYBl6Q==
From: Kalle Valo <kvalo@kernel.org>
To: Shayne Chen <shayne.chen@mediatek.com>
Cc: Felix Fietkau <nbd@nbd.name>,  linux-wireless
 <linux-wireless@vger.kernel.org>,  Lorenzo Bianconi <lorenzo@kernel.org>,
  Ryder Lee <ryder.lee@mediatek.com>,  Evelyn Tsai
 <evelyn.tsai@mediatek.com>,  Bo Jiao <Bo.Jiao@mediatek.com>,
  linux-mediatek <linux-mediatek@lists.infradead.org>
Subject: Re: [PATCH 11/12] wifi: mt76: connac: set correct muar_idx for
 mt799x chipsets
References: <20240119085708.23592-1-shayne.chen@mediatek.com>
	<20240119085708.23592-11-shayne.chen@mediatek.com>
Date: Tue, 23 Jan 2024 13:13:53 +0200
In-Reply-To: <20240119085708.23592-11-shayne.chen@mediatek.com> (Shayne Chen's
	message of "Fri, 19 Jan 2024 16:57:07 +0800")
Message-ID: <87zfwwcnf2.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240123_031401_457475_DC666955 
X-CRM114-Status: UNSURE (   5.99  )
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

Shayne Chen <shayne.chen@mediatek.com> writes:

> Set the muar_idx to 0xe for the BMC WTBL entries of mt799x chipsets.

The commit message should always answer to the question "Why?".

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

