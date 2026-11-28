Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C729E606A31F
	for <linux-mediatek@archiver.kernel.org>; Sat, 28 Nov 2026 14:16:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=opClhepC;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Vd2Sqnln
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=ev8d3+xo3xhDELRSOvURnSYyDkv05Teh5t0TRLg5EnA=; b=opClhepC8Y7tFy
	ru57jvqa35g3BAqo5I3l/aEQ5RLmMUBvpd5HhCbXaj/BUSsirU+WJ6BJn0aestaroMpKNNgWF7FUN
	xxpxHcgh4BuDbPzKMNi/9gbOJRKD0rrs6gwhWqaA6HpXFj/3EVOVSufvBaoXwkrfseyHw8gcc0jrY
	P74f1IMDI6IlecpXFaCCrKhAfsE0EbgxDdFNQGyOCBTyaHZMyuyl4I1ssCzzAK4Uo+AEyRwv+6SSF
	LJ94rN6o1r1Myo/wYaDYj1yooUM2qT4yCUJn5WqDvumKjkF4X7lZCthP0Z4PwqVrk1ZDKOVjDE9v5
	QwF4Kb3xOxAA1P6tDTSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xXJDl-00000000pcF-3gyF;
	Sat, 28 Nov 2026 14:16:12 +0000
Received: from mail-dy1-x1331.google.com ([2607:f8b0:4864:20::1331])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xXJDT-00000000pPs-3LNz
	for linux-mediatek@lists.infradead.org;
	Sat, 28 Nov 2026 14:15:53 +0000
Received: by mail-dy1-x1331.google.com with SMTP id 5a478bee46e88-38692f62b22so12662732eec.0
        for <linux-mediatek@lists.infradead.org>; Sat, 28 Nov 2026 06:15:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795875351; x=1796480151; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ev8d3+xo3xhDELRSOvURnSYyDkv05Teh5t0TRLg5EnA=;
        b=Vd2SqnlnfQLH5tdk0tCKSOucNSE+eyB67AUyI+UTA9gxOClI87oTZgWqDKMDJr9nrO
         LKAKGHSlQ9ShqM1w8w7mBR5rmKvyPycRbJnci0H0I0WrHUcI5mSZ6MybVww40iJzDude
         NaQt8wWtmX2z2IPFRQT5njRkDsNx9859Q2iAfMfOQ/7EYqVQNkI+5v0jQby7mccCnDN/
         K05vlqy1JO6i1Rl1qrkdxIwq7WIuiZo/UfC0X/2UFAZVGb7h20jfQD06xdzrPZgbB9pu
         kk34e8uLbv9GM+nhRRI+jejMhNcMefzSAygXZebva/MmxmFZF5ZzA+Yi+MUWcx6xQWGY
         Obag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795875351; x=1796480151;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ev8d3+xo3xhDELRSOvURnSYyDkv05Teh5t0TRLg5EnA=;
        b=y1E3LQvuDSPPDpbFIB9zTqg9lATBeStMbM91kZrQcjexGxe2K1hUxfwwTAt1qYQUNV
         TyZNw4fOn4OijhSSX03nlFZNMlA06HtkctCzsShqd+CAJP8KMj7slZymGrs1qNgMVrms
         IrKpam+cr1A3xDrRTyEKzL4qqOtt7mDNcWZA1+8lQOxwX//NjDPAqdDJVN6FTeNAZNB6
         kNQ1CAoXPutlf/ppSTy4di3R+vUIyfG/T5QvPVO4Sv101I2E1tXxTsrSXxad8QBEP6jd
         BTrgLbXBDbuHbHg3YU4y4FFA1doAaDQttt2emH17fBWrJfunX7hfCdjnvGEEK8Wj7vqQ
         Fl+w==
X-Forwarded-Encrypted: i=1; AL+hErFzsYOqTLzfajrrd0YP5/5O/o8zV6nJ6hY8dObEIc/3kG5T/CXqoosN+a+1B7fDhPSzTSxu5sMS4Va8HnQmMg==@lists.infradead.org
X-Gm-Message-State: APuU4Z954ONYKk7oR5W2zxAQDtFvFqf3A4LvNdPbawOyU7hPbiNcxUtM
	ZuFck2ZGSvqMmiG1GEz4yilfUw+43NBHdRAWTpx88avkXhPPHxdOGmB/
