Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DE86606C25A
	for <linux-mediatek@archiver.kernel.org>; Sat, 14 Nov 2026 10:45:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=OcZebHHY;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SfaPB7gs
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=geHgxObFWVvRZemosAYU/Jzp3fHhQwXYyeBLmeYyX4s=; b=OcZebHHYfRIkPM
	ZVV6rrsLa8W5ZhHes66OcEvSzZRclTry1E0OUpf/x7VvjgpKYcvS0mSfkEdPNeVeDLauxlDVVR5VD
	L3goACJTZv+FAN3OwEbROKmhdHX3mJgAejYiaUXngV1orjw02szNcbTDck5oHu+m5yd8MVILPXTpB
	RCC+jarNV/eoNbTotFBzHXcSG9+1nQf3w9kT8siZQAWqxQUuEvuk5xS9nVQ8urQmp0kXZx2Tc6/aO
	kWfu+cBy/SHIqcwmxIwOIBQpjVD0DrMgjgiC+cnLYAbR1H6tbZPBuQucdwh4gRXOBQIpuDosaFhJ5
	9a+7Bembq6J7cFb/Gkfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSBFr-0000000FnKh-02Pz;
	Sat, 14 Nov 2026 10:45:07 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSBFh-0000000Fn07-3LRe
	for linux-mediatek@lists.infradead.org;
	Sat, 14 Nov 2026 10:44:58 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-4a5b2be99a8so11622125e9.2
        for <linux-mediatek@lists.infradead.org>; Sat, 14 Nov 2026 02:44:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794653096; x=1795257896; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=geHgxObFWVvRZemosAYU/Jzp3fHhQwXYyeBLmeYyX4s=;
        b=SfaPB7gsI3slkCigW9lt8wbHySkmeIQe9K3haC6VQIA9nKgXRFx439CYg4utm7vVym
         R5h6GfkGhzv/a0vHTIqLkJXVLYuQC2Nzwz/9s445h+ypurUdZw5q+RQ5Eq8Z5ZB+JJQx
         mI/vYkCx93/08BV7Gy/LUlg+FeQWJrcAy5qzPqblVYRYp+QIF+lQ4+p9Nl5TM65DzLXK
         kJoTRQNcd8fEOTYRgB29g7pOGfTHSG+IhGW5Y8yzR9B5Rzw4Pk5p8JOzDeUu/RWZnbxz
         K2qs4PBK77u5rQtj1PJXcBXO54tzp+/Rm0g3XeknpyijwAX3Gjj01lOdU+q6O9dQLcih
         G1RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794653096; x=1795257896;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=geHgxObFWVvRZemosAYU/Jzp3fHhQwXYyeBLmeYyX4s=;
        b=bg6gdCLPWmJ8GCJdR/O3aVeDbeH4LnEYCvp003XYsii0We98JTCBYxDhs+o5KEuynH
         D86T8iGQGKSlZO+qgVxUUwctGJ36FkLDoHtaALDDTqXIZvyAi89+KyLxFIMTIbpXd8Bf
         dA6Mu4txhvsRZDOQrCIDXXDK4pRtOXCpyAl8PkgyNwBAQFkJkJjctZUHMfcjodBntooL
         m9JxaCrQDCOkTcduJAhrhbP9pZrTMesBEZ0euL9Ik7ry43hEEkHjODKwHcWc0+HOq0Jq
         ti5kCCgKkhFfEetDcEwfICYeLKXdpxQY2yFhYUW82qsnZnfRQSow7P4wXDR+Dbq9e4nX
         z4PQ==
X-Forwarded-Encrypted: i=1; AL+hErE6hlVAcEYWlUl3llTueItclsT/aZAOxIP3RapaS1mpblMp+u2FUDrQngVdb3QrckRdFvZIzmXHGqvesg3nuw==@lists.infradead.org
X-Gm-Message-State: APuU4Z+2LwqniAQidavjHkN7pAVQYe1se/c9o/BmrZ2D9BKC8rATSPjp
	eJZ61n9HoSFFYMGRzzh8Fk76WRszevH9TZDhk4FFAwN0wfTBHevrcvUC
