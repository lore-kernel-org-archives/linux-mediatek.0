Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADC95C3DA49
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Jul 2024 14:35:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:Subject:References:Cc:To:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=erEqLbR3UVJtu/sTLZpah7HRshWQQmK1WXT0v24AMf4=; b=fcDJcW1QviKH6+quluq7m1MhAE
	liLAvS58yiO/M8C/nmfa9vwyxF0gq+Ewv6rDu0f1f3bAnvhblcM693k/DmxkyA7qcERmEwPMlIHJg
	mG6UZnnbEcBCHKVDZurFE7kRkxjLo9KzxhhhNB1Qgkf3ua0VSulpoB39JKB9IMYxkUSkt27xQuIOS
	zfkUuIBkV4W5sQKlGw1P2px2lrEKxemJsY/PYNU4zNblfA5BlgbbjX27rJnmiTsbwrCGdZnndt6Tt
	FN/RQMbIGaj3I/1dWMbH/d80ZEh5dbX+p8q5tInzlMP7cvD0PyU94JPmRUWU6gUlFf6nGUE0Onx24
	SHNZEa8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYnxD-0000000FTbq-14iS;
	Tue, 30 Jul 2024 14:35:55 +0000
Received: from mout.web.de ([212.227.15.4])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYnwG-0000000FTDx-2AKM;
	Tue, 30 Jul 2024 14:34:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1722350086; x=1722954886; i=markus.elfring@web.de;
	bh=erEqLbR3UVJtu/sTLZpah7HRshWQQmK1WXT0v24AMf4=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=kewX3bjrpOFxrz5++x+RjIH9lwU7yHgteiCr8NNG2iKcHwA9Rv5K2oo5Fq05Jccy
	 u1OLivaeaOh9tT2ZbZQcI79egbLEMagrvEiC/vE/6bA59FtYCkpWaEpkll4auyWyp
	 4FjNxl0MBA4p022WNCtvkTh5oSP1kQYHfxJDMvQlwNt8K2YK7Z3PaqGOJMVhxpABw
	 cjYj9+fGG1yEhQey4FE39jbE3i8zbdDAAknttS3G9RnOfltNl8III1BnWzy1xh5da
	 E0qzCViMmnn4HC8CR81oFCuFh6CeQH+0PilPIxuv0zFk2XWj0G2ybtJrAjyFKMdBn
	 M6+4PWuWtVBFueDYiw==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.90.95]) by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MCXVX-1sQnKQ40kV-00Dp1b; Tue, 30
 Jul 2024 16:34:46 +0200
Message-ID: <0962976e-18c7-478a-a829-8e1cc6cfa60f@web.de>
Date: Tue, 30 Jul 2024 16:34:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Florian Sylvestre <fsylvestre@baylibre.com>,
 Julien Stephan <jstephan@baylibre.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Paul Elder <paul.elder@ideasonboard.com>,
 Phi-bang Nguyen <pnguyen@baylibre.com>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, Andy Hsieh <andy.hsieh@mediatek.com>,
 Angelo Gioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>
References: <20240729-add-mtk-isp-3-0-support-v6-4-c374c9e0c672@baylibre.com>
Subject: Re: [PATCH v6 4/5] media: platform: mediatek: isp_30: add mediatek
 ISP3.0 camsv
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20240729-add-mtk-isp-3-0-support-v6-4-c374c9e0c672@baylibre.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:dpx+dzgS4rW78tkaB9aMkyTJNBcagz1rU5j0sT7u24JC04ElGVN
 zVuwH6ocADUqXpNuiUpRdXTBwSFv0BunGwPCPU+qhOPOdNggiNIkW+1jXBweJH1M+nILp+u
 BOGlM7fY1gLbspxNIl03lpu718r6ieuO2NglvMvVhZCfyWIw5Wut3bBUsYzmFH+uYXyB3hC
 yQNxVRLz2nZo0KArbKkhw==
UI-OutboundReport: notjunk:1;M01:P0:hxC21qntc+E=;/GbKhZlfiRbRlhYCom9CM8c+8jX
 L61vx2JfQJyc4ETmCdHawr735TIgG7j+TCFemXle819vYxBZWAmZeoC6UZ7+VnZ++YoZrjtBc
 u/z//q++eqRjbeHWGMJ4lqPgqUQosEBirpoKD9P441Cvbr1lr3okdH82vAz18hGpo7eg9NRqF
 6D2ddFlf91S3XiBpLicTq9Jg5wG9bQ4Hx8AxdnBr0Y1LXsJkzaeNU4tt4ZILU5vjd7DV+4C0C
 9AY6J+qd8QYbBKN43rokJNKk95+9WyoiS5MK2T2tvyKaUpKpztguEISxvfwf37y69gC2wELs5
 XvJHPvpZbORH6I2c1KvNJO0LKmCP/2BsewCnr2lhFivQ09Mz+GmFR/W9fNfjpj6FDLm1lzE1p
 lyJPzl80vsVt3+ldiy0Glfrba1T/8rrG+18t6dauBEQaNK9Oi6b8KididULkV03Ut4mDirbAU
 i3U2aaQUoN5777C4RqvcmsgLRFtWlEIq5oMpoeru7QuB8oRAmUFfds6ALETihsg25zvs7Zqwb
 UhaUzHK8StxaeCwOq1nYLXY+W36nKpbjpjxoXp0eRgbQv9RZwIcmgfkhNjJsV7/qZyahzAzjV
 15SVxcoEJ9c0hZtDjPbrVnoClCH9nJkPEfDcXb76nqlXWbBA9vtValOe0rWpChBwjZwOs0sSq
 t+sYC1Ni7+Wa2fowBOffupFc8c8gu4vmyJeM5h3mC3QTB8363fcbz53aI0ui4p4xuadEWIeOb
 j8FVFgipPSfqyMtHGFiEZfKdL7rvefZDl3ZOw2GU4nbOwtBnOlGun6ZenExbafJqjWhT4MZtr
 5HK3PiHpXM5CSEh0i2p6/T/g==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240730_073457_057294_DDA185E5 
X-CRM114-Status: UNSURE (   8.74  )
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

> From: Phi-bang Nguyen <pnguyen@baylibre.com>
>
> This driver provides a path to bypass the SoC ISP so that image data
> coming from the SENINF can go directly into memory without any image
> processing. This allows the use of an external ISP.
>
> Signed-off-by: Phi-bang Nguyen <pnguyen@baylibre.com>
=E2=80=A6

How does information from such a change description fit to details
from an other notification?
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Do=
cumentation/process/submitting-patches.rst?h=3Dv6.11-rc1#n396

=E2=80=A6
The following address failed:

    pnguyen@baylibre.com:
        SMTP error from remote server for RCPT TO command, host: aspmx.l.g=
oogle.com (74.125.133.27) reason: 550-5.1.1 The email account that you tri=
ed to reach does not exist.
=E2=80=A6


Regards,
Markus

