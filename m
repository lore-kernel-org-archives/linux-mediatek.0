Return-Path: <SRS0=imyo=KB=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CC93C433B4
	for <linux-mediatek@archiver.kernel.org>; Thu,  6 May 2021 16:03:13 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 230F761078
	for <linux-mediatek@archiver.kernel.org>; Thu,  6 May 2021 16:03:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 230F761078
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=gi0jJs63kiGZrC/QBATCM9ge80acj4VWOX/n8UJcs9A=; b=Fuw+l6DxzKCDWPiwa6iPW0dU9
	AjGtFIZ12yLIo4LTzJ7bEbZf8OAlIvm4La95euyu2ToJZkrwuLaLrN47VS+xMjfym9XcaYlCUffS5
	ihRPaq+X8nCrFFVhWplr3WJKDyMwCRngm4HXbjrEtNgli31HvdKkuQm7CtX3hxTyCEX5IQh5BTjQz
	hc0rrRKceFMoJTUYOgUVKN6llWEvTGTjLbpIe49LDMH2Gew0y5yfFyq+eI1c65rVOfIOkiYtI3HMw
	fVSfS42N+P4h90MW71DdrY28IkAJXJmsf8jL+1DIrcATTnIfWMQlhkIYNSt4WYzHt4QzaV7vDor/i
	3hwuTLH1A==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1legON-004iTB-Vr; Thu, 06 May 2021 15:58:24 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1leg4C-004beb-VV
 for linux-mediatek@desiato.infradead.org; Thu, 06 May 2021 15:37:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=lzfTe4NYom6dNO0HLbV+l/ZlHA7iI3yej9+BU8sy+1w=; b=Vi+l2wGx6v8qlAt8Tv/xCoPGJ8
 q+GAu3cqAXMMcIOyyb0U6SCvZHpcOjKJaApV3do3E3us7lXlzQx7F5OO2/CefUybvqURqYT+MJbCu
 6CFQbK0OTuGWYRe/3kU/2ZeKQfIMAbtfBzldboEnRE+yR2FVRjkUl/Bfjnr1ZTk+VjBz+qi7S+CEm
 1V/VwdJ5rFLVAZ0foax2NhDNAHLdGrSlXjwM04kF6+B+HqH/dsc97FGRH5clWj20EI6tmlcuxDc4/
 Bmv1RslG2f78ADyeWMaTnm8gKXBKDXl5a9oSAPTtPRyghSqWaHWZS4tEQVk6EqNxbH7l/EeKAIaEj
 BeHc/Mbg==;
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1leg49-006ALq-Tb
 for linux-mediatek@lists.infradead.org; Thu, 06 May 2021 15:37:31 +0000
Received: by mail-wm1-x32b.google.com with SMTP id
 y124-20020a1c32820000b029010c93864955so5539015wmy.5
 for <linux-mediatek@lists.infradead.org>; Thu, 06 May 2021 08:37:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lzfTe4NYom6dNO0HLbV+l/ZlHA7iI3yej9+BU8sy+1w=;
 b=TxdA95xr9NvNrTqX2glo6DuRNrRFdtE85RIavTmpnvW546k6YjimPwfcuVXjPXwcCF
 rrK12TcDVC4TOR2Im2bSV/5Yt8oQIBx+4nJAz4z2gtd9vqerj6maM/0xDbDVFmZnyM9F
 anOYodAQO5oPW2skhSrdXa1+8OtfiT2mvIN43vmm7ay3ZQnjl86L5QGRqasdLcjuj4VZ
 kqB1avcVQUTFGE2xB6GGkogTe5nzZQJfSIMi1DtOybpVESuhxLSMPzDdNolXzZozqs9Z
 6nnYEfwk1Nn6qNLfjkvh6nYCxUBmw6feIndbTkCIpVgS7L7pm7J25YajIHH5XTHtkk1S
 n3Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lzfTe4NYom6dNO0HLbV+l/ZlHA7iI3yej9+BU8sy+1w=;
 b=FUpsVpuMJyXo/umVhWjK4kq0kY7Ngg9lUFGpvOJTTJ+kwso7PttVEvseZoqA1c4t0h
 yI4GEUynlLq9pKPKdYxtLNXNFkhJkzJ/+nCJfyE/GRzzU62KpRU/chwfxnq3iur5Sl6P
 pV2O3I7+U4xFczVItHeFipbqN4aEWkGdZt2zNhmDdSYgfkewfbKF1JE9VJwbk5WNL09A
 8Gap/iNusXJJSjN3+5VCxB8OkRLAww2eGL5KuFrK1c1nRytH+82egtApk1wCXOIUZyVC
 IrAvgD+ufM0WtiXANr3gRuKwcO5BOC2Ug6gOchl8jsPEFTKd4HO5g9BFu9doZ32CYVL1
 +EBQ==
