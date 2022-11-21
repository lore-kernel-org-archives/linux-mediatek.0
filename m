Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CF65C43217
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Nov 2022 23:39:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:Date:From:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=GjSP03i5E+KwTrECfe197N4xDzu4tuLBSVRRI01rBMQ=; b=44yoYr96+0iRiRetrOw757eI7I
	kv57zh0jHxcilLKYkHb0wOBkfmPr+kj4TLPKgSIqj10oGyFknpwcPwwhypsOJABnLmTIejZv0gBb2
	VJ+yjzVVafz+kPqD18yJLqG8jmIC8wqpCjCg+vrzTWpEcBkBSTnl4Id/WQprw/jDkIX4/sYBb/JIs
	IS0jJk2loCeUOv8wlK36uZPZm+K0f9rmesBTG/U6CRVA/fjvDbZ+vSJ5wrgg1UbWExWNL7M4IkQxt
	qBE+ZV7unoBKDszLVYCLc8DIpJdzQh8cCczbv1ixOCVPWraWyQwn+XHlmHN++Bxo+QM3JpTRtqgws
	S6X2XAWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxGNl-001Ipk-3C; Mon, 21 Nov 2022 23:39:21 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxGNh-001IoD-Vd
	for linux-mediatek@lists.infradead.org; Mon, 21 Nov 2022 23:39:19 +0000
Received: by mail-ed1-x535.google.com with SMTP id z18so18404912edb.9
        for <linux-mediatek@lists.infradead.org>; Mon, 21 Nov 2022 15:39:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:message-id:date:from:content-transfer-encoding:mime-version
         :subject:from:to:cc:subject:date:message-id:reply-to;
        bh=GjSP03i5E+KwTrECfe197N4xDzu4tuLBSVRRI01rBMQ=;
        b=QXSA76hdXZXcn9UdshKVDU0yThYtOyFkiR3HDr57mFWmwkVoXF42Qfg/fxQ1MBSfHt
         OgbMbxtiwf89wUzPWECvGrMi3CnI+eVy8cMo/4FPD7QgPniZnd5bh87yulpN58sxglBf
         Bv2CFxQDKHP0oWmjo9oW5IksJHWmQNl+8uKIY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:message-id:date:from:content-transfer-encoding:mime-version
         :subject:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GjSP03i5E+KwTrECfe197N4xDzu4tuLBSVRRI01rBMQ=;
        b=KjJsUnLzw5yxkXHnnMDSJiGwPeZC8oKz/4+IoBWfN+D3dTIQNmjdaZ2tWgmh/qKx8/
         t2jXhe/Te3pw3Onbr5GbO5w6evyGdZgjVlXosKnldHjxemAdr5vYXU7sll3vWujH1LYW
         uhTUXcg5aX9UcKJUWTLEAzs0HErkzU7Sc+yEEWe5yOmHLaIbdod/gOTqHuLUdH6MNyEc
         49bv5ole6+cttOsM1ijs2fALOdnABM5u2PRfYaLP/tD+FCBtGjIhx3aVdq0C90Llfc5s
         IQEYW7UPdjHFn5JDPIhJZGbnRnehavpq12cMmc6UgO2r0xkJHFry03AmMl9XlPJSquZc
         y1/g==
X-Gm-Message-State: ANoB5pnzvRPmSZYCjmqCHlW+anmoOALu+uZIFAN6g5wbVjU1ckLj/DUL
	g6viMrrAjDopyGe/NYQVQ71psA==
X-Google-Smtp-Source: AA0mqf6V5GFB4dXvA8p8kldaIpbW/jfD8piqrykZbR4GJ7Wn74QuOAC+rscqT0nkqo4HRwFv4yPJ7Q==
X-Received: by 2002:aa7:cb96:0:b0:461:bacd:c85d with SMTP id r22-20020aa7cb96000000b00461bacdc85dmr17914295edt.278.1669073955298;
        Mon, 21 Nov 2022 15:39:15 -0800 (PST)
Received: from alco.roam.corp.google.com (80.71.134.83.ipv4.parknet.dk. [80.71.134.83])
        by smtp.gmail.com with ESMTPSA id f26-20020a17090631da00b007b27aefc578sm5411835ejf.126.2022.11.21.15.39.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Nov 2022 15:39:14 -0800 (PST)
