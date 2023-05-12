Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E254C77B7C
	for <linux-mediatek@archiver.kernel.org>; Fri, 12 May 2023 08:20:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:
	References:In-Reply-To:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/zPHG8kl5xVamjXcO4u1+lDmgL6Qxu0GcEUUE4kHNeo=; b=2qj6Fm60gIg1vmG2c/1aRc6Sgb
	5OsSm/mIAHuQSvxdpswMDN44sIAIeVkylD5/QIDBLPS6VflZIfamC3Fgd13Zb9DUI5PVZkFOpzDpA
	fZp6hVOnHpsIpIYCMqAPd+sJRRtnvlUNPoDFvzUPbuq8eJSZkjAmc1MDyQU4K5dp0FKCOaWY0/kNX
	lB+wgJE+Hfjwteir8J/XSgHtMhKtMxOslXnXI35dWjmee+XsU/wIb61tTPfnE1WazthUbz2ZNXu/a
	LYe3eB51+jrS8keb5vrvKs6I/h48XQNvsUpERokVoM7nUOhkYUb7+1yCxLRvo/Cz6K20bh2MJ+rGh
	RE6xBeAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pxO0S-00BJT1-1O;
	Fri, 12 May 2023 08:20:04 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pxO0P-00BJSI-1t
	for linux-mediatek@lists.infradead.org;
	Fri, 12 May 2023 08:20:02 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 0D5BC653B7;
	Fri, 12 May 2023 08:20:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C43CCC433EF;
	Fri, 12 May 2023 08:19:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1683879600;
	bh=sEyfgjN8qN8u+KDZ69Jq/FF4HD2Z+duw7+YR1G3/WB4=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=WikYIkBQfs5oyvYYwV9ici1s0labJXD3auz8K3GTD9DYBvFko2GUiLItLKbuzHl6K
	 wk/FSZD7CkHqC6rCXPZvljaolDQHNo5UjqQwnSBy56Azt2Hsyd3+gktHvnoC4r6Hkt
	 3JuekZ1y/Q23uVohKslY4NYHLkkvOT/Y5T6Qqu3RWUhjL2mu4/FFHiznAdoVQDjZ4y
	 +j6ol54Xqgy86s9dezK59BgGAWrTXvvPmaLIlrv+ar8P5uQP3OGIoMbrDUoGssb6T6
	 G+AVwTjiE8MMpTpVnMzybN7w2VOcHCRs9ru7A700ve83bJr1VsGOhhW2C9Oymw8CEK
	 763H055bcFScw==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH 2/2] wifi: mt76: connac: fix stats->tx_bytes calculation
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To:  <b3cd45596943cf5a06b2e08e2fe732ab0b51311b.1682285873.git.ryder.lee@mediatek.com>
References:  <b3cd45596943cf5a06b2e08e2fe732ab0b51311b.1682285873.git.ryder.lee@mediatek.com>
To: Ryder Lee <ryder.lee@mediatek.com>
Cc: Felix Fietkau <nbd@nbd.name>, <linux-wireless@vger.kernel.org>,
 Lorenzo Bianconi <lorenzo.bianconi@redhat.com>,
 Shayne Chen <shayne.chen@mediatek.com>,
 Evelyn Tsai <evelyn.tsai@mediatek.com>, <linux-mediatek@lists.infradead.org>,
 Ryder Lee <ryder.lee@mediatek.com>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <168387959659.10206.9301062404052420631.kvalo@kernel.org>
Date: Fri, 12 May 2023 08:19:58 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230512_012001_666227_EAA14399 
X-CRM114-Status: UNSURE (   5.96  )
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

> The stats->tx_bytes shall subtract retry byte from tx byte.
> 
> Fixes: 43eaa3689507 (wifi: mt76: add PPDU based TxS support for WED device)
> Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>

The fixes tag is wrong, should be:

Fixes: 43eaa3689507 ("wifi: mt76: add PPDU based TxS support for WED device")

I can fix that.

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/b3cd45596943cf5a06b2e08e2fe732ab0b51311b.1682285873.git.ryder.lee@mediatek.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


