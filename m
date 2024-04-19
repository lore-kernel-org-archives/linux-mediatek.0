Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14CA4C04FFE
	for <linux-mediatek@archiver.kernel.org>; Fri, 19 Apr 2024 09:51:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I5MK517M661jXeUTMXVPJlov9z4l8/dISyr2IlNuzMY=; b=X2VxCd/fAOrQZNw5f/+Lx2wNvp
	Pm8tbp52tIh3iyBsg2z/2zrL3oM4HDZwBK9omt0ZKZERf4LA1aTI4ZthX98MBK463yBCYJ1b/rjAK
	0hRvbQiJvcwvifKspoymxbevFLcA1dQ9CC15c0LOcrFsvcyR+aYFjlSa3iF6A5EWSmU62sGP5tj60
	UnyZ5W/nJ2CxvCM500SyDvBeYuj18tF3OrgkDwlxZ717behWM6RCj/YlY7vIo8uaUyX/MIt8ABgPw
	suit3o26+Kg15Nw9HNqjinctPoFHPCAoNJ8rhI6zD+dbSytNXvwMwGPoE29/wwN4L8uzStzVTK3CZ
	P75jG6Nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxkuT-00000005ANx-254U;
	Fri, 19 Apr 2024 09:51:57 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxksO-000000059BV-266O
	for linux-mediatek@bombadil.infradead.org;
	Fri, 19 Apr 2024 09:49:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=I5MK517M661jXeUTMXVPJlov9z4l8/dISyr2IlNuzMY=; b=DZDAz8U2vSviJDvksUncZOB00e
	Nm8xz5IEk3es6+WuFeX4QehW2suTjuwZpbyl007U3iyStTVERwbK27vuucP++I/Ybplmtf9D3Hq/+
	+rBmjb0EUjti+PQnBwuOEmGdr2bdp178sz/cej614UbPOk20RpWiavl09nFE71+vaQRxgWccEzKbA
	H07dKR6nGlHv4pJ+ULvXQx+x/gGI+Ymf53zh4TQLpMYmT6olvFbM4nDmfQFfUPvqGniALHJCQ0Jcf
	/zNLvkKhMi1zY2IMR9VEZiuFzI5EQrSZyXxpSHYH6ygB935wK0idJc2EFyTYtrZFmcFVwRml3iEJM
	wSjDhq/Q==;
Received: from mail-qk1-x72d.google.com ([2607:f8b0:4864:20::72d])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxksG-0000000COPH-2lgB
	for linux-mediatek@lists.infradead.org;
	Fri, 19 Apr 2024 09:49:46 +0000
Received: by mail-qk1-x72d.google.com with SMTP id af79cd13be357-78f03917484so111326385a.3
        for <linux-mediatek@lists.infradead.org>; Fri, 19 Apr 2024 02:49:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1713520171; x=1714124971; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=I5MK517M661jXeUTMXVPJlov9z4l8/dISyr2IlNuzMY=;
        b=ScfRIeWrx3GsnNewIWqYmwwb/e6wFe1c4+RE7tTAWlOa1zs2I4livsvgsOuZmEcv3C
         WJipY/y3G6wIEqkmj6ucDvR/r/N2kd0SG5Jpao3/opo9XqnRrqCclN6PxfcSVGj9sqf9
         3qmcJGjKrXNqiWJBnr5e6ooupFFzMCK/yQbj4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713520171; x=1714124971;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I5MK517M661jXeUTMXVPJlov9z4l8/dISyr2IlNuzMY=;
        b=FEZXWo7+QSbi7bE6yio7FOZdCSR/nQ3Nv0wFtwLB32BPx9XBsxws+dqYSj4YyCO0IJ
         42Iy2XjLCIovVLcbQoXYTId3ORw8lzZ9Mfuw+qVYa873U8jvD1sEv8GmYV+mjPWARG61
         H/gRy8AdEOjQO8rM7jU8R4OcXAluKkKpJbCm9jZmBjxYDLxG4sdrk8Rna1tTdw7cIWpd
         laIVNyzABN5oS2ldtMKb2HYFDTj3ZjVCdnWhQlRG6b06ETuCkUcOv7tgQBEYlSIwA4To
         DAuii+b36PAtzVogZquq/f9uipOLnmsZtt1Mt3AnWbMVx7IM24iCZWMkATfFXZngYF1d
         p49A==
