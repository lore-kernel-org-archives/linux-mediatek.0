Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15B99C4332F
	for <linux-mediatek@archiver.kernel.org>; Fri,  2 Dec 2022 22:22:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:Date:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=aMS0b2RE+vIHMOYP2E8EZZmUlghR9trNposIEeXjKJI=; b=vxp6ZFR1g7ug3gpiMm9hmSqnAq
	0KptR65mC0J2PkrtKA/jb9n/6gZQz+2Peka8KpdJpga7kdYmmPM5CO/lgbeLizWcC2MZtft4wBYus
	r0/eucN2nUPwidijoUOuABgVHS5iVFkDc2E6V4n0sO0e4BGjQXYLJDBkcuZxhziH3a216V2yo/r8B
	mJSaLo8xdX/cBY7r6qYrUcUGra899W3TMP3idZ1Pk2zObYJxQfy6+i6m4SlTaWHLrO/7OQuYeXG9e
	nbc5reb+0J7rdDBBVJQc9g0Xu2MHMXMz83woJ8SEixTH2DReM+Xe4UfqIMuZTbqE+IQyChY2KKGAc
	Gkp98oBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p1EPv-001VFm-9N; Fri, 02 Dec 2022 22:21:59 +0000
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p1EPl-001VDx-Ls
	for linux-mediatek@lists.infradead.org; Fri, 02 Dec 2022 22:21:51 +0000
Received: by mail-pg1-x530.google.com with SMTP id q1so5460599pgl.11
        for <linux-mediatek@lists.infradead.org>; Fri, 02 Dec 2022 14:21:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-disposition:mime-version:message-id:subject:cc:to:date:from
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aMS0b2RE+vIHMOYP2E8EZZmUlghR9trNposIEeXjKJI=;
        b=GNTcUDsFn03JscGIy0a+vYklYFfFxJZZqGpErbZZkJXfUy51L4mNHn15JV39Wn01z3
         vb4zrIv5tFVn1hMThrwS+Z1/O+pe9nX5VyfbHAqFsufDYe/6mHsHteF9gFgr7BbTHhZt
         kdAMU2oSGR44L1sJjQuBc7Zg+9UiSLhcbzifE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:date:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aMS0b2RE+vIHMOYP2E8EZZmUlghR9trNposIEeXjKJI=;
        b=QCo6CS8FtGZFdoulMZRyDcyo2Fu0CiJ0Uxe2QayjlN5GAg/Gp/6VYyCIgG7Yr8hSkW
         dVVq+tjn+RGPuRXWgGPv9d2rUPLJpjxAxSoozPL2EIILiKrOQMHvqXhMA8cksGemqtEi
         l0/OA/q0htlSWy0ODVOKeLURWW8B4coV5v16Ve0jrZq+da+kEk30N9QsMY+k4vnRdHDW
         wJ/McIdWv4l1p9ZS1T4ZoXUi5Ghue8A2+puVUyWnmsu9UbjZuBfarss2mHRTc6yn25qz
         i0XH8cqJsX5I1tOzkLmznNhTAHB8SwArfNf3juXCNFdWKzfjMS3/qaC4nDQs0FNNMZCL
         TI9A==
X-Gm-Message-State: ANoB5pkJrwETw52+eFnT4i5bEEcDqiom5Nx6ysUPlMXaKZv0zhNytMcP
	A00gYY7L66lkuJEmqyrzKScW+g==
X-Google-Smtp-Source: AA0mqf793ESx/sscIPyNmg7Zc2YStJKUoN2l9l7kbnO18Sros+YI1MVyANNMCuAajv/r7OdyYX7R0A==
X-Received: by 2002:a05:6a00:3029:b0:576:6bff:1c61 with SMTP id ay41-20020a056a00302900b005766bff1c61mr3817196pfb.15.1670019708300;
        Fri, 02 Dec 2022 14:21:48 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id t15-20020a170902e84f00b00188c9c11559sm6123882plg.1.2022.12.02.14.21.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Dec 2022 14:21:47 -0800 (PST)
From: coverity-bot <keescook@chromium.org>
X-Google-Original-From: coverity-bot <keescook+coverity-bot@chromium.org>
Date: Fri, 2 Dec 2022 14:21:46 -0800
To: Sean Wang <sean.wang@mediatek.com>
Cc: YN Chen <YN.Chen@mediatek.com>, Lorenzo Bianconi <lorenzo@kernel.org>,
	linux-wireless@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>,
	Kalle Valo <kvalo@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Shayne Chen <shayne.chen@mediatek.com>,
	Eric Dumazet <edumazet@google.com>,
	Leon Yen <leon.yen@mediatek.com>,
	linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
	Deren Wu <deren.wu@mediatek.com>,
	Kai-Heng Feng <kai.heng.feng@canonical.com>,
	Johannes Berg <johannes.berg@intel.com>,
	Quan Zhou <quan.zhou@mediatek.com>,
	linux-mediatek@lists.infradead.org, Felix Fietkau <nbd@nbd.name>,
	"David S. Miller" <davem@davemloft.net>,
	linux-kernel@vger.kernel.org, Paolo Abeni <pabeni@redhat.com>,
	Ben Greear <greearb@candelatech.com>,
	Ming Yen Hsieh <mingyen.hsieh@mediatek.com>,
	Ryder Lee <ryder.lee@mediatek.com>,
	"Gustavo A. R. Silva" <gustavo@embeddedor.com>,
	linux-next@vger.kernel.org, linux-hardening@vger.kernel.org
Subject: Coverity: mt7921_check_offload_capability(): Resource leaks
Message-ID: <202212021421.6B6D4F45@keescook>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221202_142149_722148_AD148E99 
X-CRM114-Status: UNSURE (   6.29  )
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

  Thu Dec 1 17:29:13 2022 +0100
    034ae28b56f1 ("wifi: mt76: mt7921: introduce remain_on_channel support")

Coverity reported the following:

*** CID 1527806:  Resource leaks  (RESOURCE_LEAK)
drivers/net/wireless/mediatek/mt76/mt7921/init.c:178 in mt7921_check_offload_capability()
172     	ret = request_firmware(&fw, fw_wm, dev);
173     	if (ret)
174     		return ret;
175
176     	if (!fw || !fw->data || fw->size < sizeof(*hdr)) {
177     		dev_err(dev, "Invalid firmware\n");
vvv     CID 1527806:  Resource leaks  (RESOURCE_LEAK)
vvv     Variable "fw" going out of scope leaks the storage it points to.
178     		return -EINVAL;
179     	}
180
181     	data = fw->data;
182     	hdr = (const void *)(fw->data + fw->size - sizeof(*hdr));
183

If this is a false positive, please let us know so we can mark it as
such, or teach the Coverity rules to be smarter. If not, please make
sure fixes get into linux-next. :) For patches fixing this, please
include these lines (but double-check the "Fixes" first):

Reported-by: coverity-bot <keescook+coverity-bot@chromium.org>
Addresses-Coverity-ID: 1527806 ("Resource leaks")
Fixes: 034ae28b56f1 ("wifi: mt76: mt7921: introduce remain_on_channel support")

Thanks for your attention!

-- 
Coverity-bot

