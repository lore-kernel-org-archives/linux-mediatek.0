Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D27D0C4450F
	for <linux-mediatek@archiver.kernel.org>; Fri, 17 Jul 2026 06:55:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RH5Rm+VqeCudjfRml6HtxpQ7RLGC9UFpnfUcRZ/Bi4M=; b=bcCQGgKbgidzaBDtIo+caVdcNx
	gGPd5/CjzAXJHfWn3MoO8rA4RriXc1HYDyTtoFOSWxSDftzEJMuEkNgMKyydNRNy3ea6at7CRCOU3
	5qBEI4b78mq8XHv+1E99HswEyN3h5dhfm8R2KvPdYYSmiRLq07NYfSG6PX7rDc7SBTlKaZh3nXCY8
	/1fI4UNhVYpI25FekruelDri3gkzJjiwZXRnUd5MZNIn2X+iqaf4hPHFTdRDgxQ1CTucknGpKhCCX
	0Rp4ckwn1k2GR5ulTXtM/NwIs2gv6zIdI8HHwSAcHGgL9F70TUSFDCQ6TzxWL6DpM/+Rgn4CPhk/3
	cbj3BlAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkcTp-00000001JlQ-2JPt;
	Fri, 17 Jul 2026 06:55:29 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkcTj-00000001Jan-1WZJ
	for linux-mediatek@lists.infradead.org;
	Fri, 17 Jul 2026 06:55:24 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-493c733f15aso64660415e9.0
        for <linux-mediatek@lists.infradead.org>; Thu, 16 Jul 2026 23:55:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784271322; x=1784876122; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=RH5Rm+VqeCudjfRml6HtxpQ7RLGC9UFpnfUcRZ/Bi4M=;
        b=piD4/1WdC8uLlRQbsZzvr9V+P43+mMtWzu5EZy5hQbeWuxNEErmU3XxZSl144dxNtx
         /qQ4emzQTzPq9zHIgQuXnbpWvVrJsmU2sU/7CEZICxEJqRXf406OE/HR86TrVQug3B/P
         NTyReOFCFNcQVF8EmEuesUS3mevrTL/OwJPU8xhgg4pjU139et9LfOWcwYcRRT83obI+
         eDYOXvCXxwBa8GC50O+CSnZm1UK/6E0nUJmiq7KZcpuykg6BMHQqI7t5wyKfaplwKvXp
         rOK2tsf3UFh1AcsFPIqFJY0wp07olSrdHe2b5L+SS4EamABvFyRbLDOwgeX/kRGaiENz
         cTjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784271322; x=1784876122;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=RH5Rm+VqeCudjfRml6HtxpQ7RLGC9UFpnfUcRZ/Bi4M=;
        b=iKLEEncbgdSaPfRJTABM1BL50h6wErIoR46Lc44fu/6lYdnAO2g7ZHu+wt4ppUWls5
         NdkQo42jXqTQOUqQdKUN5myIUOpD0TtUH+SoxfCwxa5B8D1RXuA6nJav29FmgtgGQrYN
         Cbwe/LBBJk/urm2GRsr5NbR6d7AanG7OrWW75XKilCKX6LjX7Q4A6N1jpjcQFB/ljBEj
         cPP6vFmGaVbXFI4EQdrrTToNb4dI5M3R6KIPnPaAMQ0k4gl2urXQGi8KnmZ8MfPU8HVi
         vFHczqfNDCWK081jN9DKygObc9UBQ9pGZhqgnEzJLqDlkqBIABMWunZaq5hdstiroeIb
         ul9g==
X-Forwarded-Encrypted: i=1; AHgh+RoUedQ0WcW/UJoCqHh6dvB27RQJfz9Qm5J+8YSmkaxhZ5bsQWsCt8Be0Wukk6bSRIRPrZQBtE1MxTQBC490wg==@lists.infradead.org
X-Gm-Message-State: AOJu0YyD6KTJrA5kJ4ymaBOOmSoAywkp1r0fzkraK2oVOhv2OJokMqKd
	yJQgebyhUYtKqGHKjtLgHxCYQYOrMWs8vRu1cXQCsF5pzSKZHDYpoJk5
X-Gm-Gg: AfdE7cmOCKTi7E1otzbC3wHbtdwdiuSjfB/ZXALKcW/jkV0skN/Qu9QHi1VVkSG4LeY
	ONgM8c+9ksIrlhNWHD7EjJnC1SaCLqjrqc31uo9GvcVMKMNSFib29d4AFWXal76+uOxhqpNw3o1
	3YIeUr4m8F0WwGoLRaUvhHri3Bm5Ykzg2jBnuzY0NHLC6zzrlN9FNN9dnjkp9qL2dYCIbUCXKRE
	HREUydMpFbDEY46QDjYXGt8flY4Rgcyn8quSWDXpfPKd4V5kMGaWH1IKYfP+k77TO8jA06ZfzH4
	E0n5sGb7VvjbU9s62w4vt+jCgwHXrmISyQlQTlaWTkPaCuhl/RWGhPdlTM6UytWrZ0+LxGVBSty
	wmT5kENyMJFINsYTAg4Hp6V/GTuo8NFM3EMRT/P71XpSGv1HvkDa39mVTwtA3QBCAhEo7E+WEXT
	5NyOeY56IPW9oUrEkCbKHcVFoBdQdH21gHN4386cCHxOtXAj0lsTuJXCC9ljJhFL9cWcofjQ==
X-Received: by 2002:a05:600c:574d:b0:492:4a50:41fe with SMTP id 5b1f17b1804b1-4954a405e58mr9272335e9.22.1784271321433;
        Thu, 16 Jul 2026 23:55:21 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-95-248-227-210.retail.telecomitalia.it. [95.248.227.210])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-495499f3f99sm24260835e9.0.2026.07.16.23.55.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 23:55:21 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
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
	Christian Marangi <ansuelsmth@gmail.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Saravana Kannan <saravanak@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Maxime Chevallier <maxime.chevallier@bootlin.com>
Subject: [PATCH net-next v9 07/12] MAINTAINERS: add myself as PCS subsystem maintainer
Date: Fri, 17 Jul 2026 08:54:07 +0200
Message-ID: <20260717065448.1498335-8-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260717065448.1498335-1-ansuelsmth@gmail.com>
References: <20260717065448.1498335-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260716_235523_424551_389445C8 
X-CRM114-Status: UNSURE (   8.74  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

List all the files of the Ethernet PCS subsystem and add myself as
maintainer.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 MAINTAINERS | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index f3218abefd0c..51704a90ca46 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -9682,6 +9682,15 @@ F:	include/uapi/linux/if_bridge.h
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


