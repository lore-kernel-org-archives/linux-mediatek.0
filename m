Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4854606A332
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Nov 2026 16:34:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Wbe8lNRh;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HuwN0ip+
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=iqXUKOcy9qCieLizcJg3vkRsvwt8JgXWNmMSevngILY=; b=Wbe8lNRhZa9Zmv
	jFpF4YBxnoK8wGAbO+BwaFMFVTK2ay9hu0iBQdd3LPzM4fMUDTNmapNlI21VertovdbjxR5V+FK5l
	7OFiSe3NvoZus0aZfNXK/7+Sp1ShpFqCe6CrbnH7XRjNPjsCoHCIIajZmfiLlZhCL3Ealsr4kUuHF
	FJvwmBoqP24khdnhkG+MopW7dgTWdBfBC1kUKFPQVjB4cHWv5ksM8xqvfPD/V9XMlUx9WnJwaAeja
	HjlmacpW56ZfCnYeyoajsWT7G8900zcr1JGXxH02Nm8n2IkVCzcdu8suoP+G1GCoidy1Uu7n30KJ0
	moiEq5qAucIA0Pk4PmYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSzf2-00000003F7U-1qEl;
	Mon, 16 Nov 2026 16:34:28 +0000
Received: from mail-wr1-f46.google.com ([209.85.221.46])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSzf0-00000003F4V-00Sd
	for linux-mediatek@lists.infradead.org;
	Mon, 16 Nov 2026 16:34:27 +0000
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-48e47347279so1698799f8f.1
        for <linux-mediatek@lists.infradead.org>; Mon, 16 Nov 2026 08:34:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794846864; x=1795451664; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=iqXUKOcy9qCieLizcJg3vkRsvwt8JgXWNmMSevngILY=;
        b=HuwN0ip+TGClsjhHAHXGtyI8p6Y+SJ5blHjNgC4lV5g+EyGpmky3/DYXqWnsjVrXLN
         xM4C/LSFnUeUOsvdWb5P4NuW5pUgfLTlpQoOwHywd3C/xzxMGTjUbzI0Oa+ilYtEfVsf
         TpZ6jOw+7NRI83hhGMa0ofn0GiVyyZ2Vspi2fcqOhRVcWIT1z9hUjwXnxRGKAFC9pGr+
         f/KYbgVHSGFlIu5w9JcOAkoae4FkR1EhZ06NxAZQ0Kgl2e24r7jtH3y+6hKUWhLGSEnN
         mYMQmHItz6u5L9q8V09GqLpgmvEXBw5QIkyDWOJexecQ2Tc3xGV6CvgwmVoQZ4GHfVe2
         s1+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794846864; x=1795451664;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=iqXUKOcy9qCieLizcJg3vkRsvwt8JgXWNmMSevngILY=;
        b=l41IniTY7YmSTyBDQG1vk0ObrpADEjMc88X6bGaf7cMrI8s8JT9p/fFGz+SlunlnVS
         Z7YKGsAsdKnDRg+BZsYZSpzqe/+ZEjrZipdeXLLLafdvKK/eAfJySGjszwMNq3rogIJo
         S5pfDMCkTlQP79lUt0TG2DnGJsCFSpb8ZYqKxwTZgUYLfz61L4hAuIGwZtXjRpUE4+Hh
         oYbNonMVRWDqIw3K+lqe4gezf0WhKpax2o4RyLvx4ACD+PbnwJp1iX/aIDX0QV5ssQe/
         Db0uEbbfBS/BPeOYCUZ3nqTAqV40Trq/9DDrQKPTXzKpOuy1ESt4komlnNQh+czHIE8p
         OnGA==
X-Forwarded-Encrypted: i=1; AL+hErF80TV6tSPZFLJ9tODmmwgfAM0yWCpbW2Z3170zdjYkNDZOlvYqAbwmZb2HmCJminpuY4F3GAmwRdG1kkRaWw==@lists.infradead.org
X-Gm-Message-State: APuU4Z8TG6jx/m4ahtIyL2JEWzFF0OldAyX0Wgc9Qv+GbypkjzYWSFqZ
	JxTEN6G6MEU6uFP5lOP9Jl/r6dlVjKQvGsAboUw4yzzC2icEkuqdQ3Jh
X-Gm-Gg: AZFdTZerEIL4cJOWGzuu7LEYbF6ZG7fUnmnRp6KINySQMLuRDoeONy8hqQXd37nFbR/
	k7WH8SFM0aqgCOJ4Iso3pj5XTR9moxgiFKmk7eI9IKMFfWDZlaB5TyyuT0tnoCHpuBRU5zE8OyA
	ORl2gmFx2hsF5KesheFm0a2iP+IAtwo01JsE5qGtVTuuSbb0zJIEKiCGBFZYf31Wyh3+qxao1AY
	MA892zFeSvnXz44uCJTrtZCGpjn+GGwioMoBzPmLHEO+IqQpNeRR7BqCM9bMjugkJaqEHvX/R6q
	rLi434TuWs/qGdt+Si349eU+4EfZnV/mMMgN1lEtyTK9SI+qVIi/DYvt8LFFvA4VjpCjNvDaWdp
	D2o2cy+kTCSIvjC0NwWWBiTdwtwdsyzFMqLPVG0FbbJoPRrzqJzrwmLt7QEy+XLU5pm+LMnVmpq
	kQFJujSSJBDpwL2Bb5rgVfbIj0zMehR1VcUTYP4rb4wHZ/scNxIDw9ALuDQIetIwRyH9x5venhQ
	GS6OmT0Bda5m9CI/Bo0hKERctgBmugTbmvL1JoSoVpk3+zxF10zenvK0MnPrzOfoyx4qGsUDpuA
	gPM0DUVaPV1ctRJWEeVRw6VfT29mT0ILnR80DZc4/vKagpoC0y9WH3RysDOIQbYEZU4Zy4xSf/e
	yWhTk6lhvjVwUNaLToR6no3sqJbzi1X4U8R02q8AlFeHIucWKwPWWTT8=
