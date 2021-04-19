Return-Path: <SRS0=CMHm=JQ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3648C433ED
	for <linux-mediatek@archiver.kernel.org>; Mon, 19 Apr 2021 04:04:52 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6EA55610A1
	for <linux-mediatek@archiver.kernel.org>; Mon, 19 Apr 2021 04:04:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6EA55610A1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=pXrpura6AIClUOgNTE8V/yA8Nr9HSzcucqX/q78NIdc=; b=FEPNEkVIbwOJKCsr68FgRmnZTF
	ZT1z1G7bLA6zqP7tE6SUBfwNMaiiG+fIPZZSF2NKx4taTx+9B4P8VgHc79kIjHDR16piaEnAwc6S1
	dTfLTIQsJDLFMr7d9XSff3BCbrusMDQyb5lCNqDqgtdzJPWSQuar5NV7xExk3Nz7qqX0PdBefd7Vt
	w2mXgWfC2Mpdqz9S+a60rcNwe1qi7kYjgaiVnOn0BwPzsdimcj3zkLCFetYv5BPVHVwoNY8Q+/bCm
	bwZJMGNWkrDpnzZJxXeMoeK91kGovMIAGn8PpQKm6bl8wPUIKfK6uJi0R2Gc3feP1x2B7JqEyk9MG
	obeQeLdA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lYL9I-00922y-Bo; Mon, 19 Apr 2021 04:04:36 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYL8u-00920q-Kr; Mon, 19 Apr 2021 04:04:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=hOsZ6ZAWuon3dm2MZrd8FkaSau84thpl7XFQwU5olAc=; b=aJT4rRtSlY3fTm4+jrxkA5cr4H
 3GErI4m9o5IKAsTu/1fM9KbJkSeSRS1u5Q1U0ZZ4GO7Uc11UXdwRuZr28uvdcgBviO5ZBlhrDHgbR
 P8tf6fqoGhpiI8wjx8bZbMvSGaRoW+T03WqAbENfk10MIhhuSW42e2qrxX8CSzxCGmyPUxnZ7iifx
 Spp9ceIxPwwIlB9ZH8yzbU7mcLKwJj1c8aPHIpD2h5C15ZhJQInF4PdF2iGWiU33auBfGrVU4SF1F
 mvUGfLz4AeUkxR69t+azusV0vXu3sah32l2M3ll0/+fh/bhoUSyAz5WOYpza7M5sD+hz944pH8vUY
 pKSkofcA==;
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYL8r-00Awxt-7Q; Mon, 19 Apr 2021 04:04:10 +0000
Received: by mail-pj1-x1030.google.com with SMTP id
 j6-20020a17090adc86b02900cbfe6f2c96so17728943pjv.1; 
 Sun, 18 Apr 2021 21:04:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=hOsZ6ZAWuon3dm2MZrd8FkaSau84thpl7XFQwU5olAc=;
 b=FRj2Oc2qKXjJ0+HRBeXKiZNcvm09E0wR+zi4pf4hYThpFVjDmoirdE9srkAX23K690
 h5SgoI2Q9EtS72FDV4ipvZvWtfv/GUgNBfVJXenX/jt4ILBLY3h5UpBG2zmX3G0XhGhY
 2B80K8gWjkqK11sry1/PAjH9ZckonsgQBCNdSlOg+NyIQr85926xkyRHJZICg8RQyJFE
 j+MtbJkaxdq71+82qyKN7DSmv5wta7bkLxA8qQ57BzI8dBS7lefmasAnQwZLSRqFN7T+
 udc9CAZJ2i+038e463+wn85ZvR1F4jbZN8eNPOn5R9QjC1kd7m58N8N85MgNgoRoCaIL
 u7DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=hOsZ6ZAWuon3dm2MZrd8FkaSau84thpl7XFQwU5olAc=;
 b=lZ+hxkbK/8ls2FN2YwnbnqG2S1Ou3SvllxCNGOi1El6sjiuKWgolXFlI3WVpA+3iK1
 r2nWuGxo97Fgz9ogZ7zaxS4PQ781iuB1bnXx+4NLimqBYgFAa56zIhWQ/zqHpiyXubZ9
 aMXivoOXwL0GAZBEjppQ1oiRsqS9Ak8+/1h30epSwa/6lXuZRNGb6l7e9GPrHH2sLWdm
 MMXNack+8Mi5z9+vHpasPLdiBHTSIoxYiLdEPZT4s1ZWNMSiiJTLk/sKHjcfvZ/QG2iz
 EwSZjikoTkhJepq2GYPfJhQEEhrkbdPq+pO3myHr9C0WZx3g5SLl8+x4Djm5/yxstAc4
 Z3XQ==
X-Gm-Message-State: AOAM533TV5wwCKpeyFFgTysoTIw2CVxMuKnLhvw5VT5xEsGeEChdLYxG
 emfx5KGPJpwZa6+Ge5/Y5dY=
X-Google-Smtp-Source: ABdhPJxcKeTMm7Gcj5hsB5BDdKOpKVQoZ5Z1KI2psRngBPctBvPcf7fWZupUj0ZXMHy0StJVBT+jyg==
X-Received: by 2002:a17:90b:3646:: with SMTP id
 nh6mr22581469pjb.119.1618805045663; 
 Sun, 18 Apr 2021 21:04:05 -0700 (PDT)
Received: from z640-arch.lan ([2602:61:7344:f100::678])
 by smtp.gmail.com with ESMTPSA id 25sm12169423pgx.72.2021.04.18.21.04.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 18 Apr 2021 21:04:05 -0700 (PDT)
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
Subject: [PATCH net-next 0/2] net: ethernet: mediatek: support custom GMAC
 label
Date: Sun, 18 Apr 2021 21:03:50 -0700
Message-Id: <20210419040352.2452-1-ilya.lipnitskiy@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210418_210409_283973_BFE6D647 
X-CRM114-Status: UNSURE (   8.10  )
X-CRM114-Notice: Please train this message.
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

Add support for specifying GMAC label via DTS. Useful when it is desired
to use a master DSA interface name that is different from the "eth%d"
pattern.

Ilya Lipnitskiy (2):
  dt-bindings: net: mediatek: add optional GMAC labels
  net: ethernet: mediatek: support custom GMAC label

 Documentation/devicetree/bindings/net/mediatek-net.txt | 6 ++++++
 drivers/net/ethernet/mediatek/mtk_eth_soc.c            | 4 ++++
 2 files changed, 10 insertions(+)

-- 
2.31.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
