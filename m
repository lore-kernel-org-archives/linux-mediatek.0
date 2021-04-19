Return-Path: <SRS0=CMHm=JQ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47286C433B4
	for <linux-mediatek@archiver.kernel.org>; Mon, 19 Apr 2021 04:04:53 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B710561106
	for <linux-mediatek@archiver.kernel.org>; Mon, 19 Apr 2021 04:04:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B710561106
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=A872W2Na01vr8V95OUYbNDnWMW2jt+wXXNyIs3QI/1M=; b=qWUwakl3Hzl3MHsrKBZQvrzrz
	hvJi2snBe6VcGMhfDfYILvHzhk4H3ykbSbr6Fhzl21PzUXjEP6ewslIQjEB9l1tWW86NCQs4IZ7qh
	+kPsGF1eom1qOT621iIyFV3DQXdvyiiF3D+wW0jnAr6k+/i13zzj40wnXVzBriaPiQ3pj6JgUdZH6
	JO0E+m1Am2EK4GdtsSy4vQa0Yp9R+/jUPYwdZ2kS8DrUpxQN7027ptJnfzRZzA3SNqhPJ8U2F5wCW
	W83p2dcTjdjpAHFOqY9q97fXGdJpGRMTc8VElyez4iyko5LkQKOGskn7VLy5uxkYgMrSnagTj99IM
	SVeK2fT9Q==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lYL9H-00922h-ET; Mon, 19 Apr 2021 04:04:35 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYL8u-00920p-Kr; Mon, 19 Apr 2021 04:04:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=d6IeN222L2AvMC3BWodguJL4uvfgEGERLTNiOfhrG14=; b=ANOIjEGVw2z3BGEkb6Z6HVRAiH
 Tp3OR11j5b99QUPCk4xLTQaoTIUF0FaTRJUuMBlZn4ZFiThjcf8ACKRTNw0AKTSL9mXIE5EBbefBT
 LX+zcgQFyIFSSQpH8ZnYVBFupWitsqOVLgzrFaxEzfCrH02y/h5DWWMI+0YssH8l9FIOUjjvyd1Og
 KCHYMJBXlwMKx/qQUmqblWbYm65ZAxmjQ+4uxL7ZwHthbXRH38xpWL67TbyAOmNbwx/oJdkpn09KO
 qYTqzcRewyZDvH66XTotaCblIgQuEsXtojxmlb3Zrn0YC2cEwgmplwUiZwtUy1GDRAuVdVxGjJ4s6
 G2BFbsUA==;
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYL8r-00Awy7-2a; Mon, 19 Apr 2021 04:04:10 +0000
Received: by mail-pg1-x52d.google.com with SMTP id y32so23317563pga.11;
 Sun, 18 Apr 2021 21:04:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=d6IeN222L2AvMC3BWodguJL4uvfgEGERLTNiOfhrG14=;
 b=hp1kcgZxFWT8L4BFkOKZifS1WtozMEz2JHpzcAYKcXyohrFfbFPqyKBqsn6UVaaE92
 ujAG3bWmhL7fMQVAsynqU56t4V8rqWcZM2VbZgtgwennO/CJhtf1sTkk6FGc3altf0Ke
 1UwCM7LXFIO9ZJSvQcL2W0XjXxaG3YIjDYXnPO1G4BE4HKn4BKET0yY9EiWLcBlntNmS
 1S6AyBdFKVYPoAwXDqWVaD5gSI8grL8VtmgZ3YMIEgEFDklO0tDT8J4YWoy+/VZ/ExRZ
 XtHqAm4SXDdMYLHfBTTo4Axxo02/L/eko/10X4PPiPJsffZ4902yw7hixvGgfRFgB1H5
 i9XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=d6IeN222L2AvMC3BWodguJL4uvfgEGERLTNiOfhrG14=;
 b=CvMhuqm3Rowo5rc///MrrnPd3nz6eVqkHHFk2Yavxm6qTdfVLvdedvchKtjr8oijj4
 E0XJxBXgKyIYdRlrYX5LOXDif1ACBfR6q5siTDEQGKbDIP7wZuFmugHrUQoOL21jbdZc
 AbjoAMQ8Oj+j7NMka3xbZmq2/zX/T5os73Q0uzd4B0QBg6b6IStG/fkC2sY7azJiHTpT
 MkmKw9BPdApIhklIcoxMQO5xaAgQ7mKR2RtH3qwSwkyrHUe7qVeeHNtQRGgl9G4dvLZd
 /pkMLpyeR9YcD0RWPFyKrbwmDXXvmMIasmeYZtfRsIgYgTuy4oAdeCi+aqcWmBz3KVMM
 sKug==
X-Gm-Message-State: AOAM5328VJ73GqFmY8+MK5nJjai/PAAe5y7P8xuCyGXaQLB2RavWKbVN
 f0LtG6NsJTLCdLDInnTBUcc=
X-Google-Smtp-Source: ABdhPJySGEplzNOMXbX8mZJ9ih1HgpaLsQcB9orNv5Od5eujgBSB/bPGQSA2iseT8Vp27TAWSqWWcQ==
X-Received: by 2002:a65:42c3:: with SMTP id l3mr8072387pgp.258.1618805047563; 
 Sun, 18 Apr 2021 21:04:07 -0700 (PDT)
Received: from z640-arch.lan ([2602:61:7344:f100::678])
 by smtp.gmail.com with ESMTPSA id 25sm12169423pgx.72.2021.04.18.21.04.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 18 Apr 2021 21:04:07 -0700 (PDT)
From: Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>
To: "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Felix Fietkau <nbd@nbd.name>,
 John Crispin <john@phrozen.org>, Sean Wang <sean.wang@mediatek.com>,
 Mark Lee <Mark-MC.Lee@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Russell King <linux@armlinux.org.uk>, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Cc: Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>
Subject: [PATCH net-next 1/2] dt-bindings: net: mediatek: add optional GMAC
 labels
Date: Sun, 18 Apr 2021 21:03:51 -0700
Message-Id: <20210419040352.2452-2-ilya.lipnitskiy@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210419040352.2452-1-ilya.lipnitskiy@gmail.com>
References: <20210419040352.2452-1-ilya.lipnitskiy@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210418_210409_142988_9BAC1BF1 
X-CRM114-Status: GOOD (  11.83  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Document the mediatek ethernet driver change that adds support for
custom labels and provide an example.

Signed-off-by: Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>
---
 Documentation/devicetree/bindings/net/mediatek-net.txt | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/mediatek-net.txt b/Documentation/devicetree/bindings/net/mediatek-net.txt
index 72d03e07cf7c..500bf9351010 100644
--- a/Documentation/devicetree/bindings/net/mediatek-net.txt
+++ b/Documentation/devicetree/bindings/net/mediatek-net.txt
@@ -51,6 +51,10 @@ Required properties:
 	is equal to 0 and the MAC uses fixed-link to connect
 	with internal switch such as MT7530.
 
+Optional properties:
+- label: overrides the default netdevice name. Useful when a custom name for the
+	DSA master interface is desired.
+
 Example:
 
 eth: ethernet@1b100000 {
@@ -74,12 +78,14 @@ eth: ethernet@1b100000 {
 
 	gmac1: mac@0 {
 		compatible = "mediatek,eth-mac";
+		label = "gmac1";
 		reg = <0>;
 		phy-handle = <&phy0>;
 	};
 
 	gmac2: mac@1 {
 		compatible = "mediatek,eth-mac";
+		label = "gmac2";
 		reg = <1>;
 		phy-handle = <&phy1>;
 	};
-- 
2.31.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
