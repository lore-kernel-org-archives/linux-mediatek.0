Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC8CAC28B28
	for <linux-mediatek@archiver.kernel.org>; Sat, 15 Mar 2025 20:02:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rnv8s8ozBwrftot2Snzl1fMe2ZQjCLjk8NZLpN8fPs4=; b=da4WA+H7m9n/S9cpybkLUnasyS
	v/lcheZh/SZx0JXqcvN5OYPGZoRy/mVMJmMawDay41r0+5eUdtuwKsm6283x0C+FnDN+bdagtiefR
	MPlaV88IuO8yj1FeYbWPrRuygLiFSvrH2y+TjoCQ4IFUcgjIXCIg8ftj1FTrHRYp+PsZtreP6NOv8
	8u//qgkVoZjWN7m98H1Xr6FGvjGELzHnQVkC6QhJoFPMVCVZM/IFjEGkwtt3Q6YnDgNuBR7AKXi0B
	Xep/RzuiKdrMt8+/1lszbEmEkX3mX1xEjeyn6QIT81zEfIKmMhZJ5PKSTShAQS+evnUm+UGJkfId+
	9anWuBLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ttXhw-0000000Gmfk-3SLI;
	Sat, 15 Mar 2025 20:02:08 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ttXhu-0000000Gme3-0zVE
	for linux-mediatek@lists.infradead.org;
	Sat, 15 Mar 2025 20:02:07 +0000
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-ab771575040so812709566b.1
        for <linux-mediatek@lists.infradead.org>; Sat, 15 Mar 2025 13:02:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742068925; x=1742673725; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rnv8s8ozBwrftot2Snzl1fMe2ZQjCLjk8NZLpN8fPs4=;
        b=Itddqvfu5eGVMPWKXOTL3Np3ppyPdw9wKxG6qAbA8Lg2d5R1ETD6WS7nZ2nZNcmLw/
         2C2EuTFzd7fpnOLwFq+/eE90qiSQELFc3HdVh/I/N5CnfrXWcqG2K8HQpaEZlhB9oT8+
         vPHDrQQ5JI+/5yfzavE9ZToAD+YmVKW6qYxaJcV5WEGxXhrbD7nXBuobL0WNMem4q3tV
         5tT2UdusQrZjr5z8Iy5iAAXTgushFKPeC8VTwrct2L8CF0YsrHnKh8l3+Z4OSVixpk1/
         8dUfU4k2I6LhwYP5MjLA4M4UdIf8TUs3OUid/y0VYa7uUDhettZndm2OQErswpyf11eo
         euvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742068925; x=1742673725;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rnv8s8ozBwrftot2Snzl1fMe2ZQjCLjk8NZLpN8fPs4=;
        b=Bba264d+pYL+/7L0rk8E22X5avu/AV4yVR3SEiOwFB9tZtfT55I5pwtp5rP12S2yPM
         9btlNVIJ2MiviA1gTWC2oGKXTiM4A7SJUc9vuSpeNWccxLHkAyRlen4N/nlAaodWHqrv
         ftc6JuObNHAxuLHurA9vKgooMDr1T77Jdtpk5niUQ/rOb88wYo649eOHLKCsHhW7/CNG
         oyn5+NNMLAzYTVMRqmf3q+TWlHmHziFuKQvCvWssHnTFu23GO9nXQikfxrxGyCNXr2n2
         8xXoTq1hg/SqUpv+iVLX6CHA3BGsYzGTpYTrybV8BiYYDbFC15rW7mXaicd+ocVE2r6B
         4B+w==
X-Forwarded-Encrypted: i=1; AJvYcCV3Qhd+VwhZZIeZdQpP8ebOVNxreFtHniJRoflYtCg81su1RXpBjXqze1ebenu5ZU7OKMOfoQROaeWeDu02uA==@lists.infradead.org
X-Gm-Message-State: AOJu0YyFapUBNsH5ffujA4o15WWoZAxWbCAWx18WAVbN8NYNKDUIhjz7
	S35Jp1kOblfwEp3I8CiE+ZT/Vk0+iLSykLUdqJDFUwBDayRRRV8d
