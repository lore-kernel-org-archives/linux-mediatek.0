Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7112FC88E6F
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Sep 2026 16:48:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UrOlDT7L1Dl8kz1yM8HMjcw+s4ZfZbKkhGl/ULkPQG8=; b=Yd6RyYakvHCJoc/Cpw5PjVUTs4
	XC6sKOmk6Ga5+uNr+9ms/a4XxonacZPALNc07ClWTO+ZniPanW0ePLD/tZxjsrZEOy+LBpvjqkcUQ
	jKJXSBFpiYBxBo/psYH///1nRX3ST/KGw6bbU3PO+6JYd18zrG+pongnFeNuZ2bW/d/kv08j5/AT3
	QyhSLnek1gZaVEScl/QHf5u27RhvnUq4HLCjIpxHdj1uw4zG3z5/sQWVOMO/yAwMsmagrg7/wo3f2
	uvHYuaH+vb/792GwgXAFwMDQOZt5Z+CKT+tr7jHsQs7kkmiJdjR5zwwcg0nvt6G8iyO9scWvBMTjt
	rv2vZhYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x69qt-00000004KOD-3mQK;
	Mon, 14 Sep 2026 16:48:19 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x69qq-00000004KNA-3afU
	for linux-mediatek@lists.infradead.org;
	Mon, 14 Sep 2026 16:48:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789404496;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UrOlDT7L1Dl8kz1yM8HMjcw+s4ZfZbKkhGl/ULkPQG8=;
	b=LpC4mqvMZA7CIxOjv61lEnxGR4sFaRYYnE/3PDF47oUv8wJtUYeaEj8FA/3TVZEXolWQSb
	YrPFUl/1L6RtbHdPd05xsoz+0iwADC7U/4vKlyxifq6UNfnYMLQX7OAD3un6PCs9CIonpQ
	tNRjpeoeYqbyq/b4T6bqBApNYkLkmsI=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-641-Y28aywVaMU-Pk5A3cmXpSg-1; Mon, 14 Sep 2026 12:48:09 -0400
X-MC-Unique: Y28aywVaMU-Pk5A3cmXpSg-1
X-Mimecast-MFC-AGG-ID: Y28aywVaMU-Pk5A3cmXpSg_1789404489
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-52fc3bff8bdso71167931cf.3
        for <linux-mediatek@lists.infradead.org>; Mon, 14 Sep 2026 09:48:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789404489; x=1790009289;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UrOlDT7L1Dl8kz1yM8HMjcw+s4ZfZbKkhGl/ULkPQG8=;
        b=jnQvkdWMxmFHHzrArrsMSQkg/9++h3KoHTkEqqr2NE64IhgbmWo3CZn9LCaQYmg0mR
         lrMytd/jRSHIb08zOc9ib5Pmnq+aqQb312ftgby/kOrcpObFdto9n5JIV7ewjdAZSS4p
         Ncw815OvszYwoFZTtn4qAAk6ygHuFQ64FVOg1u0hOQ4T1Q+L38IhsaOEaAwrKMEHQTqa
         8bK4Un5iqUUxnLi5wz/A8Hm3mnJmyIjwaAbHkK8JJ2FvgjK2C44nbvSkOEkxDtJ7bCOw
         V9SOL+srNxS2h1VC9blqkJKEcWrD4r90WP7Cv789xsXqQvPntDzlgvaX+nv1Tigmcrbs
         L2Hw==
X-Forwarded-Encrypted: i=1; AKwUvBw9VS7SrE1FKnYiF8LmxbA5g1X5mwQyMDa/S7meI7Icw5zTf1Qwsk3Q7aWQKVWGTzacw21RLqy+brkowPQ5iA==@lists.infradead.org
X-Gm-Message-State: AFuF++mFy4ATJcAQq54k9+g6vWUeeb/uSUh9a9OL8/dN0mz7MXuRbCjL
	rNGHO+dyZXVKRYAD/3Yd64MhzdE/biEH2YBOLWK5qZXWnpaWzFFs4fBLbzP5H6D/TOox7gLc7vP
	iaq7kJ8l+tHOgNEEPAKaYIigUyz1X2Qjc6XpZpM8OE5UEvUGbP/Y32qxpkLqbZT9+TT3+RLq97w
	==
