Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E511C04A68
	for <linux-mediatek@archiver.kernel.org>; Tue, 26 Jul 2022 14:01:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=70sJgJ6M2wTNfwQJ3+bkMBP++3esJkgb8mg1Y3AHAIo=; b=OPKPN9dRf2ixQGiNB2yR7crCxO
	5MIrkdOr1hPDVNnKJrHDOBLtthN3rsGfyBgb8r+gm/7hPVt6rNQgbXipDZRWq+2XVJSDr9aoaCfb1
	TxW+J57Pxx7xkYuDt0zmuea+U7mhs0qp2yiYXxFSDdiApD52UXGxJKP/s+5CO/uOTxNnS6JINyQP+
	vluTfaNL7+EayUOlpKq7Dbww7ORoae5eeWk9zpfLk0SRN9GcqqHI3WrFYOn4OIH3otn+QZYu0xzVe
	WnmWgnSwxCN/3IfJz4rhsqqrsGtKxLU4fJqDhghHJRYwvHD3lXMfmg9kU84coa6Hiy6GBkDhW/FMa
	ppQ7YBlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGL8E-0001Vz-DH; Tue, 26 Jul 2022 14:01:54 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGK6x-00H8Zy-AJ
	for linux-mediatek@lists.infradead.org; Tue, 26 Jul 2022 12:56:32 +0000
Received: by mail-wr1-x429.google.com with SMTP id u5so20031565wrm.4
        for <linux-mediatek@lists.infradead.org>; Tue, 26 Jul 2022 05:56:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=from:date:subject:mime-version:content-transfer-encoding:message-id
         :references:in-reply-to:cc;
        bh=70sJgJ6M2wTNfwQJ3+bkMBP++3esJkgb8mg1Y3AHAIo=;
        b=uCZGOkTjzgvg0EGIHfkTrXgEILq36uTtM8gTe/90Li/u6m4RWaLWhuE1JMgp4sVdhr
         nBXnHLsXXOSeWLOXJ0FHTchVsF9rcMEgC/i0gCjYVVr94LcSaaLfvzCO7IgEm6rgyvzr
         cHcVisccg3W7PRg2j5JgRfCXS0pURtzJ3xznFjVv9JkQuDji612ViwKLyhfEqURzfe6A
         vtDiOLM5MrqxfyIKhvHxStZnugMbFV0bqOcHCehraaKtBEtpq4G9hPuuQhui/zF0etoQ
         gEZ16hmESIpCnRqhX4ISn5i9n4a/lIjwdW1DzbNJfd5JHGDAKrckY0f1xaUZ5BpCCvIo
         wvbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:date:subject:mime-version
         :content-transfer-encoding:message-id:references:in-reply-to:cc;
        bh=70sJgJ6M2wTNfwQJ3+bkMBP++3esJkgb8mg1Y3AHAIo=;
        b=H87bEcYYVo60ha/+OnzGM6FdOB1fDZkRIsFLyZZ6ffm3yW0dweD+q3v/hT6T/7WTf8
         y+2anWYvmqWzg+QFnAkRnURrEgy3/DCH5NE02lhPuJag1s/EFmNP8kcoeompDFE+RAdM
         RWyIT4lyBqFRRzz3ihsHjzVOQtrOxcwb/yLWILdXT39+YekJZ8us6jh44Blmpne3lCEF
         UTadEmNf/d5jImnLLmXgkqMLP+qSrXOtyg7OmwEGjXvfNrwhbETWr1D40jdA/7yBmKBR
         8d9kg/DgXh9GwAuNgM0PRo+aJz9b0GjuSxHsDlX8+/4iWTVSnX0gsUEG1iHjhem/jJ7k
         W2sw==
X-Gm-Message-State: AJIora994E/wc8utvktK22pbbE72gll1ve6op/vF4aDSnjOZ6YDyWWip
	IsvwYKoSgkmL7u3OVreQnCUTAg==
X-Google-Smtp-Source: AGRyM1vh+7xD0uRlVRAT6+8Kk92s+Z9rVWNc12KDQ9vbMZkTR+6hQDfwJmTnKb4erZvbSYKsoe4YNA==
X-Received: by 2002:adf:e192:0:b0:21d:62ee:ef10 with SMTP id az18-20020adfe192000000b0021d62eeef10mr11127350wrb.693.1658840189248;
        Tue, 26 Jul 2022 05:56:29 -0700 (PDT)
Received: from [192.168.2.253] ([82.66.159.240])
        by smtp.gmail.com with ESMTPSA id k1-20020adff5c1000000b0020fff0ea0a3sm14171549wrp.116.2022.07.26.05.56.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Jul 2022 05:56:28 -0700 (PDT)
From: Mattijs Korpershoek <mkorpershoek@baylibre.com>
Date: Tue, 26 Jul 2022 14:56:06 +0200
Subject: [PATCH v2 1/7] MAINTAINERS: input: add mattijs for mt6779-keypad
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20220720-mt8183-keypad-v2-1-6d42c357cb76@baylibre.com>
References: <20220720-mt8183-keypad-v2-0-6d42c357cb76@baylibre.com>
In-Reply-To: <20220720-mt8183-keypad-v2-0-6d42c357cb76@baylibre.com>
Cc: linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Fabien Parent <fparent@baylibre.com>, linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-input@vger.kernel.org, Fabien Parent <parent.f@gmail.com>
X-Mailer: b4 0.10.0-dev-78725
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220726_055631_373506_F80D75F3 
X-CRM114-Status: UNSURE (   7.17  )
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

As stated in [1]:
Fengping has no longer interest and time to maintain this driver so he
agreed to transfer maintainership over to me.

Add a dedicated maintainer entry as well for the driver to make sure
that I can help with patch reviews.

[1] https://lore.kernel.org/r/20220421140255.2781505-1-mkorpershoek@baylibre.com

Signed-off-by: Mattijs Korpershoek <mkorpershoek@baylibre.com>

diff --git a/MAINTAINERS b/MAINTAINERS
index 1de6a8fbf0a8..f2f0696caf6a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -12805,6 +12805,12 @@ S:	Supported
 F:	Documentation/devicetree/bindings/media/mediatek-jpeg-*.yaml
 F:	drivers/media/platform/mediatek/jpeg/
 
+MEDIATEK KEYPAD DRIVER
+M:	Mattijs Korpershoek <mkorpershoek@baylibre.com>
+S:	Supported
+F:	Documentation/devicetree/bindings/input/mediatek,mt6779-keypad.yaml
+F:	drivers/input/keyboard/mt6779-keypad.c
+
 MEDIATEK MDP DRIVER
 M:	Minghsiu Tsai <minghsiu.tsai@mediatek.com>
 M:	Houlong Wei <houlong.wei@mediatek.com>

-- 
b4 0.10.0-dev-78725

