Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FB9FC77B75
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 May 2023 08:28:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ZihnAL1nAkDBbq2KyMEHfWY+WWt7eWRA6dF80uZXMso=; b=4baoxva1DovPxl
	2Kj6sQxzdriGOmHUGWN3rRYwFnUw7tJhCkGntqlSWk0YfIh5q7PLTkoUKEH1Y4m1rSI4SlYN8P2bi
	P3pm1LJSll6LfDfRwrexrMdDvkBTq1fiuhjw0BbZKnPEQTWXXNVJIRYQX0JG3RGdz1WjJ7Qtvz0qH
	5szGyLfYZ/0usXwYOCYIZk7d0xYBlfQj4UTzCg278FfYoBw7WlYs2VL/otxeL6nPVX2ex+fWHHG46
	xKZMx21rAvWclI/2fWHdq6j8rEVIaZ+LmyXKXiZ3+8wxhHgN2ZJL4ZHIcmw7/6k5IDmPG+KCSNRQG
	9ES1mhAmeoIzNR0U/cAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pzCWd-008quf-1y;
	Wed, 17 May 2023 08:28:47 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pzCWY-008qqw-0w
	for linux-mediatek@lists.infradead.org;
	Wed, 17 May 2023 08:28:44 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-3f4c6c4b425so2996745e9.2
        for <linux-mediatek@lists.infradead.org>; Wed, 17 May 2023 01:28:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1684312118; x=1686904118;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZihnAL1nAkDBbq2KyMEHfWY+WWt7eWRA6dF80uZXMso=;
        b=G3QSKTUw0Oxncgfh6I40dQHk87EmvKdhFRf4n1G5iSXH+XaYVVT+Ra2U6O1C+SX7hG
         5OntSosJwXDp6Uf5nvYmFzYWDpxllRQpRLdp6lWK+0Hn2uJsoyWdkKVDv8mtUTUxfvRl
         BKiAvmrEMgb60bXnNbNffJf3jMSN+luwT5lb5nG/IM5zenRs+GNPulhKMb0bZWJ0mCBV
         DK8sDECKzx60jE+At3/Md1nScT338EQOPGVGQhqi7TgIFgMLsOVgsVih4yTAEMVmp9BG
         UV0GNj4nHNrCw3VbUiRp5FvhLOVjMOQAN0WLe3zovNqOjr9YY/kPmDDHArQ/ioJhE5RB
         8UnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684312118; x=1686904118;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZihnAL1nAkDBbq2KyMEHfWY+WWt7eWRA6dF80uZXMso=;
        b=RcwjlrjaP59PM8IwnNQj4ug4B/1v+WS7MIsytp7Y652xG1qmDl+i8Dkhe+7RIfrt90
         bs8NZ0ezRxx2+e5LgfWlCFBQlT2EB1Penq+dgFSsLujzalKtrDNulcNqcvTOUdct902O
         IueDG3kWfhhfbIIlOCDdu7zM/h2yCjEBNLonn0eTRSPk578ATekjz45F04aHHtFASti9
         Ag5LKti47IRiBILf+ebTyfSF3+zVwGoetoPVXniJt8P4deCVrtD+evxS50Be3ZxE9UR0
         4ehw1pmYzCxFysuvjlYnu2AyRqayZkc1e46KsMRSFCkHYtbb9RPh4F2j/s4rJ4RZENe1
         k5vw==
X-Gm-Message-State: AC+VfDxFsWn/FEoZ9zmkttNGAgWQSVhoSUTYZgH+3jWkuZN3zG7rKUT1
	qYpiy7cKEqltshQEoAkH3nafTg==
X-Google-Smtp-Source: ACHHUZ7YKNglQi5AC4I94XCPl4u8XP7inha9SQYONn/dMfYjIeq63eOT4aRc1F8dTARCyWuhK96BGg==
X-Received: by 2002:a1c:f310:0:b0:3f1:74bd:bc22 with SMTP id q16-20020a1cf310000000b003f174bdbc22mr26806422wmq.6.1684312117897;
        Wed, 17 May 2023 01:28:37 -0700 (PDT)