X-Gm-Message-State: AOAM532mUXHv8qSIBfz8sRNRHRztADkiWgFjucMe+6alAeDqh9dGgMSK
 DdPyvGqR9fgwcRWcV+0ErGtZrw==
X-Google-Smtp-Source: ABdhPJxnDa8+QB/P9YvBx7Q0p5ZbONAbd3z3myIbhHyV4Pm3jy9jW1JOlvP0Wp/CbE3H9YaEACRDgg==
X-Received: by 2002:a1c:7205:: with SMTP id n5mr15842002wmc.131.1620315448603; 
 Thu, 06 May 2021 08:37:28 -0700 (PDT)
Received: from groot.home ([2a01:cb19:826e:8e00:5fe0:3a70:ad4a:a29b])
 by smtp.gmail.com with ESMTPSA id o13sm3788673wmh.34.2021.05.06.08.37.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 May 2021 08:37:28 -0700 (PDT)
From: Mattijs Korpershoek <mkorpershoek@baylibre.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>
Cc: Fabien Parent <fparent@baylibre.com>, linux-input@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Mattijs Korpershoek <mkorpershoek@baylibre.com>,
 Rob Herring <robh@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Subject: [PATCH 2/3] dt-bindings: input: mtk-pmic-keys: add MT6358 binding
 definition
Date: Thu,  6 May 2021 17:37:17 +0200
Message-Id: <20210506153718.256903-3-mkorpershoek@baylibre.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210506153718.256903-1-mkorpershoek@baylibre.com>
References: <20210506153718.256903-1-mkorpershoek@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210506_083729_976648_2A424C87 
X-CRM114-Status: GOOD (  12.20  )
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

Add the binding documentation of the mtk-pmic-keys for the MT6358 PMICs.

MT6358 is a little different since it used separate IRQs for the
release key (_r) event

Signed-off-by: Mattijs Korpershoek <mkorpershoek@baylibre.com>
Acked-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/input/mtk-pmic-keys.txt | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/input/mtk-pmic-keys.txt b/Documentation/devicetree/bindings/input/mtk-pmic-keys.txt
index 535d92885372..9d00f2a8e13a 100644
--- a/Documentation/devicetree/bindings/input/mtk-pmic-keys.txt
+++ b/Documentation/devicetree/bindings/input/mtk-pmic-keys.txt
@@ -9,7 +9,10 @@ For MT6397/MT6323 MFD bindings see:
 Documentation/devicetree/bindings/mfd/mt6397.txt
 
 Required properties:
-- compatible: "mediatek,mt6397-keys" or "mediatek,mt6323-keys"
+- compatible: Should be one of:
+	- "mediatek,mt6397-keys"
+	- "mediatek,mt6323-keys"
+	- "mediatek,mt6358-keys"
 - linux,keycodes: See Documentation/devicetree/bindings/input/input.yaml
 
 Optional Properties:
-- 
2.27.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
