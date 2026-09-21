Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF9CAC982E1
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Sep 2026 14:08:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NHBznU/RKpQgFAQzB7weutwQS0p5qU29+fazNItsqXQ=; b=JZiUlPZkZ7P7PLjbaGwreflSvv
	CzZWVU0g3tIs6iNb6e0+tMqtF1GbUEVhtqIKNlgmQCWRYMwP2ihMTTy8ngEhpyAEmUDlDb0ImOfFu
	EdF5kJ30CVy1ZB+VHfQUy16ytY8qaiXGC8st8BuV1I3r1UPzI74xpxyVuf3/n47vR98gvk7eiVzym
	t4BBvBf6MI4a1gS6TlNor4YXLhnPMAs3FrY00bGb6Gf/6b1FjM/O46q5TdFONvRDUbPGjIbn7QbA5
	WNlkxHFpetnqMJdB7/WGVf8SoCdPVnmqME4kK8rr1+M8rcPnXDSjMKyOhSw7O0s1dWXStJiEy/43p
	MNZsaxlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8ego-00000002LXJ-0iaQ;
	Mon, 21 Sep 2026 14:08:14 +0000
Received: from mail-pl1-x647.google.com ([2607:f8b0:4864:20::647])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8egi-00000002LUt-1s8u
	for linux-mediatek@lists.infradead.org;
	Mon, 21 Sep 2026 14:08:10 +0000
Received: by mail-pl1-x647.google.com with SMTP id d9443c01a7336-2d55d8cd938so53817205ad.1
        for <linux-mediatek@lists.infradead.org>; Mon, 21 Sep 2026 07:08:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789999686; x=1790604486; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NHBznU/RKpQgFAQzB7weutwQS0p5qU29+fazNItsqXQ=;
        b=VxrlPgnpKWg3oT33IUDLVuiOZfofHrIWwCYEszfdbHSMy6xRe0X8iYUdtDMjkbwxwq
         jArD+9lQr+5xVuf66Y5CQH3j1u4WSWJvnMGlw5leYW9uEY/etYs+7sur5JPImbyzcmoy
         f3U8I52ndbV619lLFuH+tTERqkW4zQUgL75Ex/iECV7CWsKnzdQNRA/LPWAtHESVzTBP
         EuvS0ri2TaHlSusLrJaVRt1XuEVt0FLc25QswuoL2paIweO+iwp94Za0dDlyTqidBOiJ
         XFyKRwXiKlRceEcZe3a/jl9PaDLmupH6MFueZDhCyzfG+RM40M9bX9CtSPyw9YbQhxSF
         R/gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789999686; x=1790604486;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NHBznU/RKpQgFAQzB7weutwQS0p5qU29+fazNItsqXQ=;
        b=x0/bPdiItonuWLBUUJaC5ZoPrDZCG5NJ4FTw3meLWvXunOiKcbylM4R97keeMRCYXT
         Z7Vu+CQ4/sHiAdQcf7dsZmmp934jddSmUX87DFek50u6b7ip6nZ4e+FXbUfyWIbJMldh
         Qlc3m1GCUF5vIGJIIF6bK3iXJUpp3fDsk5YFnr+AVnEmyUTvnE/5sNaY/jQSEJ+6uz8C
         r30URwTfQ5dd6KVh7Xt1Qjcg3GdbXBsh0/T10wmWjuxwjPL2x1/wuTRe6KSYr+FoyI/3
         kexuj+6ISVLswbUTKx509HtlqWYHRogwpIu9wavYFnWK5yJuKHaPZfTJJLjiS6juwjf+
         owkw==
X-Forwarded-Encrypted: i=1; AKwUvBy/sigd85msyQTBFAFkvqD5jQdlbaDIWCDfZu6BO3uqxf3sUtSa7BvMvjnLpFUApCAv9pr+Vg+x02j4mXwtvA==@lists.infradead.org
X-Gm-Message-State: AFuF++kyObrQ75dXaUIgF97UBvhpg7BibGGg8E0P9Gh0Z0pzkLzfLujt
	HUD6+pn5MuMMjV5rVLSECzQBp32XAMuig8qn5YGAHGjY27xa9EyMffFhIaVR7j01dt2g+wGex6b
	Tt9fwkH0scduUwRr/Z1fhrA==
X-Received: from plrr1.prod.google.com ([2002:a17:902:c601:b0:2df:3de3:9186])
 (user=stanleyjhu job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:903:1844:b0:2dd:c100:942f with SMTP id d9443c01a7336-2ddc1009bf7mr110453315ad.45.1789999685875;
 Mon, 21 Sep 2026 07:08:05 -0700 (PDT)
Date: Mon, 21 Sep 2026 22:08:03 +0800
In-Reply-To: <20260920034953.19535-1-hppiscas@163.com>
Mime-Version: 1.0
References: <20260920034953.19535-1-hppiscas@163.com>
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
Message-ID: <20260921140803.3210439-1-stanleyjhu@google.com>
Subject: Re: [PATCH v2] scsi: ufs: mediatek: handle mPHY power-on failures
From: Stanley Jhu <stanleyjhu@google.com>
To: Pengpeng Hou <hppiscas@163.com>, Peter Wang <peter.wang@mediatek.com>
Cc: Stanley Jhu <stanleyjhu@google.com>, chaotian.jing@mediatek.com, 
	chu.stanley@gmail.com, james.bottomley@hansenpartnership.com, mkp@kernel.org, 
	linux-scsi@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linux-kernel@vger.kernel.org, martin.petersen@oracle.com, 
	matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260921_070808_516974_DCFB6332 
X-CRM114-Status: UNSURE (   6.18  )
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

On Sun, 20 Sep 2026 11:49:53 +0800, Pengpeng Hou wrote:
> Check phy_power_on(), attempt to unwind VA09 on failure, and leave the
> state flag unchanged. Propagate the helper result from host
> initialization as well as its existing resume caller. Keep the original
> PHY error if the supply rollback also fails, and report that rollback
> separately.

Reviewed-by: Stanley Jhu <stanleyjhu@google.com>

