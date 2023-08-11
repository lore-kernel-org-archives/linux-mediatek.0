Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E479EB64DD
	for <linux-mediatek@archiver.kernel.org>; Fri, 11 Aug 2023 05:55:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2OD5ZJXsW01Gkak3C9PDmNcxF6jiUQnE47JaTYXQ2XI=; b=Ba2AXTBfbXDHmQ2Z45kn42gzk4
	rzyftrUq8ytb2l2IWH5StiI2bEtpddGSK+tZdxQnKid6M3lbg/ctdI9o1Ifsi+QKS3x4briFW9P+M
	eJynJsemdESHB+laOUTvEnweXTXcmvEctp2xiYaqVX17oiHWwt6uy+zZxEEWUEfP8e73iNwNf5JFO
	Mo+789cvbeCLuw2FbODe8xPAXCtMP3bn/iNfMWW+DReNqxXtSb8sVjV1v5x6Da1dRpnH9bJ6MzQLV
	w44jUUvhPejj1m65CYIq9mHAMhJlPPafla9A7kJMl4EfmELYiQqhq31sC7PB4Vbgvpp3dBUWfx7Pv
	MT0LHKWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qUL7s-009Ybd-0k;
	Fri, 11 Aug 2023 05:55:56 +0000
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qUL7p-009YaI-1U
	for linux-mediatek@lists.infradead.org;
	Fri, 11 Aug 2023 05:55:54 +0000
Received: by mail-pj1-x102d.google.com with SMTP id 98e67ed59e1d1-2693640dfa2so972064a91.3
        for <linux-mediatek@lists.infradead.org>; Thu, 10 Aug 2023 22:55:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1691733352; x=1692338152;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2OD5ZJXsW01Gkak3C9PDmNcxF6jiUQnE47JaTYXQ2XI=;
        b=KmJ7vo2x2kgxcCOFYtH2hKSHu+0pY2VUNnZpCBbS25LCbKUtxA688X2pLRPq9USzib
         SUIXyKe3IQrJtsvW1BW3eo5YJGPrXCSJVMzZDcXuk5jr83tmrf5PuCtCj2wpE4VcbgcK
         T+S+T323/s0Qx0kVW3cGQ6hnilxAECCDhcmz0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691733352; x=1692338152;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2OD5ZJXsW01Gkak3C9PDmNcxF6jiUQnE47JaTYXQ2XI=;
        b=cWja522+/OIufiJQK9zWgkgalMWyJ5HW/vv303sOyYDf4d4ljVrHziTDdz/OIUZ5Qv
         DnQIJwqVkEOw+mQfuVQ9saUUpriLv0rAnI4VI2flDwz/r9xY0JXbxRR4i/g72nvFyq5l
         sL/k91pLif/e0Ppq9U+bS7J2WgONJTHxf1piKTjJ8/t6rqddwOxNVtV6BoAbPZviE3BR
         s9vY2Dmz2bDxlXAhPouUTfU8yvOXrYEjsb2tvn1x8e6ZBEbIGjhsi9ONxS5UpZIJ0rOA
         atMpAqkAjbJUp4uSu/NMk81nMJBwYPalCPf8CjPcftkmeOGyTyrmPKX4yk4c7o/jpUhT
         7X4A==
X-Gm-Message-State: AOJu0YwJTZ+usqZ/Q+ucyD4pDYUKKUlvIFQvxCLAapw4MAwFShXkTAJO
	pQrGbMGd+rPOPcGCzACqL4K3QQ==
X-Google-Smtp-Source: AGHT+IG/KPGlnVMvs4ls738U22u+HBpqZA1zXRBdAtInf7cvftgHPpkb2CXU/kZ/s1PD0WUg+5/Ziw==
X-Received: by 2002:a17:90b:1b04:b0:268:13e2:fc91 with SMTP id nu4-20020a17090b1b0400b0026813e2fc91mr449458pjb.31.1691733352385;
        Thu, 10 Aug 2023 22:55:52 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id v10-20020a17090a898a00b00263fc1ef1aasm4350298pjn.10.2023.08.10.22.55.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Aug 2023 22:55:51 -0700 (PDT)
Date: Thu, 10 Aug 2023 22:55:51 -0700
From: Kees Cook <keescook@chromium.org>
To: Russell King <linux@armlinux.org.uk>
Cc: Arnd Bergmann <arnd@kernel.org>,
	Lecopzer Chen <lecopzer.chen@mediatek.com>,
	Oleg Nesterov <oleg@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Wolfram Sang <wsa@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	Dan Williams <dan.j.williams@intel.com>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-hardening@vger.kernel.org
Subject: Re: [PATCH v2 0/2] ARM: ptrace: Restore syscall skipping and restart
 while tracing
Message-ID: <202308102254.689CB3F@keescook>
References: <20230810195141.never.338-kees@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230810195141.never.338-kees@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230810_225553_526290_ADECECFC 
X-CRM114-Status: GOOD (  11.02  )
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

On Thu, Aug 10, 2023 at 12:54:17PM -0700, Kees Cook wrote:
> Fix tracing on arm since commit 4e57a4ddf6b0 ("ARM: 9107/1: syscall:
> always store thread_info->abi_syscall"). This was seen with the broken
> seccomp tests "syscall_errno", "syscall_faked", and "syscall_restart".

I'd like to get this fixed in v6.5. Russell, do you have a fixes tree
that you'll be sending Linus's way before the next -rc? I can send it
via my seccomp-fixes tree if that'd be easier.

Thanks!

-Kees

-- 
Kees Cook

