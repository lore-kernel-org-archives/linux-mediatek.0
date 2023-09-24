Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA6EBCE7A88
	for <linux-mediatek@archiver.kernel.org>; Sun, 24 Sep 2023 19:02:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HEY3/qK4PljH+5mRr6l/fkufOUPYsS6/LapzeXqBAzQ=; b=HtjKHGCnzYDkrYUdpRXzgxxtoz
	qjehioWW5hX+28I07/iRGzT66QmGb0ViID6rJYRev7zAHFigQDvLRzTclsfxY+PAuZvIumZRTsO8O
	X7v5qYyY9acZkmoVnavhq/4km9cCiyCiWUJsfR2KynpVkdfjJ1EKAhYX4GNJKpZu1X7J/WCH6JaaE
	KBEuyvJpi5O2OYxvj9Ok2QKrxnT5RaBfjxIULIxhm7sfh++zynv+wcpHYsWNT12OAV2UyQK1MpodI
	iim5AAG1OgbLjLLF8o33T2PeNtAw6RufvJlOoPT0uPz3/0LTOBkmQygDmA1FvprTNCefhtgtvzhBx
	UMhZuU4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qkUN0-00Cdm0-39;
	Sun, 24 Sep 2023 19:02:19 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qkUMy-00CdkP-1H
	for linux-mediatek@lists.infradead.org;
	Sun, 24 Sep 2023 19:02:17 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-4053c6f1087so41978975e9.0
        for <linux-mediatek@lists.infradead.org>; Sun, 24 Sep 2023 12:02:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695582133; x=1696186933; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HEY3/qK4PljH+5mRr6l/fkufOUPYsS6/LapzeXqBAzQ=;
        b=J4t0I3DieKhcll64yzgw4t5dVuGCyqA10aK0hAVdr1YRY40KptKW/9Z/PFax4H1WB4
         KpXsTGAUNug6Lj9Z27jUfDpW33njQ52v65fWanM2wanjTp+YNs+Z4go3ymp3PVRAbx+Y
         NLgnf+LF1jNFBUUVbZ4JwY8jPB78y8DbpMCJmEmE+ANNN1wTA0ICY66klOAqAPWliDuh
         ecL2sbLkKUQ5UgpE1QZ9dM4c9AqpdJ8/XKTeIp3MZ7Z6JZWp2usfi99tXpsAauzsyb81
         alaDDi/uEjCLHHwasLufcDijCMhgnATemicIWTRYWRU8g49qTPg/YQYOSy4ngCHkIsbV
         n2OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695582133; x=1696186933;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HEY3/qK4PljH+5mRr6l/fkufOUPYsS6/LapzeXqBAzQ=;
        b=XoKkTpWr6DLQcx0izEKHrQVgzyE7zrAS++Rl97GP7mwzRHE08qJ/JuMs6rgPg/eSNU
         wOH/8I8vNQ1lmTS/puNBwMGZGKGAfcLm3xiS2m1aBKX/IFdhVA4Nc4ipFpkFdFx0fuLX
         TG+Uv0NoFMnOeIMbd6Ah2vlWbHMvkriquiEfXzTYN2uRrl1GId3u+F1hGP9nO/XMh6Gs
         5/HKyi2R/EIfNJv9G2y2oJ/Ko53oShfcRdpXKEbPHSA3d9jKI8+mat6PzmGzQhVS65y2
         LA0rVlK0C6N0GfBMuuMeYslmtRKhFdzucHSySPhRl0lWHslR2MjXBbR1fZH3hIF9iW/X
         1TVw==
X-Gm-Message-State: AOJu0YxPRRExfr5eFSnNAwIfUNJoZvbHd7cNGO7AbcbwR9/eS/TYUnz6
	rvAjvTNswCVjqsxrkHcHxFO2VA==
X-Google-Smtp-Source: AGHT+IFTJOYNoKt70FvbEG3fkDLWzOwpTRfij0NznSyG4D41f0zuewMjBkFnGE5V08UMj/ZN+ZJrcQ==
X-Received: by 2002:a05:600c:253:b0:401:eb0:a974 with SMTP id 19-20020a05600c025300b004010eb0a974mr3981380wmj.3.1695582132672;
        Sun, 24 Sep 2023 12:02:12 -0700 (PDT)
Received: from krzk-bin.. ([178.197.219.100])
        by smtp.gmail.com with ESMTPSA id v2-20020a1cf702000000b003feae747ff2sm12980507wmh.35.2023.09.24.12.02.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Sep 2023 12:02:12 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH 1/2] arm64: dts: mediatek: minor whitespace cleanup around '='
Date: Sun, 24 Sep 2023 21:02:00 +0200
Message-Id: <169558197845.54884.14708791054897582168.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230702185128.44052-1-krzysztof.kozlowski@linaro.org>
References: <20230702185128.44052-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230924_120216_450453_CACC4FA5 
X-CRM114-Status: UNSURE (   9.59  )
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


On Sun, 02 Jul 2023 20:51:27 +0200, Krzysztof Kozlowski wrote:
> The DTS code coding style expects exactly one space before and after '='
> sign.
> 
> 

Patches were waiting long enough on the lists. I assume there are no objections,
at least none were shared, and this just slipped through the cracks. I applied
to my tree for further soc pull request, but if anyone wants to take it
instead, let me know.

Applied, thanks!

[1/2] arm64: dts: mediatek: minor whitespace cleanup around '='
      https://git.kernel.org/krzk/linux-dt/c/aee69e4538e137313831bdb05512686d4f950378
[2/2] ARM: dts: mediatek: minor whitespace cleanup around '='
      https://git.kernel.org/krzk/linux-dt/c/96ba96612d85766b20d2e3e4445c96875351eb7b

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

