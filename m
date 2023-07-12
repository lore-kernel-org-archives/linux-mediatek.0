Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB3B7EB64DD
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 Jul 2023 23:54:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WvkFiyqULDxpTvgtRj4icSA9iUWkpiYfk5PF0EtUrTI=; b=B5+u5CB3JdBXEoiTAri1wrJDJ6
	eu1kk0DS+FCoSBQcwa4BgPXKuD6cGm0ykUzyLSXE7zVjJhYwvG1cSuJLeIOgpicudBrTMHL7UsPT3
	jBGj6rjQprrGkAYU4FTyKQhenJC1RXdwW8noEfVPadYMTJRjsyAS7G/nnk07njLnZ2r+yc+wcV7c1
	JauljyqbT4HWG2JR4khlUNE6gUxTc/bzhqG/cMDMJ1O2453o/XAmMH3lO1N4S3jZDYvpMldLruBFT
	M/q0CB/YTCQGpEHkEMMARK52LPCMa2Iq4wrRYOt3uqm8Sz8FBboVa042BRuXHd8A7Np1zc6CpwVCV
	ZYQWxllQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJjfE-001Wm9-1e;
	Wed, 12 Jul 2023 23:54:32 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJjfA-001Wl6-1z
	for linux-mediatek@lists.infradead.org;
	Wed, 12 Jul 2023 23:54:30 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-1b8bd586086so1292725ad.2
        for <linux-mediatek@lists.infradead.org>; Wed, 12 Jul 2023 16:54:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1689206067; x=1691798067;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=WvkFiyqULDxpTvgtRj4icSA9iUWkpiYfk5PF0EtUrTI=;
        b=bmOM344cC3FsZrp85zCEuMvefaKXvyZ29nJcNSM2VxsVpaPyDIQO7SUmFD0FD1faQs
         avgbhXIemaecM59GyeF5bWuv1hkRIGlIkVgycsHrD+BKt4lifLjLBZl9hnhXrkL/Fvhc
         izik/yu9ygd36Ra8QwopPBqHdRTovzG3L8yrc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689206067; x=1691798067;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WvkFiyqULDxpTvgtRj4icSA9iUWkpiYfk5PF0EtUrTI=;
        b=Dzde+efAyQX5TbuPUMW1UJMMllLLaTPc+Ipgi7XwtqjJHpA8NPYE4aw8Ibkn6jWzHY
         df5Si+nHRML0iB7k1OIRiPKPi3zHJlifxdFAcoR+NKKBcfZ1ePgyfnm0ogISE9Lc8P5W
         49A3zUOYzekHnzy/x0FQw7JIIDbnUA5CFp7sr6EBhHrK07AFEhQOdGrvky/elWoo3pjQ
         gugkGqgXzFkGU9JwolqfClZD/X2bAtiBzHJtecElYDAepZf2SMK7YEJgO+VIkVLeD226
         /hGwpWlV1dl5iC+2CKBZDuU85JYR3MF2V1v8j5g8NoGqs6Pv5IMR59qOpIf8MBUmRJAx
         hm8A==
X-Gm-Message-State: ABy/qLbIcoXeKY3OMtYCyGGkpZwBl3Fg4EWWxdK1C5+1ByW5mvsyHWdm
	OXhdP93SNUs1JYzhxvUOTypsOA==
X-Google-Smtp-Source: APBJJlEQsAuK2FjOXsLLwedVTL2+xDqUAFVigL9HsD7VrSvCaYnqXJH1eTzZvJK9JyPR+/lZAQjrlw==
X-Received: by 2002:a17:903:246:b0:1b7:f73d:524 with SMTP id j6-20020a170903024600b001b7f73d0524mr98592plh.43.1689206066921;
        Wed, 12 Jul 2023 16:54:26 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id c11-20020a170902724b00b001b53d3d8f3dsm4493451pll.299.2023.07.12.16.54.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jul 2023 16:54:26 -0700 (PDT)
Date: Wed, 12 Jul 2023 16:54:26 -0700
From: Kees Cook <keescook@chromium.org>
To: Azeem Shaikh <azeemshaikh38@gmail.com>
Cc: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>, linux-hardening@vger.kernel.org,
	Shayne Chen <shayne.chen@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>, linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org, Kalle Valo <kvalo@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] wifi: mt76: Replace strlcpy with strscpy
Message-ID: <202307121653.4A9C69C655@keescook>
References: <20230703181256.3712079-1-azeemshaikh38@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230703181256.3712079-1-azeemshaikh38@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230712_165428_679448_6C7094A1 
X-CRM114-Status: GOOD (  12.95  )
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

On Mon, Jul 03, 2023 at 06:12:56PM +0000, Azeem Shaikh wrote:
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

Looks good -- thing is using return values from the macros.

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook

