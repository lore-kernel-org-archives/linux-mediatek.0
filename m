Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0417D606A329
	for <linux-mediatek@archiver.kernel.org>; Sun, 15 Nov 2026 19:27:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=yWx8/KfN;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=prUI6FrT
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=zK1HFeXb+5RIaaTyR8jNDy335l1vYAJOKc4AYeqRcfQ=; b=yWx8/KfNMbX3i+
	1LUW19YAtlsVMCIK+9J9HDp8WHwgoedLLhb2mv8ZSvxfv4supdKKuDQO0f6hRmSuTY2uIKJZ7UHmX
	J18XMFzuEGhCFLV7FKBDWt1aCK8nEyqSfhuJ21An/a4bzyfV7P3feQ6/owg9Dk7xup6hOUG1zxU5b
	C4Gdoc7y9AiAyoU3T1oLUXNYkXGsKUZZ5uuORXqovJxqtwvUy5/sxfM0Kz5KOYXxadlGOAoVgwzMH
	rDd4ZkRSgi8NPlM9qUY6GjkUqlVRqle2c1hglmhYbp6Unt7s5ucS/7KosBsHLK8vSiTPjnfrGnipN
	L9Jfl6KN0me5za97Fr0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSftI-00000000Npt-2Nnb;
	Sun, 15 Nov 2026 19:27:52 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSftG-00000000NpY-1PlT
	for linux-mediatek@lists.infradead.org;
	Sun, 15 Nov 2026 19:27:51 +0000
Received: by mail-pj1-x102c.google.com with SMTP id 98e67ed59e1d1-3adac5b29ebso2416783a91.2
        for <linux-mediatek@lists.infradead.org>; Sun, 15 Nov 2026 11:27:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794770869; x=1795375669; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zK1HFeXb+5RIaaTyR8jNDy335l1vYAJOKc4AYeqRcfQ=;
        b=prUI6FrTb9ryYepFVXO7Gu6RR9sWKe4F08pEzeCYtSrruLb8x+NMPfwuXYmOxYRKdm
         x6wGCAjVjEvAMM5YGE6fIXfXEGj28jhtJUA1BBsVtBWkyZ0IDemJ0fkTRXj/0JPEfJXs
         C/nSczkGIt64QDs8BTrWvSv3R0N93Cq4BJe3mA0igtdQE6MjcaheF5DaEfUIJh2rjUJT
         rwj1ODdCjGQaLehv91A6yHN359CdN+gZDlWr8GzR6zOB+8GqMy+yEZTp/mL1xm6A7BlW
         tQVRjIoeZ/yMxAuW4jeRUSIJlszFpYI/OABUtQnm33cB95Ua7MG7hwYJIBTb9Kh3vaic
         OWPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794770869; x=1795375669;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zK1HFeXb+5RIaaTyR8jNDy335l1vYAJOKc4AYeqRcfQ=;
        b=H/E3Pk37FTeR0AsbHMT0VpCFva0inhGHA+7eUMtigzOZ4PVLoPZafJTtUgJnGKcjdS
         Xb/+JkGT3q6nWxc1pjxF7+uTk+O8HRTBJfb0RJdbZVTKMoRY0wRICEQ1dFkJb9/yEPp7
         YfZQp/bp3Gh+kCGmOTP1MDFxvKuHyanYzvo928w/I6r8GJAzye3TrbhG17kEQX4WGeUT
         B0PW+8ZTZbT+s8bgcNDtMfeRDV27gJgDrlsN91SKOiXk9KdX170xnztU+AxLxFu6kO2P
         GT/ZUBLyODpJVWC2Cl8oPY1Gmo5hY5arcgd4AINkwH92DyjAMWAXk7HdoehK8wAlNi0E
         42FQ==
X-Forwarded-Encrypted: i=1; AL+hErEaqNo/ZzsKk+dSUrahdfqTPEGO3MjiiKX7xx+MwuqwB0FEpIsQmnMWqRlDcp8eLgDedEwsBjPH589KocTQ1A==@lists.infradead.org
X-Gm-Message-State: APuU4Z9thpUD993TDfpgiXWKHM8uUFBQSwXVTb1Bkzl7zqU+PbmlDuxN
	Yt/YRQ/xLBLhqnpr6JUiQZE7bFRo8guheJEu+q0nxixGXkN4LF1wPEhX
