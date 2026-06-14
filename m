Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C37BBCD98C7
	for <linux-mediatek@archiver.kernel.org>; Sun, 14 Jun 2026 04:01:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4LFlYonGJq08punhtqW4trLrplu83bZHlBhA/KZ1Aiw=; b=BLz7GLrUubcZnQqr6OoNcB8ar2
	xMyBfaJ1smfllHQemkqqMD7QqiWOBQAOxwI6lG0URsB+6gvpsXdMno16GG5thyTf7Xak/ySQAQEd7
	QfjvCkzv2ErD9peZXR6JdBeC4L4OqHCNtM/P3lB836H1LKXqygsHI9nMTUQDIr6YZ6NAe6YU+VKFv
	8qbpdIidbAxBPfOg1whB5irzc6L8G6Tdr5oRTXnDBempoW6XROT3ecvbH20G48qRkVN+Q4fifEnxX
	+of0Dzv5U9JBL2dwi0Z6WEAZtktPm3tYlX26Jt+Hxk7vhZ065TRzlqy2oNU9ry3ZJyj+tSX6OPUua
	6+DbDgXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYc20-0000000Ci21-0BkV;
	Sun, 14 Jun 2026 04:01:08 +0000
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYc1v-0000000Chzd-3kwt
	for linux-mediatek@lists.infradead.org;
	Sun, 14 Jun 2026 04:01:05 +0000
Received: by mail-pg1-x536.google.com with SMTP id 41be03b00d2f7-c855599a77aso1046301a12.0
        for <linux-mediatek@lists.infradead.org>; Sat, 13 Jun 2026 21:01:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781409663; x=1782014463; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4LFlYonGJq08punhtqW4trLrplu83bZHlBhA/KZ1Aiw=;
        b=NvEPspPh9XjgESOE965uXOu44N7Ftuwlg5JcDv3zTpnUSzapU487/CAOn857hrBYWQ
         ETHa3JzdJzVHriVU+A0dEFz0JXrxIIbHv5jqlElerdEVWAP9Mq1GtpG8VgXk98/FJpgn
         W3Ji/orbjQXtttMkh8IqTN+I+Ct2WHAjXtArf+W6D5PSSEZwTKqde8LYM5+nS8Dp+heV
         8ctEQqNL2BA0rONfcHLmO+CL0p0uZ9IzEaSsXe4aka+6xhAIUtjNRse4uGynD1PK9bF+
         AAb2XNUlJdSZtjO5dhpYVSQ8Qs8lN4KSVFj9zsPwLribR5uoywKLov+vkWQEcDtCtZ2S
         YOjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781409663; x=1782014463;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4LFlYonGJq08punhtqW4trLrplu83bZHlBhA/KZ1Aiw=;
        b=bO9sG5CCyagnlejsLrueuGs304XRi750dtV2Ih4kmjP0xS+L8a3ycqlU1LL8TngJk2
         sAaQFHBinMkGj3Qjb9hd4lyBPhStfVphvnr0J4IN1Dtx7/RKA1M+hvHUB5AWYimUk90X
         VujNvAZXOIy+mwfA0y4kLEjErb4NwWpXSvAdcNsIRpuHsEa5YyVO32Nwr4w4Qn9ohixc
         nlpzWClyls4B8E7ux2acaPSzdvMgItG6bRjUf4uK+3qxR6qzi02fQF6YIK8RrSHAFW4v
         UkE8j2N/YQmZ0QdLUfjYXY4udRIvVvn0eRC8LxRTnCB4J2xT0J+g5S6K90uakn10FNGa
         JAWw==
X-Forwarded-Encrypted: i=1; AFNElJ/2U7XNxxF9hrloz1dsCsMLxkIQdKakepB280JJXBzuTIVSjRR/bQ0bM25m7WBQPGBeckOLOjUU/wrq23lhHg==@lists.infradead.org
X-Gm-Message-State: AOJu0YyI1eCN14LNgodeBGcdTwrjFHBE/a1vWxM7+71SiPJV02/h+qjW
	+KCFqq21aotnTBTJmRbFcrjHBs7s9f0rOOd/ubVxuNwdRpU8XYGmsOZD
