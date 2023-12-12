Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6D22C4332F
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 Dec 2023 15:09:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:
	References:In-Reply-To:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ieUbKIsdytJSC4oF66CRhPSGkioTOAM444BaKAWt2no=; b=FIpy3zKGXlGyf+8Rl6SKTw9SDQ
	78rtCie2zMDFRO2mV+CUPMgqTheAw5R8lNjX/l1yBnVdhDGBgmgPiGVFh2a/TAc2vQaX4gmpCzuW8
	n6naP+JhZnCtIT+FZyXM+IJObYtZVf5U7JOkWKk6S7YZQ3zt5XYr/iKxu77ov9YbTFYisvcdYiW1i
	0OA/2Oq68XMLgFmqSN6zmWp3P38De7QQXuQchXGXjxnHXbfLIOQxWm2AP5/FFZxv7gm9mSfAfsdNA
	lBIFu4KSehlkDGBPRJsYn0JQI3B2O/YC5RnPDAgPwvKH2SIUiFsNrHLHuY52ULkdzmEILT/7iDssd
	T3j8yksA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rD4OC-00C0I9-0E;
	Tue, 12 Dec 2023 15:09:40 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rD4O8-00C0Go-0B;
	Tue, 12 Dec 2023 15:09:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id C3A4ECE1A10;
	Tue, 12 Dec 2023 15:09:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F0F8C433C7;
	Tue, 12 Dec 2023 15:09:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702393770;
	bh=Dd+Z9g8Wy9pE/XbicCpt6HzoSR2qPgHCFARthzdpVJ0=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=EknqhJ48zdty/TvXxhQhjINVvNz70LWWe1nCJ0hC3o5SwQu1v3g9NkkLvmYnpntZq
	 kuTTu54aL6cCpME7W5w/OZ4ynNorUF6jL6GACwmTP7vGG3lxzUuSODN88EKpcuMyG6
	 ckCtYRAfESJXYsK/bFIqBYNYxbNTw7jTKFrYNcldjNFSUgvs60t6cvLzWuJpxNKFcF
	 TmOZimDPKkM32RGWMHrGXNg4kxDAIqdrfezpQ+EB3ydFBBOSqKxlnW2C2W+iqWXozO
	 ggAKjG6e/TFBzY/QppVqhjy99DQweo9FJbK8t44OMPq0gdvgBB57AecJ3WyUNR208b
	 OPwuiWsNz1M3w==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH][next] wifi: mt76: mt7996: Use DECLARE_FLEX_ARRAY() and
 fix
 -Warray-bounds warnings
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <ZVaCNAohuieMmdq9@work>
References: <ZVaCNAohuieMmdq9@work>
To: "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>,
 Ryder Lee <ryder.lee@mediatek.com>, Shayne Chen <shayne.chen@mediatek.com>,
 Sean Wang <sean.wang@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
        <angelogioacchino.delregno@collabora.com>,
 linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 linux-hardening@vger.kernel.org
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.11.2
Message-ID: <170239376588.306086.11901816078975577906.kvalo@kernel.org>
Date: Tue, 12 Dec 2023 15:09:27 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231212_070936_463592_51B007D0 
X-CRM114-Status: UNSURE (   6.68  )
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

> Transform zero-length arrays `adm_stat` and `msdu_cnt` into proper
> flexible-array members in anonymous union in `struct
> mt7996_mcu_all_sta_info_event` via the DECLARE_FLEX_ARRAY()
> helper; and fix multiple -Warray-bounds warnings:
> 
> drivers/net/wireless/mediatek/mt76/mt7996/mcu.c:483:61: warning: array subscript <unknown> is outside array bounds of 'struct <anonymous>[0]' [-Warray-bounds=]
> drivers/net/wireless/mediatek/mt76/mt7996/mcu.c:490:58: warning: array subscript <unknown> is outside array bounds of 'struct <anonymous>[0]' [-Warray-bounds=]
> drivers/net/wireless/mediatek/mt76/mt7996/mcu.c:492:58: warning: array subscript <unknown> is outside array bounds of 'struct <anonymous>[0]' [-Warray-bounds=]
> drivers/net/wireless/mediatek/mt76/mt7996/mcu.c:469:61: warning: array subscript <unknown> is outside array bounds of 'struct <anonymous>[0]' [-Warray-bounds=]
> drivers/net/wireless/mediatek/mt76/mt7996/mcu.c:477:66: warning: array subscript <unknown> is outside array bounds of 'struct <anonymous>[0]' [-Warray-bounds=]
> drivers/net/wireless/mediatek/mt76/mt7996/mcu.c:479:66: warning: array subscript <unknown> is outside array bounds of 'struct <anonymous>[0]' [-Warray-bounds=]
> 
> This results in no differences in binary output, helps with the ongoing
> efforts to globally enable -Warray-bounds.
> 
> Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
> Reviewed-by: Kees Cook <keescook@chromium.org>

Fails to apply, please rebase on top of wireless-next.

Recorded preimage for 'drivers/net/wireless/mediatek/mt76/mt7996/mcu.h'
error: Failed to merge in the changes.
hint: Use 'git am --show-current-patch=diff' to see the failed patch
Applying: wifi: mt76: mt7996: Use DECLARE_FLEX_ARRAY() and fix -Warray-bounds warnings
Using index info to reconstruct a base tree...
M	drivers/net/wireless/mediatek/mt76/mt7996/mcu.h
Falling back to patching base and 3-way merge...
Auto-merging drivers/net/wireless/mediatek/mt76/mt7996/mcu.h
CONFLICT (content): Merge conflict in drivers/net/wireless/mediatek/mt76/mt7996/mcu.h
Patch failed at 0001 wifi: mt76: mt7996: Use DECLARE_FLEX_ARRAY() and fix -Warray-bounds warnings

Patch set to Changes Requested.

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/ZVaCNAohuieMmdq9@work/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


