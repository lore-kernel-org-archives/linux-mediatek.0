Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02F20C02198
	for <linux-mediatek@archiver.kernel.org>; Sun, 16 Feb 2025 14:15:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NjdP+HYW5ufsAoh0in9wXTTB0+zsjbE2DLH49bIuBgI=; b=2sj8JRkFmeCKXTE8+GkVpS25aq
	adZ3V/WD8W21UZ4PTXgofL/vLGNsZUcvfustMtMgGsGZ5L2vFNTs3KLtzY/SrnL7ps+SIRGTWLuPs
	i6l9+VX+fkx5S6IzvMSYfsDaXRiKRfYkuicfh9a1pENs5vW+hfm3Gda7FyWwAq/b51fOZ5J5IMx5R
	o9flgYh45o8eMG6B15RztZTZNqnCzrwEzKRAP0n2waUKkCyx9QlbTor8Nwg3+lcgqXTrIpMbE6MaK
	1hmzwUjwqDVWTq8fb/WOd5ENHkkVG5jPFvgMwRvVurLPLc0T4iwupud7OCqe+K5aSMYmQZhn6Am3F
	pfepJt4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tjfQq-00000001vS7-3aR3;
	Sun, 16 Feb 2025 14:15:40 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tjfQn-00000001vRC-2WsW
	for linux-mediatek@lists.infradead.org;
	Sun, 16 Feb 2025 14:15:38 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-38f2b7ce319so1821861f8f.2
        for <linux-mediatek@lists.infradead.org>; Sun, 16 Feb 2025 06:15:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739715335; x=1740320135; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=NjdP+HYW5ufsAoh0in9wXTTB0+zsjbE2DLH49bIuBgI=;
        b=m9oDyM+J/70TyMSq3LRU0BRC3EyI6+A/3OGFPvQI2FbRicLG0kP9oDczY9vsC9qfaT
         A0kFpupbsLO4h3e1e2BSk5HEJxk4B+ZulEf1U90ZS+tHTRasaOPS1nmQVrzo81/rUgks
         i7CIYiDwr6q7Wp3cDdMLkL2zXEl+AH1yE7Nl1AHXt/i+xdMpWSeAxy8HsK/W5UEatXQV
         QEbzBYMNH4HgUM8c7nZ0BVPiz7JgDoxoQwV17mitqzwVnPtQgO/5/pLiqyN3TUs5ZUKV
         wvhro7PH1j/f3WFVTNLr0f6kEkEGWmx5myEuXvXFN9RwfVvl1F0yYUllbYimPk8vE1Dp
         1tbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739715335; x=1740320135;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NjdP+HYW5ufsAoh0in9wXTTB0+zsjbE2DLH49bIuBgI=;
        b=OwMlSg5u8YqsSEvGHJg1NqFZ+Q//20Ml50fV3/Dt9FrB95GZw9BxADrYQp+gsdSJ32
         /923dDIEUUbqmpwxpIhTysPjJSSdoTy0KdOZmKxSqNoHopHZTzkrP8tjb/R2hnOgZGMg
         SSnf/yLW+Wqzwz5IctzdbbkdWTkk0Y1gyJPn+qvhHbYDixFEaf7jljaeO4BI+rfpfroT
         MRVqLWCEdGni18ccBRHEHffZkhi5wNTfxDyio8IJL3IeWxxJtatoOVfder4Z5xvlofTo
         dvj3wY13tdcfEwKys7p40fs5JUnEZ+PiAUKslEVOPVLjT9b9wWH5xKi2wNihdTp3qNLO
         nagA==
X-Forwarded-Encrypted: i=1; AJvYcCW/PRufJvg29U9mnzyD+gs3BA8S+xqJmgMsMlMFj+XAba87JthCvLt01dTZxp4EJ4XJ3L/xeXxwhrFa0uCHlg==@lists.infradead.org
X-Gm-Message-State: AOJu0YxYUruyUSPEHa+WIDcw8r0u57n68bjaSuVWilpqS8lQBpIyqu7b
	0AW1GtZ3BCG+fummrqzFDSU9/kQoMLorzGwIT9O+pFKWqS1nn0XBlLbKyA==
