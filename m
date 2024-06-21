Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66DC8C27C4F
	for <linux-mediatek@archiver.kernel.org>; Fri, 21 Jun 2024 06:18:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HYqfWWrei0iPzIJrEyTnIBhjsFgGf9hoiPEtzQnSzo4=; b=WRavC256Swv0+owrR9GRNOekVr
	vCniyGA4Ry6YLuSp5ToZ3OfR+X4mAeGrdnVJSO+y7W39UynrTAnYpbKkfWbr7KRF0uL4reR694PuI
	BnetuBqpP/xcGv8GKGY7o+ODwyoW4UBJaU7n9Nx7eF//H/ugdRURZbmdnCah6Qil42OBk4Hs5LPAd
	fMzTZ4S9lT2D0O4O6dbwzeZPEm+qBoRwCIbXQ4n+jmpjmZCkXzXER0SWYH1ubw62/+tPoh0hPcekP
	Xk00h4loDxQKPOZdcJIr/K36Rv9Vfl9uGRvTWrW3viVSA1alxoclA7DH9FkHDEQLyASlAq0oq9FB/
	+2B8P2Tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKXbI-00000007utA-11pZ;
	Fri, 21 Jun 2024 06:18:20 +0000
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKXb3-00000007ulh-3F5R
	for linux-mediatek@lists.infradead.org;
	Fri, 21 Jun 2024 06:18:07 +0000
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-52cd717ec07so266165e87.0
        for <linux-mediatek@lists.infradead.org>; Thu, 20 Jun 2024 23:18:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718950683; x=1719555483; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HYqfWWrei0iPzIJrEyTnIBhjsFgGf9hoiPEtzQnSzo4=;
        b=VflJAJTnJpXUehFIynM5SxqNgicIcoSFQs6hDIc5tyr3D4ePoDrGoBwmxWV1HpJ7gs
         BfwtIKfcVVWa3ZeS0hhhte77wZq4ZKSFqyFJfB0UFPNM3uOzDcwx4xgUooPi/fc48jiI
         FneNLm96ROStNr1ES2kZcIyZz27v0O5lC8p0InbNT1fKHyaFtifMVvuTFNj0WIbRPkZO
         /05ulmbATJ7RtzW7+TQ6zbylC3PF3dq32m98NfSwtyjkIFPe6epEsnTC26S5DurgwqxE
         1NIqMMOW3ncrfxsP1NJB8NcryAJhhbHxn6sY6eHFkLKStGtaMuKTcN+B1swHGo7rpiKR
         bSFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718950683; x=1719555483;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HYqfWWrei0iPzIJrEyTnIBhjsFgGf9hoiPEtzQnSzo4=;
        b=Kd+pkOJON8uTIQQsLSLp/Es5rQscmSk7vnmX+1pesLQTv3ueEFkehMHmgncTsq/syH
         qEbo3zHEgjtV8zL7mbNJkj4lq2nMyElII6UOm37kgw5k1K42TIivoTgC9sSGzFLhYNbV
         p42MjnsafU92FAEqVVROv57yuFPqKRogh0LnmWYlMXwTqmN2FfpDGYN0YqPIaNs8Q3sp
         zAaPJ3vsw2Tj6vyAaWP/LanhyOhFo8Ei8qF6ZTZamxKH4gOjCqfq0MMQHtqMxnA6Q8ND
         DSFTwypeOm2PHvKvSIHjcFVg+0ioiIzCo6Sqo9CTDWMjophXzrAX4rmuegAx6pnDt2h1
         5UZw==
X-Forwarded-Encrypted: i=1; AJvYcCVE19wJXo2Ub7q6JuvQkL0wQBFi5V9hYm7bQqC1XhQ1wIByeR0wt8x5MvY/ugAK4/ud3+THhRjLxphbZ5KHCp1wVvSl4cxcUDfzgQOxKiwWPQHo
X-Gm-Message-State: AOJu0YwZBiZgU3xRWxf/hB90Hjy4dmywlEn7OFLWy5PEt4I7S5Z5htBB
	U/sCQAHtoeX2FoZOTACxiHYKnufj4jIzV//SxFkJ5v0SzkB0in7opCFaRHrp7Lo=
X-Google-Smtp-Source: AGHT+IHSUvrRscBpYllGrv5HkTVUXqHP3JrGdwPNsMjrWntLYW8YioRdDg4QeGt9fNrzghzXbkF5eQ==
X-Received: by 2002:a05:6512:2154:b0:52c:8786:8aee with SMTP id 2adb3069b0e04-52ccaaa21b9mr3850160e87.56.1718950683538;
        Thu, 20 Jun 2024 23:18:03 -0700 (PDT)
Received: from [192.168.1.195] ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42481910fc9sm14075635e9.33.2024.06.20.23.18.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Jun 2024 23:18:02 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <zajec5@gmail.com>
Cc: Andrew-CT Chen <andrew-ct.chen@mediatek.com>, 
 Lala Lin <lala.lin@mediatek.com>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>
In-Reply-To: <20240613195933.31089-1-zajec5@gmail.com>
References: <20240613195933.31089-1-zajec5@gmail.com>
Subject: Re: (subset) [PATCH 1/2] dt-bindings: nvmem: mediatek: efuse: add
 support for MT7988
Message-Id: <171895068129.13708.1096581925080498060.b4-ty@linaro.org>
Date: Fri, 21 Jun 2024 07:18:01 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.12.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240620_231805_852121_3A333B98 
X-CRM114-Status: UNSURE (   5.34  )
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


On Thu, 13 Jun 2024 21:59:32 +0200, Rafał Miłecki wrote:
> Add compatible for MT7988 SoC.
> 
> 

Applied, thanks!

[1/2] dt-bindings: nvmem: mediatek: efuse: add support for MT7988
      commit: 35636e92643ecface9655eefa50370df77f73e17

Best regards,
-- 
Srinivas Kandagatla <srinivas.kandagatla@linaro.org>


