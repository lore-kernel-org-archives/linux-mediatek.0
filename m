Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E543AC4332F
	for <linux-mediatek@archiver.kernel.org>; Fri,  2 Dec 2022 22:06:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:Date:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=YGmhfz9LKketteJ29KbDn67sA38cLHNS36kuvwxlMm8=; b=h0HxoZfWZe18qyMQTZUnge/Deb
	MHYhpTdg7WU4v9ESLSOQnKuCrROVdUcnBYgZmUKUWRCc3ROrmt+KPEug2kLUMvL8GpPyIJ+AuuFBa
	5HIE2fE2S80zGYQVNJmLTblNDAA9u5Z3VABri7mZIjjAVh98d6Q5r6uHA1O7P8xHopkbBt5M+VsFg
	2pHzml8BjquN2/W02285xG7QPdUeN4S1ciO5Cy0kumiYRyYId58wuoKNXg4TihjVBP4lBhSM1IaNA
	rzz6eIfpviKOmRFOB340PQxzG+4DyGfgaLL26zSzRyDM448CwVTlwHmYi5nuLgMczpqaF1qtl56/I
	4hW3n5PA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p1EAW-001TTD-1d; Fri, 02 Dec 2022 22:06:04 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p1EAL-001TQn-Cl
	for linux-mediatek@lists.infradead.org; Fri, 02 Dec 2022 22:05:54 +0000
Received: by mail-pf1-x42a.google.com with SMTP id 140so6132566pfz.6
        for <linux-mediatek@lists.infradead.org>; Fri, 02 Dec 2022 14:05:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-disposition:mime-version:message-id:subject:cc:to:date:from
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YGmhfz9LKketteJ29KbDn67sA38cLHNS36kuvwxlMm8=;
        b=TSqUQgbjbBdg6dvDWR1KVKuTEI3gAe6/W+8DLD7nw2mWi+QX+pcwtPxwJFoxQmJGEe
         uNxgwfWgkBGeh75QcHsRkRMQfxOkr6GVNv7M9DU6N537BAZNupUYZmYR8DdUZWlAAwbR
         KMF3Htct7RWcrCqmWw5tW/Ic0PXvyQHTzFYVE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:date:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YGmhfz9LKketteJ29KbDn67sA38cLHNS36kuvwxlMm8=;
        b=S8MSXLbqmn7W2FgRtzVBB7StcXgZjHiaaI3r2/v1q3pkxrgjZHqMFJ0uLSlVnR8QcJ
         6ECLzp0Cg+q23caQMCPL4xDRTYtAEh0epI6y/WFa2qe2Z99Ezszttl4hHtBX9wbo7vF8
         k/C6kOpx6vf9+rQdwZcNcgg2+JY38tplMZAauOVog+LUnOTavnLeH07C9+jXQ+hSA3id
         rZhr2FFutt6FYG1nEMy0xxtMiwmMSDPVaAaxk5255iPeUgfPnyOAWu6QcRg2jyEqfSh/
         o+/xS5PJdcL/yl2ipCWZLDbAWeQNG2Hs/Q6FHD57Gx5mszEY3uvCQTMG5Ykyqhya+iMH
         ZjOg==
X-Gm-Message-State: ANoB5plLuu3rZP9oBC9KtduniRATcLRbpe3NHkEJ56V/R52iCrjyzPTu
	25LxIWBt4LSU03JWaoihryAeWQ==
X-Google-Smtp-Source: AA0mqf5DhG6zysI+aj3WH5KAazaNoxWHCLIcnDeHYGVOYKMWwq4jAur5eQGJ0+dbDGN2a+EriUvEoA==
X-Received: by 2002:a05:6a00:4009:b0:563:2ada:30a3 with SMTP id by9-20020a056a00400900b005632ada30a3mr55402742pfb.27.1670018745233;
        Fri, 02 Dec 2022 14:05:45 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id s24-20020a17090ad49800b00210125b789dsm5170014pju.54.2022.12.02.14.05.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Dec 2022 14:05:44 -0800 (PST)
From: coverity-bot <keescook@chromium.org>
X-Google-Original-From: coverity-bot <keescook+coverity-bot@chromium.org>
Date: Fri, 2 Dec 2022 14:05:43 -0800
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
Subject: Coverity: mt7996_rf_regval_set(): Integer handling issues
Message-ID: <202212021405.93CF11D2A@keescook>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221202_140553_457464_227A8375 
X-CRM114-Status: UNSURE (   8.13  )
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

*** CID 1527816:  Integer handling issues  (INCOMPATIBLE_CAST)
drivers/net/wireless/mediatek/mt76/mt7996/debugfs.c:657 in mt7996_rf_regval_set()
651
652     static int
653     mt7996_rf_regval_set(void *data, u64 val)
654     {
655     	struct mt7996_dev *dev = data;
656
vvv     CID 1527816:  Integer handling issues  (INCOMPATIBLE_CAST)
vvv     Pointer "&val" points to an object whose effective type is "unsigned long long" (64 bits, unsigned) but is dereferenced as a narrower "unsigned int" (32 bits, unsigned). This may lead to unexpected results depending on machine endianness.
657     	return mt7996_mcu_rf_regval(dev, dev->mt76.debugfs_reg, (u32 *)&val, true);
658     }
659
660     DEFINE_DEBUGFS_ATTRIBUTE(fops_rf_regval, mt7996_rf_regval_get,
661     			 mt7996_rf_regval_set, "0x%08llx\n");
662

If this is a false positive, please let us know so we can mark it as
such, or teach the Coverity rules to be smarter. If not, please make
sure fixes get into linux-next. :) For patches fixing this, please
include these lines (but double-check the "Fixes" first):

Reported-by: coverity-bot <keescook+coverity-bot@chromium.org>
Addresses-Coverity-ID: 1527816 ("Integer handling issues")
Fixes: 98686cd21624 ("wifi: mt76: mt7996: add driver for MediaTek Wi-Fi 7 (802.11be) devices")

Thanks for your attention!

-- 
Coverity-bot

