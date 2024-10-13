Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83A18CF2579
	for <linux-mediatek@archiver.kernel.org>; Sun, 13 Oct 2024 19:09:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9DH9O06Lp64TibMF8pahG9IPkhLX3XCOl3DriGpuFd0=; b=sGqnk02h6XTfGGRvrgkVfa1uZZ
	80oG5dABy9tyCPOhC3qI+WrgM4DUbTLNyd+MlH/pNQU/VafRI2+tlBsNMeOtnLnVY1cUIJjftAP2W
	6ZhoDLIXtGaSvx8696++FUaoUdeaqZCSNLKAUWIuAl3U7zbw8NSx1yloSIu0TsYl3iTLlHL7i6ODe
	WMAGJh/udQoakoEbgSa62BR0i6SVLTIUnVGJJmi+9RXiSphZKBayyZHvQj9kMy1UNLI6bXfbdyrD8
	KVoCKF9xhogys6VWHKAqhvKyUHqJkJejZ47RAAss1D7Pp3cJjAcEqeLqY0RLl9o0dR7k6bOJ7/qcJ
	d/P5BgFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t03yK-000000036eI-0eeF;
	Sun, 13 Oct 2024 19:09:44 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t03kp-000000034bs-1lR1;
	Sun, 13 Oct 2024 18:55:48 +0000
Received: by mail-ed1-x533.google.com with SMTP id 4fb4d7f45d1cf-5c97c7852e8so432497a12.1;
        Sun, 13 Oct 2024 11:55:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728845746; x=1729450546; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9DH9O06Lp64TibMF8pahG9IPkhLX3XCOl3DriGpuFd0=;
        b=KwuEPAMZKQoi1AyB9+YUNKS/kGD0dZA4X3p6xZvQbSheqHUckvWVAudEQRBp9eQnLd
         R1akaLJWI9CJUrvX/hFqwWpeZyOIOW6xuab1w1J8YAVEJt40uYyF/svq01ULdrh52uVE
         qHlmO2KDES+G9A5EPmLWSCXxK/Qcp8K/9+wMo8uZGP6EMFN4AFG1F9jIYaXdTAesEggM
         42Spuq8mD8e15EIeM39w/Dli1HEe1dN27SmTLakunBGZQz6w2PFMMGqYLJrW8SPPGNva
         35XA0C08zhLePMfw3qN1BC40feYjw0HPyxM/nYPLlRt3U4igv/0G5PBzuJwW0E7qcISU
         DCfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728845746; x=1729450546;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9DH9O06Lp64TibMF8pahG9IPkhLX3XCOl3DriGpuFd0=;
        b=rruYY6BOVdWOEoJF9lVJ9sOtM84Y/f2MjTE2Xrxj750m44td/iq1v+fnjYtIp3tltZ
         2l9c3rOVgfKUBj2cTxgAlQxMq5woZ8gTA9m2IZAdDh8w43sJYYKctPx3YfAXvbxuG6OF
         KGlYM2zSfnUkySy3vXKNeDcNqXsGyNmfpg93O1GfaOR9MMNo/4lVgT1JwUhMi0/Sc1U2
         p7PAPsvBYC38XITt8Xe5ox9Ky961SzGQnBmQJ/hCdM7tA+0iDe683p6ApIsnXedUtztd
         A9xMkNJ4cvnpNEVvC9Dz7lkHgrjLRPv8P9H2fCROILdKR9pgGn6Jp3x1AJ2KWJisvvlg
         DNnQ==
X-Forwarded-Encrypted: i=1; AJvYcCWXFpaOarPWpaDxcffrfrn+8g+cLnJ5sX8tiGABivM5KOSBtoARQ5YZymU2RaBADAGIt4xo7NYM8GdOXT1Av20=@lists.infradead.org, AJvYcCXMfUrFlt+Nasysdj8x1tJDozuVle6JYUD103iJqjQwtEvBxeGc53qmjOnNuVALrf+uRC9a6wKOqKd5k4an3Xzh@lists.infradead.org
X-Gm-Message-State: AOJu0Yy4HjEL3EWlZ4L7Cho7qigPFUzNleLDMAFrP2WeTBmzr35noDCu
	l0FQAaoRMnuJRm9Aftd7951CVQd+LdPVkLB9cH1LwMjPTnZTgenF
X-Google-Smtp-Source: AGHT+IF3e958cm6WfptQrjYwvw+8nY6U3EWzISV9aoZ2s8HNdWFDat+7mlGlek7WSgxj3fgwgQWR5g==
X-Received: by 2002:a17:907:7f12:b0:a99:f945:8776 with SMTP id a640c23a62f3a-a99f94588c4mr336725266b.24.1728845745513;
        Sun, 13 Oct 2024 11:55:45 -0700 (PDT)
Received: from corebook.localdomain (2001-1c00-020d-1300-1b1c-4449-176a-89ea.cable.dynamic.v6.ziggo.nl. [2001:1c00:20d:1300:1b1c:4449:176a:89ea])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9a12d384b9sm13500866b.172.2024.10.13.11.55.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Oct 2024 11:55:45 -0700 (PDT)
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
Subject: [PATCH RFC v1 net-next 10/12] netfilter: nft_flow_offload: Add DEV_PATH_MTK_WDMA to nft_dev_path_info()
Date: Sun, 13 Oct 2024 20:55:06 +0200
Message-ID: <20241013185509.4430-11-ericwouds@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241013185509.4430-1-ericwouds@gmail.com>
References: <20241013185509.4430-1-ericwouds@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241013_115547_499227_3197A528 
X-CRM114-Status: GOOD (  12.62  )
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

Signed-off-by: Eric Woudstra <ericwouds@gmail.com>
---
 net/netfilter/nft_flow_offload.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/net/netfilter/nft_flow_offload.c b/net/netfilter/nft_flow_offload.c
index 6719a810e9b5..2923286d475e 100644
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
@@ -114,7 +115,7 @@ static void nft_dev_path_info(const struct net_device_path_stack *stack,
 
 			if (path->type == DEV_PATH_ETHERNET)
 				break;
-			if (path->type == DEV_PATH_DSA) {
+			if (path->type == DEV_PATH_DSA || path->type == DEV_PATH_MTK_WDMA) {
 				i = stack->num_paths;
 				break;
 			}
-- 
2.45.2


