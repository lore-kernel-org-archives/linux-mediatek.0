Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 972D3EB8FA5
	for <linux-mediatek@archiver.kernel.org>; Wed,  6 Sep 2023 09:22:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Fn+jXRrDrAEw7CfX+G9Zj1hLr/gSQRyi9u7mHipUA4E=; b=OfLv//3EdDEPCgVf5Ddnt3LcO+
	6e61A373404d578H3NZz7JPqdYwx0urv24jbUGyXBYx7dhHEPb4OULLwYbGhMbwZd2sKgzAsz1yn3
	2gQRyCmw3ySU4GI+hHd6FRMsPLTGJfzIgiX/zxEoC1xPULZozc8OcqxlhwZwrk6GWR45RDORqm6WF
	aPcFgQlLZIWMel6iMslIZK8IJPOBTW9k8TqIfbEkg+wl9O8C/tCsZlDDzox5pwVGZf6ZxpzFYJAFZ
	bSiybrG2+L6iJwj251FTe+nwV7r0tOeMVTNpGCfxf9g3n5WkHViGpnJqtyw87FbMvp5QBFdpmntCQ
	COh67NUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qdojx-007tlI-1o;
	Wed, 06 Sep 2023 09:22:25 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qdoju-007tjj-34;
	Wed, 06 Sep 2023 09:22:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=Fn+jXRrDrAEw7CfX+G9Zj1hLr/gSQRyi9u7mHipUA4E=; b=WB6AK/MwWCyQGYEDavMnE0Lgbx
	q9F9FJdmkWBqCBroRzq6Iso4oCb1KwoCTFtCZv4qOcC+ztJEQfrSBmnYPZgS7LK56SLS78HheHWjF
	OTxs2HViWJQ0kO1GePftt94+RofPsSTLdXkgWmpFKy3kNZfUdZtmr/vwyEowAsmMKP+yV4EIXssnq
	lf49TVsteVkQ7FSW24gPAmcmDB7NbU+Um3HqslD+cbcVd3EezvGU5CXYx7Q3gJHGfaPQrE2qtfFKF
	OM0c1ZiZxnWvSncnVAzSTuBKoFps9RCJseIbPriPwDAd9nOnn9N5088eoT+zmJwjtsBV3Ew9XGh8o
	jsPM0N5Q==;
Received: from mail-pj1-x1042.google.com ([2607:f8b0:4864:20::1042])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qdojm-0010l7-2Z;
	Wed, 06 Sep 2023 09:22:21 +0000
Received: by mail-pj1-x1042.google.com with SMTP id 98e67ed59e1d1-2736e602429so723430a91.0;
        Wed, 06 Sep 2023 02:22:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693992131; x=1694596931; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Fn+jXRrDrAEw7CfX+G9Zj1hLr/gSQRyi9u7mHipUA4E=;
        b=CQVhO2ffxhfQPoWlY6vvOA/pEz3sX1l2I4gIahWPJSnAuzhS6LbJ3owpBpoUbUx2d4
         DyMDsM9a8Um25PrpJyYE6Nq2C2Xs6KZeb6cWXx8RRIP9ggbYvpz9V1CWGszk/YOEmTt1
         +GTpm/OqTDJaLWbPWIoAMzy0jzoWLWYYJt8zXWFUF2VmfxuEtcQ9W3F++u3IX/8jCz4W
         dGLp5Mt/m2PE6f4CaF92vAk46BUaCONwQEQdxcZ7BkdxJE8dU3yGHQJvyHQnDwWTMB+E
         EfNRzRANJdMBxdcqAzEBemfIWwWlQqBUqv4Kc6CSrnmIBECjxCSMHUMsPrGNFFTX58+h
         Z+kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693992131; x=1694596931;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Fn+jXRrDrAEw7CfX+G9Zj1hLr/gSQRyi9u7mHipUA4E=;
        b=iubRjrX1OpWFOvNHTQkrqJj4F4rOC0daJ2zTK4pqySNbaxqED6JS37CHPRChk5lq6z
         uaXossIDik/YLH2UPGKVGVWyXHCDlPPM+RkBpfP/bo6BeWQ4NIBCYUfOo5XnwvIZTwU0
         UYpPkvY3ZXiwMK9C1Wf3av47Ywdc/LofknubQkEEf6wCvIXFLmHQi0r7jo2+iP8CoNNs
         rxnBQF7xL0XeCJ8jhhqBPYO+4Q4fgZO8lTqBsgQEvUD/RGkhEyKnTokH/EaM9HK0peAI
         Ga7pREejpFhFAtSiCFqqwTiyT3QnpN4s5crbN977GI4XF04TI9CV1tNjS2rN8Lk9/R1t
         gRZw==
