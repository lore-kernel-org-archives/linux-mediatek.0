Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62B9FC04A94
	for <linux-mediatek@archiver.kernel.org>; Thu, 27 Jul 2023 15:53:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B+9U4Beprb9pu1uU4Mx83trCWS4lhvPi+RBhwLYwj+g=; b=fOtQAtiIioHyQVoylU/kz4kwE2
	MGv67Hbq8K0cd+iYXKONQilGC7yDWK5zB5IYUUjuQpFJbSvswWKYuMgHdjTfiefll8OpAWV0zKj4G
	VDzbs1kxKVSJp6H8rQu3QgP+pi6S3Uz+xG5Orsy/KVg8hauOF5MVhDHvVQyt1nl2fjvjw/3iAtTiW
	dPeJ1+usI6Q26b1AbSFgXfmcb6VDapIVeUj3v6x+XrMRxGltGMC5BcXaqoKdzOuGSS9dY+muB47aj
	8cLKKXW8Tb63Z6NCN10OMG2RpNmz3bNeK1XRP4xaw6LnfzHstP/LDInwlQPcRi4/ZBl35IexANvyG
	L6p2wqkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qP3IZ-00G9tk-0Y;
	Thu, 27 Jul 2023 15:53:07 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qP3IV-00G9p0-0r
	for linux-mediatek@lists.infradead.org;
	Thu, 27 Jul 2023 15:53:05 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-1b89d47ffb6so7049585ad.2
        for <linux-mediatek@lists.infradead.org>; Thu, 27 Jul 2023 08:53:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1690473182; x=1691077982;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B+9U4Beprb9pu1uU4Mx83trCWS4lhvPi+RBhwLYwj+g=;
        b=WlWFNqNPyREpMe5W8ha9YLRAYUAVHVCcv9Lk68+jM9LBf9M5bKGSw3Lou098CcfPkB
         mhNx9ShsdckTOhyZT5le4i6VwwwKJol7ks+8eXPXVkc3SdtHXMeObhwrB5YSeboQNYhf
         T/+whbs3KyR6OmlvUUZnuSxVVvxBaOv0hlMwY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690473182; x=1691077982;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B+9U4Beprb9pu1uU4Mx83trCWS4lhvPi+RBhwLYwj+g=;
        b=MrC0zSeYZxAEtfezeWgDj5lofHEc4c8Zw2toSHjygSCSASYbKz7gOVo+vhdNrxlabl
         D6ML7MmILRlBWH1IMsdd8pgattJT8WO28Iinf8xR+F41zqzT0vGS152p0Fu/AFGZJf3t
         oxwUovLoyOWhcI15NP5Rk60Ghl/CgzH6W7DSjLhEJ14wm4ipS9oW+WfkvtVaCGbowbEq
         3Qu/R7y4/k16omw77WXty5Mcy/Hr6i1DlYFVHGB0UiJQ7oj3g5V8V3lzojM3gh98ujHi
         e4/PGltR3y1pf6prH8g7lOda3Blg15h0R0rVsTXBmIhk4r/wfKUmnDcbLoItxfXp4KJF
         94/w==
X-Gm-Message-State: ABy/qLZwKuYi1ODAHIwhPf6L1ebfl1scyaU+xQgy0YYJFe0bkmIMC6zX
	58wRkMy9wlRpeTnOkv8N5xEyXw==
X-Google-Smtp-Source: APBJJlEbz+18hZOehpOx2Lg90Kn5OMIjVJqD6tiWpkUMlrFwOey76fAAMQaSy+GlhuNZNkNRKASRhA==
X-Received: by 2002:a17:902:e885:b0:1bb:83cd:ad8b with SMTP id w5-20020a170902e88500b001bb83cdad8bmr5009270plg.30.1690473181766;
        Thu, 27 Jul 2023 08:53:01 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id t8-20020a170902bc4800b001a6a6169d45sm1802462plz.168.2023.07.27.08.52.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jul 2023 08:52:59 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Azeem Shaikh <azeemshaikh38@gmail.com>
Cc: Kees Cook <keescook@chromium.org>,
	linux-hardening@vger.kernel.org,
	Shayne Chen <shayne.chen@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Kalle Valo <kvalo@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] wifi: mt76: Replace strlcpy with strscpy
Date: Thu, 27 Jul 2023 08:52:55 -0700
Message-Id: <169047317159.2400214.7882697833368890001.b4-ty@chromium.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230703181256.3712079-1-azeemshaikh38@gmail.com>
References: <20230703181256.3712079-1-azeemshaikh38@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230727_085303_335617_6CD448E9 
X-CRM114-Status: UNSURE (   9.14  )
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


On Mon, 03 Jul 2023 18:12:56 +0000, Azeem Shaikh wrote:
> strlcpy() reads the entire source buffer first.
> This read may exceed the destination size limit.
> This is both inefficient and can lead to linear read
> overflows if a source string is not NUL-terminated [1].
> In an effort to remove strlcpy() completely [2], replace
> strlcpy() here with strscpy().
> 
> [...]

Applied, thanks!

[1/1] wifi: mt76: Replace strlcpy with strscpy
      https://git.kernel.org/kees/c/535c78cbc0c4

Best regards,
-- 
Kees Cook


