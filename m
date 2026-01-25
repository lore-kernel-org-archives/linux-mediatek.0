Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60E2BD7237B
	for <linux-mediatek@archiver.kernel.org>; Sun, 25 Jan 2026 22:08:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g3EJ6TxN7ZDz04YTrVqZvmwk994KH4aI44usL/+rv9E=; b=qklZHWDseT5bm+COzrEU4jvYEO
	6RJes6/M9VCnNoeX/9MAgeQ7ZzyzdvnWyHCkD2PqiCmDavKs04raGWAz9QqeMOAPnfxVmhVF/XF90
	SkwgZ8KWY/O+GJVnXpOL03Z4aEEbh8WSg5H/ZHiQefg+5HlpJWjwZoiwb87IQVWcieLImVi0Jh8lf
	YV37x+3M9hRLSzMK+Uw80G2t11oxgXUW+IEn75kmbjz1nAcWyPmD4BnmCnYJh352oO6mTmANF5a9s
	6CrB2WlzyuhIZyPHtkixwE34tlA3JAqpeKjO7lsnVR9y2AGFgeP0O6fprtRxZANiF/N/r9n/xdkIS
	HmexuIfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vk8HW-0000000BYMz-1wLC;
	Sun, 25 Jan 2026 22:08:30 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vk8HQ-0000000BYJs-4A1T
	for linux-mediatek@lists.infradead.org;
	Sun, 25 Jan 2026 22:08:26 +0000
Received: by mail-pj1-x102c.google.com with SMTP id 98e67ed59e1d1-34c868b197eso3507032a91.2
        for <linux-mediatek@lists.infradead.org>; Sun, 25 Jan 2026 14:08:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769378904; x=1769983704; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g3EJ6TxN7ZDz04YTrVqZvmwk994KH4aI44usL/+rv9E=;
        b=lhjRSS7rBpc00ggblOXD1mnibrJaxrf6BW4n5G34RUTLTErGqpngSiZszNVR3IISDn
         oXZevpT0IY04685+C09eTSSm4RkRGsVaa4fdNu5Ok17s5nU7cqeuR0ishrdZcj8tPKEj
         /J/K6zGNUERT2h0j8E/lAvZQw1dNxigrPOgBzfyBWQoGsgxQgKWk1wlcslhASBOzOUyh
         iHTt1kPHv0ceMv4/r9M94vkUGgTpur3MQNTmHxOXKtCMkkvogpRrBjtpAkLcJvj4p6hA
         S01CcDoQZaN6goCcqR/+ABxF1vynJZeVmE0DP0R0KxwBJDr6dmgKMtmJr8gZO0QEyBWS
         aZVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769378904; x=1769983704;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=g3EJ6TxN7ZDz04YTrVqZvmwk994KH4aI44usL/+rv9E=;
        b=ppoqxCfhim6qx4adNvfj6VzE2gcbgPFIOt/3uYmmwFPnRa/NNOHCP6v+6d777nq/n5
         61ov8O/w67vbNgtqUDwOyAm017JdDKD+I0Llnwwy74HuJEMYzI81HStiWbZ1g0Roya78
         ebCBu7TDf5Jg40F9+yNt2+rDNpsVz2WNE6erDfwgmguFy9ab8Xxw81AFHbCZCW5bJBbZ
         YMvcR2I66uj1iZTaYCzHTtVYInIm/Nw8kfoAl6NIzjnsWZPQjp78+UpgbHemXFP5Yn1c
         TOWIyZZqeouIYtsRFPaOL61+UyrsOGDItgEKzTRVPhGeY92EczwtUzPV+JvfQmDPeUVP
         RsKA==
X-Forwarded-Encrypted: i=1; AJvYcCVrJYdpcMxDMl/zCbwQESjslGOQ3KKUNDV/H4SzCLL5Yj7Tr+v0XUtO1MR1XdnvFGXqe12l41Z/W3xEQgNyUQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxW5t+H5AFR5QX/2lT4aHzzCs1UVfxel2FWMFL57u1e+k0rGe7c
	WVxtRWtDsbJ/mbrJvnT1OF8GRVrpAnOVcjfA/18xN0e0UgiUv9Ems3mf
