Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FFD4C53219
	for <linux-mediatek@archiver.kernel.org>; Tue, 28 Jul 2026 21:24:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=RP1icAzXLBZOEuHs6IcxkLzVEHKGI5tOjFuXZMBauq4=; b=1W7Ya9YhNOrr40thktQxOgLx+K
	w1AWKeqjZtP4jZP/UUJWu0PT/dwPp5wVeD5d/fj8t5sF9eiZ8xJ5v1F9s2k8lfm3HE3MDL4VWjozq
	eBzIylvT3NvFrwYq6eJwOpwtseQ1mQpNhuDXIuNuHGNBfPgmFB2VWdGO51ix/8eBpek+jWBrYaUGn
	bQoAFEFV6+79R7H8P6FJhcNwVJeC6C10PLkg3hY07LYA8ErG4JmxP2kruVyanXsvK8os0oR+OrJuf
	7VJd6yr6AQkggGCpR4DFhg04LyGIp8bbx0Dugg03yw1mLebP3L3vJANpQp66go0dKJX3Z60t6lfTi
	Hy1O1g1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wopI5-00000006JQV-0S57;
	Tue, 28 Jul 2026 21:24:45 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wopI2-00000006JPZ-1kd1
	for linux-mediatek@lists.infradead.org;
	Tue, 28 Jul 2026 21:24:43 +0000
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-848595b338cso393010b3a.0
        for <linux-mediatek@lists.infradead.org>; Tue, 28 Jul 2026 14:24:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785273881; x=1785878681; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=RP1icAzXLBZOEuHs6IcxkLzVEHKGI5tOjFuXZMBauq4=;
        b=W5fgz/6o57fxGi63g9kRLbtXF7kqCUSC0vQm40Dt0U4tqTIEXTH03TONWNOYqv5f7H
         DYpglZE9yLAT4qxZqQ98Lt7fG19HVhMALfcgkqYpOUxxlEGLAokaWk23+f2lDpEbEeiY
         legps/BiAnMKj+hP3jbLjKkM2FIcsjnXnDSUA3BX6Ig0vr5ak905EQN2wlsf7eh+NnaT
         8W8czH8Z8sU1LvRNh+JeDXqmOHvYViKHrrXWeFy6ezlexJcJuhzgf9QYY/3zAsXlJs2w
         TOgwTsTfcRiHNcvSJCozwQwbOKUGtd1eRA4parG178RGuHz+sPbOtRzCBZBftetHo7F7
         qSew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785273882; x=1785878682;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RP1icAzXLBZOEuHs6IcxkLzVEHKGI5tOjFuXZMBauq4=;
        b=WQmDCvNoibm6hHJjxJ0T1LnWq9/+M2yPkl4FYhmUsTv389y3BWQtm1kCF1KgUuer7L
         qRjjm0onRDu7KOFL+PlVyGwHZzfyzr5Pd+QgwLu4DHyt0xZcdtLd2Pi9HV2YPU6HUvJs
         bH0G5ryE3+ZA7OPBq8LB/9DGq/hL3Ij6lbas1jwFiJ1i2phrn4gJST9zvGlbD5LKq3gu
         xcSvI3uwv42jj1WU7KyOjjpn1Z4iUfnvA7LTvwPPFscgNFf6gkwz3SZ1KqgtJQc0Evnf
         9Fd5S8UmUL2+3bwFueBKIGWtOUlOEVOzGCd2JNpPR+orKHua6LVhfzd1oG1neRwBbYWh
         AMbQ==
X-Forwarded-Encrypted: i=1; AHgh+RpBEGC4CyGcT8f8UB+qkYg0QSCuZxFLZKbOiATvLjLeorVPq8Q98xGAqqjbq+YtNIyTYLodeY8pEVSMvLEPdw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxUlU6mRaL/5ghB7gWFj3oR2hA2wGOauLhLHuQsy3ltSxYpUX6q
	avLz/uMcM5FlKrLiRiKhTBz08b6t14lEv+56wbbWie6wB47szy2hg1Fp
X-Gm-Gg: AR+sD10qzVnY85ZJhfGH3A7nX8tvDDnVt56t84yIxA8Jkb62h7izqvF0Se+k3MU7VRS
	eOYNktssmSTUkXOJSk0O/GbVKUb9YusNGptKY5sBaSf0fWEsfJeDxmjT8FlgQVkXGU4ZHbi8/Pf
	li6IQYEI2EniusELdn1Q6VGrdknDE7i1/9ttuxveLhPcct/xLXm6VlCYhoMHDelUpAy2NbOvZj2
	f57SEqz3+5z+veFmkH6uFWZx7NyJ+v/Pyajp2ILeZHSelh+1pcT7L7AapAIK9791GOwOpZWHcpR
	FKGRyTRuriaPt3nJIeGUcu1BPoRU3vw8ZltQ5cdfu+ROfWejjc96wx6Mr0K87CaFPD0bIrD27ZI
	Eid2+vHIiGdXZaV7hiPnUgFIbyponKXo0b1qQ/omS2TVn/KQUeoHNFUeg61XcYsEnzJJCVa8+Gg
	Dl+loqVci9lm3L/Iv1YxPBomFOrgJGocs4rKgauKoa38cmxHbIN0IocMfnb1rJxDh0l6jBglY9M
	lw74ezcC8ViRO4baJGY5w+GmJeN7nAX+tWxCUiDKK5HUakm2P/swif07h3Q/5a6YPv9TRDhwo6k
	6gbSNbwbeeSyPTWeOymjhftir+VJX6tEiS03OIQ=
X-Received: by 2002:a05:6a00:b50:b0:848:19f6:4dfb with SMTP id d2e1a72fcca58-84e9335a753mr4385834b3a.56.1785273881527;
        Tue, 28 Jul 2026 14:24:41 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cbdb83459f6sm80892a12.14.2026.07.28.14.24.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 14:24:40 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-input@vger.kernel.org
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-kernel@vger.kernel.org (open list:ARM/Mediatek SoC support),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
	linux-mediatek@lists.infradead.org (moderated list:ARM/Mediatek SoC support)
Subject: [PATCHv2 0/2] Input: mtk-pmic-keys: probe cleanups
Date: Tue, 28 Jul 2026 14:24:36 -0700
Message-ID: <20260728212438.54078-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260728_142442_456837_433E7973 
X-CRM114-Status: UNSURE (   6.17  )
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

Replace an open-coded of_match_device() lookup with
of_device_get_match_data(), then rework the key-counting logic
to iterate child nodes in a single pass instead of pre-counting.

v2: split patches up and add irq checks.

Rosen Penev (2):
  Input: mtk-pmic-keys: use of_device_get_match_data()
  Input: mtk-pmic-keys: Count available keys during probe instead of
    pre-counting

 drivers/input/keyboard/mtk-pmic-keys.c | 76 ++++++++++++--------------
 1 file changed, 35 insertions(+), 41 deletions(-)

-- 
2.55.0


