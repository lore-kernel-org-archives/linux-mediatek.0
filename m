Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17A40606A31C
	for <linux-mediatek@archiver.kernel.org>; Sun,  8 Nov 2026 07:19:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=vLX0Fo/b;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jm3UWP/m
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=FVF9NClJHJGhfa8rb/zBRKRxBPdEmM7xBMkClhjxaOI=; b=vLX0Fo/bR2Q0I4
	kkfodDnGduoKs4X1HIUW5cXRnLg0fTQHu+GeHL8PG92KI3i2WJ5fZUp9u69jLhx3MnNC8FvNqunfq
	8RFJPSLs4MjwGSqg/jFFWvMvRqSZy14ifyLQNAVinoLMtKA7HWLFGpKGwNotto4tukgf0s4FpXcpe
	3dV0IwH9buBkPXzxNPWy8SaE8Ln4Sg9XcadHGi2gtArwDu2p8M4T6+Du4pZ1700BjMdW5AgzdKVMN
	9LJR749NrL2DgOIxL0re5aAicU2xtQ1y88rIgVJ+3RRRwvy8zLmvWJOP91qx/n185MwCwde18C3HO
	omSWX+DQ7zzdRmOI5tuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPxBK-0000000FmM5-1kSl;
	Sun, 08 Nov 2026 07:19:14 +0000
Received: from mail-dl1-x122d.google.com ([2607:f8b0:4864:20::122d])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPxBH-0000000FmLl-3dah
	for linux-mediatek@lists.infradead.org;
	Sun, 08 Nov 2026 07:19:13 +0000
Received: by mail-dl1-x122d.google.com with SMTP id a92af1059eb24-14fc585291cso73329c88.1
        for <linux-mediatek@lists.infradead.org>; Sat, 07 Nov 2026 23:19:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794122350; x=1794727150; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FVF9NClJHJGhfa8rb/zBRKRxBPdEmM7xBMkClhjxaOI=;
        b=jm3UWP/mAvSToKkmbwubFjc/QjalPdJIYV34enpeMtWYYmawhusSmb8GszsM1aUbr1
         lqRSArbvDWqpSOD346n/1rigZ3hW69SCnKTdODehJa48uW9PT0lAFlkxOX05uiR9YvCy
         Cfn7c9ODzmxHdah8oEyAPpZAdfr5hETfDR+RQbQMhdcE/nprZPB5I9t76VlXSbyZt7+7
         YsldKdC0Nq3UzF8pBrRP/Ih1RiFVKqsJwez8Yvn/oCvlEX2LVwMA66ItAaqMVoNd8sFg
         kQnq4nPTkEaptGx1pQSXHvxXM0fA5XsdgqUFJrvHIU6/UG5fskhhlwe1Us7H2U1qUuQo
         rI1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794122350; x=1794727150;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FVF9NClJHJGhfa8rb/zBRKRxBPdEmM7xBMkClhjxaOI=;
        b=HtgyT6GSVSuks4YqbW+UXjkEJE9SKVjo+l1vGdMEhn/5kc+1HYnJ8rSuqRI8NhD2rh
         kK8ccIBP4UX6Hht2PvKs3O7lwxipcanAz2AJopMuAuk3Lb2k8I3jBgMh1FTconbYVmnW
         J4kdl3cj5JbZIIIu4eXvpmsCQWDkkIBKwxj0PzqyNtjnYeaGySr3FM4X7kjxFwQDbAB7
         fqATH8WRu7UC71+KpTYkhAinGuOGooHn8YJCO/ELgRhsDiz5EWIGpjyuCnhb5zrkH015
         lnOdHcocKhH3qWpwSDnqmZ182pU71OnU4QimNOfVkia7l7pNLcQDVM1RTgFC7HyFrL/P
         PI2w==
X-Forwarded-Encrypted: i=1; AL+hErGuVs5KNOjtKxwcAvy97HX6VE5OEdDx8ftTWhr8ccMBJnqfSIjoNMlvcv0zDXC75MQuvnIBUHIG2LxvEJptIw==@lists.infradead.org
X-Gm-Message-State: APuU4Z/C/CqPIoXDqPxc2pa4xc73+za9LfPFqq4ZSBg36SUN7wZRu3sw
	bW19w9gHAILaDi8RilnZz1L8HNOcATDrgqyK38nL3kplQ6TS3PpbGt33
