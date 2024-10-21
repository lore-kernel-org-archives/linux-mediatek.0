Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2CB2D15D8A
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Oct 2024 13:09:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lfnoFTnTvSIM1scMxITWklvMR7Mwt4ccSZX9oAqnsCk=; b=TVZA7KYj9yfQg75Ag+RaHJaVCD
	hgjxnHN4Tjoddtu9eiP3y5RReUgMqyoCirXAeR+0TeduKJvMTwRxrFAnnAZBnAsmhZjquQYDX8TBp
	iEAuiPJ32/PezycjTvoCfq7XZAZrrP46dSd/BrWe6OjxpilddzF6ZtsJi1y+4tTlZ30miuq0NDCSA
	TId1VixB7ATbp54FhxkcF1fh7B/BuRGgkjsVL7jUWlastLKuYc/5KD0xi92tVvAJDkloauS5kvAvv
	WX2UfXiI1sfoXHSXj+N2iMlm+mloDIQTJ9VowPQqESEUehOXaEyhEzno//J+V65/XCr+f8HTM8eWP
	+ek68lNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t2s9i-00000007NRi-3Sfb;
	Mon, 21 Oct 2024 13:09:06 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t2s3W-00000007MA7-1pTX;
	Mon, 21 Oct 2024 13:02:44 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-431695fa98bso19811215e9.3;
        Mon, 21 Oct 2024 06:02:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729515760; x=1730120560; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lfnoFTnTvSIM1scMxITWklvMR7Mwt4ccSZX9oAqnsCk=;
        b=M3/xY1cKjUxm6RrFFtK7fNUHQmFE2ae+fHkO5RwA+StyyAAqUFA49mSypDoUykLw14
         l0/mo3RfaFn4hJL2JxB3kkNgbkCitcgIE8rAu+Tiaxv6J4YqUPMDyBhgM2nbsJknmgr5
         JLspEIpH/3CoOsfN908q+NvcT6Uf3qUEwjMyL9hOR+QJ8ivysb2/085Zb62424azBKbp
         DewA29dbXjTwhSQAxYoF3SsHFiTg8mlE2CHnQdnCldTYqJWvD2dWmyx6fElcCYRdjxgk
         lN94ZJuLjpOtctp2DPCkVCF0Ve7qxR0Hx2LeMog9QLcz7z+KzpFlT/LAI5ONUvQxWctH
         RO9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729515760; x=1730120560;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lfnoFTnTvSIM1scMxITWklvMR7Mwt4ccSZX9oAqnsCk=;
        b=sQGnJ9LFps7+4Wnmg+5vEdq88QV6UHgoeOVUOzXiQsikScwkucNDxpSykyRMVLrOGU
         2rKl5g9NXGbyeLtP+LE1BCyp+gJBdxna4GHSHgQMh+2h0mnF5KreqwXYJV7hfDMFsUKK
         m2pEazgapntFhcxYs6GCYXqg/nu4R8bdr+GXU+3+QIYx/AFGVb0CGrB5YcjSXkuY27Dm
         9C+hq4Lx3Dgxo4pRnWMqA9a46P2PawbMZN13VIGi3TJOqGWMDSkxMvKgbz9l0KvuwdMm
         dZI4Pa5CwsGDLu/hMBNIR9na+zhho4PBnudb4EUj3Qos7S1kF01w4SJOXjDFJpvz/ROZ
         jYoA==
X-Forwarded-Encrypted: i=1; AJvYcCW0DH0CqsZhQgdnLWb56kZBHcyQjMbCcztON8bDupkW3iUmUXfL5+st3rZU3c88QmoIPluquzY2lX3iyW5AJ4xa@lists.infradead.org, AJvYcCXbN0peSe2IKmRCaPMqxcM/7MA/lffi1iPQVblsQ1RhENAT/91La8QEpnyMa55A38Z/OlNfse12f5hhtcSyGD8=@lists.infradead.org
X-Gm-Message-State: AOJu0YxUY+ewKrM+rrS0Tt77CGRC/FQKnQXXzjv+TW/TdxjP0AUtlBf9
	z5CYiqWci0GA1jWA5MmsSFX4nZtfC29dkbl05bloaNUgS59E4GPc
X-Google-Smtp-Source: AGHT+IGB42B4JCPKbsU6DhqCcHXmAdx8avXYx3w3bO1ep1Vh+9tpxQ/1zXAJPC8GmiQYGfm7GeIHiw==
X-Received: by 2002:adf:f781:0:b0:37d:46a8:ad4e with SMTP id ffacd0b85a97d-37eab6da681mr7028762f8f.15.1729515759989;
        Mon, 21 Oct 2024 06:02:39 -0700 (PDT)
Received: from localhost.localdomain (93-34-91-161.ip49.fastwebnet.it. [93.34.91.161])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-37ee0b9bcfdsm4295329f8f.103.2024.10.21.06.02.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Oct 2024 06:02:39 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Christian Marangi <ansuelsmth@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [net-next RFC PATCH 1/4] net: mdio: implement mdio_mutex_nested guard() variant
Date: Mon, 21 Oct 2024 15:01:56 +0200
Message-ID: <20241021130209.15660-2-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241021130209.15660-1-ansuelsmth@gmail.com>
References: <20241021130209.15660-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241021_060242_495678_56A30325 
X-CRM114-Status: GOOD (  12.55  )
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

Implement mdio_mutex_nested guard() variant.

guard() comes from the cleanup.h API that defines handy class to
handle the lifecycle of a critical section.

Several drivers use of the mutex_lock_nested()/mutex_unlock() function
call pair hence it is sensible to provide a variant of the generic
guard(mutex), guard(mdio_mutex_nested) so that drivers can be better
supported with the call variant "mutex_lock_nested(..., MDIO_MUTEX_NESTED)"

Example usage:

guard(mutex_lock_nested)(&bus->mdio_lock)
scoped_guard(mutex_lock_nested, &bus->mdio_lock) { ... }

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 include/linux/mdio.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/include/linux/mdio.h b/include/linux/mdio.h
index efeca5bd7600..3f0691dee46a 100644
--- a/include/linux/mdio.h
+++ b/include/linux/mdio.h
@@ -8,6 +8,7 @@
 
 #include <uapi/linux/mdio.h>
 #include <linux/bitfield.h>
+#include <linux/mutex.h>
 #include <linux/mod_devicetable.h>
 
 struct gpio_desc;
@@ -25,6 +26,9 @@ enum mdio_mutex_lock_class {
 	MDIO_MUTEX_NESTED,
 };
 
+DEFINE_GUARD(mdio_mutex_nested, struct mutex *,
+	     mutex_lock_nested(_T, MDIO_MUTEX_NESTED), mutex_unlock(_T))
+
 struct mdio_device {
 	struct device dev;
 
-- 
2.45.2


