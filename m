Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B2FEC98308
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Sep 2026 05:51:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=bNcaMozgi7eMkdPXPYneu/L8vYje9h4xULACp8evALk=; b=aiqV3OKENf5kAFHnvhgZcLj6FU
	nG4xkPC2uo5uO+ayqe5EWSH+IZcDInmm9baV3Q+aJWoDNe8koPb9Me4nKXM59OGt9IJk+bCr/I4t+
	ygnl2OCu+09pcKE9j4vKvLQgPVMHwp3j7n0z+iyWiIPsCn9JVErBq7yM7TqsWChaMm8PmXFuKi2+J
	oFQvoYwAiqeqBMaMgTQPpbVWtELFk4BgHrAUL3KMqg/Oe0hFt+7sudj3eJT979UvdHRDI3s2MpqMP
	sWMCkq6VLtWuXXpFC5T6MO2R65AYso4Bdj9hDXLzvyfe11Z5+ooUdxWSlkh4CQK87sqwFf5/Bf3eX
	XAvBi4zA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Fsr-00000007Cp2-2uZd;
	Wed, 23 Sep 2026 05:51:09 +0000
Received: from mail-pz2-x0d.google.com ([2607:f8b0:4864:3b::d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Fso-00000007Cn3-34O4
	for linux-mediatek@lists.infradead.org;
	Wed, 23 Sep 2026 05:51:08 +0000
Received: by mail-pz2-x0d.google.com with SMTP id d2e1a72fcca58-8631d0023daso327320b3a.2
        for <linux-mediatek@lists.infradead.org>; Tue, 22 Sep 2026 22:51:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790142665; x=1790747465; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=bNcaMozgi7eMkdPXPYneu/L8vYje9h4xULACp8evALk=;
        b=Pz9Qewyh6QQAQOja8im3T0NYOyqKmzLT3z1jDnOGHttUE/9yHZmchd71+j4N7m/MED
         s0/X5LISX/bk7Oc0LNk9B7uaE69QFJIkxygHin51JnMl23tjTxNRCpSmAIIbzmR2IzV1
         uG+oMUnB4XigR+DJNARVhJE8LQJZOlkCtAaxidBwyANjm8g2z/XrGLoSMdN5zsSezYir
         TF8xcAWuTiTjMORbT/9eEhwy7Gb9f/MSLhKFepQIu60/eBPl6QFYwe88ZeYJo2QV/3K5
         5nzdGipZon6YlYwPjsqi1fpRy1SgFPpyhPDJCWfqm9GfQUHGWBFBotcH3gjGigma6WE/
         D10g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790142665; x=1790747465;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bNcaMozgi7eMkdPXPYneu/L8vYje9h4xULACp8evALk=;
        b=IsNoW1IC290gtuF3fYKU2XXSe19vZh4YILoNMjLs/ErN/XErJ/FtmWSOIe7RI+A76c
         i7Kj3XeHY2nC4mQG0M0FbRXKWVUAwgjJhMhf8lI/EsvYkoeDB0ptknbc6CTG9ApmUvGQ
         EwLUgGcnIPa6Jf6V1RDA3mOKMEap5LsNN+6kebMzfexxIHKTU2m423IdNn3hKAfXocfL
         jOhLhZeQHmaCzG+daGMIrpxw0tfx4CDpX3wZNkCvP/CMPiU4G7bwctfCfNiX7Z/g+/bO
         MtFvo0WhRnwpTzn9rR7s7MMJM+SXLD4mtBMkv83Vp069FD7YOJTJNlQYlHrrWpUyuo3G
         Pyyg==
X-Forwarded-Encrypted: i=1; AKwUvBw1GSosTv7842mXCKlu6zWcC8emZRvEpe6L8LZr1TdZrCV6vTHpgv8ol1UcSckRK3z/p43W/3TrTRB9QSEMew==@lists.infradead.org
X-Gm-Message-State: AFuF++l/ukrhy+YcWkS3tc3u3cFfvzPvd6FcjPunvd3uQto9ni/3GVLj
	+mDmoeJUEMJoagzgkQnXrSRETUpcoq2JvQaxMyUo0Ln/mUq9QAq4yt/K
X-Gm-Gg: AYBFou1yIyDNL/ONqD3G1BgZ6ElsyCV4XkleM3Q0MUb/G/FT4jxQgIx8s24Eo1fQ82u
	HIhAtnkxdWJlVLHEqaIrFBaUqq2QB/qbZdFL2EVgF+rAzoV0x2VAFWShNU2OPjM2TIjfWzJiPyl
	Yq/i/FHHaeAYo4HBFoDqruXpGg/0SQuf+PdOjnioDZb68C+pPoiEiYxAYm3xi88Wy3NISNRlUiG
	a/3YVERctitvwvie5Mxbd9AuTRN5cFWIbFB1UKWdbp9+WSfHSoSwNRJS9K4SUy+Ko/4GnD99IzY
	9HQ2oOLFvmD4Dbs38i3NaQ2AqnI0O3kFNtzaRJ8Fmwu3hbN78/gSbsQN5Ym9F2bghyAK8KtfRWs
	Xaj02TtvUaXqlvLEs8t/KR4YqvvySMvUfCzYLl5YNvxL7vHL+4ywGMaz4JvCLAuYAtpuYaG/Vvg
	5WBTKDT62SanLT6ktHJXBnGRt6Bi8+PFWwJciZrcKM/O5TKnb6tirLHyIAGkIgTXt1ttEGA7CuS
	UiB2Y0Awp2H2N1L/iV0UKCFPbOcL113ww==
X-Received: by 2002:a05:6a00:3316:b0:86e:8deb:fbd4 with SMTP id d2e1a72fcca58-87d1a7af6fdmr1687497b3a.11.1790142665440;
        Tue, 22 Sep 2026 22:51:05 -0700 (PDT)
Received: from abs.sf.dndws.com ([50.35.86.68])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-87d1dffd6ddsm691486b3a.48.2026.09.22.22.51.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 22:51:04 -0700 (PDT)
From: Tao Gong <gongtao0607@gmail.com>
To: netdev@vger.kernel.org
Cc: "Chester A . Unal" <chester.a.unal@arinc9.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	=?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Tao Gong <gongtao0607@gmail.com>
Subject: [PATCH net v2 0/2] net: dsa: mt7530: fix trapped frame forwarding and egress tagging
Date: Wed, 23 Sep 2026 05:51:01 +0000
Message-ID: <20260923055103.949540-1-gongtao0607@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_225106_767659_B10FDD44 
X-CRM114-Status: UNSURE (   8.35  )
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

This series resolves two issues in the MT7530 DSA switch driver preventing
trapped link-local control frames (such as STP BPDUs) from reaching the CPU
host when bridge VLAN filtering is enabled:

1. Commit 3ac85bcfd404 ("net: dsa: mt7530: preserve VLAN tags on trapped
   link-local frames") set MT7530_VLAN_EG_DISABLED to preserve VLAN tags,
   but in hardware this disables the per-packet override and causes
   trapped frames to follow the CPU port's active VLAN table (VAWD2) rule.
   When bridge VLAN filtering is active, the CPU port is in stack mode,
   causing incoming untagged BPDUs (01:80:C2:00:00:00) to be egressed with
   a VLAN tag, which userspace STP daemons (such as ustpd) and the kernel
   bridge drop. MT7530_VLAN_EG_CONSISTENT correctly preserves wire state
   (untagged frames stay untagged, tagged frames stay tagged).

2. On Airoha EN7581 and AN7583 switch IP, setting MT7531_CFC (0x04)
   CPU_PMAP alone is insufficient; the switch MAC forwarding control
   (MT753X_MFC, 0x10) must also have CPU_EN and CPU_PORT configured for
   trapped frames to exit to the CPU conduit.

Changes in v2:
  - Rebased onto net/main
    (git://git.kernel.org/pub/scm/linux/kernel/git/netdev/net.git) adapting
    to mt7530_rmw() instead of net-next's regmap helpers, resolving the
    patch application failure on net-0 noted by Jakub Kicinski.
  - Carried over Lorenzo Bianconi's Acked-by on patch 2 as the underlying
    logic is unchanged.

Tao Gong (2):
  net: dsa: mt7530: use consistent egress tag for trapped link-local
    frames
  net: dsa: mt7530: trap frames to conduit in MFC on EN7581 and AN7583

 drivers/net/dsa/mt7530.c | 27 ++++++++++++++-------------
 1 file changed, 14 insertions(+), 13 deletions(-)


base-commit: 9c572a83037a7dcd653ba3a9cc468c16b857d0c9
-- 
2.55.0


