Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95BCCC43458
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 Jun 2026 12:33:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=W6yfFGpGsowdA7nocV8Q2ZeGgDt/heljVkQt2pc3Sqk=; b=XeP5oPlAW4K5XDtKiTw9PFmk95
	cqdhKtTAc5Zgn/8qlxNLsB8Mo2SPJzF8xxjj/MaoAI+FJVgieuWOvlT9XHX1wxigJmWgc6U0wEX27
	K54qnYk9pxtbev8lzCdqPSak1Fz8UMe5uR3AQDlD/IxS2H0IEV52MGHK1rMp4okXLjNB0MIBBh0ZF
	QlfdD9EOUz/RDiD1IdXzcxJ0x4PZglnFAURDX2pypTqMtc/tjWKvPNeMPLhlD8U80TQEoKIw8B8Ve
	oJApJXWj0pTetscAPBPxn78onpbsECfNk8I/MbTCQLvlCG2aJ1UqVmyEOLdYPQjzclLyE+z7Cf6ML
	6LMGTiGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weBAm-0000000EZ2O-2SQ7;
	Mon, 29 Jun 2026 12:33:12 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weBAk-0000000EZ00-0zkY
	for linux-mediatek@lists.infradead.org;
	Mon, 29 Jun 2026 12:33:11 +0000
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-c125bcfd9a1so137488266b.1
        for <linux-mediatek@lists.infradead.org>; Mon, 29 Jun 2026 05:33:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782736385; x=1783341185; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=W6yfFGpGsowdA7nocV8Q2ZeGgDt/heljVkQt2pc3Sqk=;
        b=CaCrxxqnUzshY9q19xocT4qGRLxBgguOw6h6VBPDESOqlPhDQ/8x0dcAJGtj1LrU4u
         R093cAbRFZT1PjqB+Ww5rdE8D8VHv1xrgfXv3nlXQO7K74ZAwhM7C+4VgTcJNc1vLvON
         zzWAAu3fXDhD6f8e1irZcbaP60+FgwFZFzYxg4pfsyy5d051COPwEo3u39WqOT5Y0lh3
         aCUt2YSmsy63waBlAfKGUJIOs7nUXRBJ59K+UQ3y9FWq+YtaZfr+cSn5WhrfZFooslVx
         eK8/N7xv5LVY83VmiyUbQ/CzBAGsXnx3Dw+LFfzXE031tTIuX0xauDE3eMqYzhdknF+/
         1Uig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782736385; x=1783341185;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W6yfFGpGsowdA7nocV8Q2ZeGgDt/heljVkQt2pc3Sqk=;
        b=UtVCASwHF9rhzMFjM6e7LGP1j58S1lVOIV5otgRjCfhGMOzw6Z4yDb8gp009fjV1z7
         3SV8sBv7kWuzcDDd4RKFq5EpAl1y19ipTSvfZsdrtViWnlQ20dfDiraeKPS5iZ8J6daT
         gnLlBoHVtIPGctRgRqRF7EMTMALTwHQVwew6A12qHw2Rox9WvOaWOTbB3dwQfOxu1Zs3
         DzMJai6Eu45BCLdVx1nAbNW5q7JdIvN+Thevn6tJ+bbZLWrUO9p8M04OeHxuhKEgoLoz
         kSAdd9Uv8gVEGm/k9YjUrIhACMnna79XzeI1q1YWCYq5O7Hgo8nQYQB/5eGMnOji10wq
         ziFQ==
X-Forwarded-Encrypted: i=1; AHgh+Rprfh0/wm7j8xPGk4kCZGN52kp4+3NRdncfJphMfg9H8Z4s4HTiHtVwT7ZmlQ6f952pmed6UGwvo1nUp79DEQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YyYorpEPmAMWMucOWB7cbnN0kGz1McyMRApZUQL1WgRs4PcfeeI
	HQYdi3kitGJ6MpYGVKMJ3ngtmdElJAO6zSoMvKimcQa4ndLEXsHolgzb
X-Gm-Gg: AfdE7clmB00BMANjiVvt8GaPvi+Mkf2eZMAEyeBKuHXMilOu8DF6lcFFXEfzNpDL4yJ
	SuAMtb+OhVgsCyJI8FRgnGzqtLUSpt3a5IF+vI2hFREALx/+XIzc1g0MkIbOJ3WLMTnp67n6lci
	bP2KdM7xe4OTQmdsis+s9iRGQ4NjpuG522n+ZKQfPs7xc8nWKO+VNCtUq2UFs2ZOiLQDA8nfcmA
	PwkeiccDDXkvyfQ0AqLUrP6bXzE3QM0cd0P80uHuOEBe0VUgH34HmlT8LjV2jk14m0mXYAoXkzT
	e5C7NjG9ZQxeWkbtZDgHEDWa0MV18blSvzxZEN3Sn1tpvIldKKN/Xrh2EJwdzR2q6oj0yT5pbW6
	gzUPDV+lO2WLUidV3moCi3FL3o58RyqhHLU5pKhCcd9/kfH8fG6PoHhfTWxyVHg1lbCAdC8MzNM
	sw68WTBPs=
