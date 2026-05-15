Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D08A9CD4851
	for <linux-mediatek@archiver.kernel.org>; Fri, 15 May 2026 09:02:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+04SKeVBhvRIfsHaTWxnqsLENnjwWESaqrABBm+vFKc=; b=px8RxGqv/DUEjX+4yLdKeydLH2
	vqKuXoTuguu+7bImz+r8XMGVU0quxhk2Hov8OMPn5MJHKVS1liB1auyP0LqIXjgeLuR1VWXWDMkHH
	D1KZOudxGg0eKOxX0v9EzrKp0t9A2wrrkelNsbEqH2YKCOTcL7nrtduuiueB0WKMsB8hwDRR9aGbl
	j6ws29WVKgfEnW69fwJ2XTV0EORKxn5nluG4xku8MfayvQU8eWBERBXnadlxXoflFN+fH/gw3ZxAZ
	i9J+i7xOS/k/1GSqTMEDxVSnIDl9z+WARyZ0D40NE2VI+Fh58QdmXOBxMHBqv4uVdL6yDSEnyTdIr
	Lj5eVa3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNoQz-00000007odl-1U9s;
	Fri, 15 May 2026 09:02:17 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNoQx-00000007oav-2eaF
	for linux-mediatek@lists.infradead.org;
	Fri, 15 May 2026 09:02:16 +0000
Received: by mail-pj1-x1030.google.com with SMTP id 98e67ed59e1d1-3664df32e91so7795603a91.3
        for <linux-mediatek@lists.infradead.org>; Fri, 15 May 2026 02:02:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1778835735; x=1779440535; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+04SKeVBhvRIfsHaTWxnqsLENnjwWESaqrABBm+vFKc=;
        b=g4BG3kTTcS2iu1LrlxooiJQSoTnum35vkLKZijoQK7iD45NvJ783PtVfHT8O3EFjbD
         I/Fk1i+OE1UPbiGzu0aYcPN1e9m3nYiXkOqnH8M9cPl88uqcvmjdy3777i8PxSbzFE1m
         stq2Q1vU1Wfghmw3l8cyi5YR/emPkywC5ox5I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778835735; x=1779440535;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+04SKeVBhvRIfsHaTWxnqsLENnjwWESaqrABBm+vFKc=;
        b=ELIIjmMMdKcdvrMgqunD0AEsC52RDURseAzhf36x6gofDxTf748il1RGpWtfUehT2j
         2YKolffYBNM3WYUDcpLKHN2nSkFcmIfkhF6OHA5NXoJ0Fl7D1SWz237l2LwlPu446N5x
         tRXhW+51Ye6L/RUgpYW8uG3bmv6BU4USrL4v7MFRnCNi/LAMpoIuPFUrlss3JSyF5GpV
         ot6oaSCsWakgWCWou48uQwf3GvAcPvqjzycOdsxZkbW2S7ojTRPAcxXKbNAKJK83jzNN
         dZbhwXsSZXJt76WBN+E0lxC6FTSvUf6d3vv+Ta9XbFptCTpSVGpqGkud1mztq59zkHum
         HpkQ==
X-Forwarded-Encrypted: i=1; AFNElJ+G1o/08TVwR5VfTYq4M9hQcf9p3Zo850iosq/9Ql7HzQsjn206JNQ2snE2032l8WTvK3LUkwJbRIglnpRSIw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxIW4RWT0G3yUn++INRSr7T3GIZYewDbl8Un/wGBZVDBGWcajp7
	y78q4o4Sz8s/KRiWBFZE4GZJRQVOGYHm+uFWSGqYFTE7H0efTHT69x3NXVaBYRS+5g==
