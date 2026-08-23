Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00A08C5B572
	for <linux-mediatek@archiver.kernel.org>; Sun, 23 Aug 2026 00:22:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PnfycOpIeVLKHmflGiUF526cXqauQ3cReF2OjuRBrdk=; b=pq/QWtJZvbWwHdGHUDPMjEQO9x
	s+nwZKc9Qcx1xbg1ueuvcG4Rb8FyUkIIpBrc+MYtDexG4DUu0X0ftZBz1sFY36jgX/oIPBkO5xU6n
	iEy0+GTKE3rgwM+38sPejsJQWm4i4jOicurMAwi/WkUwyQrwwX1alk9KebKEmR4WYdZQWWGmbIm+3
	iDmds5mWbzlzf4ss7JEA2C8kxbxK2ZT0caxayJvojEkR+87ORRfln0JJDOFH4VgWL/rxgx04lEP98
	POLImejIn31iKZI+KojaCDfbIDyeghbwi5NK04iLRBDGLlqk6E+RA/9yFtBzeCdcImbVumDFNBoda
	l7gpR2yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxvzB-0000000Ev8X-317w;
	Sun, 23 Aug 2026 00:22:53 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxvz9-0000000Ev7t-1jHR
	for linux-mediatek@lists.infradead.org;
	Sun, 23 Aug 2026 00:22:52 +0000
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-c15d47266baso258185266b.3
        for <linux-mediatek@lists.infradead.org>; Sat, 22 Aug 2026 17:22:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lex.la; s=google; t=1787444569; x=1788049369; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PnfycOpIeVLKHmflGiUF526cXqauQ3cReF2OjuRBrdk=;
        b=ktLZeiQ3R6PLIUs0QNPgLUVOcj4mbqJSGK6JPzXWzSCfg6SnV5fayypsUoGl/oGITg
         2HVHvnTHVORmAi/SzAx4wpjsog3jPHN7wsTPL/CjNZRFUAP/1TB/p+3aNV2muKdJi4R7
         t2iMU5gtDzDQ4r+7X/NyTKB99g3J+g239mDwOzW1So2h4cY6erS+FgWSz120M1Ft+FT/
         lzKnprVs88WCwyEv5opOO3eiX6BW7obnsfwfM0WiNjgVBVEwJ4DZslk6edXGlqm3Uvmr
         nKXUu+0WqsdeXlX5YFLqj4BwhvJFMtWpFwE0AfLzk7wrYzXF2PbhtMjIoRisyfWtaQAJ
         eM2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787444569; x=1788049369;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PnfycOpIeVLKHmflGiUF526cXqauQ3cReF2OjuRBrdk=;
        b=QbAKux2xj4Woakz4RXnsNaHIPcG3usN0qAdK91Dld/DKjYVaCuHdg/3Z4ccZSt0s41
         CJqq2gLO1JpxVNjeY/bTQCiMBDuB46CJ7YWzYx2j5SpJNP5bpKnIVyuC4VMTPyx0xW9D
         1XBy55EH7SAbTLwqbdWNTYWwCNyjnIpF4yn8uSDDgK21kWZRHsbFz3cUPtwEHU1myEjp
         4U12vNld7j9Z1q3xmromWPhR6Ll97s8qQMYdIDVbHEqaBXmaNvw8eu/+ecTNceNrV1eF
         dN09s6/yTqmLlsiayYKz6wdFCiwVq3hk1CZG6ACKRlZvgrdl94errVnSzmvTAzmL0/k7
         xT3A==
X-Forwarded-Encrypted: i=1; AHgh+RqOOp5E16xjPRodkDRHFVejdBRWli0bbE/gx727jHDKO9htNjmGDCiqM0EgMAg98KT1Uv4KSx3TwIJnek5CvA==@lists.infradead.org
X-Gm-Message-State: AFuF++lsbbgNAGftPr+D9pjUWqsMnXNPMGuibt4oaQ9qMrP20ZrSXj5m
	NJLahDVBe7bP5sTu62ofVn+chdyuE1AY2SwFS8mL9m7itoPLg/1UmNevpnJRN0+Q5Rw=
X-Gm-Gg: AR+sD12jN26wMAZHFtjo/cIgcBxMsdA8+TM17mEquVhbpUajNaN8wfUmfP/6/qvZGuD
	jHc4MfcDU8eM/+4P2V8xbLMJAYIPdoQtBbVONYwRP7Z3f5V+L9rtEC3gcll1Jv9m+Jn06nZELBG
	18npMHGPrOle4BTHPf4o8Hm2XgoMyIqlZr9d0AGgG0asn/GsUn4VE/TO7P6YeIjTBjESBmcxaLl
	9TDFgCqHKp5QVaQzHtgFudgsZ5dBvsnVjv0bsnLfyLx7FSakEp43FoEzGzoDLQUYmyoPDPz1AhT
	P3av/BxnOox7dVMjr5qSn5u7YKKcDylqV2Gg7Ani9CyLsg2lrK+IMHpDjHh2jIspkeyQQWPO4LS
	XNAaIUsFImdYs4Qb/aPdm1OKlkPjPCpOC+kEVS3ibEdGRn991pzhep/cqoJoCsupAfzVIt3O70x
	ux4DA6AYe6K/PLoo4jnJF/EL+9nqO8i1pt7ztHcOyuL3v+25cK9Gz3jKm/LdG/0yhUibmAWgUDB
	0bKYYWK
X-Received: by 2002:a17:906:6a27:b0:c20:2eee:97be with SMTP id a640c23a62f3a-c246a33ed69mr1775593266b.7.1787444568708;
        Sat, 22 Aug 2026 17:22:48 -0700 (PDT)
Received: from ownbook.home.lex.la ([84.17.55.225])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c24968a2e42sm438394466b.59.2026.08.22.17.22.46
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 22 Aug 2026 17:22:48 -0700 (PDT)
From: Aleksei Sviridkin <f@lex.la>
To: Andrew Lunn <andrew@lunn.ch>
Cc: "Chester A . Unal" <chester.a.unal@arinc9.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Vladimir Oltean <olteanv@gmail.com>,
	Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	netdev@vger.kernel.org,
	Russell King <linux@armlinux.org.uk>,
	Qingfang Deng <dqfext@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Aleksei Sviridkin <f@lex.la>
Subject: Re: [PATCH net 1/2] net: dsa: mt7530: populate lpi_interfaces to fix EEE support
Date: Sun, 23 Aug 2026 03:22:46 +0300
Message-ID: <20260823002246.28455-1-f@lex.la>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <c501d5f8-015c-4ce1-87ee-c4cdaea57f7e@lunn.ch>
References: <20260822195252.2934-1-f@lex.la> <20260822195252.2934-2-f@lex.la> <c501d5f8-015c-4ce1-87ee-c4cdaea57f7e@lunn.ch>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260822_172251_466101_C1BBDEF4 
X-CRM114-Status: UNSURE (   8.47  )
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

> This is very verbose. Is it AI generated? Please revise it and make it
> suitable for a human.

AI assisted, English is not my first language and I lean on it for
prose. The verbosity is my fault though, I reviewed and approved every
word. v2 will carry the Why only and move the mechanism notes below
the scissors.

> It is normal to assume phylink is correct. Now, if you do find it
> doing the wrong thing, we want to know so we can fix it. So if you do
> want to validate it here, make it very noisy if the validation fails.

That note was about a possible defensive check in
mt753x_phylink_mac_enable_tx_lpi(), not something this series adds. If
I ever send it, it will warn loudly.

