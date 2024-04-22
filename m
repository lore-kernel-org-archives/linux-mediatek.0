Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72F9AC4345F
	for <linux-mediatek@archiver.kernel.org>; Mon, 22 Apr 2024 12:39:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AtbQVvvytm2FvKdHddRJ6/OPEdy67XedVgC8G6QI7mE=; b=j1inIFneRYQkDK0jzZDsydrixY
	9+Ajv08ZX5TG1eywVzbr7u/SIfkYPX5WrWnbCt2Jdx0eoVim0FblNVeRfAa7pFtONoZnHgGQeEw3+
	gkhgn+v03tEx3E/rn/KxsKSHUrUuVykEyL05LxRpt/yDMxemZ+qmNbFWh4M8gyLbpu8uwMPS9rxX3
	LJiscjxw+wXSkE9wy/dJo66rQTx4D4EcMgQUg9dIlfbSFjC06o48cjAGrGwz/Ye3tN9OdZ25slY8h
	gicl/7mK7M8QWVgac0ny6YQz7geC6qgkV8Cin4iii18dIxWEK5cSMrEMIiGC7Twx0Uqj6ZY2qJfnn
	7p8XXbRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rysxf-0000000DWlh-0Jml;
	Mon, 22 Apr 2024 12:39:55 +0000
Received: from mail-lj1-f181.google.com ([209.85.208.181])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rysxW-0000000DWeZ-16uR;
	Mon, 22 Apr 2024 12:39:48 +0000
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-2d8863d8a6eso61821101fa.3;
        Mon, 22 Apr 2024 05:39:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713789583; x=1714394383;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AtbQVvvytm2FvKdHddRJ6/OPEdy67XedVgC8G6QI7mE=;
        b=cXOOLILtTY1OCzwWLNK6R3fa3dFusM903CYjh2PrH6ATE96aBf9R4teG+Cwj+VEEv2
         YC/JXPGO/pVIlAnQLOLYxPVKRJv/IMEqTExo+uoeCvNfXBJxXTjlqOi0dFhNh2472RFX
         cPaqJPXO+mZJmCmZ+SOTpnoEEJyAAvmnSVSWYEQah4xuohS8CrgMz/PkEzl08MOXl7mw
         NMS0NndYedtnp76MkgrYY33Mv0LjdJDWFptIVZGlxnuCUw14/f5qW9v7Lem44t6UPioE
         JF47eKc6xkgyoAP9lH/eFnHKPxsTOZgLo4Qe/8lIgfq+01nw2x95rL6oXtNJo4VnkHPl
         IOJQ==
X-Forwarded-Encrypted: i=1; AJvYcCWgWe36yShzYqerE+ihYcJLE538n1QtPr5KKu0JKLg6uL3AvBYOVXuNYgvZVJkCZeHnzkbT/Tc92SDyae5ggodkWXWCITJJDASvk/DJ0kUFj3UFwpRCcR1HgoRmfbI1FbujCkeDBKW+SxBEBBHHq3jEqtDdDQw1Jb0RUpHdUHRItww6r8koXaOobpx6vXvNtlREnWHiwGit5QY4+xeMCoUdcSGmjBOM+qLeOBFIW5R/qg==
X-Gm-Message-State: AOJu0YxbJ5bXm1BScJ3pF59NeY+jGlKQ6gPUc3SDEyaBg1gb7igoBGV7
	l0Mqde/F6YvJpXhruBxef/bClm7Cm/HtTVig9BOdzjQjPjT4w80Z
X-Google-Smtp-Source: AGHT+IFjwu09Igjhit00FwgEXKxmKwFyLCPy0CniLE6C/q3K4O4DuOoAL8L+d3hMfAKTAbKTgdLqGw==
X-Received: by 2002:ac2:4ed0:0:b0:515:cbf1:9fda with SMTP id p16-20020ac24ed0000000b00515cbf19fdamr7518637lfr.61.1713789582986;
        Mon, 22 Apr 2024 05:39:42 -0700 (PDT)
Received: from localhost (fwdproxy-lla-006.fbsv.net. [2a03:2880:30ff:6::face:b00c])
        by smtp.gmail.com with ESMTPSA id bu13-20020a170906a14d00b00a5816a7381bsm214578ejb.141.2024.04.22.05.39.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Apr 2024 05:39:42 -0700 (PDT)
From: Breno Leitao <leitao@debian.org>
To: aleksander.lobakin@intel.com,
	kuba@kernel.org,
	davem@davemloft.net,
	pabeni@redhat.com,
	edumazet@google.com,
	elder@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	nbd@nbd.name,
	sean.wang@mediatek.com,
	Mark-MC.Lee@mediatek.com,
	lorenzo@kernel.org,
	taras.chornyi@plvision.eu,
	ath11k@lists.infradead.org,
	ath10k@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	geomatsi@gmail.com,
	kvalo@kernel.org
Cc: quic_jjohnson@quicinc.com,
	leon@kernel.org,
	dennis.dalessandro@cornelisnetworks.com,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	bpf@vger.kernel.org,
	idosch@idosch.org,
	leitao@debian.org,
	angelogioacchino.delregno@collabora.com,
	matthias.bgg@gmail.com,
	Ido Schimmel <idosch@nvidia.com>,
	Jiri Pirko <jiri@resnulli.us>,
	Simon Horman <horms@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Subject: [PATCH net-next v7 01/10] net: core: Fix documentation
Date: Mon, 22 Apr 2024 05:38:54 -0700
Message-ID: <20240422123921.854943-2-leitao@debian.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240422123921.854943-1-leitao@debian.org>
References: <20240422123921.854943-1-leitao@debian.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240422_053946_388022_EE5ED112 
X-CRM114-Status: GOOD (  12.87  )
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

Fix bad grammar in description of init_dummy_netdev() function.  This
topic showed up in the review of the "allocate dummy device dynamically"
patch set.

Suggested-by: Ido Schimmel <idosch@nvidia.com>
Signed-off-by: Breno Leitao <leitao@debian.org>
Reviewed-by: Ido Schimmel <idosch@nvidia.com>
---
 net/core/dev.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/net/core/dev.c b/net/core/dev.c
index 8bdc59074b29..44c2d698fd1b 100644
--- a/net/core/dev.c
+++ b/net/core/dev.c
@@ -10424,7 +10424,7 @@ EXPORT_SYMBOL(register_netdevice);
  *	init_dummy_netdev	- init a dummy network device for NAPI
  *	@dev: device to init
  *
- *	This takes a network device structure and initialize the minimum
+ *	This takes a network device structure and initializes the minimum
  *	amount of fields so it can be used to schedule NAPI polls without
  *	registering a full blown interface. This is to be used by drivers
  *	that need to tie several hardware interfaces to a single NAPI
@@ -10433,7 +10433,7 @@ EXPORT_SYMBOL(register_netdevice);
 void init_dummy_netdev(struct net_device *dev)
 {
 	/* Clear everything. Note we don't initialize spinlocks
-	 * are they aren't supposed to be taken by any of the
+	 * as they aren't supposed to be taken by any of the
 	 * NAPI code and this dummy netdev is supposed to be
 	 * only ever used for NAPI polls
 	 */
-- 
2.43.0