X-Forwarded-Encrypted: i=1; AJvYcCWqHxwH4BYVXlm8zFl+VRaeX7RIDD/36O+2veo5qd7WiUQVIGMsQ1L0dmyCEMzge+IAXve6iWGCgc89CQ4S+er8Y9JD+CW4kurY0YMQg9IvT6WY
X-Gm-Message-State: AOJu0YzKYvazcSd6OTo7ZiQqWVbPTJxm35ym+9pCPFZIeVU0i8Gt+a81
	382/Pz/aRQHR5JKZJLPEqmm4sRHaNRp2lbcrP4aECJ78H/T5ojZazXXihb+weg==
X-Google-Smtp-Source: AGHT+IGTA8hVputhy9D1xoHe1Hnr3yG2C7dQHpLq8IKH//vLRvJ+A58aCJR9JO6Y/w8HTYrMtJHvqA==
X-Received: by 2002:a05:620a:1da6:b0:78d:5065:c5df with SMTP id pj38-20020a05620a1da600b0078d5065c5dfmr1596268qkn.18.1713520171055;
        Fri, 19 Apr 2024 02:49:31 -0700 (PDT)
Received: from denia.c.googlers.com (114.152.245.35.bc.googleusercontent.com. [35.245.152.114])
        by smtp.gmail.com with ESMTPSA id dt14-20020a05620a478e00b0078d735ca917sm1434532qkb.123.2024.04.19.02.49.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Apr 2024 02:49:30 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Fri, 19 Apr 2024 09:47:56 +0000
Subject: [PATCH v2 10/26] staging: media: tegra-video: Use swap macro
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240419-fix-cocci-v2-10-2119e692309c@chromium.org>
References: <20240419-fix-cocci-v2-0-2119e692309c@chromium.org>
In-Reply-To: <20240419-fix-cocci-v2-0-2119e692309c@chromium.org>
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
X-CRM114-CacheID: sfid-20240419_104942_732620_516AAA3F 
X-CRM114-Status: GOOD (  11.02  )
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

Makes the code simpler and cocci happier:

drivers/staging/media/tegra-video/tegra20.c:324:44-45: WARNING opportunity for swap()

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/staging/media/tegra-video/tegra20.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/media/tegra-video/tegra20.c b/drivers/staging/media/tegra-video/tegra20.c
index 630e2ff987a3..7b8f8f810b35 100644
--- a/drivers/staging/media/tegra-video/tegra20.c
+++ b/drivers/staging/media/tegra-video/tegra20.c
@@ -317,13 +317,8 @@ static void tegra20_channel_queue_setup(struct tegra_vi_channel *chan)
 		chan->addr_offset_v = chan->addr_offset_u + stride * height / 4;
 
 		/* For YVU420, we swap the locations of the U and V planes. */
-		if (chan->format.pixelformat == V4L2_PIX_FMT_YVU420) {
-			unsigned long temp;
-
-			temp = chan->addr_offset_u;
-			chan->addr_offset_u = chan->addr_offset_v;
-			chan->addr_offset_v = temp;
-		}
+		if (chan->format.pixelformat == V4L2_PIX_FMT_YVU420)
+			swap(chan->addr_offset_u, chan->addr_offset_v);
 
 		chan->start_offset_u = chan->addr_offset_u;
 		chan->start_offset_v = chan->addr_offset_v;

-- 
2.44.0.769.g3c40516874-goog