X-Gm-Gg: AZuq6aKZ6qDPWL5yUQLWnQnqa8hbjaYsHW4lcgNRL8duwNDAl965XtjLhyh+GiFzq/I
	rUIcaDfgen62rWbDkMmC4DCqrDFcOmiTFh2K7YOACNV88zYRqxHAVoGBjprjbfKq8CNJsaKlc8p
	HuK3uVj+rVIhm9ud0ySR5kEio/1sCnFyT6DeqGa4vONEK0ocK0gDblRn1A6p6GZh5/Bm9Agvy5h
	jluZhskAW9bCBC5WfnNoxfHJGgqMJJol4xaOL6a5s1yU7ONTvcr5HWAZ1nDqGtbjiwNGf3K1g8a
	Fu+v48clFSjerzOBWHv+P0JTHJmtKyXrmjHNPmwyWL+5wtez0ai1LXIzVYJz+rcxQquTYmhASbv
	cQVZflq12BbslWuVBKePKVSFKlVrAVSSL2lY+OFDx1DgXzWXJEWLytRbDD+CMYS8q/S4Fp4i54L
	C6XDkpMNjyspybMmcYZrOsmAaUf0LCdqdlIWEbQjlaKgOfYRvfxv3v/0t7xY9M
X-Received: by 2002:a17:90b:45:b0:349:3fe8:e7df with SMTP id 98e67ed59e1d1-353c4167b7bmr2107663a91.22.1769378903982;
        Sun, 25 Jan 2026 14:08:23 -0800 (PST)
Received: from d.home.mmyangfl.tk ([45.32.227.231])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8231873e60fsm7651286b3a.48.2026.01.25.14.08.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Jan 2026 14:08:23 -0800 (PST)
From: David Yang <mmyangfl@gmail.com>
To: netdev@vger.kernel.org
Cc: David Yang <mmyangfl@gmail.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next v2 1/2] u64_stats: Allow u64_stats_add() to accept s64
Date: Mon, 26 Jan 2026 06:07:49 +0800
Message-ID: <20260125220753.3984326-2-mmyangfl@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260125220753.3984326-1-mmyangfl@gmail.com>
References: <20260125220753.3984326-1-mmyangfl@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260125_140825_032858_8B350E61 
X-CRM114-Status: GOOD (  11.13  )
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

The current u64_stats_add() accepts only unsigned long, which makes no
sense as u64_stats_set() accepts u64 already, and causes unnecessary
narrowing on 32-bit architectures.

Moreover, since there's no u64_stats_sub(), users may be tempted to
reuse it for decrements, which already happened on nft_counter_reset()
in net/netfilter/nft_counter.c .

Change to s64 to allow both positive and negative values.

Signed-off-by: David Yang <mmyangfl@gmail.com>
---
 include/linux/u64_stats_sync.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/linux/u64_stats_sync.h b/include/linux/u64_stats_sync.h
index 457879938fc1..e77f2b30bac7 100644
--- a/include/linux/u64_stats_sync.h
+++ b/include/linux/u64_stats_sync.h
@@ -84,7 +84,7 @@ static inline void u64_stats_set(u64_stats_t *p, u64 val)
 	local64_set(&p->v, val);
 }
 
-static inline void u64_stats_add(u64_stats_t *p, unsigned long val)
+static inline void u64_stats_add(u64_stats_t *p, s64 val)
 {
 	local64_add(val, &p->v);
 }
@@ -125,7 +125,7 @@ static inline void u64_stats_set(u64_stats_t *p, u64 val)
 	p->v = val;
 }
 
-static inline void u64_stats_add(u64_stats_t *p, unsigned long val)
+static inline void u64_stats_add(u64_stats_t *p, s64 val)
 {
 	p->v += val;
 }
-- 
2.51.0


