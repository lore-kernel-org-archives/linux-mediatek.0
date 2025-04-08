Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97B95C369A4
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Apr 2025 14:28:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pSHGxvoqIBIbqZcTKF/gVVMx0ajorY2bbUPhZUg2YJ0=; b=sUxz5nOavx9WezsVZ+QxDAW1w0
	T3VkaGi0Rtg1veGOr27bWQaX6j32Yjy/2lTUuS1bZ13Pe4wX7qqH5t9EIQd+DAjXePaPWd+n426fk
	+D5OyHVdGPnZzVy0jK/c0SdL4LfhYbhyZxjUBOxiKfr3wjfL3osD4i/iuaze05TfJlxW8awdOSgUC
	AG/xyPDK8/mHG5ifC/0ZRmXmTmIMlsKseyLSf9PiZ0zYhT1BTcBuTYgUJTf3bhB+s/IQP3YMmdHG7
	M/XDMx6ydHBOHlbF3fN6C3UhhoE6OB6pjp6YW/Ei3OQBeJ9gcljQEq6cxXqvmRq6ckxtT6OgUay9p
	4z1fbebw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u29vn-00000004Nhr-218o;
	Tue, 08 Apr 2025 14:28:03 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u29vK-00000004NSY-2joH
	for linux-mediatek@lists.infradead.org;
	Tue, 08 Apr 2025 14:27:35 +0000
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-ac2c663a3daso1048638466b.2
        for <linux-mediatek@lists.infradead.org>; Tue, 08 Apr 2025 07:27:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744122453; x=1744727253; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pSHGxvoqIBIbqZcTKF/gVVMx0ajorY2bbUPhZUg2YJ0=;
        b=H80awn+P7pQJ5M6obgq/3K29hpusF3eTIkdRvJsH+EypU0iBwojbqk8jZ1+d99/r4h
         FnJYqs6YRKbhQAv884sT98Tn5YImaU3+K2kEQAWlIfY/bi5tJfNtfjrgYO79x+SzZgOb
         CQfgkeqTev8SUwTj1Hfe6FMrk6Giqlp9BTmwn1bwMu089aUlDntQAvRYlPto9Q2dPKoR
         Ta3DtI4BugqfpzjdBnSWMuACjh2JhHGGL3bHHukFkLEYe8GHziU7sjwXCgY4FUeRVO+5
         JmLfwZ/OlC79JNPzhvuNDIZcLtSAfFav+x4tfoH5LlqgukivofW9gn6rfCjA3ArKgegW
         /xdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744122453; x=1744727253;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pSHGxvoqIBIbqZcTKF/gVVMx0ajorY2bbUPhZUg2YJ0=;
        b=P5FMjSmHIDjbQ0DFm1olhGNF6Zuc8T9cwjE0LlucNuaJjAp2qhgM9pnmTboh5mU3Tl
         8wYRqbVu5WrW/o25BDzkOZMIAXW2fBuen/OJtpNgTUyZugn1vpz8P11X7BJrAFA4jo20
         +molLwLpjBCPFfTv7YnkYVy3sX+PMtWE1V1JJh0qVn2p5THumDHEO8XyHk/ijJlrTc/t
         EhCZKN/E/z+JYJITn+nLEKtCf1sC2ZRF+2HJh5mdzl5nUrFPZmGRBCMGFTlcOieDlO0Y
         v5jSUz9TItLCC+eKJHJ0btpMwSo1QQ0GIyo9IECvs/9wzg0/D1pRYFjSCsgnm6RSpk31
         AzHg==
X-Forwarded-Encrypted: i=1; AJvYcCVI7IyZ1mXTbYQPX2kYI/S8mU9pe2GvlwlfFZVg5JO4qdsIwNKTagxFvtC2NVYGDACiI67T6LwHcPPhO0TGTQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YylrDdTYtAC1FHGhMYMASCJ2swOofw6B/67s0I7gefEtf4+gLKo
	myDOiy5iyFzrqnK8eWrLRLf4N2Bym5gtr6haruRo+dmf0ltyFSWA
