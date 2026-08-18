Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CCC1C5DF70
	for <linux-mediatek@archiver.kernel.org>; Tue, 18 Aug 2026 01:19:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	MIME-Version:Content-Type:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mfkLuSdmwN1ckqZLOyJ0ADFIrM3kNuRenkgg7slseYo=; b=PrgpbN6Q6VEkOccA2/xpzXg+5w
	pN54BmTP4Oaea6Z8taUpYA8f7mMq1UaRDA5Ml7qczfi+sBzjFUzlC1iFcyzO+xhmKomFnORan64fO
	n3hRTbZi46WuhRaj1vRCqkks61i/aDcG661uuQaR7vk7FlxwLF80U8wZ1PNvtq3V7JUOPOisP3IUP
	m4u1MqdJc26owHIHOegB54bqZi1Rc3brSP4s6ZOLd/4PfzC6HdiDML8n989bHkVYKOjhsTvMtkCHJ
	q06BxtnG66KQz4VPrRZ6EmiOVUl8JuX8L4m6TjDhbP46/QVKVFoRLLLxtfPsxYGzAxhJg1UVKzqqT
	CNUqgaeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ww8UK-000000073Fz-1UXu;
	Tue, 18 Aug 2026 01:19:36 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ww8UH-000000073FD-1lkI
	for linux-mediatek@lists.infradead.org;
	Tue, 18 Aug 2026 01:19:34 +0000
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-84e84a6c4bfso515414b3a.1
        for <linux-mediatek@lists.infradead.org>; Mon, 17 Aug 2026 18:19:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787015972; x=1787620772; darn=lists.infradead.org;
        h=references:in-reply-to:mime-version:content-type:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mfkLuSdmwN1ckqZLOyJ0ADFIrM3kNuRenkgg7slseYo=;
        b=MOXmeJV0igmKdukikiDrKgo+0qX/0MCZkIbwD2rxxdBA1A8Wl+7lySvtmJZCmFjj+8
         +wSmyJOFL6s/RYBWUn2ITjwxhJUxJo73wNJc/uRKI7XwipzHkLZm5oa8+80wf4CO3Gbe
         sG5ACzyRi90/rRoR3fxsFSUN/PyCqwjpfZap4nybaDjRn2On3xI+BT2GieElF0HXuR/b
         D3N+AjR7J/XWdDuVVr99qJsBXOthFJhtAf/O7ElCa6pwPujxm28bXab1GOEU8pRvEk5N
         Md85uKD8VImilEYKGzti8CEA9JtaN9KlUNHDpO8pOJL82QFRbw4f3VftUKDZJdJH2Cuq
         rKcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787015972; x=1787620772;
        h=references:in-reply-to:mime-version:content-type:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mfkLuSdmwN1ckqZLOyJ0ADFIrM3kNuRenkgg7slseYo=;
        b=gech9VtZMFLHAOs8WChAFfQJOiBUO/uQbsw7/fQGoKzhYoc1Ag9qhEXVk5ssvXq2Bj
         Ovc7YdPjboTaMwA5H9RZ3nTjBAQL/qixG4tIwUKWBFKu3WrBirUwCSMugSzjfC2hv1yK
         0d/naIusPC8WJRcss7V678QO+rSmkybMkKVGTzxbPZzEREbwxp6SiWMqJub2lyD4nSzi
         Aj8t1iXaQYGRbENlyBYRA1ahzN8haocso8Og/h9gXFj6Q4jlyvrcsVJeS9YhFB9BsyRx
         n7Cg/WdlIz8DhaYqpNCow30f4B5UCtIqP3kkaTM8yWVL7NnRHsLW2KJ+voaWDNwh0R6J
         3d3A==
X-Forwarded-Encrypted: i=1; AHgh+RpCL3wzSatwiJAMSjuAk19SdFWDaMHx8hgEhtuVPHZGPANIKiWbv9blbvmJhTeTu+YHl77NJmCALrMcqEoeYQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwpD06cYVMJtrMex9V/OzDjX/FiLJbL3pyVISyNm6elHU9eYQXL
	dABTf54MJUThTwEt5wybLq6IxN/jEAwu9JiiPrTNEhxl3PycYt3F8kG4
