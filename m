Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25FCDCD4F3C
	for <linux-mediatek@archiver.kernel.org>; Tue, 19 May 2026 04:32:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:MIME-Version:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=LB2eeG1SpolST48Ht8N5ZVmPK5SGJL8UVYCuIxMFohc=; b=jyfALn5cvFXD/1jB4VMSFCjMKj
	nkYGCoo+ue5p4SIB3cuxBR/AYDo1qb8ywrt6aKEiSlyNwDbsORu1Q+Se0zPVag7w2UpB0RfvPNF1m
	rssDScTRSGxQyXgiONQKJBJGfgaAWlIZQYZRNyj7NVCR7XVdZdCjTs5EJmg2fy6HDdq07rGkK88sD
	NVz1o8fL+Urh5ptNR1NzIEnDyDu5NVsniyMdoQu9Dc9H7LK4QfqRBoWTZY2SdSMwkxoxIbjPTcQas
	Z1+WXQ65JLSSQLsByFJOS0CEY7e93G2Thml7LsnEjtNdurXLAPWEkZpjeU2d9E03XY3/qk8jPZ5TM
	7p1RNUVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPC7a-000000006v5-1xSL;
	Tue, 19 May 2026 04:31:58 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPC7Y-000000006u2-2H7e
	for linux-mediatek@lists.infradead.org;
	Tue, 19 May 2026 04:31:57 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-4891e5b9c1fso25135965e9.2
        for <linux-mediatek@lists.infradead.org>; Mon, 18 May 2026 21:31:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779165114; cv=none;
        d=google.com; s=arc-20240605;
        b=HOdh12c7VJTftQSkoOEvBdtJ9rFqMMJOV02y5uUQvUViNSuTwsWN7yPMpBZx/j+rw7
         XO4T3hTAs2uYYQZjmLFxu3EpRhShJ+SpJbZw2TkD74AsXlqpz68AngD1TZio9Xp8E+Vx
         bONMpmo1/3o3KAd+TlMmTLpKEayl29Ec7fw1pVXVaivIpO46n8cJyaCfqtCyiiI3FU5h
         zJEFOADah5+AqCKa644Z1YUURTWM2ehbuwhT8S7gYO4sgeituMuLE3ZFcjbp/ESyoP3B
         dTWi0nDj0fwlzEjgj8ML8NMOGH1UZmKm3KG6WSfsL865LKoWMg5nmcFlM8l/xH3gmtSX
         es7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=LB2eeG1SpolST48Ht8N5ZVmPK5SGJL8UVYCuIxMFohc=;
        fh=1f6fPHRL/+FMFWxkI4cMYQVmaPiKFqQv9Srug7z8r7E=;
        b=bj83+MYNTsDbi+aU92A8MKAj2I3gh/LrEBifkCYI9s1ZGU+VOILEqXwW3KM8yqUX1q
         FDrmcExQxu0BZxD80Jz8Um4DyGgiui9r36KLT7ZNZbsUIWaKnKduGUM8PJMqKFnF1PWr
         US9ryqvhM3wIHvp+ainch6iXb6MVHTxdHsuYH/CQnKfGhQ6P5ETzpiYUhQA4L37IXYdm
         LFs190wff/1mfxUOi3DYTFt7FxQmkjjX2oqAnPL06HY3nT+wUg2LTa3kQdzVRtVXzfOY
         qsZ1K5s/s9GXQkG0UodKTbLvevVtG+VwBAvyU8dtbaF/E3hwXu/DNI8299W5NVntgYkZ
         mWyg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779165114; x=1779769914; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=LB2eeG1SpolST48Ht8N5ZVmPK5SGJL8UVYCuIxMFohc=;
        b=KKR+y0qyEnCAcMmpNts3x2YbAz/eA6sTg/qTApnxltVnDa1Ct846H1Y2xARHRMpwP5
         xkb46I9E8ZsJY1X+1IYIV2T5Giaki9I/NcgEk5e6jB2JPB4XYEKXfeYk7Mff6E9/Gy1J
         uQX8xfMv0Gb7xoSR4zNrZ/ggMiva4gslDQCQoDk2eE/jJBxdRfwArAiGOsxoLOCX/mP/
         UnbdYvFUtxJHhjBuSUuISyhR0keIigLxWTvhBElbTSPBNkqdO/fO24LZI2oS0Iw/3ujq
         Vi8ulwFm65+BcEsNGGPOQwfJkyw/cx/PjDhfcvzqb1UENzlXQbniGKwuwcRqtFaRhk61
         qwrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779165114; x=1779769914;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LB2eeG1SpolST48Ht8N5ZVmPK5SGJL8UVYCuIxMFohc=;
        b=CosSd1zBtoQ+A/towDukPIBmQyHt62Uzjm7Qw14Sf0zmel8yvcneMhSqrTETE+ZLeN
         D4fKslBSJSnpMCqR7kuu0TEsObZVge0cAxZTtPyPzXIsaFJqG1QsDrkEs8uvK0KNurNY
         u35DbGMS4oASJ3mdFgEUsdYnA4sC7sK48p9wMcn8J5xwXnYi2QLBEia9plw5GUT29LG5
         m5NKS9ojgfQPW5S9AHqHvpEs2Rru4sra4Zounp70S2pCUpo24MzsY2fmo4rWhrU/KLij
         LoppphSp5zs+DtQB61yiA4582GRDkvPErKlEBk6ejAdK1mx5al7fsU0A1sRVZev9pRu+
         Wj0g==
