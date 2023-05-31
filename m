Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E95C6C7EE31
	for <linux-mediatek@archiver.kernel.org>; Wed, 31 May 2023 13:44:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Q7kySM637Tx/Dc82ge+V+wiyLzxskqVkDb7/090RLQQ=; b=YpYeiYhLiwC5Mu
	97aFzwR96QXMEFGopdgRK+nTMeiY72hpSZfgFfa2m5cCEaf7BkIoexhstzoEtTMsoZi22CoRyYlT7
	uc323daTSFZj/Q9jvf6m8UnHEo1PkvjHY2OfTx+hWgqNEvos/ADNPMvcSILmRLrGHXRSBMzhkuQO/
	Uag87Id5PyoNu8NCITr7iovbt2qsc38NAT64NiPyraBVWlDtTAGrfgzPpKx+n7l/ROmYA8E1dPS+A
	OH1pL50cPhxkhKwTE+3dlx2VExECy6eFeeQWnjvCDhXBwiBeS9l7lQVmrMt1LD/s6Xneb3B5utCjV
	T8XEm+QwiEoD+or8I1Yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q4M7X-00Hb6w-2a;
	Wed, 31 May 2023 13:44:11 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q4M7U-00Hb5D-1p
	for linux-mediatek@lists.infradead.org;
	Wed, 31 May 2023 13:44:10 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-3f6da07ff00so61179615e9.3
        for <linux-mediatek@lists.infradead.org>; Wed, 31 May 2023 06:44:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685540647; x=1688132647;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q7kySM637Tx/Dc82ge+V+wiyLzxskqVkDb7/090RLQQ=;
        b=kdThhklChayqX8Z/J3wtvMZ1Dgd8R4ZFxkexUfEg5dF+OGU6s2itYLsEJWSJiGWWff
         luGz8cIhSSxsybt8LE0JYlHda5FFW/MzVHgkWMueUr7cVIBSXc2FhTrbFS1Ik9QHPHsO
         2jcmEN042vwnKamwrKI2E7YDPSPf9Kq2/B/2xx6+aEISpJt4WRFkvnpJYKE1mVzVbRTO
         0KRqXEiSHp2wAe06qHv+rn6rklzV3EUoJlibgFvtfcJvEgbM2nMp0ePOErniSGAtftSi
         x61DVjJkLwBAECQK7g3qnGX+GV9rwFWXyR7hdRN5t1thJ3n44iXXqf4SUyTWzyaIhZVK
         8lCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685540647; x=1688132647;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q7kySM637Tx/Dc82ge+V+wiyLzxskqVkDb7/090RLQQ=;
        b=ObIQmeviH9xHL8DvQf1WNtpZY3Cb7Fc2XATqk/vCwD9vAMrna0+3My4lgV7PfGXJlR
         5r4bdNSyzZBmjuX+yetRTNiz+rvIVxKMHPylGtBo8QlW1mR+3Y6Wt8RrM30UkbOpTv6H
         ancljYFIS0Br6saH0blpCUOjbpyfWCKd5X2uzcEVNgpbL9lCsc49jYEEQt5XoX3iaEJ5
         hNr3teUjToAynrgYoD57rYRjydXJ6JrPYUAJmrUOMFXjhlnSKw1s1P1EQvCoC6pjbqXu
         DDCjt33x+pR4sJ3V8UDl0ngW+hbnefZ70h8nferZYuVJX9x5rWatDgGOgamf7JgZ6LXj
         WeSA==
X-Gm-Message-State: AC+VfDx//ZYnxvmmHsVMvNyPOfinwn3jpTUcrPcUva5CkOZuz25iebzl
	V5hfHO6mYccT0ndrtRxEoycegQ==
X-Google-Smtp-Source: ACHHUZ6GIntwDxwZs6YWJQ61R0rnMeRB/b1y3TfyI2dJJpkxjZ3IHCpt9CSUEaN6U8av4iYz2vAScA==
X-Received: by 2002:a7b:ca41:0:b0:3f6:3b9:eaeb with SMTP id m1-20020a7bca41000000b003f603b9eaebmr3935664wml.6.1685540647040;
        Wed, 31 May 2023 06:44:07 -0700 (PDT)
Received: from [192.168.1.195] ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id o11-20020a05600c378b00b003f195d540d9sm24562983wmr.14.2023.05.31.06.44.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 May 2023 06:44:06 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: linux-mediatek@lists.infradead.org, Frank Wunderlich <linux@fw-web.de>
In-Reply-To: <20230530201235.22330-1-linux@fw-web.de>
References: <20230530201235.22330-1-linux@fw-web.de>
Subject: Re: (subset) [PATCH v3 0/4] Add mt7986 thermal
Message-Id: <168554064594.102887.3990598740109479693.b4-ty@linaro.org>
Date: Wed, 31 May 2023 14:44:05 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230531_064408_621267_F8EDDE7F 
X-CRM114-Status: UNSURE (   8.55  )
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
Cc: Andrew-CT Chen <andrew-ct.chen@mediatek.com>, Lars-Peter Clausen <lars@metafoo.de>, Lala Lin <lala.lin@mediatek.com>, linux-iio@vger.kernel.org, Zhiyong Tao <zhiyong.tao@mediatek.com>, "Hui.Liu" <hui.liu@mediatek.com>, linux-kernel@vger.kernel.org, Daniel Golle <daniel@makrotopia.org>, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, Jonathan Cameron <jic23@kernel.org>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


On Tue, 30 May 2023 22:12:31 +0200, Frank Wunderlich wrote:
> From: Frank Wunderlich <frank-w@public-files.de>
> 
> This series add thermal related devicetree-nodes and necessary
> dt-bindings.
> 
> I left pwm-fan for r3 for now as i cannot test this completely due to
> missing 2 pin-jack and 3v3 pwm-level which my fan cannot handle (starts
> spinning at ~3V). Only checked voltage of pwm there.
> 
> [...]

Applied, thanks!

[1/4] dt-bindings: nvmem: mediatek: efuse: add support for mt7986
      commit: 05f53e3c22a71ed53e0e88432c3db31f2d27e6e1

Best regards,
-- 
Srinivas Kandagatla <srinivas.kandagatla@linaro.org>