X-Gm-Gg: AZFdTZeDvF4Ej7e9JcxlWC5BlcYXJx8gWPsKCyPFHpQ/7RGpi9zrQcxhqHMsWvCs6Q8
	VvQKdm0qluqKkKU8qr1hu52WThNq6slTtcpcclc51brbt/LK1M/fhfNc1KuF6IiTPDflQwX9CWH
	DK7QyZ1cekd4Y1w9nYYrHx7WIBVbm4GQ849X40+/DEINwOY5rQNhFRw9mpOCmQ+2dsmYPedYvx8
	piJJX5urCfHUgc5ZVmXw+isw6F6nwHwyL6DwKU1xGXp342hcECD0hIm/garcznjqG4EsPO7k9nZ
	5IlgT/gqx/iOLKGhqUvaTDowLNXrm37Ma2A2SKT/Uo0rQL0kZQJyIcz+ALfNp5xBbjkRNy26cDl
	k3KaPIcENF77WzceImkOl4ldr6L4clad9cJLVeTehtVB2OtOHE2Ln/qHZ+tSbHNa8OkcJ2Fb5PO
	gxol64gkv9BjL368c1ZYjaU/F3R+5ESQMchq+L7sSKpzvpTqOqBB1CrM8SKKQ0jQ31q8Lr4iSoe
	C3e11WbmAGSqLj3dEVMPO50r3aquL0HnV+t2iJpqNn5ySEUJzupoqiP8WNWwqJUslQLpThsFXGB
	TKhuqikMgz3ueCv/SkBcnlsvzlnAB1rCUr/fAMLUzrgoxnlcEs/wEuvmEcjFFYKi9H0w1Hat+Yo
	VKIRQfDM8JfLiOxZk4649zzJeqiczY47ANTSMoMaDeSfDGF952Q==
X-Received: by 2002:a05:7301:3a82:b0:374:ea35:9069 with SMTP id 5a478bee46e88-3856fb67380mr24839784eec.39.1795875350839;
        Sat, 28 Nov 2026 06:15:50 -0800 (PST)
Received: from localhost.localdomain ([2405:201:301c:f8cd:241f:982d:147f:bf76])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e7f59sm87185893eec.6.2026.11.28.06.15.44
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 28 Nov 2026 06:15:50 -0800 (PST)
From: Aryan Sinha <sinha.aryan03@gmail.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Mark Brown <broonie@kernel.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Benson Leung <bleung@chromium.org>
Cc: Leilk Liu <leilk.liu@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>,
	Chen-Yu Tsai <wenst@chromium.org>,
	devicetree@vger.kernel.org,
	linux-spi@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	chrome-platform@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Aryan Sinha <sinha.aryan03@gmail.com>
Subject: [PATCH 6/6] platform/chrome: of_hw_prober: Support trackpad probing on Tarkin
Date: Sat, 28 Nov 2026 19:44:30 +0530
Message-ID: <20261128141443.13065-7-sinha.aryan03@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20261128141443.13065-1-sinha.aryan03@gmail.com>
References: <20261128141443.13065-1-sinha.aryan03@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261128_061551_929118_E248233B 
X-CRM114-Status: UNSURE (   9.81  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -1.9 (-)
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Tarkin ships with either a Pixart or an Elan trackpad on the same bus.
Both are always powered and expose no reset or enable line, so the dumb
prober can pick whichever one answers, as it does on the Corsola boards.

Signed-off-by: Aryan Sinha <sinha.aryan03@gmail.com>
---
 drivers/platform/chrome/chromeos_of_hw_prober.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/platform/chrome/chromeos_of_hw_prober.c b/drivers/platform/chrome/chromeos_of_hw_prober.c
index 54d894161..215fa9adc 100644
--- a/drivers/platform/chrome/chromeos_of_hw_prober.c
+++ b/drivers/platform/chrome/chromeos_of_hw_prober.c
@@ -111,6 +111,10 @@ static const struct hw_prober_entry hw_prober_platforms[] = {
 		.compatible = "google,steelix",
 		.prober = chromeos_i2c_component_prober,
 		.data = &chromeos_i2c_probe_dumb_trackpad,
+	}, {
+		.compatible = "google,tarkin",
+		.prober = chromeos_i2c_component_prober,
+		.data = &chromeos_i2c_probe_dumb_trackpad,
 	}, {
 		.compatible = "google,voltorb",
 		.prober = chromeos_i2c_component_prober,
-- 
2.46.0


