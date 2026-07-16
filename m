Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 760A4C4450A
	for <linux-mediatek@archiver.kernel.org>; Thu, 16 Jul 2026 10:58:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SI9vuvCiLUNTqWd6WlsA3FjVND8EZeQ2hLnq1JM2ocY=; b=rQTyZAflv85bW8MCrhF1zKsPPu
	m0Bc3U6yuJ5AVsBWkB9v7Ga9R0KIRNijJzviMKwNclmNX+gD5twgXHpK6aSZDHFI4Z8+RD/dIRwBl
	MLgiLPXOfgI/89MOyjr4VdOSLbpUEB3cE9YZ3u+Xg2YLt+IgAOdXSigxnmL7RmszBI3+MVmh7rv++
	TKDemKxNj3ySg+SU9qJEtY6Zve1p7QXbw3NH1S+kO5sG6/rlP8AeffpORd+S9FaOwQ/LuMNdEd608
	DhsiewGOEbpIkUp+U+m8zqtHbZUaZgb4A9Zjv4yr+mgjl1EsweDWsGD9hU3waMDEg/8h48m2/Q+8o
	c3ovL4mQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkJnX-0000000H55m-0tD3;
	Thu, 16 Jul 2026 10:58:35 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkJnV-0000000H548-1ZpM
	for linux-mediatek@lists.infradead.org;
	Thu, 16 Jul 2026 10:58:34 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-476a130c138so3064200f8f.0
        for <linux-mediatek@lists.infradead.org>; Thu, 16 Jul 2026 03:58:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0sec.ai; s=google; t=1784199511; x=1784804311; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SI9vuvCiLUNTqWd6WlsA3FjVND8EZeQ2hLnq1JM2ocY=;
        b=uK3+R5v9RjFyev5GBuHy/W9xqnvE3IxtEHRmJ4l+m/TjocT0VDMRHlzQYPKOdHi6vm
         n5zStidRo5JHvT7RxCRL8pn8OLj3gwdKFe0wxGeKp3nrQq4/CCDgOVSdU+WK7jriWpNW
         ief17Yv03YX5BuPnwsHxXMEwFXak+nCLmgfdn5pzjBnt7Yfqz+VKbMEH8axU9SUNyI3U
         5RMK411E0JIXTQFjIOiZmGIr0c548RYnIls/ZlgjdLcrIMJ25f7bFOVKZ/9mtuQzJMcS
         lZfV66NzRsfdGmd8QI4l4S+df4N6Fr2nH0gMA7dC7aBBC1ClxjJOfzog2b/Pbops8k+6
         zt0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784199511; x=1784804311;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SI9vuvCiLUNTqWd6WlsA3FjVND8EZeQ2hLnq1JM2ocY=;
        b=sZB1GyxM8jxeZYqOzZ7vLLpEalcd/atOCnc6EBuBpb/U723VJPkx6F2Eb2J0ovJbhb
         tqqYn2wt6BK6NOy08kVIQPpYBdJcMHcrDwuB3zw5JTedkHPR9TzfxEhHJ0nxeQhHZ5PT
         SK03t/5iwmXb9wH+cpJwzovUuAS0TyIF8usJjClpDXVYZA4DAKkxH1ujHBO0vPZ9wNba
         SATrxb/9HZ6UFxNwlNap+tK64w/QCUoIum872RZQe5rrigjRHPaGjQHthc3COeZv3qwc
         UtsVXuRIyOkMt/YUJDRyr8wqwUgV1l8qUztoXxul7+TicUcDi6mxalXG4zpWp5Qx8Crs
         pBLA==
X-Forwarded-Encrypted: i=1; AHgh+Rp1Nepw5E82CmdcnEkehKgu9HJ9AsVecwAzTGGdOy4SbFJ4BHBCRsgdtQTdCBMMi+T3X9p2gCzP/gO347I/5w==@lists.infradead.org
X-Gm-Message-State: AOJu0YzM2fO9/BVxat3LTEGQLsSbG8f+1O9L5TADjGyim9fPqMPKs6Nd
	TgUdsB+1D3bvHeUmU6K08sgkDcjAnt0ENuRZKrGWPH4NJzdlvM0hSgfRW/eDR6xf3AqFE2GY98f
	uMMe2daV6
X-Gm-Gg: AfdE7clu/Ca9EC0BS4l7E69HH2WoeWgIWPaqH8Rng0HCZ14O3Z6/DxOKJ3BrlYCdd+l
	xJxpOOnxv+qUjP2Wz0hlfoIbXeU+kO81DarLe5SsKQZxwSd/+CxHBVvrnT3lje+1NHG7LYa4wRX
	XP519vhryqhfTtp1tVInbimji+egiw8Li9ABrufNJM95nRJ1capkWcc0jFGOZQmP+34MEvfXHdM
	zySmg+u5/Qr32s06rBQ/AfpBSxyljbgjtKSfojXyALdiNw0vjNfGS5FcuRXu3pBQPcdpnhzBtgI
	bRh4A9ZBTTdE4bWNQI+Hpfb7NNtypY+5DSnBLxaG1VLhSGt+snNKNiFHSOFFmyVE5BFJx07MKKL
	Dx4GSHLx2CrmpTyfrWZjv5t1P/iY1zYmhqzWIbTspoYOHOH5oIN6Z8k65clYK8G4JnVEikL3jhR
	oyKrJyL+g0dDe/hZZLDNUAqWaunHgKSMbCiSCH67yVckASW3CqBSLXklRrLYbUrVBIo9KtBgT3m
	ur2xUxmDmLzroF8jrGISwWj
X-Received: by 2002:a5d:5f02:0:b0:47d:fc20:f6f9 with SMTP id ffacd0b85a97d-47f2dd2f413mr23607562f8f.45.1784199510924;
        Thu, 16 Jul 2026 03:58:30 -0700 (PDT)
Received: from PeakBook-Mini.tail8e484.ts.net ([178.197.218.188])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f464c89e5sm23653113f8f.34.2026.07.16.03.58.28
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 16 Jul 2026 03:58:30 -0700 (PDT)
From: Doruk Tan Ozturk <doruk@0sec.ai>
To: Nicolas Dufresne <nicolas@ndufresne.ca>
Cc: Tiffany Lin <tiffany.lin@mediatek.com>,
	Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
	Yunfei Dong <yunfei.dong@mediatek.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	linux-media@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] media: mediatek: vcodec: fix use-after-free in decoder release path
Date: Thu, 16 Jul 2026 12:58:27 +0200
Message-ID: <20260716105827.870-1-doruk@0sec.ai>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <d4676bc9095c2c1efcd2c0f5ff4559bac7d1e47b.camel@ndufresne.ca>
References: <d4676bc9095c2c1efcd2c0f5ff4559bac7d1e47b.camel@ndufresne.ca>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260716_035833_425187_32F8A345 
X-CRM114-Status: UNSURE (   4.98  )
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

Yup, just double-checked. Please drop this one, thanks.

-Doruk

