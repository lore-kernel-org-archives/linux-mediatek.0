Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D81AC5DF7A
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Aug 2026 20:17:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EjzIcz1zGypMzu78Nhg1bwmrFTPlTUKvakOpJEEFMYE=; b=0hjm9yyfVR3s26mC0WNpJ5WdwJ
	cRfxKOh9zoMNatCqaJTX+hX/pxOtUm2fHs7/AVcuU7TMXBomf5BVdzoV34sT10pkPFwHaw5/Jutff
	pmgUwVBqdHmsTY/HWSOoR4hSxmWf2AUpSeWtfED54q3NtVPif6q7nl7hmHJP83c8ib6W0xKZPc6j6
	7JlyzuOAdlWHoJLSCg9m1hwICvfReRx/xUlV0C43rOJfax939JWIz+11UTHzTQYGzOrTHtawO/+Sx
	4ef+5eTgT88qIa5v4UOtey2gelQuJI3J7bAhWLArV5pvZd9j9+J/2Lk6agmyq1gJhZZ3d/7Kww2G9
	5g4Drhvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ww3la-00000006lzw-38Mk;
	Mon, 17 Aug 2026 20:17:06 +0000
Received: from mail-lj1-x22e.google.com ([2a00:1450:4864:20::22e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ww3lY-00000006lzc-2XcT
	for linux-mediatek@lists.infradead.org;
	Mon, 17 Aug 2026 20:17:05 +0000
Received: by mail-lj1-x22e.google.com with SMTP id 38308e7fff4ca-3a12ffc112cso2712241fa.0
        for <linux-mediatek@lists.infradead.org>; Mon, 17 Aug 2026 13:17:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786997822; x=1787602622; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EjzIcz1zGypMzu78Nhg1bwmrFTPlTUKvakOpJEEFMYE=;
        b=G3Hutn4Wr7Ksi1iH35IdX2bsUYZ77+BWWmCBqpX0fdQeidII0oxS+pxjCKl064ATSt
         PrtJNYnRyZOg6O1mpVaMILD7pc5RbPB8xDa4STRa3+eFz0OyafnOa5WDoFIBLnDqSEph
         FUmUMg2uoOIK/p+FboyEsNgs1SrzflaFZfEW3m8Q3581orxrxxmQqP/YeAZRYKgpGXr9
         fIcmwKc40XL/A2gtvTbNBxXwIGXxz8mCemY87TERrlZbYwAsv0P8oTPog1p/Kt0yqTQh
         wItru75CZAEpzidFgQYFkIANYhZ4jd1GVmxat/0sA8YHmzRIyPfyZaj08o/9YrAYL8et
         0m1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786997822; x=1787602622;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=EjzIcz1zGypMzu78Nhg1bwmrFTPlTUKvakOpJEEFMYE=;
        b=KCQkkBEp/XfzzUIIbZAqCb++B9/WSPXeq3sndMkE5elWRFC2lklssBtneEqvnPUcj5
         axn6lTrPLCy+5RZGX2Z0nqsLH1daObC9rSGDrWPn+NNniCJIMdbpP7aFXIhX0axcKvZ/
         EhFuumkoLJ5bxPYwNp5H6nVQi8lwpXA8221VRXgYrpcUL5bNvm/ronUUzKLDamMxk/18
         0h3rQjx4KL0fbcVUEZN54lrztbbs/fXM9i/Z3I+kOxlNd1IL4R3hDF0/bzsJf6NYH2Oc
         3ug0tx8AULeLDJLTOHluJqDWvVs/8tlGHmTNqC987eqdlLxyQLd2sgGghN8zImIfaXcU
         HMgA==
X-Forwarded-Encrypted: i=1; AHgh+RpXBnduG3syk/Kw2dDj2ttrR11IwrmmjFbWgXTyQ7ImTYdNQOFW6+0G22zqd0+coAAlMhe90KVVdfPBYLrMBw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwdfXXpbY9VPkWOYh8xOnPtYVXRcByoVeuxt5rtb+hlaeAhh4GS
	b1Dz9bY8NBMdMuI4zHx5oo9oEdTV3BFDUmW8LAVeOZQo9psVRDqRGQ95
X-Gm-Gg: AR+sD11netg/aNcZ0gU0E38V7GtMAIMkIffMIbSenHOEM3KhX99YYqgf811/txl0D0U
	+CKz2mw23BG7rsd27G51AWMj+x3WY+vLUAMcYHfyoV+EjGcohQKkVAiN5wOw37hua6zXK4diOR/
	gfAVLzAiOkN8bCZKVRAhcL1lnRmn0VhNuNNBfMrdkRZPfQooYYFZjTA+ylF/L/Ck4bzIPKpH7Q6
	sJxR5GPmKRSOD+arqKqmsVOMsCGGcYnaAPNLc83UVChIqPK0zzsP94SydkvrCPIU0DUDHa/uW67
	uudrpPA8mBdcEBwObHkXhcwfRtWhIEHLvexou1XOgSkNruwxGXeV28J5m2nGt2DwApdjbb/CugW
	/lpqYHCyNcnW+tm2PqBsSl7eZqucf+EimQ1jKvx1F9ApQ/+WzCqrb3HMuqVpi2N5KzJGPzVFBvd
	rwitrMa1av8y+oKvLFVKAQb6o4Vuo2ymXMndaP6eske1kxhrmLSnvMW3E00ijNVwTtmqwHw5zlt
	/mJNk/HgWGjBHWHQJf1Kl/njBfCH634Gg9K2BbXwoZjMWxv9K1IObvIWHsv
X-Received: by 2002:a05:651c:50f:b0:39b:439b:6246 with SMTP id 38308e7fff4ca-3a17686d024mr2948121fa.3.1786997821732;
        Mon, 17 Aug 2026 13:17:01 -0700 (PDT)
Received: from localhost ([188.234.148.119])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a16b0de90fsm7142071fa.11.2026.08.17.13.16.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 13:17:00 -0700 (PDT)
From: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
To: Laxman Acharya Padhya <acharyalaxman8848@gmail.com>,
	Felix Fietkau <nbd@nbd.name>
Cc: Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Ming Yen Hsieh <mingyen.hsieh@mediatek.com>,
	Deren Wu <deren.wu@mediatek.com>,
	linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
Subject: Re: [PATCH] wifi: mt76: mt7921: skip unknown CLC firmware records
Date: Tue, 18 Aug 2026 01:16:56 +0500
Message-ID: <20260817201656.1773758-1-mikhail.v.gavrilov@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260816174841.1918-1-acharyalaxman8848@gmail.com>
References: <20260816174841.1918-1-acharyalaxman8848@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260817_131704_661730_E1383C3D 
X-CRM114-Status: UNSURE (   8.20  )
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

Thanks for the quick turnaround.

Tested on an MT7922 (mt7921e) with linux-firmware 20260810 - the image
whose CLC region carries the idx 3 records - on a lockdep and UBSAN
build of mainline at fd923b32d761, with 9417c5818a01 applied underneath.

The device probes normally: the RAM firmware is loaded once rather than
ten times, wlp11s0 appears, association with a 6 GHz AP works (channel
37, 6135 MHz, 160 MHz), and switching between a 5 GHz and a 6 GHz BSS
and back is clean. No "hardware init failed", no "Invalid CLC record",
and no UBSAN report - so the bounds checks are still doing their job on
the very firmware that used to trip them.

Tested-by: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>

One nit, take it or leave it: both length failures print the same
"Invalid CLC record", so the log does not distinguish a table that ends
mid-header from a record whose length is out of range. Two distinct
strings would make a future report easier to read.

