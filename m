Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5198DC88E7F
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Sep 2026 09:03:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eb3xZy75NQGOxtpcjzjk4/qG4sLL2mvyNHZ62g17sL0=; b=giBCIzQTiFBV5FrY099mlxSUGd
	cE+snUqV3BtI8TajuXO4FBBI2tn2R7YqBfEltpouWFwAXsUEniIbJIrAbYQBO+1A/0XYatJKXBd2Y
	7EL1nbeTBbuLdFprh7Ges10CLGYqZptNdUrl4tIRaxaM1fK5gvUUyrB3t65jh8dqerfh/ks5j5nx1
	1yj15yxu4bndLGaOgTjaq+SbAVJBI/5lfQZEFf3KE4gO2hx9kV9ZqdrhC5Di/+Kum6XxoKGpIVzEK
	BJxPfT7Ka3HgwSqwctOKbJUpPoMcpN/VacTCQzZmjd/V/q90eJocEtYS8zWsipGlT4y9nAkwuXrBY
	rgNcMUoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6P4E-00000005ipu-0L7O;
	Tue, 15 Sep 2026 09:03:06 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6P4C-00000005imU-0wkV
	for linux-mediatek@bombadil.infradead.org;
	Tue, 15 Sep 2026 09:03:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=eb3xZy75NQGOxtpcjzjk4/qG4sLL2mvyNHZ62g17sL0=; b=YBZ0whBgq3iGvUpjlQPL8SqbQ7
	FF+e8smNWdCzFeHPpViRhEpvSmKcnzD3qk+xWMGWmMSZ5T3bXHfaZ65H7B0UY6E4EsXUCn31/yl9J
	1Ibk1Gva8XrLPRA6tpe3I/9pucYKTHQ0HUSQrX5WWrPrdGm2sO3wnXXhUjL/P7GNR0a3msTmfuyHS
	swby5gBlu7sw6sWnYuyhGMv4tuBHyn5jJ1Su4tvEs74vTlTfFK+WKYrmlQM5jU4GiMnZTzwhUrbD/
	ShWMojnUsA22Wq1hS7Y8dGLe7JSfx34R06ioiLVKKjIaci+lg6RX42U5QGEk4ux08+JtA4hu99QoB
	owFw8CsA==;
Received: from mail-ej2-x10.google.com ([2a00:1450:4864:34::10])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x6P48-00000006TFw-1YQe
	for linux-mediatek@lists.infradead.org;
	Tue, 15 Sep 2026 09:03:02 +0000
Received: by mail-ej2-x10.google.com with SMTP id a640c23a62f3a-c29d50b7cf9so10091266b.2
        for <linux-mediatek@lists.infradead.org>; Tue, 15 Sep 2026 02:03:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789462979; x=1790067779; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eb3xZy75NQGOxtpcjzjk4/qG4sLL2mvyNHZ62g17sL0=;
        b=owjzPWMiRz7QE0RyK5Xi940Bz8Uvu3czTJb8KLevFskcD7Lk/IRFEoCdY+JIql885t
         YRatLzAMJMQJIpEOTsHc1kAhTyUia687H4k+ZYiPF4YiMFDmSgnnn790SaOAQF3eXHb4
         Mkif3VAhpY7XWBcx8VWdN8zITtWC7PTkKGdTiykGIuZkKV4CfOwfP5bF/+uGLEujghCU
         TUTYYG/ZHkEPRz9wi9URYasVyoWiVHTiAWwpHhDWjk5v6EPyXqxTpRC8mAu4i8T8Ttbl
         rXE3R2j9dMM3K2dTv0i1aoXcpldoJSc+z7wuhsGf3mdCNe4mzx/9c/mXpngNlf1xSuiM
         q7uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789462979; x=1790067779;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=eb3xZy75NQGOxtpcjzjk4/qG4sLL2mvyNHZ62g17sL0=;
        b=hPrTKJ3BXDLUb6D6e9NmS9adF5Ll8Qw4vu9MThfijKckXcVlYwAN6aM5CWs5vnPLsv
         QulfuNX+pN7syQWTkBsET6ArE79LQIJt5ZwijjuKDa9ZUzbSCKIyE1C/NZ/xCJs7MkM4
         gG87MwvzRNNfZjQ5/WBhV+rHL6GwkhaO4dH5WRwk+lZRBpU0WnGRMy8LVdPXNxlFAE/J
         agu9ZOI5FT9Nxdd4SAWc+k6AerP9SLeoIzvha3StS2C198I+rUmuFZmR7vhtFLNDdjwY
         Eje6sovcBW4M8e65dSg0JyYPR07xa7guXlyHa08Io6m9Vo5m7FZ0yrIwdIOk7f0hqoEM
         9FIg==
X-Forwarded-Encrypted: i=1; AKwUvBymLOikZaSxPlRuUjgn3yyCAbZV6SZ1opoZvXkruHxMRicGGU0aOQg+SCcf1/4ojDfTwY2JGMltqbGHoxSNQw==@lists.infradead.org
X-Gm-Message-State: AFuF++nxdPOTXt+GmW2aj0JR6aUIbBhRNnB7+nNsmCR22zGAXVn1spyt
	FQDEZ2qf8A1B/xSD2zVkSoKtWdx/0djgFlkPnl6MDEDyoz/B4GqZUcC9