Received: from [127.0.1.1] (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.googlemail.com with ESMTPSA id c4-20020a056000104400b0030922ba6d0csm2323066wrx.45.2023.05.17.01.28.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 May 2023 01:28:37 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Subject: [PATCH 0/2] Fix and clean MT8365 clock indexes
Date: Wed, 17 May 2023 10:28:18 +0200
Message-Id: <20230517-fix-clk-index-v1-0-142077a1732b@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACKQZGQC/1WOyw6CMBBFf4XM2rEt0Pr4FeOiLYNM1NK0SEgI/
 25x5/Lc5JzcFTIlpgzXaoVEM2ceQwF1qMAPNjwIuSsMtawbqdUJe17Qv57IoaMFL0a2jbO90Y6
 gOM5mQpds8MNufaKYzbHF5JWYxshevKdzY7T4q+xiTFS235Hbfdu+oefgUJgAAAA=
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Chen-Yu Tsai <wenst@chromium.org>
Cc: Markus Schneider-Pargmann <msp@baylibre.com>, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Alexandre Mergnat <amergnat@baylibre.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=849; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=163q5ZS2H6Rg2KSX1F5s5Y2O3lJW+MTWBH+aLyNFN0c=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBkZJA0Cqynex2hMWv5jFuYbgLuJEm6GmoGzTrvVMjE
 2KVGv6OJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZGSQNAAKCRArRkmdfjHURVWzD/
 9ZqOS0zeXDxgtNISQviQzvACckTrVcuvTIWsU62emZwgz/vWSglHU5NO5g+YjQrk6SlIjNlFm9PvTp
 f9heTYMBlIBek9cd3jdwS7pL+8wemxp6Z5UtiUNh98B0c6VrONOe1Q8ZTsjKZ+YpE/N+ZUS6xMx8YX
 rMOsAIDqMOwgnigjDi5H1yOQnvIN1CS8wHmkgdFaWR2sN/QwZ+4NEkp9nTjxrHEBo5nim9mWGofror
 PpkezQoyJaTA5PhWxqy6tjgI7JQ7fgmHN26swYTRk6F3tMxGozmW64sJFHUXXVYgQsZFaouV9COfxx
 I8JBvNlmetiBYyOFlUR/hm+9r52t5Cb0BZnk5oLnY4ElTXmUDQAGKDknG1uJkG1jcgij/4ZkufFvwa
 wYsH2dtTYYd39CTQGz5ojHIScDO8fPDYSe7tMV/MQkmX8gAPdAjj1r/DZA1wocK/vxPk4GU1qEFnRG
 9oqiPwGpLATbNfHRWQPmvgo8qVNruvQQX0Xa/G7rI38cn6I4/e+Nj3eKfJ5blYFzn3vTnaIt8F8BTH
 cktEgwR9JZzeu7zSoI8numeAvh+VH+nOaCvEjKOsLM/R5LiS5k1s8gRcNFWFxYiLQjMirEswCuk7MR
 Tf7Nad3oHM+CDg04hcgsVjEYo/ymxc9h+urgq+KX1n0vPpWr/rBZaM/n5ANQ==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230517_012842_549057_38940CC3 
X-CRM114-Status: UNSURE (   7.32  )
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

The first commit of this serie fix a regression which prevent the
initialization of the latest indexed clocks. The regression is
introduced with [1].

The second one cleans unused define since the probe mecanism change.[1]

[1]: Commit ffe91cb28f6a ("clk: mediatek: mt8365: Convert to
     mtk_clk_simple_{probe,remove}()")

Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
Alexandre Mergnat (2):
      clk: mediatek: mt8365: fix the clock indexes
      clk: mediatek: mt8365: remove the max clock number defines

 include/dt-bindings/clock/mediatek,mt8365-clk.h | 375 +++++++++++-------------
 1 file changed, 175 insertions(+), 200 deletions(-)
---
base-commit: ac9a78681b921877518763ba0e89202254349d1b
change-id: 20230517-fix-clk-index-96043baf65be

Best regards,
-- 
Alexandre Mergnat <amergnat@baylibre.com>


