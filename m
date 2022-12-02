Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EDE4C4332F
	for <linux-mediatek@archiver.kernel.org>; Fri,  2 Dec 2022 22:11:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:Date:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=w0dcCRAw7breQBxRgO7vXMzRE1EKaCH1sm8fAccBDKk=; b=AMfDrCJW5Z3rzqKCfAyeCNUZ5x
	SSkhYetCf6FbN261mTi0xI88kZR2A+uD4VkzvEsmFiaSzeppfTzJrEinU5lVatp4+qwP3bhA2sVJ/
	LHyZ1YIDzsz4Qw6IyLdBgGiVcFmyEb941BaZNIaEv1+s4RW/hkbw0WNq8RrcKO3nBpxmP8grGawdi
	no6YQyC7PeIILu2vHCsemA4M9s0O/Qq4JNQSVpCPiMlMtGCyj5e5y9ljuhTO909s+0m2pYDRDJ2nf
	YYzvfU43nUboajNGOBF1mnXfOFb/P8BdmrYydcwBeJviLxFEj+uJY4e7FQGWlVoR7Xguq+Xp3QUiu
	EJTgRGxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p1EFv-001UAz-F0; Fri, 02 Dec 2022 22:11:39 +0000
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p1EFs-001U9n-Ev
	for linux-mediatek@lists.infradead.org; Fri, 02 Dec 2022 22:11:37 +0000
Received: by mail-pj1-x1036.google.com with SMTP id t17so6154987pjo.3
        for <linux-mediatek@lists.infradead.org>; Fri, 02 Dec 2022 14:11:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-disposition:mime-version:message-id:subject:cc:to:date:from
         :from:to:cc:subject:date:message-id:reply-to;
        bh=w0dcCRAw7breQBxRgO7vXMzRE1EKaCH1sm8fAccBDKk=;
        b=OwVi+W7xvxR/nGjj39pmX3oRQiji/LPiwOpKAVbcIfM5DiCUEx2CVjjGCPgXGrAYj2
         5UoXRgnzXLZKAL8W05vLqFxBXlQ6XcoYM3KtBnvhqQMVng3lNY2A1Ac0VfEk1e+mkKH0
         2KCcNECGN1AEN2hcX554Bmw8qWfXqc5l8cIxA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:date:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=w0dcCRAw7breQBxRgO7vXMzRE1EKaCH1sm8fAccBDKk=;
        b=rbCX3SX7nT6QHCqRhgk01DoaDj4S7lJ+ESSYADKFwEwiymgfMVCS6s6K4ZeXA98EZG
         dG8oxXNK1e9kHP5WYphd4V4cHCWDkm9/vHNZ+Zj+8gfqgBycsQ8yghlulqsU0rzln4kR
         ZUkJxSI3VNJHQn9JSgLhaYnyIKQasHDmx68/pZOLg8ykjt9Q6ZiDtfL65cZvIWfI87le
         n4rhlmzxomZlg6LHm5wcP7ENW28uvFHMst6FQuEnoeYQ3ymAWiXoItqR0gqsliSPgPCQ
         WfXX3lVVd1BAjeIe+R+2podj6Xd1bYGHQbq7xNBZLx525qkZvheGiiH1gonyL4ceEJVg
         7bXg==
X-Gm-Message-State: ANoB5pkUeYtKfrU9Ad03+LPgbSJDJOej02LERKES1GAp8bKeLjkzTqus
	7Pt011Tya89LLk1PohIFpuAWFg==
X-Google-Smtp-Source: AA0mqf6QTLbmI+X8jti2r+C7tdO68/bOJUECQQLNnuZG8zdOtdYlL2NT2bZgqzSjU6DeRIsbPY36zw==
X-Received: by 2002:a17:90a:9e5:b0:219:5139:7fa8 with SMTP id 92-20020a17090a09e500b0021951397fa8mr20815064pjo.15.1670019094904;
        Fri, 02 Dec 2022 14:11:34 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id h131-20020a628389000000b0056bb36c047asm5510216pfe.105.2022.12.02.14.11.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Dec 2022 14:11:34 -0800 (PST)