X-Gm-Gg: ASbGncsVAlp4WOPyq27Va3DEfIOI1D1TUIFwQZI/cMImlT3gnvhhh+KUH60cGLEx8yH
	jeOxlXyZZYdFyyN9iMuDtb0EVDCB85Kmke9z/2OGqkoGHc7RnQc7KW+4yQ7RKbCwX/GVb/Dng/k
	EQ5dYoARbRvyf/zKb7+V0nd0wQAQdc0TP06xgODci0WB7O3flWiQxUaCtkHz3cN8zo5FXWOLyWt
	6CxhMGmjPf6VbCKGPTogiDcqa+rCIDr2pM4zbRCYprUdsdm2y2eJRQTJ4y4vF8cIssTnJjhNzN4
	jbBiks9ws2hKTA6VGwNtSJcfJsUIJdaUgOOvFfkmFtRdexCFkqkah29wDs3s1619dsXOLSIdib1
	Xy3Wi1lR7BYK1fQLIP9xai+B85/NUzd77jV8A51MKxhHwX+DxWaN1U1S7kKtVTDk=
X-Google-Smtp-Source: AGHT+IH3URBmXzvm7rmuiifGg0nI6GTLC2yk/NwC/7RSNf7U9qMp8Uua9d/HOCEY/8nWokG6ODloBA==
X-Received: by 2002:a17:907:7291:b0:ac2:a4ec:46c2 with SMTP id a640c23a62f3a-ac7d1b9c1demr1497465466b.49.1744122452769;
        Tue, 08 Apr 2025 07:27:32 -0700 (PDT)
Received: from localhost.localdomain (2001-1c00-020d-1300-1b1c-4449-176a-89ea.cable.dynamic.v6.ziggo.nl. [2001:1c00:20d:1300:1b1c:4449:176a:89ea])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac7bfe9be67sm910393266b.46.2025.04.08.07.27.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 07:27:32 -0700 (PDT)
From: Eric Woudstra <ericwouds@gmail.com>
To: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Jiri Pirko <jiri@resnulli.us>,
	Ivan Vecera <ivecera@redhat.com>,
	Nikolay Aleksandrov <razor@blackwall.org>,
	Ido Schimmel <idosch@nvidia.com>,
	Pablo Neira Ayuso <pablo@netfilter.org>,
	Jozsef Kadlecsik <kadlec@netfilter.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: netdev@vger.kernel.org,
	bridge@lists.linux.dev,
	netfilter-devel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Eric Woudstra <ericwouds@gmail.com>
Subject: [PATCH v11 nf-next 3/3] bridge: Introduce DEV_PATH_BR_VLAN_KEEP_HW
Date: Tue,  8 Apr 2025 16:27:16 +0200
Message-ID: <20250408142716.95855-4-ericwouds@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250408142716.95855-1-ericwouds@gmail.com>
References: <20250408142716.95855-1-ericwouds@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250408_072734_687857_8ECC5840 
X-CRM114-Status: GOOD (  16.97  )
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

Following the path through a bridge, there are 2 situations where the
action is to keep:

1. Packets have the encap, and keep the tag at ingress and keep it at
   egress. It is typical in the forward path, when a vlan-device and
   bridge are combined.

2. Packets do not have the encap, are tagged at ingress and untagged
   at egress. Can be found when only a bridge is in the forward path.
   It is also possible in the bridged path.

For switchdev userports that support SWITCHDEV_OBJ_ID_PORT_VLAN in
sitaution 2, it is necessary to introduce DEV_PATH_BR_VLAN_KEEP_HW.
The typical situation 1 is unchanged: DEV_PATH_BR_VLAN_KEEP.

DEV_PATH_BR_VLAN_KEEP_HW is similar to DEV_PATH_BR_VLAN_TAG, with the
correcponding bit in ingress_vlans set.

Signed-off-by: Eric Woudstra <ericwouds@gmail.com>
---
 include/linux/netdevice.h        |  1 +
 net/bridge/br_device.c           |  1 +
 net/bridge/br_vlan.c             | 18 +++++++++++-------
 net/netfilter/nft_flow_offload.c |  3 +++
 4 files changed, 16 insertions(+), 7 deletions(-)