X-Gm-Message-State: AOJu0YyB/q9tRZnTJ94s5I1BF5OM24luQNMyjalFE0+fHxBN493kxraG
	lYL+vB3+o5YZUElNZRJVt3I=
X-Google-Smtp-Source: AGHT+IFOd5uWXjG5sRVrnc1uN2B+x7New4jEPSE8eT/hxhjfSvF95rsX2Pmpq4DVWgFU4xsFEmIoJA==
X-Received: by 2002:a17:90a:4dc7:b0:263:2312:60c2 with SMTP id r7-20020a17090a4dc700b00263231260c2mr13836784pjl.3.1693992130736;
        Wed, 06 Sep 2023 02:22:10 -0700 (PDT)
Received: from hbh25y.mshome.net ([103.114.158.1])
        by smtp.gmail.com with ESMTPSA id ft15-20020a17090b0f8f00b002684b837d88sm10679242pjb.14.2023.09.06.02.22.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Sep 2023 02:22:10 -0700 (PDT)
From: Hangyu Hua <hbh25y@gmail.com>
To: justin.chen@broadcom.com,
	florian.fainelli@broadcom.com,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	mw@semihalf.com,
	linux@armlinux.org.uk,
	nbd@nbd.name,
	john@phrozen.org,
	sean.wang@mediatek.com,
	Mark-MC.Lee@mediatek.com,
	lorenzo@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	maxime.chevallier@bootlin.com,
	nelson.chang@mediatek.com
Cc: bcm-kernel-feedback-list@broadcom.com,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Hangyu Hua <hbh25y@gmail.com>
Subject: [PATCH 1/3] net: ethernet: bcmasp: fix possible OOB write in bcmasp_netfilt_get_all_active()
Date: Wed,  6 Sep 2023 17:21:05 +0800
Message-Id: <20230906092107.19063-2-hbh25y@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230906092107.19063-1-hbh25y@gmail.com>
References: <20230906092107.19063-1-hbh25y@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230906_102218_246128_3C1425CA 
X-CRM114-Status: GOOD (  10.55  )
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

rule_locs is allocated in ethtool_get_rxnfc and the size is determined by
rule_cnt from user space. So rule_cnt needs to be check before using
rule_locs to avoid OOB writing or NULL pointer dereference.

Fixes: c5d511c49587 ("net: bcmasp: Add support for wake on net filters")
Signed-off-by: Hangyu Hua <hbh25y@gmail.com>
---
 drivers/net/ethernet/broadcom/asp2/bcmasp.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/net/ethernet/broadcom/asp2/bcmasp.c b/drivers/net/ethernet/broadcom/asp2/bcmasp.c
index d63d321f3e7b..4df2ca871af8 100644
--- a/drivers/net/ethernet/broadcom/asp2/bcmasp.c
+++ b/drivers/net/ethernet/broadcom/asp2/bcmasp.c
@@ -535,6 +535,9 @@ void bcmasp_netfilt_get_all_active(struct bcmasp_intf *intf, u32 *rule_locs,
 	int j = 0, i;
 
 	for (i = 0; i < NUM_NET_FILTERS; i++) {
+		if (j == *rule_cnt)
+			break;
+
 		if (!priv->net_filters[i].claimed ||
 		    priv->net_filters[i].port != intf->port)
 			continue;
-- 
2.34.1


