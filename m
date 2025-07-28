Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0528AC83F17
	for <linux-mediatek@archiver.kernel.org>; Mon, 28 Jul 2025 17:06:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=l1ihiDZ0+g0CQjEWIGP/e8TLvs2vqb7vroL9ke7v984=; b=Y/CSKpptbKh/N8kFkn9UlbTAIz
	BBcEu2cKU5Ggz8vRYOnRXB5cSlLvFumI6iBL3yHdhkUcsWPYPhje1+jBtQnQV1o6cdWzqrCGtLGxB
	ZSVxutMIGwBBN/7lNtcJ9QfMGh44zNbAkMOtsZUufPCf4A64Kb4mJ7L7ZHOHyeecVR3Cf34lBhj0H
	5lij6cTRwjK+N8sfdfOssMWm/dZoeqT9ytvFiZWxo/FqYZmLmgTkbtkVvULjXxwkM0h9mi/gJXjJS
	ojnxgWH7JW2x/0TQeTtgZ1wKDCVp8BiAmTSPQ3Ppsy2+f3SuX8/xREWPZzqjyxEHr5c5YK8qF08/p
	JxXY6Gog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugRJB-0000000F41B-1eB9;
	Mon, 28 Jul 2025 17:06:41 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugQHA-0000000EuZG-0SUr
	for linux-mediatek@lists.infradead.org;
	Mon, 28 Jul 2025 16:00:34 +0000
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-ae3a604b43bso752058466b.0
        for <linux-mediatek@lists.infradead.org>; Mon, 28 Jul 2025 09:00:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1753718430; x=1754323230; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=l1ihiDZ0+g0CQjEWIGP/e8TLvs2vqb7vroL9ke7v984=;
        b=xTFhbn2HzzyQ8H2KCTen0U0f8Ml5qQLPS4hWQLIAsIkFVpMCpYr8uqoN+mGJpoQ6y2
         I2KyXh7m/znR0gP7IvzDQINyvOz0zJnZFN7AuUyE/sgs4mYMRCnhyJmE0qT7CaUaRmbE
         j1FGIBlSK1M5xMt3qxs6wAM4RN48WnHEiyL+ZBotUikaKtf8qCppgqHXhM94u86XHpow
         PIgCf3s/9vEwrP4I4i9Q2HfxbMdTbXPflKMDi+oD8IbKyJQJa+9mKGMEwHEG/EslnPEK
         Jm45UwRxP3CY2WFW4/qvVBdbGBKIL3eYHnymN+9Iwyn9wAMDFKIFt8dU6YBMqf6KnY/p
         wInA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753718430; x=1754323230;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l1ihiDZ0+g0CQjEWIGP/e8TLvs2vqb7vroL9ke7v984=;
        b=DFPcxDIjfqpaYXpyh6FC57h7B14yJ3xfkdOPwPkwTX8SLSh4rabjluLEvJZ8lJjozV
         3gJV1+kXNGV7iNRpRqMXrvkpdPqVE4mRqaeWb/YMUrpmF78wmWl7ZemEoK9lCn5MZ8KR
         15fNHyvexT175K4Qeb1KGY99wxb1+w69F5Qw1AGDXWapqFiGv6FZSUGTkkW4OJ8VaCtu
         PhaYrkqZIFRwFdPlBkjngcULAGDKceXFhVDaF7aA9TJxR5vaDFRc9PtnfRTek0iSjKib
         vLJosSNSdnvA+gDu10byckZnByX8O9klFm0oNLEcaDIWXJpdciIGmYpXgAdk3MMuiBSo
         tZbg==
X-Forwarded-Encrypted: i=1; AJvYcCXH4z5W/sczs2HgIbLBwgiwKu1mmu8a2jG9YIHrjmWqXIUl0FBToYYxJp1UNarPwxlgY6iHGxpXu/XUAzKCBw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxShy+QlpgZHG6EPi213YYdGvOTHOwDRfs2ymrLvoWyJuXKRciw
	CCVq27nxvfDWvq8TGXs3ABL4RWtgvEp0G84x5C0PgtSFThR/C6qf9zNAu0Q5VBLwyGw=
