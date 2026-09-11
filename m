Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 762DBC88E41
	for <linux-mediatek@archiver.kernel.org>; Fri, 11 Sep 2026 03:37:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vTrVSBkVGPXm2gcTE8fmlqXbs+T/1ViJad0b75wnA3w=; b=YuSVxVFjjLwPgPgOBFQ7aSXXbN
	tZyYoPlVSoylzyGCgEq1+KasZ5HvXjv5Z2KLMDEyKMpouXg5VyxgbXN06MpDApAxI3SpE2m4d7DBm
	tpFX/q54WBoONWjkkrkLa4B707hogKXsSNYHSl/79bPPp7e58sU4Ryllwp9zn2VakBgVtlOOLRvcM
	RL8tCtg42OJLrqXg/6cQlhqIjI0WgugI6tvfccy2+2Z7g+3hKW6LIuHdLw99qVvA3bMcNgndCq7lz
	qpqolaCUWVDmbYZne5e4h66VeE6Dm0A0CcTYkB7C6JrBb+SSNWQ9JSJgL1Qg/l3Jb23S+gI7hfl0X
	CxT2M92Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4s4s-0000000FmiD-0kLt;
	Fri, 11 Sep 2026 03:37:26 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4s4q-0000000Fmhi-3c5D
	for linux-mediatek@bombadil.infradead.org;
	Fri, 11 Sep 2026 03:37:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=vTrVSBkVGPXm2gcTE8fmlqXbs+T/1ViJad0b75wnA3w=; b=UYJYHHQzLY6uLgQOSweG6NVsal
	M+npbs8ZQmmhwt+qleViV3k1qel8opqL2rQu/ZuDzYbeFxhF+0X4rf9xIf20KHdB6qFn3+1nXuB7o
	CcG+r4qzNrW3JmOUeOl7Xf/Jw+v69INw96kgRQE1OghgsE2TpvHSh7T9CEEOoCPXbIIVlAWuDoYDz
	0P4YDi9Sx2lc9PrxaGcXJ93suYhzVmG6SmjFpGrtKHuoxgOWsYr2jy+MxTx8xYyFMIdozgIGImdcJ
	366umj5/TyAca+Aq35+KcIKPRtbEwq3B+h99ekMz05KlNfRfGT8s1qNLCSJwNRxEqJVCPdlimWvc3
	CXHkPArg==;
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x4s4e-00000003CNa-1kDh
	for linux-mediatek@lists.infradead.org;
	Fri, 11 Sep 2026 03:37:23 +0000
Received: by mail-pj1-x1034.google.com with SMTP id 98e67ed59e1d1-398a5aad413so437514a91.3
        for <linux-mediatek@lists.infradead.org>; Thu, 10 Sep 2026 20:37:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789097830; x=1789702630; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=vTrVSBkVGPXm2gcTE8fmlqXbs+T/1ViJad0b75wnA3w=;
        b=Rld/lQVb/irJlh3tEp4hcc6hAzCAHiuTb+3JRDO/0anJI8KUV3OMDeBL7K/JyO715V
         sDnXCR+sPsKjbhTLuJdh4KycOocU8Futdn1iSlnODW7SVVRhckvoHwD8xeTMBHb05i2A
         thOF8jsCgiT989C+4T/sQ+JRJ05SUykSpinev8tlrH7xNcKW+hXICszwmHV+0Q4HkowC
         8kTJRfaRf2bs0x19CAVeDJ1DH/gelD62K5FRo5VocpkfsSOEXxkHpmcAqqgkgRDmQtBY
         HANvWr9XbROmzBSWRlR8vi7cnydOODk6bsj53YQt/aKrMSWwZjetLvhRMCGmJd+sroYB
         Asow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789097830; x=1789702630;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vTrVSBkVGPXm2gcTE8fmlqXbs+T/1ViJad0b75wnA3w=;
        b=PO3hv7uiGr9dhgDBT/Us83WBn+y33Ma0Ei/0tgG4OXukk8fSfTwwxlU1JwMWL66/eQ
         UeFXoqMlbcUI+q2iXI8l8RXNYz2M38zhNgDhJbN3bjUogD08srzZV/57y1pQeT59FYpa
         qwYmHn0iFN7qObXebMjwpsJekB+I7k6nN3kfOHjOKCYkZDW/QO2lTJvrvezogYeTC49+
         uQL438+8pFkzEmF6GGl9gNTHZKKrmyjgs7Y4X28NYsLdm7G3Cf4/ekK4ZG7g5PBq6wUs
         gk/KppnsWeW8lmDk0yDx/bEupgD+xtpuenSsh0jnLvuDnwUrK9LcjKJxmQBEJbwGbc+h
         6h5A==