X-Gm-Gg: AYBFou1RAmoGZKsXJxkizXjISjVamVl+VRQlgRu0tl7jslTH+JTLOH6rEdkXWIH76Fm
	WmSpe544aV54echeDiELgV5uDRIwUVh/tN/bw2S7E029Sbu7d7SA7crmNXruRwlMT/jV/EMMis6
	8LpbSqmk5r8J53KslFVhfK2qa4687f6WBdomtomtw9iWh2ujnj3VHKX9wDBXsSMEWzX0fOSii7m
	W+mv5eyRwDusHTl7ZSErncubddxED5RYwiU5pfuklBuNbDT/OJMOp6Wy8GFUKYEWC4KXfJW6J7z
	pZDpFvKb81cQhBZGEVngALVbgUMyuo/9QoVBbvuRIxgF17pYL4hgLR15OV59del91qR9/Evtciv
	r3rxaPCv74s5MRE9PdavnjPRDCqxK3sdaaIlTQw2IkGr4EWYqx13x0+eb94frhoiRxLEpPaCyZs
	TKPYevQC7M7tmkZbcRN9uNT4VPhUcIMpCXu+fNs1QCTeoEiRljWjrf920Dg+/9Xx1jeLpLs1UcE
	0YSOZPgJaZGrG2y0hm1e1UYTNwBYQfEaK/hVfBzW9WnfpLf9a0lAtrNXsgoILmKahigEUGcqTNS
	OZchFdrd7OBJN9KrDd7Xg85IxCSWuBavewB5DWUO5bUb7T2kIFDGazEkNfHjP8pJqT3HOGMlzWd
	2rxf81ShJ/qzsG2KcaycKJtF6A80R9Fc+ZIKEV7T7V5r5ltcVCsc2NOX/mLMkCoY2t1HnC4TCTF
	9aIDScU5EdGSL/eQEy7iRI8VB2BOngarhjm5HReEqlsyDT/wMmwKZXKS+MKR3KR/ZmFBuRSSXoz
	Z0Wlu93sjs=
X-Received: by 2002:a17:907:3c86:b0:c29:60c1:7e55 with SMTP id a640c23a62f3a-c29d7794becmr17686466b.12.1789462979111;
        Tue, 15 Sep 2026 02:02:59 -0700 (PDT)
Received: from cs-280612103108-default.europe-west4-b.c.oa7bb030819b2a894-tp.internal (88.71.12.34.bc.googleusercontent.com. [34.12.71.88])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2965c4cf01sm546369266b.1.2026.09.15.02.02.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 02:02:58 -0700 (PDT)
From: Joshua Crofts <joshua.crofts1@gmail.com>
To: Peter Chen <peter.chen@kernel.org>,
	Pawel Laszczak <pawell@cadence.com>,
	Roger Quadros <rogerq@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Mathias Nyman <mathias.nyman@intel.com>,
	Chunfeng Yun <chunfeng.yun@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	stable@vger.kernel.org
Subject: [PATCH 6/6] usb: cdns3: add missing pm_runtime_dont_use_autosuspend() call
Date: Tue, 15 Sep 2026 09:02:23 +0000
Message-ID: <20260915090223.1346-7-joshua.crofts1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260915090223.1346-1-joshua.crofts1@gmail.com>
References: <20260915090223.1346-1-joshua.crofts1@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_100300_578638_C03481BF 
X-CRM114-Status: UNSURE (   9.44  )
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

cdns3_plat_remove() calls pm_runtime_disable() on device teardown, but
doesn't call pm_runtime_dont_use_autosuspend(), causing resource leaks.

Add the missing pm_runtime_dont_use_autosuspend() call.

Found using Coccinelle.

Fixes: f738957277ba ("usb: cdns3: Split core.c into cdns3-plat and core.c file")
Cc: <stable@vger.kernel.org>
Signed-off-by: Joshua Crofts <joshua.crofts1@gmail.com>
---
 drivers/usb/cdns3/cdns3-plat.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/usb/cdns3/cdns3-plat.c b/drivers/usb/cdns3/cdns3-plat.c
index e3f32c3e9535..b85d5d1c48fd 100644
--- a/drivers/usb/cdns3/cdns3-plat.c
+++ b/drivers/usb/cdns3/cdns3-plat.c
@@ -219,6 +219,7 @@ static void cdns3_plat_remove(struct platform_device *pdev)
 	if (!(cdns->pdata && (cdns->pdata->quirks & CDNS3_DEFAULT_PM_RUNTIME_ALLOW)))
 		pm_runtime_allow(dev);
 
+	pm_runtime_dont_use_autosuspend(dev);
 	pm_runtime_disable(dev);
 	pm_runtime_put_noidle(dev);
 	cdns_remove(cdns);
-- 
2.47.3


