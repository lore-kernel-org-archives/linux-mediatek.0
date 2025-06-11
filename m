Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8D28C71136
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Jun 2025 00:02:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Bvfq/1PthJkt3QRBA4xnMMNhlIO3I3TLPySbwtnDOss=; b=BPkzFxB1FytKPHr9733Nj3Yrva
	ra3WZSDEzmXXe5Z2Ds6RddQAonTkyVQwbZwKgl3crPzXpZlTCbpCnDhxealYMGz7CZ5g5yue9a6sS
	3/W0J4YHoYbn3yUXu7ErcGHRtIPee/14+7m11UlxG0/9/n+kno1SJ4/b27Ko0LK8Q5edA9v1tZvs5
	YXzrOX8QhVjaPMX4t9hKhODcOBGl6UDsSMQ8oC84Y7/AY/OWpALoBYm+xlJ1o4lR8xiCFg0hsvRVE
	wpSnfnJEKxLRNIbekVU64nZT/yYh9peWewiXF7Xf4ykqrf4RqEOWBu1Ux0jM6gsmhGlCyiBc30pY5
	GDG6Rgdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPVOi-0000000Bjzq-1cV2;
	Thu, 12 Jun 2025 00:02:24 +0000
Received: from mail-oi1-x22a.google.com ([2607:f8b0:4864:20::22a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPU9y-0000000BVpl-3Y4K
	for linux-mediatek@lists.infradead.org;
	Wed, 11 Jun 2025 22:43:07 +0000
Received: by mail-oi1-x22a.google.com with SMTP id 5614622812f47-407a3c10d03so214551b6e.2
        for <linux-mediatek@lists.infradead.org>; Wed, 11 Jun 2025 15:43:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1749681786; x=1750286586; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Bvfq/1PthJkt3QRBA4xnMMNhlIO3I3TLPySbwtnDOss=;
        b=03B2ROHeb1ZFh6i19htmhSXl4J3Gfpfohwqsa4feCnxkHjXnkQcxIZX9UjuQ1RR+O2
         jpE88i6uNhmEXJNl4wWB2+GxbliK3nrILEwYAtOL+b0xWhvNaj4Pih7h08zhvJDiagDR
         ZvKLa/Ta870pIJaUokT5Qw3F1CXe+4pqCWaBhHv3hZZ+FxLhFp7vd6nUBndNzMcmt7Yl
         h+zziJ4kBOzo+fbqobGQhP+HYCanTrjNcavyuuhYYVnmdjfIXjuCI6km7My8jsvelD2l
         gw3+DyL0zuFpQLH90AthK0VMUXuhi3sLCJcjxFvPsD3XTekZNzGX/qTtJWmzRvAVWBgo
         wPKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749681786; x=1750286586;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Bvfq/1PthJkt3QRBA4xnMMNhlIO3I3TLPySbwtnDOss=;
        b=jeO6cXimAMAE6DFojBZ/AAnaodoR0SK/jt2SG+IBgsDBrgtM2dzcE4Zm7le/PwjNJK
         tmMwkskz2RaPnSKZHC+5GwWXHxzgsqBgHlcjqAw0QbjhQ7FEhnocbuHdl2IUB46wVeWp
         QFkUmWn+nR85UzCGdFJ8cQsR2la4VTR7oKU+jIlSrQNl8xPptog72MBeG/DkeQFh3uZ8
         jzwySP+LfbGTJoME2QXY/GTiCnwk+Uthi4uKWH6tgCtCf/VXZcp8rH5D+Ye1t5eRZBj8
         9GTN1T0O5zTyfw7aPVPwiEPesmb82sF3J2qCP7K0QF95uoBmNzTv9kNEaGAdvlP+VfEb
         57Sg==
X-Forwarded-Encrypted: i=1; AJvYcCV4rSbRqztIXSS04suiEySb5Mzx5HWbB0Esc5QKzRPa1no9ORcoZhEbLzjti6OnvVZo/a2tB4Nk38Qb4v7vrA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzLUoWgvj1okp3ByI9Bjuj1nPJjDv5VDQC8egZ8phWX/J9TOl1X
	9dqIwUbh+LXhWP2rCDGIwtaZr7LpOVcrvTI1jsn5sp2NEjq2+2tQa4JIpkrD3LnSiVs=
X-Gm-Gg: ASbGncsfmUYXUhsbtVuq1sf6Yseh7Pjk0g6kIENMbjPy7g8GHS5cFqf9AnyRg+sIeI1
	LXIEgvmGx8PMq6njYkRVh5FucxJYgjc9FZVVY6AycDI+fLdUU+3mLvdggjWgXzORwp7cfes6oFw
	NrOvqb2GjQBg93PMM+zbC7hgwFK34/pjUKxUZqN5K0iQHR9v9DmEYbaLXOa4DwNIYvMjoOixuDE
	APUyVyksUUdFQeCwYwBcEtVrTEwr/okO2Q+xCuZ1vUgB5Kw3sd7eCfcC2drNbuuqlPhCgvy7aC/
	PGPyAjKpx54INX71IfQloMiUsW2VRmtzP4g0XTUajQ+qQ78tPcJTosZ3O4qiMYCFTUEh
X-Google-Smtp-Source: AGHT+IEzxA2Sz6qgNCiFhtXAvcRaONOijMvYTiFTuj8n/pknGpxJ7PSUYEWQmDmDDdoICgN5Se7ZKw==
X-Received: by 2002:a05:6808:3189:b0:403:31a4:f3fa with SMTP id 5614622812f47-40a66b562cbmr545614b6e.35.1749681786177;
        Wed, 11 Jun 2025 15:43:06 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:1d00:4753:719f:673f:547c])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-40a682fbf05sm24684b6e.32.2025.06.11.15.43.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 15:43:04 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
