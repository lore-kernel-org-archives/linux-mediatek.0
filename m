Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6371AC19F53
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 Apr 2024 15:14:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7GlL3qsiOGQC7mYG6gX2GhOJ6HGHUo3zfWR8UxyLbWA=; b=mfPo/RWyh8hN1bZUuYnf/pVeMH
	dQy8ze2o9f3SL5ZhjdOgC9j8dULSO4AZHcuW39BXF2KnIFGDZNlOShkmMO7agv/q4eynX0b3NzbFh
	aDXH7jVhYa341b2KjWs2rM08ytphBJWRBMCvOaAOC7hfADVBlrbK3KZkWcZ9LEl/OjNAkuEeS9x46
	8PvSlVnoFQFDSrndYzM1qkllv7n7FdyPEeZpka9tEOjnVRnJg0chIzaI/lnLMR+c7EdDcTQsid8PN
	52Ze7VNoiLCQbCodZOA1G6unLind2LrPo7w0RDzUTcjvmstO/E9oo1aiKvfEVBvw16ayKNwkErZVN
	8faVYOCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1Shr-00000003LBt-3OYi;
	Mon, 29 Apr 2024 15:14:15 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1Shp-00000003L9G-3uzN
	for linux-mediatek@bombadil.infradead.org;
	Mon, 29 Apr 2024 15:14:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=7GlL3qsiOGQC7mYG6gX2GhOJ6HGHUo3zfWR8UxyLbWA=; b=gmQDLNYlCOCTAAzV8HFLfxuGOv
	Mbyvf3nVC04CgBFJzxr3X3BnGgmtrneYSeAnlMDT98Jw9eFJBrrqqNLU2t8AYNFYj+qC13NIdQHYJ
	L6SDeqO0/8gc7dVcyKwGDukzFa4GVY51egRFCESLSRj45by/GcvWgaNKUPz9GjVPVjJgMVYk3pI+8
	1U9eaR45rR3V0uobpX3LDKWwC34geK7O4SmMxa12mtai1Vfmj0+G0zHLuAGCZs6rMC48Svc9vHCfn
	ZOkeOI3v8wuTg2LMFELT+n/AaXADljdwl4tdROwbC/ek5MmlGFm7+RxCQmZfuStOmIpJDvOP8lv6B
	sx8xMx1A==;
Received: from [2607:f8b0:4864:20::734] (helo=mail-qk1-x734.google.com)
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1Sd2-0000000GYM7-2uOW
	for linux-mediatek@lists.infradead.org;
	Mon, 29 Apr 2024 15:13:40 +0000
Received: by mail-qk1-x734.google.com with SMTP id af79cd13be357-790f699eb2cso103545585a.1
        for <linux-mediatek@lists.infradead.org>; Mon, 29 Apr 2024 08:05:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1714403101; x=1715007901; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7GlL3qsiOGQC7mYG6gX2GhOJ6HGHUo3zfWR8UxyLbWA=;
        b=VME8VIoSoiLpw6IhEMqkpbFxoiEftCP2EuQRw22vQF3KA8Tg5/dMyxqOknyncOVukB
         n8oDpSEYPAJS24Bl/AaJyu/k06pQk6Is4zb1M4aRgwbZh5zz7zryU17CruZxP0kamokZ
         dVER+RWTJY1mWFJsft8DRuHMVKU3aBfFU7IVM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714403101; x=1715007901;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7GlL3qsiOGQC7mYG6gX2GhOJ6HGHUo3zfWR8UxyLbWA=;
        b=GjvOzNxU+HQJmrxPm3159YZht4O7u8H7DywRf12gmE9OpK+Ne7eTOySGIXduQ2TQdG
         Bia+qZkkeY0+Ty5OymtkJ2VCCtGEF4ZtXgOWGTH4h+gpMVA9YbNTa/D2aBCE7v7q0FXZ
         5S42Wq9WVNQl1PsWj2Y5RTWhU08HnapPQn9PgrMRQxipvCtemeyXgKMc7TmqyCjXtrCh
         Fkc8x4hBF5tK+Vc2tzi77UvS9D8adQ4PjNPzJyPNtfHc66/yj/UaRSIJO8J/cqcDXXJI
         FD53mcDrRtHFMpI1HQvP75KycYFKpvhA1RRwxZDQfaaiXNhfVUBl15/bsRNob5Dq2f9W
         IWEg==
X-Forwarded-Encrypted: i=1; AJvYcCUwI5YjDkGV0bmsjnc1OcDL1Bxtx/ZevLNDKASZFu6C6uhUg565yEuTWxJT5ScHMflsV4XV85wc9pMlU5cXvlDwFOxFFInFx71gRfrHs7XooinP
X-Gm-Message-State: AOJu0YxPt2aVRQITmTxElrRf9ahfiuz1vpW/Dbdj+W2DKteh+5gHUmne
	vwikvCOpuIlKqNAL8sqJArz6WK9Dmw23pPJaHm+veMabdnUkN819wynhPlk78w==
X-Google-Smtp-Source: AGHT+IHEbQ6k/spB/F4rjxeKOljXK5qMBOo6nR8m19hLRAfwF8PZ7AqOGD/HUUCFVnU+KrmkTId48g==
X-Received: by 2002:a05:620a:28c5:b0:790:ed33:5b91 with SMTP id l5-20020a05620a28c500b00790ed335b91mr5568169qkp.56.1714403100578;
        Mon, 29 Apr 2024 08:05:00 -0700 (PDT)
Received: from denia.c.googlers.com (114.152.245.35.bc.googleusercontent.com. [35.245.152.114])
        by smtp.gmail.com with ESMTPSA id p7-20020a05620a056700b0078d3b9139edsm10568591qkp.97.2024.04.29.08.04.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Apr 2024 08:05:00 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 29 Apr 2024 15:04:56 +0000
Subject: [PATCH v3 17/26] media: flexcop-usb: Use min macro
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240429-fix-cocci-v3-17-3c4865f5a4b0@chromium.org>
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
X-CRM114-CacheID: sfid-20240429_161056_576063_3403BD6C 
X-CRM114-Status: GOOD (  10.59  )
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

Simplifies the code.

Found by cocci:
drivers/media/usb/b2c2/flexcop-usb.c:201:8-9: WARNING opportunity for min()

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/b2c2/flexcop-usb.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/media/usb/b2c2/flexcop-usb.c b/drivers/media/usb/b2c2/flexcop-usb.c
index 43dd3c932a85..90f1aea99dac 100644
--- a/drivers/media/usb/b2c2/flexcop-usb.c
+++ b/drivers/media/usb/b2c2/flexcop-usb.c
@@ -197,10 +197,7 @@ static int flexcop_usb_memory_req(struct flexcop_usb *fc_usb,
 		return -EINVAL;
 	}
 	for (i = 0; i < len;) {
-		pagechunk =
-			wMax < bytes_left_to_read_on_page(addr, len) ?
-				wMax :
-				bytes_left_to_read_on_page(addr, len);
+		pagechunk = min(wMax, bytes_left_to_read_on_page(addr, len));
 		deb_info("%x\n",
 			(addr & V8_MEMORY_PAGE_MASK) |
 				(V8_MEMORY_EXTENDED*extended));

-- 
2.44.0.769.g3c40516874-goog