X-Gm-Gg: AYBFou034XhtfGoemB9n+CJTJLOWp55IsdrRjSfvqFLwNnMqmOuStvIY2DU/cMvhmYo
	LFl0EBLsh/rhaXZZQVaKSx+E0UEEDiKD4sF7VoR7dzuXMjxmaQVs34APr0X25jzv/W03quAEv9n
	UfY3XNstvM0YNgyaTuJ69q56+3mO+xVR6zTDK8+dcQhskSXH2BhGyMxc2vmIk7fYir2Kbzfh40e
	d3vtpQNiXS//IbQuusxnwsoMSe3log+t68g1qjcqhwrQR/JhjcIXo5uklQ/lVyp6VziOmL/MnIo
	25VQ43by75UG8pDwqpBO7qknIKZX8uWwvlPBJ6VGV1bE1lcCyhyB1KeolH/GIYfjIP2Ea44Z+rl
	5befhk5p9bNZmMKucuz9/7uVPXb42ze5poBxVszEBrniaprqKJ/tcoo+VsDogxq7Ti7YUTCNr/M
	0kjWrJhynoIzP1TZ56HOFm0Z+GSfW+6jzLpD6K6wWzqlZXgJn1We+K32w6z4bPvgkOL5WAUlmlQ
	hH9hwWJRWHJEKkUT9lJInJMbpfdULCLpuYw9a04Wpvy7vWeVzvlLRTN3q2dSSggteTDttYK+rHM
	t65SPgYqXQfkA0fwVgZr/vj0VGv2e2Poigc4c5lmrJNQWA==
X-Received: by 2002:a05:7022:294:20b0:16f:c9db:c5af with SMTP id a92af1059eb24-1b39fe92ebbmr1311793c88.11.1794122349973;
        Sat, 07 Nov 2026 23:19:09 -0800 (PST)
Received: from cachyos-x8664.nitc.ac.in ([61.1.180.57])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3755e8911sm4207262c88.5.2026.11.07.23.19.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 23:19:09 -0800 (PST)
From: John Robin <johnrobin044@gmail.com>
To: linux-wireless@vger.kernel.org
Cc: kuba@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	John Robin <johnrobin044@gmail.com>
Subject: [PATCH v2 0/4] wifi: mt7601u: add AP and Wi-Fi Direct support
Date: Sun,  8 Nov 2026 12:47:42 +0530
Message-ID: <20261108071820.35303-1-johnrobin044@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <7ededd2f-98d0-41ac-91b4-2977963c4637@gmail.com>
References: <7ededd2f-98d0-41ac-91b4-2977963c4637@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261107_231911_921534_8C2FB657 
X-CRM114-Status: UNSURE (   9.31  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -1.9 (-)
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
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

v2: Split the single large commit into a 4-patch series as requested.

This series enables Access Point (AP) and Wi-Fi Direct (P2P_GO/P2P_CLIENT)
interface modes on the MT7601U device, allowing concurrent Station and AP
operation. 

The changes are split into the following patches:

- Patch 1 fixes a potential out-of-bounds access in the rate index and
  safely falls back to CCK rates.
- Patch 2 registers the AP, P2P, and ADHOC modes, defines the interface 
  combinations, and sets NEEDS_UNIQUE_STA_ADDR.
- Patch 3 implements start_ap()/stop_ap() and adds beacon frame handling
  along with appropriate SYNC modes.
- Patch 4 optimizes queue management by routing management and injected
  frames to the Voice (VO) queue to bypass firmware suspension.

All implemented modes were verified to be working. Tested AP mode and
simultaneous STA+AP with iperf3 to verify stability.

Sorry for the delay in getting back to this, and thanks for the review.
Here is the split series as requested.

John Robin (4):
  wifi: mt7601u: fix out-of-bounds access in rate index
  wifi: mt7601u: enable AP and Wi-Fi Direct interface modes
  wifi: mt7601u: add AP operations and beacon handling
  wifi: mt7601u: optimize management frame routing and queues

 drivers/net/wireless/mediatek/mt7601u/init.c  | 31 ++++++-
 drivers/net/wireless/mediatek/mt7601u/mac.c   | 91 +++++++++++++++----
 drivers/net/wireless/mediatek/mt7601u/mac.h   |  3 +-
 drivers/net/wireless/mediatek/mt7601u/main.c  | 56 +++++++++++-
 .../net/wireless/mediatek/mt7601u/mt7601u.h   |  3 +-
 drivers/net/wireless/mediatek/mt7601u/tx.c    | 19 +++-
 6 files changed, 175 insertions(+), 28 deletions(-)

-- 
2.56.0


