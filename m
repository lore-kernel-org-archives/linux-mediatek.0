Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC168C4332F
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Nov 2022 18:49:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:From:Cc:To:MIME-Version:Date:Message-ID:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=l97CFMxK013jbwqr86PBB0+4UzVCHm4yLdQdXZhW1zs=; b=McMWxmuD3uKOWVd1BOBmgcZ3XZ
	V21/4vCWMITHzSIf/4F5YgusxtdpdE/cKrq1iwtU0VGT2DVdIaWqBlAPB8IROtru81nb2Czxl2Wvy
	u5SdOp5mRvsOGHmRQS6l4lBBKyOMjjHu0wlYAuns90gOzVtrh04nKhI0IM7uUI5kdIJMoCS322S/5
	BQpXq0sVAyZ3wp6RAMzSEP2q6eYH+GelJYTs8RfwHJUOc7DBrgRrBPUxtCd5fJZHwwwrSXZgV9RvJ
	R8m7W4ZZXcuV1JDbkPIrOJ4YeEDAf41Gnqzc0AruxxVPeTP1aBG+CS9/kM/Z+0hfd+nSxI9fCc3My
	+AmCaXJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxBqr-00H8oJ-5j; Mon, 21 Nov 2022 18:49:05 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxBqn-00H8nU-Mz; Mon, 21 Nov 2022 18:49:03 +0000
Received: by mail-wr1-x436.google.com with SMTP id z4so6621390wrr.3;
        Mon, 21 Nov 2022 10:49:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l97CFMxK013jbwqr86PBB0+4UzVCHm4yLdQdXZhW1zs=;
        b=kv5O+q+4J0Dbvr9/kbtg9lBOaSHuygjekbTq73oxC6WmcqYF+4p/c1l4U+LzBCSPNp
         JISTCgAqmg2lkzEbTna0iJG0WSLsNwmmNto/HLzLhlcx1W+Y3GDPJSqqFRHtwWrLcAJ+
         kzfbaPfWByxvKQo2afv7h0nFdzhefyQ1hG9/xrPhR65vsh2EvkGG8OrWo/adM9SlmKju
         Qzk4rtbzXFiyjpe26jFCXmDTGOh9baUdqPRps76jZH/T7hsRiOiETz4CC3pyJbfXkvOM
         JhsIqjlWZWzTKaEIXhFEVqpiDSIuKg13BDzYwFexhRGrpFIOPmfhTYYzmVImqlZDgGyz
         xKkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=l97CFMxK013jbwqr86PBB0+4UzVCHm4yLdQdXZhW1zs=;
        b=OCnCE4CFfgaNQcmsUJn3GjH3K4nqs5B/c9rMDNwvIPlWTJ5wVCHLpIURDtcJ+xz0hO
         Yp77nytWUppTFze1bgVTml7fKiKZd+RQxoi4bvKzkSsZ9AvCduXPVji6GLhcL1/VNGAg
         ZB1cQLjhG5T+zw2Kob8WIL9kcrcNXLasIlgV93qUFaSaSKgk+Jx0HHDzAoRf223St9Ny
         kbQMEAeVBSkvDWC31Xhz29+9eXo0/9RXpGeT4QneC3OlyhrTKQR+6zMKmrIUQoDey8i5
         E/AdDoQ1ZSm3YSUJEsPDAKiQNDyq2wifvE4CTXzKNwsXGsyENaX3s62wCNr9i+zrEtR0
         7MiA==
X-Gm-Message-State: ANoB5plcXTMDC4jbOioWxzHo6w3iNa7Bpxf0tgXBGHjdKCEvOmYOUD/L
	2Xx/FlPlWx6mjBm935G8mVs=
X-Google-Smtp-Source: AA0mqf5SxIjT9Ke9s3gwPHWa5/eDwUkP9WIJotQNGSGS0b1ho7FUkY2SJWOIkn1yiTqehQ0a1IR9FQ==
X-Received: by 2002:adf:f6ca:0:b0:241:dc52:5556 with SMTP id y10-20020adff6ca000000b00241dc525556mr2408875wrp.291.1669056539489;
        Mon, 21 Nov 2022 10:48:59 -0800 (PST)
Received: from [192.168.1.131] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id q125-20020a1c4383000000b003c6cd82596esm19135941wma.43.2022.11.21.10.48.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Nov 2022 10:48:58 -0800 (PST)
Message-ID: <610edfca-0a3a-fd41-5208-71978866be4f@gmail.com>
Date: Mon, 21 Nov 2022 19:48:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Content-Language: en-US
To: arm-soc <arm@kernel.org>, SoC Team <soc@kernel.org>
Cc: "moderated list:ARM/Mediatek SoC support"
 <linux-mediatek@lists.infradead.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
Subject: [GIT PULL] defconfig: mediatek updates for v6.2
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221121_104901_769696_F629AB96 
X-CRM114-Status: UNSURE (   7.86  )
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

Hi Olof and Arnd,

Please have a look on the only patch for defconfig. We basically enable drivers 
needed to support MT8183 based Chromebooks.

Regards,
Matthias

---
The following changes since commit 9abf2313adc1ca1b6180c508c25f22f9395cc780:

   Linux 6.1-rc1 (2022-10-16 15:36:24 -0700)

are available in the Git repository at:

   https://git.kernel.org/pub/scm/linux/kernel/git/matthias.bgg/linux.git/ 
tags/v6.1-next-defconfig

for you to fetch changes up to 83f3da58682861327e571b3b5149d51a0d8bab27:

   arm64: defconfig: Enable missing configs for mt8183-jacuzzi-juniper 
(2022-11-11 09:41:16 +0100)

----------------------------------------------------------------
- enable missing drivers for to boot from MT8183 based chromebooks

----------------------------------------------------------------
Nícolas F. R. A. Prado (1):
       arm64: defconfig: Enable missing configs for mt8183-jacuzzi-juniper

  arch/arm64/configs/defconfig | 18 ++++++++++++++++++
  1 file changed, 18 insertions(+)