Date: Wed, 11 Jun 2025 17:39:18 -0500
Subject: [PATCH 26/28] iio: pressure: zpa2326: use = { } instead of
 memset()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250611-iio-zero-init-stack-with-instead-of-memset-v1-26-ebb2d0a24302@baylibre.com>
References: <20250611-iio-zero-init-stack-with-instead-of-memset-v1-0-ebb2d0a24302@baylibre.com>
In-Reply-To: <20250611-iio-zero-init-stack-with-instead-of-memset-v1-0-ebb2d0a24302@baylibre.com>
To: Michael Hennerich <michael.hennerich@analog.com>, 
 Lars-Peter Clausen <lars@metafoo.de>, Jonathan Cameron <jic23@kernel.org>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Heiko Stuebner <heiko@sntech.de>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Francesco Dolcini <francesco@dolcini.it>, 
 =?utf-8?q?Jo=C3=A3o_Paulo_Gon=C3=A7alves?= <jpaulo.silvagoncalves@gmail.com>, 
 =?utf-8?q?Leonard_G=C3=B6hrs?= <l.goehrs@pengutronix.de>, 
 kernel@pengutronix.de, Oleksij Rempel <o.rempel@pengutronix.de>, 
 Roan van Dijk <roan@protonic.nl>, 
 Tomasz Duszynski <tomasz.duszynski@octakon.com>, 
 Jacopo Mondi <jacopo@jmondi.org>, 
 Jean-Baptiste Maneyrol <jean-baptiste.maneyrol@tdk.com>, 
 Mudit Sharma <muditsharma.info@gmail.com>, 
 Javier Carrasco <javier.carrasco.cruz@gmail.com>, 
 =?utf-8?q?Ond=C5=99ej_Jirman?= <megi@xff.cz>, 
 Andreas Klinger <ak@it-klinger.de>, 
 Petre Rodan <petre.rodan@subdimension.ro>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 David Lechner <dlechner@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=929; i=dlechner@baylibre.com;
 h=from:subject:message-id; bh=UW7Bx8ZURpZRdKW8GhG9VQDYCD+6f2n+DIethjWGd1w=;
 b=owGbwMvMwMV46IwC43/G/gOMp9WSGDK82AxWczZcn9t22vxZreO96Ev3Hf1fuZXnZ25ICSzpP
 XO+89HZTkZjFgZGLgZZMUWWNxI35yXxNV+bcyNjBswgViaQKQxcnAIwkao77P/DT3lqzXe/zn1s
 h3e/z7q+bpFp7GeZuULWKl1hX6qm8k+l9c7Uus/9bWfDFaKXxB3Sf9bVp7PzdswS9ZB57fbd2bs
 9DN64lqm9C9hhL8usdXSC/UK1SIvH+gkLWi1jV5+9WXnOxz7DZAbPKa1ug4TndQ9vSd5b8HaCvL
 H71aO/c5o12+TDV7dUx03cXXby7LJjMXZGwZkZlrXvL894O2uN3Z2kraLbH5m+jZN5Zror4rxGk
 idH5xtfc5VfqxTF58pnWEt4TC9qus7BwvP5lZUuj4ugdWhJWFpJSs2GpkXrpm5k1W3Tt8+R3Bi2
 rjKXxaVg2sXJoUKyX2+y7S0LaN2e9Pslj3Dx05DQFe3SAA==
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_154306_890621_A523DFE0 
X-CRM114-Status: GOOD (  10.84  )
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

Use { } instead of memset() to zero-initialize stack memory to simplify
the code.

Signed-off-by: David Lechner <dlechner@baylibre.com>
---
 drivers/iio/pressure/zpa2326.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/iio/pressure/zpa2326.c b/drivers/iio/pressure/zpa2326.c
index 1640aa3717eddc135dfac9d5e45d899ae2579f64..6eef37c0952d7c209478911413de2cf3d2552920 100644
--- a/drivers/iio/pressure/zpa2326.c
+++ b/drivers/iio/pressure/zpa2326.c
@@ -583,11 +583,9 @@ static int zpa2326_fill_sample_buffer(struct iio_dev               *indio_dev,
 		u32 pressure;
 		u16 temperature;
 		aligned_s64 timestamp;
-	}   sample;
+	} sample = { };
 	int err;
 
-	memset(&sample, 0, sizeof(sample));
-
 	if (test_bit(0, indio_dev->active_scan_mask)) {
 		/* Get current pressure from hardware FIFO. */
 		err = zpa2326_dequeue_pressure(indio_dev, &sample.pressure);

-- 
2.43.0


