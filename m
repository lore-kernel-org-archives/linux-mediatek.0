Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF779C04E69
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Aug 2023 10:09:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:
	References:In-Reply-To:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6uqu0PpJapzVAeuizyVsE5nWtFJfH6WaAZPZ/ggl324=; b=hWk5sft/xE6p1xv1bq913xc+6N
	RN8e/HypEGM2oKsAA+v2vySUCGF0cNZeu7MAD0Q4m784VPWwWktHHCim3xevPAMfbV84rSk8jSNka
	/hAEUQGgLCv1KunzEdMGUUmAvE5bbPXM7Cqget+vWtQm63fE3SQ6s4NTbMTgP0alX73vV+SgQzCVc
	EvGhdYUNJuE+LEiMcyffnxF7fL9zn7PSGZK1UXP3T0bVmCPKu1v92OkSaWhqH8443YVkgczoABuyi
	S0BrRG1IsnPe1Vfm93VSgG67vmmJKKLLiOQ0V++nBP+cXmMejQIW02e2DN8GWUO467NnfhwTtWmsX
	klgWoXcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qR8nm-004ZPB-04;
	Wed, 02 Aug 2023 10:09:58 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qR8nj-004ZOZ-0v;
	Wed, 02 Aug 2023 10:09:56 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 238CC61900;
	Wed,  2 Aug 2023 10:09:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ADC9FC433C7;
	Wed,  2 Aug 2023 10:09:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690970993;
	bh=UMEoQRgUVPsC3BWx0IHQ6DCuzr/VvMwJzcj3pFtnNDY=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=ckJG3usI3aMMkX3aNcnX762E4cPBrlRxfoXuMdksMne9WCeFgTPXshhFwBVxJg4hI
	 bZeaFwTzONlhw5JdQYEtq8Hn9Pby/dGr3QWHgDnU+cHepjF/AAmNUI/PJF7ZR5XoZO
	 px7pl/WNWxbl0t1m66w38i2MBhG7NkjvogxkajzCic813Pg6aow6D4pI7ir2w65XX4
	 f8qx/tPR7cFmr+ExSJPWlvBBnxKVyIUJhNLNRHgHMrVPUGgq2RtjKBj6h/eG38FNWC
	 xj+Wo+dJRycHmvaCsNqA2mO/mBui56EdFPOeZbajrjJsodp+lskGmhRiLWEfyFoYEO
	 z/8etGaGCHlUg==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: wifi: mt76: Replace strlcpy() with strscpy()
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20230703181256.3712079-1-azeemshaikh38@gmail.com>
References: <20230703181256.3712079-1-azeemshaikh38@gmail.com>
To: Azeem Shaikh <azeemshaikh38@gmail.com>
Cc: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>,
 Ryder Lee <ryder.lee@mediatek.com>, linux-hardening@vger.kernel.org,
 Azeem Shaikh <azeemshaikh38@gmail.com>,
 Shayne Chen <shayne.chen@mediatek.com>, Sean Wang <sean.wang@mediatek.com>,
 linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
        <angelogioacchino.delregno@collabora.com>,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.11.2
Message-ID: <169097098854.265879.2537978394359079455.kvalo@kernel.org>
Date: Wed,  2 Aug 2023 10:09:50 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230802_030955_385359_19F61C05 
X-CRM114-Status: GOOD (  10.84  )
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

Azeem Shaikh <azeemshaikh38@gmail.com> wrote:

> strlcpy() reads the entire source buffer first.
> This read may exceed the destination size limit.
> This is both inefficient and can lead to linear read
> overflows if a source string is not NUL-terminated [1].
> In an effort to remove strlcpy() completely [2], replace
> strlcpy() here with strscpy().
> 
> Direct replacement is safe here since DEV_ASSIGN is only used by
> TRACE macros and the return values are ignored.
> 
> [1] https://www.kernel.org/doc/html/latest/process/deprecated.html#strlcpy
> [2] https://github.com/KSPP/linux/issues/89
> 
> Signed-off-by: Azeem Shaikh <azeemshaikh38@gmail.com>
> Reviewed-by: Kees Cook <keescook@chromium.org>

Patch applied to wireless-next.git, thanks.

d6b484b5cb2a wifi: mt76: Replace strlcpy() with strscpy()

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20230703181256.3712079-1-azeemshaikh38@gmail.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