X-Forwarded-Encrypted: i=1; AFNElJ8NyqpzGLPwBOghhuGw2t9edICbtLcY0Ccubqdxh3muTF9EGqP7TcXaEPo4rcKejibyqhgOrEDWDI1RbZsKjQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yyv4UEXrNqEX93HSijtwdb3Q05AtOKyYKlaJ5xBaLO6BbHtW2Z6
	leStKNrgK0CtBbQ9opszczBxa+y/wpvWuBKWqpFmtP1HqZKK+7QZolsPGueBoeqBCfVI7/ZmWB4
	N+kErlWl4M7ShIHYlFonAo/smkV3EJog=
X-Gm-Gg: Acq92OEt9SRVksQO4L8s1qy89rIunkynOqshYwO2Ruel+OPUAMDFWRhCJYqnd6NQWtL
	9wx+lrQ6yIbC5x7biHSuvLds5g9vj9ixSKvHL6xLlXjF355rMp057gUuzXV1oYkuD6ZHIAvROSb
	559hHFsGjwoGPfrvQ1JIJsCSJb8VMd7FvwEklr5+lyfNqhMvv2hVMOmG86LxFp4GGXbisP6n75v
	glKPnWgT4zE9vrB7rVhtvcVa2DpfQS6U8IuoSQO/5k9yHBIkOrDuo8se90VFcS2CBtAY4eQNROK
	YHBwdgvZ66ZmdfQMF4e0
X-Received: by 2002:a05:600d:10:b0:48f:cfae:b654 with SMTP id
 5b1f17b1804b1-48fe60e5537mr217793815e9.1.1779165113908; Mon, 18 May 2026
 21:31:53 -0700 (PDT)
MIME-Version: 1.0
From: Baley Eccles <baleycod@gmail.com>
Date: Tue, 19 May 2026 14:31:42 +1000
X-Gm-Features: AVHnY4Li5nUZrvw8vcm2bYlGMK9IhnqMjGOljLZnXZ-_QnQCztFbvk2LXkdu2tc
Message-ID: <CADCSNFD0Ut-jJohTQFczjBgaVf=mBrc2rq4hJQncVZpF4bCoxw@mail.gmail.com>
Subject: [REGRESSION] Bluetooth: MT7922 fails to initialize after "Bluetooth:
 btmtk: validate WMT event SKB length before struct access"
To: linux-bluetooth@vger.kernel.org
Cc: Marcel Holtmann <marcel@holtmann.org>, Luiz Augusto von Dentz <luiz.dentz@gmail.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	regressions@lists.linux.dev, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260518_213156_595199_D453E3D9 
X-CRM114-Status: UNSURE (   7.08  )
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

Subject: [REGRESSION] Bluetooth: MT7922 fails to initialize after
"Bluetooth: btmtk: validate WMT event SKB length before struct access"

Hi all,

I have experienced and looked into a regression on a MediaTek MT7922
adapter. Bluetooth works on v6.18.29, fails on v6.18.30, and reverting
the bisected commit fixes it.

Hardware:
MEDIATEK Corp. MT7922 802.11ax PCI Express Wireless Network Adapter [14c3:7922]
Subsystem: AzureWave ASUS PCE-AXE59BT [1a3b:5300]

Good kernel:
6.18.29-p2-gentoo-dist
Upstream base: v6.18.29

Bad kernel:
6.18.30-p1-gentoo-dist
Upstream base: v6.18.30

Failure:
bluetoothctl list prints nothing / no default controller is available.

Bad dmesg:
Bluetooth: hci0: HW/SW Version: 0x008a008a, Build Time: 20260224103448
Bluetooth: hci0: Failed to send wmt func ctrl (-22)
Bluetooth: hci0: HCI Enhanced Setup Synchronous Connection command is
advertised, but not supported.

Good dmesg:
Bluetooth: hci0: HW/SW Version: 0x008a008a, Build Time: 20260224103448
Bluetooth: hci0: Device setup in 129909 usecs
Bluetooth: hci0: HCI Enhanced Setup Synchronous Connection command is
advertised, but not supported.
Bluetooth: hci0: AOSP extensions version v1.00
Bluetooth: hci0: AOSP quality report is supported
Bluetooth: MGMT ver 1.23

Firmware:
/lib/firmware/mediatek/BT_RAM_CODE_MT7922_1_1_hdr.bin
/lib/firmware/mediatek/WIFI_MT7922_patch_mcu_1_1_hdr.bin
/lib/firmware/mediatek/WIFI_RAM_CODE_MT7922_1.bin

Bisect result:
624fb79dadc1b65757986a9d0fdde5c0cf3fe179 is the first bad commit

Bluetooth: btmtk: validate WMT event SKB length before struct access

This is a stable backport of upstream commit:
634a4408c0615c523cf7531790f4f14a422b9206

Reverting 624fb79dadc1b65757986a9d0fdde5c0cf3fe179 on top of v6.18.30
fixes the issue and Bluetooth works again.

Please let me know if there is any additional logging or testing I can provide.

#regzbot introduced: 624fb79dadc1b65757986a9d0fdde5c0cf3fe179

Cheers,
Baley

