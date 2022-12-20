Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1A84C4332F
	for <linux-mediatek@archiver.kernel.org>; Tue, 20 Dec 2022 21:01:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=88yRQkH8x/8fi3zx+xak9LdLlIZZTX7XIR+oFyhPiJU=; b=JH+9QE7uJjkJmWhmFzuSz8mu/N
	yUFHtr9XzsRn6fj9iENSc+ybybGoS64wOXASIh7D0eYtzbgWd8bLRRtOyG5AekMjVPGWV4xrMah5x
	yLt8ZzBny6wYigW+aFa0EMrOdLMn4lglOmxtgh2JpQGhTiGqPLLpWGKIxeSbtz2kGMzIERnfMfOQR
	XgfuGsLugIdxgNMQoJlq34KNuSPKJSuZJlfjcxWMP5zcFplX1RfuUswQYTR1AFsxBz8/TS0xqU3gN
	WPI04H7ZyrcrTnvG0b9mR0mb+LUr08XvtrwzGb8w+4p8aDtKBHKtzupQNOPTPLkWqXPqreY916Yee
	fenY6Q/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p7jjU-0043ab-Pc; Tue, 20 Dec 2022 21:01:04 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p7jjO-0043Y6-Nx
	for linux-mediatek@lists.infradead.org; Tue, 20 Dec 2022 21:01:00 +0000
Received: by mail-ed1-x52b.google.com with SMTP id c17so19262952edj.13
        for <linux-mediatek@lists.infradead.org>; Tue, 20 Dec 2022 13:00:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=88yRQkH8x/8fi3zx+xak9LdLlIZZTX7XIR+oFyhPiJU=;
        b=ikVGT9c7jlXGiAFQm/eF+ljkcJz0xH53jGjqSJQ1ajIIdtYfc4fc9uKpjQNwfNhecR
         eA7UTfijcug1LXEFvL1mgLlq+tZwAmOmN+yKewwD3SOIvwlaLX9tDOqZUdupCtj/4H/c
         jug5yeGyniAbp7KxvhH8WsQeFxPHU3HJV9rz4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=88yRQkH8x/8fi3zx+xak9LdLlIZZTX7XIR+oFyhPiJU=;
        b=Lht/3fk0SlBiMKOjOIZNmEZfkpfPp0lxC2C+iWOhXQBb6LC7sAcQ+cdbh/g+QOM2ot
         N8PrvsHSnFWuxOorKwU7qPIyQ7chFyyt5MOnLCqO7tM+gVFrfd58u/baFySrWUcjhkT6
         uYu7GeE2qO0uWxWs+ozrNnHCEi978KSVw195qJe8wCXSec0vZVot2ogk+kV47lY6/rhp
         jPkUm0fjANZlYSJyPXMsqIn5rp9J2pJs9m50IXhwRyB/4p3FJj5WTdaANvjslbiUR7H7
         mLiUzvUrcqJE9csPsXz1+DZOtKjGkhvuSBp7VbBsWqlSnOY4RyHSH4Z9ia0TL5d8nmCe
         YkxA==
X-Gm-Message-State: ANoB5pnLzoBOAPGdTzhMnJR5z/UXBRIkpkgBrUj9wTFCS1laaDpST4Zh
	Y/T2y8hFNeaBDzJzfCJ689K+eYDz/imJ9atSFZeMbw==
X-Google-Smtp-Source: AA0mqf540Ch/JyuFpiiDKWPOAX59KoM461AXv5sAa0B7Q2e4Vyjz9hcXS6IiMrETD1/aDN3GVzZMwHYxSRcJwIai+dA=
X-Received: by 2002:a05:6402:f1c:b0:46a:b1a9:c34e with SMTP id
 i28-20020a0564020f1c00b0046ab1a9c34emr33491776eda.212.1671570055865; Tue, 20
 Dec 2022 13:00:55 -0800 (PST)
MIME-Version: 1.0
References: <20221208072520.26210-1-peter.wang@mediatek.com> <yq14jtyekv2.fsf@ca-mkp.ca.oracle.com>
In-Reply-To: <yq14jtyekv2.fsf@ca-mkp.ca.oracle.com>
From: Daniil Lunev <dlunev@chromium.org>
Date: Wed, 21 Dec 2022 08:00:44 +1100
Message-ID: <CAONX=-d-LZSV9-R=oLDFKsBG8Zd90wXOcGR44kPaorDH-Y7MnQ@mail.gmail.com>
Subject: Re: [PATCH v6] ufs: core: wlun suspend SSU/enter hibern8 fail recovery
To: "Martin K. Petersen" <martin.petersen@oracle.com>
Cc: peter.wang@mediatek.com, stanley.chu@mediatek.com, 
	linux-scsi@vger.kernel.org, avri.altman@wdc.com, alim.akhtar@samsung.com, 
	jejb@linux.ibm.com, wsd_upstream@mediatek.com, 
	linux-mediatek@lists.infradead.org, chun-hung.wu@mediatek.com, 
	alice.chao@mediatek.com, cc.chou@mediatek.com, chaotian.jing@mediatek.com, 
	jiajie.hao@mediatek.com, powen.kao@mediatek.com, qilin.tan@mediatek.com, 
	lin.gui@mediatek.com, tun-yu.yu@mediatek.com, eddie.huang@mediatek.com, 
	naomi.chu@mediatek.com, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221220_130058_867360_EE9210BB 
X-CRM114-Status: UNSURE (   5.97  )
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

> Applied to 6.2/scsi-staging, thanks!

There is an interesting side effect of the patch in this iteration
(which I am not sure was present in the past iteration I tried):
If the device auto suspends while running purge - controller is
seemingly recent and thus the purge is aborted (with no patch at all
it hangs).
That might be ok behaviour though - it will just make it an explicit
requirement to disable runtime suspend during the management
operation.

localhost ~ # ufs-utils fl -t 6 -e -p /dev/bsg/ufs-bsg0
localhost ~ # ufs-utils attr -a -p /dev/bsg/ufs-bsg0 | grep bPurgeStatus
bPurgeStatus               := 0x00

[   25.801980] ufs_device_wlun 0:0:0:49488: START_STOP failed for
power mode: 2, result 2
[   25.802002] ufs_device_wlun 0:0:0:49488: Sense Key : Not Ready [current]
[   25.802009] ufs_device_wlun 0:0:0:49488: Add. Sense: No additional
sense information
[   25.802020] ufs_device_wlun 0:0:0:49488: ufshcd_wl_runtime_suspend
failed: -16