From: coverity-bot <keescook@chromium.org>
X-Google-Original-From: coverity-bot <keescook+coverity-bot@chromium.org>
Date: Fri, 2 Dec 2022 14:11:33 -0800
To: Shayne Chen <shayne.chen@mediatek.com>
Cc: Lorenzo Bianconi <lorenzo@kernel.org>, linux-wireless@vger.kernel.org,
	Jakub Kicinski <kuba@kernel.org>, Kalle Valo <kvalo@kernel.org>,
	StanleyYP Wang <StanleyYP.Wang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Peter Chiu <chui-hao.chiu@mediatek.com>,
	Eric Dumazet <edumazet@google.com>,
	Money Wang <Money.Wang@mediatek.com>,
	linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
	Howard Hsu <howard-yh.hsu@mediatek.com>,
	linux-mediatek@lists.infradead.org, Felix Fietkau <nbd@nbd.name>,
	"David S. Miller" <davem@davemloft.net>,
	Evelyn Tsai <evelyn.tsai@mediatek.com>,
	linux-kernel@vger.kernel.org,
	MeiChia Chiu <meichia.chiu@mediatek.com>,
	Paolo Abeni <pabeni@redhat.com>, Sean Wang <sean.wang@mediatek.com>,
	Bo Jiao <Bo.Jiao@mediatek.com>, Ryder Lee <ryder.lee@mediatek.com>,
	Sujuan Chen <sujuan.chen@mediatek.com>,
	"Gustavo A. R. Silva" <gustavo@embeddedor.com>,
	linux-next@vger.kernel.org, linux-hardening@vger.kernel.org
Subject: Coverity: mt7996_hw_queue_read(): Integer handling issues
Message-ID: <202212021411.A5E618D3@keescook>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221202_141136_544839_CD75FA3A 
X-CRM114-Status: UNSURE (   9.16  )
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

Hello!

This is an experimental semi-automated report about issues detected by
Coverity from a scan of next-20221202 as part of the linux-next scan project:
https://scan.coverity.com/projects/linux-next-weekly-scan

You're getting this email because you were associated with the identified
lines of code (noted below) that were touched by commits:

  Thu Dec 1 17:29:14 2022 +0100
    98686cd21624 ("wifi: mt76: mt7996: add driver for MediaTek Wi-Fi 7 (802.11be) devices")

Coverity reported the following:

*** CID 1527813:  Integer handling issues  (SIGN_EXTENSION)
drivers/net/wireless/mediatek/mt76/mt7996/debugfs.c:460 in mt7996_hw_queue_read()
454     	for (i = 0; i < size; i++) {
455     		u32 ctrl, head, tail, queued;
456
457     		if (val & BIT(map[i].index))
458     			continue;
459
vvv     CID 1527813:  Integer handling issues  (SIGN_EXTENSION)
vvv     Suspicious implicit sign extension: "map[i].qid" with type "u8" (8 bits, unsigned) is promoted in "map[i].qid << 24" to type "int" (32 bits, signed), then sign-extended to type "unsigned long" (64 bits, unsigned).  If "map[i].qid << 24" is greater than 0x7FFFFFFF, the upper bits of the result will all be 1.
460     		ctrl = BIT(31) | (map[i].pid << 10) | (map[i].qid << 24);
461     		mt76_wr(dev, MT_FL_Q0_CTRL, ctrl);
462
463     		head = mt76_get_field(dev, MT_FL_Q2_CTRL,
464     				      GENMASK(11, 0));
465     		tail = mt76_get_field(dev, MT_FL_Q2_CTRL,

If this is a false positive, please let us know so we can mark it as
such, or teach the Coverity rules to be smarter. If not, please make
sure fixes get into linux-next. :) For patches fixing this, please
include these lines (but double-check the "Fixes" first):

Reported-by: coverity-bot <keescook+coverity-bot@chromium.org>
Addresses-Coverity-ID: 1527813 ("Integer handling issues")
Fixes: 98686cd21624 ("wifi: mt76: mt7996: add driver for MediaTek Wi-Fi 7 (802.11be) devices")

Thanks for your attention!

-- 
Coverity-bot

