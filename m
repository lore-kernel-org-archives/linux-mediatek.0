Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD5A5C4345F
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 Apr 2024 15:06:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/qUCWhD1zt8bKcdbs6yESnMSEdigGZ2fB7xO4uH5zQE=; b=utMqpzE7vOug0PCfMbwvhQSPBt
	aq0puLzFpgjB6c8w3YZjji8hspZB5KJPF9DNwyhb4bDDpuspkbevgkmuj9ZOy0Vuve4EzSjszA6zS
	U5QYVpbJhqaFKN9RbYHpjqxeg2m0vRwxgtkh57PHwe1DC5xxxZw6sgjPfreQPDKvxp+aYU7zZ/7je
	Lh8j54niGJh2v88Qmi5nCCJT/5f2qyXLgnc2iQTbgcFzzd+XzVLz5SX3VRheFmdH+IA4FESvEj66+
	DsFpWcdW2kv3YXz7a3nK04JHxFRgu+PX9yAfU8JdRJKqyrGvvXBe1f0ZN8kAJJjPDS1EalteutTLN
	1AOYunJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1SZw-00000003G4f-1wKA;
	Mon, 29 Apr 2024 15:06:04 +0000
Received: from mail-qk1-x72f.google.com ([2607:f8b0:4864:20::72f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1SYl-00000003FKU-3ct9
	for linux-mediatek@lists.infradead.org;
	Mon, 29 Apr 2024 15:04:53 +0000
Received: by mail-qk1-x72f.google.com with SMTP id af79cd13be357-78edc49861aso344054285a.3
        for <linux-mediatek@lists.infradead.org>; Mon, 29 Apr 2024 08:04:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1714403090; x=1715007890; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/qUCWhD1zt8bKcdbs6yESnMSEdigGZ2fB7xO4uH5zQE=;
        b=PLIi0Cj56Q3LqJnD9UFb8RVKb4xjk66YKjTMUbPqVZ3Hhui/VPbAgdDT6hIg+76yMT
         aSjvAeV4twSIjC1ZgdkxfpGFmNeRrqvxrBW+m9Ado+DlepEiRQ6JdsieguxJvZkl3roE
         cx7HOK6M7YtBOvFX7couxpV7FK4x3vbrcI0eM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714403090; x=1715007890;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/qUCWhD1zt8bKcdbs6yESnMSEdigGZ2fB7xO4uH5zQE=;
        b=FqXLyfhL3i4VqzWMzJntJEho1FBsY865KyJld3IG/RoeM3ReiVRghHtsHGII7cAQ1/
         zNinRmsvRL2FtYe1fZYp0V6BGgXGO2TJYd80o5DpMKXv2noOj2E/Er/Vhfb5UD7Er9Kn
         MWuRgzmFh1eXuF9fniXYJVOHJNNbyLrj1gY/5FENDkP075tPbYHk4RqaZ2JuHoCevLXk
         Q53V2ZxiliUDvZXdsK8f+aoTfu3VKsrxNwW3QwqO/pgI9lq7BonZVD0Z8xI471lhu7L3
         GnF3kgGiTh8s8dAwCOOBBMQoSKCGtLh/zbbNh6t9fX45jM3Jddyc7LHYuYkqex4v/REP
         9YDA==
X-Forwarded-Encrypted: i=1; AJvYcCVUar6elA68xG3dFWPDKZiWUZb7y1kB2ZII32WH7sM/eBAUA2lwfsfUmMtVZKiyvxYt/piMmQvbPbMNBBEGNdF9QgRngcQ0o1u4n6okDd3nny+I
X-Gm-Message-State: AOJu0YygLu93ODdGHoerZpqAs9EzFK3ZwXOuqvOuwK9nPfv3pB6+oQ4W
	BBCty3hxzwTZZ18ryhnztI1cUIXYcVcex2sTzK42SsbRPYNE7OE1vxwczPCYaQ==
X-Google-Smtp-Source: AGHT+IHHKi7cqnMpYwnQDIZ9akhXG6vV1AIqNbLdBOwmjaLKTCEqbKtGqVQAHlyIVFw/U88/GLAn3g==
X-Received: by 2002:a05:620a:4591:b0:790:fc14:60ac with SMTP id bp17-20020a05620a459100b00790fc1460acmr2298793qkb.0.1714403090344;
        Mon, 29 Apr 2024 08:04:50 -0700 (PDT)
Received: from denia.c.googlers.com (114.152.245.35.bc.googleusercontent.com. [35.245.152.114])
        by smtp.gmail.com with ESMTPSA id p7-20020a05620a056700b0078d3b9139edsm10568591qkp.97.2024.04.29.08.04.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Apr 2024 08:04:50 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 29 Apr 2024 15:04:46 +0000
Subject: [PATCH v3 07/26] media: staging: sun6i-isp: Remove redundant
 printk
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240429-fix-cocci-v3-7-3c4865f5a4b0@chromium.org>
References: <20240429-fix-cocci-v3-0-3c4865f5a4b0@chromium.org>
In-Reply-To: <20240429-fix-cocci-v3-0-3c4865f5a4b0@chromium.org>
To: Martin Tuma <martin.tuma@digiteqautomotive.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hugues Fruchet <hugues.fruchet@foss.st.com>, 
 Alain Volmat <alain.volmat@foss.st.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, 
 Sowjanya Komatineni <skomatineni@nvidia.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Hans Verkuil <hverkuil@xs4all.nl>, Sergey Kozlov <serjk@netup.ru>, 
 Abylay Ospan <aospan@netup.ru>, 
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
 Dmitry Osipenko <digetx@gmail.com>, 
 Benjamin Mugnier <benjamin.mugnier@foss.st.com>, 
 Sylvain Petinot <sylvain.petinot@foss.st.com>, 
 Stanimir Varbanov <stanimir.k.varbanov@gmail.com>, 
 Vikash Garodia <quic_vgarodia@quicinc.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-staging@lists.linux.dev, 
 linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org, 
 linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.12.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240429_080452_080147_68D569C3 
X-CRM114-Status: GOOD (  11.70  )
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

platform_get_irq() already prints an error for us.

Found by cocci:
drivers/staging/media/sunxi/sun6i-isp/sun6i_isp.c:389:2-9: line 389 is redundant because platform_get_irq() already prints an error

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/staging/media/sunxi/sun6i-isp/sun6i_isp.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/staging/media/sunxi/sun6i-isp/sun6i_isp.c b/drivers/staging/media/sunxi/sun6i-isp/sun6i_isp.c
index 5c0a45394cba..58f8ae92320d 100644
--- a/drivers/staging/media/sunxi/sun6i-isp/sun6i_isp.c
+++ b/drivers/staging/media/sunxi/sun6i-isp/sun6i_isp.c
@@ -386,8 +386,7 @@ static int sun6i_isp_resources_setup(struct sun6i_isp_device *isp_dev,
 
 	irq = platform_get_irq(platform_dev, 0);
 	if (irq < 0) {
-		dev_err(dev, "failed to get interrupt\n");
-		ret = -ENXIO;
+		ret = irq;
 		goto error_clock_rate_exclusive;
 	}
 

-- 
2.44.0.769.g3c40516874-goog


