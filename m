Return-Path: <SRS0=DUBy=CQ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AABDBC433E2
	for <linux-mediatek@archiver.kernel.org>; Mon,  7 Sep 2020 07:42:57 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 35213207C3
	for <linux-mediatek@archiver.kernel.org>; Mon,  7 Sep 2020 07:42:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="tdU+FgnK";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZdAosuz8"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 35213207C3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=29ixGBngXm/WPBzA0PhUurjPXEWiJoNDBcsmB3/srno=; b=tdU+FgnKieUThKNFcup9bjqNq
	mSkjfKkACr6qCoR/erxq0Fd16+nwhpRRiGCOP3yF20Ja2w9calncLkj9tcHSaYeCZYKTV76fNEiiE
	bPCGK8VS1qTgIXu48DyJDVHyrkFJoqmvHTh5dcJNBfkWrQWQqwdZZMweN+07Wny8Z/cOKUCNT3qG1
	PSrQJ1ZDV+87y5adVtYIq91k+ZHepiRLIpqpmotxsgpwfpkdNyOHUPiNQYn0rnrx7BmdrUdwf2UU+
	pjPKPfvwYdb35LHCt23RqCwV1srRWwt38l3BQFWYKfdWmP7Wva+04eWUEZtnE3KhsGXihuGiDOZw7
	xsk28zE2g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kFBnc-0004Qf-J1; Mon, 07 Sep 2020 07:42:48 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kFBnX-0004Om-UX; Mon, 07 Sep 2020 07:42:45 +0000
Received: from saruman (91-155-214-58.elisa-laajakaista.fi [91.155.214.58])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0ED4F207C3;
 Mon,  7 Sep 2020 07:42:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1599464562;
 bh=TIs5JwlDQRvebAekInbuV/2Ii2UXnxsq8CLe4ACPU+M=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=ZdAosuz8jovwbxcvibwH+AMwYlv8fVIdxYehYYIMNofF7Hdu8yCh/CLKMCMmpbTgw
 4wamX9ZzzgWOMEl58JmSh533zvU4viY96+uz2MYAE2tQi9xDLG6ywD80olFAs0Zg7N
 rFTtOIOwjPflEPKvMzFCPqdDhFOPaMT+g+n/5do8=
From: Felipe Balbi <balbi@kernel.org>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>
Subject: Re: [PATCH 1/7] usb: mtu3: convert to
 devm_platform_ioremap_resource_byname
In-Reply-To: <1595404275-8449-1-git-send-email-chunfeng.yun@mediatek.com>
References: <1595404275-8449-1-git-send-email-chunfeng.yun@mediatek.com>
Date: Mon, 07 Sep 2020 10:42:35 +0300
Message-ID: <87d02y1190.fsf@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200907_034244_507046_2E85DCF4 
X-CRM114-Status: GOOD (  10.72  )
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
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 Chunfeng Yun <chunfeng.yun@mediatek.com>, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============7629087197249944859=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

--===============7629087197249944859==
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha256; protocol="application/pgp-signature"

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable


Hi,

Chunfeng Yun <chunfeng.yun@mediatek.com> writes:
> Use devm_platform_ioremap_resource_byname() to simplify code
>
> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>

why is it so that your patches always come base64 encoded? They look
fine on the email client, but when I try to pipe the message to git am
it always gives me a lot of trouble and I have to manually decode the
body of your messages and recombine with the patch.

Can you try to send your patches as actual plain text without encoding
the body with base64?

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQJFBAEBCAAvFiEElLzh7wn96CXwjh2IzL64meEamQYFAl9V5GsRHGJhbGJpQGtl
cm5lbC5vcmcACgkQzL64meEamQbf5A/9GQSFGsCjJVDMN491TnVJU2UcuvE0m1yH
PuO6qqWoETNQrMIeT0hIx8IED30Szqy7LB/i1VRA/xIaN354CvgWKNyIooryvqXe
G7E9zb/0BmiTGLoCzt0cKl12pLDz+vGQ4/F4iMm5Aqw+FoaMIPbI+VxWt1TRmdFu
akic1csqJULetfSI7aqxuMnUJ9FFijZRTFMkLUnxYS1HNH0Ox8rncv1HmRgd+M+E
Dmpezs3HLQH2bL6vv+k9Cf75JR5agb8fAbxKvsI00uSK6SdNVmNtOaoJCdE3eaj3
oG5YdX+lvRW3xO+oPyPypxke3FgQdqZwaRBxBduVsVptgZ5zEmEmjKHfqKCv1nvw
r8aTppriB+8UNkNjnMLmvbkRRaOFtHlxXGM45vNDGrQGFnMgHcsixmfXiy65/AoK
cNXPN8TTUm0A9CZ6sAe34raZ3H3LPAX1Mg/GuP7Is6Lm7FiiA6X9J0fC46YzK4ZE
EEhfn9VNYzDbgVpcgPDdMIe+Lvrzm5ATkFvpVrhz/WUcCT0stSPpXZIHjkAyrmUD
n47a1pTiVpN3ChKyFMH5IlZSihwpMdkG19LRFnryn2NRaiNQEng3qhpJ9YpekN5Z
cHprLCzqjPM5FzafSiOVLr3mwKhMcQoL7e9M5T1q2OZ26Rharbx2iMHjoDSW8Jbn
NyfsrIki6cs=
=vjAN
-----END PGP SIGNATURE-----
--=-=-=--


--===============7629087197249944859==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============7629087197249944859==--