X-Forwarded-Encrypted: i=1; AKwUvBzWs7z8zxjP75EBM/aW+b5LQo70T8NB8XTx4SU/Prl20GFCB3qCu2jRCvm5AwIUTlNJbK4D7UV4ZnGdkhzXWA==@lists.infradead.org
X-Gm-Message-State: AFuF++lALSMxGBUmAcWm5YFgnUrRrk5b57CQZtNziNvSq1HcFU3INkBZ
	ZeVSGSaQp58kl8PaEFWOH8zgKLaAAq1x0UzEaiCOrdsWeTp8KXliimA4
X-Gm-Gg: AYBFou3mb7hpBZ87Xg9wrfxjTui34PscuUJFmBpINxfSexchu65hT2/7NRKmH3ItIs4
	ToTNwP5k4aqvTarVLvHer5gABmqxKIpJjRKkaRyRmZuTKvM861dJnKdBfbhwfgIxGz4tS0KGInW
	elUkfRK4lT8X24+aiqd4PWLHfvGPHQLfpzfnv4K33QDfFPQZxTDmsrqKgvXw39TJBCj7QdpZQ7e
	XE4ZnahZ0Jm+xgFyATs+e5WKfi4byjOCUH3DfBnPmEMifbWNxj1JCJGhkMgFP7XGPoA2xncb/Ai
	51KWAtHdTLqL2lGKi+Xt0Zah3qx+OCY9SPb32897jqAa00vOvl4qPhJFbgASal+QtGsqkDVV4qs
	bRBC2y4Cf4GhcYJRh+IeW4J8q5lJfhTh83FbWfhYx2z684DCT22PldubYyRc9XiZj4zf428LPDO
	S2YwsqVFwrKBNAZf0p41h7PnSVX3jUcw38b7vwago14SJrfuPL0XrupXBsakyygngG7HoomG8xG
	SIUWJxcbqMpWtTzHt6m/Lw=
X-Received: by 2002:a17:90b:384f:b0:39d:8794:5564 with SMTP id 98e67ed59e1d1-39d9c1c016bmr3307088a91.12.1789097829777;
        Thu, 10 Sep 2026 20:37:09 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d95713602sm2537488a91.11.2026.09.10.20.37.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 20:37:09 -0700 (PDT)
Date: Thu, 10 Sep 2026 20:37:08 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Zakariya Hadrami <zkh@mailbox.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sean Wang <sean.wang@mediatek.com>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
	linux-watchdog@vger.kernel.org, zkh1@proton.me,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v5 1/4] dt-bindings: watchdog: mediatek: Add MT8127
Message-ID: <8bd4787a-1666-4f92-960f-287bc3b918a6@roeck-us.net>
References: <20260910-mt8127-amazon-ford-basic-v5-0-3cb9eeaffd5c@mailbox.org>
 <20260910-mt8127-amazon-ford-basic-v5-1-3cb9eeaffd5c@mailbox.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260910-mt8127-amazon-ford-basic-v5-1-3cb9eeaffd5c@mailbox.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260911_043714_971202_7873B4E1 
X-CRM114-Status: UNSURE (   8.49  )
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

On Thu, Sep 10, 2026 at 03:29:12PM +0200, Zakariya Hadrami wrote:
> From: Zakariya Hadrami <zkh@mailbox.org>
> 
> Add entry for MT8127 SoC's watchdog which is compatible with MT6589's
> one.
> 
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Acked-by: Guenter Roeck <linux@roeck-us.net>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Signed-off-by: Zakariya Hadrami <zkh@mailbox.org>

Applied.

Thanks,
Guenter

