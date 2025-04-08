Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADB3BC369A5
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Apr 2025 14:28:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CZWb82/PgasUd3hxc4hu0fam4KL28GGEvVzyBGiqFMA=; b=Cq1+xPhjdOwu4CJ9l171Up3apw
	b33qgwm9bfLXesrhH9t5fqv8wBGELX+wH6Ulf7FGMbPfraTgAkLJn5njwdxbq37wngOwck/Qr/+5f
	N0hyVGE2crBpXJymha5dlq8RXf99qOA6q1KXiI8m2CrIcX75DSEci6TPQ29+oDUh/4LpZ7GsIVmKK
	1Pw1bsKczNbxJMo0QrSs7Poq9xX/H6hIBpx8eIZDI0tHo+KwKGMMzNt0S1FP4ebJvYpa86CX+oaZQ
	1jxD8RwYqnMrvfjuvZsDiu8gUjIlBpaYQL3e6n/D+m5h71lasNbc2O3vc0VWykykzaOWpNEXuYETM
	BTMac+CQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u29vm-00000004Ngi-3BBM;
	Tue, 08 Apr 2025 14:28:02 +0000
Received: from mail-ed1-f52.google.com ([209.85.208.52])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u29vH-00000004NRa-1pRn
	for linux-mediatek@lists.infradead.org;
	Tue, 08 Apr 2025 14:27:32 +0000
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-5e66407963fso10909471a12.2
        for <linux-mediatek@lists.infradead.org>; Tue, 08 Apr 2025 07:27:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744122449; x=1744727249; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CZWb82/PgasUd3hxc4hu0fam4KL28GGEvVzyBGiqFMA=;
        b=lbB5E39WVtGKiwUD6kfPSh6U7rUxl/Tzv2KdnB+kKfvWJs3ARZQRqAYRf4+n4tguhR
         kmdD8k+CNDSk6zzAoOs5NZ2azvwzad29EaLg1BqgTZ/Iu3bgRij6VWAEymnQPRd8JB1M
         whSYgmom6CKI5gyOarGElHxI4XkU2NOZwrb4ZpR/JrLrfBXMG8qwHpIFiI5V1ia0JlIN
         4F53y30/4aJuVoD0DvgmPNO5R3BFBHFrAxVQRC3DvX9XNKnyBgzBoL6aEqgazxS6PsaD
         7Ru0Eei/K3ZV1ceHvvVHvHO2nrFjB31benE2Cz95JMheqRoeXG9bm9kemP6N+qYNBxlR
         U0ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744122449; x=1744727249;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CZWb82/PgasUd3hxc4hu0fam4KL28GGEvVzyBGiqFMA=;
        b=VIoSAn0aF9sJhZ/st+jtKMDu+YbBMOq/MP7kg15qrY77ykOBA68hINo65/SOjawGAs
         7pi8NhNSZp8LADlPJCK2p9Q9lGQs2PII/LYC1r3T218z/6NOuVk3RSis3LI/JNeIPO6X
         BLMtdMh0y2z/f/irTcyNkEknRkauCRvRUfkLiRv0HOP21pOuClk2nPT2LTeLaxXrdXg4
         7zGtsPWl6uTadcK7w0Lhc/N6igxanyepo52BKw6SW5CMvwQin8ZDTs501kdVXPuyTirP
         pYf9MtYZ3TRQYeFP3UKi8QDcrCUe2AesqgyOl7szMQ3hGFyn6gQxBTmgO6OF891Bfa2O
         nkFg==
X-Forwarded-Encrypted: i=1; AJvYcCUJfBmAR08Io6lM5eeNXOiTRVdRS1bvMEPiMBAHIKJxG5VL/0NqKNam75K+SR7nBDb+wRzCe6JO0/9tpRtqjA==@lists.infradead.org
X-Gm-Message-State: AOJu0YybUBWBxAXRCKRksvG7i5nugfAB5/aoG8Nd7L7O4lNO3FnazD4Y
	NFDerdf4recK8X1G4CfvZYP7CLIQDJqFqRABQrZ3nJJJAjD7MdbV