X-Gm-Gg: ASbGncu3OyY2dWWl/Nnd9XuVEFgKgFyyAyOfQDLkkhWvIyzSa9tNZlSHK0pNmppbhXl
	5zqg5anftEqOHrF6UN3PLSkhHT2Rr0iPkDetriqJNU4VKESArseXzuBqTzJ4FJObwOL1AAZHnON
	tp4L9bLUDxalFFrQPr4cEzg6sKKIAPg0sSlXMX/UDYIVnfADQWxfRY/UJPPNmIJoG6rAaMwf9We
	MI03ivyfRk16xfbyMeB9ykjtrIF9KKIkEXY7ga4n0SdamMJvRHAjO1hlrlvHJJEkVJN1eRNMDnW
	owGKUERYiB4m0igay6Q0wVEDs7ouPdSw4KI0JSUQI5COtiYMGoVQFUFLaX+WuJZTMcm0Aj+FduB
	ORonMHVNyCLnKLC0RL8Sf4aYtM3NObwVa81P2Tm0fXEsG7IH5tG9TtfN23HlIhpdC
X-Google-Smtp-Source: AGHT+IH76Ks8kk8QfxzYyoYOpncwY0lKaUyHOdNOi1xFRfhhTJpRfivJmM+awRIlgh8fpuL3iWc7FA==
X-Received: by 2002:a17:907:96a2:b0:af4:11e1:f877 with SMTP id a640c23a62f3a-af61b6dd13fmr1194595966b.21.1753718430027;
        Mon, 28 Jul 2025 09:00:30 -0700 (PDT)
Received: from localhost (p200300f65f06ab0400000000000001b9.dip0.t-ipconnect.de. [2003:f6:5f06:ab04::1b9])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-af635a610e2sm441327266b.68.2025.07.28.09.00.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Jul 2025 09:00:29 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	John Crispin <john@phrozen.org>
Cc: linux-pwm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v3 0/2] pwm: mediatek: Fix duty and period setting
Date: Mon, 28 Jul 2025 18:00:16 +0200
Message-ID: <cover.1753717973.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.50.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1085; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=2+q/5rhSE3u+zzjJ4tVGln9+xBS1cRtjqFM5t5RSAas=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBoh56RVgu+4nc+RdW9qr5CAHNu1V4qlofdKx/WM KOn65Lb4SmJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCaIeekQAKCRCPgPtYfRL+ TiZ7B/9VyhQHYZQKWjNvnWbKPuz4bKuBC35kuEAtmmNDotWdBSI14aAOAzg+5spMcaSHR/MJTOR zN0/J8S3GbN7p0I9bUV7ihguiBufeAqZijTtSZFMfkQHK3MCpyxyhszAFfMY7N8/y88vIg5D0Id d2n2i+GpC5ZzvlZzOQjbY0fvakU24YcfcnP4mgwvrBkwf2GYs3chwVClQMrGD2HbktZdBZ4Juvj GER/UTYzxrGosPO+U9vN9xLZYzr2oki0uC4HMRW6VVEauRhQ9zZYK6+3YLe11sJwdPDvvwfgula yq+uBKWv9facsWgVAySSgWrkZHy2fYuLwBqRM0Dq++aK2Ou8
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250728_090032_153856_4AB08485 
X-CRM114-Status: UNSURE (   9.51  )
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

Hello,

here comes v3 of the (formerly patch, now) series to fix duty_cycle and
period setting for the mediatek PWM driver.

v2: https://lore.kernel.org/linux-pwm/20250724210041.2513590-2-u.kleine-koenig@baylibre.com

Changes since v2:

 - Split changed clock handling into a separate patch (suggested by
   AngeloGioacchino)
 - Drop

	if (err < 0)
	        return err;

   just before an unconditional

	return err;

   .


I didn't add a R-b for AngeloGioacchino yet, as it felt wrong to do that
for a patch that he didn't see before. So assuming you're happy, please
provide the tag again for this v3.

v1: https://lore.kernel.org/linux-pwm/20250710163705.2095418-2-u.kleine-koenig@baylibre.com

Best regards
Uwe

Uwe Kleine-König (2):
  pwm: mediatek: Handle hardware enable and clock enable separately
  pwm: mediatek: Fix duty and period setting

 drivers/pwm/pwm-mediatek.c | 71 ++++++++++++++++++++------------------
 1 file changed, 37 insertions(+), 34 deletions(-)

base-commit: 68b9272ca7ac948b71aba482ef8244dee8032f46
-- 
2.50.0

