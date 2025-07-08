Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40139C83F09
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Jul 2025 20:42:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=scg75GovixsEvdVxNi0J1MYQaQj+4lzopjkTkcLZ+rU=; b=XH42FW5T/Z++0rfTe8JE3WUVn+
	HRbJW+UWl41IF7fdAqPr4gKema26ixZbnpBv82c/SbOZKIpqURCUikrYo6UbrVhE+7zX5rcncU9PX
	YtD6OfduRthHGE9Qg8xhFz3Waqc8czjsvgEljKel+Z+RSa4bIYG2zva0Vq2ZbYAcqk2eCFo0g7aMd
	Z7eStFn6hIEDFtRWLY3Fw0fPA4DF7aRBW20KxHVNum/PK5lqUvlGeLqIulOR2OldNmf3WprNnmiXm
	4bxujbm0OsJ2YkuzBVxOul09DRA5gMeCk09g2VE2oKPP2A7DsySfLTPgrM045pIH/yLTT440piBb+
	Wy2Hpcdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZF8f-00000006Xud-0rjY;
	Tue, 08 Jul 2025 20:42:05 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZElB-00000006U4J-2lp6;
	Tue, 08 Jul 2025 20:17:50 +0000
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-747e41d5469so5426833b3a.3;
        Tue, 08 Jul 2025 13:17:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752005869; x=1752610669; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=scg75GovixsEvdVxNi0J1MYQaQj+4lzopjkTkcLZ+rU=;
        b=YFnT4FK1Vuaz7nsoWAiR+qkb5+Au5gj+qMds0LqEadZlOciCvjcDz3AGUedC+WE7LX
         NtG3EpWpEaeiUuUqvjyMzo83OBKhXsE7gfv9QtLHHoAZrmwSaP3dlL/zB+HWD0wuwc7t
         tR4c30QDvJvLDMylc8T1xWkKRRnw7PB7dMBIqOcsRcu2gQzXyXVAzobVQuzlacggvmSJ
         rGlWWvDIDU8DdMpyQ73OwBCVSrzcfesiRc+4j4ARBWlRmLCdtePrB/5UQyK47URd5HYP
         obCWWFcD3tDBqBMcI69kV+IBLcAJYOqIypFUCL6eGlzGYj4+Oou77WS8l5SRGzZG5aVp
         qinQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752005869; x=1752610669;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=scg75GovixsEvdVxNi0J1MYQaQj+4lzopjkTkcLZ+rU=;
        b=cIj2WxewyIF8E5Zljs0OOTNeud6Ja4/eU8CfaLeZjI/DLF7d8Grp6ScEHLOjKWBUW9
         E0fXD+fyY1IWSrgLTmN3940xlp10/oWH2xtMmA8LfWHXBYhv5xLEn093UWPY/6UQxHU+
         0s7PeCJb2FtRDk5PbN0W27ihlMnYCOuNo3Z8UtZio2+a6vMmG5VhvRTV15l5aa9bIan+
         htXQV6RnY3sIldJq4TGbzVHY70j2zlpLGfZo+0dbACGaS+QsHZeyfOrfEhc5L9y6NIrT
         vHI+w12zdk6Oe3PcpRVB6rTLFdmyUSijASRs7cAZV3TPbRGz4UvdptUbOpPZVUcCTBsz
         pA2Q==
X-Forwarded-Encrypted: i=1; AJvYcCUTghilpv0Ax8pTLiCfdOCCsaTlG9k+wQg2c6GNzKbKLnTCp5NEY6per8hD054UskMuu0bNQ66jC4INCKDB/22y@lists.infradead.org, AJvYcCW0JHGztp8XGD8W89hB7DDsDxUPMP/GoqnT2S08+QzrPX39CRnRVjpaIHQ6fetDLlrwD/H4ZxZFsG7hSpHUioE=@lists.infradead.org
X-Gm-Message-State: AOJu0YwZZfCOX/ASGQ60QPpbiSjpnX2t61EcG/TChO2h5ueHgA8wHZYM
	z+DZmyLvioq++AFqilCONN3sf0pfGadQ4RtLLTZ90KRWf449qIvppRfc
X-Gm-Gg: ASbGncuUwkG1KfxzQp8fn5DYNQWnSzvsdnpnkRuN/OkH1OawlD/SY3wFs41N0vb+xKc
	WfrX865Yui9BEP04Xea6vJqOaorq5g/NeMI+euPZCvHMAbf9+5fJONYjw23kj79Bwk7Ga1hLTFK
	hvT4h5UTc0aqAycal3WvBxkGFfoUzUNHzvQYdpaMcGfklfKM9T8uxNrWaVf7vBbZNjPnwR1rrfa
	8sKYyMQr91mF9oyEuWDbRA1ptVXTSE3Qa1/SAxL3ftKg2mZ/G8LXxKZjFZdsHypSH3pk54m3aCo
	YDoGuh3v5lZWPmy0XlodD9iJnImNQEtXXywfCdjUPmk=
X-Google-Smtp-Source: AGHT+IE7gQhVAwp9fhcqycOua+SFs2Dl3cKAYG1+itewGXdulvInrIn8vF9et5YngO9DfMMful4Iow==
X-Received: by 2002:a05:6a00:bd93:b0:74a:d1ac:dd48 with SMTP id d2e1a72fcca58-74ce8af6b1amr22166596b3a.23.1752005868808;
        Tue, 08 Jul 2025 13:17:48 -0700 (PDT)
Received: from archlinux.lan ([2601:644:8200:dab8::1f6])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b38ee5f5d8csm12289625a12.39.2025.07.08.13.17.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jul 2025 13:17:48 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-wireless@vger.kernel.org
Cc: Johannes Berg <johannes@sipsolutions.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Stanislaw Gruszka <stf_xl@wp.pl>,
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-kernel@vger.kernel.org (open list),
	linux-mips@vger.kernel.org (open list:MIPS),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
	linux-mediatek@lists.infradead.org (moderated list:ARM/Mediatek SoC support)
Subject: [PATCHv2 wireless-next 1/7] wifi: rt2x00: add COMPILE_TEST
Date: Tue,  8 Jul 2025 13:17:39 -0700
Message-ID: <20250708201745.5900-2-rosenp@gmail.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250708201745.5900-1-rosenp@gmail.com>
References: <20250708201745.5900-1-rosenp@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250708_131749_699982_98A7850D 
X-CRM114-Status: GOOD (  12.22  )
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

While this driver is for a specific arch, there is nothing preventing it
from being compiled on other platforms.

Allows the various bots to test compilation and complain if a patch is
bad.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/net/wireless/ralink/rt2x00/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ralink/rt2x00/Kconfig b/drivers/net/wireless/ralink/rt2x00/Kconfig
index d1fd66d44a7e..3a32ceead54f 100644
--- a/drivers/net/wireless/ralink/rt2x00/Kconfig
+++ b/drivers/net/wireless/ralink/rt2x00/Kconfig
@@ -202,7 +202,7 @@ endif
 
 config RT2800SOC
 	tristate "Ralink WiSoC support"
-	depends on SOC_RT288X || SOC_RT305X || SOC_MT7620
+	depends on SOC_RT288X || SOC_RT305X || SOC_MT7620 || COMPILE_TEST
 	select RT2X00_LIB_SOC
 	select RT2X00_LIB_MMIO
 	select RT2X00_LIB_CRYPTO
-- 
2.50.0