X-Gm-Gg: AYBFou0lozOCCih333p0FJBAqg16kWpPEQDpHDDGDuEq7SnnBMoGs9o51RrdfSP4tcy
	ThqGlgBgLW6g7Xk1OjrIRaIGu8nHo8MFYwPae5MLjaJn853Vm+4YKmImMFY2wMY6XVTecUZ88HU
	xwCHtmT5bENeesH64actU24DU9o7CgAMQ9fxxOsG8ccRu91u/k40AcVzl8JxiSnC+jRvSAsa/B+
	ijb/jgUGAfX9LE2fyG0CXgUUD/kJCqPQ2PGem7dbriH2Y166Ou2p/OBcznocmIfDsc3S86oj++d
	UtJJfRBhj5cQY60FTFWl76xilapBwue47f3Z+/LYfe3Qp+FqS6O4fjfVPnELHOzcbThsXEWUFWh
	MxDkxIniC7kL5ioGe7rHHz1wvxOzeLJ+w9+R5M6D4OGN5nE1HuPcQ08bxini/IXbePJbQ13lRwi
	zYa/NMdTyMFpUyejx8NbYFy46py5O06mnwqijWhwcmJzY7uK/byZh0zjoaGp3NEUESX+0PkQzl1
	fIU/eS/yDx055rpOZht2OM9gvmYWhmJeFuEfhnZclPZXEgUaU3YkwRHK5W9tXmYCkEI2W+h6pla
	YhfiRMyFPl+0Gd0Q+0vUrZulKEesBGfMAmBteq+Sh8hlGbvr1mr7yTU/U9qT
X-Received: by 2002:a17:90b:1b12:b0:3b0:a3eb:759e with SMTP id 98e67ed59e1d1-3b1b09e5cb0mr8453054a91.17.1794770869377;
        Sun, 15 Nov 2026 11:27:49 -0800 (PST)
Received: from G7XWH7K1F3 ([2408:8256:2e80:7371:d1be:2710:af83:9beb])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1b3b4cca7sm5633895a91.2.2026.11.15.11.27.41
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 15 Nov 2026 11:27:49 -0800 (PST)
From: Zhao Li <enderaoelyther@gmail.com>
To: Ziheng Wei <zihengw03@163.com>
Cc: Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] wifi: mt76: mt7925: fix mt7925_reverse_frag0_hdr_trans() for MLO
Date: Mon, 16 Nov 2026 03:27:25 +0800
Message-ID: <20261115192725.8230-1-enderaoelyther@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261115080239.910402-1-zihengw03@163.com>
References: <20261115080239.910402-1-zihengw03@163.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261115_112750_410812_F07A33FA 
X-CRM114-Status: GOOD (  11.61  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Ziheng,

On Sun, Nov 15, 2026 at 04:02:39PM +0800, Ziheng Wei wrote:
> -	struct mt792x_sta *msta = (struct mt792x_sta *)status->wcid;
> +	struct mt792x_link_sta *mlink = (struct mt792x_link_sta *)status->wcid;
> +	struct mt792x_sta *msta = mlink ? mlink->sta : NULL;

The MLO part is right, but the cast still needs a guard, and the
MT_RXD3_NORMAL_U2M check below does not provide one: it selects the
unguarded path. mt7925_mac_fill_rx() computes unicast from the same
rxd3 comparison, so every frame that gets past that check arrived
through the one branch of mt792x_rx_get_wcid() that returns the WTBL
entry as it found it:

	wcid = mt76_wcid_ptr(dev, idx);
	if (unicast || !wcid)
		return wcid;

	if (!wcid->sta)
		return NULL;

Not every entry is a station link. mt792x_init_wcid() reserves index 0
for beacons and management frames and installs dev->mt76.global_wcid
there, a bare struct mt76_wcid inside struct mt76_dev, immediately
followed by the wcid[] table. For that entry, mlink->sta reads at the
offset mt792x_link_sta keeps its back pointer at, which lands in that
table, and msta->vif then dereferences whatever it found, so the header
is still built from a type-confused object. I can't say whether the
hardware reports index 0 for a header-translated unicast fragment, but
the non-unicast path in the same helper already guards its container_of()
with wcid->sta.

Doing the same here keeps the conversion valid for every entry, with
mlink and msta left uninitialized in the declarations:

	if (!status->wcid || !status->wcid->sta)
		return -EINVAL;

	mlink = container_of(status->wcid, struct mt792x_link_sta, wcid);
	msta = mlink->sta;
	if (!msta || !msta->vif)
		return -EINVAL;

> +	link_conf = rcu_dereference(vif->link_conf[mlink->wcid.link_id]);
> +	if (!sta || !link_conf)
> +		return -EINVAL;

With status->wcid->sta checked above, wcid_to_sta() cannot return NULL
here, so only !link_conf needs to be tested. The per-link BSSID lookup
matches what a3ea1c309bf3 did for mt7996.

Thanks,
Zhao