X-Gm-Gg: AYBFou3UsemS5U8Vlrpkep08HQGANSDR5yk47tqRmBju0rrCDrDWzxSx/wqLso4gLx8
	g/EUdwcjsyexS5uaHzxuEeTkGVfNfbzLHn3iqSaZDZKHuvOdKK9IUQxpKEBy0pJFQWYvN2Dg1st
	ml+FfTuBHWnlcwHUNrL7jqinYSfGTnF0qCwL5Pi7m4cajubX3Q110ZlaGcA9cBaUAr2Ki++qWPd
	5zFbazbvD6R60hkuT3XnjiW3XSO1iGxzCIdsIAHdf/lYnRfUMcZhU6nDWIcW6qPSfZXPEgj4FsU
	e2LD9MjCJY9duh0ltgNviDxVueg5+VTAkJ91Ywf1HMGJiFQosy1hH42sbVWE3JrFk2rvahESuSd
	pa5J+X0EhmqIA+CrV2nAP0W1DY1FpZzuZh7X9xEc7EFHl0pzkOWiHplr5fnJfyrWTDSmE9ogcT5
	qKCimWaf5xctUxSnChUH2HJwwuemDKOT5RTEqpHG8ZTyWVXF39NpUJJ8skqQpdSLrQB20KcVoqM
	ctgStWe5RfyYEQRLc5YssYdsUMmaap/akPQ+KdChr9LjM856GSwEeaDH8PNlP8lZChN8VnhwAHM
	Ft4o9qwNoHRz+u/jjIRSZfVGKbTZrT4yueZmLQ2NYglFuaYdp4tZm0cZi9fZy63Q5u5SOkZUAO+
	WC4Erlxl1LjAJvUG+c/hHRlBDEYJuXRKvcQ==
X-Received: by 2002:a05:600c:4e8e:b0:4a3:59c9:a743 with SMTP id 5b1f17b1804b1-4bb55a8faffmr109717835e9.27.1794653096148;
        Sat, 14 Nov 2026 02:44:56 -0800 (PST)
Received: from Ansuel-XPS24.localdomain (93-34-92-103.ip49.fastwebnet.it. [93.34.92.103])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4bb56719391sm52858285e9.1.2026.11.14.02.44.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 02:44:55 -0800 (PST)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Simon Horman <horms@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	llvm@lists.linux.dev
Subject: [PATCH net-next v20 11/15] MAINTAINERS: add myself as PCS subsystem maintainer
Date: Sat, 14 Nov 2026 11:43:50 +0100
Message-ID: <20261114104426.235620-12-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261114104426.235620-1-ansuelsmth@gmail.com>
References: <20261114104426.235620-1-ansuelsmth@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261114_024457_883362_C0F6CBEC 
X-CRM114-Status: UNSURE (   8.75  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

List all the files of the Ethernet PCS subsystem and add myself as
maintainer.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 MAINTAINERS | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 893b0670a7b6..44c116f6cfd8 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -10033,6 +10033,15 @@ F:	include/uapi/linux/if_bridge.h
 F:	include/linux/netfilter_bridge/
 F:	net/bridge/
 
+ETHERNET PCS SUBSYSTEM
+M:	Christian Marangi <ansuelsmth@gmail.com>
+L:	netdev@vger.kernel.org
+S:	Maintained
+F:	Documentation/networking/pcs.rst
+F:	drivers/net/pcs/pcs.c
+F:	include/linux/pcs/pcs-provider.h
+F:	include/linux/pcs/pcs.h
+
 ETHERNET PHY LIBRARY
 M:	Andrew Lunn <andrew@lunn.ch>
 M:	Heiner Kallweit <hkallweit1@gmail.com>
-- 
2.55.0