X-Gm-Gg: AR+sD12rQNzItGsTQy2/oxh4Qwql7SVup9nGaQfChmt+u03QrsjBqKHGJu8GT52cQHr
	lV5PUZM66S+lStIjOwcDi7b1Tni6vfiNA0PGAW1TQtnxMZdnLm6vRg5FqKnvrja8yEE0VoUFVGt
	fjM5/7uqB/kVrH+kTwIwywTMKFN42xgh0xu8HOsgmpXVgVAQf3BbzBnuHhryt5H8u7yoG1GZbQu
	eEA7loBDl721k87qXGWj4yq36XhIG7s0K77LNojEDe43PO0bSQT7QEi9tXYZhvNqqNl+/cN7xX7
	OdgrSkIABmLHzDgz5HcCuVhJYy9MpqaPBJC4yaYiZ701Y3TgLL1P9o/gA7qcY4myZIHVBgVUzqY
	TN6F5epbSgsyEH9ljYLpsxiAtgpI/RNk5/eVR4VXPxM+Cw4eDqxyVxm6jDMQMe4X0hQ7nMbZjaO
	4v+y/T/IIA2TCUBMvv5bvPAkidwz47tzexuWcrjoWc6tVb02iHuFT7IA==
X-Received: by 2002:a05:6a00:ba8e:b0:848:52bf:4296 with SMTP id d2e1a72fcca58-851bc3ccf5fmr2527196b3a.15.1787015972070;
        Mon, 17 Aug 2026 18:19:32 -0700 (PDT)
Received: from [127.0.1.1] ([47.253.114.73])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-851b3d1099esm1196713b3a.0.2026.08.17.18.19.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 18:19:31 -0700 (PDT)
From: Wayen Yan <win847@gmail.com>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>, Vladimir Oltean <olteanv@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, netdev@vger.kernel.org, mfd@lists.linux.dev, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next v20 04/10] mfd: an8855: Add support for Airoha AN8855 Switch
Date: Tue, 18 Aug 2026 09:19:25 +0800
Message-ID: <178701596581.1096543.14003915779643840966@gmail.com>
Content-Type: text/plain; charset=utf-8
MIME-Version: 1.0
In-Reply-To: <20260817082034.20326-6-ansuelsmth@gmail.com>
References: <20260817082034.20326-1-ansuelsmth@gmail.com> <20260817082034.20326-6-ansuelsmth@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260817_181933_460066_CD7C2F2A 
X-CRM114-Status: GOOD (  11.01  )
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

Hi Christian,

I noticed a possible MDIO bus locking issue in
an8855_core_probe().

The helper an8855_mii_set_page() is declared as:

static int an8855_mii_set_page(struct an8855_core_priv *priv,
                               u8 addr, u8 page)
        __must_hold(&priv->bus->mdio_lock)

and uses __mdiobus_write(). The latter requires the caller to hold
bus->mdio_lock and checks this with lockdep_assert_held_once().

The other callers of an8855_mii_set_page() correctly hold the MDIO bus
lock, for example:

        mutex_lock_nested(&bus->mdio_lock, MDIO_MUTEX_NESTED);
        ret = an8855_mii_set_page(priv, addr, page);
        ...
        mutex_unlock(&bus->mdio_lock);

However, an8855_core_probe() calls the same helper directly:

        ret = an8855_mii_set_page(priv, priv->switch_addr,
                                  AN8855_PHY_PAGE_STANDARD);

The MDIO device probe path does not hold bus->mdio_lock around the
driver's probe callback. Therefore this call can trigger the lockdep
assertion, and the MDIO page-select write is not protected by the MDIO
bus lock against concurrent accesses to the same bus.

Could this be changed to take the bus lock around the call, for example:

        mutex_lock(&priv->bus->mdio_lock);
        ret = an8855_mii_set_page(priv, priv->switch_addr,
                                  AN8855_PHY_PAGE_STANDARD);
        mutex_unlock(&priv->bus->mdio_lock);
        if (ret)
                return ret;

Alternatively, if there is a reason why the probe path is serialized by
another mechanism, it would be useful to document that assumption and
annotate the call accordingly.

I don't think changing an8855_mii_set_page() to use mdiobus_write() would
be appropriate, since the helper is also called by paths that already
hold mdio_lock; that could result in recursive locking. Keeping the
helper as an unlocked MDIO primitive with an explicit locking contract
seems reasonable, but the probe caller appears to need the missing lock.

This is a discussion and fix suggestion rather than a request to redesign
the series. Please let me know if I am missing an existing serialization
guarantee in the MDIO device probe path.

Thanks,
Wayen


