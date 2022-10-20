Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1F3DC433FE
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Oct 2022 13:22:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=aNOCO5Wzuq4FvlmMhHTUbdlTAohmkL46icpaXsf0/1Y=; b=V/tLG2EWrsQv1Iyp1sMUuHGGrP
	pWWcVLsuhjuuZ6z7BJfRfW3nI53elIOn7vq9zpt1ptu12M564+1gIkmAmjOCw1lW2LA+c+SZul07w
	fDazwCKSHjiDdysAxO0QjM5HnIlwLI/IvGLC5KU10Y/a+nxWjE4O+QpSRgWrGw/teb0ZmiFnViImw
	48Eo8EWLtRCHoFIxRFPmJtNDoUTkpRezDHIUH6Fi9mAbYIYPnEaa8KcRvXMWe/LjWA+5PxFTQJl56
	SIUGD/ZLxluGcQUOI6lwoWZf++VtFpibONhCSwqyXlOGl4zkKkiPx9WXVbTCqd55oTk2ULmAvdiPC
	oRF4MVBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olVUj-00FOYD-EH; Thu, 20 Oct 2022 13:21:57 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olVJm-00FI4R-Ji
	for linux-mediatek@lists.infradead.org; Thu, 20 Oct 2022 13:10:45 +0000
Received: by mail-wr1-x42f.google.com with SMTP id f11so34349140wrm.6
        for <linux-mediatek@lists.infradead.org>; Thu, 20 Oct 2022 06:10:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=aNOCO5Wzuq4FvlmMhHTUbdlTAohmkL46icpaXsf0/1Y=;
        b=QOuQgD+AnywmC273rOOD7wCOi9HQmQ56/7iOyJ75teIxtA4bmAPiRAFH7PSBR0ASfw
         ciaQkCMdpZ3rGKVFQGqUNCuTm8pFMpxtTWKEXSHu/UyfQTQCZUXjzbNmXvY7s5AiZMW4
         nKmyPm5BUA0zx39xS1iwxsU4qtfDjZQMuiPYNBFlLjObNpeA85XSgnoK6rn/OO6VmQ4p
         MdXmni/HcMV3Ewqmn4sfA1F1KWBC+Ing3I0xvg3QNRPAto+7zYp2AwrJyhOMZevSWDHu
         i+jbtGn+397825BiRkIuE3ks1wxsnV4onWdReX/vE+3+NOVOHO/VS1vkBilzwfj64BC0
         EmZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aNOCO5Wzuq4FvlmMhHTUbdlTAohmkL46icpaXsf0/1Y=;
        b=QiunP6n3wcG/G47XhgkId+Bwajp2GztvRASoBCc8I7r3jNhj7LLNMxyp8GSj7n12rz
         EHixKUYPVxu55ZWDlFHVcAVJ+aA14YRFvTnlB5uyISVx0kulGT6NK2d2W1cgfRt6Dhh4
         bEiQA1AxqJ26cEmDY0xIZD7IqJ/7FRqHdPXH37mz4nUTDgnumok/7nG4Tc51ukq34YZ6
         c4Oyb5Bn5Jb6VJ8iyy6mVcKgA+nLo+8gWJk7G+RQ/MXIdCVOvbnB2P+/62/fSQnS1/0D
         uGheH0kwZ/aSadAPD7qvXytYtc1lbRhSIsOEGXvS8dhXTgeitKxs32plEJjkmlnG0uKw
         xYhg==
X-Gm-Message-State: ACrzQf1Xhc9gOLhlbEwg2hjeScrrpVqBuCV1/2fgoYce7TyjbFyxDMWr
	urUxmxxKa27uLDQuoCL8Zv/FIA==
X-Google-Smtp-Source: AMsMyM6GCgm7Wfy7/CKyZj0ERQNdjCwx/MEL17rx5YpYMjNxqw7Ii8gcVJ3PP2LGk67rqCwyUTs5hA==
X-Received: by 2002:a5d:668f:0:b0:22e:47be:3fa7 with SMTP id l15-20020a5d668f000000b0022e47be3fa7mr8558572wru.200.1666271435924;
        Thu, 20 Oct 2022 06:10:35 -0700 (PDT)
Received: from localhost.localdomain ([2001:861:3a82:90b0:2979:1615:9a68:f204])
        by smtp.gmail.com with ESMTPSA id x8-20020a5d6508000000b00228dff8d975sm16453927wru.109.2022.10.20.06.10.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Oct 2022 06:10:35 -0700 (PDT)
From: fchiby@baylibre.com
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Johnson Wang <johnson.wang@mediatek.com>,
	"Zhiyong.Tao" <zhiyong.tao@mediatek.com>
Cc: Fadwa CHIBY <fchiby@baylibre.com>,
	Fabien Parent <fparent@baylibre.com>,
	Sen Chu <sen.chu@mediatek.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH 0/3] mediatek: pwrap: Add mt8365 pwrap support
Date: Thu, 20 Oct 2022 15:09:53 +0200
Message-Id: <20221020130957.25197-1-fchiby@baylibre.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221020_061038_678863_9807BF53 
X-CRM114-Status: UNSURE (   8.50  )
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

From: Fadwa CHIBY <fchiby@baylibre.com>

Hello,

This series contains patches related to the support of mt8365 pwrap.

Regards,
Fadwa CHIBY

Fabien Parent (3):
  dt-bindings: soc: mediatek: pwrap: add MT8365 SoC bindings
  soc: mediatek: pwrap: add support for sys & tmr clocks
  soc: mediatek: pwrap: add mt8365 SoC support

 .../bindings/soc/mediatek/pwrap.txt           |   3 +
 drivers/soc/mediatek/mtk-pmic-wrap.c          | 114 +++++++++++++++++-
 2 files changed, 113 insertions(+), 4 deletions(-)

-- 
2.25.1


