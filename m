Return-Path: <SRS0=H0vx=GQ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A82EC433E9
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 Jan 2021 08:47:03 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DE48723357
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 Jan 2021 08:47:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DE48723357
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=dluU68t284klPFoLUc1F9zne2bQgf+M/2tt2Smt3MCc=; b=2lFdgE/tple1JRgt6trKdyd4V
	ISo9ns+wqYFFRLedrGrX3d6qnkjPztQ5fxLSlyQU1t4wQAR9pRr6fxu8WO5r1bBz41P2oDjhPAhDX
	gF0q0OWY7TAooKT3yk9lQj7uBukwZ3mKaURVvfFEoQaAP/HtS21qg2T1lk+T08cmJG1UvQzOHFzw9
	WtaQ3Lzpxyk6KBy5NCAkjuAOpxIYObI2VZxe6kOwPVPFckOuoAoeuxU6Hy23q/mf5ETibpSVVrDLa
	nsCPQCFxpzlI2LFtw2yGc8gbkx40YXrt77TR4G5Ydzj6eVYfpmuapjZYkyzvQr4hOFZdSkW6iPvmt
	FYxenJ39w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kzbni-0005IE-1z; Wed, 13 Jan 2021 08:46:46 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kzbnc-0005FY-2U; Wed, 13 Jan 2021 08:46:40 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4A91A23340;
 Wed, 13 Jan 2021 08:46:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1610527598;
 bh=dvlIFZW/v/8cgdLks+xrLXcyEhYDYffORyHMzvY1ylA=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=t1vFmES09YRatSVr75TolkW5vOOSrAAYyz3Q9L67MQosdM40DMcpy6gsX04xkGPeM
 2hmtnpshNQi9H8bHwnkYsUeyL7FMJKWf8dwjTeXcU3jph09G3wbcAaJxzt/YbVRiRG
 mCiyUQUOSl0pEVYSa4PIpERBbKC5A6gbqEoyIbvj+f+girbcroD5XNL5BfZOFO6N3+
 vYASUwXOgwIxPiNz74zzYrH0uoTA9qI7BCzeca5NasncJ4kARbidVt/Qn3vkMTBqEw
 g7w/EakR7HaxCzMWVaSSGZz31AanRUScd16Ed7j/4/Q3aqzi8QnCOEJCOTdw3hbd3F
 1CIOT9h/5y29A==
From: Felipe Balbi <balbi@kernel.org>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>
Subject: Re: [PATCH RESEND v4 10/11] usb: gadget: bdc: fix checkpatch.pl
 spacing error
In-Reply-To: <1610505748-30616-10-git-send-email-chunfeng.yun@mediatek.com>
References: <1610505748-30616-1-git-send-email-chunfeng.yun@mediatek.com>
 <1610505748-30616-10-git-send-email-chunfeng.yun@mediatek.com>
Date: Wed, 13 Jan 2021 10:46:30 +0200
Message-ID: <87zh1d2pi1.fsf@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210113_034640_236787_6FC80E75 
X-CRM114-Status: UNSURE (   5.94  )
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
Cc: Florian Fainelli <f.fainelli@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Al Cooper <alcooperx@gmail.com>, linux-kernel@vger.kernel.org,
 Chunfeng Yun <chunfeng.yun@mediatek.com>, linux-usb@vger.kernel.org,
 bcm-kernel-feedback-list@broadcom.com,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============3990054816515810911=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

--===============3990054816515810911==
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha256; protocol="application/pgp-signature"

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Chunfeng Yun <chunfeng.yun@mediatek.com> writes:

> fix checkpatch.pl error:
> ERROR:SPACING: space prohibited before that ','
>
> Cc: Florian Fainelli <f.fainelli@gmail.com>
> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> Acked-by: Florian Fainelli <f.fainelli@gmail.com>

Acked-by: Felipe Balbi <balbi@kernel.org>

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQJFBAEBCAAvFiEElLzh7wn96CXwjh2IzL64meEamQYFAl/+s2YRHGJhbGJpQGtl
cm5lbC5vcmcACgkQzL64meEamQZJ0g//ZKkaFJWIXeYBbd6HHFD9Bo+s4ejSf4av
PUs4UZFEkJe+A+WFCQvbhYPMjL5ABLRMI/maXVQmcTJbpkJdQUc1qtkbNG3nLRBb
pjNKsmNZXDp/xXEZgQfQj/99QLz08insMN6XLc+WPSNdYX+9UchOhRlM0hrVQWgf
Je2OSeK7ETkfRFO0QP/BBfBzh/ujITOs1OdOcqLQyu1ULAoR5BSKD4albIalido3
j/rW7ZPNyThLCKYBjTu/sTQFlTkjgjoF7i9TU/MX7ZuHth3TY+/xnjFQFMCDMkDa
lnC3pVJda/6TjDGguGrNJjq60Nqx6muPvwYRXyUInMRuuoR5BCW2rYvwYw/yhxNw
nKVsPb+0e48L1zL7gSgS9nrnlN19pt8Rg6kJfpEFPY+Ax2EAq1N0lIzV09+jhrfU
KAqSWZNnwpg5C12fUMnra+5dqS+xUBu7FWHAXPI4oXoxtfUuA4i982wcYPsgpImn
VxZhhsVJtpqiAf2B1g4WfgIO0xY1mes8jjNVrDLQFdggeSzuIQtTst9SPly2c1GB
6BMUlqcHaNC7eGOrKrexj/aSExl3pSA5lPEVifE6d/91dv6YKvFb2Q8n5kErRhXl
GYQfwqqxqAmxpjtuMxGhhxAxIu8saGVbPps8EY5PYMTpzlP49hKnSlZMsKFQ33y+
TkPF2A7WDdk=
=AcrB
-----END PGP SIGNATURE-----
--=-=-=--


--===============3990054816515810911==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============3990054816515810911==--