diff --git a/include/linux/netdevice.h b/include/linux/netdevice.h
index cf3b6445817b..4e8eaae8c441 100644
--- a/include/linux/netdevice.h
+++ b/include/linux/netdevice.h
@@ -887,6 +887,7 @@ struct net_device_path {
 				DEV_PATH_BR_VLAN_TAG,
 				DEV_PATH_BR_VLAN_UNTAG,
 				DEV_PATH_BR_VLAN_UNTAG_HW,
+				DEV_PATH_BR_VLAN_KEEP_HW,
 			}		vlan_mode;
 			u16		vlan_id;
 			__be16		vlan_proto;
diff --git a/net/bridge/br_device.c b/net/bridge/br_device.c
index a818fdc22da9..80b75c2e229b 100644
--- a/net/bridge/br_device.c
+++ b/net/bridge/br_device.c
@@ -423,6 +423,7 @@ static int br_fill_forward_path(struct net_device_path_ctx *ctx,
 	case DEV_PATH_BR_VLAN_UNTAG:
 		ctx->num_vlans--;
 		break;
+	case DEV_PATH_BR_VLAN_KEEP_HW:
 	case DEV_PATH_BR_VLAN_KEEP:
 		break;
 	}
diff --git a/net/bridge/br_vlan.c b/net/bridge/br_vlan.c
index 6bfc7da10865..0f714df92118 100644
--- a/net/bridge/br_vlan.c
+++ b/net/bridge/br_vlan.c
@@ -1490,13 +1490,17 @@ int br_vlan_fill_forward_path_mode(struct net_bridge *br,
 	if (!(v->flags & BRIDGE_VLAN_INFO_UNTAGGED))
 		return 0;
 
-	if (path->bridge.vlan_mode == DEV_PATH_BR_VLAN_TAG)
-		path->bridge.vlan_mode = DEV_PATH_BR_VLAN_KEEP;
-	else if (v->priv_flags & BR_VLFLAG_TAGGING_BY_SWITCHDEV)
-		path->bridge.vlan_mode = DEV_PATH_BR_VLAN_UNTAG_HW;
-	else
-		path->bridge.vlan_mode = DEV_PATH_BR_VLAN_UNTAG;
-
+	if (path->bridge.vlan_mode == DEV_PATH_BR_VLAN_TAG) {
+		if (v->priv_flags & BR_VLFLAG_TAGGING_BY_SWITCHDEV)
+			path->bridge.vlan_mode = DEV_PATH_BR_VLAN_KEEP_HW;
+		else
+			path->bridge.vlan_mode = DEV_PATH_BR_VLAN_KEEP;
+	} else {
+		if (v->priv_flags & BR_VLFLAG_TAGGING_BY_SWITCHDEV)
+			path->bridge.vlan_mode = DEV_PATH_BR_VLAN_UNTAG_HW;
+		else
+			path->bridge.vlan_mode = DEV_PATH_BR_VLAN_UNTAG;
+	}
 	return 0;
 }
 
diff --git a/net/netfilter/nft_flow_offload.c b/net/netfilter/nft_flow_offload.c
index d84e677384da..fdf927a8252d 100644
--- a/net/netfilter/nft_flow_offload.c
+++ b/net/netfilter/nft_flow_offload.c
@@ -145,6 +145,9 @@ static void nft_dev_path_info(const struct net_device_path_stack *stack,
 			case DEV_PATH_BR_VLAN_UNTAG_HW:
 				info->ingress_vlans |= BIT(info->num_encaps - 1);
 				break;
+			case DEV_PATH_BR_VLAN_KEEP_HW:
+				info->ingress_vlans |= BIT(info->num_encaps);
+				fallthrough;
 			case DEV_PATH_BR_VLAN_TAG:
 				info->encap[info->num_encaps].id = path->bridge.vlan_id;
 				info->encap[info->num_encaps].proto = path->bridge.vlan_proto;
-- 
2.47.1


