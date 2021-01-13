Return-Path: <SRS0=H0vx=GQ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28DC9C433E6
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 Jan 2021 08:47:37 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B84BC2336F
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 Jan 2021 08:47:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B84BC2336F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=hEiOZxyhdZzBIvxP3avGJ5fFHWZGnNSx1tq6SO+UGYc=; b=VvktIWrdDg5YQ44CdzCjCRs4P
	dEdlI/BwhClBjM+xee8qz/lopuiJIcBBHKJ/Or6rar07+u1hOl1CTssLBb8mb7dVzomieWV8PhYOV
	f2gVx4UYUKJhWqvHp6Sw9WA+a2joB4fdL5gpFs2EBA/mbfp6uxFjXdsKrybZGS3h3sZL2gDiy/v2Y
	1P4v1BrWyveHiYGCL7im1llrsr1uuyvy6td/O8jZCsyK+wKpfl25DhU4j7ZE8dkxLYKUxm6Z+XNH+
	Mx7xG0rP/1Z8vpYf+NDQpRPC3fcrgkdeDqA5WkCFnsBpBFtYksbffTxoTgeqXBIq1cCIV5XtEMYhZ
	hUF03nMVA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kzboK-0005ZI-Vf; Wed, 13 Jan 2021 08:47:25 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kzboE-0005W7-Ls; Wed, 13 Jan 2021 08:47:19 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1453A23357;
 Wed, 13 Jan 2021 08:47:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1610527637;
 bh=L7wkA7tGkG9EaD6XHqcI9DqIQoV/UPxxN+MkO6L+n90=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=jzA9AbFyFS16uysgJahZ7Gq1/l/BdDwQP0CfKej6vUMHocb3s150lcDJNcSV5WChG
 4fO7NkNsPCpeFP+zSqWNI+a0Kbr+241EcDNL/DmZCDf7qPkJOiYscLKoh1zVwPX1nR
 RVvKiuWI40o/WcY4ote6O/7M2qV9snHR9GqhmzOzbgeRfDw7dRiKBGI+3/Z5UNuSQX
 HfbNNEdyTHZG5gZu1/0mH2YXyKDg0p6t/oKyzoExOQNDTLJYHYQTwiw9T+pC+2Lgxn
 EI7fo1lGVn5w9tH4C1LgVTow6QvXBEGVWYob02O3d+YIcU/bZT4b7Ymri4BGrPyP1J
 8sPGXibigcHPg==
From: Felipe Balbi <balbi@kernel.org>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>
Subject: Re: [PATCH RESEND v4 11/11] usb: gadget: bdc: fix checkpatch.pl
 repeated word warning
In-Reply-To: <1610505748-30616-11-git-send-email-chunfeng.yun@mediatek.com>
References: <1610505748-30616-1-git-send-email-chunfeng.yun@mediatek.com>
 <1610505748-30616-11-git-send-email-chunfeng.yun@mediatek.com>
Date: Wed, 13 Jan 2021 10:47:09 +0200
Message-ID: <87wnwh2pgy.fsf@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210113_034718_817378_CA843BC3 
X-CRM114-Status: UNSURE (   6.07  )
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
Content-Type: multipart/mixed; boundary="===============5842401195389978712=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

--===============5842401195389978712==
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha256; protocol="application/pgp-signature"

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Chunfeng Yun <chunfeng.yun@mediatek.com> writes:

> fix the warning:
> WARNING:REPEATED_WORD: Possible repeated word: 'and'
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

iQJFBAEBCAAvFiEElLzh7wn96CXwjh2IzL64meEamQYFAl/+s40RHGJhbGJpQGtl
cm5lbC5vcmcACgkQzL64meEamQZYuRAAquol7LGOlU/bSyPZYQ2FDtfJjixnsQZ5
ULYdBj9C/SLkvwNZQsZSkjzV03WJngGZJTeKDurfykxoO/yZfFUeUd1Ihu9CwVkz
kGSOCmB3dkI+0Z3WH1LLdM1CQS1x97AzD7I3uucoIQmyvzXqRbByMXioUmlbgiv1
+tGnC6G4Pac6XnP3CpMzPtgCwGNqzIlNB+b25F8a9pzOJteV5TrWElmD1yKp+I5n
H1fSvdE5nvPUeL9hVxoDkX7Xdsg/9nB0j0NfP8/SQ6251auXJKFlcbnW2lyeBY7u
M17MzAbWGtxA6IfJqPM1oNWxiJ+QtJ8T4AcpU7CZr7vYyuAFyW/tAPsJGu5URWjg
AOhu2gzm/efoUaNt4NFpyCcO6gj2AKo7P1P35ANHnvMf36hZe2AkOp7G6txaMWEP
P1WTqOlLEM4Z2PatJXCbH/4jZMjzoLlehdZ/PfLKQWSUcTGSAqJXFgorb2ZnyXJI
MWRMnc7EPeLHIx8/XEUWDnK4t640rdjlRaH950ujediJp/mO5nmdBS6H8ZOlEuCx
PqODWpyBkONlnmzn1AqsWzbQfgT0Ezp0jgnAp9dsIdJtBe409TsRNkPVK50+uf62
TuxiSY46CYZHXNz0+rFWxgQBrSNEIDMBMfMtFcosxDUvv5msbOdwJChXuRN8JD0F
R/FDECyecnQ=
=Grxs
-----END PGP SIGNATURE-----
--=-=-=--


--===============5842401195389978712==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============5842401195389978712==--