X-Gm-Gg: ASbGnctGin7inVCHQcw11MWwi5T46umK46g3owzGEai1JobVpXcerOt739vGopJLPg+
	HLcZ7msCU8tPkBNE/zepDIWEUId7fmXNojNfhAPfZ1NTK5u2WSbbkroEYBLNsdWlsvCDppez2yM
	uXqZQkKnZgRX0q+uNp/OmLBSMX1fyaZyMAZQ5SqEBcR7QCPf6Qm5T1pmHg3WwxYLEV13Tm73RJ7
	3UXN5igJi/cYQX1hfjQzAVDLsA+0QA4xxdHBXvXkvuKV+09tyXM+Zl1pOawSPae8pplY3R+erpk
	UTJQRQ4sH1piGcMQm3K3yD3InoxZOpZYh2DyFHTJ2oO3rguP/maoUVtXVX3drLxo6BC3qWXYZp5
	T0US6PUC+KTIPTzsNuKzVbB8SN7+AHc987gJaOoQTWi1OwZok0mRBo162vVIUKWU=
X-Google-Smtp-Source: AGHT+IFVjpjwhiim+Bxc5j4VTe0TH54Bm1QrpuWBGrq3gtJayc9WyUqiJ7bQRpxPiIXdRTszdGVxkA==
X-Received: by 2002:a17:907:7f90:b0:ac1:da09:5d32 with SMTP id a640c23a62f3a-ac7d6c9f77dmr1145483566b.6.1744122449312;
        Tue, 08 Apr 2025 07:27:29 -0700 (PDT)
Received: from localhost.localdomain (2001-1c00-020d-1300-1b1c-4449-176a-89ea.cable.dynamic.v6.ziggo.nl. [2001:1c00:20d:1300:1b1c:4449:176a:89ea])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac7bfe9be67sm910393266b.46.2025.04.08.07.27.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 07:27:28 -0700 (PDT)
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
Subject: [PATCH v11 nf-next 1/3] netfilter: nft_flow_offload: Add DEV_PATH_MTK_WDMA to nft_dev_path_info()
Date: Tue,  8 Apr 2025 16:27:14 +0200
Message-ID: <20250408142716.95855-2-ericwouds@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250408142716.95855-1-ericwouds@gmail.com>
References: <20250408142716.95855-1-ericwouds@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250408_072731_471011_0AD6B157 
X-CRM114-Status: GOOD (  12.83  )
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

In case of using mediatek wireless, in nft_dev_fill_forward_path(), the
forward path is filled, ending with mediatek wlan1.

Because DEV_PATH_MTK_WDMA is unknown inside nft_dev_path_info() it returns
with info.indev = NULL. Then nft_dev_forward_path() returns without
setting the direct transmit parameters.

This results in a neighbor transmit, and direct transmit not possible.
But we want to use it for flow between bridged interfaces.

So this patch adds DEV_PATH_MTK_WDMA to nft_dev_path_info() and makes
direct transmission possible.

Reviewed-by: Nikolay Aleksandrov <razor@blackwall.org>
Signed-off-by: Eric Woudstra <ericwouds@gmail.com>
---
 net/netfilter/nft_flow_offload.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/net/netfilter/nft_flow_offload.c b/net/netfilter/nft_flow_offload.c
index 221d50223018..d84e677384da 100644
--- a/net/netfilter/nft_flow_offload.c
+++ b/net/netfilter/nft_flow_offload.c
@@ -106,6 +106,7 @@ static void nft_dev_path_info(const struct net_device_path_stack *stack,
 		switch (path->type) {
 		case DEV_PATH_ETHERNET:
 		case DEV_PATH_DSA:
+		case DEV_PATH_MTK_WDMA:
 		case DEV_PATH_VLAN:
 		case DEV_PATH_PPPOE:
 			info->indev = path->dev;
@@ -118,6 +119,10 @@ static void nft_dev_path_info(const struct net_device_path_stack *stack,
 				i = stack->num_paths;
 				break;
 			}
+			if (path->type == DEV_PATH_MTK_WDMA) {
+				i = stack->num_paths;
+				break;
+			}
 
 			/* DEV_PATH_VLAN and DEV_PATH_PPPOE */
 			if (info->num_encaps >= NF_FLOW_TABLE_ENCAP_MAX) {
-- 
2.47.1


