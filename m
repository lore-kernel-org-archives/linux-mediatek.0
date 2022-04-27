Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CC2BC433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 Apr 2022 08:04:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=FON5qYerbzy0lE4AvUHewujKjHXu/R3rJVh+SoVlV8M=; b=FkfVzoWMiF0/IB
	LQJ8TCFJC+6aPPVrkKhQRpvHYpqz3/GST8tRzDponrB22FNM6yTDg+qU/4eT+OCCf6xKIwTynQlQh
	rzevWYtlVkTgYTZTjcwlKz8qHlq8fjcI7riIXwOugtKZsW6uI1B/e69rhhExOTxUPUCN8gJ90mpui
	QA37ColY2ltEywG3kDl86Rh1Gxurav/7sZ9yUAraydAhVGThWunAEXYk39WzfvOz9SaGvbJLkgrbJ
	1eI6+jARcQy6XcgkcSeho6C4a7qNn1M5Rapqh2rGBygWTLleLC3Q3Q6kuVBri1kAwNTxJau6TuwQA
	3agZHK9RWZv1Pd/nb3zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1njcfC-000TWU-0U; Wed, 27 Apr 2022 08:04:42 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1njcey-000TSb-19; Wed, 27 Apr 2022 08:04:31 +0000
Received: by mail-pl1-x630.google.com with SMTP id n18so904021plg.5;
 Wed, 27 Apr 2022 01:04:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=3VtMI1S/LllZ+nmEBlE73tPnnG9CJxB6us7YB7jLnx8=;
 b=VXYi68QhjRyOoK2LnsYtdP9DRRFpzKenrkxdXPYHzSgZ8JdhUAI4cS+/nx0KaZiBvz
 0CLJ6Ph1qVtRf+I7SLxzmWnWLCZpkWWHSgtH8HJto4ngcPfDNgeJ6Sw0FK8RrG912eZc
 Op4AMbt5/H4rCjY4NvJksUcPijmBTeCmq38LVChmEBSmFe66YzRka7ASuTIgdQEmbt/1
 Ra+ltZ/EKrmPg783D5pmKWlMBa0uPJ/UtNkCPXWiQh3DooVqgB8HHPWtGF/s5dDN0+SU
 D98hSS7LHF5JgtuOjiEE+QHNCrhBhlgDfZKe0b83+VfMe2rrsH1NnD247o0i+OWV33f4
 MUbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=3VtMI1S/LllZ+nmEBlE73tPnnG9CJxB6us7YB7jLnx8=;
 b=c2m61l8rrBVNbk98RupF49AiuZYsh5ums2nENsCXLgIyuWxWhrKSisPsLw9K8K3sPt
 WqzJ38jBO/cA+3Y0qWfbP6aXJN27oaN4+WBFYNPOEI7pZ0Bnd35i3ufOT1r8fB+rDSNw
 JD51+bw/QF/7z5H88CCO9agaFWAcQDr3L7XTKs6ws1v/Lc60BpucbgS5nHbxAfXXVd3i
 Loue/zDJ1qFoE/PmS1eYlho6TjcQbvVmH5IErHTUv4aEPeGj6IMM+yLcZS3KbROgmRIE
 L9DdG5VRHAD1cq5NWhK+Imy4GTmeUNsBFf0fx8+g8wRlN4TqbdkKsD9fEEbMVV0ClVSw
 3/1Q==
X-Gm-Message-State: AOAM533dQVWx1E1MHF8Aoz9AFPCzKp+jYZyV1qv12IMsYESzZ5iSQDpL
 UUOgeMtAQ2GfnOj17YpooA0=
X-Google-Smtp-Source: ABdhPJxQbosizE4aDS4kiUqMh2r5ZAGQxKQgEgRpq9qoqpBAj/UEpD/n50y9BsNASt2BOmdAFRZI6Q==
X-Received: by 2002:a17:902:7684:b0:156:25b3:ef6b with SMTP id
 m4-20020a170902768400b0015625b3ef6bmr27057189pll.39.1651046664600; 
 Wed, 27 Apr 2022 01:04:24 -0700 (PDT)
Received: from genechen-System-Product-Name.richtek.com
 ([2402:7500:469:f77c:f4fa:b753:7807:4e40])
 by smtp.gmail.com with ESMTPSA id
 a11-20020a17090a70cb00b001cd4989ff50sm1746750pjm.23.2022.04.27.01.04.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Apr 2022 01:04:24 -0700 (PDT)
From: Gene Chen <gene.chen.richtek@gmail.com>
To: lee.jones@linaro.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com, pavel@ucw.cz
Cc: devicetree@vger.kernel.org, linux-leds@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, gene_chen@richtek.com, cy_huang@richtek.com
Subject: [PATCH 0/2] dt-bindings: mfd: Add bindings for the Mediatek MT6360
Date: Wed, 27 Apr 2022 16:03:28 +0800
Message-Id: <20220427080330.40136-1-gene.chen.richtek@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220427_010428_128580_6ACA2C0A 
X-CRM114-Status: UNSURE (   6.85  )
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


This patch series add binding documen for mt6360 mfd architecture and
fix sub-device MT6360 LED

Link: https://lore.kernel.org/lkml/YmHK02g1pC19Oyh6@robh.at.kernel.org/

leds/leds-mt6360.yaml |    2 -
 mfd/mt6360.yaml       |  258 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 258 insertions(+), 2 deletions(-)


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
