Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67BC1C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 May 2022 15:19:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ockLxZIG3mJN5uiemQgMCtgV2+iPGbCNJutyAJaOmTk=; b=DqUfi8EcE1qtNo
	12w2jqtrdyEMqCi5/9kDzY9Ie22gd5g8JdSB/UulWDsUmoSoWGgzfqcdsKK1A2sPHBDfsshRa3khV
	7/fpHq5OzwalB4qA9cOPvZC22e2BUZW77gzwVhJeUc5ISb43Y45Zhk6QCpSVB4yHi0sFV46RVB0y7
	XyYPlKrhVHbPWCsLjE+3HBPV47+ROpLpFXd8cayOLXoWbpI//EZ0cuPh9Av0BLrhXnsCnKdgx5xls
	EogfCBAwTG9E6WSWxXSqfgal9OQ6Ne3dj44NFQHMMxo8ZXhSEoBQgVWq2xSP3CXkuLQ4t9g8xBkDR
	RZWsFMDJmsJRKglNyVow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1npX4E-00GcwI-0S; Fri, 13 May 2022 15:18:58 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1npX49-00GcsJ-Nn
 for linux-mediatek@lists.infradead.org; Fri, 13 May 2022 15:18:55 +0000
Received: by mail-wr1-x432.google.com with SMTP id q23so11886443wra.1
 for <linux-mediatek@lists.infradead.org>; Fri, 13 May 2022 08:18:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=aZq4fC2Rak5UWYJ3VIIYdWjnbZR2sPVVIaexZnW1q/I=;
 b=HQi8r+ZoZeMt4xZoWTa3lRBsVXxOn9iEpiGjsop/qcVb8GtAWT7q4ejCTLXnoYStp+
 t2MLJ4dQ3KYgeA9XJjgbJZ6szcX/KAygjsrTG6rO2zuz24jEesb7vWndS0NDrUOIRX7y
 9lYwfTflLqPnC1vPRLYuSB16+3cZCG8xVSj8mRtZOpTtHVTnRutvuuVwvvOe0k9v33ou
 /zQuGgtcZE8eSGSAFwbrY/m+2xZ6+0UAAF9fflSDvh6BXrguAQ/ZCeb67WFjzyrJ19cp
 4VsF+OsNbQmSWskXl/8o98wPcjlc0Qv5YQMhvVMsrMFpxDGf16yquD1ruPHIoCkt6PsZ
 ouCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=aZq4fC2Rak5UWYJ3VIIYdWjnbZR2sPVVIaexZnW1q/I=;
 b=PUGv5ls0OuCfxAsDrOpE5txbGYxmhya3Sn+x6xZVq3LBNBv0L87kqRWYWrOpvXbgkt
 XzxM60T7Km8KhJ5VqFpFR0FBWAf3qu4RneCiCKHF/Mjv7itrUv3q0zEMhmNzvRJKHPXk
 lh6LkYWc6NqI1f2WQG9aeGAA2TTdrd7QNSulr9BG0emu637mXkaX4StfsGlSskdOtxW7
 gbo538ozaF3JtsVmE/yKA9zknm3jPzF2OV6hE7B6JKgdtAZ5rJQlOsaondNn3mPlcujM
 WFiXx1k4flIVIcVYufkDGNH/7uAx4nTlgw+eGtmEGsPqWlWySH24kSK1LT9+NWIUDU4W
 eEgw==
X-Gm-Message-State: AOAM531r3DGP0De4iphYe1bJeunG0Wxqtfjr1OWyYOJZMOwcKHOW7cAU
 MDuRHCaOL6OFR0R6uSCvsHlP2w==
X-Google-Smtp-Source: ABdhPJzA5hibYWer3Lwq832/9i84TeS4ajByZLSB7T1HAQ11tmgx+UjsG7iBBisRg7iuu3/eHnmloQ==
X-Received: by 2002:a5d:5960:0:b0:20c:5a12:20ed with SMTP id
 e32-20020a5d5960000000b0020c5a1220edmr4425513wri.303.1652455130320; 
 Fri, 13 May 2022 08:18:50 -0700 (PDT)
Received: from groot.home ([2a01:cb19:85e6:1900:9353:61cb:4e25:b9cd])
 by smtp.gmail.com with ESMTPSA id
 b9-20020adfc749000000b0020c6a524fd5sm2800825wrh.99.2022.05.13.08.18.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 May 2022 08:18:49 -0700 (PDT)
From: Mattijs Korpershoek <mkorpershoek@baylibre.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Kevin Hilman <khilman@baylibre.com>, Fabien Parent <fparent@baylibre.com>,
 linux-input@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Mattijs Korpershoek <mkorpershoek@baylibre.com>
Subject: [RESEND PATCH 0/2] Input: mt6779-keypad - fix hw code logic and
 row/col selection
Date: Fri, 13 May 2022 17:18:43 +0200
Message-Id: <20220513151845.2802795-1-mkorpershoek@baylibre.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220513_081853_812786_F2DFD817 
X-CRM114-Status: UNSURE (   8.30  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

This serie is the first follow-up on the mt6779-keypad in
order to enable it on the MediaTek mt8183-pumpkin board.

To fully enable it on mt8183-pumpkin, we still need:
* double key support
* dts changes

To ease up reviewing, I preferred sending this first.

The first patch fixes a logic bug based on the (non-public) datasheet
I have.
The second patch configures the keypad correctly in order to not
report bogus values.

Thank you,
Mattijs

Mattijs Korpershoek (2):
  Input: mt6779-keypad - fix hardware code mapping
  Input: mt6779-keypad - implement row/column selection

 drivers/input/keyboard/mt6779-keypad.c | 26 ++++++++++++++++++++++++--
 1 file changed, 24 insertions(+), 2 deletions(-)


base-commit: b243018eafeb69bf074ef013c54504632fd161ec
-- 
2.32.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
