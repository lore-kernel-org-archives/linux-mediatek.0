Return-Path: <SRS0=vV1m=M2=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68AB6C4338F
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Aug 2021 16:05:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2591261078
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Aug 2021 16:05:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2591261078
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=S4WQmp8gRkwcZ7yMUMD3iYcJyr0OjvV/kwUpVgpHy60=; b=XW4rN321So9o4U
	dhhKioRO7G7e19yLfLI5smhC/gCj/L4x68qvP5a5SiwkrEA4/wa6pboVIpxlvoLfwL+pssB/XVNSE
	Q1PsmEO5EJl3eImd8O97ucR7y2ZEobTgms+96YSoItGQznOs7rGzwYQVFoPAGTSHn7gjTYliORRlD
	qlKa1JeiOeA2Y3ID/Pl4kAQqf/WPLU3zrjgUGdpoclo/6uiTZgtQuSG6Aj9SnSBXaq15MwMsBLqKi
	zLSM+nhfJjD3dL8wd9xNWXt14sF++XhU/oqxOWYyrW8BbG+FiegJRXSV6/VCkH+CEMxgTclLNdkqH
	Ei1V/tQTft002aomvegg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mAwum-003WiQ-2Q; Tue, 03 Aug 2021 16:05:12 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mAwuE-003WSz-79; Tue, 03 Aug 2021 16:04:39 +0000
Received: by mail-pj1-x102c.google.com with SMTP id ca5so30181274pjb.5;
 Tue, 03 Aug 2021 09:04:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rFG+y2/f0kIS+1piSi01lqKfhQxPbZdynLRltnbgxiQ=;
 b=b4ukp4ubuRoZUf5QUsgGIX5Z8hvILnPKu2bruY8jXI93TywzIyFGzaosjq4ZjaNoAC
 OKdQZZJ06HFDVSEohb37uw6lIL88NyO5QjsVGO0KoSM/rbmyRPcvJzuP6Qh3bGN9zyul
 alerxWFjJxOIGbCUqIZGOXxcxx7QHqCQBazx/skeJLZLvZixB9/WZfmx7Wxi4RZpE/WS
 E3kmThx1F+PtgAXmLlYi4AsW3TzJoFxMLq4dkOsy+A6ym1ZMYGm+dns1Wgd73GlDasVH
 7P5x9yiaipdWdfFRLVnsY9pdTOua3l35OpEPyzZdHquo5u6TBeWZa9zW9T1AgPjqBbgu
 VtUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rFG+y2/f0kIS+1piSi01lqKfhQxPbZdynLRltnbgxiQ=;
 b=KMRLGAAE4feaQZjAkJw0ZFE/QCfV4p8xe7cL0xxYIAaNebUefY1kuS3rxh6L+v+roK
 4W4NQJEJuY6RqV0tRwqBH/uBcyFIheb7rIJHB8Y4etY68oUb4UJSMNPqz++EsGljOVwy
 /9J68BUNSkONRXS0+R8C5teEiuU/lNaIfAdKU/uQy89lFJ+KmmkWwplGYPQdW5f2tBsE
 Fo5+zne4GXAFKAk4+Mqgj21dbO6+xIkQAmQZaxvtzQNT0AmV0aCoguMb6WLwa+EWxJxD
 gxXuGqesJrnuiQNTezr3nV/9+MqD/ghXT+EEhBjmyYlG9PAAOhyRHAUEzPNgvMdfK5+U
 juQw==
X-Gm-Message-State: AOAM533wG93u/KET3It7vjvT3rCad1USeTuJUdC6ea0LWRkAu71TKUuF
 I3s9oubqxSywGRzoyZRC1Gs=
X-Google-Smtp-Source: ABdhPJx4BoskHpHIo9eH9vJqEQqPWI4dffs5KXtrUgvidGJ1BKKYoycFmaK2P+nodC/c528ekaPG3A==
X-Received: by 2002:a63:62c7:: with SMTP id w190mr288455pgb.55.1628006677214; 
 Tue, 03 Aug 2021 09:04:37 -0700 (PDT)
Received: from haswell-ubuntu20.lan ([138.197.212.246])
 by smtp.gmail.com with ESMTPSA id y6sm14390653pjr.48.2021.08.03.09.04.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Aug 2021 09:04:36 -0700 (PDT)
From: DENG Qingfang <dqfext@gmail.com>
To: Sean Wang <sean.wang@mediatek.com>, Landen Chao <Landen.Chao@mediatek.com>,
 Andrew Lunn <andrew@lunn.ch>, Vivien Didelot <vivien.didelot@gmail.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Vladimir Oltean <olteanv@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: Eric Woudstra <ericwouds@gmail.com>,
 =?UTF-8?q?Ren=C3=A9=20van=20Dorst?= <opensource@vdorst.com>,
 Frank Wunderlich <frank-w@public-files.de>,
 Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>
Subject: [PATCH net-next v2 3/4] net: dsa: mt7530: set STP state on filter ID 1
Date: Wed,  4 Aug 2021 00:04:03 +0800
Message-Id: <20210803160405.3025624-4-dqfext@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210803160405.3025624-1-dqfext@gmail.com>
References: <20210803160405.3025624-1-dqfext@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210803_090438_310365_C753067B 
X-CRM114-Status: GOOD (  12.72  )
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

As filter ID 1 is the only one used for bridges, set STP state on it.

Signed-off-by: DENG Qingfang <dqfext@gmail.com>
---
v1 -> v2: use FID enum instead of hardcoding.

 drivers/net/dsa/mt7530.c | 3 ++-
 drivers/net/dsa/mt7530.h | 4 ++--
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
index 606a9f4db579..9b39ccd9dd4c 100644
--- a/drivers/net/dsa/mt7530.c
+++ b/drivers/net/dsa/mt7530.c
@@ -1147,7 +1147,8 @@ mt7530_stp_state_set(struct dsa_switch *ds, int port, u8 state)
 		break;
 	}
 
-	mt7530_rmw(priv, MT7530_SSP_P(port), FID_PST_MASK, stp_state);
+	mt7530_rmw(priv, MT7530_SSP_P(port), FID_PST_MASK(FID_BRIDGED),
+		   FID_PST(FID_BRIDGED, stp_state));
 }
 
 static int
diff --git a/drivers/net/dsa/mt7530.h b/drivers/net/dsa/mt7530.h
index d44640bbd865..5b70ccef9459 100644
--- a/drivers/net/dsa/mt7530.h
+++ b/drivers/net/dsa/mt7530.h
@@ -186,8 +186,8 @@ enum mt7530_vlan_egress_attr {
 
 /* Register for port STP state control */
 #define MT7530_SSP_P(x)			(0x2000 + ((x) * 0x100))
-#define  FID_PST(x)			((x) & 0x3)
-#define  FID_PST_MASK			FID_PST(0x3)
+#define  FID_PST(fid, state)		(((state) & 0x3) << ((fid) * 2))
+#define  FID_PST_MASK(fid)		FID_PST(fid, 0x3)
 
 enum mt7530_stp_state {
 	MT7530_STP_DISABLED = 0,
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
