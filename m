Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CF63C5ACB3
	for <linux-mediatek@archiver.kernel.org>; Thu, 16 Nov 2023 21:05:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6LnOWp0wbZeObmNmr90HTPFuULXlWCJKvWy7NEbdx0E=; b=qAXpZRJT0nIU5mWgUb+OVjuMCy
	c3hrzuZNhIjGth+kUrQeybq7yhGfp97VlNo7og3DkpogSlPDLHj1e4MwjpTeNfnS8+z6BUaiVk0I4
	jR3U0nViaFS1tzgwueTzSK+npBTlZDoNIZ21fphGGILySAaV0bzlY3HwSgMwQk5pftUps8Y09Fy01
	a+z5YJnzkeLr6Na0+YjryxCwW5EBsa/lQ7fY6D/8Pl4Mg3KTWtKHUUMEe1A3L/+WiijZGKzRoqBX8
	lRm9jzaDmIKttNx/M1XQ2LfGT2H9AEO5e603goL8JCcxkCy4TXZeKwo/uMHRtFUtFOz5ffLkQHgRV
	Jn9qNOPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r3jY3-004q7Q-0T;
	Thu, 16 Nov 2023 21:05:15 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r3jY0-004q5g-0n
	for linux-mediatek@lists.infradead.org;
	Thu, 16 Nov 2023 21:05:13 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-1cc5b6d6228so10312285ad.2
        for <linux-mediatek@lists.infradead.org>; Thu, 16 Nov 2023 13:05:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1700168709; x=1700773509; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6LnOWp0wbZeObmNmr90HTPFuULXlWCJKvWy7NEbdx0E=;
        b=X7ihW5vksBZy5xHAXcZv8YLfL4MUypQc3rg5AFKueSN99ZeJy/6GBsoX1jI6oeY9PP
         n9AQ4u1Kaah1/kpLgIx2H73GTMReAShOjjneyJa5dSItUFNgPVUXnvw3FeDFlHPZiBYs
         ICKwZ0nPhKWAtBevPkmCyda3A1andUPhI2SYw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700168709; x=1700773509;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6LnOWp0wbZeObmNmr90HTPFuULXlWCJKvWy7NEbdx0E=;
        b=IjB2gHqFPPzw/rwWlp5zBGKtbgfZ4oEXfuE2QO3A3pllYYK05ShUVZpTB5tdVv8BEf
         ltYicuW9VnKbeuj/3QsqHRWzxyG2dIxATW22sKeJY461c3WVT40uGOwU4mTL0SVQ9Yof
         0UfnKoIA9WZEOrNOj46gOhHscAKq2LsUc3KbwSEdLkOO1I9lEl0wmmf+RgtDYVRcZekh
         ZtVYJWx1wnygbNkSb8vg+EM4oBFRzz467i1wyP7E+t0We21Qo3mIVCnabe+3Hwsuf5zE
         luKl8PJZ/2EYkqEf+JVbP0TW/zSjs6xRS2l98rFqFjEmzySQ09A7MWkz6csTwzbObaKd
         EuBA==
X-Gm-Message-State: AOJu0Yxc2nEZiIJPUbrMnX1ft4cjdLV2prH55xS6s1sx03K1X82iIBvU
	K1rCRFQJhyXNV5IIfcdW0OUTBw==
X-Google-Smtp-Source: AGHT+IHEcDMzDv8F2Oib5Qf07Br9pWMJl9y1OcHWOsIqcz/VA8rMATUHrvctjqpJr/W3EhXRV0fyVQ==
X-Received: by 2002:a17:902:8209:b0:1c9:d0a0:ee88 with SMTP id x9-20020a170902820900b001c9d0a0ee88mr3479430pln.62.1700168709074;
        Thu, 16 Nov 2023 13:05:09 -0800 (PST)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id iy4-20020a170903130400b001b86492d724sm93407plb.223.2023.11.16.13.05.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Nov 2023 13:05:08 -0800 (PST)
Date: Thu, 16 Nov 2023 13:05:07 -0800
From: Kees Cook <keescook@chromium.org>
To: "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>, Kalle Valo <kvalo@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-hardening@vger.kernel.org
Subject: Re: [PATCH][next] wifi: mt76: mt7996: Use DECLARE_FLEX_ARRAY() and
 fix -Warray-bounds warnings
Message-ID: <202311161304.3B03C95B3@keescook>
References: <ZVaCNAohuieMmdq9@work>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZVaCNAohuieMmdq9@work>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231116_130512_282733_0EB32829 
X-CRM114-Status: UNSURE (   8.63  )
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

On Thu, Nov 16, 2023 at 02:57:24PM -0600, Gustavo A. R. Silva wrote:
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

The syntax looks a little funny initially, but yeah, that's how we need
to fix it for now.

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook

