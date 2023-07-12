Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4973EB64DA
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 Jul 2023 19:53:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:Subject:References:Cc:To:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UeKpMgsSiLesI/Nzl9CiaweeXIJ962+1s3HPj1gmVxk=; b=104KvZeIFu7yCCBPDyjd0Q15ts
	fdnNa/RARxECcXRPM2VW7wq93hhpk9ngujOjyqH7XQzBrNQnGHpjxLuRlIhbCU+hedeMpMcbTKHyr
	55YGDT9HkoDzTWdcVOpRMtn9nKmY2DOz+pT4C/qM/bhcNZTc2IVKQE/YFB3XtaVViIPK3kWssoykl
	t4UOOoJlbimvtU0KC0DDlJEVilo0qhN0s+OnKytK2C0LF/I93HdZ7mDN+UAO7fxOX3mqbft2lhXNE
	80WH06g9hImtI0Tqmj2OeWMRqkPO1RwArpkEGZKnAmStaNSkdWkNPPFvIZOxsfaF74eM3aciZLq+3
	UTJm0VVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJfth-0013VN-0X;
	Wed, 12 Jul 2023 19:53:13 +0000
Received: from mout.web.de ([217.72.192.78])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJftd-0013TI-2U
	for linux-mediatek@lists.infradead.org;
	Wed, 12 Jul 2023 19:53:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=s29768273; t=1689191577; x=1689796377; i=markus.elfring@web.de;
 bh=DjjNdEnOKAjnaL3gEK2kL1e+r3yh0bdqj2a7Y3wRIMg=;
 h=X-UI-Sender-Class:Date:To:Cc:References:Subject:From:In-Reply-To;
 b=nKmUO7GRaWzVGFAjn9Nae5UBMTIKz0POQqipFUe39OZB8F92gnrIH0RCM7YyXzIzVHNuKdd
 VPQor07MDqAcWCzk9g0IobVTHAt1le45CAabuZ/XQ7S6RjZLDMOPowNJWO/yn3/Tb+VlzJRJw
 iZ2LIUCMaRd4PmFdUztk8IlO/mLQBKkqh4UhzQmDElqPUG5urlp5ziEQU7CiroJkI4rI8/D/V
 /nRE176hN/Aw9n1qr5T0+XrOIs3QUZ5r3iuQgP5nxqZaPUV05eSR5ShB2BzJm3Rwu0PEt65rP
 FBhzjgNGbfIEWsWlopjT8qrzp3tzWb9GgZgWV/16K2mhkNbkS5KA==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.90.83]) by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1N6sBp-1ptogQ2jkt-018DBZ; Wed, 12
 Jul 2023 21:52:57 +0200
Message-ID: <5c50a83e-b2d3-1851-10ec-c87212875da2@web.de>
Date: Wed, 12 Jul 2023 21:52:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
To: Chris Lu <chris.lu@mediatek.com>, Sean Wang <sean.wang@mediatek.com>,
 linux-mediatek@lists.infradead.org, linux-bluetooth@vger.kernel.org,
 kernel-janitors@vger.kernel.org, Johan Hedberg <johan.hedberg@gmail.com>,
 Luiz Von Dentz <luiz.dentz@gmail.com>, Marcel Holtmann <marcel@holtmann.org>
Cc: LKML <linux-kernel@vger.kernel.org>, Aaron Hou <aaron.hou@mediatek.com>,
 Chris Lu <chris.lu@mediatek.com>, Steve Lee <steve.lee@mediatek.com>
References: <20230712130218.376-1-chris.lu@mediatek.com>
Subject: Re: [PATCH v4] Bluetooth: btmtk: Fix null pointer when processing
 coredump
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20230712130218.376-1-chris.lu@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:RHVhpM2ei9E5rTQO69J2nKkKIzFXhQyj6G4Se5hzCN6gnnGMe/m
 JRXv7eyNMlJU1R3RM94U94DipAwYCAMPEsyr8xAAzoJFlGxQEt6V9yNshcqgPvr8F9PJMOh
 BJ6AzpzekUanRN+LH/mP1ZAQXOrkJv+swm2sn4aHQ6Gfp0CpUJAf1bdiRc4RXD+2F2Cx36u
 KDQ2D94REmkYBBcSxKVDg==
UI-OutboundReport: notjunk:1;M01:P0:co3lQ9biLd4=;PjgQrSGYzBTEPwWR1p/P/T4cp3B
 u/K+F4luWuAf6pABB+4g0scLdeDvYtAw3CA0a7/6DgxhOWOxUtgcNwhHn6BmQofd5KFuAURHT
 bbR5lVC1u0CjHD1L9LayDB4VNiRMgG3bJG2dMX9lJDsrR436NM4C97UK2zxtT/EykdUErgo0M
 fkdESqFDhmejGX4GWuVsb7UqkY26lVkNswONFJfuvH4Mn5olmtJ8Op/J3MUkHZDUzPwJTeqyQ
 ki6dq1EB6nAAcj0DFqlmj7Uz1ld0DhCDsbJBJ935sXO9DjgGmyl6+Za5YelThjZ2vGGGbQ6nT
 5ROot+mi12rdnZfmnPWR8OV9pEkANAnxA2/s32fBy3XhKhbFRMskqSqlIluGEMkVAPySVerJS
 7hM5hgbvR0htwJXC4EkYDc9kApQl0NpQa7WQw2GNJWR9zDctW3zDZmDfEpiAeAzLVxOuJJpQR
 VYARMEv0lYtUCbSEbCLDJW2h+XJW60yFPAiySglH+TFlafNnK/e+wjX0aAP6DnD1GTrZvDE5f
 F6OyzO2KbrfjDqqyrRkIZGcTbWDM6pMEAoDCcOJ8zE/G20xt2Kh90vuBUiMMvc3I1p2dGiCh/
 fUMIo2FxMdWdpzl8z4VhTmg4wpHGosxxFbIPnGPlYwc7/wpANYUQ5v1cU13yzgbI4OfI4Vx9E
 vqg5Vas0O0PAuK8PlTZq6w+k8+cUU82kZX2y4wAyqqo5cGSouF3/aj9S+xzfsFi7r4iChg1ew
 AiufVanEx3MW3+NPZyeeRoa9ChOBhh6VMbmTKbUbZTj0+Jjv+GBcdi+rQeQqo5Ps/St09xVSH
 /s6Idd8LL2WaP5ElZa2pUJu7271oivKiwxsSaF121Y/g8EcKNeLrEcVvj9CDWUyanmX93a0QJ
 WRkVTQDLSVKb1hUMCRQJK44jMQFRegBmdExH7cTiQhhSakZ2IyHeT3iiMhK+DArBhe6jWKVtE
 DNsXcg==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230712_125310_095555_48DA1593 
X-CRM114-Status: UNSURE (   6.63  )
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

=E2=80=A6
> v4: reduce variable 'offset' declaration in v3
> ---
>  drivers/bluetooth/btmtk.c | 12 ++++++------
=E2=80=A6

I suggest to replace the marker by a line break.

See also:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Do=
cumentation/process/submitting-patches.rst?h=3Dv6.5-rc1#n711


Would it be helpful to adjust the wording =E2=80=9CFix null pointer=E2=80=
=9D in the subject?


How do you think about to add the tag =E2=80=9CFixes=E2=80=9D?

Regards,
Markus

