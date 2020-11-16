Return-Path: <SRS0=p/XJ=EW=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07DF5C2D0E4
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Nov 2020 00:00:32 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3C55A222B8
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Nov 2020 00:00:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="y8qQUyIC";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OTaV0JAv"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3C55A222B8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Date:Message-ID:Subject:From:To:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=7X+WHXXNYbh4ZPCvgQ6vYACKmDyuB2NuYyNDcOPVEWA=; b=y8qQUyICkaPg7S
	Sso8wBlFYxXn8w7QOH1i/+no8ENZKOLLdraqxFZii+bp9fMFGD2y+FHuqMbpkpskJasl3kTuBSGcr
	QbalXeSbB9mD99e7zIb3L6PXR9+0rE53XFooU44LnWE7uITbd29w+ANcvJ3D5PcTU2oHRT475W5cb
	znWGaYUMtnjMUVh2k+U50+HT9wGCcB6cjQpke9Hfi6ZeuNHSQXIzPVSPc03aBo7XaKonZUFEObKbR
	3uNj3agmrn5CBxtka+rB+2kdzDek5OjhInY+xvex4lZlaWCJ9yP97t6ZMm+WLj3AJQIyjt267hXlU
	Q4HWuTi1Uj9mD5AEW6lg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1keRwY-0004l7-WC; Mon, 16 Nov 2020 00:00:27 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1keRwW-0004kp-5j
 for linux-mediatek@lists.infradead.org; Mon, 16 Nov 2020 00:00:25 +0000
Received: by mail-wr1-x433.google.com with SMTP id o15so16866108wru.6
 for <linux-mediatek@lists.infradead.org>; Sun, 15 Nov 2020 16:00:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=to:from:subject:message-id:date:mime-version:content-language
 :content-transfer-encoding;
 bh=sBqxC1n3HYYvQsBab61jQw2vYCxmzr11YsfxnaoVS6s=;
 b=OTaV0JAvVBOKu7JXLlQgc0+XpRdpnSjhAEmC58xszaGPfkl8rTQNC4OL17Iu+PxKYP
 6ko2zg54iduWbsWqi6G9eokqzm9FBvBuX3drXNvtkaXjoqXgcsAnnWgHoQVIEqYyUamx
 +JpMi/R53GkQaR5z4+bPbLs6XyEUnvNTr/EA3B2k6cMqBjleymIq5bEwu9z0sVmHD+kX
 8W0/3RjTBlLlk9B0uh3ZyoNX5hivBDHTAQwWi21rxMF+QLHG7QOPXzs+vYocEOU4almi
 FE+AmVKVrUARrwiROM5Cb0GFt7GkgSle/2f/VmEpgQ4dawbBB8yP1VYW56Hdi3xVrzOj
 Il5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:from:subject:message-id:date:mime-version
 :content-language:content-transfer-encoding;
 bh=sBqxC1n3HYYvQsBab61jQw2vYCxmzr11YsfxnaoVS6s=;
 b=gBWUZD4x917uwJ8GYV9hGjKOrzVj/fm4tBocZBeQQVMfNYYKiOBRbvYjU5L7J5MbTs
 OAG99HNj61HntxcpRCnnBUKLyUXSQcQqrKb/R7h1OF5+Sp/npTGm57Yp4BfqqaUqkc8I
 1u5Q6nMNR3OUd43TpDhVH9pjpNXcDkLB/E8F2r0FqwEZqv9JK9BlxKfPFC+joNex0HYX
 rd/tbqT7UixBoE30KW6VCzc0f/3EqQelFDd5lxP1qHGZt4QSfWoDHcG3bjvNRLzzNq0k
 m/0fnV7c95/00gqU85tW+AePzuK4B/OWPuyfn7Ozhs6pecu34tTluswT70tCZHYdi5sW
 6BCw==
X-Gm-Message-State: AOAM532eQCyBj8mHlWpcDki1BQK3IsjXbjBpkuoK1UwYUp1Xw1MeM//P
 vslaXtKEEUZ1sdQmijjSSZx2ZbOCqhBt
X-Google-Smtp-Source: ABdhPJy9eLhjcdPeFGuA8J429ARMDlnk+c+wSh70qMgP/C1lUt5I5x1WK9cmkZVHH0Q54zGBf5cGow==
X-Received: by 2002:adf:d0c8:: with SMTP id z8mr16659950wrh.288.1605484820008; 
 Sun, 15 Nov 2020 16:00:20 -0800 (PST)
Received: from localhost (200.red-95-127-152.staticip.rima-tde.net.
 [95.127.152.200])
 by smtp.gmail.com with ESMTPSA id e3sm3601770wro.90.2020.11.15.16.00.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 15 Nov 2020 16:00:19 -0800 (PST)
To: Felix Fietkau <nbd@nbd.name>, Ryder Lee <ryder.lee@mediatek.com>,
 Lorenzo Bianconi <lorenzo@kernel.org>, linux-wireless@vger.kernel.org,
 linux-mediatek@lists.infradead.org
From: Xose Vazquez Perez <xose.vazquez@gmail.com>
Subject: mt76: missing 4 fw files in linux-firmware.git repo
Message-ID: <bb8c3ffc-2835-e63f-f39b-8758f919d40f@gmail.com>
Date: Mon, 16 Nov 2020 01:00:17 +0100
MIME-Version: 1.0
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201115_190024_350538_6C2749F0 
X-CRM114-Status: UNSURE (   6.34  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi,

mediatek/mt76/mt7603/mt7603.h:
#define MT7603_FIRMWARE_E1      "mt7603_e1.bin"
#define MT7603_FIRMWARE_E2      "mt7603_e2.bin"
#define MT7628_FIRMWARE_E1      "mt7628_e1.bin"
#define MT7628_FIRMWARE_E2      "mt7628_e2.bin"

Thanks.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
