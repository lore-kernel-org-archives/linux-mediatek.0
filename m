Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DF52CF2576
	for <linux-mediatek@archiver.kernel.org>; Sun, 13 Oct 2024 18:57:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=D+/sR2kjz9V+zWn0d2wDxRH2CVHlBDFu10ji8AcnuMk=; b=IzfZ1kGxi40tBD0Gd9ItAIp9cO
	Uw4wvrNarvQ0jUpLWj4OrD2CgWysKub2Lg1c8IWba6Uv6ei2nF5mwqwbzuZbzqUHFzDNI+BqmrHVl
	qKI37D0Czc9zi+JbhiCa+hQNPn7fpoDzuOuz/UUWzxIbRD1pQHfk/+9svp/JM4mFtCYmpKLw79SYa
	oYMFjzg2BZ8HUGgrvfgPbxolmkPWMqrgui3V5A5YxXBrZS5LeHjO39Eyhr9GGPDB1+K6rcc6D2q53
	rEd9d3WRi2df+XnMhsB1JQGNbnLbrSoscTS6+KKJmBXZ4ftAzsTdCFOjbE1cnuX5pVv/sq8FeU37u
	/gz+NQhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t03m1-000000034sC-2fsY;
	Sun, 13 Oct 2024 18:57:01 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t03ka-000000034Xk-3pMh;
	Sun, 13 Oct 2024 18:55:34 +0000
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-5c957d8bce2so1642558a12.2;
        Sun, 13 Oct 2024 11:55:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728845731; x=1729450531; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=D+/sR2kjz9V+zWn0d2wDxRH2CVHlBDFu10ji8AcnuMk=;
        b=UIy7XgzjWhNw9U/MCG3tE42jhPVYUEclf8bVlEHTSlLNZStPNL77d4RBnmt8/wr8o1
         RjKXeEXh1biNYc6VIqV+Lscd6y2axb0IKEHz2lrCAq0qIKsoObP91FOD0KxlfsPntdAr
         8CmaMycrHiHsWN/R6vqy7psSh2FtKpXkaE6hU1OKtXC5aE0RlwQVeVy1CgL1426CA1as
         UtSiJYkikoeDFjuZRt/NqIPTRXhxDpVBOD6XjSysZVyUDJ1Uuw/y6ZuvKwcy5bRcy/RU
         5PxrUsfJRsY2AGGEzSy+ggjwD9QF/nnpmFNbBVMkSGDAl/R0V/Mi0g5Z5rM49Lf/d0OW
         M/Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728845731; x=1729450531;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=D+/sR2kjz9V+zWn0d2wDxRH2CVHlBDFu10ji8AcnuMk=;
        b=AaVOBQdOHTI07sCPd2B2ErObk2iTX8vMwQ7eHhxCM2k3EuYoYJblcegiRrcL3xYHKq
         2lecGeps3l40bGxOMgvicKz9ERiVmwr9s0ryzhaaDxl35dPG/t3H/FtX7tkfBWRWSzqo
         XghZfEwv2bN5ZMlMGksaPB+WIQ1aDcP+DMMrIAUuWZtCuYs8DqNrsVqtodTl/CHs6PY5
         EFmFM2jHNy7EjEoCka/oSbUduwqPZrGJLHsSNYKjYGTxledUruuDsYNuLcY0LNgzPKac
         bJPIqC/SvRZApt5NUk6+LzU2tSXw+gRnqJ1qK2uBADgr0KotWO7JDqkNAaUCTVSIQ+Jj
         6Gog==
X-Forwarded-Encrypted: i=1; AJvYcCVnPQaAL5XEVGJeU06qiR/dGU8Td7ht5s/AY91RTWnNny2lAJQRcxt/DLP4kRWxaV5YWcy+owrmKywLUyBE+ojR@lists.infradead.org, AJvYcCXu8v8tHaZNUz33/SCyEDeQqTRzva3B2zc8HHXvr+jGq83JrTSDH6z7iYKXcNFLHuF3ncDtv0+tcNw4CGXCMUU=@lists.infradead.org
X-Gm-Message-State: AOJu0Yy/cPlAUVwo6ZnU7IHBxDkfJnPnjuxzxiDaz08SB0+LqIRDJ9It
	cn9LUcvYc81QGsjGMCvT2vU2BKoyhxJjBE2R3/w3xpeoXY+LfvA9
X-Google-Smtp-Source: AGHT+IFUs+QjM43yj3nlR0ziuQLWkrMusL86D6FHgNlbZ4Yj4coPCVb+b+uweHJZ0+t4PyPXDgXOQg==
X-Received: by 2002:a05:6402:3510:b0:5c9:5aac:c622 with SMTP id 4fb4d7f45d1cf-5c95ac09918mr12547222a12.5.1728845731151;
        Sun, 13 Oct 2024 11:55:31 -0700 (PDT)
