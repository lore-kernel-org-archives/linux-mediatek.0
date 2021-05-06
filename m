Return-Path: <SRS0=imyo=KB=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E6C7C433ED
	for <linux-mediatek@archiver.kernel.org>; Thu,  6 May 2021 08:55:39 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0FDBA611AD
	for <linux-mediatek@archiver.kernel.org>; Thu,  6 May 2021 08:55:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0FDBA611AD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=uruToNS84hLVBeNUBoRkGR90rFs6kph3cXE4gfYwEaE=; b=MFyfAftq2FnSA8g7qztTzi5/q
	zAnJW8303TPISKPoC1/cLvDSWRn2wD8WUaVNZJNtQAGOrgDlNdz+V1FGL6lMeYVrjJWpPqmzvNNxk
	dbFKHM3ndr0g3c63MiOV6cUEW3Dx1qpNIu/66y/Cuz/iJBqROTq3Q4jXNQtIYw7xctwTfd4rLBuw9
	QfOKjhD85yyponH38AJUzKnvmRhl9XlLpAV/UqbNW10hKazjPP+lQ+49H1HArSmK1+O+GcAqsOev9
	xnOtwbHWTQg4EaH39Fq2dV4LIUG05n1YuxHYq4+b0cutONIz9YaQU7wqursTmKQM9q7xjKv0rIxeb
	h7DLmCNaQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1leZn1-003jCM-23; Thu, 06 May 2021 08:55:23 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1leZmk-003jAb-Pp; Thu, 06 May 2021 08:55:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:MIME-Version:Message-ID:
 Date:References:In-Reply-To:Subject:Cc:To:From:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=HypYNEUvZPshB25whGPVVHjWmP0jpG/9EsnncaZJijA=; b=NddFnvuD9hPc75dJ0HO1jNoRlI
 5mAyCUMAJkafjHI/jcpt0/cmDASnFYytxtxPQSqhBDkOTv0eCq6ewvg7cLdd52Oiw4jR1PytJCg3M
 e5eL1T/0EZeD8osFsaYdIDlTt0CJ++1hjS3hSEoc5kJDgXkgJdLsCydpWCdpwfhk4D/BQraB2uE3G
 KLnSILvDopjUct+6dNSg1PG6iaIDrManaA7WR4vFme/8Z9IV8p39Xj8a0GVhNml7tJSMIwck0cSfy
 k9tAyi3Re52DPJ0HBb5qWtU3dkzXvEcBZDnVh2r9fcDWPsIb7mn2HpJ8Kv9q55suwRs1h42NZjkiR
 PZr4+PPQ==;
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1leZmi-005sym-DR; Thu, 06 May 2021 08:55:05 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5E85A610FB;
 Thu,  6 May 2021 08:55:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1620291302;
 bh=HypYNEUvZPshB25whGPVVHjWmP0jpG/9EsnncaZJijA=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=Kkc7eHgTImYp2GhthiuRiJToRBzR0KsZ+SDRDhY+N6Qf1ORgR0SVbCKt+RPxTBzM9
 4Nbz7/jmgQuM5HwKLBoBRZtQUd3gU5NQde3Xe3UUR4t2EV2HXFreErfkhlJdym9WpO
 q2MHpWWGj/z3a0LHb2JUsPN1P8a3qAKPVF5JrTIB8Yz4dse0ukto92N1fu/aV7p8EG
 N++0qe0TdoLtmb4qkn1XmXrD9Rt7ZZzgh0seLbamJKUZsR/QMlYdqtwJWQSxxSzB6Z
 ywWeGccOx+ZJzihoZnZ4W6HpIMnWxh3zXH6BqtsP5iXwor/cEJG4Z1GBpZaBw15DD6
 4SaE8Qm9P/pqg==
From: Felipe Balbi <balbi@kernel.org>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, Chunfeng Yun
 <chunfeng.yun@mediatek.com>
Subject: Re: [PATCH] usb: dwc3: remove repeated setting of current_dr_role
In-Reply-To: <20210506072608.32320-1-chunfeng.yun@mediatek.com>
References: <20210506072608.32320-1-chunfeng.yun@mediatek.com>
Date: Thu, 06 May 2021 11:54:53 +0300
Message-ID: <87tunggs2q.fsf@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210506_015504_497433_52CC7075 
X-CRM114-Status: UNSURE (   6.72  )
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
Content-Type: multipart/mixed; boundary="===============0682313666342362914=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

--===============0682313666342362914==
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha256; protocol="application/pgp-signature"

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable


Hi,

Chunfeng Yun <chunfeng.yun@mediatek.com> writes:
> dwc3_set_prtcap() already sets current_dr_role as
> DWC3_GCTL_PRTCAP_OTG, so remove the repeated one.
>
> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>

looks correct to me:

Acked-by: Felipe Balbi <balbi@kernel.org>

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQFFBAEBCAAvFiEE9DumQ60WEZ09LIErzlfNM9wDzUgFAmCTrt0RHGJhbGJpQGtl
cm5lbC5vcmcACgkQzlfNM9wDzUjZcggAq/dFh2Oz0a3/lRmAeiVVGmmB3VKWx8Vu
Rs4FlbcKpggPJ3VUtEC7Geg6efKgoYfkyOU7OPXvLz7Z+yrIWw1olfKlDyLRFdBM
rF55QU3vpARX6eiewyZCZBHVr3Gr+6htciyu3GKJF0ZjLhmSIwZeeY3taCWYAQHr
R+L7yxjoqZ6Hfy6gvqWXO8Wfwf/gqnd4G7AwoS0u/ByJfG0UiuKEgUwyqmv8NzUf
wjCU3K0cAi2neaXifVllZN5U4lg2BrnJ9TFyWDAlzCPBXpV0qUOsj2m7TwrpxURt
OGJ+usZ+adB6bjASXjYNFxKraovltbzA+bYY903A3vsVpRBQKzR23g==
=IFro
-----END PGP SIGNATURE-----
--=-=-=--


--===============0682313666342362914==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============0682313666342362914==--

