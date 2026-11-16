Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24D49606A32F
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Nov 2026 23:20:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=GV4imIqp
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=jxTFYSlQWSzScSRa0EOOLNZyxPVKE9gzJQ4c1bYS5kc=; b=GV4imIqpf9l/lH
	fh3I0a+TYde0ymBBX4obTDwCC/adLxejG5m3eyqXXnQjBnCXaxtp4/m+ZYTntfFzrPbsgYUtPPirH
	vwh9PdPlDUOX1ODPfqYjPVAMSBK+PDsDU5fDnI2XYc3H7e56QbWPw2hVUgsjRB+UNkqsf/Dk9pTrT
	w/+8eNzS9mEd4eMnArA03U0PoeosEyScx9HbgS21denlevov6XzouREC+26LQZxy+UJbNJ9viCv/b
	u1BIdcgcTtHbsILI8djPvqmS58g85w40Mx9Pz34NTDbt65Tw2gV+kwJ7QbTtRst5HibkWg6ZqOKKO
	gMcE85vX2B1814Kl33lQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT5zh-000000049xj-3Zxe;
	Mon, 16 Nov 2026 23:20:13 +0000
Received: from mail-ot1-f43.google.com ([209.85.210.43])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT5zf-000000049vk-1WNK
	for linux-mediatek@lists.infradead.org;
	Mon, 16 Nov 2026 23:20:12 +0000
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-86298f9267fso2039511a34.0
        for <linux-mediatek@lists.infradead.org>; Mon, 16 Nov 2026 15:20:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794871210; x=1795476010;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jxTFYSlQWSzScSRa0EOOLNZyxPVKE9gzJQ4c1bYS5kc=;
        b=yZ7WLfp0Va7ruqiW0t7S0lFJJ/pvINjpLN5Pnk4qXZ4WTxN96HvLHX/xKTg/egEGuX
         kiyetdREbyyoFgWv69NE2ZlTaM11H0GU7BCCFxOt74V0gSCvTjE7ashEIBWTz84hsMUT
         tf+1L74CZkXQjyL5EhlP6+WhxLB3CEn/KWEbd06QHmvHqf4XvvjJikFiB9TFNQZA9cQP
         p9rSfjJwoIXVBIn/f6q8blPqKEZAX7pwp6QzYcoH3QU6ZRhAkDudSd8N8DibkL6Ambi4
         5wHhQWXPBjKjpAPiBpQoObCwcew0cn4NbIg981d1Blvm7Y9s5tXBATg3P7VLYrbXZd2o
         kvBg==
X-Forwarded-Encrypted: i=1; AL+hErG0jRUC1TRtig7BvOQdPLZJQMLkCJxgwFMVUoVVNOSOrpd68qylZQU/q/Iqp8RsLJ7YdwHDOMnX128O5yyeOg==@lists.infradead.org
X-Gm-Message-State: APuU4Z8AQqweIrYoIPR3t6WOd0iFZxZyy47L7K4cYw11FN4kO+hCFg9o
	Xa+wGq/mN0UScsuJ/P30UBp0xXma6fIi2FZJWlZu0qrBy1Uic73J5M0L
