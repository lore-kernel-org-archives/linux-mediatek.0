Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17C68C4345F
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 Apr 2024 15:09:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8OKO6D6+Uymjr7y5phUxNbL6FrIK2B37/+KaDSdt/b8=; b=fvA2PVPfBjaSTIf/QJIVWuHi4D
	Zfu6b/TwpB9oEZQqvCPH36i69fDCplKii3mw1cxVBc26BrvBzG2KlQUrzE+hKXoEjEc5sA54LK0g4
	FjNRFqiD/y9qTrvPQsmVJNKPkDXDSYO+4B62FYus2KaBYR5gqZKTftsd1M4kOx29BBIh/EJJmQJG8
	I4fR/G8uTn40NxVp14wI3Od5QzYQbmUMyXKbJJ94WgFJpGY/ODaPkJRG+7LqL6ull7XSF7aGviPyJ
	h6+VEJUxOm8HusyPK9dhgez04OADj6FdTXE6ure0nIxS6x0235JWJUPiD5KYd06ZSbjDJ1m53A3zF
	6LF44KhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1Scr-00000003HuF-2BnU;
	Mon, 29 Apr 2024 15:09:05 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1SaG-00000003GFc-1Uzn
	for linux-mediatek@bombadil.infradead.org;
	Mon, 29 Apr 2024 15:06:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Cc:To:In-Reply-To:References:Message-Id
	:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=8OKO6D6+Uymjr7y5phUxNbL6FrIK2B37/+KaDSdt/b8=; b=UtBXE412iV8DROFNtXP7jSuqzl
	pFvFG9UrV7iK6fBhqY0Ce6uoC+W+NPUgxg0JDOiZVThEq4pAiH587v+f7MP5vqCPQvjEDtbG9y7dr
	ECX6nNhVBvPDb41lACEW4Y48N7if88uQRsEiHzSaPLP/cRDIY/KJFa5i756hOA9NvQ4ZPAgVLMqKa
	vIhye/y9pgs49tfdRC830nvV+LCcsa0KI3pCK6PKFYdA84gtbGAasMc0xGn+1CnfYYrx6qgLn1AMU
	2m59OgeIn8+7LCGKah0wBf/TurB0DUTEFE+jgHYOFYryQAzNZcsNH/5V6fKGXTJEazPAALQhyDF2Y
	yzXYMPXw==;
Received: from mail-qk1-x731.google.com ([2607:f8b0:4864:20::731])
	by casper.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1SaC-0000000Cfma-0afy
	for linux-mediatek@lists.infradead.org;
	Mon, 29 Apr 2024 15:06:22 +0000
Received: by mail-qk1-x731.google.com with SMTP id af79cd13be357-790f699eb2cso103554085a.1
        for <linux-mediatek@lists.infradead.org>; Mon, 29 Apr 2024 08:06:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1714403104; x=1715007904; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8OKO6D6+Uymjr7y5phUxNbL6FrIK2B37/+KaDSdt/b8=;
        b=PCGMOXK4kni3Fq7Jv1fZQhoEsWOlcmRCCBErk1okOvO2/+VWEabUGsbBAmQsOVoYjG
         kL2fh4EZb6/coGRNeK2ymqEmFCqjg9mASpCj2ckdzoAgCHMpW8Bc68NuC21UseY2B8yL
         P5WHZFqCJfHtaiZVMZ6BQZwwIaYtl17JSEvUA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714403104; x=1715007904;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8OKO6D6+Uymjr7y5phUxNbL6FrIK2B37/+KaDSdt/b8=;
        b=icjZoqj9Nqbs3gY5hJd49Yum7HlZPdppqXlfOlLlKdkJI4n10sHqBNqTswx6xvwfqc
         KuaUmx5VEOGIgbbYSVzd6jhugT9Oj7aWUkrFmJ6ZVihP8yd6H/6TpSZYVyJ/vy53eDKk
         KTKuSJgnOT0EcTqCDt+0kIpYP79CKY+4ukGM0rzuantXJR2zaMAqdIDC4CqX51J7RCBp
         8D5NsDKCwAXzqJAmYC4HJvSqNxL+IPADiICyc0gOR4zQclSVradM1uKjkqwzD2UAG7se
         QzxQtoyUJ4Bltaq9ig+9/kHT5RIwkVbxqSznQZ5JS6sfVnnQygvFvMqz5FN38wB/TUkr
         aCAw==
X-Forwarded-Encrypted: i=1; AJvYcCVNNdvCQp0HlDtRD+Ls69z8qCkvVmGyzP1HW14RcSAodzwrmL4WFZ3n2zgz/+26yZCrU4l9Wn75hSLUhqkA1tbFQtTpoOM5/WKTbTZ18Zx0iHKF
X-Gm-Message-State: AOJu0YwRSuk8rp1VhgW9vBFqFbKbUzNC5YKdRWehGTO1nycx4O4ptA7c
	diKwM+YlTxa23duTaz+K4HgT8To77vjHp8ILC05R1DaIKgeP+R2xbz/5z3A3ow==
X-Google-Smtp-Source: AGHT+IFaMtke8GiK3PVK81BO+wCQ6+s/afNMwPPBZtmDsaryJW0dODmZmCJQPhu+Legma0gxWaBb/A==
X-Received: by 2002:a05:620a:561c:b0:78e:d4f6:3949 with SMTP id vu28-20020a05620a561c00b0078ed4f63949mr12152221qkn.25.1714403104299;
        Mon, 29 Apr 2024 08:05:04 -0700 (PDT)
Received: from denia.c.googlers.com (114.152.245.35.bc.googleusercontent.com. [35.245.152.114])
        by smtp.gmail.com with ESMTPSA id p7-20020a05620a056700b0078d3b9139edsm10568591qkp.97.2024.04.29.08.05.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Apr 2024 08:05:04 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 29 Apr 2024 15:05:00 +0000
Subject: [PATCH v3 21/26] media: i2c: st-mipid02: Use the correct div
 function
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240429-fix-cocci-v3-21-3c4865f5a4b0@chromium.org>
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
X-CRM114-CacheID: sfid-20240429_160620_242399_24C304A1 
X-CRM114-Status: GOOD (  10.70  )
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

link_freq does not fit in 32 bits.

Found by cocci:
drivers/media/i2c/st-mipid02.c:329:1-7: WARNING: do_div() does a 64-by-32 division, please consider using div64_s64 instead.

Reviewed-by: Benjamin Mugnier <benjamin.mugnier@foss.st.com>
Reviewed-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/i2c/st-mipid02.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/i2c/st-mipid02.c b/drivers/media/i2c/st-mipid02.c
index f250640729ca..b947a55281f0 100644
--- a/drivers/media/i2c/st-mipid02.c
+++ b/drivers/media/i2c/st-mipid02.c
@@ -326,7 +326,7 @@ static int mipid02_configure_from_rx_speed(struct mipid02_dev *bridge,
 	}
 
 	dev_dbg(&client->dev, "detect link_freq = %lld Hz", link_freq);
-	do_div(ui_4, link_freq);
+	ui_4 = div64_u64(ui_4, link_freq);
 	bridge->r.clk_lane_reg1 |= ui_4 << 2;
 
 	return 0;

-- 
2.44.0.769.g3c40516874-goog