X-Gm-Gg: AYBFou3OCqAGF+b8/416OsS1o2LzAhYcEYpfmC0eB+Zv/FktpExFKW7e7Y9O6bMarvJ
	B9UhUkTr8zQ6RJuaHNjzi10m6NqBM1b5d+WYTEdIyqyT+lMOr8ISU7e4DdiZiE0FaD6wSDeMC/4
	RsYVHkfMNmjutENUL0Hlv3YGzPgJ0X2Hp7uoyyJZJHGy1BxTTCaEU7G2zkHmrX6UtOacSX3MytZ
	vjpUK/Yteclt605UpF0JoXBO69PJxGoPNTo8kYqz65xpR1nY/+TxbuTrQ2jH7NkT0LrQl68twIj
	QJrwl2fmGsxX/h61Ilu9Pd0qqZmC6p8a7KA8geTbQ0lVnT62CQZ1A/ySl1Y5YrDsuEY+2qMUv49
	SUlQBwTwQ8/dAMxiDZaVghWRVFUddL/u2vLNjtmw5
X-Received: by 2002:a05:622a:1195:b0:530:cf10:8a97 with SMTP id d75a77b69052e-5310d028105mr51736241cf.38.1789404488704;
        Mon, 14 Sep 2026 09:48:08 -0700 (PDT)
X-Received: by 2002:a05:622a:1195:b0:530:cf10:8a97 with SMTP id d75a77b69052e-5310d028105mr51735621cf.38.1789404488088;
        Mon, 14 Sep 2026 09:48:08 -0700 (PDT)
Received: from [192.168.1.15] (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-530ca460a32sm104363801cf.9.2026.09.14.09.48.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 09:48:07 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: sboyd@kernel.org, jbrunet+clk@baylibre.com, linux-clk@vger.kernel.org, 
 matthias.bgg@gmail.com, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
In-Reply-To: <20260914142039.31654-1-angelogioacchino.delregno@collabora.com>
References: <20260914142039.31654-1-angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH] MAINTAINERS: Add Angelo as MediaTek Clock Drivers
 submaintainer
Message-Id: <178940446474.51095.501258130718058993.b4-ty@b4>
Date: Mon, 14 Sep 2026 12:47:44 -0400
MIME-Version: 1.0
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=344; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=+LRTP52U/oWNmbfVd/dRn41R6JZhfEc41nXAbJPqOy0=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGLJWqLosfyA364GJ7ESnXd/ZO36fyFZiL+eeKfRCIcPde
 5vTPIuXHaUsDGJcDLJiiixLco0KIlJX2d67o8kCM4eVCWQIAxenAEzkRTzDf8/S522nJQuW7m18
 cTj25s9nGxdedWLcpWzh2H3f8lH76zSG/9EhGXrvHDkW9/b4PzzBJx0qcPSXa/hRN+9URgNdRjd
 bbgA=
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Kqhq0bHPyw8kSM63kasqtbdcCxJf_YhUEBeolhQ0njA_1789404489
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_094817_866558_C37A9687 
X-CRM114-Status: UNSURE (   5.68  )
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


On Mon, 14 Sep 2026 16:20:39 +0200, AngeloGioacchino Del Regno wrote:
> MAINTAINERS: Add Angelo as MediaTek Clock Drivers submaintainer

Applied, thanks!

[1/1] MAINTAINERS: Add Angelo as MediaTek Clock Drivers submaintainer
      commit: 6b838130d2759008f8e8a80093c9eb6fcd435707

Best regards,
-- 
Brian Masney <bmasney@redhat.com>


