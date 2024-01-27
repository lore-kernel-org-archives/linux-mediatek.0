Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31B2DC46CD2
	for <linux-mediatek@archiver.kernel.org>; Sat, 27 Jan 2024 11:30:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2GZIIhmY4ewuA9KgJhwUUlqVtGcUt+YTA3IGIjyGp5g=; b=jCKXy81YfKlBSp61RIXREIsXss
	smL3Fb7lQDtnOZ2h3/EK+HwDDqy+vcHWHwWRaM6L1sPPPjlxDuHDMe5AafEe0MLeuLIM6fWxFlRcj
	ofm0ElsQXQiRNvdaA0duoGvcPpGdKbzTupVkEcYtubVkUxIB3/ZHnFo9J1kPs93ND0WcOsDRe1MiH
	qk4rHCJkAseLUw9NojmSTm4JwS8yXpFWMcHdhbYr+fHXjyENqw8B+Sj1e0BcpbXV649xDVRcwoQvu
	2fBxq/ewwkjm0y2lr36iQbkcP7mmnm0rxkzGqgJx3oTYl9yjyvPZKKwVFkE8nx0DJyUMYND7VVMQp
	rH0rnSWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rTgsu-00000007QTp-36Iy;
	Sat, 27 Jan 2024 11:30:04 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rTgsr-00000007QS9-2LAp
	for linux-mediatek@lists.infradead.org;
	Sat, 27 Jan 2024 11:30:03 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-40e86a9fc4bso21105905e9.2
        for <linux-mediatek@lists.infradead.org>; Sat, 27 Jan 2024 03:29:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706354996; x=1706959796; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2GZIIhmY4ewuA9KgJhwUUlqVtGcUt+YTA3IGIjyGp5g=;
        b=nurBupADZUIg8FzCmOVdlFDwR2iAwUAz8Tr0pdT49e9cqQ99pvoVlxmb9C/puXsP18
         ngdnk+JX59Uhms/8Ww1otIinhg2+qfCPwCT5FvKP2anPb+aRzv6q1Egtx8TzQJGjs1xp
         q7t8mvTLXyXVP6W5aHPw358GlOMAaGYt+372Czt6ZzqD0rIfuCBuuQ150e82reZma/xJ
         tSw0mYH2GwmotKJCFTYuLAGDJYJpn5184O+EiN4n0JLJF00onjd4QzjMt2L5LBFLuj5O
         SbLe7gaVqzsnvZaNZjWgNoHoGlxk1So3cKFc766CACVWGweqRZSPI/80xcPlQTDcwgoX
         3Vzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706354996; x=1706959796;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2GZIIhmY4ewuA9KgJhwUUlqVtGcUt+YTA3IGIjyGp5g=;
        b=oLRzN2n2Yd1OziOC10rFZVTLYCn/8dc1rkQgFc/m2XDoSgzF+X3rwyZ1ygqG8JEMk0
         hNwqnVyaarRmQypyPkJA0Gaksj7y6oPFWMGTuvL1e0N0tEqYBORisJg+satlgFBDgXob
         Ou3V+r5jh9kfz9W2+RdMi523Nun1SlKxy3P4cdtRDtWN8mPg7qbbRzY+ppoqC87E6EAo
         3iY2bFypEa7kuXgItwIxzy3GqPHZyVuiGl/ACA+rrCgDA6MmMCPke6xRErv+MaOcSl2P
         AIN4WWmb6aph60F/jHKKoEbhkGJQ+j83iW+K9AMblfarVnpoNqnHnKK4AdItuqK30hZu
         I3IA==
X-Gm-Message-State: AOJu0Yy64r7KsOfKW8k7pKnnKcv06vPg3kYlWMdDcnV4F/0KFMIJChqo
	RcOt0qeDHS6KSbe5NKWhx4nYEtYoikhRZ3gjTajLfWmfXhDUOJTpaCmAQTFhcfM=
X-Google-Smtp-Source: AGHT+IGK1wNu7ZSIsgbkTjQOCpa8D/ABpMbe7tI4xca9X8OXpOP9r4Fup/x/E/gFt/JZ9Szz1a9l0A==
X-Received: by 2002:a05:600c:4f8e:b0:40e:b313:b8db with SMTP id n14-20020a05600c4f8e00b0040eb313b8dbmr1167208wmq.28.1706354996117;
        Sat, 27 Jan 2024 03:29:56 -0800 (PST)
Received: from [172.20.10.4] (82-132-215-85.dab.02.net. [82.132.215.85])
        by smtp.gmail.com with ESMTPSA id h17-20020a05600c315100b0040d62f89381sm4427724wmo.35.2024.01.27.03.29.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Jan 2024 03:29:55 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 William-tw Lin <william-tw.lin@mediatek.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
In-Reply-To: <20231222080739.21706-1-william-tw.lin@mediatek.com>
References: <20231222080739.21706-1-william-tw.lin@mediatek.com>
Subject: Re: (subset) [PATCH v4 0/3] mtk-socinfo driver implementation
Message-Id: <170635499406.41064.12411935787824963879.b4-ty@linaro.org>
Date: Sat, 27 Jan 2024 11:29:54 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240127_033001_644136_BF9CB7D2 
X-CRM114-Status: UNSURE (   7.21  )
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


On Fri, 22 Dec 2023 16:07:36 +0800, William-tw Lin wrote:
> v4 changes:
> dts:
> 1. remove phandle from socinfo-data for all platforms
> 
> mtk-socinfo.c:
> 1. use module_platform_driver instead of builtin_platform_driver
> 
> [...]

Applied, thanks!

[3/3] nvmem: mtk-efuse: Register MediaTek socinfo driver from efuse
      commit: 4e6102d60d88975bc65a0dde05a8ba096c450249

Best regards,
-- 
Srinivas Kandagatla <srinivas.kandagatla@linaro.org>


