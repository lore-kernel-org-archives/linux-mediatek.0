Return-Path: <SRS0=tiIh=64=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39235C433DF
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 May 2020 09:38:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 09A61206A5
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 May 2020 09:38:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Bbgdp1dy";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="toI+rQpJ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 09A61206A5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=JFHtwm/RYY6l/czzAl8AcMBrrFN/jCb9cTbZ+82z1jE=; b=Bbgdp1dyPJqFNvqkBczIBq0dG
	s55QEYAWTmIOX+MBhZLk7DGri7h6jlqZd4I9OWU2A+7VnZlGku3jXIFrq0MGVWQt2i3AsrU6CONLM
	5oN6ZqC5cmEMMT9hS2W8RPtmN2yylu5Fim3f6dA9oNlQWPrptfYaIOUOS248WKCzkbWGrWxR4aRte
	vn9gKZDiVJx+NTPbPyzQ3ok9olkDr9vFJbLR2x/s6IP0u69OIQW9FPhM4S1bb/G3k71yN1r/vleHc
	3swHpIWl/94RlTbFZ6JGhH6WVKC0wNgEL5PRrBpyukZJASj0ozVOwHp7/ueFnbRW5yQK06H1omvrJ
	QlSIkjc0w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jZAKC-0006Ve-0n; Thu, 14 May 2020 09:38:44 +0000
Received: from mail-lf1-x141.google.com ([2a00:1450:4864:20::141])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jZAKA-0006UX-BR; Thu, 14 May 2020 09:38:43 +0000
Received: by mail-lf1-x141.google.com with SMTP id 8so2061964lfp.4;
 Thu, 14 May 2020 02:38:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=p1doL36G2c7yhzTcmyQM52QYqsuvRFETy5dpSj2TRJ0=;
 b=toI+rQpJnNbUCzcB+dgkiFl8ZbxTzcp06t53gOCpWvhpI+lmGb+KFHlEvaufI6/A/l
 zHVf/rngtHD8UvZsZ0BpsW4KmsUyaQClpKSdgm9HLuFPVsSlbEpQZixShCGUwur8dJf0
 uGYG+IepnjneVJ3UySonJ2FYkAHJbkcJAuTXQEoMMbYnGQEOqAYUc65rm5nHUeqg+dcT
 G2g6RuM5CZVJ0+1eU7vrMbBuqoJon/IaAOUbmdJScRcfMuoqiIkMaKHFvDmtwMm/uGRt
 H7dLzRm1URyCs9fW8FiWvwljgZeUL4xHGL8J5aLVvwJVMOVjD64wh2V/TmHW4xEcrSj0
 +PHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:in-reply-to:references
 :date:message-id:mime-version;
 bh=p1doL36G2c7yhzTcmyQM52QYqsuvRFETy5dpSj2TRJ0=;
 b=gj0PRQ+aWh3fUuLkXiA9441oPdyMfXiujG2EMbEfA4lG3Ob8J0j/jeR+ANROdj5Mf4
 RllOReLv8SEQIX06uh5GmlzMEk8EITOLXH8i9txKtCcV1NIaSbR7BL6X6scPIlATps52
 o6Rm5RPgSCuE4FetRLKYConKRBKPFPCKfkg4lRDyoKaGIFhZ2QT5T0DzB1/b+jcCNp/8
 /c2G6qSPiB9vyE3gBGKmYZyDmWllRp1i90vEE7R7MmeiyPcTN27pax0D2ZzrmhqUsUAS
 vXGqLyKDSDpSO2r6ruojqrrDN6r4+8f6Gj+0LVguDU3S95x7kaL+pwWKugb+SUR8uokG
 8+Jw==
X-Gm-Message-State: AOAM533YaYdCyz66e+qKPCttfCW3hSCkOPDEE7u1MmbwvQwr64ghoQnR
 ks4QS6OrHt/F8IV2n31QGx8=
X-Google-Smtp-Source: ABdhPJweyHUB48SIZU9eU3c0UH9UXABozzSP4zy46Gq1mNAcOXb8OYrBNiR8O6eFfLYj5n/NGtVV0A==
X-Received: by 2002:a19:f70f:: with SMTP id z15mr2686757lfe.53.1589449118242; 
 Thu, 14 May 2020 02:38:38 -0700 (PDT)
Received: from saruman (91-155-214-58.elisa-laajakaista.fi. [91.155.214.58])
 by smtp.gmail.com with ESMTPSA id f25sm1071515lja.5.2020.05.14.02.38.36
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 14 May 2020 02:38:37 -0700 (PDT)
From: Felipe Balbi <balbi@kernel.org>
To: Macpaul Lin <macpaul.lin@mediatek.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 =?utf-8?Q?Micha=C5=82_Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>, Sergey
 Organov <sorganov@gmail.com>, Macpaul Lin <macpaul.lin@mediatek.com>,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] usb: gadget: u_serial: fix coverity warning: negative
 index at array
In-Reply-To: <1589443500-3990-1-git-send-email-macpaul.lin@mediatek.com>
References: <1589443500-3990-1-git-send-email-macpaul.lin@mediatek.com>
Date: Thu, 14 May 2020 12:38:33 +0300
Message-ID: <87zhaa5012.fsf@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200514_023842_395819_8BCDAFB9 
X-CRM114-Status: UNSURE (   7.48  )
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
Cc: Stan Lu <stan.lu@mediatek.com>, Macpaul Lin <macpaul.lin@gmail.com>,
 Mediatek WSD Upstream <wsd_upstream@mediatek.com>
Content-Type: multipart/mixed; boundary="===============0208788810905469457=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

--===============0208788810905469457==
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha256; protocol="application/pgp-signature"

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Macpaul Lin <macpaul.lin@mediatek.com> writes:

> This issue has been reported by coverity scanner.
> Replace "int portnum" by "unsigned int", this void negative index at
> array.
>
> Signed-off-by: Stan Lu <stan.lu@mediatek.com>
> Signed-off-by: Macpaul Lin <macpaul.lin@mediatek.com>

please rebase on testing/fixes

error: patch failed: drivers/usb/gadget/function/u_serial.c:587
error: drivers/usb/gadget/function/u_serial.c: patch does not apply
hint: Use 'git am --show-current-patch=3Ddiff' to see the failed patch
Applying: usb: gadget: u_serial: fix coverity warning: negative index at ar=
ray
Patch failed at 0001 usb: gadget: u_serial: fix coverity warning: negative =
index at array
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEElLzh7wn96CXwjh2IzL64meEamQYFAl69EZkACgkQzL64meEa
mQa6Qw//Z0NbbILQ3n/09Coti9vMt51E2QalESJ3ogcfVbWjTSptfs2I6x92JE0Y
fIpmObM90gVjqzGmDGgBj3iwZZTVkddXWDasoW2w18o05g2R65TDGBwO1C1XDlaN
DdGn0GLUNcifF5t/rUEy2Csqv35IwKluHmDdsLTjVlTWFdPKkT1VaW0/caI1CpFf
rk4CloEcMxwGBLdx98CPyY24MzzyyhtxNjahZ+hCCXO5S0GF2dnpaaZ1x/TtZ5VN
UbdQzSgrDMEuMtrrUfIlakrTTR6aELxqm0yAqupDsbBAkPdLfpXooqfwKB4fEmhJ
Ns1+CUiAK+BmpXEKmyWybSSUwe+FSBkuUK9+QskFGB/R0mjjyXQVdbYpgL1OIjY1
eBDWzSQZmNGMJ0iLZXc1az0+XVxeI2KKzN+n1IYCwgQTQNYUCYtEEDpFaFEosogt
hmVmo2/iadctVQ/+PU8hfcmylLg6hUBMrApObdsY3JB8tq7SOJIyW2Hx2+Imktwg
vnTnKrFcXLSTmJ/0HbHkP6XZ1UDt1Go06rPzCBzahTPdXVKcqT/D+L7fm7sHmcCX
C/2pHGtodGiUt9R9m+eeYilDbUTTj95vmGzyu/mPtRG5tAOqsSVDVyLffuBFDZe8
Y05awSTgxKqblxXWlK+UZNsvV4nxOTxCaovWn5XoGtA8GYk64Mo=
=XPNg
-----END PGP SIGNATURE-----
--=-=-=--


--===============0208788810905469457==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============0208788810905469457==--