Subject: [PATCH v1 0/1] pinctrl:mtk: Fix kexec() initialization
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-b4-tracking: H4sIAA4MfGMC/w3LOw6AIAwA0KuYzjaBxoF4Gz6NNGI1gC7Gu8v4hvdC4yrcYJ1eqPxIk1MH7DxBzF
 43RknDQIbIWiI8+o6XaOy1oHeUDC0musXBGME3xlC9xjyO3qV83w9UtaZFYgAAAA==
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 22 Nov 2022 00:38:54 +0100
Message-Id: <20221122-mtk-pinctrl-v1-0-bedf5655a3d2@chromium.org>
To:  Linus Walleij <linus.walleij@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, Sean Wang <sean.wang@kernel.org>
Cc: Steven Rostedt <rostedt@goodmis.org>, Ross Zwisler <zwisler@kernel.org>, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Sergey Senozhatsky <senozhatsky@chromium.org>, "Joel Fernandes (Google)" <joel@joelfernandes.org>,
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.11.0-dev-d93f8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1062; i=ribalda@chromium.org;
 h=from:subject:message-id; bh=bze2KnrOlEBNmpaBvmtcoShIvqWrNXhh8LxDvF3j3lA=;
 b=owEBbQKS/ZANAwAKAdE30T7POsSIAcsmYgBjfAwPMbbIUgdoq6PrZ9H2Kcpi0lz+5E0bJsMoV/K5
 KgRiS/CJAjMEAAEKAB0WIQREDzjr+/4oCDLSsx7RN9E+zzrEiAUCY3wMDwAKCRDRN9E+zzrEiLqID/
 9oBrfZhi/1JSkdEHdfWPAOktZbLqpryc8Q/EgZlPFLFD+zy5jkF4RdFcQhOe6bq5ebZ5bq20K6itfc
 ybvJV0ssS+Kx8tkWkBdYsbnVXvLMTtD3N441IoT1JVO4JMqMWZUkZJd3hKR4bJ6Spq2HPVF2qPB0C3
 TMrlYXwvPk2hwxkVBhmjUyEto3xk9Os0l6f2sNLVboDjMdgirx8mUk4D32Xnt1dMesNEdLShDLHCVg
 XVZzZDQzwaVq1vPFRNxBBL2LkTJISv5rbzhXOPoL4ngDWtmoxEkbSy7TCFlDluyQPE7uYUZlOtVbgY
 zvcFwLY6MGUcQin4BfqH6Zol8JvE5eEvFPnRU/dbo+Pbh+dlMq/TNorTEujBQnB0Gb75AmfLHrLiVI
 Xfj6r6/+NyWbXW+DsV1k33TMQGxr1nc0UiYdqb9fA13m8Cu/irMnxIno0iClxFO+9+C525N3aeJ97E
 xF9n6YBWFpSTDFxwGythbbSvhBB6wlpu5YmoDkCIB3zArLVMf1h1hMfAhZCYVEHWlYCZYP2zy+TjhN
 BbwGuJvHCTO4W6Ivn92WQr0GwaPeaae415K8Emt1rFUKpWf7w/eK1sR6LEdFfJ6PDfRQEsGWUhqrF1
 KzAVEGUjuMjr9BUY9atEy7DWYP7CmxnEXpvuiOjo1cD8yjEDSDyFuIHhINJQ==
X-Developer-Key: i=ribalda@chromium.org; a=openpgp;
 fpr=9EC3BB66E2FC129A6F90B39556A0D81F9F782DA9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221121_153918_069468_403228C5 
X-CRM114-Status: UNSURE (   8.39  )
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

When we use kexec to reboot a system, the hardware keeps its
old state.

This can be problematic for interrupt controllers.

Lets initialise the controller with a know state.

To: Sean Wang <sean.wang@kernel.org>
To: Linus Walleij <linus.walleij@linaro.org>
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-mediatek@lists.infradead.org
Cc: linux-gpio@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Cc: Joel Fernandes (Google) <joel@joelfernandes.org>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>
Cc: Steven Rostedt <rostedt@goodmis.org>
Cc: Ross Zwisler <zwisler@kernel.org>
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>

---
Ricardo Ribalda (1):
      pinctrl: meditatek: Startup with the IRQs disabled

 drivers/pinctrl/mediatek/mtk-eint.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)
---
base-commit: eb7081409f94a9a8608593d0fb63a1aa3d6f95d8
change-id: 20221122-mtk-pinctrl-a82d0240c848

Best regards,
-- 
Ricardo Ribalda <ribalda@chromium.org>