Received: from corebook.localdomain (2001-1c00-020d-1300-1b1c-4449-176a-89ea.cable.dynamic.v6.ziggo.nl. [2001:1c00:20d:1300:1b1c:4449:176a:89ea])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9a12d384b9sm13500866b.172.2024.10.13.11.55.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Oct 2024 11:55:30 -0700 (PDT)
From: Eric Woudstra <ericwouds@gmail.com>
To: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Pablo Neira Ayuso <pablo@netfilter.org>,
	Jozsef Kadlecsik <kadlec@netfilter.org>,
	Roopa Prabhu <roopa@nvidia.com>,
	Nikolay Aleksandrov <razor@blackwall.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Jiri Pirko <jiri@resnulli.us>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	"Frank Wunderlich" <frank-w@public-files.de>,
	Daniel Golle <daniel@makrotopia.org>,
	Eric Woudstra <ericwouds@gmail.com>
Cc: netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	netfilter-devel@vger.kernel.org,
	coreteam@netfilter.org,
	bridge@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH RFC v1 net-next 00/12] bridge-fastpath and related improvements
Date: Sun, 13 Oct 2024 20:54:56 +0200
Message-ID: <20241013185509.4430-1-ericwouds@gmail.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241013_115532_977907_51F697BA 
X-CRM114-Status: GOOD (  13.24  )
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

This patchset makes it possible to set up a (hardware offloaded) fastpath
for bridged interfaces.

To set up the fastpath with offloading, add this extra flowtable:

table bridge filter {
        flowtable fb {
                hook ingress priority filter
                devices = { lan0, lan1, lan2, lan3, lan4, wlan0, wlan1 }
                flags offload
        }
        chain forward {
                type filter hook forward priority filter; policy accept;
		ct state established flow add @fb
        }
}

Creating a separate fastpath for bridges.

         forward fastpath bypass
 .----------------------------------------.
/                                          \
|                        IP - forwarding    |
|                       /                \  v
|                      /                  wan ...
|                     /
|                     |
|                     |
|                   brlan.1
|                     |
|    +-------------------------------+
|    |           vlan 1              |
|    |                               |
|    |     brlan (vlan-filtering)    |
|    +---------------+               |
|    |  DSA-SWITCH   |               |
|    |               |    vlan 1     |
|    |               |      to       |
|    |   vlan 1      |   untagged    |
|    +---------------+---------------+
.         /                   \
 ------>lan0                 wlan1
        .  ^                 ^
        .  |                 |
        .  \_________________/
        .  bridge fastpath bypass
        .
        ^
     vlan 1 tagged packets

To have the ability to handle xmit direct with outgoing encaps in the
bridge fastpass bypass, we need to be able to handle them without going
through vlan/pppoe devices. So I've applied, amended and squashed wenxu's
patchset. This patch also makes it possible to egress from vlan-filtering
brlan to lan0 with vlan tagged packets, if the bridge master port is doing
the vlan tagging, instead of the vlan-device. Without this patch, this is
not possible in the bridge-fastpath and also not in the forward-fastpath,
as seen in the figure above.

There are also some more fixes for filling in the forward path. These
fixes also apply to for the forward-fastpath. They include handling
DEV_PATH_MTK_WDMA in nft_dev_path_info() and avoiding
DEV_PATH_BR_VLAN_UNTAG_HW for bridges with ports that use dsa.

Conntrack bridge only tracks untagged and 802.1q. To make the bridge
fastpath experience more similar to the forward fastpath experience,
I've added double vlan, pppoe and pppoe-in-q tagged packets to bridge
conntrack and to bridge filter chain.

Eric Woudstra (12):
  netfilter: nf_flow_table_offload: Add nf_flow_encap_push() for xmit
    direct
  netfilter: bridge: Add conntrack double vlan and pppoe
  netfilter: nft_chain_filter: Add bridge double vlan and pppoe
  bridge: br_vlan_fill_forward_path_pvid: Add port to port
  bridge: br_fill_forward_path add port to port
  net: core: dev: Add dev_fill_bridge_path()
  netfilter :nf_flow_table_offload: Add nf_flow_rule_bridge()
  netfilter: nf_flow_table_inet: Add nf_flowtable_type flowtable_bridge
  netfilter: nft_flow_offload: Add NFPROTO_BRIDGE to validate
  netfilter: nft_flow_offload: Add DEV_PATH_MTK_WDMA to
    nft_dev_path_info()
  bridge: br_vlan_fill_forward_path_mode no _UNTAG_HW for dsa
  netfilter: nft_flow_offload: Add bridgeflow to nft_flow_offload_eval()

 include/linux/netdevice.h                  |   2 +
 include/net/netfilter/nf_flow_table.h      |   3 +
 net/bridge/br_device.c                     |  20 ++-
 net/bridge/br_private.h                    |   2 +
 net/bridge/br_vlan.c                       |  24 +++-
 net/bridge/netfilter/nf_conntrack_bridge.c |  86 ++++++++++--
 net/core/dev.c                             |  77 +++++++++--
 net/netfilter/nf_flow_table_inet.c         |  13 ++
 net/netfilter/nf_flow_table_ip.c           |  96 ++++++++++++-
 net/netfilter/nf_flow_table_offload.c      |  13 ++
 net/netfilter/nft_chain_filter.c           |  20 ++-
 net/netfilter/nft_flow_offload.c           | 154 +++++++++++++++++++--
 12 files changed, 463 insertions(+), 47 deletions(-)

-- 
2.45.2


