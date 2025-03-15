Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A6A8C35FF1
	for <linux-mediatek@archiver.kernel.org>; Sat, 15 Mar 2025 20:02:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NpqiiXZms0JGOtrihsd57qCqRp7MjUMv4uKgIUJzlhQ=; b=3WGgu0EbTcRRyWcLk3SufHv3rB
	xcPkMnG2+SvxIyqoWHaYpkW1s4J8D3nlZSV9BBwryLpwUftgncRC0d1+tSLfr2wGz3yEVvGv0ZmXt
	YY4yNTIbSXpHJVe00U0qb0J0Fja+wToAOa+Z6G9+62j72VjW7y4sZ74Qyu19Xvhy6M/JH17OXwj+u
	cDBkwm72vMiFM36XDiUXaCQNYMMgiWzU3IxBwUy8LVHgiM7YeYcrojowj/OoEKOrwDY/M/pHPt/lY
	AH68zmBXvvII+LpsOVIDVAmydsOzAfbJOdu6OvoPk6SxHPdLU/VV8qAYmTs+MavZAHokfF9G4ZTq3
	VrqKVgPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ttXhu-0000000Gmeb-22DF;
	Sat, 15 Mar 2025 20:02:06 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ttXhs-0000000GmdL-1m0b
	for linux-mediatek@lists.infradead.org;
	Sat, 15 Mar 2025 20:02:05 +0000
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-5e5c9662131so4713310a12.3
        for <linux-mediatek@lists.infradead.org>; Sat, 15 Mar 2025 13:02:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742068923; x=1742673723; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NpqiiXZms0JGOtrihsd57qCqRp7MjUMv4uKgIUJzlhQ=;
        b=Y9AbchPORPenySiBRbvmIS+/PQyfHCeUy1MQlP6n8oRNVQWjHVzYcY2wUgjGyBM2m3
         gJGbiz+8coNqAs2XJMB2CeTlC7ICt3Oqg3QC6xa7kr4VHwJosYAxH4S0Gi7dVFzhvgPA
         D+kLC1ZdDK1pBAlFTD9U67+/wACqqaQBmY17ReulwdXPpHzP1tsUmxk+zhvJp5BeChVI
         loeJKHiDBVAa+WK860o+/b0zsfccM/QWK7kIvIpuHPg8+9oBNHw5pek4/kFQstwNxjC3
         evu6JWrSC0AfEjzPMHDZozx0g13qXDy8csIlClzk6TDlfv5pdmkF0+kSCmS/Cf39Qmt+
         X4Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742068923; x=1742673723;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NpqiiXZms0JGOtrihsd57qCqRp7MjUMv4uKgIUJzlhQ=;
        b=UlhN7k95VEdVIr2wHuwZx/B7Pims5xtAJG56fX/yF02RPsFLg/0OxbAlF6Z1S/3DHe
         mLbyfNsQR7EmUPa58+w7v8EtCFL2pR5zydHSEMUGbUjbo73Kjb/5O6AQThkRzFClBrzV
         h8K0DB1XDKzLybTcabufrz5c6a72zBd0NB3zsPWiAoRgmbwkc7NlHgGfYqrYey/dqUB3
         uy/mLwhm+lVvP8TnSlIGnGYOtwLtdI2vFZ6tXKSO2mogWgkfvm2KFp/naQ63aonVp3pA
         F2HgUkGB0RjjZK1B3onKyoXflJje0ncAXYEo4+tWKquz3j3Nl9P4T9ZcPq4YYqTof4DH
         uD0g==
X-Forwarded-Encrypted: i=1; AJvYcCVSlua/3N9cs7YZN84WpQqNBHCfZghSZGodmRAKSr4KqVS2vQTJn1rAKLraKeZHlDRIjqx+e2cc32XxVbqAhw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxLFW+ZKvDnj7lR1jtJSGroaZoL8rvfhveR831LlZ/N2NhEb/4V
	ptwGNOQ1Bza5hZ08gphkUUCHl+TjeY+3DVk4Wx17g0HD+7i25fK+
X-Gm-Gg: ASbGncuuRWqA98wYPdT06KRL75/iEBJcG9jFUxDENE8gN+CcLwALkfwLTwoCjFeHc/q
	pLHWxaH2wv4uQ5bfCVdUygXBOeN1RTwHY0oU9dSDhAYXEBtlInWky8O42QBExqOpnXy9RC49qfm
	/TzGGfWUMRJU+aWVgmAwZP+ThXmEtEgVgx8pNSxRPp5HPqCDZtUprRPdneloNA2yC6NyhLxSdAQ
	VwsrDBQ6kXGRx+ZT8OPhvfzqKOiXq0F+1UHBkLUpUE606ybakX2cp3BOfLWH6cNOYzlwzdR7nmP
	HU2qHncihIF57ffyyn7ipiLyraXYZ0ErPXK9Htr9pwrCexIpW5+z77KgIhPC0ME4v/EJnspHBw7
	CS7LwGMM1tg787tw4BdA/HrnyS3xXO7hFNvZBczbLdmTM8xE07zgKvDP3cmDuGL4=
X-Google-Smtp-Source: AGHT+IHCa55+wjBQiSxD140JEHodCQYGe9wVqqYoJF9zBcrAQwDR+1enIfiBTks5BKAmzlgfv6jNXQ==
X-Received: by 2002:a17:907:6ea9:b0:ac2:c26:5608 with SMTP id a640c23a62f3a-ac3301e0b40mr826573566b.8.1742068922394;
        Sat, 15 Mar 2025 13:02:02 -0700 (PDT)
Received: from localhost.localdomain (2001-1c00-020d-1300-1b1c-4449-176a-89ea.cable.dynamic.v6.ziggo.nl. [2001:1c00:20d:1300:1b1c:4449:176a:89ea])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac314a489c9sm411456766b.152.2025.03.15.13.02.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Mar 2025 13:02:01 -0700 (PDT)
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
Subject: [PATCH v10 nf-next 1/3] netfilter: nft_flow_offload: Add DEV_PATH_MTK_WDMA to nft_dev_path_info()
Date: Sat, 15 Mar 2025 21:01:45 +0100
Message-ID: <20250315200147.18016-2-ericwouds@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250315200147.18016-1-ericwouds@gmail.com>
References: <20250315200147.18016-1-ericwouds@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250315_130204_564178_DCD3AB70 
X-CRM114-Status: GOOD (  11.87  )
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
index acfdf523bd3b..05786d856530 100644
--- a/net/netfilter/nft_flow_offload.c
+++ b/net/netfilter/nft_flow_offload.c
@@ -105,6 +105,7 @@ static void nft_dev_path_info(const struct net_device_path_stack *stack,
 		switch (path->type) {
 		case DEV_PATH_ETHERNET:
 		case DEV_PATH_DSA:
+		case DEV_PATH_MTK_WDMA:
 		case DEV_PATH_VLAN:
 		case DEV_PATH_PPPOE:
 			info->indev = path->dev;
@@ -117,6 +118,10 @@ static void nft_dev_path_info(const struct net_device_path_stack *stack,
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