X-Gm-Gg: Acq92OH59Ips3cbXvDPvhdclZqyI0gbswSdmKt8n3PD+bYo+nSHbzvgP8VaNSV+vKJs
	IODLVajr+HWgEj3lgMD8NXzHjKLkcgcOEoktqvLTFvzpmb6Y2EqlHQ+hus8NB3x+7msfOUy43Qa
	r+3e7NcbmYpW5VxT1fZGp1DDy5sjyYYTvHyLoEwoGlCjf8z+D4DDWylhIC9mT2p9NhuHFPahU9N
	mjj2U3mQ/wwXn7q2HhxZPPHg6Cfen2ZQD3AHO33JBEvAW550EOG8tNhF38BX/MxH5ldsBd8MeM5
	2RbcVz4FumaFOVfJh4uee/WqcYM/p9731loO1a0eMsUKBVhOUqVFNsXW368ZYBQv3tCd4sh/Dsa
	oVu6GSQDH1ZJemmDuKisap8uCesPewcGZFnd4sYYdZjlxgNCPl90NOT9bOgakk8d1WF0fKuVxIc
	qpp2QWnkYSYcE0RWnFszpqXhc+hvrk1A==
X-Received: by 2002:a05:6300:228a:b0:3b4:895f:6ac8 with SMTP id adf61e73a8af0-3b783b220ebmr9694421637.3.1781409663062;
        Sat, 13 Jun 2026 21:01:03 -0700 (PDT)
Received: from mincom1 ([115.4.79.42])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c8661a67603sm5676983a12.0.2026.06.13.21.00.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Jun 2026 21:01:02 -0700 (PDT)
From: Jihong Min <hurryman2212@gmail.com>
To: netdev@vger.kernel.org,
	Lorenzo Bianconi <lorenzo@kernel.org>
Cc: "David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Simon Horman <horms@kernel.org>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Steffen Klassert <steffen.klassert@secunet.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Christian Marangi <ansuelsmth@gmail.com>,
	Felix Fietkau <nbd@nbd.name>,
	linux-kernel@vger.kernel.org,
	Jihong Min <hurryman2212@gmail.com>
Subject: [RFC PATCH net-next 1/7] xfrm: allow packet offload drivers to own transmit
Date: Sun, 14 Jun 2026 13:00:26 +0900
Message-ID: <20260614040032.1567994-2-hurryman2212@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260614040032.1567994-1-hurryman2212@gmail.com>
References: <20260614040032.1567994-1-hurryman2212@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260613_210103_939221_C9735D39 
X-CRM114-Status: GOOD (  11.82  )
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

Packet offload drivers can currently program state and validate whether an skb can be offloaded, but they cannot take ownership of a packet that needs driver-specific TX preparation before the regular XFRM output path continues.

Add an optional xdo_dev_packet_xmit() callback. Drivers that implement it consume the skb and return the final TX status; all other drivers keep the existing XFRM output path.

Signed-off-by: Jihong Min <hurryman2212@gmail.com>
---
 include/linux/netdevice.h |  8 ++++++++
 net/xfrm/xfrm_output.c    | 11 +++++++++++
 2 files changed, 19 insertions(+)

diff --git a/include/linux/netdevice.h b/include/linux/netdevice.h
index 7f4f0837c09f..1552eb81ddf0 100644
--- a/include/linux/netdevice.h
+++ b/include/linux/netdevice.h
@@ -1048,6 +1048,14 @@ struct xfrmdev_ops {
 	int	(*xdo_dev_policy_add) (struct xfrm_policy *x, struct netlink_ext_ack *extack);
 	void	(*xdo_dev_policy_delete) (struct xfrm_policy *x);
 	void	(*xdo_dev_policy_free) (struct xfrm_policy *x);
+	/* Optional packet-offload TX path for devices that need
+	 * driver-specific transmit preparation instead of continuing through
+	 * the regular XFRM output path, such as adding offload metadata or
+	 * steering the packet to a private transmit queue. The driver consumes
+	 * skb and returns the final transmit status.
+	 */
+	int	(*xdo_dev_packet_xmit)(struct sk_buff *skb,
+				       struct xfrm_state *x);
 };
 #endif
 
diff --git a/net/xfrm/xfrm_output.c b/net/xfrm/xfrm_output.c
index cc35c2fcbbe0..9f11559b0221 100644
--- a/net/xfrm/xfrm_output.c
+++ b/net/xfrm/xfrm_output.c
@@ -770,6 +770,17 @@ int xfrm_output(struct sock *sk, struct sk_buff *skb)
 	}
 
 	if (x->xso.type == XFRM_DEV_OFFLOAD_PACKET) {
+#ifdef CONFIG_XFRM_OFFLOAD
+		const struct xfrmdev_ops *ops;
+#endif
+
+#ifdef CONFIG_XFRM_OFFLOAD
+		ops = x->xso.dev->xfrmdev_ops;
+		/* Callback validates, consumes skb and returns final TX status. */
+		if (ops && ops->xdo_dev_packet_xmit)
+			return ops->xdo_dev_packet_xmit(skb, x);
+#endif
+
 		if (!xfrm_dev_offload_ok(skb, x)) {
 			XFRM_INC_STATS(net, LINUX_MIB_XFRMOUTERROR);
 			kfree_skb(skb);
-- 
2.53.0


