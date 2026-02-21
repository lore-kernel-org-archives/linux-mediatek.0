Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7B5DC61DE2
	for <linux-mediatek@archiver.kernel.org>; Sat, 21 Feb 2026 13:38:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Pyk6Z+VoDuJMdL4eJZ3cKHVL9+OM0IxwS6L8hXr1m84=; b=l5NVWuk/xUC4BID5J74XbxYa0q
	OHNWMTpJT84cc/veuGNT8wXOlBOW6XUS2U3qvHsS8puE3my8a9VzVaAlUmiQ0Ah/qxdDvxG7bOKdu
	uyLTVhaG290LE4YdRyyKJVMFOlAdaqNssde/70D7JatllBFUYTrpgIYvO5OzGEBfHXEARKP7gIKyI
	ZXKoRbsOl5myjRQFmgwJbGtSfFIRFG7G1+E6oJToMAJNv8RBEfUqjJDhUX2hZKL110FdUo6H5TY6K
	OOd+Ln3iZHpCMAHlzO7fa1Twmp1QyfYW0PkEZ9zN/pcRD5SHpfpjXnkMtvXHaE+7Oztl9yfSn4IlT
	rW4aE4NQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtnBO-0000000G4UT-0hJD;
	Sat, 21 Feb 2026 13:38:06 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtnBL-0000000G4U7-1Yea
	for linux-mediatek@lists.infradead.org;
	Sat, 21 Feb 2026 13:38:04 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-2ad4d639db3so14318905ad.0
        for <linux-mediatek@lists.infradead.org>; Sat, 21 Feb 2026 05:38:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771681082; x=1772285882; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Pyk6Z+VoDuJMdL4eJZ3cKHVL9+OM0IxwS6L8hXr1m84=;
        b=jEbcSrcm4A22KvaZZqOwJQ4gNBMlqRPYUOIOYSUsJAEGxj7ziASGFBOUajrJqrjAXq
         rleHVB+KUBVU77YYHU9gY1xIJh9yrmAGnUSe/s06JYP2ModI05JR4QdZgWVIK2xqo882
         vPtNxELVwvS+7fdauU2CPR02qrpU4yYT9M0HO68uTxv1WihWxpKpJRJXYMuVxsydLkda
         jY4/juB64wYInv/UPjdoYqfzR2OJwGCLbQoOH8t49jaP8lf1/h73Wdjd0k/7GqebRktB
         fMiMn6TV1m5KgniP1TkfS2XCtujjrZXYxyOSpcklNYAJBddlMtt0IPqFTw60d+R31aPs
         eaYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771681082; x=1772285882;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Pyk6Z+VoDuJMdL4eJZ3cKHVL9+OM0IxwS6L8hXr1m84=;
        b=uxg63wGaSWlE/qkQoxewRq5BfPY4MvkfAMHwUqDykPzJ00mGyaU3O1p5+CUMciqjAv
         r8JzovQGqhbo8BDE8c+NDaHeEbYmsiTU2v6v0F7UaZ2vtUqfyUtHoMEJ9w4WqSoFVU2O
         RJ8kXK9uQT34JguxbaJbgB+IBy26XvI8NF94XPHiBaJ1JiGaWwcvYKDl2iYoSYhQYx92
         rWGct8v0UyUme564l1b18hXVmPYe2My23Gz43ayoiP95Z+Ofszbb/PQan3wsDdTSPJDi
         eF6QvjnayyNhVqCV13KPgs0wmr7AW8NAaqSdcbS8klZiGGRTeKsZ7nrEqs0xIHq1WjlV
         XcEQ==
X-Forwarded-Encrypted: i=1; AJvYcCUmlzuEgelatSUy66r500yPsVBSxlO2Bi4dk60eEILjuUbvHGt7i7H0iplNWMzONd2ESr9Pv5YilzishxPPzA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yzj+3FRKCS7RKqCaArUktHT9Z7u4nr4V5t3TPBYZdXs6gZnEhnW
	KzLUl5AeHZn6ysGoYoad4pdw9DyFh472zW8wop/WzNiKer+YXUz35sqeIr9T8g==
