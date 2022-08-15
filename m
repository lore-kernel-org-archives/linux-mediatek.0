Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C442C00140
	for <linux-mediatek@archiver.kernel.org>; Mon, 15 Aug 2022 09:11:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x5c01E7cObCgh325Qd23DlOZuK03/1+TgA9EfmEhXiI=; b=2p8s4Ml8wchY53qyf1Ps2QEjGK
	TBoy7/sb/kGgTpTeT62E9NHiY0aK6oHOZfhbQFB4B65h/hL0NXDCJutdVPvqEgH3tlb9yAVI545t5
	ljp9FFwOwaAMs5MT/dI/plbtvD2sDjnQlJrZXQP5EYhRdZ2a4irw4q/KDOZ3LQeSQ6EHe4FB6UU4w
	cRCsZCitOBm+xlWmJhR1Pki5RV7aUcJ1iC89UTuglywHJYTy183d+dwTYG4uuUYlmDPXplXL7CS0V
	4RjTtARoM9pajfZNUp90MUOupKzZDxX2mKACxJEFDM/k8wMnFnnFY3OSTScxhYAgiwMWm/euSSIbO
	MIyioAGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oNW7Z-00DdjB-HA; Mon, 15 Aug 2022 09:10:53 +0000
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oNVzZ-00DXSd-G1; Mon, 15 Aug 2022 09:02:39 +0000
Received: by mail-pg1-x536.google.com with SMTP id c24so6023241pgg.11;
        Mon, 15 Aug 2022 02:02:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=x5c01E7cObCgh325Qd23DlOZuK03/1+TgA9EfmEhXiI=;
        b=n23cIOUnS7wGzWf2/WKIwPZnDaiVkh7Bw1qWkzrnbWWsNbIaj82HyXguuN2QeLcEmF
         JnTerZuW2v5tzohkNapXRpGyHw/jl8O+Bq6Z1ZJTPGaCLYNaowSXC/zxlloB6Xak6OX8
         zIDhfYpDEFmvIHDO7yl+xsgrWV9lcKRYsyrN5016afz42s8ppIZoSi8wNR9WvPtV3u1o
         6Op1Saf/13DZrHIge+7tw5H3KTRHRZY6nc0LLRrJgk/j6QtjKGpXToLwU4Ngkw410Ugk
         dE48ZKXL0kM9H1ROs+s4lx0EeQhTq0OVA3CdRXx3jCs7bH3IMN7zW1+Jni59m/PB46Ea
         QnbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=x5c01E7cObCgh325Qd23DlOZuK03/1+TgA9EfmEhXiI=;
        b=E7AlnS5Aq6bz9bAcm31MSceDRFjhGOddC+zBybcNKLa7C7SrJI2ftjuEia+aP+fU33
         v5tL2THau8fF8q5CxJkb4E+d4c0y+fwLhnas7AMYMJrO0H2iv56cA/JhyuT0VXApvxSG
         EsrXuAqvrN4OIwUaHe41Om4U2uN7KWGAUiAnKOQPsJlEabeLYqkE22071Ao9GBO99b+6
         uUViKvpCJdksGgBhkorBGpToBhnh4BQQ8SN02MyL8Z0M1jSSuXTGvrRDA8cppTd0Z1DV
         yO+JsRNInhMH3R2A17obGwkE1vrGw18n8OEoew+hO46/VZjFOK7ctuTe0NiG0CuLRP8B
         opXw==
X-Gm-Message-State: ACgBeo3q0z7wHbUo5kDNp1iMQA0miIKrP2DXdtmdqcV4Ny+/xhY0GpqJ
	XbcchXcjNgJtlLvwrA8WVmc=
X-Google-Smtp-Source: AA6agR6QcylJrjojhoBCQF/tkCRHXF/L3Lw0QYLHX52HspD4U5HkkuiRt7lOteR2Lov1ozcfoK0s/A==
X-Received: by 2002:a63:5201:0:b0:41e:2089:7174 with SMTP id g1-20020a635201000000b0041e20897174mr12997948pgb.519.1660554155392;
        Mon, 15 Aug 2022 02:02:35 -0700 (PDT)
Received: from DESKTOP-IBN2BAQ.localdomain ([123.110.155.185])
        by smtp.gmail.com with ESMTPSA id a17-20020a656411000000b00412a708f38asm5491612pgv.35.2022.08.15.02.02.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Aug 2022 02:02:35 -0700 (PDT)
From: ChiaEn Wu <peterwu.pub@gmail.com>
To: lee@kernel.org,
	daniel.thompson@linaro.org,
	jingoohan1@gmail.com,
	pavel@ucw.cz,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	matthias.bgg@gmail.com,
	sre@kernel.org,
	chunfeng.yun@mediatek.com,
	gregkh@linuxfoundation.org,
	jic23@kernel.org,
	lars@metafoo.de,
	linux@roeck-us.net,
	heikki.krogerus@linux.intel.com,
	deller@gmx.de,
	broonie@kernel.org,
	mazziesaccount@gmail.com,
	lgirdwood@gmail.com,
	andriy.shevchenko@linux.intel.com
Cc: chiaen_wu@richtek.com,
	alice_chen@richtek.com,
	cy_huang@richtek.com,
	dri-devel@lists.freedesktop.org,
	linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-iio@vger.kernel.org,
	linux-fbdev@vger.kernel.org,
	szunichen@gmail.com
Subject: [RESEND PATCH v8 06/12] lib: add linear range index macro
Date: Mon, 15 Aug 2022 17:01:19 +0800
Message-Id: <20220815090125.27705-7-peterwu.pub@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220815090125.27705-1-peterwu.pub@gmail.com>
References: <20220815090125.27705-1-peterwu.pub@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220815_020237_672695_869B9748 
X-CRM114-Status: UNSURE (   8.41  )
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

From: ChiaEn Wu <chiaen_wu@richtek.com>

Add linear_range_idx macro for declaring the linear_range struct simply.

Signed-off-by: ChiaEn Wu <chiaen_wu@richtek.com>
---
 include/linux/linear_range.h | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/include/linux/linear_range.h b/include/linux/linear_range.h
index fd3d0b358f22..fb53ea13c593 100644
--- a/include/linux/linear_range.h
+++ b/include/linux/linear_range.h
@@ -26,6 +26,14 @@ struct linear_range {
 	unsigned int step;
 };
 
+#define LINEAR_RANGE_IDX(_min, _min_sel, _max_sel, _step)	\
+	{							\
+		.min = _min,					\
+		.min_sel = _min_sel,				\
+		.max_sel = _max_sel,				\
+		.step = _step,					\
+	}
+
 unsigned int linear_range_values_in_range(const struct linear_range *r);
 unsigned int linear_range_values_in_range_array(const struct linear_range *r,
 						int ranges);
-- 
2.34.1