X-Gm-Gg: ASbGncuOWPylqa1Gp8QV9llmUcjD/xP7EguTAsKfm1KS5JwzgYo53aR3AySl8mFXhw5
	gYQTLNh9d/Rv0zr3hFDeEpJ5kdGFYo3wKnI9dkloO1kKWYf9s3QUqIdxoDfjTHsi2Cewe+3NhVM
	yRrmJ3yzlHi8bW8MSkDqzmKhZqRj4C+WeOXW1jVMsnFit7OASc1TrKxZ8/f8RnUbKIzN18C4N2W
	yWkvmM9IEhudcItOVxaoK7VKeQUvT38+0J0y0kjv8zf08dgFCZXFJ/BUWh4DqtViYCIAD17oMXm
	SMj/MFrHSHADnK1VacbZbkKsZ2jRX2cOtBpjdk0sM2zm1hO/GMTb5YR0Mqo9w5uhgOEPk5+ycBX
	syd7iJWjL9ogo26QHeWj/94RxSdi5uyHh5WRBe9kCLS1y/aUElj5YP40=
X-Google-Smtp-Source: AGHT+IFU9X7XfDxQRxgRSxeJbVVfPNo+JeJw2CZ0Ntr6HoE6gZ2UyRdopaXlBmPIhV1DCnL70W7p7Q==
X-Received: by 2002:a5d:598f:0:b0:38c:5cd0:ecd5 with SMTP id ffacd0b85a97d-38f33f4acb2mr6636251f8f.38.1739715335234;
        Sun, 16 Feb 2025 06:15:35 -0800 (PST)
Received: from p200300c5870742d85925c84ae79fb582.dip0.t-ipconnect.de (p200300c5870742d85925c84ae79fb582.dip0.t-ipconnect.de. [2003:c5:8707:42d8:5925:c84a:e79f:b582])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f25914d73sm9880652f8f.54.2025.02.16.06.15.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Feb 2025 06:15:34 -0800 (PST)
Message-ID: <2420c932bd2443b3c924c02a1375ae63bed8ab6e.camel@gmail.com>
Subject: Re: [PATCH v3] ufs: core: add hba parameter to trace events
From: Bean Huo <huobean@gmail.com>
To: peter.wang@mediatek.com, linux-scsi@vger.kernel.org, 
	martin.petersen@oracle.com, avri.altman@wdc.com, alim.akhtar@samsung.com, 
	jejb@linux.ibm.com
Cc: wsd_upstream@mediatek.com, linux-mediatek@lists.infradead.org, 
 chun-hung.wu@mediatek.com, alice.chao@mediatek.com, cc.chou@mediatek.com, 
 chaotian.jing@mediatek.com, jiajie.hao@mediatek.com,
 yi-fan.peng@mediatek.com,  qilin.tan@mediatek.com, lin.gui@mediatek.com,
 tun-yu.yu@mediatek.com,  eddie.huang@mediatek.com, naomi.chu@mediatek.com,
 ed.tsai@mediatek.com,  bvanassche@acm.org
Date: Sun, 16 Feb 2025 15:15:33 +0100
In-Reply-To: <20250214083026.1177880-1-peter.wang@mediatek.com>
References: <20250214083026.1177880-1-peter.wang@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4-0ubuntu2 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250216_061537_655167_59558BAB 
X-CRM114-Status: UNSURE (   8.24  )
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


On Fri, 2025-02-14 at 16:29 +0800, peter.wang@mediatek.com wrote:
> From: Peter Wang <peter.wang@mediatek.com>
>=20
> Included the ufs_hba structure as a parameter in various trace events
> to provide more context and improve debugging capabilities.


From the patch commit message, it is no clear how you can use this
change to get more infor and debug, since the content of the ftrace
output is the same after this change. Because the device name
(dev_name) is still being printed, but now it is derived dynamically
from hba->dev instead of being stored as a string in the trace event.=20

I assume you mean to let bpf get more information from hba:


strust ufs hba *hba =3D ctx->hba;

If my assumption is correct, this purpose and intent should be
prominently highlighted in patch commit message.


Kind regards,
Bean

