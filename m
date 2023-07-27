Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB433C0015E
	for <linux-mediatek@archiver.kernel.org>; Thu, 27 Jul 2023 16:00:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qb5rmolTz9mOsAP5ZXSqu5eejCbhg96Y/Wk3cVgybcQ=; b=4mVGcEBTGvDq2EnP9y0u6/YMxJ
	YHkdOooS3oLCSm+kWieGA1r8tTq507Dsqqyeo3IWyzm56bE+LgWgtz3QTWE2poekCu6Os65+YaJLF
	UFmImYMYvQFcL6a3lAzm9LXFR2b5ePDduLLSIqWvqT2887vrrH+eIh5/tmUfmHh844Lzy1PTwR2Pq
	GCYY3jFkllncg9o9+7Tt1HWMec7kKGcbXwS4f3hS6qruHbkuckDBRP/8hpmAdmEU4kHEtsXtjfoOV
	oG2GdD/Q9gpII+qoVV5BbCvqRiTNrcfCfKxJRnszASrSI/pT8YGlw344Ih9utJOnGzAa8njmhMHy1
	xOR02DaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qP3Pp-00GFXZ-1U;
	Thu, 27 Jul 2023 16:00:37 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qP3Pl-00GFPk-1g;
	Thu, 27 Jul 2023 16:00:34 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 3E44761EC0;
	Thu, 27 Jul 2023 16:00:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F90CC433C8;
	Thu, 27 Jul 2023 16:00:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690473626;
	bh=f5m8BGhtN6zBxnVwJ+ho2scIqcjIJySmiEoYp/0u46I=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=Zx+nPrzkjVwYmOzLqBoOHudWiVte0aG41ndPOdr+LiYIMiXAAXXEKSP9pDuEG2y5L
	 nmN8Kpd+cv43df4ijqgds7+65i0cNIIyPsv3E8Xo9vPPe1uFXsHSRtGd3wD9t9PwxS
	 Q/Ym0Z8LxRYzEe1vvAUsmrl5tqV8dsf+KqVh05H9dFZ2tHUSToEOrh3mI5o9VW6RZx
	 2X324IRq6rXWvu5t4cgcR1uLxO+IYzawNauV2VddPtVPq8NATjY20WdsCzogEkewHP
	 bvEpJvlQpy7iEQ+VtKQt8RcZLTpbG0YKfcbSjSj30R20IT802X/OWcGrK7HT6sZvT9
	 Wic+BgtEgdKYw==
From: Kalle Valo <kvalo@kernel.org>
To: Kees Cook <keescook@chromium.org>
Cc: Felix Fietkau <nbd@nbd.name>,  Lorenzo Bianconi <lorenzo@kernel.org>,
  Ryder Lee <ryder.lee@mediatek.com>,  Azeem Shaikh
 <azeemshaikh38@gmail.com>,  linux-hardening@vger.kernel.org,  Shayne Chen
 <shayne.chen@mediatek.com>,  Sean Wang <sean.wang@mediatek.com>,
  linux-wireless@vger.kernel.org,  linux-kernel@vger.kernel.org,  Matthias
 Brugger <matthias.bgg@gmail.com>,  AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>,
  linux-arm-kernel@lists.infradead.org,  linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] wifi: mt76: Replace strlcpy with strscpy
References: <20230703181256.3712079-1-azeemshaikh38@gmail.com>
	<169047317159.2400214.7882697833368890001.b4-ty@chromium.org>
Date: Thu, 27 Jul 2023 19:00:21 +0300
In-Reply-To: <169047317159.2400214.7882697833368890001.b4-ty@chromium.org>
	(Kees Cook's message of "Thu, 27 Jul 2023 08:52:55 -0700")
Message-ID: <87tttpz6ne.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230727_090033_622798_7A194304 
X-CRM114-Status: GOOD (  10.31  )
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

> On Mon, 03 Jul 2023 18:12:56 +0000, Azeem Shaikh wrote:
>> strlcpy() reads the entire source buffer first.
>> This read may exceed the destination size limit.
>> This is both inefficient and can lead to linear read
>> overflows if a source string is not NUL-terminated [1].
>> In an effort to remove strlcpy() completely [2], replace
>> strlcpy() here with strscpy().
>> 
>> [...]
>
> Applied, thanks!
>
> [1/1] wifi: mt76: Replace strlcpy with strscpy
>       https://git.kernel.org/kees/c/535c78cbc0c4

Why did you take this? mt76 is in active development so risk of
conflicts is high.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