X-Gm-Gg: AZuq6aKlm1vTBdOmCHL6/AiFFw/6mnDgpkKS2pwc2eUzIkBmNzpVgXEiHA3k0xZ1TMq
	i5cH8ocb6eo6a9zAnGFh6wJbGM83StsbT9C+FllrXE+0aflpPSBCYsptNKG0iFESZy0FcUtzK4L
	CRt1U8s9bj6P1MwssqUEbeT3jcVlyH/JmJvYzRwLitFeDczWPPJ6pmt/k0GagJNNqZHLqXDuVkZ
	rxBupHP2qEoTo6n2f5LNmASl+/RlFwb1xzhfFKhXEb8piUVsDityohncr1TuedRjFxnJQbR/jKL
	/d0ToAhmGqhst8uZBZAQuLKNHrIGarSQk9MNF64DmHLI1XsERHZB8bdMajiXSgwrYQv5AiVdxmJ
	ZKgXWzx6289xUnLuMtWt0FvAzx8EG4cL3nn9204POBvO4DFTABLP9QMjt0ddFPwMmnTNRnV4V3A
	23avmW8tb2edcdQxdpNnDvyXa9p22erYQRym0h7j8=
X-Received: by 2002:a17:903:11cc:b0:2ab:344e:1400 with SMTP id d9443c01a7336-2ad74515cccmr29318235ad.37.1771681081793;
        Sat, 21 Feb 2026 05:38:01 -0800 (PST)
Received: from kush-pc.lan ([2409:40d4:420d:708c:4402:953d:ce2d:1659])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ad7500e29asm21493075ad.44.2026.02.21.05.37.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Feb 2026 05:38:01 -0800 (PST)
From: OnlineLearningTutorials <kush.kulshrestha5@gmail.com>
X-Google-Original-From: OnlineLearningTutorials <kush.kulshrestha.5@gmail.com>
To: sean.wang@kernel.org
Cc: linux-bluetooth@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-mmc@vger.kernel.org,
	luiz.dentz@gmail.com,
	marcel@holtmann.org,
	sean.wang@mediatek.com,
	ulf.hansson@linaro.org
Subject: Re: [PATCH 3/4] Bluetooth: btusb: Add new VID/PID 13d3/3579 for MT7902
Date: Sat, 21 Feb 2026 19:07:48 +0530
Message-ID: <20260221133748.309045-1-kush.kulshrestha.5@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260219231624.8226-3-sean.wang@kernel.org>
References: <20260219231624.8226-3-sean.wang@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260221_053803_419080_99C57D72 
X-CRM114-Status: UNSURE (   7.52  )
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

Hi Sean,

Thanks for helping me to add driver for mt7902 chip.

I have checked the wifi driver for mt7902 and it is working correctly with new firmware,
earlier I have issue with old firmware, thanks.

For Bluetooth driver, you already added VID/PID 13d3/3579 for MT7902
There are some other VID/PID which are part of mt7902 bluetooth chip
	13d3/3580 - (my chip)
	13d3/3594 - https://github.com/OnlineLearningTutorials/mt7902_temp/commit/f94e0075ca04e50629852adbb567e130f8784873
	13d3/3596 - https://github.com/OnlineLearningTutorials/mt7902_temp/commit/2a3db89c7a87241846d166defa17ebd22d4be337
	
Please add these VID/PID or instruct me to add, 
below are device debug - cat /sys/kernel/debug/usb/devices


cat /sys/kernel/debug/usb/devices

