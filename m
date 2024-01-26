Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E84B7C47422
	for <linux-mediatek@archiver.kernel.org>; Sat, 27 Jan 2024 00:20:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lTQuVZL8YGJGo91HZaWDjGYZpj4eaCPL+PrXyKe44Kc=; b=lkya2+NQiS4CFg8SC2Sqw1mQjG
	ruKE6EIWuaZHtOmCNXolcWvDGD5K6tefLnD2H1QwY/89ZsIhmL8LyJWnf5UhZJBK8xqCsd7KnpF8w
	FWcrRyTQIbS8vZmjlR/qgQfPnAnNDb6eZbjrOoWks/fL1qVJ0rfYt8UPW3SjNAWCN9+ZOIdTBadnW
	Fyj6sMQoXj8AaCYQ06R6EFT+lUlD1qbrzcaPL0qefML3Xb8Lw8V6KTh2bpDLnLgh42by7DDWDULCs
	PGUQKykqMnSYv4JEABOwZSe13ZlpAqrub6/I1gYrr55MwcvEtnKuIrgWgKeCFQWOgCHX/9KY5Ixjc
	H+qD9D4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rTWR2-00000005xHg-2bdD;
	Sat, 27 Jan 2024 00:20:36 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rTVR1-00000005inF-31EL
	for linux-mediatek@bombadil.infradead.org;
	Fri, 26 Jan 2024 23:16:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=lTQuVZL8YGJGo91HZaWDjGYZpj4eaCPL+PrXyKe44Kc=; b=YddYXwcKcAh63oITkBaCpit1S5
	9BYhGPrwX/q8jg64AQoDRZzYXcOLJSELyUzpvqyohUatUKQE7yDJcX5zfCbdqSr3aurI0vbWo3nNp
	tU2UcwaSEKeimOXEADGfWzMmIUhm6r9Razb/NtWwGTBFvzJc2b1c/144D19u3GIntcfmF8pTFCGv6
	CwAXoKxmHXP/NrbjIU+hbNyXorbfxGXeHou69sPTgTk4611RfK4bokHR1mmlRvEO1iij6gtz29dfY
	FtyIhr38l0UiSEjm7Kq4E7Yr60tV3hkeT750pxagWBDmaia+jhiFi+aplll+P58gC+EkXvkNLI5EA
	/qAEudJA==;
Received: from mail-qk1-x734.google.com ([2607:f8b0:4864:20::734])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rTVQt-00000006J6T-3r41
	for linux-mediatek@lists.infradead.org;
	Fri, 26 Jan 2024 23:16:30 +0000
Received: by mail-qk1-x734.google.com with SMTP id af79cd13be357-783d4b3a026so67621685a.1
        for <linux-mediatek@lists.infradead.org>; Fri, 26 Jan 2024 15:16:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1706310982; x=1706915782; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lTQuVZL8YGJGo91HZaWDjGYZpj4eaCPL+PrXyKe44Kc=;
        b=bQUHg4VmVPzqNhUQFEdZXekaiwy9kLnmcHvK76QPGtK4FdWDK85kmOwFSu7QJuFg2h
         w97Mndnpcni/Xcsrv8kfM6zmAJ3dqURmvSqDm403g+dEE7vIqb+rgV68Wz0syK17W/8J
         yF1LXd2iI+CNydnoe5LYrneQ14niIfH9rAfU8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706310982; x=1706915782;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lTQuVZL8YGJGo91HZaWDjGYZpj4eaCPL+PrXyKe44Kc=;
        b=eegMkKfPpYH/pIfA46y4GsxCegCWK1dpV5yecEMYKPtfMxEcKpWA4UjRN6wv8P2oum
         0voSb3Hgmf1kZmgZ2y+B05HHckE59PIHrc8PVqJJj/CpQbLqRNwiEr2BOkD+oYVFfvkl
         3oONTiYQtSEhslX+oI5jXtrYlSgshEmmemzxuIkswPRvsInSjF3oeBv9tpvauuUib2Tb
         bzg04MX8XM8WhVXlUDVaDG4+Rar4hZxNZErKc7921dgFTeotfAQrAKbPWRK4SZ2Pi/bv
         dOuo5N5m3UmZzuRrsXorERrZSEm2X0ZQEJAKpWewOJ+kxDsQStJxsDqDUPfnzgW0kZPI
         ITJw==
X-Gm-Message-State: AOJu0Yx6/zsElDyuKczt7s+A5Mu2bSK4iSAlpiLJFynUpNkZ+PTYKK7U
	Z+XzAB/EqNH0VJJwMxCkHYsdzbIysx9HRwlVGs1kIMFCIlhRe476h1xew4i1pw==
X-Google-Smtp-Source: AGHT+IEphMi3U2VaLxz1TX+i8gpYrzavZfgthHPoIK0is3/PzYweSa+k/yEg+NZuAGKrkSdAEIRBPw==
X-Received: by 2002:a05:620a:22e:b0:783:d13c:cfa0 with SMTP id u14-20020a05620a022e00b00783d13ccfa0mr539361qkm.12.1706310982441;
        Fri, 26 Jan 2024 15:16:22 -0800 (PST)
Received: from denia.c.googlers.com (240.157.150.34.bc.googleusercontent.com. [34.150.157.240])
        by smtp.gmail.com with ESMTPSA id m4-20020a05620a290400b00783de3ddf5esm507358qkp.70.2024.01.26.15.16.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jan 2024 15:16:22 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Fri, 26 Jan 2024 23:16:15 +0000
Subject: [PATCH 16/17] media: staging: meson: Fix kerneldoc
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240126-gix-mtk-warnings-v1-16-eed7865fce18@chromium.org>
References: <20240126-gix-mtk-warnings-v1-0-eed7865fce18@chromium.org>
In-Reply-To: <20240126-gix-mtk-warnings-v1-0-eed7865fce18@chromium.org>
To: Tiffany Lin <tiffany.lin@mediatek.com>, 
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>, 
 Yunfei Dong <yunfei.dong@mediatek.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, Hans Verkuil <hverkuil@xs4all.nl>, 
 Kieran Bingham <kieran.bingham@ideasonboard.com>, 
 Bin Liu <bin.liu@mediatek.com>, 
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Stanimir Varbanov <stanimir.k.varbanov@gmail.com>, 
 Vikash Garodia <quic_vgarodia@quicinc.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, Bingbu Cao <bingbu.cao@intel.com>, 
 Tianshu Qiu <tian.shu.qiu@intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
 linux-samsung-soc@vger.kernel.org, linux-staging@lists.linux.dev, 
 linux-amlogic@lists.infradead.org, Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.12.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240126_231626_708090_6C9F4040 
X-CRM114-Status: GOOD (  10.63  )
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

Remove documentation from missing field.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/staging/media/meson/vdec/vdec.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/media/meson/vdec/vdec.h b/drivers/staging/media/meson/vdec/vdec.h
index 0906b8fb5cc6..258685177700 100644
--- a/drivers/staging/media/meson/vdec/vdec.h
+++ b/drivers/staging/media/meson/vdec/vdec.h
@@ -101,7 +101,6 @@ struct amvdec_core {
  * @conf_esparser: mandatory call to let the vdec configure the ESPARSER
  * @vififo_level: mandatory call to get the current amount of data
  *		  in the VIFIFO
- * @use_offsets: mandatory call. Returns 1 if the VDEC supports vififo offsets
  */
 struct amvdec_ops {
 	int (*start)(struct amvdec_session *sess);

-- 
2.43.0.429.g432eaa2c6b-goog


