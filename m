Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA6F2C624CF
	for <linux-mediatek@archiver.kernel.org>; Tue,  1 Sep 2026 08:30:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=winUkNgWZKpQ2EAEJkwIhIBpCcK8DMcWRELm0nMiNB0=; b=ssfrFRav0ogkJv35eNrDi2gBnn
	hsL/UhA9Kmn7ha8O3RX3QfCm1Hl5P7TMhW7GWdl0G1UFEZWBoR7SVsjcLICx9xnu1u8bRIIcHp/kc
	Iyn2oqVGT4nPn0uFfUlDW9ZK41m7FGOvc9UNMiQKH5nH2b67er5PjLx9roNvnXCtEor+1rYj9pKMJ
	ge8Qw4enPshRSS64hpiDrk9z+SY8B9rJ0Gm+V1GAu6GyUeps3NJC4OqK4KgE/NVAf7lkGDGbh5CGy
	vWM17w+/VhTt9QFcUfCsbtcg0EOV6bmoUXkusqjk0Gvy//KBU4gRlE9NlOJxdcB/qIbGbH5opjqEG
	M+99N81g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1Jt9-0000000BGxO-2r9v;
	Tue, 01 Sep 2026 08:30:39 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1Jt6-0000000BGqG-3Ekn
	for linux-mediatek@lists.infradead.org;
	Tue, 01 Sep 2026 08:30:38 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-4956869750eso29964305e9.2
        for <linux-mediatek@lists.infradead.org>; Tue, 01 Sep 2026 01:30:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788251435; x=1788856235; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=winUkNgWZKpQ2EAEJkwIhIBpCcK8DMcWRELm0nMiNB0=;
        b=F6ByObjapDhLozEU8h5OPT6URfVEEW3YR++cgFXTiJe2W0xt611k1J97OsAuucNKhk
         j9yGE2HkvYhCzohFy9A9Irvfkph60a1D21ffcoZfnTKcMNCGo4Ud9CqQx58KbgeaJANf
         Zz6PHjworJwB52XWOEzuMX3enPHuZCYv/66MDO+OU3GXGbUE49vX4XK40G8F3goivHZc
         h7iIrVd80Ui8WniyIHj4zUy6u2t4PDzrEERLRI/PohyMGa4y0i+ymEiaZvkGocLwNwrP
         mXD6lghYMf3HOF/zCPIt7vDlQ5nuBlsctpnK5K3TgxbBe97eEjylM/zrhcwzrthS1JjI
         PDvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788251435; x=1788856235;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=winUkNgWZKpQ2EAEJkwIhIBpCcK8DMcWRELm0nMiNB0=;
        b=isxwM8IppT1m4iEQzzRSn6qP5ybwCFIqd+LfQwgJ1GtoIbKj+Xb1it8r6iqWwG5JH0
         waqEX4I5pD+Lk/BabOIkzaDOpsSwU/s1R7qhJrIrArN4NnQPzw8Hh/3HOD0pDo/UyIRm
         Ba+Tw2m6DXa25KQSBvVD4hlVNHcWbOucjnNfqGueow95WBqB0MXVGLFlFxyBishT+fXE
         7ZaZFK2gb2raYo7Ta1NnjKvdFj13RJxXvQBrdE8UCtviVsgdAsWPhv51+R9cNbaACd+U
         VKDe76KvMQgF93G+KRoXcuUfe44RtsDAI75pEMycgEmdw7kEVVkAccpgJFggNWs+T+Y7
         ANsA==
X-Forwarded-Encrypted: i=1; AHgh+RqOltGz+HEswEfqhOkn6wvp/bXCNS8EbsA9CzDKBAu8AoKVKTrXPfHnPLX+27rzM5HSGNqI1NJHDZpSRe+xSQ==@lists.infradead.org
X-Gm-Message-State: AFuF++kqt4CrsKGumJDU+B609822goEoOCuWiV2Rov1YMDxV03LfA+yW
	rXTa4uBZLqxPhdLcJZ17TAeViU4S/8aaDrzHtmNy9MJeLXb0YMz/Eigo
X-Gm-Gg: AR+sD12maGlg1W2zjaXNs2yHhW2Q7UxZOK6MjNihQuzzIeri+ydZdOs9Dk/T9sAOeZj
	udpypyHCbkZ0AplvOGEpcUW2/+jnMutzYbJVn54p2mRc1S2fcdaRtyT4HuWWBcVm45O41csT0/r
	k3QGJc20ee0D8JP9dfXtlnIOuz0Rk8bB7pfALMedbO7VREZ4PAQb/detHSpsHNJ5OSGCVo296a+
	gUjqVzs+VwHFmnCGwY7u1vQmxVA7kGDzd2hj1sK+aWHttMW8A+9IBvN9nFFhZg70CBxTc5xpx6w
	HSjL19jrPqenfwoh41CmK8hGAhRf69dzrrlVCqouAGUq3v3Nxw6egJFk9f1DWvLicCUpRxr7n7b
	VoRNLCwlooKxombsfcwDAwzj+qyYMhPgyexCw3O6PkDhu+TsDLkDNHxeE0uwzFdzhl5zjijcwe2
	llmGfIseO33k5lpSam/2fQ0bu3BcrHTt/F35ivfy6UdTt94fnVcqHvIEHif2LbipXWliWWFEPfl
	gi/wGkZaivpgnD33bj/7PfZ8cEkavoh4UpoxNzj/BuqP/eau/Jb
X-Received: by 2002:a05:600c:19c8:b0:49b:c8e:a211 with SMTP id 5b1f17b1804b1-49b91c20bfamr493430315e9.5.1788251434958;
        Tue, 01 Sep 2026 01:30:34 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-79-26-252-140.retail.telecomitalia.it. [79.26.252.140])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-49cdce08862sm51459635e9.1.2026.09.01.01.30.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 01:30:34 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
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
Subject: [PATCH net-next v15 08/12] MAINTAINERS: add myself as PCS subsystem maintainer
Date: Tue,  1 Sep 2026 10:29:23 +0200
Message-ID: <20260901083001.8044-9-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260901083001.8044-1-ansuelsmth@gmail.com>
References: <20260901083001.8044-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260901_013036_967927_EB02C58B 
X-CRM114-Status: GOOD (  10.16  )
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

List all the files of the Ethernet PCS subsystem and add myself as
maintainer.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 MAINTAINERS | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 0b42e898f4d8..1b4f79be5e54 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -9757,6 +9757,15 @@ F:	include/uapi/linux/if_bridge.h
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
2.53.0