X-Gm-Gg: AYBFou0Z1G3Ewe36ii0UheXIRbmbq7yqHyuUSzWNjKJ6jnY5pqZvIb77VDxO9zFf5h0
	ndoll2MBNGftDTAFzG6w1xo6Nx8bnvJ8BHFpoR+3b6YBwmWJN0/B9x9DkYUkIoOdw90d43yXFLw
	2m1lrxR52CHkUaK/CxvFUSaE+xmnQegNQwUTraPFs1RxjtydJ+nQ0fwO6y6CtlqGAFIgCY0oP4D
	uWhNcb9q7HmdOV3uxH3eGWJ200494l0Y93ItUL1WVTR+2+h6M9xyVOvgtlXrGX7H+QTFIzbgR9k
	lc8A1qxbdO7wKwYtEAnj6s2Ji3UfQpfy+E+GU/FRQCyopW1j9z0bVP4vCwbhoEBOIWaU1i5lv79
	Y8wQxQSGKAPB00ePTGjnW8pDp35alEPMatDhNu1iuykv4bmHatwS8U77OA8esK+/SWgsdPV3xm0
	Gl+9SGYzJVTNemu1bfr71e3zXmbIjHvX+7jyWXDpLx69LBeKG/WeNYAQflxLfBviQ9pAQ56Gpl6
	rrg/I9llOv2TNypJoSls/lIFrHQCuSHD5mEnwGCMXjt96K+BiiKEQRyUn7fNKKdl1w0zw0OOyLY
	qsPzyFR5bbM966tZIRbhC2c8qhKoRlrahtWmhkGEnx/L3/rVRruVLhDWaK/SPSlRyPIh5rRPAv6
	htjlNvDXUlZVhdewST8owVYZGJqiyExc=
X-Received: by 2002:a05:6808:179b:b0:4f5:eaac:5173 with SMTP id 5614622812f47-56e65a3cc9bmr8757530b6e.57.1794871210517;
        Mon, 16 Nov 2026 15:20:10 -0800 (PST)
Received: from sean-HP-EliteBook-830-G6.lan ([207.191.35.252])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56e70c58f9bsm10239635b6e.13.2026.11.16.15.20.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 15:20:09 -0800 (PST)
From: Sean Wang <sean.wang@kernel.org>
To: nbd@nbd.name,
	lorenzo.bianconi@kernel.org
Cc: yu-ching.liu@mediatek.com,
	chengwei.yu@mediatek.com,
	jacobs.wu@mediatek.com,
	posh.sun@mediatek.com,
	clifford.hsu@mediatek.com,
	linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Andrzej Ostruszka <andrzejo@google.com>
Subject: [PATCH v2 19/19] wifi: mt76: mt792x: allow three channels in the NAN combination
Date: Mon, 16 Nov 2026 17:16:30 -0600
Message-ID: <20261116231630.1733906-20-sean.wang@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261116231630.1733906-1-sean.wang@kernel.org>
References: <20261116231630.1733906-1-sean.wang@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_152011_414675_C1329B40 
X-CRM114-Status: GOOD (  13.58  )
X-Spam-Score: -0.4 (/)
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
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Jacobs Wu <jacobs.wu@mediatek.com>

A NAN data path schedule can use two channels, e.g. channel 6 on
2.4 GHz and channel 149 on 5 GHz, while a station interface is
connected on a third channel. The station + NAN combination only
allows two different channels, so:

- if the station is connected first, wpa_supplicant, which takes the
  number of NAN schedule channels from this limit, rejects the NAN
  schedule and no NDP can be set up:

    NAN: No unused radio frequency available for freq 5745

- if NAN is started first, mac80211 evacuates one of the NAN channels
  when the station connects.

The firmware time-shares the three channels, so allow three different
channels in this combination.

Fixes: 420e0bbd52ab ("wifi: mt76: mt792x: advertise NAN data support")
Suggested-by: Andrzej Ostruszka <andrzejo@google.com>
Signed-off-by: Jacobs Wu <jacobs.wu@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt792x_core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt792x_core.c b/drivers/net/wireless/mediatek/mt76/mt792x_core.c
index 472333ac1a62..a835c8d89618 100644
--- a/drivers/net/wireless/mediatek/mt76/mt792x_core.c
+++ b/drivers/net/wireless/mediatek/mt76/mt792x_core.c
@@ -118,7 +118,7 @@ static const struct ieee80211_iface_combination if_comb_chanctx_nan[] = {
 		.limits = if_limits_nan_mcc,
 		.n_limits = ARRAY_SIZE(if_limits_nan_mcc),
 		.max_interfaces = MT792x_MAX_INTERFACES,
-		.num_different_channels = 2,
+		.num_different_channels = 3,
 		.beacon_int_infra_match = false,
 	},
 	{
-- 
2.43.0


