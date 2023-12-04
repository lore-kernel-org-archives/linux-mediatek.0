Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE334C4167B
	for <linux-mediatek@archiver.kernel.org>; Mon,  4 Dec 2023 08:38:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c+ydD79UDn6WKjD/5Hw+OmKQSFy7oV67TboMZQA58Pc=; b=xzra098knSw0LYQDYRG7yNo8Rw
	52Z2Kcq2DzyuTolppLD3SxeK1TggWzhlxOlDsqcTD9XYgWGIqDQR7EFlsylCEShkKposjHOV5bM6T
	9RdgbIV6PakmT4shMwvgCgB3HQGNnpIYbvCVGINh2D5ejuvOiyjSIHn5CdKs81ONruSxgISfJU+H0
	5fDaF2wgh302LLn/kU+Ex9WVZT3/MOX0fzAY5L14FjNO/M513eHFQ4jnaRcjub03DJucXs/nbMyzf
	dvceE1NKXfTOHRZRRkb+Jq+cx21O7AOTntPnUezbGc4Ta6u0cF0D787dJihj9DFWBdqbp3NQdhcKl
	7h1fBEpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rA4So-003HcI-1O;
	Mon, 04 Dec 2023 08:38:02 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rA4Sk-003HbB-0Y;
	Mon, 04 Dec 2023 08:37:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 329B9B80D55;
	Mon,  4 Dec 2023 08:37:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F5BEC433C7;
	Mon,  4 Dec 2023 08:37:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701679075;
	bh=ftmmbjUPFPYaMVVTsCh1SAKi4plLZBTdcQEkERtxlG4=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=Tg/7WLEZoOcMn2nDBFBn/UG3NI6uXNyiSPClpRfA1cBfPtSx2pDbdWD/H4k56mwoE
	 +QNupT1g1geF2oa+jqBmH44890zbr8wjRors3E3pX4A+bGdtIUR4qmCh0y81LPaSBy
	 +BIWDBqCTOHTsNmlUSXqYIFOOAwZJ6mVZwrWVTVNNtKb9/dg+eXmln9zoPb4txG4aW
	 o9JR6NOaTn2PWaU6xhPjs8Wx+XIXN3nAtWN4jHRUxOygjlDjfLyuQQbmjmQUOgbZJw
	 AnPgrYkuxx6xeeym9KAEhHXELSvGAUhEYG8zeLPUJu1RIZMTmh/20qaUmeHT+ggNBC
	 E3sI7GQMAL8eQ==
From: Kalle Valo <kvalo@kernel.org>
To: Kees Cook <keescook@chromium.org>
Cc: "Gustavo A. R. Silva" <gustavoars@kernel.org>,  Felix Fietkau
 <nbd@nbd.name>,  Lorenzo Bianconi <lorenzo@kernel.org>,  Ryder Lee
 <ryder.lee@mediatek.com>,  Shayne Chen <shayne.chen@mediatek.com>,  Sean
 Wang <sean.wang@mediatek.com>,  Matthias Brugger <matthias.bgg@gmail.com>,
  AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
  linux-wireless@vger.kernel.org,  linux-kernel@vger.kernel.org,
  linux-arm-kernel@lists.infradead.org,
  linux-mediatek@lists.infradead.org,  linux-hardening@vger.kernel.org
Subject: Re: [PATCH][next] wifi: mt76: mt7996: Use DECLARE_FLEX_ARRAY() and
 fix -Warray-bounds warnings
References: <ZVaCNAohuieMmdq9@work> <202312021326.D3504C1@keescook>
Date: Mon, 04 Dec 2023 10:37:50 +0200
In-Reply-To: <202312021326.D3504C1@keescook> (Kees Cook's message of "Sat, 2
	Dec 2023 13:27:54 -0800")
Message-ID: <87zfyqqs69.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231204_003758_363731_90C9432E 
X-CRM114-Status: UNSURE (   9.44  )
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

Kees Cook <keescook@chromium.org> writes:

> On Thu, Nov 16, 2023 at 02:57:24PM -0600, Gustavo A. R. Silva wrote:
>
>> Transform zero-length arrays `adm_stat` and `msdu_cnt` into proper
>> flexible-array members in anonymous union in `struct
>> mt7996_mcu_all_sta_info_event` via the DECLARE_FLEX_ARRAY()
>> helper; and fix multiple -Warray-bounds warnings:
>> 
>> drivers/net/wireless/mediatek/mt76/mt7996/mcu.c:483:61: warning:
>> array subscript <unknown> is outside array bounds of 'struct
>> <anonymous>[0]' [-Warray-bounds=]
>> drivers/net/wireless/mediatek/mt76/mt7996/mcu.c:490:58: warning:
>> array subscript <unknown> is outside array bounds of 'struct
>> <anonymous>[0]' [-Warray-bounds=]
>> drivers/net/wireless/mediatek/mt76/mt7996/mcu.c:492:58: warning:
>> array subscript <unknown> is outside array bounds of 'struct
>> <anonymous>[0]' [-Warray-bounds=]
>> drivers/net/wireless/mediatek/mt76/mt7996/mcu.c:469:61: warning:
>> array subscript <unknown> is outside array bounds of 'struct
>> <anonymous>[0]' [-Warray-bounds=]
>> drivers/net/wireless/mediatek/mt76/mt7996/mcu.c:477:66: warning:
>> array subscript <unknown> is outside array bounds of 'struct
>> <anonymous>[0]' [-Warray-bounds=]
>> drivers/net/wireless/mediatek/mt76/mt7996/mcu.c:479:66: warning:
>> array subscript <unknown> is outside array bounds of 'struct
>> <anonymous>[0]' [-Warray-bounds=]
>> 
>> This results in no differences in binary output, helps with the ongoing
>> efforts to globally enable -Warray-bounds.
>> 
>> Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
>
> *thread ping*
>
> Can wireless folks please pick this patch up?

Ok, I assigned this to me on patchwork now. Felix, please let me know if
you prefer to take this to your tree instead.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