T:  Bus=03 Lev=01 Prnt=01 Port=02 Cnt=01 Dev#=  2 Spd=480  MxCh= 0
D:  Ver= 2.10 Cls=ef(misc ) Sub=02 Prot=01 MxPS=64 #Cfgs=  1
P:  Vendor=13d3 ProdID=3580 Rev= 1.00
S:  Manufacturer=MediaTek Inc.
S:  Product=Wireless_Device
S:  SerialNumber=000000000
C:* #Ifs= 3 Cfg#= 1 Atr=e0 MxPwr=100mA
A:  FirstIf#= 0 IfCount= 3 Cls=e0(wlcon) Sub=01 Prot=01
I:* If#= 0 Alt= 0 #EPs= 3 Cls=e0(wlcon) Sub=01 Prot=01 Driver=btusb
E:  Ad=81(I) Atr=03(Int.) MxPS=  16 Ivl=125us
E:  Ad=82(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
E:  Ad=02(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
I:* If#= 1 Alt= 0 #EPs= 2 Cls=e0(wlcon) Sub=01 Prot=01 Driver=btusb
E:  Ad=83(I) Atr=01(Isoc) MxPS=   0 Ivl=1ms
E:  Ad=03(O) Atr=01(Isoc) MxPS=   0 Ivl=1ms
I:  If#= 1 Alt= 1 #EPs= 2 Cls=e0(wlcon) Sub=01 Prot=01 Driver=btusb
E:  Ad=83(I) Atr=01(Isoc) MxPS=   9 Ivl=1ms
E:  Ad=03(O) Atr=01(Isoc) MxPS=   9 Ivl=1ms
I:  If#= 1 Alt= 2 #EPs= 2 Cls=e0(wlcon) Sub=01 Prot=01 Driver=btusb
E:  Ad=83(I) Atr=01(Isoc) MxPS=  17 Ivl=1ms
E:  Ad=03(O) Atr=01(Isoc) MxPS=  17 Ivl=1ms
I:  If#= 1 Alt= 3 #EPs= 2 Cls=e0(wlcon) Sub=01 Prot=01 Driver=btusb
E:  Ad=83(I) Atr=01(Isoc) MxPS=  25 Ivl=1ms
E:  Ad=03(O) Atr=01(Isoc) MxPS=  25 Ivl=1ms
I:  If#= 1 Alt= 4 #EPs= 2 Cls=e0(wlcon) Sub=01 Prot=01 Driver=btusb
E:  Ad=83(I) Atr=01(Isoc) MxPS=  33 Ivl=1ms
E:  Ad=03(O) Atr=01(Isoc) MxPS=  33 Ivl=1ms
I:  If#= 1 Alt= 5 #EPs= 2 Cls=e0(wlcon) Sub=01 Prot=01 Driver=btusb
E:  Ad=83(I) Atr=01(Isoc) MxPS=  49 Ivl=1ms
E:  Ad=03(O) Atr=01(Isoc) MxPS=  49 Ivl=1ms
I:  If#= 1 Alt= 6 #EPs= 2 Cls=e0(wlcon) Sub=01 Prot=01 Driver=btusb
E:  Ad=83(I) Atr=01(Isoc) MxPS=  63 Ivl=1ms
E:  Ad=03(O) Atr=01(Isoc) MxPS=  63 Ivl=1ms
I:  If#= 2 Alt= 0 #EPs= 2 Cls=e0(wlcon) Sub=01 Prot=01 Driver=btusb
E:  Ad=8a(I) Atr=03(Int.) MxPS=  64 Ivl=125us
E:  Ad=0a(O) Atr=03(Int.) MxPS=  64 Ivl=125us
I:* If#= 2 Alt= 1 #EPs= 2 Cls=e0(wlcon) Sub=01 Prot=01 Driver=btusb
E:  Ad=8a(I) Atr=03(Int.) MxPS= 512 Ivl=125us
E:  Ad=0a(O) Atr=03(Int.) MxPS= 512 Ivl=125us



cat /sys/kernel/debug/usb/devices

T: Bus=03 Lev=01 Prnt=01 Port=02 Cnt=01 Dev#= 3 Spd=480 MxCh= 0
D: Ver= 2.10 Cls=ef(misc ) Sub=02 Prot=01 MxPS=64 #Cfgs= 1
P: Vendor=13d3 ProdID=3594 Rev= 1.00
S: Manufacturer=MediaTek Inc.
S: Product=Wireless_Device
S: SerialNumber=000000000
C:* #Ifs= 3 Cfg#= 1 Atr=e0 MxPwr=100mA
A: FirstIf#= 0 IfCount= 3 Cls=e0(wlcon) Sub=01 Prot=01
I:* If#= 0 Alt= 0 #EPs= 3 Cls=e0(wlcon) Sub=01 Prot=01 Driver=btusb
E: Ad=81(I) Atr=03(Int.) MxPS= 16 Ivl=125us
E: Ad=82(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
E: Ad=02(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
I:* If#= 1 Alt= 0 #EPs= 2 Cls=e0(wlcon) Sub=01 Prot=01 Driver=btusb
E: Ad=83(I) Atr=01(Isoc) MxPS= 0 Ivl=1ms
E: Ad=03(O) Atr=01(Isoc) MxPS= 0 Ivl=1ms
I: If#= 1 Alt= 1 #EPs= 2 Cls=e0(wlcon) Sub=01 Prot=01 Driver=btusb
E: Ad=83(I) Atr=01(Isoc) MxPS= 9 Ivl=1ms
E: Ad=03(O) Atr=01(Isoc) MxPS= 9 Ivl=1ms
I: If#= 1 Alt= 2 #EPs= 2 Cls=e0(wlcon) Sub=01 Prot=01 Driver=btusb
E: Ad=83(I) Atr=01(Isoc) MxPS= 17 Ivl=1ms
E: Ad=03(O) Atr=01(Isoc) MxPS= 17 Ivl=1ms
I: If#= 1 Alt= 3 #EPs= 2 Cls=e0(wlcon) Sub=01 Prot=01 Driver=btusb
E: Ad=83(I) Atr=01(Isoc) MxPS= 25 Ivl=1ms
E: Ad=03(O) Atr=01(Isoc) MxPS= 25 Ivl=1ms
I: If#= 1 Alt= 4 #EPs= 2 Cls=e0(wlcon) Sub=01 Prot=01 Driver=btusb
E: Ad=83(I) Atr=01(Isoc) MxPS= 33 Ivl=1ms
E: Ad=03(O) Atr=01(Isoc) MxPS= 33 Ivl=1ms
I: If#= 1 Alt= 5 #EPs= 2 Cls=e0(wlcon) Sub=01 Prot=01 Driver=btusb
E: Ad=83(I) Atr=01(Isoc) MxPS= 49 Ivl=1ms
E: Ad=03(O) Atr=01(Isoc) MxPS= 49 Ivl=1ms
I: If#= 1 Alt= 6 #EPs= 2 Cls=e0(wlcon) Sub=01 Prot=01 Driver=btusb
E: Ad=83(I) Atr=01(Isoc) MxPS= 63 Ivl=1ms
E: Ad=03(O) Atr=01(Isoc) MxPS= 63 Ivl=1ms
I:* If#= 2 Alt= 0 #EPs= 2 Cls=e0(wlcon) Sub=01 Prot=01 Driver=(none)
E: Ad=8a(I) Atr=03(Int.) MxPS= 64 Ivl=125us
E: Ad=0a(O) Atr=03(Int.) MxPS= 64 Ivl=125us
I: If#= 2 Alt= 1 #EPs= 2 Cls=e0(wlcon) Sub=01 Prot=01 Driver=(none)
E: Ad=8a(I) Atr=03(Int.) MxPS= 512 Ivl=125us
E: Ad=0a(O) Atr=03(Int.) MxPS= 512 Ivl=125us


cat /sys/kernel/debug/usb/devices

T:  Bus=07 Lev=01 Prnt=01 Port=00 Cnt=01 Dev#=  2 Spd=480  MxCh= 0
D:  Ver= 2.10 Cls=ef(misc ) Sub=02 Prot=01 MxPS=64 #Cfgs=  1
P:  Vendor=13d3 ProdID=3596 Rev= 1.00
S:  Manufacturer=MediaTek Inc.
S:  Product=Wireless_Device
S:  SerialNumber=000000000
C:* #Ifs= 3 Cfg#= 1 Atr=e0 MxPwr=100mA
A:  FirstIf#= 0 IfCount= 3 Cls=e0(wlcon) Sub=01 Prot=01
I:* If#= 0 Alt= 0 #EPs= 3 Cls=e0(wlcon) Sub=01 Prot=01 Driver=btusb
E:  Ad=81(I) Atr=03(Int.) MxPS=  16 Ivl=125us
E:  Ad=82(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
E:  Ad=02(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
I:* If#= 1 Alt= 0 #EPs= 2 Cls=e0(wlcon) Sub=01 Prot=01 Driver=btusb
E:  Ad=83(I) Atr=01(Isoc) MxPS=   0 Ivl=1ms
E:  Ad=03(O) Atr=01(Isoc) MxPS=   0 Ivl=1ms
I:  If#= 1 Alt= 1 #EPs= 2 Cls=e0(wlcon) Sub=01 Prot=01 Driver=btusb
E:  Ad=83(I) Atr=01(Isoc) MxPS=   9 Ivl=1ms
E:  Ad=03(O) Atr=01(Isoc) MxPS=   9 Ivl=1ms
I:  If#= 1 Alt= 2 #EPs= 2 Cls=e0(wlcon) Sub=01 Prot=01 Driver=btusb
E:  Ad=83(I) Atr=01(Isoc) MxPS=  17 Ivl=1ms
E:  Ad=03(O) Atr=01(Isoc) MxPS=  17 Ivl=1ms
I:  If#= 1 Alt= 3 #EPs= 2 Cls=e0(wlcon) Sub=01 Prot=01 Driver=btusb
E:  Ad=83(I) Atr=01(Isoc) MxPS=  25 Ivl=1ms
E:  Ad=03(O) Atr=01(Isoc) MxPS=  25 Ivl=1ms
I:  If#= 1 Alt= 4 #EPs= 2 Cls=e0(wlcon) Sub=01 Prot=01 Driver=btusb
E:  Ad=83(I) Atr=01(Isoc) MxPS=  33 Ivl=1ms
E:  Ad=03(O) Atr=01(Isoc) MxPS=  33 Ivl=1ms
I:  If#= 1 Alt= 5 #EPs= 2 Cls=e0(wlcon) Sub=01 Prot=01 Driver=btusb
E:  Ad=83(I) Atr=01(Isoc) MxPS=  49 Ivl=1ms
E:  Ad=03(O) Atr=01(Isoc) MxPS=  49 Ivl=1ms
I:  If#= 1 Alt= 6 #EPs= 2 Cls=e0(wlcon) Sub=01 Prot=01 Driver=btusb
E:  Ad=83(I) Atr=01(Isoc) MxPS=  63 Ivl=1ms
E:  Ad=03(O) Atr=01(Isoc) MxPS=  63 Ivl=1ms
I:* If#= 2 Alt= 0 #EPs= 2 Cls=e0(wlcon) Sub=01 Prot=01 Driver=(none)
E:  Ad=8a(I) Atr=03(Int.) MxPS=  64 Ivl=125us
E:  Ad=0a(O) Atr=03(Int.) MxPS=  64 Ivl=125us
I:  If#= 2 Alt= 1 #EPs= 2 Cls=e0(wlcon) Sub=01 Prot=01 Driver=(none)
E:  Ad=8a(I) Atr=03(Int.) MxPS= 512 Ivl=125us
E:  Ad=0a(O) Atr=03(Int.) MxPS= 512 Ivl=125us


Thanks


