Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2DCCC52D7B
	for <linux-mediatek@archiver.kernel.org>; Tue, 13 Aug 2024 09:49:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:
	References:In-Reply-To:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BDg1mSfDJ6JCl68DubsIwdhSSxSgmW/Gulc/ROrKx1k=; b=h3ubjGB08PYYJj4LznXK0T5Bn9
	McVSPWY0087KFDi8L9tQ+jCA378BF1Yr55ito4RA1RHtPwjP9CovpMQSskzgYeubJ6n5KDpS20DPJ
	inICbjzIEQOCH+fNVRWGEt3UKs1JCzLtl8QgChqhyv8mXHWEe9KDCkkG9YiOkfEbLiWsLFUNhIbFw
	Bc0U+c2b9JPMZh5kHGXO/g6nEnzB2FPDDwejeFJUuwgDO264qVjgt9+yzm94CYIk2ro/Ueu6vo5KA
	vZstHiisahsA59OENu1njVRGUN5rvilehKMq7B+GeUk9THQ+KDAamEPKdU6SLD2nzMNfIE0TPbnKx
	dGBxCPsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sdoA4-00000003CH4-1Muy;
	Tue, 13 Aug 2024 09:49:52 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sdo9L-00000003C4Z-1JXe
	for linux-mediatek@lists.infradead.org;
	Tue, 13 Aug 2024 09:49:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A151B615D5;
	Tue, 13 Aug 2024 09:49:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06BC1C4AF0B;
	Tue, 13 Aug 2024 09:49:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723542546;
	bh=8fDU1EJcJbp7TqLl3KPDcjnqpz0sGS18/Q/mFMtTAOI=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=J5UqDRIYrSqnZnnN51vSOy1K9u/n9mEdhrmO4KIzmIKSQYhBIjDtjkcX06m1AcDGL
	 nsK/1eIBokVtGFJTdDCwsOPRh9pv/OK5zzkvP4BF7sPmkus4QCF9Fyz3tbsR1W3iiF
	 3lejAbrrCvV6Q3VVWjXhMEEqwSzjXnsyYt7jB8ZFIjYwWR3AY0u7paJXMKK/Q7OxEp
	 P5BdBV2rGxgO91IS2bGQnyXY/c2f4RzWGCScSWSbhgD8tPER40g5jiYCWqytnn0tGK
	 vDljK26Qn3GjaS1SVcvhILYPW5Ajy/jzVqzdCb51u0H0SKjVBvFADwiePkc60EYrFT
	 uZrDBTNDQzNSA==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH wireless] wifi: mt76: mt7921: fix NULL pointer access in
 mt7921_ipv6_addr_change
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20240812104542.80760-1-spasswolf@web.de>
References: <20240812104542.80760-1-spasswolf@web.de>
To: Bert Karwatzki <spasswolf@web.de>
Cc: linux-wireless@vger.kernel.org, Bert Karwatzki <spasswolf@web.de>,
 Felix Fietkau <nbd@nbd.name>, Sean Wang <sean.wang@kernel.org>,
 deren.wu@mediatek.com, linux-mediatek@lists.infradead.org,
 lorenzo.bianconi@redhat.com, mingyen.hsieh@mediatek.com,
 sean.wang@mediatek.com, linux-kernel@vger.kernel.org
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.11.2
Message-ID: <172354254201.696913.4098326996173451607.kvalo@kernel.org>
Date: Tue, 13 Aug 2024 09:49:03 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240813_024907_430677_A5043CEB 
X-CRM114-Status: UNSURE (   6.13  )
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

Bert Karwatzki <spasswolf@web.de> wrote:

> When disabling wifi mt7921_ipv6_addr_change() is called as a notifier.
> At this point mvif->phy is already NULL so we cannot use it here.
> 
> Signed-off-by: Bert Karwatzki <spasswolf@web.de>
> Signed-off-by: Felix Fietkau <nbd@nbd.name>

Patch applied to wireless.git, thanks.

479ffee68d59 wifi: mt76: mt7921: fix NULL pointer access in mt7921_ipv6_addr_change

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20240812104542.80760-1-spasswolf@web.de/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