X-Gm-Gg: Acq92OFcaKeAd63t7QBbpt27tJSxJIHBG3FPmLjObl6MypTWGju80P7B65RK7KLfYi2
	J4nKM40sO7z2PYQTTuy27TVK/J+LRn/o3fFfbSPdC+KgD8d3mrfdO1HmIldfQOJHFlDDIo724ZU
	8N/Ib9WQASjBy4uGZpZh1jBSXhHF66ayQcwWLOjudNQ8HjDlftEccxJeRYHHNqMOqV9Q90zwDub
	Ajj9WIybBnd+f71LF4hNa8a/IFaauFa6upE3396//zLlULuzEzsmqhvDqU3haXmVLN+KH7HQSjY
	PDdFkZpbDfZldSNE7PTimAs6BjrIEfElSZcQZpr2TWoEKgWxb7ZouNaNt78y0GMjb8MLhFQhzyT
	aAqPkBCC6Q4+1NzjCMupceEyXNIge03WOoMBA0fItkBg2d//UPopTgE5lgAdy44EjNJ+4hv5oE4
	aD7dfJDAT9N8TXr2nQCddgNsnEFT2y6m2YYJNq7veFXphLoz+hJgvf7/zcTrU+o6nHXD4He+b7Y
	hU1r6lK
X-Received: by 2002:a17:90b:50d0:b0:367:bb47:9fc2 with SMTP id 98e67ed59e1d1-369518bae79mr3243819a91.2.1778835734722;
        Fri, 15 May 2026 02:02:14 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:b3d8:e32e:c2fc:c31e])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36951584654sm2076537a91.7.2026.05.15.02.02.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 02:02:14 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Bartosz Golaszewski <brgl@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-pm@vger.kernel.org,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Manivannan Sadhasivam <mani@kernel.org>
Subject: [PATCH RFC 02/12] power: sequencing: pcie-m2: implement port index matching
Date: Fri, 15 May 2026 17:01:38 +0800
Message-ID: <20260515090149.3169406-3-wenst@chromium.org>
X-Mailer: git-send-email 2.54.0.563.g4f69b47b94-goog
In-Reply-To: <20260515090149.3169406-1-wenst@chromium.org>
References: <20260515090149.3169406-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260515_020215_674963_3DFF58E9 
X-CRM114-Status: GOOD (  15.32  )
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

For USB connections, the upstream USB (hub) device could be connected to
multiple M.2 E-key slots (or other power sequencer providers) via
different downstream USB ports. The provider needs a way to tell the
different connections apart so that the correct provider is matched.

In the previous change an index parameter was added for the consumer API
and the provider matching function. Implement port matching using the
index parameter. We simply check if the remote endpoint's port number
matches the index.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 drivers/power/sequencing/pwrseq-pcie-m2.c | 22 +++++++++++++++++++---
 1 file changed, 19 insertions(+), 3 deletions(-)

diff --git a/drivers/power/sequencing/pwrseq-pcie-m2.c b/drivers/power/sequencing/pwrseq-pcie-m2.c
index 16a332f9da7d..c9aed2c02e81 100644
--- a/drivers/power/sequencing/pwrseq-pcie-m2.c
+++ b/drivers/power/sequencing/pwrseq-pcie-m2.c
@@ -165,12 +165,28 @@ static int pwrseq_pcie_m2_match(struct pwrseq_device *pwrseq,
 
 	/*
 	 * Traverse the 'remote-endpoint' nodes and check if the remote node's
-	 * parent matches the OF node of 'dev'.
+	 * parent matches the OF node of 'dev' and the port number matches
+	 * 'index'.
 	 */
 	for_each_endpoint_of_node(ctx->of_node, endpoint) {
+		struct device_node *remote_ep __free(device_node) =
+				of_graph_get_remote_endpoint(endpoint);
 		struct device_node *remote __free(device_node) =
-				of_graph_get_remote_port_parent(endpoint);
-		if (remote && (remote == dev_of_node(dev)))
+				of_graph_get_port_parent(remote_ep);
+		struct of_endpoint ep;
+
+		if (!remote)
+			continue;
+		if (remote != dev_of_node(dev))
+			continue;
+		/* For existing users of pwrseq_get(): index = -1 */
+		if (index < 0)
+			return PWRSEQ_MATCH_OK;
+
+		/* Check if the remote endpoint's port matches 'index'. */
+		if (of_graph_parse_endpoint(remote_ep, &ep) < 0)
+			continue;
+		if (ep.port == index)
 			return PWRSEQ_MATCH_OK;
 	}
 
-- 
2.54.0.563.g4f69b47b94-goog


