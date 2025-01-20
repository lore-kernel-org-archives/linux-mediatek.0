Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06AB4C02185
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 Jan 2025 09:29:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=K+MI+u0r5nmDDyideUn4iA2W/bJzlgTGbb4Lc2kEswU=; b=eh5SHcgu27nkzA7Jr1NFO3gbBL
	OjePCl62kp1Isbv9BTnN8XqB/gpYAapOdcQo2DZBOMYqiKCOdRFOcA3c/HDVQKfOUIqmF/QDWTnK2
	2EOuK3VVqRuUGqBSt6OOJGN2HKFhGow6byOkttZVmfUbRz1i+Y8im1NT92gW+PgGGoykI6rNYu/2d
	2in4DNsTC4F0K2CK3ZNoOHTmPQYDV4WFv4+1n4fv8FJsU7o9S8ew37T5kW5CIAWFdiXa0PTtZOmU5
	/+DyMCXy8mRjLUdCIP8GPwcMJH1/rV7qhucCyONzuUcF9mA3jkHqtpvixyF9obEIxInfDw/krFZGY
	sL6B4orA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tZo64-00000005BNd-0aTE;
	Mon, 20 Jan 2025 09:29:28 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tZnxP-000000058um-1H4N
	for linux-mediatek@lists.infradead.org;
	Mon, 20 Jan 2025 09:20:32 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-38a25d4b9d4so2269898f8f.0
        for <linux-mediatek@lists.infradead.org>; Mon, 20 Jan 2025 01:20:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737364830; x=1737969630; darn=lists.infradead.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=K+MI+u0r5nmDDyideUn4iA2W/bJzlgTGbb4Lc2kEswU=;
        b=LbB71+QrP3UPJoeCE/wdxFF9AUH3o9gaGqoVvmK1L5H8ygO0xL0e457DZlnVMcex/R
         d/zSZXLBkhh6YwBabu4pnfho6iNyUPSITiDMtOT8cKkOJBsQtMnndpJngb3cV6an98fu
         yQueHnoYNJrv/ccZ4zpM5NT4vk6yjv1qQllDXcSaPEwKN/AmcmFipl1zaR0LgpcY/TRH
         UPXi9Wm4CkilKHPlc6AGGeEj82wLO264nkm3cJaKKD0w3ClxBVPLSwtRDqZLD8c9ohqX
         +p/gVOzJOmM0vDx1jZVv9mIGngnGIbqExnIwQyBbwkUC4RlKCPq7kc2YaigM5+9hQOfh
         ebEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737364830; x=1737969630;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=K+MI+u0r5nmDDyideUn4iA2W/bJzlgTGbb4Lc2kEswU=;
        b=Cu9UkaGdiO+43ELvYLfFhF/CDD/MOTpg8B9eq/ICix1KgnY8M4DieyhwHYWngkMaFM
         VncETUyrFi5/tBRRfE0ZF9YjGL3AoTfek4RnSsQf/78dYXR8V3mtcuU30RLkCWVgs5Fk
         cqaY7bxtcXMy+zGhPGU/eREbSt1QcOXnFXpr0ehsPWJlJQr+RwbJZuJLLm9saACjGiuA
         /+JhVl+MPYrmC0AdVz9u8m14q39VE4yjTKHhdV9vFvnI986BgwroyLUw/6QLremQe5aQ
         +oPYeU7lRAF6npKqGVeNKu/aSxzLDraxZlfTeQBTYzVuweD8GH0ed8KR0u30Hm1xGKgk
         iRlg==
X-Forwarded-Encrypted: i=1; AJvYcCXM+22Ig66bV6kwi4NAD9PpEtg8TbPhGgBrUnTPOyzGFnAuJC9B/Y6n3oV6cIt2BYQwjjdEkdxxDu8q8paK7w==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx3n97enqa6OgbWOQtQXjvR+qGTqFyvlIA0YmCmbNPFSE7JXVo1
	jzgwWYt55qdi2v5S0NKTEmITZM6epIhywHR//+cJ9yCbwXU6sdWOJqnhBaH71zs=
X-Gm-Gg: ASbGncteC0/OT4Nz8k6f4r/5oqNnwXnHHiVNbpwRh9i+bWb0q4d5+9ZqieH8vxzjt0c
	2Njx2beKcZENFrcHehwhFGDbY4k3fF+/uKfYbAibeTcuMuKwIVmvMqbVREwtiSkghtbjsDf7Rf/
	KQ0PJrK1uaeIHhfudH7p9RSL5AFe4TH6OOqPAX4BixVxNXHCRPKR4BPtenS9TiizrhnptLIz1dW
	kXxmpsUHsmlc/azopYz4wK/6/sZLhcrVy35NDUOcT3p6Wk1eNry4qwbDlU0S6kFze81+gttFDA=
X-Google-Smtp-Source: AGHT+IE951ujzmhJ2rD1FLfPGRx3GbzXil4Mm/ozNFnW5ZwjZZ/06E0FRMrSv6w8FUjOgMHUl3oWDA==
X-Received: by 2002:a05:6000:1fa8:b0:386:32ca:9e22 with SMTP id ffacd0b85a97d-38bf57a9b6cmr12789630f8f.41.1737364829798;
        Mon, 20 Jan 2025 01:20:29 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38bf322ab42sm9627869f8f.44.2025.01.20.01.20.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jan 2025 01:20:29 -0800 (PST)
Date: Mon, 20 Jan 2025 12:20:26 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Shayne Chen <shayne.chen@mediatek.com>
Cc: Shayne Chen <shayne.chen@mediatek.com>,
	linux-mediatek@lists.infradead.org
Subject: [bug report] wifi: mt76: connac: rework connac helpers
Message-ID: <33242ead-4f91-40c7-908a-6bfb87977611@stanley.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250120_012031_662716_23EC63EE 
X-CRM114-Status: UNSURE (   6.04  )
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

Hello Shayne Chen,

This is a semi-automatic email about new static checker warnings.

Commit a0facfc80ec1 ("wifi: mt76: connac: rework connac helpers")
from Jan 2, 2025, leads to the following Smatch complaint:

    drivers/net/wireless/mediatek/mt76/mt76_connac_mac.c:307 mt76_connac2_mac_tx_rate_val()
    warn: variable dereferenced before check 'conf' (see line 300)

drivers/net/wireless/mediatek/mt76/mt76_connac_mac.c
   299	{
   300		struct mt76_vif_link *mvif = mt76_vif_conf_link(mphy->dev, conf->vif, conf);
                                                                           ^^^^^^^^^
The patch adds a dereference

   301		struct cfg80211_chan_def *chandef = mvif->ctx ?
   302						    &mvif->ctx->def : &mphy->chandef;
   303		u8 nss = 0, mode = 0, band = chandef->chan->band;
   304		int rateidx = 0, mcast_rate;
   305		int offset = 0;
   306	
   307		if (!conf)
                    ^^^^^
The existing code assumes "conf" can be NULL

   308			goto legacy;
   309	

regards,
dan carpenter