X-Gm-Gg: ASbGncsyzQv17JbKI0cVDZZn3Mimn+lb7GmB9W2TsjG/WMcxbwjQQLGOTT8inqsWJa9
	A+HPhgH3AZr44xn4QNT0nEmCiJ4BHdDOZWhGVPi7fiGFFv1ixDYv2/Zy8iqp8qrwwC5ovVzTRgH
	2ql/dE9ZaJhtuB+yYimPG1hX9d18GtwZ9+Tl3mSdIuZbXSjcf7G+HSZ3KcPt4HRWRId6RO9CnUg
	XOgveLYx0nuouY6v4WpRVZ2jYT4rGOOLWTSS01q4DSQTDFeoqZU2JOvUhlQ/6/NpwLIyErF7V1p
	t6Rdb1Ze1NqgqPA80ThkYYZvRf94hqQOVpEwDuOy/O2RflrZrR4sukmy8wDX4G1hYgGD6VEjrRV
	TFZlU/4frko5J0C3vwxOJbtUaLxctiyvir97KfjsC9gQzkl7ncyFzPqd7lv/aHFGgQDD+7YZYnQ
	==
X-Google-Smtp-Source: AGHT+IE7wQUwPzmc9fAU28R+QPw4AyOXOfaovqueWq9l20dn3Msl4kW9Ypx3UjNa/A+DViUSNtfwjw==
X-Received: by 2002:a17:907:d38a:b0:ac2:9a4:700b with SMTP id a640c23a62f3a-ac31234318amr1268268766b.16.1742068924742;
        Sat, 15 Mar 2025 13:02:04 -0700 (PDT)
Received: from localhost.localdomain (2001-1c00-020d-1300-1b1c-4449-176a-89ea.cable.dynamic.v6.ziggo.nl. [2001:1c00:20d:1300:1b1c:4449:176a:89ea])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac314a489c9sm411456766b.152.2025.03.15.13.02.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Mar 2025 13:02:03 -0700 (PDT)
From: Eric Woudstra <ericwouds@gmail.com>
To: Jiri Pirko <jiri@resnulli.us>,
	Ivan Vecera <ivecera@redhat.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Roopa Prabhu <roopa@nvidia.com>,
	Nikolay Aleksandrov <razor@blackwall.org>,
	Pablo Neira Ayuso <pablo@netfilter.org>,
	Jozsef Kadlecsik <kadlec@netfilter.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: netdev@vger.kernel.org,
	bridge@lists.linux.dev,
	netfilter-devel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Eric Woudstra <ericwouds@gmail.com>
Subject: [PATCH v10 nf-next 2/3] netfilter: nft_flow_offload: No ingress_vlan forward info for dsa user port
Date: Sat, 15 Mar 2025 21:01:46 +0100
Message-ID: <20250315200147.18016-3-ericwouds@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250315200147.18016-1-ericwouds@gmail.com>
References: <20250315200147.18016-1-ericwouds@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250315_130206_277845_EDA18437 
X-CRM114-Status: GOOD (  10.31  )
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

The bitfield info->ingress_vlans and corresponding vlan encap are used for
a switchdev user port. However, they should not be set for a dsa user port.

Reviewed-by: Nikolay Aleksandrov <razor@blackwall.org>
Signed-off-by: Eric Woudstra <ericwouds@gmail.com>
---
 net/netfilter/nft_flow_offload.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/net/netfilter/nft_flow_offload.c b/net/netfilter/nft_flow_offload.c
index 05786d856530..a2c7b64261b3 100644
--- a/net/netfilter/nft_flow_offload.c
+++ b/net/netfilter/nft_flow_offload.c
@@ -116,6 +116,11 @@ static void nft_dev_path_info(const struct net_device_path_stack *stack,
 				break;
 			if (path->type == DEV_PATH_DSA) {
 				i = stack->num_paths;
+				if (!info->num_encaps ||
+				    !(info->ingress_vlans & BIT(info->num_encaps - 1)))
+					break;
+				info->num_encaps--;
+				info->ingress_vlans &= ~BIT(info->num_encaps - 1);
 				break;
 			}
 			if (path->type == DEV_PATH_MTK_WDMA) {
-- 
2.47.1


