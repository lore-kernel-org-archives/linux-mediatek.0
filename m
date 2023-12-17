Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CF1AC3DA6E
	for <linux-mediatek@archiver.kernel.org>; Sun, 17 Dec 2023 11:17:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:
	References:In-Reply-To:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZJSqvhbY7QqORLGaShN21waeLQjzMLxp78zmGCoWb/g=; b=FDAvB/iAuFM6K+y87/T58z/fnl
	Cz/2nOz+U/ecfR7/pFiC+Q0od6xqg5xm3lDMTfWiusngp8WbNE+ndPv/3NNyq+nntaTRk2ngVN+x8
	ZbrBKQTtgc750bggn5XDUE0eYsWVQKh+64yWA5HvF+qRStwT0g8+q9LWr89JDPMJxMAszWJBUR6Jw
	SlCZUqI/NB8D6Edv+Td1kqrACDLgt6CTiDlNdk+cLbxw/2jkZrgHwSGYDw2zmJbjdFcoKrrS1Szgx
	aGqWlSsfcdvML3R00U70XEipglXfkVXIOOzfOlVzYCOUgJcCqyGQhXVZfvn1zUuYLed6W1jywyQmI
	IeJXkRVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rEp9H-007aDq-11;
	Sun, 17 Dec 2023 11:17:31 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rEp9C-007a7B-0a;
	Sun, 17 Dec 2023 11:17:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 2AF77B80967;
	Sun, 17 Dec 2023 11:17:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9DE04C433C7;
	Sun, 17 Dec 2023 11:17:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702811839;
	bh=Sk2qe/uIHfzrqXwB7Gd/4Uel6P7DxOF+HQ9SsHoeciY=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=nilvsnOw4ynfGElnT481GCb04X9uZGXegbEKJs11zjB03awEgRdsiInGe9prJyfnN
	 nSFKipw2g85ljD9h0ZElOgR2f71CzM6ruVZQ/+TOlM0gYOY8Ujq5dQdyyViNOrOYhF
	 r1Ii5TB2+5Mcbkv8ECSSstKtcKSTudEDX8igiXRipOcUVH0INVrW9/Jf88quofTdZc
	 4tEnt16Tnv7IX+vHwKKXTDPMkYa2D83se/ZY5VOe8/QSlO8RbTJ6BKB3LYq2fI2BPr
	 mYfhnVPQvcaPdh2KFID7rFWHAxQycy0yAT+W9MkxLuNYOvQYogb21zUNaSezubzU5X
	 ETiKqqthhx6DA==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v2][wireless-next/for-next] wifi: mt76: mt7996: Use
 DECLARE_FLEX_ARRAY() and fix -Warray-bounds warnings
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <ZXiU9ayVCslt3qiI@work>
References: <ZXiU9ayVCslt3qiI@work>
To: "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>,
 Ryder Lee <ryder.lee@mediatek.com>, Shayne Chen <shayne.chen@mediatek.com>,
 Sean Wang <sean.wang@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 linux-hardening@vger.kernel.org
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.11.2
Message-ID: <170281183364.2255653.11348778745254559115.kvalo@kernel.org>
Date: Sun, 17 Dec 2023 11:17:16 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231217_031726_542329_10F18AFA 
X-CRM114-Status: UNSURE (   5.50  )
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

"Gustavo A. R. Silva" <gustavoars@kernel.org> wrote:

> Transform zero-length arrays `rate`, `adm_stat` and `msdu_cnt` into
> proper flexible-array members in anonymous union in `struct
> mt7996_mcu_all_sta_info_event` via the DECLARE_FLEX_ARRAY()
> helper; and fix multiple -Warray-bounds warnings:
> 
> drivers/net/wireless/mediatek/mt76/mt7996/mcu.c:544:61: warning: array subscript <unknown> is outside array bounds of 'struct <anonymous>[0]' [-Warray-bounds=]
> drivers/net/wireless/mediatek/mt76/mt7996/mcu.c:551:58: warning: array subscript <unknown> is outside array bounds of 'struct <anonymous>[0]' [-Warray-bounds=]
> drivers/net/wireless/mediatek/mt76/mt7996/mcu.c:553:58: warning: array subscript <unknown> is outside array bounds of 'struct <anonymous>[0]' [-Warray-bounds=]
> drivers/net/wireless/mediatek/mt76/mt7996/mcu.c:530:61: warning: array subscript <unknown> is outside array bounds of 'struct <anonymous>[0]' [-Warray-bounds=]
> drivers/net/wireless/mediatek/mt76/mt7996/mcu.c:538:66: warning: array subscript <unknown> is outside array bounds of 'struct <anonymous>[0]' [-Warray-bounds=]
> drivers/net/wireless/mediatek/mt76/mt7996/mcu.c:540:66: warning: array subscript <unknown> is outside array bounds of 'struct <anonymous>[0]' [-Warray-bounds=]
> drivers/net/wireless/mediatek/mt76/mt7996/mcu.c:520:57: warning: array subscript <unknown> is outside array bounds of 'struct all_sta_trx_rate[0]' [-Warray-bounds=]
> drivers/net/wireless/mediatek/mt76/mt7996/mcu.c:526:76: warning: array subscript <unknown> is outside array bounds of 'struct all_sta_trx_rate[0]' [-Warray-bounds=]
> drivers/net/wireless/mediatek/mt76/mt7996/mcu.c:526:76: warning: array subscript <unknown> is outside array bounds of 'struct all_sta_trx_rate[0]' [-Warray-bounds=]
> drivers/net/wireless/mediatek/mt76/mt7996/mcu.c:526:76: warning: array subscript <unknown> is outside array bounds of 'struct all_sta_trx_rate[0]' [-Warray-bounds=]
> drivers/net/wireless/mediatek/mt76/mt7996/mcu.c:526:76: warning: array subscript <unknown> is outside array bounds of 'struct all_sta_trx_rate[0]' [-Warray-bounds=]
> 
> This results in no differences in binary output, helps with the ongoing
> efforts to globally enable -Warray-bounds.
> 
> Reviewed-by: Kees Cook <keescook@chromium.org>
> Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>

Patch applied to wireless-next.git, thanks.

40d51f70f082 wifi: mt76: mt7996: Use DECLARE_FLEX_ARRAY() and fix -Warray-bounds warnings

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/ZXiU9ayVCslt3qiI@work/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


