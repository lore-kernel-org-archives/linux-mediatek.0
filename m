Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37B44C25B7D
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Aug 2023 20:59:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xlGgwWTf/nLP2TlwAmP1MWgMzO0RJqkyJNjk5XF286w=; b=P2gI9+8CoLJ/dCwdMLbKjh3mqv
	N9PdosCu9+ZwDN6LycAnSiJal3A9zr8f2jvWjwcZIy+Ik95WoQ2wkeBlpI600ubhaijwugyLeup/m
	7/s774whg5Uv6DmlVOcS3QL6b6US+lV15ZDA9GPg4esw0PaHzFYx+8rSOEYXBP8qy52taAJNpV/zg
	dhIcB9y2qDSrKUPRUUCQl6JIZnV22rAZNhlHyQclbLEqCk86KX3KHDrB3ZnXSW1jwOBx1yF8y+bva
	+kh5WIrEDQQMB+3zSXC+RzedkwZS2FXDKUgvABzm9xug7Cq/Iaj2Zx1mHqKxOHpqFiwWUna6A4deB
	/x+bK0Zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qWNbv-004zeu-0I;
	Wed, 16 Aug 2023 20:59:23 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qWNbr-004zdm-27
	for linux-mediatek@lists.infradead.org;
	Wed, 16 Aug 2023 20:59:21 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-1bdb801c667so46046755ad.1
        for <linux-mediatek@lists.infradead.org>; Wed, 16 Aug 2023 13:59:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1692219556; x=1692824356;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xlGgwWTf/nLP2TlwAmP1MWgMzO0RJqkyJNjk5XF286w=;
        b=da09eNAHkWEo/pEOng7AkizliA/xPdjEjR4w1hWOr6cprU1HJasY8mlRG3X5jlWYpR
         TQDai+S04x09MlFWQVCyVt7TvTg1NKjygAq0L4ybvBKX1MYRtaJyrZl/Er9T6P7t0k6G
         VQXoEBwVTI+LCFVKl9WnKuSx+eCIgamm9s9+Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692219556; x=1692824356;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xlGgwWTf/nLP2TlwAmP1MWgMzO0RJqkyJNjk5XF286w=;
        b=b2xaJTriLKqtVbY60BKsx8DBArnPkVWg92+8qaFZhy5JtcdorPlxqajkk0IFQ7BizI
         jWhvSm8KpSuIz4shdQN6TGQlRyoe6Eis4h2qbCktnwNAk1lBhFtPeHdxv2VV5zE9hxMn
         sDHIBGq4Ymw9mav+0CAaPoGEqE1x4GWI+7gMMDYUjWNEbHeYevCMsfCd3mGW7QBpdzRz
         pFQ8oJF07FYjK9bVvNQ/O76QW3Wzwfl6s5D+lkvkRiZLvkQAUpK/WQXqyyIqc2mOVoDI
         TygHxDOryPi1mI/e6KZMGPG5BQzLWGS8PRS9Zdia9e0FDtKAxbs54rmlagi0NXKD8hLc
         u8aw==
X-Gm-Message-State: AOJu0YwImYve9Rw4avletZ6YKXpkHlUTr7nATd7093uXX5Kq0Ekj3ZMX
	aD858gu1DqBHMLRKNRRA9o+FEg==
X-Google-Smtp-Source: AGHT+IFScTCnLhDPzkRADw5u9zcBAk0sLroO3CH7he7HPI1WAHYwTrUUwVGAXpnxTWUxsTPr96Os9w==
X-Received: by 2002:a17:903:11d1:b0:1bb:cf4e:ccd with SMTP id q17-20020a17090311d100b001bbcf4e0ccdmr4098212plh.28.1692219556713;
        Wed, 16 Aug 2023 13:59:16 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id t3-20020a170902bc4300b001b8c6662094sm13505194plz.188.2023.08.16.13.59.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Aug 2023 13:59:16 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: Russell King <linux@armlinux.org.uk>,
	Kees Cook <keescook@chromium.org>
Cc: Arnd Bergmann <arnd@kernel.org>,
	Lecopzer Chen <lecopzer.chen@mediatek.com>,
	Oleg Nesterov <oleg@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Wolfram Sang <wsa@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Dan Williams <dan.j.williams@intel.com>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-hardening@vger.kernel.org
Subject: Re: [PATCH v2 0/2] ARM: ptrace: Restore syscall skipping and restart while tracing
Date: Wed, 16 Aug 2023 13:59:08 -0700
Message-Id: <169221954681.1236522.6821211749332698917.b4-ty@chromium.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230810195141.never.338-kees@kernel.org>
References: <20230810195141.never.338-kees@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230816_135919_719106_6E5DD381 
X-CRM114-Status: UNSURE (   8.37  )
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

On Thu, 10 Aug 2023 12:54:17 -0700, Kees Cook wrote:
> Fix tracing on arm since commit 4e57a4ddf6b0 ("ARM: 9107/1: syscall:
> always store thread_info->abi_syscall"). This was seen with the broken
> seccomp tests "syscall_errno", "syscall_faked", and "syscall_restart".

Applied to for-next/seccomp, thanks!

[1/2] ARM: ptrace: Restore syscall restart tracing
      https://git.kernel.org/kees/c/cf007647475b
[2/2] ARM: ptrace: Restore syscall skipping for tracers
      https://git.kernel.org/kees/c/4697b5848bd9

Take care,

-- 
Kees Cook


