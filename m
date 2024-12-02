Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9AC2D78332
	for <linux-mediatek@archiver.kernel.org>; Mon,  2 Dec 2024 15:52:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RkEW/0Y6zT4/Atf/d+puMl0WcNDtT8U8UDsIe65uvgE=; b=NgnmY/I1ag258ZQHzL9UkUeM8Y
	GP0Q6RSyWo4r6s+rgcb9cogKRoQ9/LoKVtwvrEwDj86tx9vOSibnoGMG/j8zWLSovfGtJ+w+m4dOH
	YXv+BLtjjEvDgyIRMpcMKmjuusxJKnA3Dm98BGCrqeXIGhGu/bdf3H1AMWB1T06Sn+9OtBGHmnY0z
	pCys5AxoyUqxxtMYbhBHAgs3dwWexxDWhppq074ADKITAUWIgHr9DFxzyBsMLQWRrJGL9L00Niofy
	9UDvm1IzG6Q/pNJexVOnNS1B3e+r2rz5yQPQlSmzY0pTcbuVtDUEkKPTef70h+a6bu7OZStDdO/sv
	pcSL92pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tI8iN-00000006jOS-3j8x;
	Mon, 02 Dec 2024 15:51:59 +0000
Received: from mail-vs1-xe32.google.com ([2607:f8b0:4864:20::e32])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tI8du-00000006iJU-3eiq
	for linux-mediatek@lists.infradead.org;
	Mon, 02 Dec 2024 15:47:24 +0000
Received: by mail-vs1-xe32.google.com with SMTP id ada2fe7eead31-4af6031095bso1460440137.1
        for <linux-mediatek@lists.infradead.org>; Mon, 02 Dec 2024 07:47:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1733154441; x=1733759241; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RkEW/0Y6zT4/Atf/d+puMl0WcNDtT8U8UDsIe65uvgE=;
        b=FDRJubqaJtiS8vV27eNmwvZaeFLSAADr3R6RC2Yntf/BLrSAZU/SNvESescSS7K1pZ
         wKBQ+Ebaoyizm6NjIyuzATTZVM/r4Rmux6fW1Z9Cf0pnLpgL2wtHr3xL4pjuaYd2999E
         jXKt3ihKnfCZTX9uwNJ3uQu2SHvFBB8fc0xDk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733154441; x=1733759241;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RkEW/0Y6zT4/Atf/d+puMl0WcNDtT8U8UDsIe65uvgE=;
        b=FE/2envUkBVQzNiPLqnedS87Fs9Ba08b26E9B7+M9Lt1VoRqtSDfW8JSqzLABakdVZ
         IGMyJEDrYYVXo1VB1QGmYaQuW7A3sqSsdABeI7O0a5zMkxj+RALYtGLIKF67dLKU64KU
         JF5+vgcUoC+HV0AV8Bh57o7NfL8xeKrEtjwK6d1fBieJQg2o68DWISRBU6RCjmJ2GIwY
         nBtN6YpiOTg13bj+z5QEwZKan9dW901WguOGbGe6wXvSxJbfn4pzJw0e6W28Prp6SoX5
         h4KuyEhAk8J3/mraBgrZ/eFJPpP+OcKrkUwESZrn8oMfasrHY5RgKpumD0E7DbJ1Wd+0
         p/wA==
X-Forwarded-Encrypted: i=1; AJvYcCUpj383P+9dIsaoR177I8jy1s+Y3Lou3TzQzbLXzEKxdvOrA+dCk2TJEWIJbJ3N3l1SKiei04HpP3h//P4xLQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwVlLicORU9xxB41lidwPEG+ZKlI4j7A0hHj0kjQ3LzS74+Nbsa
	AQ/p1t2bSnhJMTT8wstS04hbadKB8/lazjZuxCJFl1bNkBfbdLApugKqKPEAo4FdZBLPm1t3xJo
	=
X-Gm-Gg: ASbGncuOHijV92E/44GzuJ40fea9unSqJaUjOfKlos/X0NTjDDX/BS01xY0/4kYPUfC
	Ex9JOt9eBoUQjcmbBtt4a/OK1Z0tHHXSXUUxczj/of1JwQFM2oyOa5+zUc9Ry51szgmTwk/IO9x
	uHRFKMRX+2oaXygWnx3uBYQaCZ+HUeBQBQtqTg2pMDcwULLGw5dMjS7WN/FgSP+2+3ILJq07t0X
	VX9TwrwaYffNuBPc7KFDDIFSbtBL7PneseYm+/YSPBhIzAP/0sZjb/QZ1ocNN/xKJdCP/xT7AHo
	Iyy5tYxxFJW2rzTH3NJSqSwc
X-Google-Smtp-Source: AGHT+IGBHPCXG9TwBD4LE/oxUh/BqCKafbDdQlV9UV4NbH/ohrUS+/WPS+6wYQbT3toO5YK2KCH6Sw==
X-Received: by 2002:a05:6122:500e:10b0:515:20e6:7861 with SMTP id 71dfb90a1353d-5156a8069d4mr18897232e0c.2.1733154441340;
        Mon, 02 Dec 2024 07:47:21 -0800 (PST)
