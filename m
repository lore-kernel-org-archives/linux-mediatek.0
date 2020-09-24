Return-Path: <SRS0=tl/R=DB=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA306C4346E
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Sep 2020 08:52:43 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7350323772
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Sep 2020 08:52:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="P0BnH5An";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="SxL9ACiq"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7350323772
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=25mVRBwFiO3aNIED8QowONeNVyE/fz3EvNZyXwwfhMs=; b=P0BnH5AnDTwOSeXXscOgwZmpQ
	HM2CzPBI2MYjvzlfdmk/XdFUkb9ftp0MtDCG8vEfQeKmup5fK8dpYvdRyDVWAs+yHC99BUjpeLzPd
	sW3FujsJklKfZIyXVQnGszFxqkzoRpjFy6o696rMijGpalOPdmxHXeUcqdRISwcH51ZhbDJtVBAdj
	VENDJKkaC9comFRgHk4J9h3d7GiZmfDF49YdJxgrMOjnd1AAKyZv+aISsRT5vc/yErebU318EquDE
	LLS0URXFqfPNTKOhlEy9V9B9Vx16nRAEPnCy2sIT67GPDCAvo7GpBbPxu6aCevpXERZ/41I6eiese
	MT1imqKQA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kLMzR-0007CX-3j; Thu, 24 Sep 2020 08:52:33 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kLMzM-0007B2-RA; Thu, 24 Sep 2020 08:52:29 +0000
Received: from saruman (91-155-214-58.elisa-laajakaista.fi [91.155.214.58])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id CE4DB23772;
 Thu, 24 Sep 2020 08:52:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1600937548;
 bh=mBjA4D2VMWYFlYuqa+60PBE7U14syE/8c8cGg3SgmXs=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=SxL9ACiq5PWoi3i88bsR51Ga/IdTnc94g9DcEYSkr1gEBTfBdLm7LAmc5cNCulYIO
 tZ+0MfVmxVI7KcNnUPyYCb/4r3/gGjSxASP6myLfD+4BNkfWdAFbOkFAx2jpOiP6Vz
 O85mdxkrO/zUo6e3m48OZR3EJTRJWP+2mjaxSSSM=
From: Felipe Balbi <balbi@kernel.org>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>
Subject: Re: [PATCH] usb: gadget: bcm63xx_udc: fix up the error of
 undeclared usb_debug_root
In-Reply-To: <1600936119.21970.4.camel@mhfsdcap03>
References: <1600061930-778-1-git-send-email-chunfeng.yun@mediatek.com>
 <871rirehqq.fsf@kernel.org> <1600936119.21970.4.camel@mhfsdcap03>
Date: Thu, 24 Sep 2020 11:52:18 +0300
Message-ID: <87y2kzd0al.fsf@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200924_045228_939256_537029A1 
X-CRM114-Status: GOOD (  12.97  )
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
 Kevin Cernekee <cernekee@gmail.com>, linux-kernel@vger.kernel.org,
 stable <stable@vger.kernel.org>, linux-usb@vger.kernel.org,
 bcm-kernel-feedback-list@broadcom.com,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============2394091872024541963=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

--===============2394091872024541963==
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha256; protocol="application/pgp-signature"

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable


Hi,

Chunfeng Yun <chunfeng.yun@mediatek.com> writes:
> On Thu, 2020-09-24 at 10:50 +0300, Felipe Balbi wrote:
>> Chunfeng Yun <chunfeng.yun@mediatek.com> writes:
>>=20
>> > Fix up the build error caused by undeclared usb_debug_root
>> >
>> > Cc: stable <stable@vger.kernel.org>
>> > Fixes: a66ada4f241c("usb: gadget: bcm63xx_udc: create debugfs director=
y under usb root")
>> > Reported-by: kernel test robot <lkp@intel.com>
>> > Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
>>=20
>> $ patch -p1 --dry-run p.patch
>> /usr/bin/patch: **** Only garbage was found in the patch input.
>>=20
> Please try to apply v2, https://patchwork.kernel.org/patch/11772911/
> I indeed add a line code

that worked, but the problem I have is that your patches always come
base64 encoded. Make sure they come as plain text in the future :-)

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQJFBAEBCAAvFiEElLzh7wn96CXwjh2IzL64meEamQYFAl9sXkIRHGJhbGJpQGtl
cm5lbC5vcmcACgkQzL64meEamQa0zQ/8Cj7wlmX4BmMvMJ5ZRB4QinYugLxxudcX
pe06n6i8BViYdJASEMxb0TFXAvX4ApxghdeyzPM6lr/xH87fsIH2vvrQs8HIwGH3
DirmtLbSORa6sVjysCGFW9YjtqcvENYoFwcV0QePH05ExS9nB8jsX/qZQ+W1Ga6k
edhk2a464Fbb8UkGyuXJubHZqbiYf2qXNfkXZUcA0ZSRa/k1tW9oDATyXqPL/RMZ
TYFCsAx37J+xYatVfwt55sItpUjvXEHNfPUSBqQYBivFg530tqBK+sAYPHqdOFqa
DsU/qjBwkdGRAXEdl1C3Qf7vWz9R7sXNZ1wQcY6FTx9O87KAlaadkA843QD7uasf
vZSMsivR8clEXLLZCPMWGbrj9f74lRU8XGKKDvih5c+ySKc+4nQRrBadzf4Z2Iem
Zo7CnIZG6X+aAtk5Jm6WBF4uwAXZbrCW/k0cVLHld2n9DGZW/qlZu7FZIFZrkg3i
DNK92DJIwQKBt2T1d5ljdjHD2ISYiopvWfMa0t9/MzZgrDabSzc0zn5Ensl6XMfd
Eqe03LVQ/GnZ8HdHVLte64qo7B+lROsAkCxQq1ZTXILxoV8ARTCVBb/Yu53tVBt6
5MmjHZJt6MvMLCCwzDXfOnKvz+5f0E4Yqq1TCmViQUrZTU24EUm1hK3AR+lAzt3U
HKB56BVkXzk=
=2QfB
-----END PGP SIGNATURE-----
--=-=-=--


--===============2394091872024541963==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============2394091872024541963==--