X-Received: by 2002:a17:906:f116:b0:c12:2b66:352b with SMTP id a640c23a62f3a-c123342a062mr351983366b.5.1782736384619;
        Mon, 29 Jun 2026 05:33:04 -0700 (PDT)
Received: from fedora ([46.205.218.111])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c11fbe05c22sm773866566b.39.2026.06.29.05.33.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 05:33:04 -0700 (PDT)
From: Daniel Pawlik <pawlik.dan@gmail.com>
To: netfilter-devel@vger.kernel.org,
	netdev@vger.kernel.org
Cc: pablo@netfilter.org,
	fw@strlen.de,
	phil@nwl.cc,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	andrew+netdev@lunn.ch,
	razor@blackwall.org,
	idosch@nvidia.com,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	bridge@lists.linux.dev,
	coreteam@netfilter.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	rchen14b@gmail.com,
	lorenzo@kernel.org,
	Daniel Pawlik <pawlik.dan@gmail.com>
Subject: [PATCH 0/5] netfilter: nf_flow_table_path: L2 bridge offload
Date: Mon, 29 Jun 2026 14:32:48 +0200
Message-ID: <20260629123253.1912621-1-pawlik.dan@gmail.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260629_053310_304316_673BFC9E 
X-CRM114-Status: GOOD (  10.02  )
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

This series adds L2 bridge offload support to nft_flow_offload, allowing
bridged IPv4/IPv6 flows to be accelerated by the flowtable fast path
without requiring L3 routing.

Background
----------
Hardware flow offload engines (e.g. MediaTek PPE) can accelerate bridged
traffic but require that nft_flow_offload detect and handle bridged flows
differently from routed ones: no routing table lookup, MAC addresses from
the Ethernet header, and VLAN context pre-populated from the bridge port.

Patches
-------
1/5  net: export __dev_fill_forward_path
     Refactors dev_fill_forward_path() to expose __dev_fill_forward_path()
     which accepts a caller-supplied net_device_path_ctx, needed to
     pre-populate VLAN state before the forward path walk.

2/5  net: bridge: add flow offload helpers
     Adds br_fdb_has_forwarding_entry_rcu(), br_vlan_get_offload_info_rcu()
     and br_vlan_is_enabled_rcu() to expose bridge state to nft_flow_offload
     without requiring inclusion of net/bridge/br_private.h.

3/5  netfilter: nf_flow_table_path: add L2 bridge offload
     Core of the series. Adds nft_flow_offload_is_bridging() detection,
     nft_flow_route_bridging() which avoids nf_route() (fails for
     bridged-only subnets), MAC/VLAN pre-population for bridged flows,
     and a dst leak fix (allocation references in dsts[] were never
     released after nft_default_forward_path() transferred ownership).
     nft_flow_route() becomes a thin dispatcher.

4/5  netfilter: nf_flow_table_path: handle DEV_PATH_MTK_WDMA in path info
     Fixes zero-source-MAC in PPE entries when a bridged flow traverses
     MT7996/MT7915 WiFi WDMA hardware.

5/5  netfilter: nf_flow_table_path: add VLAN passthrough support
     Records VLAN encap info for passthrough-mode bridge ports so hardware
     offload entries include the correct VLAN tag.

Rebase note
-----------
Originally developed against OpenWrt pending-6.18 patches by Ryan Chen
<rchen14b@gmail.com> and Bo-Cun Chen <bc-bocun.chen@mediatek.com>.
Rebased to current upstream: path discovery infrastructure moved to
nf_flow_table_path.c in commit 93d7a7ed0734 ("netfilter: flowtable: move
path discovery infrastructure to its own file"), so all netfilter changes
now land in that file rather than nft_flow_offload.c.

How to enable bridge offload
-----------------------------
1. Load kmod-br-netfilter so that bridged IP traffic traverses the
   netfilter forward chain.

2. Enable netfilter hooks on the bridge:
     echo 1 > /sys/class/net/<br>/bridge/nf_call_iptables
     echo 1 > /sys/class/net/<br>/bridge/nf_call_ip6tables

3. Register bridge member interfaces in the nft flowtable:
     table inet filter {
         flowtable f {
             hook ingress priority filter
             devices = { eth0, wlan0 }
         }
         chain forward {
             type filter hook forward priority filter
             meta l4proto { tcp, udp } flow add @f
         }
     }

Daniel Pawlik (1):
  net: bridge: add flow offload helpers

Ryan Chen (4):
  net: export __dev_fill_forward_path
  netfilter: nf_flow_table_path: add L2 bridge offload
  netfilter: nf_flow_table_path: handle DEV_PATH_MTK_WDMA in path info
  netfilter: nf_flow_table_path: add VLAN passthrough support

 include/linux/if_bridge.h          |  23 ++++
 include/linux/netdevice.h          |   2 +
 net/bridge/br_fdb.c                |  32 +++++
 net/bridge/br_vlan.c               |  45 +++++++
 net/core/dev.c                     |  32 +++--
 net/netfilter/nf_flow_table_path.c | 201 +++++++++++++++++++++++++++--
 6 files changed, 312 insertions(+), 23 deletions(-)

-- 
2.54.0


