Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21B9ACEDD9B
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Oct 2024 14:15:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GW125rK1qMhe8tTkPohTVuXewXBf8N5Xg+9sFg27JeQ=; b=sPeFSLpLQBjfGqdd8xHcp+WC0A
	lchb1TWMChfBknC0XwYwmM0pbxJHkDWl+hgzaS6lSbbQ4vBr7Kd6ampeJFsjy9Po3cDtt39fsv5yg
	nxjMNaydl1aRSf0AKkbng1PPYvMW7NFd/4eJKanNYdP4tL/AnE5nui6zq2qZXHIuUdF7sSC+9ChJE
	HZKcjEbPiZR/n2N7eovMX2nwW48OtrxyPJNLI5aMJP7ys3Nl0hFLuKaRcjSfCsQaslTv3/hqAdVrv
	W0uDxDiv+ejwi5zNVp5QLLw+WJZAgorQAgC1BjNsvvXks0aHVGRvwcKZU6VGnTb3IiQC2xaT6r3TQ
	HmOGYcYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1syXTi-00000009YPO-1Agm;
	Wed, 09 Oct 2024 14:15:50 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1syWIK-00000009K8q-3f9F
	for linux-mediatek@bombadil.infradead.org;
	Wed, 09 Oct 2024 13:00:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=GW125rK1qMhe8tTkPohTVuXewXBf8N5Xg+9sFg27JeQ=; b=c35ty6+b+aD8Bo3g+ShGOM40ke
	xOUyE+7ly3hIeNzTABrEWwjqHlh7D/3+VOO6taXulajJf+OD4jjJAL0rC45p8EAfrU+uso9CzrCDs
	qfwQMRoDi8O95TdC+u4VFVfyNaPifFZXoJlNOsZUFCRk9IezFD1R9h+2/vf8044UWGxCUqBcTz8BC
	G+sfo/2Qmn8h5JY6YWxt1MCZZN4qJ/QxkeU5Gr8XFJouXRjdwUaVVrEZGXM6QhSfApi2mCJ1t3PiR
	RDBfTgKxNhDXpLtw2lHHTghWlGH0e3rynx5df38dUMximnWNEnUqKCp048pyXW/9mUJH6bNNyHGRR
	rdc+5axA==;
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1syWIH-00000004xBI-10BB
	for linux-mediatek@lists.infradead.org;
	Wed, 09 Oct 2024 12:59:59 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-20c544d345cso7051725ad.1
        for <linux-mediatek@lists.infradead.org>; Wed, 09 Oct 2024 05:59:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1728478796; x=1729083596; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GW125rK1qMhe8tTkPohTVuXewXBf8N5Xg+9sFg27JeQ=;
        b=nldo3Zt3xwYnugM437Ne1G0NI+88r6f0Mg5QiQ3d2fHEZ25OhSUYEkqwOrjuzwuYAd
         QpMNtlyU9ia7e3TTPJEC6WZ8iVbrbEf+izHtzFtjXnaFgqDJkrhpzZKvCHfjxNf+eClr
         DrU7MrRckWSnGUGFU3cmfz6Rv6Hcbrat5MLVo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728478796; x=1729083596;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GW125rK1qMhe8tTkPohTVuXewXBf8N5Xg+9sFg27JeQ=;
        b=FvAMx2FSJRWZ2Ng2BJYWftMdI0KX7NhyoSMvd0OkjPZaZoVTozSRfVDvwOl8xKUGby
         eKil9zZqk02m/0lUqNBpR+l/8HhOBpmFBlOLyOhIuC19VK0Ufbn+AP6HveG78Ozx8Am8
         Cbg3gW7oK0UGZyljD8BDcaEDK2elhbV5J335kzalrHmyAf/Be5XLRFP1t0Yk4qVHdhpG
         FDlZaXlLQa8M+MARoRyO40WP6H/RAt131u+DtGRCQMEcGXrjkyY854UEsqLq7JKyOLy/
         pRqFKoWhttoWTiZFMamQrtGd/dZOKkEL9fNWjV6ivjpZTeFR2AKkEstsa6I0VpgcpR17
         WtgA==
X-Forwarded-Encrypted: i=1; AJvYcCWt6PRHax/hhZhfAv0P2vs5Qmv3Ypfg+TavNpQJlJfpIH06pZtjWdKg4/g6rCwQ4Rcf9q3eZ0Ojqg1GTuo0gA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxw9F2+5qUvgy8KkTouYU+Q9DvHRoS7xxNkSXqA2UJiDLOjwqkm
	tI51+NBvYaJqA2qOYg2UB6ifs8/Glcf0efNvzHXBJjYQqC8SkAKZunfWZ7DOvw==
X-Google-Smtp-Source: AGHT+IEeIV9JUMTLHFFYpP+b9sau6k/8F8xIc6y7xI2G5swJoYDmvi+4gA/+2cH27Bpzc7lxTAoyQQ==
X-Received: by 2002:a17:902:cf41:b0:20b:9831:9edf with SMTP id d9443c01a7336-20c631651abmr46041525ad.6.1728478795844;
        Wed, 09 Oct 2024 05:59:55 -0700 (PDT)
Received: from yuanhsinte-p620-1.tpe.corp.google.com ([2401:fa00:1:10:bfd7:eb4:8571:b3f4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20c51c21535sm27434005ad.216.2024.10.09.05.59.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Oct 2024 05:59:54 -0700 (PDT)
From: Hsin-Te Yuan <yuanhsinte@chromium.org>
Date: Wed, 09 Oct 2024 20:59:45 +0800
Subject: [PATCH 2/4] arm64: dts: mt8183: burnet: add i2c2's
 i2c-scl-internal-delay-ns
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241009-i2c-delay-v1-2-6cf59721c1d1@chromium.org>
References: <20241009-i2c-delay-v1-0-6cf59721c1d1@chromium.org>
In-Reply-To: <20241009-i2c-delay-v1-0-6cf59721c1d1@chromium.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Hsin-Yi Wang <hsinyi@chromium.org>, 
 Enric Balletbo i Serra <eballetbo@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Hsin-Te Yuan <yuanhsinte@chromium.org>, 
 Daolong Zhu <jg_daolongzhu@mediatek.corp-partner.google.com>
X-Mailer: b4 0.15-dev-2a633
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241009_135957_430538_70DEC9A1 
X-CRM114-Status: UNSURE (   9.14  )
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

From: Daolong Zhu <jg_daolongzhu@mediatek.corp-partner.google.com>

Add i2c2's i2c-scl-internal-delay-ns.

Fixes: dd6e3b06214f ("arm64: dts: mt8183: Add kukui-jacuzzi-burnet board")
Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Daolong Zhu <jg_daolongzhu@mediatek.corp-partner.google.com>
Signed-off-by: Hsin-Te Yuan <yuanhsinte@chromium.org>
---
 arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-burnet.dts | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-burnet.dts b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-burnet.dts
index 19c1e2bee494c98c0db87308494713a26e304cd2..20b71f2e7159ade7e7d2135aabe6587c8f8d64de 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-burnet.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-burnet.dts
@@ -30,3 +30,6 @@ touchscreen@2c {
 	};
 };
 
+&i2c2 {
+	i2c-scl-internal-delay-ns = <4100>;
+};

-- 
2.47.0.rc0.187.ge670bccf7e-goog