Received: from denia.c.googlers.com (5.236.236.35.bc.googleusercontent.com. [35.236.236.5])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5156d0f8ad6sm1159729e0c.49.2024.12.02.07.47.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Dec 2024 07:47:20 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 02 Dec 2024 15:47:15 +0000
Subject: [PATCH 1/3] media: cx231xx: Convert enum into a define
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241202-fix-llvm9-v1-1-2a50f5acfd0b@chromium.org>
References: <20241202-fix-llvm9-v1-0-2a50f5acfd0b@chromium.org>
In-Reply-To: <20241202-fix-llvm9-v1-0-2a50f5acfd0b@chromium.org>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <ndesaulniers@google.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 Hans de Goede <hdegoede@redhat.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Andy Shevchenko <andy@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Tiffany Lin <tiffany.lin@mediatek.com>, 
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>, 
 Yunfei Dong <yunfei.dong@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 llvm@lists.linux.dev, linux-staging@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241202_074722_905652_9D3EA7D2 
X-CRM114-Status: GOOD (  11.51  )
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

The code is running arithmentics with the enum, which when not done with
care makes the compiler a bit nervous.

Because those enums are only used as defines (no argument or variable
from that enumeration type), convert it into a define and move on.

It is required to build with llvm 9 without these warnings:
drivers/media/usb/cx231xx/cx231xx-pcb-cfg.c:673:17: warning: bitwise operation between different enumeration types ('enum TS_PORT' and 'enum POWE_TYPE') [-Wenum-enum-conversion]
drivers/media/usb/cx231xx/cx231xx-pcb-cfg.c:680:21: warning: bitwise operation between different enumeration types ('enum AVDEC_STATUS' and 'enum POWE_TYPE') [-Wenum-enum-conversion]
drivers/media/usb/cx231xx/cx231xx-pcb-cfg.c:687:21: warning: bitwise operation between different enumeration types ('enum AVDEC_STATUS' and 'enum POWE_TYPE') [-Wenum-enum-conversion]
drivers/media/usb/cx231xx/cx231xx-pcb-cfg.c:702:17: warning: bitwise operation between different enumeration types ('enum TS_PORT' and 'enum POWE_TYPE') [-Wenum-enum-conversion]
drivers/media/usb/cx231xx/cx231xx-pcb-cfg.c:709:21: warning: bitwise operation between different enumeration types ('enum TS_PORT' and 'enum POWE_TYPE') [-Wenum-enum-conversion]
drivers/media/usb/cx231xx/cx231xx-pcb-cfg.c:718:21: warning: bitwise operation between different enumeration types ('enum AVDEC_STATUS' and 'enum POWE_TYPE') [-Wenum-enum-conversion]
drivers/media/usb/cx231xx/cx231xx-pcb-cfg.c:727:21: warning: bitwise operation between different enumeration types ('enum AVDEC_STATUS' and 'enum TS_PORT') [-Wenum-enum-conversion]
drivers/media/usb/cx231xx/cx231xx-pcb-cfg.c:737:21: warning: bitwise operation between different enumeration types ('enum AVDEC_STATUS' and 'enum TS_PORT') [-Wenum-enum-conversion]
drivers/media/usb/cx231xx/cx231xx-pcb-cfg.c:749:21: warning: bitwise operation between different enumeration types ('enum AVDEC_STATUS' and 'enum TS_PORT') [-Wenum-enum-conversion]

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/cx231xx/cx231xx-pcb-cfg.h | 18 +++++++-----------
 1 file changed, 7 insertions(+), 11 deletions(-)

diff --git a/drivers/media/usb/cx231xx/cx231xx-pcb-cfg.h b/drivers/media/usb/cx231xx/cx231xx-pcb-cfg.h
index 5bc44f194d0a..62ffa16bb82c 100644
--- a/drivers/media/usb/cx231xx/cx231xx-pcb-cfg.h
+++ b/drivers/media/usb/cx231xx/cx231xx-pcb-cfg.h
@@ -57,19 +57,17 @@ enum USB_SPEED{
 };
 
 #define TS_MASK         0x6
-enum TS_PORT{
-	NO_TS_PORT = 0x0,	/* 2'b00: Neither port used. PCB not a Hybrid,
+#define NO_TS_PORT	0x0	/* 2'b00: Neither port used. PCB not a Hybrid,
 				   only offers Analog TV or Video */
-	TS1_PORT = 0x4,		/* 2'b10: TS1 Input (Hybrid mode :
+#define TS1_PORT	0x4	/* 2'b10: TS1 Input (Hybrid mode :
 				Digital or External Analog/Compressed source) */
-	TS1_TS2_PORT = 0x6,	/* 2'b11: TS1 & TS2 Inputs
+#define TS1_TS2_PORT	0x6	/* 2'b11: TS1 & TS2 Inputs
 				(Dual inputs from Digital and/or
 				External Analog/Compressed sources) */
-	TS1_EXT_CLOCK = 0x6,	/* 2'b11: TS1 & TS2 as selector
+#define TS1_EXT_CLOCK	0x6	/* 2'b11: TS1 & TS2 as selector
 						to external clock */
-	TS1VIP_TS2_PORT = 0x2	/* 2'b01: TS1 used as 656/VIP Output,
+#define TS1VIP_TS2_PORT 0x2	/* 2'b01: TS1 used as 656/VIP Output,
 				   TS2 Input (from Compressor) */
-};
 
 #define EAVP_MASK       0x8
 enum EAV_PRESENT{
@@ -89,10 +87,8 @@ enum AT_MODE{
 };
 
 #define PWR_SEL_MASK    0x40
-enum POWE_TYPE{
-	SELF_POWER = 0x0,	/* 0: self power */
-	BUS_POWER = 0x40	/* 1: bus power */
-};
+#define SELF_POWER	0x0	/* 0: self power */
+#define BUS_POWER	0x40	/* 1: bus power */
 
 enum USB_POWE_TYPE{
 	USB_SELF_POWER = 0,

-- 
2.47.0.338.g60cca15819-goog