X-Received: by 2002:a5d:59ca:0:b0:487:13f:f612 with SMTP id ffacd0b85a97d-49c723fb77dmr22962598f8f.37.1794846863544;
        Mon, 16 Nov 2026 08:34:23 -0800 (PST)
Received: from Ansuel-XPS24.localdomain (93-34-92-103.ip49.fastwebnet.it. [93.34.92.103])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-49c5d223a29sm23840506f8f.8.2026.11.16.08.34.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 08:34:22 -0800 (PST)
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
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	llvm@lists.linux.dev
Subject: [PATCH net-next v21 01/15] net: phylink: make PCS phylink instance access RCU protected
Date: Mon, 16 Nov 2026 17:33:44 +0100
Message-ID: <20261116163412.551438-2-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261116163412.551438-1-ansuelsmth@gmail.com>
References: <20261116163412.551438-1-ansuelsmth@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_083426_053016_4364C8B2 
X-CRM114-Status: GOOD (  15.43  )
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

In the context of phylink_pcs_change(), phylink instance is dereferenced
from the pcs pointer present in the phylink_pcs struct.

There is currently a fragility where this pcs pointer is never set NULL in
phylink_destroy() and would reference invalid memory after phylink instance
is freed.

In this scenario, if a PCS driver calls phylink_pcs_change(), invalid
memory can be dereferenced and phylink_link_changed() is called on freed
memory.

To address this, make the phylink instance saved in phylink_pcs struct RCU
protected and access it under RCU lock.

Also correctly reset the phylink instance pointer on phylink_destroy() and
syncronyze RCU to catch an execution of phylink_pcs_change().

Fixes: 24699cc1ff3e ("net: phylink: add support for PCS link change notifications")
Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/net/phy/phylink.c | 17 ++++++++++++++---
 include/linux/phylink.h   |  2 +-
 2 files changed, 15 insertions(+), 4 deletions(-)

diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
index e7734e45376c..d9d0ace2042e 100644
--- a/drivers/net/phy/phylink.c
+++ b/drivers/net/phy/phylink.c
@@ -17,6 +17,7 @@
 #include <linux/phy_link_topology.h>
 #include <linux/phy_port.h>
 #include <linux/phylink.h>
+#include <linux/rcupdate.h>
 #include <linux/rtnetlink.h>
 #include <linux/spinlock.h>
 #include <linux/timer.h>
@@ -1295,10 +1296,10 @@ static void phylink_major_config(struct phylink *pl, bool restart,
 		phylink_pcs_disable(pl->pcs);
 
 		if (pl->pcs)
-			pl->pcs->phylink = NULL;
+			rcu_assign_pointer(pl->pcs->phylink, NULL);
 
 		if (pcs)
-			pcs->phylink = pl;
+			rcu_assign_pointer(pcs->phylink, pl);
 
 		pl->pcs = pcs;
 	}
@@ -2137,6 +2138,11 @@ void phylink_destroy(struct phylink *pl)
 	if (pl->link_gpio)
 		gpiod_put(pl->link_gpio);
 
+	if (pl->pcs) {
+		rcu_assign_pointer(pl->pcs->phylink, NULL);
+		synchronize_rcu();
+	}
+
 	cancel_work_sync(&pl->resolve);
 	kfree(pl);
 }
@@ -2601,10 +2607,15 @@ EXPORT_SYMBOL_GPL(phylink_mac_change);
  */
 void phylink_pcs_change(struct phylink_pcs *pcs, bool up)
 {
-	struct phylink *pl = pcs->phylink;
+	struct phylink *pl;
+
+	rcu_read_lock();
 
+	pl = rcu_dereference(pcs->phylink);
 	if (pl)
 		phylink_link_changed(pl, up, "pcs");
+
+	rcu_read_unlock();
 }
 EXPORT_SYMBOL_GPL(phylink_pcs_change);
 
diff --git a/include/linux/phylink.h b/include/linux/phylink.h
index 3a88a69882a6..4a0dc6fa8010 100644
--- a/include/linux/phylink.h
+++ b/include/linux/phylink.h
@@ -494,7 +494,7 @@ struct phylink_pcs_ops;
 struct phylink_pcs {
 	DECLARE_PHY_INTERFACE_MASK(supported_interfaces);
 	const struct phylink_pcs_ops *ops;
-	struct phylink *phylink;
+	struct phylink __rcu *phylink;
 	bool poll;
 	bool rxc_always_on;
 };
-- 
2.55.0


